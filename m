Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE1718E11
	for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KkYM/AzY"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-77d67000b69so237081785a.2
        for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 04:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089171; x=1701693971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0WeQVv6xDz1fA7FB+siaDKsF7jHm7RdEkvM6+sXcAk=;
        b=KkYM/AzY71xDVpP+qD6jqliT3VELwUaut7XxJE2m9vyHQU5KznfhNfwvDayWTsyprq
         Wk3Q+KR+O9hM7jbEBnAEx2OGEysFCMNsDvbIjIkHryZaUOjIPRBdulV0cmgnOLdHJuEc
         h0kXXVV6xyWbq9HxyyQk2t2TN5SfS8nSqsTNnqIZUJckx0QwW5uDbdXQPXyGMNJ4vB67
         mLI4aGeBT+mwyjqh8/jA159tDLPprArLkm4AG2pSoya8cawfEZmHbZ84y9V9fLzho/Fx
         3cvcGScui8G8sbE5qZWAJqS/lwCr1oRC2s4rweYVyzuIIR6W+/mQtGnfmtVcQtion1Q/
         gVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089171; x=1701693971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0WeQVv6xDz1fA7FB+siaDKsF7jHm7RdEkvM6+sXcAk=;
        b=LuOxdpEi53TSR/fKcI0JTaBxiL9tKofvdMqBz/+SDOQeEOVAK+eTY6qLUV9UplttNz
         WNQhz6QNF2V6ByHSSrP9Reto87+P/ysR9ojlPGS2YUOoouu08ILrTxAMJJTqgpdZERcm
         XQnEGr5JFg4B8auc1VW5y6IB/oBldMNlohfYazAtM+CqmJiXasnVzeKpZUiKEpyvL8qV
         sah7H91e0NmlVYGIJLmy3iWknyA86O6bPxuxM2AEa1bXNswX9duwmiB58gt8NDBlTLZk
         9KvckHcb5G2n7hHRTdDceWfNmQMl+Ko0sa5jOi8klZDIECUQzdxAxmy6srqzKe4eBULC
         twaw==
X-Gm-Message-State: AOJu0YySy4+jrZf7xlZkO4OGzYw2BP+bdmjHNF9UYBY0OV5N7hzZiJD0
	gafkZ21MFiB7CV1i5pQIkwhz
X-Google-Smtp-Source: AGHT+IERxAcM9ld/cVONnYwD9Qw8esi9QM+/QvFXWK+aoyDNWVgo9aOd0jymm0Z4uVeT5EbnhzFY6g==
X-Received: by 2002:a05:6214:469b:b0:67a:35f3:4408 with SMTP id or27-20020a056214469b00b0067a35f34408mr9911296qvb.31.1701089170905;
        Mon, 27 Nov 2023 04:46:10 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:46:10 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 6/9] PCI: epf-mhi: Enable MHI async read/write support
Date: Mon, 27 Nov 2023 18:15:26 +0530
Message-Id: <20231127124529.78203-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that both eDMA and iATU are prepared to support async transfer, let's
enable MHI async read/write by supplying the relevant callbacks.

In the absence of eDMA, iATU will be used for both sync and async
operations.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 3d09a37e5f7c..d3d6a1054036 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -766,12 +766,13 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	mhi_cntrl->raise_irq = pci_epf_mhi_raise_irq;
 	mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
 	mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
+	mhi_cntrl->read_sync = mhi_cntrl->read_async = pci_epf_mhi_iatu_read;
+	mhi_cntrl->write_sync = mhi_cntrl->write_async = pci_epf_mhi_iatu_write;
 	if (info->flags & MHI_EPF_USE_DMA) {
 		mhi_cntrl->read_sync = pci_epf_mhi_edma_read;
 		mhi_cntrl->write_sync = pci_epf_mhi_edma_write;
-	} else {
-		mhi_cntrl->read_sync = pci_epf_mhi_iatu_read;
-		mhi_cntrl->write_sync = pci_epf_mhi_iatu_write;
+		mhi_cntrl->read_async = pci_epf_mhi_edma_read_async;
+		mhi_cntrl->write_async = pci_epf_mhi_edma_write_async;
 	}
 
 	/* Register the MHI EP controller */
-- 
2.25.1

