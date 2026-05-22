Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7F377EA1
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444078; cv=none; b=lyrPgS4GKbx3tQBWLaisZXQHpEF9uLCorr3lPbH76+ezP6pyVm/iTYRxpMAyczsDlsFSQBgeD/KQ7vLlpHS56xw+bKs/d2BIiH54+XdbNttJbkgNegz4GAHO0jIckcAZfp0eVGqowq9JYT4qKtq5lHQ6xzJJ43sDNTQUpugcdes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444078; c=relaxed/simple;
	bh=y3Md+/LJdRoPfa8fSBTst//7iA3QrqSh3tsJRClRwKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnOLxVS9vhXxo0eeuVBFudCtx0b0cEvQml633kFu/W0VzMngMiM7C/3N3Ak5yaA4UEOI9HTcMloD3mXI+u3aW172DdXedrgAu95rHWYOHNin4kaF7tAhSTYh22HBMINcMBt/28ZAfKM3Jsa2b9r2lxHqk1aSGcT7cJdQ88FD47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqjpioQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrS5Bkue; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqjpioQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrS5Bkue"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8RZPA2765100
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89GZyqjxzP4kzPz+TzUkPQL4cVAEH+s+D1a55Or7dm0=; b=jqjpioQFFAri1m2v
	HbJL84xCVFhlIq0d2UiQ47xNCEwDEpYfl4QL2066E9UNWXygtvKtJX6KVopUig/B
	DNCs1cdIbKI7+ComLVYO15cK90mYoNtvznOcMR7Pw8RmqruWrK/FwqkO21zVgCBK
	BGtMJPVA+o5ViB3j7kd4mCSt1nju/CF1aR0HxDv8B2oJFbuE0NkFGMdP0EDG41PL
	2EARo6n8CCNkcRm9atfIEi0uo7M3xl0W6uCWvjaXHbMUrrZvkd43nV+sABOxFnxR
	QFVHmfwgpIAYWljVCxKScvyUUXS3b4Wc3qsYtvf0yKf+zVnB4cPFQ+LMUzoQGMTs
	inJCFg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7vee0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so9033233b3a.0
        for <mhi@lists.linux.dev>; Fri, 22 May 2026 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444075; x=1780048875; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89GZyqjxzP4kzPz+TzUkPQL4cVAEH+s+D1a55Or7dm0=;
        b=DrS5Bkuen1yMUGK9Y7isiPM8IHQPPFUl1eDJjpj7hEUPgUKb+3By6EGKtPjkxbRkPC
         yyn5z1KIIr1me6tod1K+qpZnNPB4Zqo0ZGtQ/i4psWlecqM8DPf5D+gd9Y5eVkdMjLX2
         Ku9ptBLS0kuohSgSc2hImey3aKxK+ceRdWX237XqLbF+1HdEbx5c+/8QFYFJ/fWLUhvb
         VgiCOn5l8lTYgTHJGJihXfZDEDH09aNj/vVRX6MgAxCm1/+y/l8ppbcegsInqM43m52k
         USbXzSHp+QcKW6YO3sUjPcWdWCq0HXWI1Ra5zGhFCT3HYgNPpLvNZqeog4cLVJ8ao+B0
         yNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444075; x=1780048875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89GZyqjxzP4kzPz+TzUkPQL4cVAEH+s+D1a55Or7dm0=;
        b=BdoNyiTbxjeuoh6T2/CE9zUIUOEX5tHBm06w5cU4k9Rp7VC/6WbOSjzyGpVLjrnp8i
         7NIDPfvHjqXcr5hAeNzGP+j9pd84/QOot4Q625qZRhOlFeluFXl+tuD6qIV2/TS5lKIW
         32S1FqNBH9H/t4MGJTL6OIiIOlkeh+IHnKpR+/xTkTQiVIkcpXuIo+FOeduKtTy0N4/F
         K3d4kWvc9QcflyGPCGGJUEOwSWKL3eu9eD5HCXRMaDMvjf8vl2RFiWHuvXJ2Fw0G4Wbe
         6c5MdYsWy9OX++Y55b8Ge+tUDCumG9Wh3QO3MltCWnAXrR4YkkMS9Iu5q4306voEKKNJ
         TkMQ==
X-Gm-Message-State: AOJu0Yw6Y2+o1yrZjnldKzLp3H5CYvZwtOgozgNz7njp4JKC1YC305jg
	m4gXLOrHc+uiBePZtRT0knDHAt4O6PyJeEAty1SKclnoI9EsYDp1mCZVhOPjrEyLDlxwxHSizPg
	hit/4MDLMIQZ7aLy9m1nXm+3JCryyIcSegdfickJXsRIcFzhJShME5js=
X-Gm-Gg: Acq92OHogH18bz4Ki6gN0ZTi/sb5c8StUrlKojkLAdYIz3ZhSaLymUNVYPSqiEbrrlX
	bpBGCtgjfqkH8H2HAcKNeNWHEaZUaqgcHpTsqG7gefeScafcUYQXW6MqkQEGUJ5bXK65h3fRSJY
	52yE7In7VI0qbOWSOG29x/J8gGOy7WkRRoA7NgwvTo2IdFjvQgQtt6e+f+D1O0AHV+78zeFcgTD
	fzJrhEl7BuPjRDJHx2DJ+f+xUGvPfZW/QOprDh0QjT0WCChX/3SvVnoosqoW2ErSdhgRpLJcW3l
	IKyg9ioSJwUXuxXb1bUe+6q6HYeFp7vkPrm4JlWMdzQK5RQiLn6btRJV5DNgBncDzNNdbUDVTle
	UAjk04le6kFH3M8PqmIwF+zRUgj+hl0wkRw9TmGSLd1dTPf1uKRWbfw2J
