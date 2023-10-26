Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9A8F47
	for <mhi@lists.linux.dev>; Thu, 26 Oct 2023 04:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lm/AL3uv"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27d8e2ac2b1so340790a91.2
        for <mhi@lists.linux.dev>; Wed, 25 Oct 2023 21:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698296119; x=1698900919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pt9Dt+M5cqD+vX+u8z8XsQMJi/gjZagBNhhPpDmywM=;
        b=Lm/AL3uvhIJeii2LUF8/lQ6jpBReF68adyH4ets4RJrI6uiMohgj0J1SJd3vnlBnUk
         EQNc4D/Ok1gnziqw9jV8c53zTP+QluoXmqleMzjzFEkRH9u7epYFUuh4Bn8bxDD66BUb
         j6mToUVZj0v3vwGj3dhz5hpHafjp8bZv9dt/GhDLvrWeFVRG6LNGbilpLdOMNKncfA6x
         SxXfb1MRfeFS5fIkA1LAY469lKpfSeqD30eKpyTYAZJjp/Bd9vjnuDsebN+cOdog3dpm
         vf8Hh4sT71XJEWO7O2aEu7k/YJDzG2qV2T5hh5R1NfhgWi6g7CO5+nxy9baTmv2a/q9B
         DvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698296119; x=1698900919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pt9Dt+M5cqD+vX+u8z8XsQMJi/gjZagBNhhPpDmywM=;
        b=ay0GEwoAQ+K9tH92zqHrSAHBIQnLu0KVc4slSBvQa9Jabav0CFVe/J25oK6G95veEY
         NyCeLiObSsNpGHvUUQ0gSLTFmw+6I6lfbX6iqiLqr9G8agXkJPjzV9svhH98tVTLZAoj
         zXrZcCvR+J7rVmHxHrr0ouBQXJCLiXJFEBIlOhWTeIPC7sVUrAuns8HUzckzYzyLC5kO
         A8IV/EzAvzMZW4YuR2zqClC8FPrf8qfdAtEWS3UswftV8w5zZH12NQiqNeHjAkRyfRWa
         j5AZoGs7+7U5X+Mf6Zvxrk7Op88rwTSFNvpquXq8uXlzD3p4cnOz7tHDcru/pvUkYn/l
         R5fA==
X-Gm-Message-State: AOJu0YwmEUQIh3zFHsrzQl3po8BkuEHyXhzH1rlkWqa9PVwn6P9fht2J
	Wa1qxVOYp4HmvVdnW5ifkp6ece8wvIvz+GOekg==
X-Google-Smtp-Source: AGHT+IGH5YwRzFY52rgnvnzSg5DY2VMsp03WcqH7SiHCYs+p66pVT697qQHpImfoKbqhPSxvzcLyEQ==
X-Received: by 2002:a17:90b:28c3:b0:27d:c36:e134 with SMTP id qj3-20020a17090b28c300b0027d0c36e134mr13144796pjb.42.1698296119397;
        Wed, 25 Oct 2023 21:55:19 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.120])
        by smtp.gmail.com with ESMTPSA id t16-20020a17090aba9000b00267b38f5e13sm710619pjr.2.2023.10.25.21.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 21:55:17 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] bus: mhi: ep: Add support for interrupt moderation timer
Date: Thu, 26 Oct 2023 10:25:13 +0530
Message-Id: <20231026045513.12981-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MHI spec defines the interrupt moderation timer feature using which the
host can limit the number of interrupts being raised for an event ring by
the device. This feature allows the host to process multiple event ring
elements by a single IRQ from the device, thereby eliminating the need to
process IRQ for each element.

The INTMODT field in the event context array provides the value to be used
for delaying the IRQ generation from device. This value, along with the
Block Event Interrupt (BEI) flag of the TRE defines how IRQ is generated to
the host.

