Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48E53BA
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 12:45:14 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id t5so1990799pfg.4
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 04:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OzxxAcSZ3QzNXpGWZ3mCL6qTxkzBqAQS2IireUric5Y=;
        b=xgkTzjwKHjrxOUhcXl++/6hx3IKreYJSI//ey+ZlPw03zUhNl2niilRYFaczu95rcW
         AWuteZKexkELRFd7h0xhW7sqo9DOlfpfvAvARsUlcZ/YBHN3q0t/dcrTw0O37/8e7iSF
         hPbYqQXEyW2nfsIeOjIP10bavbS73C6NVC3yFZvO4+W/HvZDHYAQB8XQ2fqZUsj6D30G
         7QmjoreE/xo7Dqp2H/z6zMb8ndarXQCJPpLsMsW/CZYb41RIO4Ji3EpEB6J1OvrcPpQ2
         Eo1TwOsr3+NE8lciVmrAbgAkIiFj2iPljp3Wfn+rCj4DnT1ZQnA/i/zwXNSpv/l0FBCU
         uLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzxxAcSZ3QzNXpGWZ3mCL6qTxkzBqAQS2IireUric5Y=;
        b=bM7x+mnqWpxAar8yG4qOQCkXwDsrXdZNI2r8OKnhJsbJIFCO2X6JCy408Nxl/Keiba
         OpZtMqS+hlR+qFOiOPCK4/1hu4KLEc5jPNDBGY1G5Aiz8xasxGjEvkoP7F69SmO5Q5NX
         mcAVE51s1e1T7ZbHHcgT7CbclGSfuQYsCubEDWA18s86AOsnQL8F6EkkafX63ADgbtKn
         ooNmch376yGZNeWWTt1RB7ji3Bf1bB2hEqd4lq0bSCghSv/RCazLwfYzeWMH3gm76mMK
         2YaoMuhgfbi+O+VARX4mL3Y54+zmHf3kJThGDAiF+SocsbbLO1CCDTTgEO2QiMtmH/uA
         IDtA==
X-Gm-Message-State: AOAM532LIQ0AttWshICpTi0KJ2xgF9Z8KNtPJ9pF7LGvUK+bJ6hcfnKB
	seUvryaP7mQ/Ww/CpHorg/VVshAz1wBh
X-Google-Smtp-Source: ABdhPJz9UF9zFkFSbdhTGwhnqmGMLsMZbC70CUVHi2Y5xxs5dgqdzgDn6e9K6ZsOkObqNKGzTI6Iwg==
X-Received: by 2002:a65:52cc:0:b0:374:3ee6:c632 with SMTP id z12-20020a6552cc000000b003743ee6c632mr16912963pgp.91.1646052313523;
        Mon, 28 Feb 2022 04:45:13 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:45:13 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 14/27] bus: mhi: ep: Add support for ring management
Date: Mon, 28 Feb 2022 18:13:31 +0530
Message-Id: <20220228124344.77359-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for managing the MHI ring. The MHI ring is a circular queue
of data structures used to pass the information between host and the
endpoint.

MHI support 3 types of rings:

1. Transfer ring
2. Event ring
3. Command ring

All rings reside inside the host memory and the MHI EP device maps it to
the device memory using blocks like PCIe iATU. The mapping is handled in
the MHI EP controller driver itself.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/Makefile   |   2 +-
 drivers/bus/mhi/ep/internal.h |  18 ++++
 drivers/bus/mhi/ep/ring.c     | 197 ++++++++++++++++++++++++++++++++++
 3 files changed, 216 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bus/mhi/ep/ring.c

diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
index a1555ae287ad..7ba0e04801eb 100644
--- a/drivers/bus/mhi/ep/Makefile
+++ b/drivers/bus/mhi/ep/Makefile
@@ -1,2 +1,2 @@
 obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
-mhi_ep-y := main.o mmio.o
+mhi_ep-y := main.o mmio.o ring.o
diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index 139e939fcf57..b3b8770f2f4e 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -114,6 +114,11 @@ union mhi_ep_ring_ctx {
 	struct mhi_generic_ctx generic;
 };
 
