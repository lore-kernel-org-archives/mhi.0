Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDF27FD48
	for <mhi@lists.linux.dev>; Wed, 10 Dec 2025 06:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765348235; cv=none; b=NplsjWT4FSlAdN5nX/T+68QZ017zOPpl6vh9i44ZCNAQidFPhc8tVuPWd8xiZ3swsXsGvqLj6fpIowuGcC66S6CQMDBHElCM27zCLqJUwZ5n3msNfd9AQfd7NEGhcksYHYKHpF9OIQRqWa9yDD52VMDa1yiVch4VFwkrhrZW+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765348235; c=relaxed/simple;
	bh=O8HUoaSUxN0lwQuk2R6pVYJ/E9trzG6EwOSZXVhKEdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlXIxcz4TzcKznX9BNTG+lmlFABdihUgP/MAGOTjVSustv+SzaBvNeJVko0eg1pz/Yrsi4GMOkV1gxxfa3VkkBUJ3UpfF2/tT57c881tclvqgZdv65QIWCfLAaCcWefRVC5cg00iD2pt6mjJcq0/it8dDjrITHiFkxppsC5uwbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQcI/UkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQ+S/r41; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQcI/UkZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQ+S/r41"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DluK1953923
	for <mhi@lists.linux.dev>; Wed, 10 Dec 2025 06:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6q9RFfbyN7BJ8f14Run+4QbQe+TihAeoBebl1Z0ZT0s=; b=SQcI/UkZuz82q2EC
	ugord4t7WemhvS74IB6IjG8/CJKQisPLSguABIb/HjwJzzYIa6bF/fFVjSrTb66e
	78EsLlySuOAQ6DPTKGrZz3T/HMFFcNTwunGqoiW9rmbDrhXcjnNVsYWIpcFY20cs
	fcgtSJRwI5doz4alP7DDOpaPjla7rT4ylj1em32Xqskeyr0ZNdjj8weA/xgn6BgG
	1AV9y94brL3iSdovkagW2QuWCxQd23Jl/XhhOAPWImzbC0HWDkGHnybyQ2BUfMur
	0VITdoQ7U6kpGzUTBH5sNFyeRbZ3qAiDa72wVeQt6ElLmgIB/aVHGELW1TGhhEdS
	mmkH0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p2nym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 10 Dec 2025 06:30:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341aec498fdso8285435a91.2
        for <mhi@lists.linux.dev>; Tue, 09 Dec 2025 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765348231; x=1765953031; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6q9RFfbyN7BJ8f14Run+4QbQe+TihAeoBebl1Z0ZT0s=;
        b=DQ+S/r41biCno6p0hr9CmM7q7a9LC2NFXBLWAJWsmXLgXyg7Ht/5D6aTJ0+DWaPetX
         Ijvirw/2XzErJbRshPS4kztPzydmf8E7EhFjHXCa+HIC3rLZswNwGtXzJMSXJpu17hqC
         qCjpFkDaaJMQqSGtYf5Dwk0A2BXxqFVmjjZB47jA1Ti94XLyy/k96loFHA/l6rLAIR/B
         E2enCO/zg/nsakCtioTgxP9JiAoFzpBym/GfjF9hd5/9xQDWPnDLkbSJ6pZp4thT2bCa
         fYQhfaMcMf4INMIG1Hc6vFDpwTzWOOSdAkQF0sZP52NdpvWmPAD+nw9BTK1hUg5UJ4Dn
         X4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765348231; x=1765953031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6q9RFfbyN7BJ8f14Run+4QbQe+TihAeoBebl1Z0ZT0s=;
        b=sTcsbj9BOGChSa1N7K/+oAvM+mbhaD25ucb7wllZvpEB14zXIZkye5bssHFQr2KtWK
         dRovqoE0reB2XgxnbBxY/FkjFB+lOP6+ZHdVJ8xtB6Ep+dfW3fbAoQ9l8v6S6IwGhqz7
         pW30VIHqxfx1jXR1O9IvkU1jpS4pkiV7eDnmbwfVXfBL6Axg0jQIwbcF2nYWlccTNDnK
         UewrDp9zMj+nkuA5TCj5orUs84cmJo4s2ct60chGif1kHgNTyHj5VA6T6GLiLpamJKyy
         ygQhjXIX1KMuAZ1NDQ+iyA84mm063gbk0bumi8E0akoK9DPjIBtHSLRY/H0OyoN8vJls
         j1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVGQ8wBNwo0tK5yoQWxO2rt7BZFxmBIswCktdXxnMaNTvzaA+CZ5xKZsmtzI94BYt/eCAU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPiOG7XYeTb7+a9CCCGKvWe+E8uJy2gA/ukYFxRcHjq1UjpxFd
	QJoxDPp6Xtnvo+rZUDxSpVeNuMxNPp8VloCfbXQFUila1IjRMg9HH1UR6Zqz+iTYC3Jj2pLSP/T
	JfRQ8sqtooFc9mM9GKE6QjysR7Y+ciz4gMdmJghr6lSqnQ84+CNHG2Dc=
