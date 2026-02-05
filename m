Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9022D3A7846
	for <mhi@lists.linux.dev>; Thu,  5 Feb 2026 10:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287693; cv=none; b=BxgbUfkJDrvoNcILfQ8k9fPvjYoazqXd1u4IcQ5V4SIHo29jj6ixnaANz0cpU/wY0wzHtDY6qOAp2xGvepCunwLxfw8kbIqgENQjreAEfSC48V1YzHUjNF2rKnHlEAfkUoHx1G9IvJtdGEK9usEopc8aJLSZWK5a/tDRIaFnuAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287693; c=relaxed/simple;
	bh=qBqz8faLTWrE32tUdZf+l1s0IQ1VOsm7fqfEK4Q27JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4a9uN+ZVtRRRnKlYLFVVC24u8GoFIHq/MmNad/C5NO0LRj4bKobR6nPh0bIN/uRa2vmYXgh5MJ9IlEv6SGxNKnmm7mvr3yumVdtxTVpFkOaMlr55qAhHrVW4LoMQkoMfmRRmaIct3XhnsAI5khmuRWwjfwU14aqyJYRkhQhIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGbcD103; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e657KWi6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGbcD103";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e657KWi6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155q6Ga4165727
	for <mhi@lists.linux.dev>; Thu, 5 Feb 2026 10:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R61l3+NRUIc60ASTGW87WaoALJCQRtQL8z4dgSxsiY4=; b=RGbcD103ay5awpCm
	DHg9h6yZnfN+pZ5hTkbfzFD6ehyTfQxsUko8OyAfSt3WN3NGPBu2J5I4Pim7/uon
	CsTl5MjeDsVmRDslYvhg5d4l98vbyODiNK2onK9YLc8mSrbSYrVT50XvdBYkHjm9
	xjKHKOvKy/13uAZGqgQVLB71CFmC+LaaM7ZBuqzZqpfJhOwrHKWqFJZx62bql8si
	/dL8Q2IrxSFizSRASdvdDnHeQ750o0KGI9K/BuDqO8+AoH13bUdQet3HwAC5ui5g
	6Q8F65LTVm0hu3xhBRJ9EoAuFxt49EdeCNbsBkd44VTeu/qr94uAXw9LVLA8spvO
	rqq4Qg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg8uh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 05 Feb 2026 10:34:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c61dee98720so493012a12.0
        for <mhi@lists.linux.dev>; Thu, 05 Feb 2026 02:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770287690; x=1770892490; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R61l3+NRUIc60ASTGW87WaoALJCQRtQL8z4dgSxsiY4=;
        b=e657KWi6GqH9yjW8gbVFVk28UaBD57OH4qF7H57f4jx0dJ2SXcrOgE+xg8xYEq2iI7
         UUZAWCezRlwj7mi2iDgstV+Ds6xzjNTzG5MO2Pbg620PnQ9n0jq9W1S/x2nHU01f3Xqs
         1huWNQ4/iLleLymITNEuKVIYg6lgmzhN1O6qN6LKnz7oKdzvihmfYtV7XyKVKEmVmfuE
         sjTEL/tJAw9iCnojXxARyzL5gbixT0iiLwVy+/qEhxURKuTS4TIL64OVwPTOhcDbcOO8
         LJExHffBcPUx9gupgo729iNKMeLpAxo9eRgbqT7e7E7/yykWmy97VZfowANuWBVanka1
         EcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287690; x=1770892490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R61l3+NRUIc60ASTGW87WaoALJCQRtQL8z4dgSxsiY4=;
        b=Z2lCs5DSHRBlUur//WzYmoLJz7LsU4S3jrQifMFAMvF53zi08qtQxLJ/5zMj5rlG7S
         52CRRbLnYwMNPFH38YjeBUWyfEnC7/zfS0/L0geskSxJk5xedBsBOuVuvnVnF+rwRL4/
         xwPmMrHu/6ZYpvv5j/k8HjLgN654aVbLpK5KL7GRZLZHbdql8nBaSrsC7aUvlHcc+yIJ
         wWgvP1lb9aexKvAXvgY259MqCM7mR4yRQaxQ/GxnIZHeJD7LBtoZ0+5jcuylWGkvGB56
         dWJIWUvKg2HUdTtPcu9v75zoD2Rxs6aS6doLoX7PMdKm7KBXXA0eoUCGHHf6Mmq3f49T
         H+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUF/G9raq5fNphxNJvU4xJZO3q3jyiIPlNY28WJJG2DqJ9XYTBoXcrGitjzIUUxF6FhhyE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrk83pr6sOoI7ysJ8lio4NslLDkR3FciOoZmzkBntjeFbZsfhU
	3orde4XJun1SY4aDQM2R7s8MsZ4aZ7uFPsXPkpPy5dBc1bF23PnU4NpN0CCO/I65+uVW06Fe1oC
	SJUf5KPnJsOwPd/3Lg9MNHmS75ypiKgJi421g8rykoC39Bwo/rd77qBA=
