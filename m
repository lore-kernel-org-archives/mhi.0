Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9731CA50
	for <mhi@lists.linux.dev>; Mon,  1 Dec 2025 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593029; cv=none; b=a42Z/w8T6CLilonOs9Hq2GNGAI5niYUSuymVQtGXvsIba2AnYqF/GI5ufHrrCJ20sqtcueZIpgiY0bHOuCcRR/N9G/3KbTAQr5/Z0XpLtXMiQP/1Xg+m8tE3UPP83H4kf4y2JZQqZeGZrpOh/MYe2nV80j3J7Tz0ohc3ZZ+bZXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593029; c=relaxed/simple;
	bh=rbqwP2YI4CzGHgLkC6DPKf/HhJhVBMMGwEXYBUIoF6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+RdWr9caBh0cIedngnbW2zzODrCB9hAhKqRRR6KQSUTDn5Q8eUBZxw/FOt4GPQuq1Uoz95tJ3LfTHyuIyKVbGki6IeCiptWc6lfjzwmXLUKJKkjMUb+0ya7R/rXJPggdhxbAPSbFiNHnIIIe5DSTurQ3eHvdy0znchnr8hXguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XR1PcdKX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQzUpgNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XR1PcdKX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQzUpgNv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1AxTEj349146
	for <mhi@lists.linux.dev>; Mon, 1 Dec 2025 12:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=; b=XR1PcdKXJkx1y7lP
	1hl+9CzAqtSL+e2kFxF9sah35MGnmVSLivazrLvPrWo8zhkg7+7F3Yc0qBvAdw0D
	0Rcx9XHoC33Q8YGhzsSr2ctUULz9VLVFpwG90cz3XFjuC08JTXw8+X8F//dQ6yUO
	EUI8HizI6XGSjaSydbEGKq/bfDn3etKvt+Y+kjdW42c124s11HPFXwt3c/iPxi9v
	LpGNA6GsTRNY+gUhwKKygIq+XJRpipG6W8++QY32QNS9U9UR5SeZ5Mud0gWSY+9U
	3IzOsDms4kTgtONn4rgbYXruSqffW5sCfJeh2IzcdSiUw+glechcoP9Yr8sdEhnz
	gkzUyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9re08h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 12:43:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dfae179bso85189575ad.1
        for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 04:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593025; x=1765197825; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=;
        b=eQzUpgNvxq4Bj34L8jkgd7kUD/ey+nQYxTI3osO0JYDlJqusncGTs3sBNqDplH+i1U
         +4TkiGTQTZ1ve/mbwJVWBjYZhIfzclJPEEVOZT29eOA4BKPcPAokPULzjEgNS0QtAJbF
         LkcCP5PyP3Dhz9KhqDEuWc1pL43nTUk+nPfOYxwEJYbWhsrLe6EQ3LZTNXGb93uCYYTi
         B2tmnB5FaGvj+iJ9HK7nv7tJNSrHw8cLAdy+nra2biwF8VK14P4JcoGvWD1dRU+/xT4c
         hK+FMvDhTCMusXeg3NOclb9XTS4S8QO+94HcKotOZGSaUG4y/NGfNqfTW3RZvbP2dfFE
         Jx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593025; x=1765197825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=;
        b=AqOd0kVTrvqYkmZMUy353t/9TfNmZrmtw3UqTxfCVTkg58rzQ7QpzOtgx7Q9Q1jiih
         gjhdKuBgWjJ/VKvMb0H35iqjyBy3vh0/KtXTqeHyqAKKz/mNYTQZ+9WdVKPHMb2vlqay
         rlekme8d0XPS8mrToN2qhK0weCSZPyGsTGP/i61UFy6gxxGpbpMGvosZF+tjIhyFt6Uj
         xxasFirj1YzOJPrFvQ2+76U3kZhgH051b7ss7dTaTIT8lTsfxCLjp8g5JdPWYZC+okTB
         sYbq4IKsExfJVrGAiR/KOhedoiQ03Q0fCSRBngO83ggcNfp9ld+lA+i5p3hS/cQe+uHQ
         q3sg==
X-Gm-Message-State: AOJu0YwL6/BXMGb/L1EsgHl+736dWd90ZP0Jh8x+4zFrR86TMY9ltYRL
	3iB+omuTnOllQHMRg85CYssZGhlbfsw+qbFyECdyXyZRuuwsBsIaO9t7fJG9JE82SALyRa7oxyT
	OxMCd9JUfYEzBu1IkmEKkTuym7OfNrxotrm6E8qkJYyqKR2KHqirH4C8=
