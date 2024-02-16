Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668CC133987
	for <mhi@lists.linux.dev>; Fri, 16 Feb 2024 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104921; cv=none; b=L0cOk5PXVxvK88JSY+IhDiLx6x6C/CcAM1/FZirlHW64Xw5mf0i45I2Rpj/zyQ8PuuU6sfvbH4KDOWPFN3BpmNK01MoxR0cl3OV9LDijLhHPr3zZigjuZvmoeX6PE2fi0bB4rTZSkTgSBRzx2Sxl3Ku7pxFzaAWJ+UHe4jwp+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104921; c=relaxed/simple;
	bh=pzWcmugC4yuzGeeLyph9W3eFmKO8edZqY8GSJP6QBwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufVbNE1jqYWLZwQU00Oadie0oNcpK/JwM+t/c2QkBLL75+NtmSERz7FQjHZ4SXH/pEQIGaO7JSiMZ9cfZadw9M7uVQ4bpT0Bm9p5MCUwzRw2O84E43HDEjq2kZ08ZTY87e8JEBV9u5PUmbgpatsU0OAkPjXnw1fUyc49cwMz0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YinXZSYX; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YinXZSYX"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso1862728a12.2
        for <mhi@lists.linux.dev>; Fri, 16 Feb 2024 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708104918; x=1708709718; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kFPVoSK/l1EKd3QuuZ6hI9QCf7bK4UCQY42PAKZeRc=;
        b=YinXZSYXuZWGX0clZ/VHM5kv1J2OceC89i+YoXkMltuldA+qb7UtRVmx2BcfFzf1iU
         iQslxV0jBiVgzxPzsm1qs8HGVkVdW9ChL+oXb/VLRJvO1x1ULDWjkGp2M0S6eTDzDdKE
         +SAnyOoi+r5E2y6zu6tHrLXWjboQOzZoqwdXbba5Ry49GYYi49FRajUV7kHyr+H0UMEt
         TpGXb5LyaVp0Ca7WP+PALBfliL8CpBgpl3PFM8pb8CXTYbwt0ktvADDkheThfT9Ln130
         412aEVIJxyONg/EEpontCIAM+ar8frwflKMSBC+DXc+a33k5D6tsun4msBAFy8i78qeb
         UPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708104918; x=1708709718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kFPVoSK/l1EKd3QuuZ6hI9QCf7bK4UCQY42PAKZeRc=;
        b=IJvvk78+BqafZk23Yhp4GsJ+e94UWMGqew4wCgDNzFuzViP3ngmSVd2dX4avv9Xc7A
         UMkviW9tcJDUWiA+qj12TB6Ux/6ZLecpAFuM0v+omSbCfHc2hvBCq3dOjUcYrpMulAwr
         qL62oxGaB+IBkVmQQUrKLh5a81E9HZSO4YL2yHOe19JvfqucsbT10yUuOYNoBTxCiGw6
         MmpRRT7Lx5SabpWrQTHFTNhkuFYh+lNznRChQ9WrrxDO8E8MIPMWm5GTlkeVQyE8Z6No
         sX0Fd+HNDWCW79w0szHLWBjVavNuheImionGjMCq94WGmriJpkJe6kAoyfjAoYP0tzx1
         NV0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPztmvinM7K8ww341kfld+PoMQXujr/fim3VYEa2QJP5W5o19x/JDU17n0GQram9i5ZZkt9ng4bMa3t6APcvJ4v/jj
X-Gm-Message-State: AOJu0YwZ5GU8fvQzQyt1sl4zS7PPWVmpPZ/QSGcwCeNvo8G8MdHgAzGs
	hfwwJQc8mbrhBfsfv8Dv0M+TLjypa6n/HdamVGSyj8vH7umFH2TKem2p0b4b/w==
X-Google-Smtp-Source: AGHT+IH5bIYNQc+TIbkPGggAnNq+cs9hY7dD1CPU7GXboYxLufG6VWao74V1rgbLXTNyATcIqGhwIg==
X-Received: by 2002:a17:902:c947:b0:1db:4b08:fbe8 with SMTP id i7-20020a170902c94700b001db4b08fbe8mr6559964pla.44.1708104918589;
        Fri, 16 Feb 2024 09:35:18 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b001db5241100fsm118592plz.183.2024.02.16.09.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:35:18 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Fri, 16 Feb 2024 23:04:43 +0530
