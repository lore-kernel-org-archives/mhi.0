Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1782FF179
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542155; cv=none; b=pYpP9BXPmPYWbx2mdaOrAs1zPF3Yh4AgsiXzpWrmU1TjFIfmwGU2S2ISYMNTTmNV0BFfeFwKP2+GoULRBo9tbaj9K//6Ji+K3BZfsEFtIiOgfXUiwCnFjRhfPcmn0uoco44l0+52S4Djf71uEoMeldO4WWJWFDABbCxUssItct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542155; c=relaxed/simple;
	bh=7Pv2gSpQtxO58Uqyz2rrXisJ0lIgMY8UuCDHItRlFVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f1tp/EhRfvM1JM14fb/lbAY5rZihAvchQlcccBeGNac85QREYqpvt9kUcQnSBnEg2jIjGtfc3astYZBtzLeQ7OyJm1Tjrsp1yOYhG6ocNYztDaMiuLNkwuMd+U0EpO4+R4cu5qDnBg8UUyLU47LB/gklQtkcQJSZse1wXk9ynsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hxqZ/Z5/; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hxqZ/Z5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1J
	uBksOo+YJB/sCSddeEFA5cv+ss+G8N45aHSrqfAjI=; b=hxqZ/Z5/6uWJg9+VPc
	oyOAYL2sG9fBNlakWIF39KXMyBlrUgDpbAJRomXO5eI8AFbCISCWLxc4v7l+RONw
	3ph48Dj/OADhjSZnFMDAzFgh4W2vZ3fysq9mjYjWahLMDLe9dAmViKD972WgNtB/
	6tr16o5WwwOopKoMA8lO63G08=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCXmopdhB1pISBgBA--.118S2;
	Wed, 19 Nov 2025 16:48:32 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mani@kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
Date: Wed, 19 Nov 2025 16:48:24 +0800
Message-Id: <20251119084824.34624-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXmopdhB1pISBgBA--.118S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr45tF13Wr1xur45ZF15CFg_yoWDuFXE9r
	1kXF9rJr4jgFyjkr1kKF43ZryfGwn7XF1vvFsav398ArykX3WrWFWrZF1fJ3429wnrJFsr
	urnrZF1Yv3yIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKuWlDUUUUU==
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibhoLZGkdgCFmLAAAsE

T99W760 is designed based on Qualcomm SDX35 chip. It use similar
architecture with SDX72/SDX75 chip. So we need to assign initial
link id for this device to make sure network available.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: Add net and MHI maintainer together
---
 drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index c814fbd756a1..a142af59a91f 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
 static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
 {
 	if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
-	    strcmp(cntrl->name, "foxconn-t99w515") == 0)
+	    strcmp(cntrl->name, "foxconn-t99w515") == 0 ||
+	    strcmp(cntrl->name, "foxconn-t99w760") == 0)
 		return WDS_BIND_MUX_DATA_PORT_MUX_ID;
 
 	return 0;
-- 
2.25.1

