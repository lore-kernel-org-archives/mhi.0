Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CA336EF0
	for <mhi@lists.linux.dev>; Mon,  1 Dec 2025 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764610867; cv=none; b=NH6oHpjameh13Quyn8O6qlRSd48zYyR/8ZVui1Ohqyh5vtgDjAkp1OMWE+bkLly19vUrB2MsV3Do60jLt+b2jeqq52nQPEW5Tj1yYk5hHQo9r2ts0WyFZiB4mriB+suJnYagW0SwyojNt5UIpSJj1da6DI6nsepcqQ9lc9UPfzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764610867; c=relaxed/simple;
	bh=kQ0Zplu74sroYykShKNsBr0haSMA+a+HAxKkzuexd9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lwy5N4v7ybE/c9TaloIAp6novnaO+D5t9FSxGnYzl9qo6MXQXlKPYTGvZE0Huztr5piRPwcNNY9xsUOSxVW0VftEupT9jW0MmR8+htKOqT2u96RSFCVlBK6R9nd+UgqK28RKHJ+RWDrahvsIsoKevaCssp0yWYZND0JnPBF9zMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxyuzaXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMpjixBC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxyuzaXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMpjixBC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1HdYSC3433199
	for <mhi@lists.linux.dev>; Mon, 1 Dec 2025 17:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=; b=ZxyuzaXv6A26qiRW
	3ib+4vKjJnwB99Ulmz3+RRb3QOIt9IEjEBZ2SK904Gsv6nMU2UluCtxKVvgbRPW5
	aXIV0VxAUSTF9gt+hZmetm/hPC3OkeqsVaPFydPZLYXkVi6jmR1m7IIpi7WMdh31
	G1p/Mm5LYsJGCX7rhrWPgKhgo7vMYyzGcSbUtkJSFYm8z2SL/nbgk217ze6jfZvJ
	eC0pkwM6QvoPRK63MsxQXNL1M+QTG01ljbQaMRJVju5uvMdOjxXBsAqaxu4C3s4H
	/zjOeRaj09yH4rJo95lgrRbtjeRy5qN6DQvXd2C/tC2nj88agyNrKRoRmpFD/Fpd
	eNuP+w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re1ht3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 17:41:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so4088228b3a.3
        for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764610864; x=1765215664; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=OMpjixBCZXXE0ARE8SJRib5njmKR6bAHb7IgHmn59ZTsVv7YVYcQ5ipz0xgqytLv++
         JY4AaeJkuoe13ofxGtKNcWazUEO5+Vryi73jPEaX3KJ1xswkp2P9qk2d0k2SkcJmLSM4
         qoFmj1zoyAUUeIdBRlGHlyXKy5721WkryLqvVQG2nbvmmfOfOuP8mgqsMg9KcE2TnlL8
         ckUpbDXW/ayuS0x0zwyM1Ljz5TRMl6LqhFbve6VcYg4+y2zbP/J3N+qrqhLTwwx0hxad
         2j9ElnfuHSvq7tEMhyTX1ImkUY/qALBaWidS5/jaX33OGErL758KDwPzma9gy08JgBS2
         +S9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610864; x=1765215664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=c5aB27WJar/QKlw9bto7Jaiyhqc8GGP2dP3qYSAdXQuoj4UKyjOpuMOVd38TFxsOnL
         CnbYglKjpkMBLA1U4AvwkEOKvwgWwLsIU4kwnteUL8Qt9hCtNuxykl4zmPwG+Jynd3w9
         89FXf/1PILj3PCG+G12zBpqtg7dQwaCjpFD3Txnruc9J2qXvApoGQu7GkyG9ewCnhLaX
         tO25ZxHPeGV5mwS9kSy6hlhCQhj9Fc5rVP/FMhe3ZPH1DmTexumtdLhZXbPhludItUpC
         de1XGRa9+P7gbra2uvB6igx1UovOVOYRiqICVdV0gjpMAFCHqw0Q02dFMrrwTSPrQ9/7
         5VOw==
X-Gm-Message-State: AOJu0YwtA1iRFJ/NQBtnr6rgw1815CGxR+KyeiqI7zbxjYU8QSBfpFuQ
	p444OeWDfbGWmAwk+KqFSnUU33brbXOChxlc3+CR9k1d9UKVAwMDW/EPJK34zSsW0w2d/rE6Pko
	ODCHG+2XMHmJHDgZnYuIVgpR5NNXi8EnYXscfYJB3WNGKw8e3kxTYW0I=
