Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228F330B07
	for <mhi@lists.linux.dev>; Thu,  6 Nov 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762435702; cv=none; b=HOIS8Z3eWyChPFYIYEQcjkx+xCFRKAVkvETNZt1fL1JJRTAu7DkulrKiFGHgdAnsizhKzfMG6EE6CSTCefsFrYJSjhTL2fcwdIqnSh5hpAz8tbr39Qz8DSOWzdXPGMU9d5yEDf6GOwSuCyQPYcnLTJGgtGqckWIUAMTzzAd0y14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762435702; c=relaxed/simple;
	bh=J6zorrtuzfJ9+H3G9W9PBxJnY2nLxcDhfse6SvzTrG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWwrsrEM048GyBOPpTc2Mkug9rZ/6YAkufMNodbHt69acQpPTr8KIkHiHoiUTjsJjdkDcCVTRC9PceY716mv29DriitS3uFUx6jgZLJYcB/aT8OoBQzOmLsi5kCm7s7VOPtMP/gLo1IL/cEnbRs30mvUsYs5WqDhr2QJ0ssS5fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ew1Q5m2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsuLZs4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ew1Q5m2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsuLZs4K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6CcUpC3217403
	for <mhi@lists.linux.dev>; Thu, 6 Nov 2025 13:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IUULajFqgSD+MEsGRsQuIGs9v68mJqzbhXQWTGKyrrk=; b=ew1Q5m2+fYRaoGvl
	dlQ0g2GCk86vEzz4ILvE1AtZpu91AjuSsDEdbnnlYFiwh6nPg7XA4RY9CJDLkO1z
	eOOXZj4cOtVV9W/W+iX3KhEk9CSkPUFcN2+lXsDkM8e11XZ4T7ilOHIPnmLE/Tv9
	Nv3aNPuO03CCUCLfPBo4KTqg5eG7jBySyB54cr9QxQsH6s9eLj6Q70p2AQYNZzQP
	ZIYJ2ekJErfFdTPNFgg7BN7DODQt+XQXWxLXu9XRkDW3b5cyTbcI1CQ5UHxTTsId
	LEM44Nta6XeANi7VgZhUN3NZnMZDwUOu+qzNomxTshotp2paeTdLPX0gsk+qqjIy
	BVlz/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8n7phb76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 13:28:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294a938fa37so9066275ad.2
        for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762435699; x=1763040499; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUULajFqgSD+MEsGRsQuIGs9v68mJqzbhXQWTGKyrrk=;
        b=bsuLZs4KRh6T/HZ+Ya7dxoVSTbmMYQWwd2727xvPb/CRc5fv2jh143KkX4dLHFhif7
         OxkPH8IDv//Ofe0HHJK3X6SF7JMp65j7jZ13k7rTvzE0qh6DvJF5lk+g8o46R8V/aRYC
         TpCEGK8aFDmtL22Rvj3V6A5nPTuWm30S359gU18PYXm0jeemyfpt7lRIE5/ux7i3iqvN
         Ss/I5W2U3lT6nefONgXSJ4IMfF2WQ38TCEtN2IYR36XH3G5eOuXriZAuGsmNwYKN/dmX
         NnuIotB9OTTlWddRgRw+dSSCurlxyCCBokO9L+o4PAsnCeWIOS152q/bIf0dquNnuo8c
         WiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762435699; x=1763040499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUULajFqgSD+MEsGRsQuIGs9v68mJqzbhXQWTGKyrrk=;
        b=s/BEMSfwjejA65hj5MewSjCS8tKcUPK0EOOm/zSPcmQPwpWXIChUUct7/s8jOzRKl+
         lQmYToV3KG48MoEVJO3ALmjE31vuXqoR3J3nIQ6UG3tUih1bieIenz9sKVoV96U38NU0
         57ejnzURcL+CZPGgjRhoPsFN6c17TUdajAgur1/RB89UJX5osifcaPzoyhXZCw7NDhz8
         kYDhHPElPWyHiZ1eZFILnsg3a57NabQANxQEntjm4QMQO6crOuPjtjQcHI1kzyrdlx2z
         SLOoFCfHPUs+2OFr7VKOftXZ60JcFYpo9AjZJAZY4C5y3g+ZqVn64KAsIYJ1llxYShyd
         0Z0w==
