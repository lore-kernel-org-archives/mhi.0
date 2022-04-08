Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874320E4
	for <mhi@lists.linux.dev>; Fri,  8 Apr 2022 15:00:50 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id a16-20020a17090a6d9000b001c7d6c1bb13so9919534pjk.4
        for <mhi@lists.linux.dev>; Fri, 08 Apr 2022 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRWUAlNBur3Yy5C0NRAoK2xdzrJ+Jexf+aRU2zrKWJc=;
        b=bf3suufmkspeWIJ1fa0tczHNYnLVzf8qgkWOY7NpPyLB3Rb08foLy5byCD4zs0v+qi
         1oLoJtCuS2OlMoGaeO34Gbl2+HLaUlHo2ymX+6d7SH6eKLpe/RKiqbMtF0MoP5gcYNBy
         K2oZ6T7d6by0XhvAq4hIy3cMTZjsmag6UR9s7y5LBhSemBQ5RPwTvbfNGAzPMXKXs6vt
         zGkaPMMzwxCx+P2WdIJVwu4DzrnG2uwU2Zhdz/Kniuvxxa9YCvBwkow4rZlQX0QFHQ3z
         zBOmOnLPJKGGp96kNae9MY9rE+4FJON/OOXGVaCVau4GbqMKBF/5i+7QJs+0sv41qlAz
         6W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRWUAlNBur3Yy5C0NRAoK2xdzrJ+Jexf+aRU2zrKWJc=;
        b=pQTSo8LzYlxzQKONY5lLRFmdUbjqExErYiWzQ4LzhIbkEjfFxxk1buLRoiZunvjexK
         H5Q+pt5kFaT48bvnaNN+P69US9YyN7tpVXxp1w2w86j5H94NW2Mnuqj2va69C7DlesC+
         dnTbKXOMcowqjObqMVo1ZOOxUtvxVVhFl3rrvaBUueI6umFGbX+++w+15ZXq7y+AMCr2
         3ERl6kMrQD2E45MVJMczwrbszWQv/KjIjdPGKjXkR9qsSA3hb3Y1eNhBHcyFP2kg1eTh
         SCaETYwCZFwkwjwLazAgf/RwsrvOLieYdIZ3t/aGLIsX00g0V2E7Zppm48I1mmXsIsZH
         owdQ==
X-Gm-Message-State: AOAM532+qi1SCjZ4ws2EhYLJEon/zmGEC1NNMie4o+m7XwhaEID6jfaL
	WVR0vMS5d/awV9SEsNbAhOmzwQGwtMhs
X-Google-Smtp-Source: ABdhPJy72wqAoAwBFvzJmgBCIEukHMQLwiiNKaYUPf4htSfYlBfB92ze7uyzufyeXBx3xOxeYOLhMw==
X-Received: by 2002:a17:90b:1c03:b0:1c7:5523:6a27 with SMTP id oc3-20020a17090b1c0300b001c755236a27mr22325188pjb.29.1649430048703;
        Fri, 08 Apr 2022 08:00:48 -0700 (PDT)
Received: from localhost.localdomain ([59.92.100.79])
        by smtp.gmail.com with ESMTPSA id s35-20020a056a001c6300b004fb20b5d6c1sm26214636pfw.40.2022.04.08.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 08:00:48 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] bus: mhi: host: pci_generic: Flush recovery worker during freeze
Date: Fri,  8 Apr 2022 20:30:39 +0530
Message-Id: <20220408150039.17297-1-manivannan.sadhasivam@linaro.org>
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

So let's flush the recovery worker before trying to powerdown the device.

Cc: stable@vger.kernel.org
Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Reported-by: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Switched to flush_work() as the workqueue used is global one.

 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ef85dbfb3216..541ced27d941 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1060,6 +1060,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
 	 * the intermediate restore kernel reinitializes MHI device with new
 	 * context.
 	 */
+	flush_work(&mhi_pdev->recovery_work);
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);
-- 
2.25.1

