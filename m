Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906832;
	b=IyH3h+8hi/EamkUDjsu6dBPBQqBnrupG/gwT6QHd2gIHx+SrJXpNx1kd6bIBz1uQ5axf
	 MgYvXPRk/rlvSzeoU92sz520oFQ51g2a95JEL+nryhp7xqd5Dua70sNnCK/Izl9hnWqkB
	 8hxBH2E3InEoRUkncA8pYlWpGEMkCO7kQzEKbU9K7oCnu4H39Ln0O9zplz063sX0kuyLS
	 Ks2bRcqGfQf8MtUgL6fk0yUSsRfy2oY40UJiP39v0yd2gYUc9qI+wVIpZRcvFd5lnW7Ve
	 eCbENqoWytN5jLY4wkWHfiA9kREkV6n2pAvF8U9Ep0l2GGmYofnGvRj+qrKGyXPWiSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906832;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=pihHLLXNRAgzAP8rGYNfzLOQ+rnGj6xRXahw3WfbbtE=;
	b=WFRtMrR41tU+OcdBxCqaw8GK02dlx2rVHixIMIdzuuAqEtbU/TuENtPxuvw2r2pI9oC/
	 AtwBJTNW8qXoJ0V/AXo8ZI+BhuqN+lVusa+gY4mtCv1R+F9+7FhGtCwrbtqpo9NNl82pg
	 vaykWUAmzkMrKgy5QcP7cS3zEwYZHKkVI8yxgMmR46L2gQPl72PXTVmh04ROzCOOMuDzR
	 jL7v1d9lFuavY4vhPFXPF1pTQ7o9PZuarg/M88j/Xt7NWmtFytJEav+7+haRq7ToporZp
	 cO0brs0BCV1OrYCu4F02ZTc2+XZmkMeFgU+dad12B0oNMpeQPgHg3VE1J+c4XK00K4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NxHh1sxT;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C5606A329
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 09:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2C5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NxHh1sxT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pi
	hHLLXNRAgzAP8rGYNfzLOQ+rnGj6xRXahw3WfbbtE=; b=NxHh1sxTdKecGmBj8t
	PM+Ebr8OJlekwM5Kvfqth1NUAvlIcJRujy+fhSojKfexIMAvwctdp5GaKQYcnCWk
	HBb3RRCikdmg+/aFxcZDTNXH8pdgUtHCSsz1GJU85QOO/3+VjZ+l+LP+SWxWXTdQ
	lQkXp6c9OnwE8nw8nOZKN4iro=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAX9iK1GvxqVX_fIA--.31468S4;
	Tue, 17 Nov 2026 17:13:29 +0800 (CST)
From: Wanquan Zhong <zwq2226404116@163.com>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Wanquan Zhong <zwq2226404116@163.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v7 2/2] net: wwan: mhi_wwan_ctrl: add ADB channel support
Date: Tue, 17 Nov 2026 17:13:24 +0800
Message-ID: <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794905977.git.zwq2226404116@163.com>
References: <cover.1794905977.git.zwq2226404116@163.com>
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
X-CM-TRANSID:_____wAX9iK1GvxqVX_fIA--.31468S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWktFy8try3ur15WFy8Zrb_yoWfZwcEg3
	srXF9rJrW3Ja4jkr42gF43urWftw10qr4kXFn3t39avry7XFyUW3WkZrs0yr90yr17uF9r
	urnrWayFyw1fJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_2Nt7UUUUU==
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0RmO5Wr8GrnjuQAA3M

Bind the MHI "ADB" channel to WWAN_PORT_ADB so userspace can access the
ADB port through the wwan subsystem.

Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>
---
Unchanged from v6 patch 2/2; bundled with v1/v2 historically (Loic).

 drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index a31d8540fbb8..50a3a940357b 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -263,6 +263,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
 	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
 	{ .chan = "FIREHOSE", .driver_data = WWAN_PORT_FIREHOSE },
 	{ .chan = "NMEA", .driver_data = WWAN_PORT_NMEA },
+	{ .chan = "ADB", .driver_data = WWAN_PORT_ADB },
 	{},
 };
 MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
-- 
2.53.0