X-Forwarded-Encrypted: i=1; AJvYcCWNFzJiMDTv6GstOvzup2XoiY92W3UZJoYInAaiukC12ywA8H6iyhB7NG5YDAjrmwxtU4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpKHgzWXQ36BIS5Bj7lvzn9eb+1UmU5uh6K54fmcXcRNHRjAp0
	5ZpE/fioeQhX9FlgaL7wvuDnDwqt2WGX8hHj7i2FCVDqM7MK5yKv3ISL76RwLwYDMEePX3iygyE
	48vUnTpWDKDGn3SYJRx1agTDGo5w/zq+7L4yiiJk0qhIgH4nUO9D7O14=
X-Gm-Gg: ASbGncuWchPPtRQrvTmFMJSPpCTE5JY5dxAgUCRir8J5TTZEmAFx8XiZ77W73PJmATk
	6gtkZtIhI2S7UTHe91/WpoG8KSf53w+bIVwL5dg6WjCi4xN5yOOG3MsLk3j++IvHf6veS44X7Co
	JmvkTPYtf3x/UYQPnvBibuhLwsaXmQhN236ideHbUi2Nz0ZDSfIlnGFaQ0yNXopWpQx7eE6aOsb
	s3T2QScZQxHN6LvHwzHtjOXwie1iyAfI+UXOd9sMANxl4y/yYjDoaXviQdfHizfgkDsTEuffG+i
	l7B+RvsYO4121q7feqxUmpaik1DCvePDx5SxwNw/XXz53+REG8BbfLqoYh8GZLRZY6R5xmDtJFP
	aHWgf7mc3hrRD5INebyjkD1Da/Q==
X-Received: by 2002:a17:902:f087:b0:295:8a09:bcf7 with SMTP id d9443c01a7336-2962ad0795emr60349655ad.8.1762435698818;
        Thu, 06 Nov 2025 05:28:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT+G1yauZO4Uv+PfZ3aECTSqA9E9PkcEkVrxDWVGX+7zjYUsYEQqTXS/fB/MUWl5vKsoZHlg==
X-Received: by 2002:a17:902:f087:b0:295:8a09:bcf7 with SMTP id d9443c01a7336-2962ad0795emr60349345ad.8.1762435698220;
        Thu, 06 Nov 2025 05:28:18 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1669sm28770225ad.94.2025.11.06.05.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:28:17 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Date: Thu, 06 Nov 2025 18:58:08 +0530
Subject: [PATCH v5 1/3] net: mhi : Add support to enable ethernet interface
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-vdev_next-20251106_eth-v5-1-bbc0f7ff3a68@quicinc.com>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762435691; l=5343;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=yXbU8lihwC6jWxLS8hKE4wQ+g81A+06ust1izcTc/1c=;
 b=C+ugZf03olTTYXndYJ6d0WtEXnj133d6yNzphLVPkFegdOgzSJdnLUsdi9KHO9yldpeu2M+Li
 1AxciM4QWzyAidwL0GYOqlX6KPjIoewTMZCAM5FUU76BECEhd6Hg5vD
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-ORIG-GUID: crr3cYw7Znu2f2vkiq4MWEuhHIseqZsl
X-Proofpoint-GUID: crr3cYw7Znu2f2vkiq4MWEuhHIseqZsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwNyBTYWx0ZWRfXx+cExE7SZZq0
 3G2Hmnk8if1+FgWdbcxDkcylBBehGFDY4AQW72rZUJiV5pmZxGq/AlvDmyl03WBw+lOaRdRSyve
 zScxeowiOQROMZsDlZ6eKfCk/qMajEyGU0EdMKZIk5ni+m7yqxQkSG6ZKvH2cBT28SWc1May2LQ
 WlBMPA3bjO6Q+tdS+7kL7iBGZi45/5NNyJ0YTy2uteH5k9e5/aYCLyxmXP1FSxZmrtaJQJpnwew
 1YTP+yB/67yJi8KA5beSoz+obJKOEFG+8YW7bpsSRuAoPDWi9ewKLu5iju2UfenavgCJD3HIGCI
 eblbhsfDBUIdSbHi53oWDHtpnHVAr2TiuvfZax5PK1LhNNu8M731GowSUaEa/MQM/J+zbNore88
 +DBp27zKEKdCqjc/yi2cVhNb9zjFdw==
