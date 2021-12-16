Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E602CA4
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 08:12:59 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id oa5-20020a17090b1bc500b001b0f8a5e6b7so6377130pjb.0
        for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 00:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mt6qH9wg2HiNJp3oZFCB8NuLQwRDayptPKArDcWgPjQ=;
        b=XxvU683CzxpeCViTlb+8YUPdNVyjUhP2ATrxWO5RVkK+ReVlW5oDZy2uIXwloIoiki
         L90QqWViEiXk+3ypfAk7fHjjzqMFuWlrzwnDgC/79dwxp9NigIqX+tIyTufl4mN19mrw
         RXz7M4gr447nO3pugOGCYtZGkM6bCpJBtwVW263NICMGrhAhPb7F193yHLRu5Dh48QT8
         eBk44QKiI1FJ6gs7qbYQGZbA/g2iIedxWXJxPOAQPoIl7vWIDVHx5gY3GHn797LzPCU5
         6GGiy9XhWZYmtMYBv98jetUjjIXYumySF0wr2Y8VQdOPSM5V8qMViGLuiEUZ7O8rMNuL
         cF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mt6qH9wg2HiNJp3oZFCB8NuLQwRDayptPKArDcWgPjQ=;
        b=o/Tggf0s/aRsq6U+NCdKvUfhRRjPSNq5lyP2CnJoMN5R8KbiwLY4us3R8rXx73awSn
         kas098vwOu2BpBCOMHBHSukxtDJla9IvGwSrBTjTtalMRsnM9WY/dq5dIhR8KWqzoZpB
         cp6FOTz7wdeYITcLg/uuOXa87ZZURosx74Cb1L4P6NUGHvjGmUT43tLtruP18XlsuTWS
         mFzo3TRU1Jlxp20KDoJdgOPOcev4QyhGqVKkYIhEZRla97d+pn6/MaTgiZ9m4cpRc4iV
         AoHUqdCIeHpm88ommXW6BTB+6xZns5NwZ9UCZyf+gk7fxSj5B6ahtXs8XIs1Wcrkcrmd
         V/pA==
X-Gm-Message-State: AOAM530HJyHnnarB+lhuMiLcdoHO0Re1VKQVxYuVbVA4OawofPxDNort
	4VvEDoeEzfYEWmVbsE3hps+R
X-Google-Smtp-Source: ABdhPJxBbjQVhIe6Oqwp4R18GBDQ/XJwTfPGwhPzRT792+Gr8WDNRLDD4vO/3L0WMGMErUs+IrQ5pw==
X-Received: by 2002:a17:90a:7e10:: with SMTP id i16mr4623303pjl.185.1639642379034;
        Thu, 16 Dec 2021 00:12:59 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:12:58 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	thomas.perrot@bootlin.com,
	aleksander@aleksander.es,
	slark_xiao@163.com,
	christophe.jaillet@wanadoo.fr,
	keescook@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/10] bus: mhi: pci_generic: Graceful shutdown on freeze
Date: Thu, 16 Dec 2021 13:42:19 +0530
Message-Id: <20211216081227.237749-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
References: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Loic Poulain <loic.poulain@linaro.org>

There is no reason for shutting down MHI ungracefully on freeze,
this causes the MHI host stack & device stack to not be aligned
anymore since the proper MHI reset sequence is not performed for
ungraceful shutdown.

Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Suggested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/1635268180-13699-1-git-send-email-loic.poulain@linaro.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 94d8aa9c2eae..4f72bbcc53c9 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -1021,7 +1021,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
 	 * context.
 	 */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
-		mhi_power_down(mhi_cntrl, false);
+		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
 	}
 
-- 
2.25.1