X-Gm-Gg: AZuq6aJSK7mw0scSc7CnJtHlxe9qTktiPkFHsnGGiYH+rzNQBVkperumJz9HJptXAx3
	6bbolBIjnsBhMZmTzcLEm6nU7zUOzqe5PKAca7ijnBKp7zDgkDcPtEimHFyeTHGk7eo2s3iGY2+
	sPbfTpVVvM3qJ+JFXy+DjQLt2ZkXppSocr55flhoLQy6+xwzcbCKN1PHsmgiiHvTypUVtZf2s/l
	PPt4EQrRK/b+1sZLgysWO3Oo0qsoYTcCiFdSE6OK9m8d41JXRdoaUuUJ4kYqxzmyYMiS5qN/xr5
	dHoURMImOSaT3Y4ipHVWQUdXicTyGWR9xBR+SHtC4kdp11Tt/OYgDVaKVzvmAuh1Xnt8WEsj2DH
	ayOL2qOorFGYqmW9M96keE/t4O5EsMpa3ITBt
X-Received: by 2002:a05:6a21:114f:b0:38d:fa67:e87f with SMTP id adf61e73a8af0-39372090292mr6418787637.12.1770287690187;
        Thu, 05 Feb 2026 02:34:50 -0800 (PST)
X-Received: by 2002:a05:6a21:114f:b0:38d:fa67:e87f with SMTP id adf61e73a8af0-39372090292mr6418759637.12.1770287689690;
        Thu, 05 Feb 2026 02:34:49 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933851341sm50539255ad.4.2026.02.05.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:34:49 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta <vpernami@qti.qualcomm.com>
Date: Thu, 05 Feb 2026 16:04:40 +0530
Subject: [PATCH v7 1/2] net: mhi: Enable Ethernet interface support
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
In-Reply-To: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770287681; l=6481;
 i=vpernami@qti.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=jJ3Ma0JOctfqeV8afrgwBPV1pduNsnIzOzWiV6l1+TY=;
 b=v2iiBWTPqyiSoqgCMQTg5fyYG8iwOftKhVaA8Nz07D/tg/KV4lfUqc27gN/LwI7f+niEDEsdl
 88FrbnPSVF3D6s0s6c13TxrxF1M2lo72D8C6y8rXzZkj3LfAtrARVOR
X-Developer-Key: i=vpernami@qti.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3NyBTYWx0ZWRfXycYl39vQ8Ixm
 rkTPoVKv3by6EI3V9VOGt3Md6kdk+Tq+LgfLYJKAlF7OZ4PP9RCh+m2KKX6CdLx4Ey8SMpcGQce
 auby/6KxVVGZbg6/Ku1xVLz2kwhKaEQBSxlDArqjk0F0LWFsee+zWMiw5LaTP9YsskPi3pIVbTO
 F2dLOC4ObZIXXemwWLnBUHANiy9qX7+0KpGRBlRg3D/O1IkNti+yp5cSpV/8vLAFwFziwWlNpQ/
 3POJb7WGEIdFFhpixBb5ot9xESbY7fX9pSMBKv9H85YOmAXtBk9YrCPQZy0FsUhWEPe4MSfNjFk
 8/10+/4cIHruZq8esGwchnrpqdk+NOXchnsRXteu2lqkqUYNa+3qCeI6SxFEsZs1VBpERD1O7Lz
 4xEtMGaw+gAKuIHC2pi1kgxwUpFpvNla2MSmvecJIy5kaXMxsVqUdC5cGe61bBanIX235ZVPptT
 dfDBhyjkUXVCGOf+XXw==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=6984724c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=B7OUL4BZy9I5PIjrJhgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5gbmGnEvoqR3f5Okr5yz9QjIqBgSds1S
X-Proofpoint-GUID: 5gbmGnEvoqR3f5Okr5yz9QjIqBgSds1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050077

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add support to configure a new client as Ethernet type over MHI by
setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
interface named eth%d. This complements existing NET driver support.

Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
M-plane, NETCONF, and S-plane components.

M-plane:
Implement DU M-Plane software for non-real-time O-RAN management
between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
models. Provide capability exchange, configuration management,
performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
R004-v18.00.

NETCONF:
Use NETCONF protocol for configuration operations such as fetching,
modifying, and deleting network device configurations.

S-plane:
Support frequency and time synchronization between O-DUs and O-RUs
using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
O-RAN.WG4.CUS.0-R003-v12.00.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 75 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..fbec10c1ba9faf1ccf049b808e9d391800320989 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/etherdevice.h>
 #include <linux/if_arp.h>
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
@@ -38,10 +39,12 @@ struct mhi_net_dev {
 	u32 rx_queue_sz;
 	int msg_enable;
 	unsigned int mru;
+	bool ethernet_if;
 };
 
 struct mhi_device_info {
 	const char *netname;
+	bool ethernet_if;
 };
 
 static int mhi_ndo_open(struct net_device *ndev)
