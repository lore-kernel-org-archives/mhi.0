Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD362798FE
	for <mhi@lists.linux.dev>; Fri, 12 Sep 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671735; cv=none; b=Ckeo1pOXHXc2gcDa4fBfHrDdbrYEiDAgPStbMJjxGmb76p4K2FrGkn+FsSysn4mDcE+pYCfmWRRLWxtVSJUha4xhS32KSDCGzhTNgCS3k7LkTIHPMgOw8HJo8SJTadT13wXMhdjdfJlkL32h5hemDpxDnbKF/LO19TX+bzn9snA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671735; c=relaxed/simple;
	bh=oOGKu5RrTwNZiSl9cE7/ZL75AiB/oPFcQZTrU6IP0Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GnQu0AhU8khKOziA37v4KFkLVzGNK1zuEJI0C5a/LfDWl2WqHfLMrBQyCqNO5YOBITmqkG6eZM5+6MHIYP2UzAc/jCz4zhwY2POrBp9386u2Rtpw2MFxPo9xJtpDFUyLHwSchbyp3Kur3sCVzWyl+pgCIjKFXQH9IMrcq8MXzkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ILF+4k1l; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ILF+4k1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oy
	u7BW8V2JIsKMsTCJkb2DN0ZU7uiiP0XMLRvwlY21I=; b=ILF+4k1lDZDqEx5DaI
	CBihxPkyeXdYsrzVmRf7O4ZBH+MbdlwOS7QyMzheQVkMN/Yiq3nsC4PjZdJQ7eL3
	9NeuSu5/w4f3skWidxsvXanfwbiJOwl27t0xhKpECjwaTlCbtQaN/+k+pE1pFlDs
	rhKRyA0ewyh8bA/fCMvqKNGjs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHcr8d8cNoME_RCg--.64198S2;
	Fri, 12 Sep 2025 18:08:31 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: Update session id for each suspend and resume
Date: Fri, 12 Sep 2025 18:08:27 +0800
Message-Id: <20250912100827.294443-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDHcr8d8cNoME_RCg--.64198S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFyDZFW8XF1UXrW8Cw1xXwb_yoW8tr17pF
	s0grW3Wr4Fq3y7Cr1xta4xZrW5KwsavFWkGF9rKw1a9anIyFyvkF1kKFyrX39IkryDGa1F
	kr4UX3yDGa1qyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piw0ekUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJQfGZGjD8NIHzQAAsD

On Qualcomm module side, there is a UART print as below:
session id: 0x355fe689 state:2
session id: 0x1f478e42 state:5
The session id reads from register BHI_IMGTXDB(0x218), and the
state indicates the D3 or D0 state.

In Windows side, MHI driver would update this session id for each
suspend/resume progress. We benefit from this mechanism since it
could help sync each suspend and resume progress between host and
device, especially for some suspend issue which needs to take
hundreds or thousands cycle. We can easy to figure out which
suspend cycle get a problem and what's happened at that time for
both host and device because they have same id.

But in Linux side, this session id value would always be 0x0.
So we add it for potential debug usage.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 33d92bf2fc3e..a6573f687363 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -864,6 +864,13 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_pm_state new_state;
 	int ret;
+	void __iomem *base = mhi_cntrl->bhi;
+	u32 session_id;
+
+	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
+	dev_dbg(dev, "Starting enter suspend, session id: 0x%x\n",
+		session_id);
+	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
 
 	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
 		return -EINVAL;
@@ -952,6 +959,14 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_pm_state cur_state;
 	int ret;
+	void __iomem *base = mhi_cntrl->bhi;
+	u32 session_id;
+
+	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
+	dev_dbg(dev, "Starting enter resume, session id: 0x%x\n",
+		session_id);
+
+	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
 
 	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
 		to_mhi_pm_state_str(mhi_cntrl->pm_state),
-- 
2.25.1

