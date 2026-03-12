Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B20F39A81B
	for <mhi@lists.linux.dev>; Thu, 12 Mar 2026 04:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291581; cv=none; b=C55woCUKUYxJ7OmTLHRXCl34DIdNDcIT6uIuSdqNYB/kuER8rorhnlIDlw1Je1yU+HrDm0sudzlshMd+g7Z+knk6MqAbeD97S+Y4tDRlSUEsQgnyniZR/zvUHtlSooXouSZOy2T6XgnflnSvGFCpo29KYKVWS0coJA4oiyz+6Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291581; c=relaxed/simple;
	bh=70BeD1knxFPBhbOveZaJ78TQk69t5SY8pDh27xzK/l0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+n7/OEjE+kpiCangLGBDRIdVOaqBqfX0w1x0nsXcewmEcrDnh3sYqj+eMRFUPMJ108Z35kGhhtmrIzxTpzubd7fod6pJL/URKGYre+uWNUbdNiR0SxGKQjGOoLTzqyypPzSXPRCyJmzfqUgQrzrL3U4sTrvb6s+PsBS2iwfn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUU0EOiE; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUU0EOiE"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c73ba417c6eso217968a12.3
        for <mhi@lists.linux.dev>; Wed, 11 Mar 2026 21:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773291579; x=1773896379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjiMf+HrHgumtDrytCb9PW5t02HTgkYKwwniQ8SZW0c=;
        b=IUU0EOiE44reM9N33HAc1WkE/fOhwRhYSl4wiV+h7LaU9w03WnYaCAievL0QJxOL2E
         0TrXGs1Cv5kXw1lAf4Mb01cbz8TjsF3cTL8h0llzwUKLw20fUiuJzegsX8yES0a7A99X
         l7nup8efZasWyvZlO1xtNpBfErKeas3h6r4BYaLDmPUrCuQ4E80P9uF00MM1EUp5gK8f
         6M5oTYmsI5J2RESRrEFC+62rTfdBJSamKnxrkkVZGzuOsJlC/TRM3fBhilyuSQdtzQmB
         1AABET6FdzVofuOoiTqBucB7wbauUK2ey3yc/UKpuDEX+tw3p5GZP0I7WONM01V25WZh
         YzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773291579; x=1773896379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjiMf+HrHgumtDrytCb9PW5t02HTgkYKwwniQ8SZW0c=;
        b=ZYCVwFqvWqS1b6xP2OdsshT3Wm3VazLrnl/KFta1dNd58w4EQfn4BS5rgzpCoNW0ur
         dT2+GRaGjdw15Q/TDLPwcx33/gCJo69Gvk9gMA5Q2/nrs1ciSLr6XQc0AE3JBv7rYIB7
         wTg5h1rpKhexId2h6aFPQ8RPpwJRUSRgb4SJqW8PUsH8cd1q9u25F5tQGCnEMMeO0dW4
         FD8DW1YwoFBh4bhq2GiAy/kgXRbaSBF29iIl55jN6PWrKbCL41kyq4uwbU3ejln/qEYP
         IfpQ8p+uOLodbz9Wtpu1vjIn8R0ZP4syZ6Nfg3kJLCCTbUGapway+d2BywwG25Tb4K33
         LjSg==
X-Gm-Message-State: AOJu0YzKFVffiPVznZKbamqt6pyLllG/EDkxcWFumx4zCRxqcjwDhx3u
	3aylJ98BdSDPKAjyXbui5bZhhRXxVoh93DhVvTPLGwkx6CFzcACHAtE2sMcdkIa6
X-Gm-Gg: ATEYQzyzgy64CZctkw+yR1i2rGrea4Jtfh+aXngH0t7/9ymv85uZS+58n64A8vSNw/w
	tcWwhbIFcX6FyARx1lJDRCoyTNwhHDYof9WXRUVczVNpX9tqBxy/82n3JzvwTNkoPaQlH0y93Ih
	iwKsM10objBJewnW/FXkPtcJb1/d3XHCpIh5PLaRWANg8RAFg9QIg8jLyjgJLFJr2REF7ZxDgq5
	urETimUUqNXJi8oG9nYBCz1Zuk5zf7djkSAiBbetWIFLFbDK1+uCfuWQD/BWoCIiVAZWCYek/q+
	yLd+NecvOH8FrPNallt4WhwACa2MHRxx7ebPop17rE1DlAjEhslqfOKOK9vSKu7yL3XljP9Mhvx
	1ECFdxcUn4lYxIL1aKx4tU4DD7Yfb1uw/C/Y3oJWBFSfSEYWVzfmXj43P7YVEJl1OBm59mq32RC
	jhLRXyakRmAOsm/C+KzKEnEyo/JvMN7AQAJPHCWMkMOF+n5b9OaywNnw==