@@ -119,11 +122,29 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
 	} while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
 }
 
+static int mhi_mac_address(struct net_device *dev, void *p)
+{
+	if (dev->type == ARPHRD_ETHER)
+		return eth_mac_addr(dev, p);
+
+	return 0;
+}
+
+static int mhi_validate_address(struct net_device *dev)
+{
+	if (dev->type == ARPHRD_ETHER)
+		return eth_validate_addr(dev);
+
+	return 0;
+}
+
 static const struct net_device_ops mhi_netdev_ops = {
 	.ndo_open               = mhi_ndo_open,
 	.ndo_stop               = mhi_ndo_stop,
 	.ndo_start_xmit         = mhi_ndo_xmit,
 	.ndo_get_stats64	= mhi_ndo_get_stats64,
+	.ndo_set_mac_address    = mhi_mac_address,
+	.ndo_validate_addr      = mhi_validate_address,
 };
 
 static void mhi_net_setup(struct net_device *ndev)
@@ -140,6 +161,13 @@ static void mhi_net_setup(struct net_device *ndev)
 	ndev->tx_queue_len = 1000;
 }
 
+static void mhi_ethernet_setup(struct net_device *ndev)
+{
+	ndev->netdev_ops = &mhi_netdev_ops;
+	ether_setup(ndev);
+	ndev->max_mtu = ETH_MAX_MTU;
+}
+
 static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
 				       struct sk_buff *skb)
 {
@@ -209,16 +237,22 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
 			mhi_netdev->skbagg_head = NULL;
 		}
 
-		switch (skb->data[0] & 0xf0) {
-		case 0x40:
-			skb->protocol = htons(ETH_P_IP);
-			break;
-		case 0x60:
-			skb->protocol = htons(ETH_P_IPV6);
-			break;
-		default:
-			skb->protocol = htons(ETH_P_MAP);
-			break;
+		if (mhi_netdev->ethernet_if) {
+			skb_copy_to_linear_data(skb, skb->data,
+						mhi_res->bytes_xferd);
+			skb->protocol = eth_type_trans(skb, mhi_netdev->ndev);
+		} else {
+			switch (skb->data[0] & 0xf0) {
+			case 0x40:
+				skb->protocol = htons(ETH_P_IP);
+				break;
+			case 0x60:
+				skb->protocol = htons(ETH_P_IPV6);
+				break;
+			default:
+				skb->protocol = htons(ETH_P_MAP);
+				break;
+			}
 		}
 
 		u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
@@ -301,11 +335,14 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
 }
 
-static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
+static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev, bool eth_dev)
 {
 	struct mhi_net_dev *mhi_netdev;
 	int err;
 
+	if (eth_dev)
+		eth_hw_addr_random(ndev);
+
 	mhi_netdev = netdev_priv(ndev);
 
 	dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
@@ -313,6 +350,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
 	mhi_netdev->mdev = mhi_dev;
 	mhi_netdev->skbagg_head = NULL;
 	mhi_netdev->mru = mhi_dev->mhi_cntrl->mru;
+	mhi_netdev->ethernet_if = eth_dev;
 
 	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
 	u64_stats_init(&mhi_netdev->stats.rx_syncp);
@@ -356,13 +394,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	int err;
 
 	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
-			    NET_NAME_PREDICTABLE, mhi_net_setup);
+			    NET_NAME_ENUM, info->ethernet_if ?
+			    mhi_ethernet_setup : mhi_net_setup);
 	if (!ndev)
 		return -ENOMEM;
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
-	err = mhi_net_newlink(mhi_dev, ndev);
+	err = mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
 	if (err) {
 		free_netdev(ndev);
 		return err;
@@ -380,10 +419,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
 
 static const struct mhi_device_info mhi_hwip0 = {
 	.netname = "mhi_hwip%d",
+	.ethernet_if = false,
 };
 
 static const struct mhi_device_info mhi_swip0 = {
 	.netname = "mhi_swip%d",
+	.ethernet_if = false,
+};
+
+static const struct mhi_device_info mhi_eth0 = {
+	.netname = "eth%d",
+	.ethernet_if = true,
 };
 
 static const struct mhi_device_id mhi_net_id_table[] = {
@@ -391,6 +437,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
 	{ .chan = "IP_HW0", .driver_data = (kernel_ulong_t)&mhi_hwip0 },
 	/* Software data PATH (to modem CPU) */
 	{ .chan = "IP_SW0", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_SW1", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_ETH0", .driver_data = (kernel_ulong_t)&mhi_eth0 },
+	{ .chan = "IP_ETH1", .driver_data = (kernel_ulong_t)&mhi_eth0 },
 	{}
 };
 MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);

-- 
2.34.1

