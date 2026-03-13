Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A33C2D
	for <mhi@lists.linux.dev>; Fri, 13 Mar 2026 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773386181; cv=none; b=rKR9OP2ZQi29pVMd/6HrB33/iBhCsMXXpbe214swh3bTSclmZwfdDpun3VI2gN2vvTrA3XGL/ia8TxjfCzELCRGnVNXcZVo8FjNAwJ0h1Ppcj0kC2wm04+GXdasic3Pd/lv3RAD3sgq7VkbPTx+f805iBse99kxTd8j00/3d1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773386181; c=relaxed/simple;
	bh=SFwI+Jq/KJmOfA7abaLf8IREH4YS2mFFsWRr7zhWaVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyZI3D6uETNcJg6dCGbjkxIS74/07jmbUOKpygWmhGDz086jwOoCV9yV5mPnBSZDBzY6g7SN5Jhmg0ElSwkHfLXHy3Pib3XDAZzGjGcH4xEXIGs3X2/UyISbg0p70Yae/tVnA2rcH9LNapTGyCCmyCou+22LpIJHImC+KkXb828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYOta4Hp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMAgkpXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYOta4Hp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMAgkpXt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5teJU1574605
	for <mhi@lists.linux.dev>; Fri, 13 Mar 2026 07:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=; b=kYOta4Hp6PVm9IEo
	z0kzYQ7SouURAyJ6rUTTvPIoClsZXCgEpgm9eIegOOHN5QFlkHFjyubBt7hd7hyE
	cbOMlzo76yJn1yxqMtA+ZqwPGfS3bCV34TogNZSJ5/VCPWu5j49ux1+sRj+B651n
	QGMQiDz/iJd05KRzSFJVg/BFBYj4+WjCDwsdxWkF38g0A75m5ktyIstd2V8SbjET
	zdzuNBkA1Zws7sfX9UWbOnpwy2H1OrCtQuJG/DgGhjZ0x0G+e++0ROoTnPyA5xE8
	L1G9gTSRqrfL0RXA+uVzBkq+8GWOL5dpt1EhWOIeq/L6JCiZfHVex8W+W5phkdJb
	rpJ2HA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53mxdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Mar 2026 07:16:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae6dd98043so19887055ad.3
        for <mhi@lists.linux.dev>; Fri, 13 Mar 2026 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773386177; x=1773990977; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=;
        b=OMAgkpXtmxQSI69XpCl67wzpqVhmGOlAa4SDkpRL96jDUQWNzUqDuupn0eZpFq3dqa
         f0MlmJqzNMhDjmvOW+n3TX9eY+fA0ycf+jMaQ635Sr/MCGXwXlHd+iV30U7kCWr/hRWn
         Gnd+oXteXZWINO/zjiGEQtnivPcO7MwdeNw0gURcO7vvTOPDNIy/AJ1o+Y0DAWqJNfHs
         YzWp17IXsSLWrezL2OxSj/MSobmgJAh7OoudOW4SZgVXlz9RMfq/KQPJZvp8MS6nMSIe
         6yl7GPm9/RWsPWW/vuhUoD2JJfEwqBgaJtQVhntijz/swOuHLtNgKJRlGTaQ6Ra0UWsR
         K7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773386177; x=1773990977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=;
        b=cZswkvrCwAqzk4+CQQ3nVaYuhs3X83UqFoOClo+bN/PwruVEbHPCe9SFmajrSOfFFJ
         W0ODLqxoqBOkiU0ic0+x61ZKHyfVsNQIKD8rXsokg4gbxm5SGQPaDEtfrTzRWeXjb9RG
         +wPLbJeOlGLiIiHLBq7gOilsAngFAFwxqW8YLaGE2DUzbLBw/MwnpvIiBD2MUl41Jy6c
         LNQ8delmB60swOdX0NxxVEHSgzQxDMZUOvG9VLcVf11SfMIWwTuZ2PVnumXuIbaFzzTT
         MUptA2Ws9XgZi2fCt2H81okhbFx96M4Qv5H9Nskax+gAtfbIGAjxWNJQnwoVzLsgojor
         ZzLg==
X-Forwarded-Encrypted: i=1; AJvYcCXxO3Lu0oL2PWQV63fAsoKtsXeZiRxBU4iHNTNpx30vlIQCpoI/Wf4aTVneN6DCIux+2fw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAY3DkpXyHWQeeyxiaEM+IWO/EfquVBEUku291OudmDKJyin3A
	x533eEXwE6vrf5DI18oBc3t6uv9sZwMTMipTSGrccX6zJLwNgF/TxUx9mgj4ONWvEeQjNS6oaVH
	QCKEatwZQNeXp7raetzH2h0AdDkJI26Ci1p8fYTKOyoKNVPBeVAkH1Rw=
X-Gm-Gg: ATEYQzxsXb0JPa1lPCSGLt0miWuHF3u9HTPn93ZMCElJimgAOHagVYyoGfwpa+hc510
	pKy7bbqmoku9e3zwZeusq9Afb6hIDJsHXboiZOnOZLw6LxtWlwHQEoYeLBleM+4s6LLgg2SZhDv
	IcQ/W64xLk0C8UxOAKHMCmnBjmAN+4QBtv3WAc8l9yS0CPBXztKyLJBuEhjv4j7e8KOrUAxjwip
	oBY+wzl2VQIrsWiRvaWqyqDXJLu7BnUervYV39UFW1AyKMFQWPPjFoVBPlxKR2rczXlAfybXyea
	ZSy15E02H6ykExtj+h+rsW09g+tY7yd84KMYqD4iTvSu+tIHLgmOQRN3UVuiaO3rkAUI4Jd+VD0
	19wYdTKOVWuFdUCNzo4gBS8NYO/OodaLr8iqfRyX5e66CzJgWzGlLOg==
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr25528805ad.37.1773386176729;
        Fri, 13 Mar 2026 00:16:16 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr25528405ad.37.1773386176268;
        Fri, 13 Mar 2026 00:16:16 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c733sm16610105ad.35.2026.03.13.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:16:15 -0700 (PDT)
