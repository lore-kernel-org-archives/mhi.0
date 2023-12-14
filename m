Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D2A21
	for <mhi@lists.linux.dev>; Thu, 14 Dec 2023 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIpNqWnK"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b71e389fb2so252036939f.3
        for <mhi@lists.linux.dev>; Wed, 13 Dec 2023 22:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702535621; x=1703140421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQa3Oh83Y7BJ5yvT1MB3NL690VGSVlOorSazsJGg8O8=;
        b=UIpNqWnK6RSiFOkfIFFQF45iZClpJN+EAMoRAW6yDU2jKdjEtthifMRushJOXjk3tJ
         KVz2NQJoIO8vfcCAgrxWSdjo9rKhIUVgJE7KVYcAgUipYX6edey0Z+3L3UnO431hBXy2
         TX73sWVJGZopcwNtKWTQCwbHUSQtxd967C2r8TuCKP/6F4iUwI1XbN3CNvRUKlAYRYXP
         mPgk15JS73HjQND5CjKCh9w9L79bS1o/j7td9w2K8PvsOheK2knHaI+1MSfKuiEZgmyO
         DeM2ZhXaOWeeGAG0Fj3DTVIYXvuyLttNzby2aaYiyBuir/kS9KsqddGpzjQ1sPzhXNwY
         /pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702535621; x=1703140421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQa3Oh83Y7BJ5yvT1MB3NL690VGSVlOorSazsJGg8O8=;
        b=gUGC332/yklVMoUizIVat6TmbT9P/JiW4uQEfVeAPI78P4tiPF+4s4+5WIR5SVXycv
         9GP1+AseIXcuhNqJDZlI5CIXDtBjvvr9laD+tRk+V5fh9qelyNRAjj7OCOYtBN5XrXnq
         zpRS4y061ZxzzvqMfs6mZx96dI7FYsNHnF0GfuEmb8DRACjODErm3jF5YY9Xf5MmaQkU
         VH1smyWn8lTJAh6t05d6jdh5T67gQkx0xM9Mmfn+IIErt6SLAOYUwpL4WfJstSgFRjlo
         ebGq2GGoDkeLgq30DpFB42gtRtfhlwcfJlpcH+hmeL6+jJZ/1xrGO5MhAbIvbEpVRAux
         iqQQ==
X-Gm-Message-State: AOJu0YySatuhTqcPdH9SioBTPLoGve7zUMzJjyNVi2s5PcbBZ7jcGPKd
	mxPJ67VNpXf/KvAbJJkgLS1J
X-Google-Smtp-Source: AGHT+IEz9WJYleLURMpZ+fxmZXd0E4sPrwuGGZyApaPAAwDEgLTtswTy+mHFNCYGonBLoIypIEFaLQ==
X-Received: by 2002:a05:6e02:184b:b0:35d:6d53:5439 with SMTP id b11-20020a056e02184b00b0035d6d535439mr14590043ilv.11.1702535621114;
        Wed, 13 Dec 2023 22:33:41 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id q19-20020a170902bd9300b001cc2ebd2c2csm11639491pls.256.2023.12.13.22.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 22:33:40 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com
Cc: kishon@kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] PCI: epf-mhi: Fix the DMA data direction of dma_unmap_single()
Date: Thu, 14 Dec 2023 12:03:28 +0530
Message-Id: <20231214063328.40657-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the error path of pci_epf_mhi_edma_write() function, the DMA data
direction passed (DMA_FROM_DEVICE) doesn't match the actual direction used
for the data transfer. Fix it by passing the correct one (DMA_TO_DEVICE).

Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Bjorn, Krzysztof, I'd like to apply this patch to MHI tree on top of eDMA
async patches due to dependency:
https://lore.kernel.org/linux-pci/20231127124529.78203-1-manivannan.sadhasivam@linaro.org/

 drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 472bc489b754..d3d6a1054036 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -424,7 +424,7 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 err_unmap:
-	dma_unmap_single(dma_dev, src_addr, buf_info->size, DMA_FROM_DEVICE);
+	dma_unmap_single(dma_dev, src_addr, buf_info->size, DMA_TO_DEVICE);
 err_unlock:
 	mutex_unlock(&epf_mhi->lock);
 

base-commit: f5668f251e29292326e45a022f933c15740a8af2
-- 
2.25.1

