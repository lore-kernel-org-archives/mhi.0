Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED423286AC
	for <mhi@lists.linux.dev>; Mon, 18 Mar 2024 06:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710741912; cv=none; b=ngJFbMQmrqcrS5CSzxQQdylb3T4NWqq4kuuOsiT6sz1DgNgLs4HFM/v7g+Idy05GI9NabGdRq+cVhhu8lPCQjPk16g5pL2oW9Xd+9+/93s8n1nywsGgIXzo0i+gfMmTV3q6KsHLSjNnH1OcObHYzT8xOoZN/bGHKuCz8bNe2DZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710741912; c=relaxed/simple;
	bh=U8+MilrlyQLMqCKs6OSXrDnQL6lG3tUvuqNkFusZTRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9YAs+wujU9cPUZKd4WRFDuro+sRD5aTDgK0UOJvyi1DO8c+IDkBcOHpLB2gQtRofZUtqgFu6MMWlzDzL7rI1nuhibiLdjZEwjmCu51TCXUah+KAdhPnTJmcJnOmsT0JCLggBjCSpTdQwfCrQAf2gbBDGpJVzAvNk4V6tYpwhY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f0eEzdyR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0eEzdyR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6c0098328so3297916b3a.3
        for <mhi@lists.linux.dev>; Sun, 17 Mar 2024 23:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710741910; x=1711346710; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHEwlZG3mvwmMDQMT2HCEzxvwXSOeNme8F0oQ3C5z7U=;
        b=f0eEzdyRDbrb76NwmImPqKQBekM3VDeDfhWBQEnKJ38TQn9Z3UNKTQGZTTfmiylLd2
         seqta4t1Qzs9vFhyivjRuTLsuvxD6KvbaCRKYY/ejlLz49E3au9Ue/ChDtgesm9ru5Kq
         hscRDOGranO5PdgMsQKPobxS0ajLrFsbluTcVdCa9BzY+Lm5OgKCJn0iB2wPG7PmWshP
         NqfA6RQH4AcHKmPm6XmVNQFHQ1bpWHrq+IRNi9H3j7+v5/TzWNFrDedm6btV439/at7W
         +XlccR72vOJi13g0by553xA4W8CBeIGT/ytmcRhheIT/AoQjwNS7SmasgqeUts/Ix9yV
         Lw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710741910; x=1711346710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHEwlZG3mvwmMDQMT2HCEzxvwXSOeNme8F0oQ3C5z7U=;
        b=CquFOedAyH6H+8cujb4gzYhjR65cIP03cdgf+4VQUUf5OjmUHMFE2LYxTQmvzxsToJ
         /nVIGmxUq8L13OHYYL3A6TyMy58E91ILmhfQLTF7iLWR7V+6JOeHqDQPj19QssVAQ7hn
         lpDugYM15JjjmO+Ye23CtHfUqb2tDNv8M0ov4nXy8y6RXqWdu3BeuC5EcO593W9Cjp4Y
         +MViqRDNnMHCM4qR8tzMidpDaYyTsQDuCXOq+4lFxGOCcbRRjnNLFafO7QGsgsvqYeru
         +luPkxu3GvB+sM/QCUA5cfTNmfiKA6PkaZJTOR2ES/JqMVBMcssLy9h9MwNfS6UaXjbR
         iwqg==
X-Forwarded-Encrypted: i=1; AJvYcCUBOf2Pgd00mmQuiAe8KR9FTSbn55egboZ/pWWr7LZeCy82B9DkqF0S84SDu6VfACJ42bwuUN4JwKDkBG/H+kzbrWIw
X-Gm-Message-State: AOJu0YwRk/qllvKn8soEE+SbBF/VNmFS3bgKoRjAClT2wtTTr+OuH2/K
	N/mP346rPhhV2dcXJifaSt4GxypDR7Xr9O8wWUhqg6HzRdWTInJHo+6Cf7ZZqw==
X-Google-Smtp-Source: AGHT+IHRiqTI3exT9aUXPbfzfVdObRz6enkM4iNtqTyeJuNf5FUoBWRaGXuUEOw6UXOxL9Yjxzhl7w==
X-Received: by 2002:a05:6a00:22c3:b0:6e6:a8f5:6dc9 with SMTP id f3-20020a056a0022c300b006e6a8f56dc9mr12829827pfj.2.1710741910035;
        Sun, 17 Mar 2024 23:05:10 -0700 (PDT)
Received: from [127.0.1.1] ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id p12-20020a62ab0c000000b006e6c5b065f5sm7064268pff.28.2024.03.17.23.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 23:05:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 18 Mar 2024 11:34:29 +0530
Subject: [PATCH v5 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-dw-hdma-v5-5-f04c5cdde760@linaro.org>
References: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
In-Reply-To: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
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
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl99l4wGU2gTqdlRV7ctpg1FXFpW0CfJu/Dmtgj
 KkLJ+xYBzSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZffZeAAKCRBVnxHm/pHO
 9Wo6B/9EvqeiSaP7MDStogYrCCg1qe5Iq3029Z58RjdUkm6zgDfGxvGM4fVgAjcgMOIjKu4eE4+
 tK1ebMbz2DjiEE/Xmcp9Y9cpb5f+R37U9Q98qD5uOuKVZbyy/0J7Yk5QK+bbJdGyrWkhMp7zqCf
 3XCPBdvGLdxg507ZRXbp56Qtsn8T1e67Mvsc7pFDGNPkF8CQTTZOq8/juHBWjgIzM21XxQIliQJ
 TKsDPCrI9zKgQgyQ+BPFJVKPYU9kNaL8AANuGLza4TBm3DVtCsXllcdpK4qUycZeBlwtJRCaejm
 n2gzXu0iE2JSBtQ/iCbiGPW5cHOrnYq1ah5hjGfFlPBEeHrh
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