X-Received: by 2002:a17:902:ea11:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2aeb991a868mr25734465ad.42.1773291579268;
        Wed, 11 Mar 2026 21:59:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae255a05sm55804755ad.36.2026.03.11.21.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:59:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: mhi@lists.linux.dev
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:MHI BUS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] bus: mhi: use kzalloc_flex
Date: Wed, 11 Mar 2026 21:59:21 -0700
Message-ID: <20260312045921.7663-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change kzalloc + kcalloc to just kzalloc with a flexible array member.

Add __counted_by for extra runtime analysis when requested.

Move counting assignment immediately after allocation as required by
__counted_by.

Move mhi_buf definition as a complete definition is needed for flex
arrays. It's not a pointer anymore.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/bus/mhi/host/boot.c | 20 +++-----------------
 include/linux/mhi.h         | 34 +++++++++++++++++-----------------
 2 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index f16a1e67a667..e1d77cecd75e 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -333,15 +333,10 @@ static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
 	struct image_info *img_info;
 	struct mhi_buf *mhi_buf;
 
-	img_info = kzalloc_obj(*img_info);
+	img_info = kzalloc_flex(*img_info, mhi_buf, 1);
 	if (!img_info)
 		return -ENOMEM;
 
-	/* Allocate memory for entry */
-	img_info->mhi_buf = kzalloc_obj(*img_info->mhi_buf);
-	if (!img_info->mhi_buf)
-		goto error_alloc_mhi_buf;
-
 	/* Allocate and populate vector table */
 	mhi_buf = img_info->mhi_buf;
 
@@ -358,8 +353,6 @@ static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
 	return 0;
 
 error_alloc_segment:
-	kfree(mhi_buf);
-error_alloc_mhi_buf:
 	kfree(img_info);
 
 	return -ENOMEM;
@@ -375,14 +368,11 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	struct image_info *img_info;
 	struct mhi_buf *mhi_buf;
 
-	img_info = kzalloc_obj(*img_info);
+	img_info = kzalloc_flex(*img_info, mhi_buf, segments);
 	if (!img_info)
 		return -ENOMEM;
 
-	/* Allocate memory for entries */
-	img_info->mhi_buf = kzalloc_objs(*img_info->mhi_buf, segments);
-	if (!img_info->mhi_buf)
-		goto error_alloc_mhi_buf;
+	img_info->entries = segments;
 
 	/* Allocate and populate vector table */
 	mhi_buf = img_info->mhi_buf;
@@ -402,7 +392,6 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	}
 
 	img_info->bhi_vec = img_info->mhi_buf[segments - 1].buf;
-	img_info->entries = segments;
 	*image_info = img_info;
 
 	return 0;
@@ -411,9 +400,6 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
 		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
 				  mhi_buf->buf, mhi_buf->dma_addr);
-	kfree(img_info->mhi_buf);
-
-error_alloc_mhi_buf:
 	kfree(img_info);
 
 	return -ENOMEM;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 88ccb3e14f48..fb3ba639f4f8 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -85,17 +85,33 @@ enum mhi_ch_type {
 	MHI_CH_TYPE_INBOUND_COALESCED = 3,
 };
 
+/**
+ * struct mhi_buf - MHI Buffer description
+ * @buf: Virtual address of the buffer
+ * @name: Buffer label. For offload channel, configurations name must be:
+ *        ECA - Event context array data
+ *        CCA - Channel context array data
+ * @dma_addr: IOMMU address of the buffer
+ * @len: # of bytes
+ */
+struct mhi_buf {
+	void *buf;
+	const char *name;
+	dma_addr_t dma_addr;
+	size_t len;
+};
+
 /**
  * struct image_info - Firmware and RDDM table
  * @mhi_buf: Buffer for firmware and RDDM table
  * @entries: # of entries in table
  */
 struct image_info {
-	struct mhi_buf *mhi_buf;
 	/* private: from internal.h */
 	struct bhi_vec_entry *bhi_vec;
 	/* public: */
 	u32 entries;
+	struct mhi_buf mhi_buf[] __counted_by(entries);
 };
 
 /**
@@ -488,22 +504,6 @@ struct mhi_result {
 	int transaction_status;
 };
 
-/**
- * struct mhi_buf - MHI Buffer description
- * @buf: Virtual address of the buffer
- * @name: Buffer label. For offload channel, configurations name must be:
- *        ECA - Event context array data
- *        CCA - Channel context array data
- * @dma_addr: IOMMU address of the buffer
- * @len: # of bytes
- */
-struct mhi_buf {
-	void *buf;
-	const char *name;
-	dma_addr_t dma_addr;
-	size_t len;
-};
-
 /**
  * struct mhi_driver - Structure representing a MHI client driver
  * @probe: CB function for client driver probe function
-- 
2.53.0

