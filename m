Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6562C80
	for <mhi@lists.linux.dev>; Sat,  5 Feb 2022 13:57:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id oa14-20020a17090b1bce00b001b61aed4a03so8837874pjb.5
        for <mhi@lists.linux.dev>; Sat, 05 Feb 2022 05:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0+gDcwKFt260uCvDNcXKUjFFsl38YOMRKAZVrvcRdwE=;
        b=XlJ5yMs426ODFx+xgWqfUcLqFmH4PL2v8lpt6L59iacJBmvu9Ngw0SiwPOBMqMsTDL
         xt/lgG6904HeSdebFAtVTpHP03tBQnY/oRTg/+qp8vwAPOaj4oqSmt4+/3M8qD6mbujh
         Z87DCD256gmoB8zo64VldVSX9tyhiuyAcHY6HP/8+yXPWWirDzQmUS29ZOGerFwgBcdq
         qKUhDOZhBLnl0U9FHyc0QD1LsQi2UIZwjRQu1lREbQSAdhizuXqvJZJC9Ysvde+X6TJo
         n/iWyXXcIN7+Mm8dqttMLJw233iQb6ium4e3/68UJHvHoieuPkYEtD9JvXZZ5jPfOEho
         dWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0+gDcwKFt260uCvDNcXKUjFFsl38YOMRKAZVrvcRdwE=;
        b=bcNzHTai/OJNMmdyu3SyN/KgOS07yqfWIXgzPD9PQIAagT3GgHd9tpLxkXE/eKY9wZ
         zht8xzlPwN2WzhQMmCAwuDLB2lYKLbRg/e5tVNrJLc+kb5ZmucBlhkIZHA1OATsCxfKA
         GjhcgDJ6Ow6TAb+Soyz43dmDJl6H179bHSGyPMRTa+9OynijTefq+rwEyZ11C6O2KncG
         aZu4AwOrk1TjY3aLVppOoOkGQdJPu/msk0e/LoC0EA4y0o6wkYOTP48VJyNvNMKua/o3
         GfmT+MXnk/x2XjNR233EDuchLMK/Bp/R2xj4w6uFafLxYQiO0KLZuIif4HMiazBBq75k
         H/og==
X-Gm-Message-State: AOAM531EBr+KQsiIPucaMTOxbz586Lr3iQ4FM8wTyUW9wAeBwWsDD1WB
	EsYmg1R0yhvaXau6d0kMkU7J
X-Google-Smtp-Source: ABdhPJwFGqmH4T3wyyAlgOBztWunQqSqTZ7RAMNcABX8QqwkGCpTVL0Ji9MYBQtqWT5fGGbf5WptxA==
X-Received: by 2002:a17:902:e0cd:: with SMTP id e13mr1591531pla.15.1644069463788;
        Sat, 05 Feb 2022 05:57:43 -0800 (PST)
Received: from localhost.localdomain ([220.158.158.32])
        by smtp.gmail.com with ESMTPSA id z13sm6355533pfe.20.2022.02.05.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 05:57:43 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	Slark Xiao <slark_xiao@163.com>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] bus: mhi: pci_generic: Add mru_default for Cinterion MV31-W
Date: Sat,  5 Feb 2022 19:27:31 +0530
Message-Id: <20220205135731.157871-3-manivannan.sadhasivam@linaro.org>
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
they didn't define it. But for Cinterion MV31-W, there is a known
issue which MRU 3500 would lead to data connection lost.
So we align it with Qualcomm default MRU settings.

Cc: stable@vger.kernel.org # v5.14 +
Fixes: 87693e092bd0 ("bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI")
Signed-off-by: Slark Xiao <slark_xiao@163.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/20220119102519.5342-1-slark_xiao@163.com
[mani: Modified the commit message to reflect Cinterion MV31-W and CCed stable]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 74e8fc342cfd..b79895810c52 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -402,6 +402,7 @@ static const struct mhi_pci_dev_info mhi_mv31_info = {
 	.config = &modem_mv31_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.mru_default = 32768,
 };
 
 static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
-- 
2.25.1

