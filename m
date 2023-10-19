Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744A134BF
	for <mhi@lists.linux.dev>; Thu, 19 Oct 2023 08:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eDQgtOGz"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7781b176131so157978685a.1
        for <mhi@lists.linux.dev>; Thu, 19 Oct 2023 01:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697702962; x=1698307762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g17DNvDuwsvkatPfQSbF1sKHfBdyAlQw+IX3K/EwR5U=;
        b=eDQgtOGzwJDaaHM4dylSqOTaQoHDfT7gg6R+QIBOVKOPBNLXGkTrqeSGb/TGze4t5N
         HovHNYtMWvQ8z4xihxBD9dLTmkZ+2m9923emTm1iwvucUprqwnjJiuuBg2litriaCTSg
         VyP3SPBpd5YSp3f5DfvpbkHIuB7G6VEkrmFzKiKfIWGTV0lXYX6AlaQYJyeYGmVlXqOf
         K/PiYHDB0Nl8g74bLTzf6L0TJS9Lcz5fHY5sk0/nySqDWZzfDU9adWx+LOqlBzBxp52f
         l1G7NMpEOLo0iQKVN4Qg1ytSTSi4nvCIEmRDfQDdrR2KeKxO2LwU0CzByvUv1OT/ps4h
         Lwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702962; x=1698307762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g17DNvDuwsvkatPfQSbF1sKHfBdyAlQw+IX3K/EwR5U=;
        b=XiWjQ1vbnxLYOzWo8ZCJwQKO/oHXDQrASYwvK1Lea+QVqxWd61zMLHotoxsPKW23kD
         aRt5xcc4tacmyiBAWwI/avd8iPGMAMvWonXYOJFtbT5by718dUFoV0bDEFJZyXBzFdh9
         b0mxq82rErm1y0RlDxjGQwMqH7DipnNpXcHS18V1qwheX0bQp7vZ+S5CUd06I+90A2Ol
         BwxNo5etvCAv52gQVA/KV0mgk5vOUKSk7xoTPOhkYt552hSAn4Ecr9Q2T7bjFB4TES57
         tqg0HEVDUU6qDsmcbWLdSuFRhj/UcnIpv2D8ZSZTmUYa9XkjUPGZYShmj/mhuC3mfIrn
         f6nA==
X-Gm-Message-State: AOJu0Yy/NBYyCWQKC+6Rkodc+Qh005FOoDbE3nuoaz7sQWGoxB4mxoD5
	46xknkkZI8aOLoHMfFXZCIDbvaLVhtUmo5N3mw==
X-Google-Smtp-Source: AGHT+IFVAMwbWArjNUqTZoAOuQleXKPUfyMwsHgWl3UXcVvb1tGg/tO0sR0kKy3KACX/kIEkab+49w==
X-Received: by 2002:a05:622a:83:b0:41b:8416:ea2a with SMTP id o3-20020a05622a008300b0041b8416ea2amr1895589qtw.40.1697702961759;
        Thu, 19 Oct 2023 01:09:21 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.25])
        by smtp.gmail.com with ESMTPSA id bq15-20020a05622a1c0f00b0041520676966sm573553qtb.47.2023.10.19.01.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:09:21 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: ep: Add support for interrupt moderation timer
Date: Thu, 19 Oct 2023 13:39:11 +0530
Message-Id: <20231019080911.57938-1-manivannan.sadhasivam@linaro.org>
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
index 834e7afadd64..78559a995b25 100644
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
+			cancel_delayed_work(&ring->intmod_work);
+
 		mhi_cntrl->raise_irq(mhi_cntrl, ring->irq_vector);
+	} else if (ring->intmodt && !READ_ONCE(ring->irq_pending)) {
+		WRITE_ONCE(ring->irq_pending, true);
+		schedule_delayed_work(&ring->intmod_work, msecs_to_jiffies(ring->intmodt));
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
-- 
2.25.1

