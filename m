Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6141C08
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:17:39 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id u4-20020a17090a518400b00223f7eba2c4so16468213pjh.5
        for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSAJAAdg+x2pOzW2h8I4DWXP2kQcq5rdUpJcuztv9EE=;
        b=zFtugpRj2SGg96qrJKKPlr+MyyNnNyuUCPvH4PdjNFsVHhZZmMIN/KOq4JeyQA8bys
         /Stl7IcHO4xx7yHuC3VjLzsueyqi0DOdGuZNyG7Uubuhene+VMbN6+vikXMigsNF05SZ
         zvcmwRX0TQ6HsWH3zzwpQ/vCnnK24FznH+UGjIwOWQ71x9sI+GgiaQziNz5Uj25Q28Uy
         xw5CcVwNaSFP/o1xg49J+RJdoV50/Mh/HnQfFslJNO4BOnMOMSLOeDNawr1LF5r4lKfg
         rU9UckkH2uomLEmwOiR8a0qewI0P2yFgk+YeXZFwJoJDB5zVNwYalIWdtpxnLG9FeUC5
         UK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSAJAAdg+x2pOzW2h8I4DWXP2kQcq5rdUpJcuztv9EE=;
        b=gOxoRHQh12WtNeMY2Vi/mxSUAjIecpnvpnjZFqo1O2+s1ITBniWdEfWmRjIqxp+tiX
         OD0ey+a4d7V90auIdb5TgRVyHNOlxwDHg3hxe14+s3j7bzrcNnelFtJ/vmiX9ztT0Wif
         kJEuimlfRQEphbKLtkQE/R7zwPoiN4UJAlcnYzKRGaVWockG0a8fvgKTDMyvWw17UPEg
         ymZzugp4hsv36dzOPuCe+N2LtevwJ95G+HCTxyd+/YBVeHB1RBKfdySEWYNPeGMlL0hM
         9/TZ5+JAwMYXFwhA30OaXlDV5rKF21nz99Afo3OgoDE0wtzsI5E3byoK5zMiQZ8Gy7eu
         vqmw==
X-Gm-Message-State: AFqh2koxIMxaQGipm3FRQVXDonJyWm2ip7WpqUFJP77NsP8rRcHk0Qk5
	u5938s18Zvt4bc280CqNs4QEFP3GLGcMMr0=
X-Google-Smtp-Source: AMrXdXu7mmaMcjNI9HxR+d1DxaBtYiq2bLtKfidJoFb02M79IzccfjmBnBfUTVaiydWpiO50zOQ4dQ==
X-Received: by 2002:a17:902:edd1:b0:192:50fe:504a with SMTP id q17-20020a170902edd100b0019250fe504amr23724967plk.16.1672244258560;
        Wed, 28 Dec 2022 08:17:38 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:37 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] bus: mhi: ep: Save channel state locally during suspend and resume
Date: Wed, 28 Dec 2022 21:47:04 +0530
Message-Id: <20221228161704.255268-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
References: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During suspend and resume, the channel state needs to be saved locally.
Otherwise, the endpoint may access the channels while they were being
suspended and causing access violations.

Fix it by saving the channel state locally during suspend and resume.

Cc: <stable@vger.kernel.org> # 5.19
Fixes: e4b7b5f0f30a ("bus: mhi: ep: Add support for suspending and resuming channels")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 2362fcc8b32c..bcaaba97ef63 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1122,6 +1122,7 @@ void mhi_ep_suspend_channels(struct mhi_ep_cntrl *mhi_cntrl)
 
 		dev_dbg(&mhi_chan->mhi_dev->dev, "Suspending channel\n");
 		/* Set channel state to SUSPENDED */
+		mhi_chan->state = MHI_CH_STATE_SUSPENDED;
 		tmp &= ~CHAN_CTX_CHSTATE_MASK;
 		tmp |= FIELD_PREP(CHAN_CTX_CHSTATE_MASK, MHI_CH_STATE_SUSPENDED);
 		mhi_cntrl->ch_ctx_cache[i].chcfg = cpu_to_le32(tmp);
@@ -1151,6 +1152,7 @@ void mhi_ep_resume_channels(struct mhi_ep_cntrl *mhi_cntrl)
 
 		dev_dbg(&mhi_chan->mhi_dev->dev, "Resuming channel\n");
 		/* Set channel state to RUNNING */
+		mhi_chan->state = MHI_CH_STATE_RUNNING;
 		tmp &= ~CHAN_CTX_CHSTATE_MASK;
 		tmp |= FIELD_PREP(CHAN_CTX_CHSTATE_MASK, MHI_CH_STATE_RUNNING);
 		mhi_cntrl->ch_ctx_cache[i].chcfg = cpu_to_le32(tmp);
-- 
2.25.1