Support for interrupt moderation timer is implemented using delayed
workqueue in kernel. And a separate delayed work item is used for each
event ring.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Fixed the build issue reported by Kbuild bot.

 drivers/bus/mhi/ep/internal.h |  3 +++
 drivers/bus/mhi/ep/main.c     | 22 +++++++++++++++++++---
 drivers/bus/mhi/ep/ring.c     | 19 ++++++++++++++++++-
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index a2125fa5fe2f..8c5cf2b67951 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -126,6 +126,7 @@ struct mhi_ep_ring {
 	union mhi_ep_ring_ctx *ring_ctx;
 	struct mhi_ring_element *ring_cache;
 	enum mhi_ep_ring_type type;
+	struct delayed_work intmodt_work;
 	u64 rbase;
 	size_t rd_offset;
 	size_t wr_offset;
@@ -135,7 +136,9 @@ struct mhi_ep_ring {
 	u32 ch_id;
 	u32 er_index;
 	u32 irq_vector;
+	u32 intmodt;
 	bool started;
+	bool irq_pending;
 };
 
 struct mhi_ep_cmd {
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e2513f5f47a6..c06111045a84 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -54,11 +54,27 @@ static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
 	mutex_unlock(&mhi_cntrl->event_lock);
 
 	/*
-	 * Raise IRQ to host only if the BEI flag is not set in TRE. Host might
-	 * set this flag for interrupt moderation as per MHI protocol.
+	 * As per the MHI specification, section 4.3, Interrupt moderation:
+	 *
+	 * 1. If BEI flag is not set, cancel any pending intmodt work if started
+	 * for the event ring and raise IRQ immediately.
+	 *
+	 * 2. If both BEI and intmodt are set, and if no IRQ is pending for the
+	 * same event ring, start the IRQ delayed work as per the value of
+	 * intmodt. If previous IRQ is pending, then do nothing as the pending
+	 * IRQ is enough for the host to process the current event ring element.
+	 *
+	 * 3. If BEI is set and intmodt is not set, no need to raise IRQ.
 	 */
-	if (!bei)
+	if (!bei) {
+		if (READ_ONCE(ring->irq_pending))
+			cancel_delayed_work(&ring->intmodt_work);
+
 		mhi_cntrl->raise_irq(mhi_cntrl, ring->irq_vector);
+	} else if (ring->intmodt && !READ_ONCE(ring->irq_pending)) {
+		WRITE_ONCE(ring->irq_pending, true);
+		schedule_delayed_work(&ring->intmodt_work, msecs_to_jiffies(ring->intmodt));
+	}
 
 	return 0;
 
diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 115518ec76a4..a1071c13761b 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -157,6 +157,15 @@ void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32
 	}
 }
 
+static void mhi_ep_raise_irq(struct work_struct *work)
+{
+	struct mhi_ep_ring *ring = container_of(work, struct mhi_ep_ring, intmodt_work.work);
+	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
+
+	mhi_cntrl->raise_irq(mhi_cntrl, ring->irq_vector);
+	WRITE_ONCE(ring->irq_pending, false);
+}
+
 int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 			union mhi_ep_ring_ctx *ctx)
 {
@@ -173,8 +182,13 @@ int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 	if (ring->type == RING_TYPE_CH)
 		ring->er_index = le32_to_cpu(ring->ring_ctx->ch.erindex);
 
-	if (ring->type == RING_TYPE_ER)
+	if (ring->type == RING_TYPE_ER) {
 		ring->irq_vector = le32_to_cpu(ring->ring_ctx->ev.msivec);
+		ring->intmodt = FIELD_GET(EV_CTX_INTMODT_MASK,
+					  le32_to_cpu(ring->ring_ctx->ev.intmod));
+
+		INIT_DELAYED_WORK(&ring->intmodt_work, mhi_ep_raise_irq);
+	}
 
 	/* During ring init, both rp and wp are equal */
 	memcpy_fromio(&val, (void __iomem *) &ring->ring_ctx->generic.rp, sizeof(u64));
@@ -201,6 +215,9 @@ int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 
 void mhi_ep_ring_reset(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring)
 {
+	if (ring->type == RING_TYPE_ER)
+		cancel_delayed_work_sync(&ring->intmodt_work);
+
 	ring->started = false;
 	kfree(ring->ring_cache);
 	ring->ring_cache = NULL;

base-commit: 12606ba1d46b34a241eb3d0956727e5379f0f626
-- 
2.25.1

