Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E45B145324
	for <mhi@lists.linux.dev>; Fri, 28 Jun 2024 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560242; cv=none; b=RAhDFlpuvRQBafG4euTaVsp/NiNElRV529Sfekt1i7H98ozX1q95fzfMz44D7Nhjka2vEofDy3D9EEPinZFWqzkDJVZrsSK81rA2DdujOzeS+ugl/1Ixnh+Gpm4CyJAGxmPsqK2IFhICxzU2/In1hok7ASdh+jlcoZ95VSuwzPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560242; c=relaxed/simple;
	bh=btbuoqnbp19+IbkGkP5tLXygz84RloajtIo8HzsNVH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k3/5GCF5dCcYjoeATRodi4oX8MRCTvKX2aZ9eav6NXOx5H9XpV3dmw0rruba9dJDQRM9R4InLrx3V/zGsk4cvumNf7dd3HTWR6GoXv46CTrwTj/M5FSpTKb0pZwLNEu4KKZf6+BJBpg3Nw/GXF6un8ptjwKUbFd1K7L3A1ICcJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XVfXoKBQ; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XVfXoKBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YMm3T
	0UnxeIlA2nphWPchowTmAu5M5TowJxfd/HCvM0=; b=XVfXoKBQ9f2Gbfm35xnFC
	A6KGkszOpNsKZbOrtTCwpRQU1SXbSCMpO7gynuX34kB4XqR/nK+irTBOrJO8Wph6
	MORYMrPZShKF5dEvqnWX0fX5huVjriWIoNKzNNOQ/lg5f9a1FxWookuWpcxUb4Q+
	mc3C9qUO/6U43XNaQ4F/3o=
Received: from localhost.localdomain (unknown [112.97.61.84])
	by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wD330AMaH5moqg7Aw--.48095S2;
	Fri, 28 Jun 2024 15:36:45 +0800 (CST)
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
Subject: [PATCH v3 3/3] net: wwan: mhi: make default data link id configurable
Date: Fri, 28 Jun 2024 15:36:41 +0800
Message-Id: <20240628073641.1447352-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD330AMaH5moqg7Aw--.48095S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DWFWrJFW8WFg_yoW5JF1rpa
	yUKFW3tr48J3y7Wa18Cr45Za4Y9r4qka4ak342gws8tw1Yyr9xXFWxXFyjkryFkFWv9r1q
	yF18try3GanFkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi9YFJUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbioxAMZGVOEHzVgwAAsK

For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".
In oder to fix this issue, we decide to use the modem name
to do a match in wwan side. Then wwan driver could
set a corresponding mux_id value according to the modem product.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 3f72ae943b29..e481ced496d8 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -42,6 +42,8 @@
 #define MHI_MBIM_LINK_HASH_SIZE 8
 #define LINK_HASH(session) ((session) % MHI_MBIM_LINK_HASH_SIZE)
 
+#define WDS_BIND_MUX_DATA_PORT_MUX_ID 112
+
 struct mhi_mbim_link {
 	struct mhi_mbim_context *mbim;
 	struct net_device *ndev;
@@ -93,6 +95,15 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
 	return NULL;
 }
 
+static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
+{
+	if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
+	    strcmp(cntrl->name, "foxconn-t99w515") == 0)
+		return WDS_BIND_MUX_DATA_PORT_MUX_ID;
+
+	return 0;
+}
+
 static struct sk_buff *mbim_tx_fixup(struct sk_buff *skb, unsigned int session,
 				     u16 tx_seq)
 {
@@ -596,7 +607,7 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 {
 	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_mbim_context *mbim;
-	int err;
+	int err, link_id;
 
 	mbim = devm_kzalloc(&mhi_dev->dev, sizeof(*mbim), GFP_KERNEL);
 	if (!mbim)
@@ -617,8 +628,11 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 	/* Number of transfer descriptors determines size of the queue */
 	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
 
+	/* Get the corresponding mux_id from mhi */
+	link_id = mhi_mbim_get_link_mux_id(cntrl);
+
 	/* Register wwan link ops with MHI controller representing WWAN instance */
-	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, 0);
+	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, link_id);
 }
 
 static void mhi_mbim_remove(struct mhi_device *mhi_dev)
-- 
2.25.1