X-Received: by 2002:a05:6a00:1807:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-8415f330494mr3326887b3a.25.1779444074802;
        Fri, 22 May 2026 03:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1807:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-8415f330494mr3326808b3a.25.1779444074141;
        Fri, 22 May 2026 03:01:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:34 +0530
Subject: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=4173;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=y3Md+/LJdRoPfa8fSBTst//7iA3QrqSh3tsJRClRwKA=;
 b=s+sHbgZoUcbrkhk1NuhJt9uKCZYJuw6T6gtb1ZC0H9M7hSgDCA1Etn58jrZgjHnvT0SCRG62Q
 V7oqxMJp/lHBjYl/lZQf2obhPMwRXspe8hoAXlE3MFihEsy0yCkGb4V
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a10296b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-cKO2LIWXEwUer3o84gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: FXqrearFOZVze8LZ28_-ueX_tu7yfIAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX+0uxXFcBMn7u
 qQAK2XlDqQqBk8Ilf/prL7AoqOYUKEOXdzso0/BYpmcb/dGiuXndRC/yLGQeTR7VbONGmU/UJj5
 WPr2X/6ghEAassim9e658ueOK8lpTm1/9ysQgd6BkN0wDKxIz+zKX784P0mQa0qSkfcMYhpQVni
 JiMQL6MvxyDkqiipykSXTnxONVYguG3y8qrRHGcp3aOmVLVFDYQXXpUuYwrXpIfy2C3MCJynrGY
 nv88sJH5n7wdKMEOb+Et5xYcbkQB3J+T0/bhQdvch84ClMlEpMA2EZkxbTgLZQUpwZI8/2KWH+K
 eFeeyQsPAzBADSsdKg580lXSZCqp/Ga9YToDvmokXekWausAjZ/ms+gXpz05pjhrGkysUUb/fkU
 e+3Yitqn5Tq9K9H/1MZIj18eyKxbhgpC1VcKQT2FcV0o6XkvxpdeH1QjOw9zhTL/FQ3ngCQlu4D
 eH78gvfMiOkFtJYwdZw==
X-Proofpoint-ORIG-GUID: FXqrearFOZVze8LZ28_-ueX_tu7yfIAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099

The mhi_net driver does not coordinate with runtime PM, which allows the
underlying MHI controller to be runtime-suspended while transmit, receive,
or RX buffer refill operations are in progress. This can lead to stalled
transfers or failed queueing once runtime PM is enabled in the MHI core.

Add runtime PM reference counting to the mhi_net data path to keep the
controller active for the duration of TX, RX, and buffer management
operations. Enable runtime PM during probe and take/release references
explicitly around these critical paths.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8..5d7f9ccdb17b 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -9,6 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
 
@@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	struct mhi_device *mdev = mhi_netdev->mdev;
 	int err;
 
+	err = pm_runtime_get(&mdev->dev);
+	if (err < 0 && err != -EINPROGRESS) {
+		dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
+		pm_runtime_put_noidle(&mdev->dev);
+		goto exit_drop;
+	}
+
 	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
 	if (unlikely(err)) {
 		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
 				    ndev->name, err);
 		dev_kfree_skb_any(skb);
+		pm_runtime_put(&mdev->dev);
 		goto exit_drop;
 	}
 
@@ -251,6 +260,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
 		/* MHI layer stopping/resetting the UL channel */
 		if (mhi_res->transaction_status == -ENOTCONN) {
 			u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
+			pm_runtime_put(&mdev->dev);
 			return;
 		}
 
@@ -261,6 +271,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
 	}
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put(&mdev->dev);
 	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
 		netif_wake_queue(ndev);
 }
@@ -277,6 +288,12 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 
 	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
 
+	err = pm_runtime_resume_and_get(&mdev->dev);
+	if (err) {
+		dev_err(&mdev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		return;
+	}
+
 	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
 		skb = netdev_alloc_skb(ndev, size);
 		if (unlikely(!skb))
@@ -296,6 +313,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		cond_resched();
 	}
 
+	pm_runtime_put(&mdev->dev);
 	/* If we're still starved of rx buffers, reschedule later */
 	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
@@ -362,20 +380,41 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	err = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (err)
+		return err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		return err;
+	}
+
 	err = mhi_net_newlink(mhi_dev, ndev);
 	if (err) {
 		free_netdev(ndev);
+		pm_runtime_put(&mhi_dev->dev);
 		return err;
 	}
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 }
 
 static void mhi_net_remove(struct mhi_device *mhi_dev)
 {
 	struct mhi_net_dev *mhi_netdev = dev_get_drvdata(&mhi_dev->dev);
+	int err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err)
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
 
 	mhi_net_dellink(mhi_dev, mhi_netdev->ndev);
+
+	if (!err)
+		pm_runtime_put(&mhi_dev->dev);
 }
 
 static const struct mhi_device_info mhi_hwip0 = {

-- 
2.34.1