X-Gm-Gg: ASbGnctQG1RPdU5Smq5FyvPBUHBolnfWL3dclNuzn8jMYjyN5ZUvbaKgAInLMKOEjhz
	nAfdimJqXFeZsy64lBppztU9HblS1Vx0aj3rKtHfZVkcc8BTrV/k4tmRRKTmsdBGecpYX29+pjr
	k7k4ZgsDTcQfw2Jk+Dgi1GOj1zXqoG3jWzYyRhjvNbxxfWz4T7bVexYCXZc5nsUKHW7YxUie4yj
	utjzVZoMWMcS0nWkBy6Q7qLnHPRPUVOGZQfl69QVSXF6GgPJLJW+3JVqjmPwugh4dh2jkzD2mH8
	ZxwosUsuz8jqKv75zNYicGuB0CCD9+xWPU33OPOLkAAMgReG6n6PwMuFOhB6hA7N8IE+2atfJaR
	4+NIRA6JRcwoxQHWgcuuZ6lewNaeDoLH1/xbHKpTZhZ0/
X-Received: by 2002:a17:902:f712:b0:295:82c6:dac0 with SMTP id d9443c01a7336-29b6bf3b620mr427701505ad.36.1764593025059;
        Mon, 01 Dec 2025 04:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQRyQeaORqv6EIcBnGlMaq26A/hMlADJNn0YXR98fYBetj3iI8jUv1Ui+5YteXsBVLZPjwlA==
X-Received: by 2002:a17:902:f712:b0:295:82c6:dac0 with SMTP id d9443c01a7336-29b6bf3b620mr427701135ad.36.1764593024474;
        Mon, 01 Dec 2025 04:43:44 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:19 +0530
Subject: [PATCH 3/4] net: mhi_net: Implement runtime PM support
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=3344;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rbqwP2YI4CzGHgLkC6DPKf/HhJhVBMMGwEXYBUIoF6k=;
 b=/Y2lIbKnoetk66YeT7B0yhq+Lp6V/NhqVD5b7G9I3ctKq/8126e4MtAa3KtI53yQh650IoAtH
 yDP4z6ZpJW+BDRVzLPVbyhcZhAeBx2UtPa+G7f/CG+yfkSzgm82tWqi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX2BCJEix91gvM
 g786rGBqIGfl6gaJZ0ZQcHCjo0X4bDmLmmg7zyNu52+hKH74BzPUP4l7ccz7DuA6D5E9b6rFIx/
 UNaSCHa85TFZp137q7tFZioRT5IcZwGK0MfMgsqs/mAGwRc8XrSgOKWFiaLe8O0IV3JjSz6mEFI
 J8LaWN4ad+2z9QtZhVKHA2i4jjrdsk7+rr3er/G16cThehBMYxTufBrr8RQavGlqduQ+tnwnnZJ
 9g+aVxWFaQOrm3AnQWRMh4Z2rxQrGlujYuZjQotxdvVYnWfBEevJ2ABsrNUw7RLnYThZ8jCsc8Y
 MZwu/B/Kv9RchFe3CYBf5dVWfKs0Up1rmqmdR77cBvlRbUipTxajjwJleA2kD5t6SOYO+KFBW3a
 fzx+nkjSRmX+1d6TVdUyE1rF/Saw4g==
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=692d8d82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FGecwo-O3dF_YbjdleMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: s8_yVV6XqAHQD3zjyB40c6DM5Rw3ofZU
X-Proofpoint-GUID: s8_yVV6XqAHQD3zjyB40c6DM5Rw3ofZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010103

Add runtime power management support to the mhi_net driver to align with
the updated MHI framework, which expects runtime PM to be enabled by client
drivers. This ensures the controller remains active during data transfers
and can autosuspend when idle.

The driver now uses pm_runtime_get() and pm_runtime_put() around
transmit, receive, and buffer refill operations. Runtime PM is initialized
during probe with autosuspend enabled and a 100ms delay. The device is
marked with pm_runtime_no_callbacks() to notify PM framework that there
are no callbacks for this driver.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -9,6 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
 
@@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	struct mhi_device *mdev = mhi_netdev->mdev;
 	int err;
 
+	pm_runtime_get(&mdev->dev);
 	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
 	if (unlikely(err)) {
 		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
@@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	return NETDEV_TX_OK;
 }
 
@@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
 	}
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
 		netif_wake_queue(ndev);
 }
@@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 
 	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
 
+	pm_runtime_get_sync(&mdev->dev);
 	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
 		skb = netdev_alloc_skb(ndev, size);
 		if (unlikely(!skb))
@@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		cond_resched();
 	}
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	/* If we're still starved of rx buffers, reschedule later */
 	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
@@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
+	pm_runtime_use_autosuspend(&mhi_dev->dev);
+	pm_runtime_get(&mhi_dev->dev);
 	err = mhi_net_newlink(mhi_dev, ndev);
 	if (err) {
 		free_netdev(ndev);
+		pm_runtime_put_autosuspend(&mhi_dev->dev);
 		return err;
 	}
 
+	pm_runtime_put_autosuspend(&mhi_dev->dev);
 	return 0;
 }
 

-- 
2.34.1

