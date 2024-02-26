Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FD34F1E6
	for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947502; cv=none; b=Wf+SVYcgeBcwTHvCmfQd23DkHIkHCpmBxhAiOz5kcdmgxNw9wwso9OK6LzYS7EC9D8HjG9BSOCxWZhGFveaWUjcKQLB7ynLcyt1+lEPJxIRxDyCy5XaPkEm7RQSbUUrurhomKV/H/KXLunnfRUYj/VFQnoYxQS63M/aPieWVF7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947502; c=relaxed/simple;
	bh=rySUPOYrv9T+HZDbsprHAcPFbuAMziJaAQnsy9yh8Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiIwJWtLshnu8LX/uxq5vFUMSzaS/BvIZlSaXju2oBitSVubp3vdd0H3B9WazcfPaHb+6OTQcpRVNx9+X/NaGN2n3xswt2W+4Eq8QaeCDDYDNO2QSC07R6OS5ZaBAPsXvCkBCjKutMrT5tuQ3EaEiowQpGiMsUfi+82oFFLfnDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpgr5xV+; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpgr5xV+"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-787ba57afd1so194504385a.0
        for <mhi@lists.linux.dev>; Mon, 26 Feb 2024 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947498; x=1709552298; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+w+dz2LhhxLyj9g/T/Ynx7ET7ucJXKJT/WmnsqQcygw=;
        b=tpgr5xV+HztobJfmpNtsfAT/DrelfmODBfblXVLOR9wZwKGc/c9pXTQgz+J4GXN0Tj
         9Ve4I/Y9rKOGkGcbdiwlOU00fkyOQJOO078SPBH1XK2+E67lA69dC+m9e1xrMc6yEwU9
         ItZ5T9aDk3+tsRQuTXfIbR9t2ycVUYEy4rxHBqF4kA8ZF8qfY/w74mTUuylbSChdVM17
         3rpZ2zUKKArZaoNLrKAA1uDdcce+0rWP/nNEoHb5sTD/SIkonZMZ0Fj19n7GUbjat2O6
         aNiSLhHXgTGdOgm0gz8ftrwMVls6fC7u2duAYO3POdqQimqF4fRlFyZ3Anj3P/UkFvav
         9sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947498; x=1709552298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+w+dz2LhhxLyj9g/T/Ynx7ET7ucJXKJT/WmnsqQcygw=;
        b=XbNuNVsWwRcJlT7wCV47MzG3j7K+qV8ebpbK6Gt+qX89kAya3nSpz01EPv7jiZKmr8
         BDDNHjG3fqWM1ZZ8QscB/Rql05slp3s87Ms4aJvsNe07UEZqVIjVaiPdeCjcJdmPmH2d
         xD8q5xzhnGBldK+FHNhtel8w2VeJazBrTS4Gqxe0430PIe9n8K3xrbEQhNQOAjz4QecD
         xT3RqOlY5Mct8c88PHBA5Ud4cCoIRzO+pWvkRNFMHuRIyP5dmvRZigJW3DNbtCJdMHus
         YmSSyv59OvFjZPZdwlcui+79fEbQIMrghERgI36JvWISxkCseAS+6WP36DcS2oNfJGpC
         8TDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0bvPh7XNPRdMCgCnpjLnqCrqEypom0dIGl5q/Umd5sn5NAkicIk3aaX8ktfXbj0JCJEfSOqyK6J23ecm6eX1rguRN
X-Gm-Message-State: AOJu0YxuPcEs6lIUzc5fvSFvsP8Jk6+ez8ZaBG4WFkRiEXFt0PuabNhq
	Y8UEIeczO4N4Ennsz0ARpnHtEdSbpOnlOteuTS9maoZFvHmESNTrNHzjoPgyqw==
X-Google-Smtp-Source: AGHT+IF7HmtMnaGrj80UYao6lQvALwBuMw8q3jvFf9UFrxEVWdxk0u5fePdkKkkBuQR3Or+GeX/gvw==
X-Received: by 2002:a05:620a:2014:b0:787:3769:d747 with SMTP id c20-20020a05620a201400b007873769d747mr6779105qka.59.1708947498204;
        Mon, 26 Feb 2024 03:38:18 -0800 (PST)
Received: from [127.0.1.1] ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id q15-20020a05620a0c8f00b007878babb96asm2341842qki.94.2024.02.26.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:38:17 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 26 Feb 2024 17:07:30 +0530
Subject: [PATCH v3 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-dw-hdma-v3-5-cfcb8171fc24@linaro.org>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
In-Reply-To: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
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
 Siddharth Vadapalli <s-vadapalli@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=isUh7Dyx4QOFqnRUN5haG5ZOvquZ4WskKD+PqeTLyJ8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl3HgGRFaIIukjpQ+MlVp1t7r1KyH4o9t0giPf0
 ecjdOvjr4+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdx4BgAKCRBVnxHm/pHO
 9T0gB/wJn/wKQ4SsV6Ave0iIOFHg8ILRsYljtotpgZCkHh/5Kj1edf/8JHtagUfbFRpAG79lmH2
 O1MojHHi2V9sIKmQmUmcpuOTMRDxwbdCebgoSKNoHPArCydW0NeU4pzCKz9EE81+RlUR12fPoS/
 ZGPPGrolyRh6QD9wXY5iFzg3Yl3RNCEAC4lx3D4bFD3xbujKklIHTBHNUApv+5z8th9yggp7DRd
 sBP0G7dSjLssbgvE9DAsWGoXqVaz4aTH+jTEs9w1V1EuwHzla3+MJc2Sy0FL95Ga5Kdw3ZPRcLb
 k071qmHaETAfzo4PIDsL3SeyXE9Ic3T3xa5XDj6Fh1otg3tt
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports Hyper DMA (HDMA) DMA Engine present in the DWC IP. So,
let's enable it in the EPF driver so that the DMA Engine APIs can be used
for data transfer.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: reworded commit message]
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
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

