Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF345CAB
	for <mhi@lists.linux.dev>; Tue,  1 Mar 2022 16:03:27 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id s1so13780502plg.12
        for <mhi@lists.linux.dev>; Tue, 01 Mar 2022 08:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v1g2hYf97RcajpTup4MPHjgGvJjlulQZjdgR68xQMns=;
        b=hepV1AjZLA0WjhWVmPnDKy4Ig58wsvt7UUn7IcDnRnL8NVM/Cf/a6x7x0BfS7PPa28
         kpAO/hxd+lBzZs8iELLydoj7WCPgVBAbR3r/Qsk9/wR4GofXAJbOS0NalaoiUO3fZ1Ft
         +jwQWW02MCVCPSrXQ00hmnhUl/e+wjpTzuCbmX0FSdUyTxG56uUizoWxPt+Mo0afymgT
         keJ6a1c9Legnc0Lfn1ci4wPHKBikRDLMV4SDLALOqEaV6cmtl0YOmBJGso10Ij5MpdUs
         XXNR0yUy5buQsT8K1UL0x8c3rkiBASUSu+cuBjrLqD0eqoOn7upR/TCBx8AeRSeS1OI9
         HDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v1g2hYf97RcajpTup4MPHjgGvJjlulQZjdgR68xQMns=;
        b=o7iHF8AhMXA4D/VoFLYGiZwADtlVZlRC1xe4mSqG8ugJvHwigulcFLekEe0bV8nh1u
         eYF4DuAxDsoF3EOqYHltC6B3+Ut5B1xukReiILaXAO5o0nWhw4oyHrESGFgwwkB3a5U6
         zmU2g3BLzCjrCKzOTmQEpQjEm//1GmLCpiuTm1EjwrDJ3H/Hy6n7FAl8trf2zex7+pm6
         0TqTKFlmjZ6XHfWiCp06zgznxp17SPMcZ8TzXGcJJZWTqSa69axC2n7srCm/NEv04dGe
         gy/ojDT+G20cX71eMMlozbxxTg8558qn8qgbM3HUD5htiKaAl9IbCaaDsaA1FlOgyy/o
         4zMg==
X-Gm-Message-State: AOAM531nHfHSPRI3CpvuvaBUsSExF0fs0TAOXGhyWsmn9Gh9Z8S0Rros
	z/rWu/FjX7zpcKQ7pIDf3Mv3
X-Google-Smtp-Source: ABdhPJyREiVd2eDrhZP23iEPA/klSgkX0IjDBvULPNNBz7EbnxeJXEtY77qXeeqN1goRinuTcFstlQ==
X-Received: by 2002:a17:903:40ce:b0:151:7343:9981 with SMTP id t14-20020a17090340ce00b0015173439981mr7150385pld.102.1646150607288;
        Tue, 01 Mar 2022 08:03:27 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.80])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm2489530pjn.34.2022.03.01.08.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:03:26 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	elder@linaro.org,
	paul.davey@alliedtelesis.co.nz,
	Yonglin Tan <yonglin.tan@outlook.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/10] bus: mhi: pci_generic: Add mru_default for Quectel EM1xx series
Date: Tue,  1 Mar 2022 21:32:59 +0530
Message-Id: <20220301160308.107452-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
References: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yonglin Tan <yonglin.tan@outlook.com>

For default mechanism, the driver uses default MRU 3500 if mru_default
is not initialized. The Qualcomm configured the MRU size to 32768 in the
WWAN device FW. So, we align the driver setting with Qualcomm FW setting.

Fixes: ac4bf60bbaa0 ("bus: mhi: pci_generic: Introduce quectel EM1XXGR-L support")
Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/MEYP282MB2374EE345DADDB591AFDA6AFFD2E9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b79895810c52..9527b7d63840 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -327,6 +327,7 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.config = &modem_quectel_em1xx_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.mru_default = 32768,
 	.sideband_wake = true,
 };
 
-- 
2.25.1

