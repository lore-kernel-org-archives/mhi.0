Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C4229CA
	for <mhi@lists.linux.dev>; Sat,  5 Feb 2022 13:57:40 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id n32so7607257pfv.11
        for <mhi@lists.linux.dev>; Sat, 05 Feb 2022 05:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XGvSdM7vC1pTecZPrsZrqX912rXQTMoXwV75tbAyEZ0=;
        b=z8Gb0j54BsIY+IbBcLL06Zb2L6yrH6HiE6WuMg/jebrTdWkB8+bJYMzCJqtnn75LI9
         0hmRY8iXkX1bgtmKX66TrWY7JejlzVwK+xolTU4C/T17kzW96AbClpxfBr7+ZU9GvK1l
         6LSDGIjAcqlMj2/URngQGqWE5jZ6fQjUv08/hJhlUvv11Q9OEbioMUmXMFbwvG9aOXYi
         aghWeHOHZAZs6JlNlQh2TV5NKZQjFRui06bc+o/CRtmF7LvtAs9s9kaIrnRk8PCBVA4w
         5A6oz588HH8ano1YQ3J6G/CmpgWOIHFG94XtjaUEXuSFrkj1pBoT1ktM4HgTE9fuUH/Q
         58OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XGvSdM7vC1pTecZPrsZrqX912rXQTMoXwV75tbAyEZ0=;
        b=MQUjnDrba34Igl8AWJAbhOCR9Zz0rlS8d41GRUEQ261M9LuuKxmU58JQHvJrTRQ8xJ
         N2nmtr11yPISR6F1W/HIwyU0HH2MvhFwf9lUc5ASNNDCThRIjKX7gRpLZ6l6eoH6jUJx
         HTynN5K7FAMNrgmMSWEzF5F8rsrlDlgm42fNwv/l+17TLaxPlEJlNV2cxc/1bfGIRqT6
         MAz9OESt68OmaE8Z2hLVbZyWS2LMYXPK3oA+KXnpKrL8Hjvu7+TPppFwA4bOfsgKkJ8P
         d5IUxnBIR95uV3naAcPHLKFhPirzlTmy5Rez/iCUYOLGCgqB+mY9qVxh4sywxazyvyPp
         3L+w==
X-Gm-Message-State: AOAM530wHHnAobIc82RFqB/oE0fH88MRSbzRCvTaM+1RC09oY9+rJ5qO
	KsswQUJZEzCrA7grNxlWl8hh
X-Google-Smtp-Source: ABdhPJzFtN4U47gHOs5fpHk30zlLd9QNQ9cqJ1cbTXhtuIUhOWlawmAhSkx04/uY0vd6OiIoi8rHlA==
X-Received: by 2002:a63:6bc4:: with SMTP id g187mr2962271pgc.151.1644069460224;
        Sat, 05 Feb 2022 05:57:40 -0800 (PST)
Received: from localhost.localdomain ([220.158.158.32])
        by smtp.gmail.com with ESMTPSA id z13sm6355533pfe.20.2022.02.05.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 05:57:39 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	Slark Xiao <slark_xiao@163.com>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] bus: mhi: pci_generic: Add mru_default for Foxconn SDX55
Date: Sat,  5 Feb 2022 19:27:30 +0530
Message-Id: <20220205135731.157871-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205135731.157871-1-manivannan.sadhasivam@linaro.org>
References: <20220205135731.157871-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Slark Xiao <slark_xiao@163.com>

For default mechanism, product would use default MRU 3500 if
they didn't define it. But for Foxconn SDX55, there is a known
issue which MRU 3500 would lead to data connection lost.
So we align it with Qualcomm default MRU settings.

Cc: stable@vger.kernel.org # v5.12+
Fixes: aac426562f56 ("bus: mhi: pci_generic: Introduce Foxconn T99W175 support")
Signed-off-by: Slark Xiao <slark_xiao@163.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/20220119101213.5008-1-slark_xiao@163.com
[mani: Added pci_generic prefix to subject and CCed stable]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 3a258a677df8..74e8fc342cfd 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -366,6 +366,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.mru_default = 32768,
 	.sideband_wake = false,
 };
 
-- 
2.25.1

