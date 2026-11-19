Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107876;
	b=dwJL3IXeGo1JzUuDpsJNQ39woJlCrHhl/zYwk9IAkCJcU9z0aJstkfcKIVGLXwy0gO0w
	 PO7MrDu1gUtxlfS3MG7gBv6QGKxoh+DI9rMRii4hEtr8uhUoRkzM2fAJpXPLFdW9jA+UC
	 UgdDBDKek/65LxhMRCeA+lo76GTBv2Ty/ZvJOmWZleY4U0neFOR9qwQ4VDVFe13xKmW2o
	 YnxOzOHymhDvjouxqZovfgUskhuRmET0Kz4EZ71XPzJu+1D3BY1M7P0CZUz5LwaODqw0w
	 Ge7ZNBAbwpdHt1Qcp4Y/JU2C0oqrUPlSo81MuKC/M0vsEK9o0t3AnkMIHCS3LO/2nUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
	b=46nLqho5ODYHheIGT7LLKn5+Q6S4f50TBNtuKD4iHxHoPUpf4PajDtceXC70d/u9lULE
	 knAqtHrSmgXUg/3kUYIhU6Lz32i4WgDPGYlnuGZ1XPmgH/RBg+BAK7hEJg/VcdtdbtXoY
	 wdqqB+NoJqQHlYdD/9PjT6tcVcURSfg/wcCsiHuKmGf9OTJnAeDg5XnPKgIoJ7ryYfGX+
	 Kq3nCgXwAM0eoaLGZkOoKDldpuYkl/81XN8x6HLroF0o5QCZxBxlj9JI98ffmSgsTgUzk
	 NnDbavQY5LJcKvqzBLvYHrweIgOB+sCsjj9q+eVrw1L1YCiqf1eglkhz2AvPRe+3yNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Lbv0sE/1";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162060A262E
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 17:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F162060A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lbv0sE/1
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3821eb27024so3084323eec.1
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 09:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107875; x=1795712675; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=Lbv0sE/1fYBw2iUOD5B9gOzwvZ/VES7HXg74bA2ECUcqxUsPiLzpY3gm4mg9fF6sn3
         O/L9Bo+GVEaz2Lj+4imNo5ylN5qxwoPH1p6PFlvxvNGJL7ZNfmCaRIiaRYrmbuKSVyRa
         Wn8EAW6ft+jyBQ6Y6FU+O+N+leqRsRthNujd9NHO3/Id12dizJzUdlM025XTBEXCuUfI
         HtFXXpDgbwzZZ0CUuANpOjjy4y+6pUXOBmbl0vUaYdApSrU9cW7jOna5OtRu7EICOuEG
         Jk/ohPLUYDe7rH0+duA0B65FsiTww7W2LqF9qODwZ5jwdptAbdpEa0zl7UVmoiADWoIr
         VOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107875; x=1795712675;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=mj6n0/PeoikdJZ3WIbeDNch32QM3andQUBdAUDIrPi7FrFyVEQJutwtS+Y2xw3gcOG
         pJEfMSmBl3oN1DAYv/jbZ0ttTLchEvfV+jx743rVkrflX6BUufugTVtOYVRmRHbc+yRU
         VkagQocNw1UdpH2Nmd9dlcMhVHVbZUm/b8bISeTaqfo4hCgXmrkAVzIzDzEmObg2+UAL
         ItDrW3mzlVPgcP2yTPcSYX4RDZF8Kh1hDN7kFPyH51dFyjBucJJauHpBKIIHcBXJpDS/
         S8Z4V6h2quZN/gip9KWO7zDa9onY24+9i0ylIoc+MD2zLri6C+vIBiabhxazoHKK59JX
         STtg==
X-Forwarded-Encrypted: i=1; AL+hErEs/gO2W+gdaXHKMLHSsaXv4bMeZvXrdtmBeHx8GAQfR+F7AY5H5VKx2pUdQKekdkr+WYU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8LOGBF1ED6CcMnjPLb8RdfbEJAFTBYc3TC26Ed/WWvAPUcP5NE
	03tnQPLB80XhswivCTzWFXbmBsztLV9eyl4R9boArUsTa3mQaBJe/Lm9oTPtGg+HM+2uFsC1OWq
	zbxPyrHSEaA==
X-Received: from dydd12.prod.google.com ([2002:a05:693c:61cc:b0:385:900:c492])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b594:b0:381:5fe2:8008
 with SMTP id 5a478bee46e88-38281eebbb1mr7411711eec.39.1795107874469; Thu, 19
 Nov 2026 09:04:34 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:24 -0800
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170424.1512172-1-irogers@google.com>
Subject: [PATCH] bus: mhi: host: Fix uninitialized status handling on BHI/BHIe
 read errors
From: Ian Rogers <irogers@google.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

mhi_download_rddm_image(), mhi_fw_load_bhie(), and mhi_fw_load_bhi()
poll BHI/BHIe status registers inside wait_event_timeout() using:

  mhi_read_reg_field(..., &status) || status

When mhi_read_reg_field() returns a non-zero error code before ever
writing *out, the short-circuit OR wakes wait_event_timeout() with a
positive return value while leaving status uninitialized on the stack:

- In mhi_fw_load_bhi(), only tx_status == BHI_STATUS_ERROR (0x3) is
  treated as an error after wait_event_timeout(), so any register read
  error where stack garbage is not 0x3 causes mhi_fw_load_bhi() to
  return 0 (success) despite failing to read BHI_STATUS.
- In mhi_download_rddm_image() and mhi_fw_load_bhie(), status is
  compared against BHIE_*_STATUS_XFER_COMPL (0x2), reading uninitialized
  stack memory if the first register read fails.

Initialize rx_status and tx_status to their *_RESET (0) constants and
require tx_status == BHI_STATUS_SUCCESS after a non-timeout wakeup in
mhi_fw_load_bhi() so register read failures reliably return -EIO while
genuine timeouts still return -ETIMEDOUT.

Found by enabling Clang's -Wconditional-uninitialized on an x86_64
allyesconfig build, with AI coding assistant help to audit the warning
and prepare the fix. Build-tested with Clang; not runtime-tested on MHI
hardware.

Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
Fixes: 6fdfdd27328c ("bus: mhi: core: Add support for downloading RDDM image during panic")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/bus/mhi/host/boot.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 19c84913cfb9..439bc9d0797f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -158,7 +158,7 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 rx_status;
+	u32 rx_status = BHIE_RXVECSTATUS_STATUS_RESET;
 
 	if (in_panic)
 		return __mhi_download_rddm_in_panic(mhi_cntrl);
@@ -213,7 +213,7 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
-	u32 tx_status, sequence_id;
+	u32 tx_status = BHIE_TXVECSTATUS_STATUS_RESET, sequence_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -261,7 +261,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	void __iomem *base = mhi_cntrl->bhi;
-	u32 tx_status, session_id;
+	u32 tx_status = BHI_STATUS_RESET, session_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -295,7 +295,10 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 		goto invalid_pm_state;
 	}
 
-	return (!ret) ? -ETIMEDOUT : 0;
+	if (!ret)
+		return -ETIMEDOUT;
+
+	return (tx_status == BHI_STATUS_SUCCESS) ? 0 : -EIO;
 
 invalid_pm_state:
 
-- 
2.56.1.708.g77570a6a1d-goog

