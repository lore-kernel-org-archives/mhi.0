Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391E20E6
	for <mhi@lists.linux.dev>; Thu,  7 Apr 2022 14:31:00 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c23so5115040plo.0
        for <mhi@lists.linux.dev>; Thu, 07 Apr 2022 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37j9SE62t2u2+DYxve8+3rqrKL3ZJ+WZ0z8KDQ9KkI0=;
        b=UmbnAYWl4njZf+uMFUJhYSuLGBqPL3XcEjh6DjUZVbMH/G6fg6BGA2CwMkxcjhhQec
         wKnnO5xNTfUA1FpWNz5cRwLUF2lVJQN/DFrv6iGKRI0HlkjxPPYfmdlXagoLhMUN+B18
         XY2Nh2WERIspmG9DuqLXZS8H3wJv9PkvDLrg1W/C+H46iJvNrxxSCiVgSbioIcqAXkfe
         Nh0NFeAUZ3C3iMMjwM90NWLYm2CqmxfIZ/QB5SR9uvQVkTzvv/CkrC4iKJavGS0gk4at
         pBClZkxgyu/deoaNIG0pGA/9QIW53JJ8KTNevx9jK8AhW9Y8P2TLX111qy4PSEK/gyRo
         xcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37j9SE62t2u2+DYxve8+3rqrKL3ZJ+WZ0z8KDQ9KkI0=;
        b=7DogBhf2fNFHOkxBVZqj+VA5jkY784fijlbzGkoJYJnX7Iaw08pQaswQP2khw7uoBR
         OrfbJkEoiPxKmW/Wq0iF8ICAaAam2zGOts81cV9phX2Pr7sKFk/NJFsvOopO3pdw4p0f
         nyPXcR/pYzTDydEuFF8DTp1ISfwMxQrI+NDev0Aml0AjDnegSSFkx9LoCiP2eltPOpZb
         z2alRH4ufrvYa2WLwNTteYCJR1q/5Rbpf7sghTGPnxj0OU3sGfylecbfWxj251pNGuv7
         AQuPfAZwcA7yGYvzaUcEOX6bN0qls9wCeJ4MQ64uyawf+Dcbmp+1FnJluRbFk4JeMI/T
         RNCw==
X-Gm-Message-State: AOAM530Sm6k3xfYGEbZxKljylHMH+wxwDBqOyUnAIigkV0jVZRsY0Imq
	0eMWEf8h03qJyBSUymwZQ+FtmurXPQeP
X-Google-Smtp-Source: ABdhPJyXWXKUaW+7OCKy41Er8nzqdtypv+JyTxK5cr3lFjZ/SzPUxVGU+aHDVnBS6iZ9s1FMFUtDhg==
X-Received: by 2002:a17:902:c94c:b0:154:45c6:fbea with SMTP id i12-20020a170902c94c00b0015445c6fbeamr14309339pla.117.1649341860219;
        Thu, 07 Apr 2022 07:31:00 -0700 (PDT)
Received: from localhost.localdomain ([59.92.99.101])
        by smtp.gmail.com with ESMTPSA id x36-20020a634a24000000b0039cc6fff510sm2377181pga.58.2022.04.07.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:30:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: Flush recovery wq during freeze
Date: Thu,  7 Apr 2022 20:00:49 +0530
Message-Id: <20220407143049.126104-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible that the recovery work might be running while the freeze
gets executed (during hibernation etc.,). Currently, we don't powerdown
the stack if it is not up but if the recovery work completes after freeze,
then the device will be up afterwards. This will not be a sane situation.

So let's flush the recovery workqueue before trying to powerdown the
device.

Cc: stable@vger.kernel.org
Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Reported-by: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ef85dbfb3216..c65f749c05bf 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1060,6 +1060,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
 	 * the intermediate restore kernel reinitializes MHI device with new
 	 * context.
 	 */
+	flush_workqueue(system_long_wq);
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
-- 
2.25.1

