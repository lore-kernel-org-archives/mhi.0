Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A008A39448F
	for <mhi@lists.linux.dev>; Sun, 18 Oct 2026 04:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792296398; cv=none; b=sWC6jZlrNUCgCf//AJSsOnZYbpE1+ZGXPcJZKCk3CeW/1ZPjNqXrLvKwyPLLNTAzlbb5qZ5JgAZslK5q6Vy+2434tt0GIRgGSXw8vEr3mjc/C0MtzEyaZMrneDCi3qIT2kxLpqEjIZDmjxL+1v4oVp0+eE762P7jCy8NAzO2RPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792296398; c=relaxed/simple;
	bh=vXb6kqDuO0i7nx7hFDIdPmyQMLgwSuqzW1ikim9AvNY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MjrYFGP0i/BmzUGiY4/mAj9qYZhEqMnhNVdzEfdzCkzG/4iGJVnqkgG88S+VZu8lxmog4qjv68sobxeUgMQm8Ldnaf/UTKBRDNcsOVIyKmcPkz/kmSD6K11rcUJNC3LzAUjx+Dbh4Ngb1l3hRv018iG12PQ35io+ioBJGmqawIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W9mpbRFr; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W9mpbRFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=45
	42YIy7I+f1pcctkttl4bfj50N93yJdnl3nnqO378k=; b=W9mpbRFrdg2HuXt6hN
	2d4a5CUSGNUAArBVQZfLda0X1IN3FDHLTv0Hi3Z5vlVRgRab16c7A9+Sn7RUtkr9
	6ucpbBqfy4C/4YjG8dQTJQofQgFg8bpbbz2OCyJWL/Gc5DgT8Z2FcSeft+V3egwO
	mDxgKdJbSlfIV88Lb40rt4dIA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3f3W4RdRq6ReGAw--.62311S2;
	Sun, 18 Oct 2026 12:06:17 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] bus: mhi: ep: cancel reset work during controller teardown
Date: Sun, 18 Oct 2026 12:06:14 +0800
Message-Id: <20261018040614.533366-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f3W4RdRq6ReGAw--.62311S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFykur4DGFyUJw1ftw1fWFg_yoWkZFg_Ca
	9xWwnrGr4DWryjkw1vk39xZFWkA3WDXr1UW3WxKr97ta4UZwnxXrWkZrn3CFnrCws7JF93
	uryjqF1Yvwn7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZnYFUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRlPiWrURbmx2AAA35

The doorbell IRQ schedules reset_work on the system workqueue when the
host requests an MHI reset. The controller teardown only drains the
private MHI workqueue before releasing the controller state, so
reset_work can still run after that state has been freed.

Cancel reset_work before destroying the private workqueue and releasing
the controller resources. The caller is required to power down the
controller first, so the IRQ can no longer queue the work at this point.

Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
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

