Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97C1C08
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:17:36 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id u7so16419029plq.11
        for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+iHQs4uPoFa0chr8duXApXo2zq9mEU5tnmcTMS1VXc=;
        b=RZ9ntAEHz2cR92CulW8lqRm6cxZJBAiKx+fRYPDJVU6e2bgPGYAIzC1QzJqFRS8YW3
         FBA0rLpwRw/eUM3a6OJPyRUCmXpcdIWMPxR0wvrHy6EdQdtPZ6UUqHcSSDnG4LV3Rjzo
         gXCZ2oHxfUau2UB6QYgeMhS2RUny2GUcEj0/JNeRbqu/6UMEmoG24BSh64+fQ4T2Ra5E
         bs4k+WEFf2vUdGalc9kF/ZxE0bv7B234oYBb6BJKM+fOBoa77eAgWdIujcuDIzq9tu2S
         LI0Rt5j5EdRQ8BxOSUWXvBmDvuSdDUDfw/xi/OZV/y31G6FDeB3WhF3Wj049evchny7y
         XwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+iHQs4uPoFa0chr8duXApXo2zq9mEU5tnmcTMS1VXc=;
        b=qeoyWBKbwn/2AYb68xxN2Mgj8vRHbqg//Z9K13A4g+aT8ol0Kg9BozcOpRaDfo81ap
         ceQxraI+eFz3JTgK4CR6NQZiUGX9oaWih+cDygcrb9YwYreVnmqnjYRpoW4A5pl7JKzm
         FBCFoD9xNpBfTxL3Zrq1wXswmElgLoz1F3NUwNerAgMyBwQZ28jDJYCDMAMMP3+PIfvA
         5Pd56q5uoh7Y6AjpPVljOznBeoDvPCrH0iw39jZ5RBPqrNe2KyzhlJ4nD05VoKYdVy1C
         ylqwauQHcyGBEjvdt5R1F/+cG7yHty4kYb0WQsQTnt64JaQJw2oJYHrMMgCrTMKQGb6y
         gVdg==
X-Gm-Message-State: AFqh2krW6Qm9+Qk632kHGyuYznkr4Rya+5BN9Fc1AQR/ie7/B2r5O0I5
	z8LjoipB77FEDeXtzF3GMJI509zk409KC/Y=
X-Google-Smtp-Source: AMrXdXvMD9P/xlFzXn30LDNXalC1ybtN/BG+KRBU6C6L+w65aD8UdblWVHgdDVnQt/Sr6+JRm4kDxQ==
X-Received: by 2002:a17:903:2781:b0:189:c3ef:c759 with SMTP id jw1-20020a170903278100b00189c3efc759mr29247326plb.68.1672244255068;
        Wed, 28 Dec 2022 08:17:35 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:34 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 5/6] bus: mhi: ep: Move chan->lock to the start of processing queued ch ring
Date: Wed, 28 Dec 2022 21:47:03 +0530
Message-Id: <20221228161704.255268-6-manivannan.sadhasivam@linaro.org>
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

There is a good chance that while the channel ring gets processed, the STOP
or RESET command for the channel might be received from the MHI host. In
those cases, the entire channel ring processing needs to be protected by
chan->lock to prevent the race where the corresponding channel ring might
be reset.

While at it, let's also add a sanity check to make sure that the ring is
started before processing it. Because, if the STOP/RESET command gets
processed while mhi_ep_ch_ring_worker() waited for chan->lock, the ring
would've been reset.

Cc: <stable@vger.kernel.org> # 5.19
Fixes: 03c0bb8ec983 ("bus: mhi: ep: Add support for processing channel rings")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 0bce6610ebf1..2362fcc8b32c 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -730,24 +730,37 @@ static void mhi_ep_ch_ring_worker(struct work_struct *work)
 		list_del(&itr->node);
 		ring = itr->ring;
 
+		chan = &mhi_cntrl->mhi_chan[ring->ch_id];
+		mutex_lock(&chan->lock);
+
+		/*
+		 * The ring could've stopped while we waited to grab the (chan->lock), so do
+		 * a sanity check before going further.
+		 */
+		if (!ring->started) {
+			mutex_unlock(&chan->lock);
+			kfree(itr);
+			continue;
+		}
+
 		/* Update the write offset for the ring */
 		ret = mhi_ep_update_wr_offset(ring);
 		if (ret) {
 			dev_err(dev, "Error updating write offset for ring\n");
+			mutex_unlock(&chan->lock);
 			kfree(itr);
 			continue;
 		}
 
 		/* Sanity check to make sure there are elements in the ring */
 		if (ring->rd_offset == ring->wr_offset) {
+			mutex_unlock(&chan->lock);
 			kfree(itr);
 			continue;
 		}
 
 		el = &ring->ring_cache[ring->rd_offset];
-		chan = &mhi_cntrl->mhi_chan[ring->ch_id];
 
-		mutex_lock(&chan->lock);
 		dev_dbg(dev, "Processing the ring for channel (%u)\n", ring->ch_id);
 		ret = mhi_ep_process_ch_ring(ring, el);
 		if (ret) {
-- 
2.25.1

