Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3282576F
	for <mhi@lists.linux.dev>; Wed, 12 Jun 2024 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718185196; cv=none; b=fL/v7YCtcPmH4WYV5Hq8WIN6agdDGtit07BwhsigVqNQz4lGvNX7lTjBIApUv651mcckrDHhGkHewfDpJA4rYglkwAKPsfpN46cxFJTd3qylmjQUmWf9UItgFWvS7xq83P41uvWCSecNyndxkfymbvbFFNd3ebupYI1tuYUcUzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718185196; c=relaxed/simple;
	bh=CseckecvFHVYq5/Mi+eTnmliiolSYA/fTa5Hy15SGko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O6ALPkRnDhEjFt7uSBW+ysi62ue7LLeESznisCgC9cwzfb2bEAmL+yyQf9zXUU4qwNFXl6zVfZzTI6wyKEt+0IjyPVX+RGRuWqoQ5k5i5TInrVCWpmE3Hk1HuIyyn8E70QTR4FWBAXwT7Cm0ZCEeskspL9u1BkSvx1ViaNCB8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kaIQcOzC; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kaIQcOzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dtUDZ
	Mf38e7mWzd9Ay3BGQ/8e3RMt1YamowsisI+xss=; b=kaIQcOzCsSj7DeZtSqF3G
	3yd4ErsVsEhlYaw+DHzDVuPydojnuGCILlEnl3GCasebdo1NSqec8jrISY3Cr1t3
	Tcsfdxh2xOedJConjqb4JobaBft8RuhbjAZ2+spqcaaB4xPfGJ2bPqRe4H33c+Ei
	19UiCBSuBkAwgcsfBRzXrM=
Received: from localhost.localdomain (unknown [112.97.57.186])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDX37ngbGlmhhrDHw--.14951S2;
	Wed, 12 Jun 2024 17:39:45 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	quic_jhugo@quicinc.com
Cc: netdev@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 2/2] net: wwan: mhi: make default data link id configurable
Date: Wed, 12 Jun 2024 17:39:41 +0800
Message-Id: <20240612093941.359904-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX37ngbGlmhhrDHw--.14951S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWkWFy7JF4xXF1kZryUAwb_yoWktrXE9r
	1kuas7WF4UWr1rKr1j9F98ZrySkwnYqFZ2gr1ft395J3sxXFy7uay5Zr1UtrnF9w47Crn7
	Wr47XFyakw48WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNoGQDUUUUU==
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQH7ZGV4IDQMmgAAs0

For SDX72 MBIM device, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".
So we add a link id default value for these SDX72 products which
works in MBIM mode.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 3f72ae943b29..c731fe20814f 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -618,7 +618,8 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
 
 	/* Register wwan link ops with MHI controller representing WWAN instance */
-	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, 0);
+	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim,
+		mhi_dev->mhi_cntrl->link_id);
 }
 
 static void mhi_mbim_remove(struct mhi_device *mhi_dev)
-- 
2.25.1

