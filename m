Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580690;
	b=5TtfC1dmMcW4OA+1sYwNl3HHnGxjZSMVg36Gcl7sBi4B8E5X7hWt/KV74RZlAqaRXZEE
	 zmcjVY8tBHijiwkdDi4kYaXioKjMInRMPQEpKE5i6X1Pob3x2GtXyl04tvpYoik1OJKSe
	 NK1/eHnHC47U9h3DWSSvtTaiFHKlAYnG4v0MJmMWsbPaJvQxVj88cpkP2KMCmWivb9toS
	 2s658/jxSmgUzr/r3WRroY5l5Q8xPy6z6txs0Oqovp7O9CKc575nCy+PxwM7hzt5sDZa3
	 0CSkXRatgeJC/H4pWy3n4C1FocH4Nc1EaEFlIaKbbrP31hsiM7qcxkzTVMh6zLntKYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580690;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=YAca36Nd/5NG3odiL6IAGq/y9KAEeHTuCCyibbdflO0=;
	b=nBSVeskvJ1zrAAJ0W7wK3kww8v63mTjBBrAyBL9NMkobO3NThResCLPwk4+FvY8gtkTd
	 XxkCybZHB8s8w/08XyJL+RpJ3rqHAo12XkH+p3EKLOynVTXBU4j5kTRlfmrErunVm7v5i
	 +FwQq5q127aXHMkRI4oXax6jJaE0a8JP0ME8RyL1DtbO+wqfQwxYjmHZtmFn1e8lBx7CO
	 P9Yz+B04lu8xsikfuDMx21vYuyL4hHtUlFQ0kLr/br7APDxY7HRJGWv5DMnvHbk2pB86E
	 8Gt2K2tWz7ZhPHXX0CfhvH+ObLxtD1x0MsXleZbdLBKcfKEDgJ1PKUHaOSWdzM8sYPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UA64hTRE;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899BC606A31A
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 11:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UA64hTRE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=YA
	ca36Nd/5NG3odiL6IAGq/y9KAEeHTuCCyibbdflO0=; b=UA64hTREsDyZIdB+X4
	FF90aiCsuXLeM4rjosoPv+/7t6B4N2TDnAkIq4NH0Ts1Voz/EZXmq/rHIhC5WVDh
	3DlZ3zJHW0mdgSj8z6ecP5bcJVsRFtDYDTx86t/uwtKEFRAF9m1tdCCd/qMrvf8y
	7yFkQSYD9YrIY/WGeXtttWmNo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3n_48nNhqmrHDBQ--.50871S2;
	Wed, 21 Oct 2026 19:04:30 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] bus: mhi: ep: cancel reset work during controller teardown
Date: Wed, 21 Oct 2026 19:04:28 +0800
Message-Id: <20261021110428.4143200-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n_48nNhqmrHDBQ--.50871S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4DXw15XF13XF47KrW5Awb_yoW8Cry3pF
	Z3KrZ0kr48t3y5Ja1DCa1FyFyfKF13try5Crs7Gw4akwnxWFyqvry5KFyY9F4qyFy09r1a
	krW3A347Wa4DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYSoAUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh4HQWrYnD7VeQAA3q

The doorbell IRQ schedules reset_work on the system workqueue when the
host requests an MHI reset. The controller teardown only drains the
private MHI workqueue before releasing the controller state, so
reset_work can still run after that state has been freed.

Cancel reset_work before destroying the private workqueue and releasing
the controller resources. The caller is required to power down the
controller first, so the IRQ can no longer queue the work at this point.

The issue was found by static analysis. The fix was tested with an
out-of-tree module that registers a real mhi_ep_cntrl backed by a
software IRQ and a fake register file. The module drives mhi_ep_irq()
and mhi_ep_unregister_controller(), and delays the reset worker until
after the controller state has been freed. Without this fix, KASAN
reports a slab-use-after-free in mhi_ep_ring_init() from
mhi_ep_reset_worker. With this fix applied, controller teardown waits
for the reset worker and the KASAN report is no longer reproduced.

Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---

Changes in v2:
- Document how the issue was found and tested.
- Add Cc: stable@vger.kernel.org.

 drivers/bus/mhi/ep/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db7ee6547eef..a9695e1a75ab 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1596,6 +1596,7 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct mhi_ep_device *mhi_dev = mhi_cntrl->mhi_dev;
 
+	cancel_work_sync(&mhi_cntrl->reset_work);
 	destroy_workqueue(mhi_cntrl->wq);
 
 	free_irq(mhi_cntrl->irq, mhi_cntrl);
-- 
2.34.1