+struct mhi_ep_ring_item {
+	struct list_head node;
+	struct mhi_ep_ring *ring;
+};
+
 struct mhi_ep_ring {
 	struct mhi_ep_cntrl *mhi_cntrl;
 	union mhi_ep_ring_ctx *ring_ctx;
@@ -126,6 +131,9 @@ struct mhi_ep_ring {
 	u32 db_offset_h;
 	u32 db_offset_l;
 	u32 ch_id;
+	u32 er_index;
+	u32 irq_vector;
+	bool started;
 };
 
 struct mhi_ep_cmd {
@@ -151,6 +159,16 @@ struct mhi_ep_chan {
 	bool skip_td;
 };
 
+/* MHI Ring related functions */
+void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id);
+void mhi_ep_ring_reset(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring);
+int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
+		      union mhi_ep_ring_ctx *ctx);
+size_t mhi_ep_ring_addr2offset(struct mhi_ep_ring *ring, u64 ptr);
+int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *element);
+void mhi_ep_ring_inc_index(struct mhi_ep_ring *ring);
+int mhi_ep_update_wr_offset(struct mhi_ep_ring *ring);
+
 /* MMIO related functions */
 u32 mhi_ep_mmio_read(struct mhi_ep_cntrl *mhi_cntrl, u32 offset);
 void mhi_ep_mmio_write(struct mhi_ep_cntrl *mhi_cntrl, u32 offset, u32 val);
diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
new file mode 100644
index 000000000000..1029eed2cc28
--- /dev/null
+++ b/drivers/bus/mhi/ep/ring.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/mhi_ep.h>
+#include "internal.h"
+
+size_t mhi_ep_ring_addr2offset(struct mhi_ep_ring *ring, u64 ptr)
+{
+	return (ptr - ring->rbase) / sizeof(struct mhi_ring_element);
+}
+
+static u32 mhi_ep_ring_num_elems(struct mhi_ep_ring *ring)
+{
+	return le64_to_cpu(ring->ring_ctx->generic.rlen) / sizeof(struct mhi_ring_element);
+}
+
+void mhi_ep_ring_inc_index(struct mhi_ep_ring *ring)
+{
+	ring->rd_offset = (ring->rd_offset + 1) % ring->ring_size;
+}
+
+static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
+{
+	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	size_t start, copy_size;
+	int ret;
+
+	/* Don't proceed in the case of event ring. This happens during mhi_ep_ring_start(). */
+	if (ring->type == RING_TYPE_ER)
+		return 0;
+
+	/* No need to cache the ring if write pointer is unmodified */
+	if (ring->wr_offset == end)
+		return 0;
+
+	start = ring->wr_offset;
+	if (start < end) {
+		copy_size = (end - start) * sizeof(struct mhi_ring_element);
+		ret = mhi_cntrl->read_from_host(mhi_cntrl, ring->rbase +
+						(start * sizeof(struct mhi_ring_element)),
+						&ring->ring_cache[start], copy_size);
+		if (ret < 0)
+			return ret;
+	} else {
+		copy_size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
+		ret = mhi_cntrl->read_from_host(mhi_cntrl, ring->rbase +
+						(start * sizeof(struct mhi_ring_element)),
+						&ring->ring_cache[start], copy_size);
+		if (ret < 0)
+			return ret;
+
+		if (end) {
+			ret = mhi_cntrl->read_from_host(mhi_cntrl, ring->rbase,
+							&ring->ring_cache[0],
+							end * sizeof(struct mhi_ring_element));
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end, copy_size);
+
+	return 0;
+}
+
+static int mhi_ep_cache_ring(struct mhi_ep_ring *ring, u64 wr_ptr)
+{
+	size_t wr_offset;
+	int ret;
+
+	wr_offset = mhi_ep_ring_addr2offset(ring, wr_ptr);
+
+	/* Cache the host ring till write offset */
+	ret = __mhi_ep_cache_ring(ring, wr_offset);
+	if (ret)
+		return ret;
+
+	ring->wr_offset = wr_offset;
+
+	return 0;
+}
+
+int mhi_ep_update_wr_offset(struct mhi_ep_ring *ring)
+{
+	u64 wr_ptr;
+
+	wr_ptr = mhi_ep_mmio_get_db(ring);
+
+	return mhi_ep_cache_ring(ring, wr_ptr);
+}
+
+/* TODO: Support for adding multiple ring elements to the ring */
+int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *el)
+{
+	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	size_t old_offset = 0;
+	u32 num_free_elem;
+	int ret;
+
+	ret = mhi_ep_update_wr_offset(ring);
+	if (ret) {
+		dev_err(dev, "Error updating write pointer\n");
+		return ret;
+	}
+
+	if (ring->rd_offset < ring->wr_offset)
+		num_free_elem = (ring->wr_offset - ring->rd_offset) - 1;
+	else
+		num_free_elem = ((ring->ring_size - ring->rd_offset) + ring->wr_offset) - 1;
+
+	/* Check if there is space in ring for adding at least an element */
+	if (!num_free_elem) {
+		dev_err(dev, "No space left in the ring\n");
+		return -ENOSPC;
+	}
+
+	old_offset = ring->rd_offset;
+	mhi_ep_ring_inc_index(ring);
+
+	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
+
+	/* Update rp in ring context */
+	ring->ring_ctx->generic.rp = cpu_to_le64((ring->rd_offset * sizeof(*el)) + ring->rbase);
+
+	ret = mhi_cntrl->write_to_host(mhi_cntrl, el, ring->rbase + (old_offset * sizeof(*el)),
+				       sizeof(*el));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
+{
+	ring->type = type;
+	if (ring->type == RING_TYPE_CMD) {
+		ring->db_offset_h = EP_CRDB_HIGHER;
+		ring->db_offset_l = EP_CRDB_LOWER;
+	} else if (ring->type == RING_TYPE_CH) {
+		ring->db_offset_h = CHDB_HIGHER_n(id);
+		ring->db_offset_l = CHDB_LOWER_n(id);
+		ring->ch_id = id;
+	} else {
+		ring->db_offset_h = ERDB_HIGHER_n(id);
+		ring->db_offset_l = ERDB_LOWER_n(id);
+	}
+}
+
+int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
+			union mhi_ep_ring_ctx *ctx)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret;
+
+	ring->mhi_cntrl = mhi_cntrl;
+	ring->ring_ctx = ctx;
+	ring->ring_size = mhi_ep_ring_num_elems(ring);
+	ring->rbase = le64_to_cpu(ring->ring_ctx->generic.rbase);
+
+	if (ring->type == RING_TYPE_CH)
+		ring->er_index = le32_to_cpu(ring->ring_ctx->ch.erindex);
+
+	if (ring->type == RING_TYPE_ER)
+		ring->irq_vector = le32_to_cpu(ring->ring_ctx->ev.msivec);
+
+	/* During ring init, both rp and wp are equal */
+	ring->rd_offset = mhi_ep_ring_addr2offset(ring, le64_to_cpu(ring->ring_ctx->generic.rp));
+	ring->wr_offset = mhi_ep_ring_addr2offset(ring, le64_to_cpu(ring->ring_ctx->generic.rp));
+
+	/* Allocate ring cache memory for holding the copy of host ring */
+	ring->ring_cache = kcalloc(ring->ring_size, sizeof(struct mhi_ring_element), GFP_KERNEL);
+	if (!ring->ring_cache)
+		return -ENOMEM;
+
+	ret = mhi_ep_cache_ring(ring, le64_to_cpu(ring->ring_ctx->generic.wp));
+	if (ret) {
+		dev_err(dev, "Failed to cache ring\n");
+		kfree(ring->ring_cache);
+		return ret;
+	}
+
+	ring->started = true;
+
+	return 0;
+}
+
+void mhi_ep_ring_reset(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring)
+{
+	ring->started = false;
+	kfree(ring->ring_cache);
+	ring->ring_cache = NULL;
+}
-- 
2.25.1

