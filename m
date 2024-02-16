Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F07134CC0
	for <mhi@lists.linux.dev>; Fri, 16 Feb 2024 17:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104926; cv=none; b=oThgRXNjDtI2gXBawbd0Jq68ji5laDqvcqBlYxsrqex/FNPXL/iTciSPZMvT8cdFqvWbwdbHEOUi01oWE0XwSH98KVtACqY4B5cL0cHpF8FDsF44Kyhhf3KOsng3yUQVE5QvVL42ZTc4d3ziAkRIcXVmtypq4OsjbQlOMQ5WuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104926; c=relaxed/simple;
	bh=R1GLPwlYfMEGgtPbyaSg7QFWg/JNBX3HH10DnKKcCK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvwPDV/jp5Sdqapww8ws1Km6HkIsYXt4OJue8AkrGYDpN9+ld/9CZwwdGfI45CuTzn+o+FlkaM+DWuB5zICMJ2/ApGy6WloDGldBK2z38m4XSqTHiqzPOyQlZqQU7qH6Uxxfqf+ymWwBPOVqplLzoZJhiNv6+L5+CQ+NWZ41QBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N5Imi664; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5Imi664"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d71cb97937so23933635ad.3
        for <mhi@lists.linux.dev>; Fri, 16 Feb 2024 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708104923; x=1708709723; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWuu4IaCb+ecu+2X4FcUxgf2SPat8siMwG6Oun2YK2w=;
        b=N5Imi664v0DeR3+9xX2/89agH4rYxlo2LjEAKsCNGDp4aiNDQm3e/ebw/THePeZ8a0
         FMU78BMiVjI7CNbatw2qvvLo8GT/U8qSxix6c4TyYVSs6Lrtvw93be7dbB5kpebnzrlw
         VvqNByyq7O8II3tJd2cBT0ZgffNOCrrTqso4SwAu/SsXv0Ci161u3Hi22Zk4P9J7zLIX
         Tqqt8WkYzAzsDdvQgNFUHz0syaSKiljDj4GTOe+CRXPSHiJtckkXGYn4LjraFp9BTLTo
         45VQD0XSKGsV7VKQmyc1YMyD09bvWzkGZEn9tac1rAfWxS1mnKgpXLwCNL1i59xN+6Cb
         2YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708104923; x=1708709723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWuu4IaCb+ecu+2X4FcUxgf2SPat8siMwG6Oun2YK2w=;
        b=aI+p/RsTXuPR8fyPE9YjmlSjaOBpR72GlINyjhMN1Jc4UWDeJHebuDdU/cL5HLs5va
         fcmxbgw358z8a0M1Xsy8ULy8ru5cY+1oCLZwlaSEOr2JQ0G1taKhY4LbkazJ8Sqy4V4M
         Y4QbEzd8OJ4ow0gm4cGBHRlbzkvE1c4EUFepC/lUacc0QYpVjmWXkFFxv4o1Kw9oRrgO
         ofIEwz4D4qYE5a7EgOddxRr/ZxqPapLyBiBasLZea/0zgIkAI1f83jsuJR7f89vQoGn/
         pJuIe3ihxPBeV+CjVzSw07/tv0hToQrLkOGsWfFvcw6ua15AfA+u7dwALa65TgNtLq7W
         9qUw==
X-Forwarded-Encrypted: i=1; AJvYcCU9WuaASvXHC9Zesi3gtiP8X6KAZQAEkaX1mPyHbnb1Zi7TG8ZiGRE9imE1g7qQOl5194/ytcje76dBmAKMb2oH4TP1
X-Gm-Message-State: AOJu0Ywch0UOETOdH4yrYLvVvQz5IYtlGQlRpfEBrqqU9ybAEo2JELKn
	89+RI7T8OUEB6L5cazLA12L2VgtDQ7O5t0F2NvR1r4gpIANQsGQZWTr+RWuUrw==
X-Google-Smtp-Source: AGHT+IGdCXZredO/BC7qQxhRij/KCAb3j/MIg4DPBT6lo3YCmbYRREkXZE3AZg1N6MirSxETbxerBw==
X-Received: by 2002:a17:902:ea12:b0:1db:ae5f:a38d with SMTP id s18-20020a170902ea1200b001dbae5fa38dmr2114924plg.5.1708104923231;
        Fri, 16 Feb 2024 09:35:23 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b001db5241100fsm118592plz.183.2024.02.16.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:35:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Fri, 16 Feb 2024 23:04:44 +0530
Subject: [PATCH v2 5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-dw-hdma-v2-5-b42329003f43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=l9TZl5f3ruMfAhDvync60x+vuqThCg8E95q3H1HbSYw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlz5y+NwBcDBvMsgLY/9ArhUeU4RtpAOkSNOPA0
 cL+6HT1tTCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZc+cvgAKCRBVnxHm/pHO
 9YdiB/9TA+DKLXxIZYpi/4hnMyIkUsM2WJIWyQ6w7vRVyPe9xkvRVouAEDo3kakdlZprxiUhdRE
 RVaU7JFkgelmHQuyS7am0hGDZJpDmEmPrmuGigJlrygDliRLE85n5WP2vnnN7WKQuYN+W8HQnv0
 l0f9zuR0+G+HEp9D1og10j/2BOueS6fmgssxK8rtfpi2VW+6FgY0KiiqpsWdUq7od5/Ucw2nR1F
 NbjzPj1POiJNg12Bi3HrhcTLZjvb0KwfS/lV5Mj1NKvbtl2anyrbqaqqbejjAuqCSzx91cCovSW
 ddbe/L2NDfdpqcgHjOuBkoP+92IIH3SP4KN6C52nTmQjmNqV
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports Hyper DMA (HDMA) DMA Engine present in the DWC IP. So,
let's enable it in the EPF driver so that the DMA Engine APIs can be used
for data transfer.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: reworded commit message]
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