Message-ID: <a17e4c07-1f00-4b0d-90e3-2eeb1e71a248@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:46:08 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
 <nj4ovttt4i7hsqfdv5zhdotxrx3upxfq4ozuligwuheubnsmkd@e6bwzgkn55kl>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <nj4ovttt4i7hsqfdv5zhdotxrx3upxfq4ozuligwuheubnsmkd@e6bwzgkn55kl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3b9c1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8pif782wAAAA:8 a=EUspDBNiAAAA:8 a=BRVcir-zca08BhkZB6AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NyBTYWx0ZWRfX6+rZjlkU1Ggn
 RC3Kp907R60oyMTyaPSrM8SW3Vnsmg28fCzZyvLnqU5np/z9wEHZg4K6L+lE7VcUwMvfgKhL+9V
 QGtAAdlAC42xhHvFAYY2U7Kx9AeQnswgtMQjLAdhu0vBYLPaLT9FnPOGs2voo2z6+Wpayu1AiPB
 usM2ZfU/fE1I5RY60VUqG6ssQfVz8pG7L+8uWhv3Lq1QnrcVnKH1bIb225s9dI6AQrHc2JDHgp9
 8MxKLbGmz6Z9vHs0L5pFggO8Y0YD8IYR0XrRVt70T6A4Ip8q+Y28YNiqj1VzPNVGo+Xs7AeAw01
 Op3jdsxkyTN3N/DUiGGpBkovIZEdnscmFZo7alLatD923msiBcJhSkVOa2dA6hL0mjALpfuMHhm
 VjWBt/WmZb7vOftUrOK3C/kUKWUO/2DO7e0FSLH4sT9Aiud7HiFbKYphcl8pRwtKxu7Nt663kI8
 pmTg/X3pvXt3lBoELBA==
X-Proofpoint-GUID: U7NUTtKFu5981CQXYicDCOlAU7VH4ALd
X-Proofpoint-ORIG-GUID: U7NUTtKFu5981CQXYicDCOlAU7VH4ALd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130057



On 12/3/2025 3:07 AM, Bjorn Andersson wrote:
> On Mon, Dec 01, 2025 at 06:13:19PM +0530, Krishna Chaitanya Chundru wrote:
>> Add runtime power management support to the mhi_net driver to align with
>> the updated MHI framework, which expects runtime PM to be enabled by client
>> drivers. This ensures the controller remains active during data transfers
>> and can autosuspend when idle.
> This last sentence hints at there being an actual problem with the
> current code. Perhaps we do this because it's the right thing to do,
> perhaps we're making this change because devices are crashing and
> burning?
we are doing because its right thing to do, with current code we are not 
seeing
any issues.
> Start your commit message with making the reason for your change clear.
>
> Ask yourself https://en.wikipedia.org/wiki/Five_whys when you come up
> with your problem description.
ack.
>> The driver now uses pm_runtime_get() and pm_runtime_put() around
>> transmit, receive, and buffer refill operations. Runtime PM is initialized
>> during probe with autosuspend enabled and a 100ms delay. The device is
>> marked with pm_runtime_no_callbacks() to notify PM framework that there
>> are no callbacks for this driver.
> This looks like an AI prompt, does it add value to the commit message?
>
> It can mostly be summarized as "Implement pm_runtime in the driver". The
> only part that's not obvious is the 100ms autosuspend delay, but you
> skipped explaining why you did choose this number.
100ms taken from pci port bus driver reference, I will add the reason 
for 100ms
in next patch.
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/net/mhi_net.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>>   #include <linux/netdevice.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/skbuff.h>
>>   #include <linux/u64_stats_sync.h>
>>   
>> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>   	struct mhi_device *mdev = mhi_netdev->mdev;
>>   	int err;
>>   
>> +	pm_runtime_get(&mdev->dev);
> What happened to your error handling?
ack I will add error handling.

- Krishna Chaitanya.
>
> Regards,
> Bjorn
>
>>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>>   	if (unlikely(err)) {
>>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
>> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	return NETDEV_TX_OK;
>>   }
>>   
>> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>>   	}
>>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>>   		netif_wake_queue(ndev);
>>   }
>> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>>   
>>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>>   
>> +	pm_runtime_get_sync(&mdev->dev);
>>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>>   		skb = netdev_alloc_skb(ndev, size);
>>   		if (unlikely(!skb))
>> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>>   		cond_resched();
>>   	}
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	/* If we're still starved of rx buffers, reschedule later */
>>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>>   
>>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>>   
>> +	pm_runtime_no_callbacks(&mhi_dev->dev);
>> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
>> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
>> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
>> +	pm_runtime_get(&mhi_dev->dev);
>>   	err = mhi_net_newlink(mhi_dev, ndev);
>>   	if (err) {
>>   		free_netdev(ndev);
>> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>>   		return err;
>>   	}
>>   
>> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
>>