X-Gm-Gg: AY/fxX7tAFGttEwFAf22wO0AvalYXSs2wvUwHaJSTBCV8KlnbanOb0XeDcAy55lDWAw
	AgdEVwH96G4L9SPD2X9RHS1ZnG0jukKD93MwA0WlDg92F+Zm7NSKMXdFdp6DdtTvn2RMSjWIdVv
	FisG1hrzvhHZ9Vcmlr0s6dGwBGlVQ7StcBAqST8/qg6aFH2OoJn5KvGH9JJ3wZWxMn89LXNoplg
	gXhzkyGPxlhKlSl+kmI4nn9NnOxSwMIMu2v8Hx5rEOFFmCgRhOS2qIsRWwRv5PHOPCx1Kqfh0kr
	Y/xZHMGAV/XGDqoLKrTKVe9dWWIPmy18duECDVu6VTJ0vMG95dbSYhwKIowKKIzirgc88b8Z/0K
	u0qzN5DAkCo0mHqAjHGNdw8RVUL2+bfbK3HYwePZ39Dr1
X-Received: by 2002:a17:90b:4b8b:b0:349:8a8b:da5c with SMTP id 98e67ed59e1d1-34a727cfdbfmr1209105a91.11.1765348231167;
        Tue, 09 Dec 2025 22:30:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXMxHZ4YLg9CFRwKxi/cgDsFxsPK6LFkqm/CLc1kVT+n707zz0quc94eSaxC/51ZwIj/qpLw==
X-Received: by 2002:a17:90b:4b8b:b0:349:8a8b:da5c with SMTP id 98e67ed59e1d1-34a727cfdbfmr1209079a91.11.1765348230691;
        Tue, 09 Dec 2025 22:30:30 -0800 (PST)
Received: from [10.218.37.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf5fsm172705885ad.78.2025.12.09.22.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:30:30 -0800 (PST)
Message-ID: <3470cae3-d86c-4dd5-a24c-c7f4bf6e017a@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 12:00:25 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
 <5a137b11-fa08-40b5-b4b4-79d10844a5b7@lunn.ch>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <5a137b11-fa08-40b5-b4b4-79d10844a5b7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pZP0mdT9UAs2Dk3NzO8rfDcugau-0b6s
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=69391388 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=qHXWqmT0JF4T8da83qwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1NCBTYWx0ZWRfX1kju1gb3G4Dj
 8gJsyKNfnXRielCXPprqHeAGiUyoOiZKHTnKTYSkVhrXIgbyhg9E/XgQJ7XHLnFKOQ+ne71NKUZ
 fB+gaCveVUHEzbMTTOITvNXNRoQBCZcqcVypMNSQrwhRWzceQ//r9dsDdwEEcssDLLKUslatE9S
 7hEluyG6KPC1vTlVLimXLORynlE37JS9iyuZ5w6lgWZlC3Lk/gVhBBZD465fuCkWS5bTLoU9nV4
 2oSUAbKD+zmcybEeXYHur40V4nc1Txk4UJo+jZ7RcuzGFqI3RPpzIJzX1TpgaVL1IZIt+BHWDJx
 VuVEbB5m7DlqYQTVzJEiE8CIsOk24q7oKjapDbTiRRe7oL3EVwJrZE2RhVDg83rSZpUMdkKJ7uY
 S9uimJxOqgtlZTPr38uac37TpBAUbw==
X-Proofpoint-GUID: pZP0mdT9UAs2Dk3NzO8rfDcugau-0b6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100054



On 12/9/2025 7:06 PM, Andrew Lunn wrote:
>>   	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
>> -			    NET_NAME_PREDICTABLE, mhi_net_setup);
>> +			    NET_NAME_PREDICTABLE, info->ethernet_if ?
>> +			    mhi_ethernet_setup : mhi_net_setup);
> 
> Is the name predictable? I thought "eth%d" was considered
> NET_NAME_ENUM?
> 
> https://elixir.bootlin.com/linux/v6.18/source/net/ethernet/eth.c#L382
> 
> 	Andrew
For Ethernet-type devices, the interface name will follow the standard
convention: eth%d, For normal IP interfaces, the interface will be
created as mhi_swip%d/mhi_hwip%d.The naming will depend on the details
provided through |struct mhi_device_info.|

