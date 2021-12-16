Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720DD2CA4
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 08:13:14 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id mj19so4926379pjb.3
        for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 00:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jORfXqfkT+AmZwZbRfSXnEcMFi32raPXjjq42kYwqXI=;
        b=NyROb5UHfKELvGtaH6JLzZaZrCWR3OMKtVGLIxq1lNesb0I41GMDyDf2xYUtRSXr2R
         8yiOvH7A98JR/I4q1RHTK6tZUn9g84Xik+VxwxNi0+Jc2lz/gw0sgYfpaEZnVDwjvMkN
         iNemcrUv461reOylEuEZE/9u+8Svs9axsMQfm7mOayD1DUClXtF1zAtHWnSyK6Y6TJZl
         S7z07C6mEh9GqE6HNXbkqpxA0u5AZLNPihKqJNN09JBg8QUlZ7FFHntvwWx2kAlxOE9B
         XYkFIPve9HjA+6dbUlQzMnK3anVFI056k31Zgh6wsOUYjF7T3VRduqIqpqN/ptcCetha
         3qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jORfXqfkT+AmZwZbRfSXnEcMFi32raPXjjq42kYwqXI=;
        b=xeXsiA1+pyLOsuSisbMun9OJavXlOaaPcFqBXKGoALP4M0jFmmLGO6csq9OyYoagso
         v1nmWcdiyYeIgDUdztnicWoP9Xv7kGbTFvTiVt13IpU7j4ZsnQVu+WAraf4H6eqS2qHM
         g/xgmkLs9qqPHD1ywPJXUmCTwRYNi8eNzK1JvFm9wvh/+k7viqcPJXhEI5SPpwUos/Sa
         G1YjhKjVEGk5vH3mvaoAugamnK+LnnE7CztYA1NNQdeazZyA0JpOpMtMThfe/DacvpYp
         y9cHXJq945g14b7S8Oya/6+pbC+kfNC9GGzs6/fTj2tA0V9tzoc7HygoSRFtlQ0+E3+S
         9DTg==
X-Gm-Message-State: AOAM532aL/nwcVqD5es+QMamWQ4RbKkqXaoelXgZrpizvgmGDK+esHzK
	FnYx2R/Wg9ry2jwHg38tmIB4
X-Google-Smtp-Source: ABdhPJxSBZxpt9vbJSz9OgvxQmS/MXnfDD2CMsEYXXlEenw0R6KqhonP8LmYH/RF56yror/Md0arcw==
X-Received: by 2002:a17:902:d885:b0:148:a2e8:2c55 with SMTP id b5-20020a170902d88500b00148a2e82c55mr8633167plz.164.1639642394010;
        Thu, 16 Dec 2021 00:13:14 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:13:13 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	thomas.perrot@bootlin.com,
	aleksander@aleksander.es,
	slark_xiao@163.com,
	christophe.jaillet@wanadoo.fr,
	keescook@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/10] bus: mhi: pci_generic: Simplify code and axe the use of a deprecated API
Date: Thu, 16 Dec 2021 13:42:22 +0530
Message-Id: <20211216081227.237749-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
References: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

Replace 'pci_set_dma_mask/pci_set_consistent_dma_mask' by an equivalent
and less verbose 'dma_set_mask_and_coherent()' call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/bb3dc436fe142309a2334549db782c5ebb80a2be.1625718497.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 4f72bbcc53c9..9ef41354237c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -532,18 +532,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
 	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
 
-	err = pci_set_dma_mask(pdev, dma_mask);
+	err = dma_set_mask_and_coherent(&pdev->dev, dma_mask);
 	if (err) {
 		dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
 		return err;
 	}
 
-	err = pci_set_consistent_dma_mask(pdev, dma_mask);
-	if (err) {
-		dev_err(&pdev->dev, "set consistent dma mask failed\n");
-		return err;
-	}
-
 	pci_set_master(pdev);
 
 	return 0;
-- 
2.25.1