X-Gm-Gg: ASbGncua27MLiEIUtAFszip7lx61sWpYDAcAGMVpJco7juFbeQUxWsvVoACzH1SxhE0
	yrOGZgLS/lawQYEaEZDLnPdxCUey0g5mLW1ZYBFzNPYgb/cHqPdPKoBfxSjdQ/NMvcx7C/xcIiy
	O6S4ZZ/j4BdGDkeN9bxxOrDJBWjlM9KyfBggMZ8LkraEn7SXh4KX5Pd1aF93TY0Kw/h6tcz4TXr
	oUTjgbLzBUAt54e2/sDwG8k6/m7RqGK1S+da7qbtLTaZtwzKOyMgOdFUdX0ejQgE+JSRrPz9BFu
	QxRbEO9lsujpxUCHMmVrwexgnSyQp7HJC4l5iasK02Ph8XDxGwRaCoNxJb0+pMgj6ZZoFjR6k3Z
	4jxBFc6rdlwQuAh2utNDRPZ7aZvDEwfw8QChDIqlMjuk3muaG3RTyGT0H
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315552637.17.1764610863732;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuoKHcI6kog7ZiSeUimSTc1QQRfMcR0gyLQvIhQiA98rGJvDjNieYJ0dzMpSwyxYjBOD4K6Q==
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315517637.17.1764610863190;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150c618e7sm14245014b3a.3.2025.12.01.09.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:41:02 -0800 (PST)
Message-ID: <ce68d28f-c737-402c-9f6d-f13fec4d2e82@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 09:41:01 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chris Lew <quic_clew@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JpRWc-Z22HHIYMV-99OWMnkquYgNpVPh
X-Proofpoint-ORIG-GUID: JpRWc-Z22HHIYMV-99OWMnkquYgNpVPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0NCBTYWx0ZWRfX8gNKGA3wcYeS
 mB2oc3NX5eZbf+i91E8DUN1yzldzsEodp7VX4dqdJh5Smja/VqSB/A5JcX3MN7q2r9X4HMMAw98
 pWazxdPQGk8Hrd7F/3gtWYmJwIjoY5Dal7xVKIw5PjW/0NICKetwNg0zxWAmp6uUUpmr86Z1c+X
 rbe769q9YMJ0zmTGJlsJJ7gwskHQ5kP5N4Wt4JMuv32Z2akkcyHAuc0jDt3E7TyzsmiKVZ8ZqGp
 sJ6X8xmYod78Hx74Jj6/huoRWm7/qQRAPmHfeW/rTCU124mURD25wK4r+N///NPcDfliBvt27Or
 VqSZHfyFFL0TOhGu1/tQkYTnDD8ZrsBYCxiTuFU49Obwi1ApNdNZEy/xiC3CiKLWyCu47xYdxae
 rhipD8dwGtnorFg2GeO2SgV+oqlh5Q==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692dd330 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vwh-6NgWTdBnnHhUpCYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010144

+ Chris

Do we need to consider updating client driver (net/qrtr/mhi.c) ?

Regards,
Mayank

On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
> Add runtime power management support to the mhi_net driver to align with
> the updated MHI framework, which expects runtime PM to be enabled by client
> drivers. This ensures the controller remains active during data transfers
> and can autosuspend when idle.
> 
> The driver now uses pm_runtime_get() and pm_runtime_put() around
> transmit, receive, and buffer refill operations. Runtime PM is initialized
> during probe with autosuspend enabled and a 100ms delay. The device is
> marked with pm_runtime_no_callbacks() to notify PM framework that there
> are no callbacks for this driver.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/mhi_net.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/skbuff.h>
>   #include <linux/u64_stats_sync.h>
>   
> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	struct mhi_device *mdev = mhi_netdev->mdev;
>   	int err;
>   
> +	pm_runtime_get(&mdev->dev);
>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>   	if (unlikely(err)) {
>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	return NETDEV_TX_OK;
>   }
>   
> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>   	}
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>   		netif_wake_queue(ndev);
>   }
> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   
>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>   
> +	pm_runtime_get_sync(&mdev->dev);
>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>   		skb = netdev_alloc_skb(ndev, size);
>   		if (unlikely(!skb))
> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   		cond_resched();
>   	}
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	/* If we're still starved of rx buffers, reschedule later */
>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>   
>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>   
> +	pm_runtime_no_callbacks(&mhi_dev->dev);
> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
> +	pm_runtime_get(&mhi_dev->dev);
>   	err = mhi_net_newlink(mhi_dev, ndev);
>   	if (err) {
>   		free_netdev(ndev);
> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>   		return err;
>   	}
>   
> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>   	return 0;
>   }
>   
> 