X-Authority-Analysis: v=2.4 cv=ErnfbCcA c=1 sm=1 tr=0 ts=690ca273 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=896jBCbtMXEWOMTOa7wA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060107

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Currently, we only have support for the NET driver. This update allows a
new client to be configured as an Ethernet type over MHI by setting
"mhi_device_info.ethernet_if = true". A new interface for Ethernet will
be created with eth%d.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 84 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 13 deletions(-)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..aeb2d67aeb238e520dbd2a83b35602a7e5144fa2 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -11,6 +11,7 @@
 #include <linux/netdevice.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
+#include <linux/etherdevice.h>
 
 #define MHI_NET_MIN_MTU		ETH_MIN_MTU
 #define MHI_NET_MAX_MTU		0xffff
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
@@ -119,11 +122,37 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
 	} while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
 }
 
+static int mhi_mac_address(struct net_device *dev, void *p)
+{
+	int ret;
+
+	if (dev->type == ARPHRD_ETHER) {
+		ret = eth_mac_addr(dev, p);
+	return ret;
+	}
+
+	return 0;
+}
+
+static int mhi_validate_address(struct net_device *dev)
+{
+	int ret;
+
+	if (dev->type == ARPHRD_ETHER) {
+		ret = eth_validate_addr(dev);
+		return ret;
+	}
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
@@ -140,6 +169,14 @@ static void mhi_net_setup(struct net_device *ndev)
 	ndev->tx_queue_len = 1000;
 }
 
+static void mhi_ethernet_setup(struct net_device *ndev)
+{
+	ndev->netdev_ops = &mhi_netdev_ops;
+	ether_setup(ndev);
+	ndev->min_mtu = ETH_MIN_MTU;
+	ndev->max_mtu = ETH_MAX_MTU;
+}
+
 static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
 				       struct sk_buff *skb)
 {
@@ -209,16 +246,22 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
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
@@ -301,11 +344,17 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
 }
 
-static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
+static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev, bool eth_dev)
 {
 	struct mhi_net_dev *mhi_netdev;
 	int err;
 
+	if (eth_dev) {
+		eth_hw_addr_random(ndev);
+		if (!is_valid_ether_addr(ndev->dev_addr))
+			return -EADDRNOTAVAIL;
+	}
+
 	mhi_netdev = netdev_priv(ndev);
 
 	dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
@@ -313,6 +362,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
 	mhi_netdev->mdev = mhi_dev;
 	mhi_netdev->skbagg_head = NULL;
 	mhi_netdev->mru = mhi_dev->mhi_cntrl->mru;
+	mhi_netdev->ethernet_if = eth_dev;
 
 	INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
 	u64_stats_init(&mhi_netdev->stats.rx_syncp);
@@ -356,13 +406,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 	int err;
 
 	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
-			    NET_NAME_PREDICTABLE, mhi_net_setup);
+			    NET_NAME_PREDICTABLE, info->ethernet_if ?
+			    mhi_ethernet_setup : mhi_net_setup);
 	if (!ndev)
 		return -ENOMEM;
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
-	err = mhi_net_newlink(mhi_dev, ndev);
+	err = mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
 	if (err) {
 		free_netdev(ndev);
 		return err;
@@ -380,10 +431,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
 
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

-- 
2.34.1

