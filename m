Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A210ED
	for <mhi@lists.linux.dev>; Mon, 11 Apr 2022 05:48:39 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id n8so12951168plh.1
        for <mhi@lists.linux.dev>; Sun, 10 Apr 2022 22:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asidVsxyIkB3smI5tvjWUtq2ho7mLzVkVUHx4rAV13g=;
        b=TX4X6X/uYWWocZgV5W3leK3OmupcigwdvvTggqX3gQipGKG22EMA233dKAMFrMbnMc
         wfE9zwMrIjs+i/7p9Rp5QuyRmmA97ZtigFNiseX9J0GUgeSn25sUcwUk0NgfX1fLypII
         Hzwv+xCn2sUUy3UR6ZjQGobzrGkgSG4Kzf2WtieJvCQWYEjgzihoxCbUVlh3cIbxMI/V
         dpVX6hY0/46eAobG0qP2xS1r3Lpna948/bdZecvhR4pDZjiDQTxP2AjDLk+6SGlLiVOL
         daWyKJrsM1uEls9AWwZVH48rsx3GmNZqAJ/OZeBOUTVmps+5Ec9qN2aEx94McA/UmtpD
         wplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asidVsxyIkB3smI5tvjWUtq2ho7mLzVkVUHx4rAV13g=;
        b=JSf8cbBzo5fwnQSDEb/hXMxcp0V9Xgmun6Ouq3hFtYRAKWjMdsyom6kGUyR481nRzB
         o9tqYXbvFTyzviQgKn79XrxnEycfNnAl1kBH726aHKLNAQB8S9M36wL/DtKMqwvcWoif
         ChYZ18l301mj5NyFHlf3mqCuGi0Y/5fx9SPmep1+NSCaPfHWNa2eJjoRl+VzciJj7XMS
         Nh0ZeBBEWVPZh2ASyljiMzVCvhHXJMzC+Byd6jQMtavtLBRW41QyLUMfn0TPHqL9yAKf
         9XJLnA1WS0RCEy8oxOqJXbPfWe1P9Gq5YSroR/P34eiMWsmnDvCeQqS5enghvpqTcSw2
         QNYg==
X-Gm-Message-State: AOAM533tDHW1MD1O3TN8nXxRNA61alYN6dnNf07kbhBwPOFaE2FtKc0q
	w8cYuiTo6OrPZIVIriA7TdaIbx8Kxozq
X-Google-Smtp-Source: ABdhPJwbmgBsIdc8j5+HgdEMIiEjceFzXitMX8DNRPYWXDDLDm0k+Q8F8j3z5VDeACyosEuB+rj2sg==
X-Received: by 2002:a17:90a:39c3:b0:1ca:88b9:eb4a with SMTP id k3-20020a17090a39c300b001ca88b9eb4amr35334445pjf.96.1649656118376;
        Sun, 10 Apr 2022 22:48:38 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id o4-20020a625a04000000b004fdf5419e41sm25961728pfb.36.2022.04.10.22.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 22:48:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: host: pci_generic: Sort mhi_pci_id_table based on the PID
Date: Mon, 11 Apr 2022 11:18:31 +0530
Message-Id: <20220411054831.16344-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorting this way helps in identifying the products of vendors. There is no
sorting required for VID and the new VID should be added as the last entry.

Let's also add a note clarifying this.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9527b7d63840..55e96aa15566 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -446,20 +446,21 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.sideband_wake = false,
 };
 
+/* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
-		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
-		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
-- 
2.25.1