Subject: [PATCH v2 4/5] PCI: qcom-ep: Add HDMA support for SA8775P SoC
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-dw-hdma-v2-4-b42329003f43@linaro.org>
References: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
In-Reply-To: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=nXwtjZgaLVb1yQW3aqg87REEZqq+9dwelHeQLVIhVBw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlz5y9nALO/R45p88goO+jxnDd/1jR9FIj1mQZv
 56FeDJI+YSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZc+cvQAKCRBVnxHm/pHO
 9Y9PB/4sM5xn3fpFHVSMmeBrJPxp6PToCC+fAVwgs7YTxlPeCCDB2V+Cas8Ftechwl69m6ZcDH5
 eBOpdSzVLLWdSebMsuzIZaHwt01C2Qt6LQHGl9xmJZ0N+eGX2Ie44RfJCixHbT0h+7kR7BtHw1N
 K+/mTkp4Quv976/RPfPC5XY9cRiwFEul7X5VGumL0IUtWdSe5vjMg2obgSxA3EMP4C5WHFvtytC
 KNbCh+z9zWaj3liVek9GvASZG8KkUjllO2vLUGJbRwmNwiN+cUIHBZ5ZoheAO5D7/5fbksCbDYo
 69P0ckD8LtImRu3yr182nKfki+n2fC4HrdQLsaC35nN9PUWY
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports the new Hyper DMA (HDMA) DMA Engine inside the DWC IP.
Let's add support for it by passing the mapping format and the number of
read/write channels count.

The PCIe EP controller used on this SoC is of version 1.34.0, so a separate
config struct is introduced for the sake of enabling HDMA conditionally.

It should be noted that for the eDMA support (predecessor of HDMA), there
are no mapping format and channels count specified. That is because eDMA
supports auto detection of both parameters, whereas HDMA doesn't.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: Reworded commit message, added kdoc, and minor cleanups]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 45008e054e31..89d06a3e6e06 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -149,6 +149,14 @@ enum qcom_pcie_ep_link_status {
 	QCOM_PCIE_EP_LINK_DOWN,
 };
 
+/**
+ * struct qcom_pcie_ep_cfg - Per SoC config struct
+ * @hdma_support: HDMA support on this SoC
+ */
+struct qcom_pcie_ep_cfg {
+	bool hdma_support;
+};
+
 /**
  * struct qcom_pcie_ep - Qualcomm PCIe Endpoint Controller
  * @pci: Designware PCIe controller struct
@@ -803,6 +811,7 @@ static const struct dw_pcie_ep_ops pci_ep_ops = {
 
 static int qcom_pcie_ep_probe(struct platform_device *pdev)
 {
+	const struct qcom_pcie_ep_cfg *cfg;
 	struct device *dev = &pdev->dev;
 	struct qcom_pcie_ep *pcie_ep;
 	char *name;
@@ -816,6 +825,14 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	pcie_ep->pci.ops = &pci_ops;
 	pcie_ep->pci.ep.ops = &pci_ep_ops;
 	pcie_ep->pci.edma.nr_irqs = 1;
+
+	cfg = of_device_get_match_data(dev);
+	if (cfg && cfg->hdma_support) {
+		pcie_ep->pci.edma.ll_wr_cnt = 8;
+		pcie_ep->pci.edma.ll_rd_cnt = 8;
+		pcie_ep->pci.edma.mf = EDMA_MF_HDMA_NATIVE;
+	}
+
 	platform_set_drvdata(pdev, pcie_ep);
 
 	ret = qcom_pcie_ep_get_resources(pdev, pcie_ep);
@@ -874,8 +891,12 @@ static void qcom_pcie_ep_remove(struct platform_device *pdev)
 	qcom_pcie_disable_resources(pcie_ep);
 }
 
+static const struct qcom_pcie_ep_cfg cfg_1_34_0 = {
+	.hdma_support = true,
+};
+
 static const struct of_device_id qcom_pcie_ep_match[] = {
-	{ .compatible = "qcom,sa8775p-pcie-ep", },
+	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },
 	{ .compatible = "qcom,sm8450-pcie-ep", },
 	{ }

-- 
2.25.1

