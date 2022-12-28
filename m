Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35381C07
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:17:27 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id t2so16460798ply.2
        for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 08:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCFU0KCqTh7FlQ8evG955AiRt86XIvSnki+8nWo+njQ=;
        b=GC4TcWpBQl00n4Y1fqaF8bTVq2/KnhyWyJ3s4AMB8/9MIP9ntBMY0TWweRIge8i1EQ
         lk4F1KiY+FtYLf2e7QqDESspd2fPqQoqPNNvhGinnvehLQ2M9LZ5gT14gT+7XcyvXzT1
         rx1YJowuaJrw3OYziAYFJwAWOdKSo27bKmzAg4SM8exV+5Jp7tTRJTK2YN9Db2TJjIO6
         KKXS2G8qz4MkJT+3Ky6SZklbrn/zo9a7xZbs5o49mRBSE7+5f6yy0+XiHzlBrlJNX9yW
         3DgOnA3pjb+V1nngG6/WLfY/BaSWyelZpfesVsTNQPHd/iJFXocVBjkq7J//BxUxSsDv
         jMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCFU0KCqTh7FlQ8evG955AiRt86XIvSnki+8nWo+njQ=;
        b=tw+DSyuBa/pMDYXE29c0XNkxWGEjWFSG9gf1bCf2fkA8q7PW/+WHGWopsHhwWG11th
         Hrm5+Ax+EIKpzEGW4os3YViY9a0vHO5ABdw01WnFgbkTN7B9nMkLowMNG2Fdb/3imFeT
         xAm2kGyusFnlXnefJQTYATnPfED2a3wp1qcsWnZHPRFwMP6uRWtwYfUDT6w/jvDcfGij
         yAL9PP6HgrNcx35UqDe4zZSEWEOKqWcd/9a19aOjGpzVJdF9VGXU3ugTx4fHcDU0H6mf
         iXmVllSqXJT9flYr3hs5b6YwgVHXhOIGxUKxQvCMVFpnv9zPFwujsVsMouLH4hyE3A0V
         2iPQ==
X-Gm-Message-State: AFqh2koAoCirV0fIla9SdbGarW7P7c1WXwHRC2tprLnFJznqBvcMJKrI
	HxBN6TofzV/bqoIiXwVmsXSpO/JSwtJXfhE=
X-Google-Smtp-Source: AMrXdXslfCaH8dI1dD3KxXGW8+I2yw8KJ/SiFwQ5aFGEWO/GU5SuXXkjlkDm87wvjtrevGu/DF2Whg==
X-Received: by 2002:a17:902:b401:b0:189:aa51:e27f with SMTP id x1-20020a170902b40100b00189aa51e27fmr32379244plr.44.1672244246949;
        Wed, 28 Dec 2022 08:17:26 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:26 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/6] bus: mhi: ep: Only send -ENOTCONN status if client driver is available
Date: Wed, 28 Dec 2022 21:47:01 +0530
Message-Id: <20221228161704.255268-4-manivannan.sadhasivam@linaro.org>
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

For the STOP and RESET commands, only send the channel disconnect status
-ENOTCONN if client driver is available. Otherwise, it will result in
null pointer dereference.

Cc: <stable@vger.kernel.org> # 5.19
Fixes: e827569062a8 ("bus: mhi: ep: Add support for processing command rings")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 8b065a3cc848..7d68b00bdbcf 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -203,9 +203,11 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 		mhi_ep_mmio_disable_chdb(mhi_cntrl, ch_id);
 
 		/* Send channel disconnect status to client drivers */
-		result.transaction_status = -ENOTCONN;
-		result.bytes_xferd = 0;
-		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		if (mhi_chan->xfer_cb) {
+			result.transaction_status = -ENOTCONN;
+			result.bytes_xferd = 0;
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		}
 
 		/* Set channel state to STOP */
 		mhi_chan->state = MHI_CH_STATE_STOP;
@@ -235,9 +237,11 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 		mhi_ep_ring_reset(mhi_cntrl, ch_ring);
 
 		/* Send channel disconnect status to client driver */
-		result.transaction_status = -ENOTCONN;
-		result.bytes_xferd = 0;
-		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		if (mhi_chan->xfer_cb) {
+			result.transaction_status = -ENOTCONN;
+			result.bytes_xferd = 0;
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+		}
 
 		/* Set channel state to DISABLED */
 		mhi_chan->state = MHI_CH_STATE_DISABLED;
-- 
2.25.1

