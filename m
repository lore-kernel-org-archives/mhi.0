Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15B760250
	for <mhi@lists.linux.dev>; Wed,  6 Mar 2024 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709720567; cv=none; b=FTFMnTMYIu3BxAtxxZoAY+EFDsIu9/vZFgszAADJgnLho69g04wsuwi4wNk7gAKS03BrIPLANcekyqAlGCQgsTMq5g4s9ekZMICr8PxL3AZNkqAAwUfYDlJi/jY0vxQfupYpQJQz6ys2JtGp408wrL+0XOtK7iJ6qmVPYuRhO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709720567; c=relaxed/simple;
	bh=U8+MilrlyQLMqCKs6OSXrDnQL6lG3tUvuqNkFusZTRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ortGdqR7qiP3jrT6cq9k0sEaLaw5A6d+eK1PYRSJz18Sbl1UMYgU2qThMqE7gTMMhoyYVSSJP7NuYwKIgQOCUgEMBVjur5bpxx11aDjU1Weav4TsN5oRVybsF9N/1m0K4BKApmUKX1MEszuZAPTzeWgKotHz7qRLg1Fu5Op7B9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5uXNuK7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5uXNuK7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29abd02d0d9so4381555a91.0
        for <mhi@lists.linux.dev>; Wed, 06 Mar 2024 02:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709720564; x=1710325364; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHEwlZG3mvwmMDQMT2HCEzxvwXSOeNme8F0oQ3C5z7U=;
        b=R5uXNuK79RiAoHYlZvYoeeXNNDvVSBE+/KKThnY6DqGOewthiUW20mYBM9u4RiEhPg
         Bo0bZQs3J21hf2u7/hwsbNS4Ghw68GQVDudL4nL4Z/yvzxU5eF1avIiBCmlnLGra1B3L
         P2JTCvcIzYsQ6DhgHIPAfk8mMyImhHKj4CbWJufnmgjAAsyvKeKvtb83AKj9s9utCF6J
         D9gtmHPMLL2TOLkUG0YIMxwWb0s4qe9HpbncYEUzA9OQz/GWROZFwD/YDe+s+fvQVb3f
         CY6lhFVBi72j6nBkkFJYaj9JAGZtz8GPwZS/N38qSeRTKOS1S7ll2uy8TamRB6ez240c
         YasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709720564; x=1710325364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHEwlZG3mvwmMDQMT2HCEzxvwXSOeNme8F0oQ3C5z7U=;
        b=hKhFM1L40Vm+EkuUh6aJMce9hvTq+Sg/rAxxUvthuTddWbY364cQJd+HXOY7fwdKTy
         ckecysIr6/nh/TgAlbdFIN81aPI26ppqVpp6yJG924oP/JT2mq/UyrXT211X8k7nJeAB
         vFjXD5Sc9FZEE57jG51nD/tRyS088mYlIHhALL/WTPKOAmjxLKvQZLP4KZAVGBVUEtlK
         Gc+endskIKa+RHMURmMFwCMx0c9CmbCus8y+FEOlaNfuRA3H2TJ+fhiIZghMZLLo32BJ
         fdzYq+BRbuUoALKU5RWnnfjd3EZe4vk/7qBXIuvwg+ume+G5zG6JNvQy8B89JOJh5M0Y
         Ilsw==
X-Forwarded-Encrypted: i=1; AJvYcCU5HP43VMVgHBat5en4l+7GVs2XSZrBbSzo6SBt/3jeTaaSYTyy41kj3QHPgxaY6eKxTTMefh1/3+CcNx8hwwRTRHD6
X-Gm-Message-State: AOJu0YwunX3XQw9h+KpHL0IRI8+vlugz6IzRmCgi9i6nrNtozOiYpwZI
	fZ5tKaZM0Z8gapBRe09uiOukMSI9m5FyHWOudlLhynathAxpX/tbIr9IvX/79Q==
X-Google-Smtp-Source: AGHT+IF8rDfZJIt86MXmm3NNVX3iMYcEEBEQhVqxtxh7WlEtk0uSWa+lKYrHKR61rYf8lI2654xteQ==
X-Received: by 2002:a17:90a:d392:b0:29a:a37f:22c6 with SMTP id q18-20020a17090ad39200b0029aa37f22c6mr11069558pju.28.1709720564128;
        Wed, 06 Mar 2024 02:22:44 -0800 (PST)
Received: from [127.0.1.1] ([117.248.1.194])
        by smtp.gmail.com with ESMTPSA id li17-20020a17090b48d100b0029ab96b13ebsm13339320pjb.40.2024.03.06.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 02:22:43 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 06 Mar 2024 15:52:01 +0530
Subject: [PATCH v4 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-dw-hdma-v4-5-9fed506e95be@linaro.org>
References: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
In-Reply-To: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
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
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=HBFaoOrEPY28OgpXbosd8HC8b9IU9rla4yFX01mozG0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl6EPR3LjKVzSqhLSTX52Xj52sP8auulr1YRKUA
 e7kAGWdmt+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZehD0QAKCRBVnxHm/pHO
 9ZXBB/4x+EAhH/4vRq8jl6l9OTtS8TpJ1OWU+CL5k04aHCII7oiapzr6jT0TU56ExlM0Fp+KVwx
 MvcGTaBu1oPvRhvxxi8Ya0sxBNxjDrGkJujhLtueKz1fJRKpfweL17BtDkn2t8qksxOBrRA9TUA
 UwBHwB6/HKXAKsCjctTYcuxmeAgj21s/GzhVoxR+HCrOSgR2C91gaGtINfsqZ6lz8Uf8ZBKZ3Sk
 lAMxv9bKabKiDJX8XvNAv30QxGagZ88OT1LtImQiQn2+0+PE1LDFdtvmUN6Pw901+KTTqA6vYOS
 iJ+AOF/p/jv6dYsAsJKaL5QiupeN0cZHqOwtJWFR0hDmtXQh
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports Hyper DMA (HDMA) DMA Engine present in the DWC IP. So,
let's enable it in the EPF driver so that the DMA Engine APIs can be used
for data transfer.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: reworded commit message]
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 2c54d80107cf..570c1d1fb12e 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -137,6 +137,7 @@ static const struct pci_epf_mhi_ep_info sa8775p_info = {
 	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
 	.msi_count = 32,
 	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
 };
 
 struct pci_epf_mhi {

-- 
2.25.1

