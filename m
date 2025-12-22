Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22E21CA02
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399499; cv=none; b=mi4L/PBj0GhOBisfSD4TcMMU9P3TJkRBG+vi60aB0gwAgURb3ea6PoMbYfItsHo0QLfTBXXCQZhzquc5QLgQdXDOQfxAuYqNeQr+b1GIvDIuAIwF21aKLbCANM8K2e7LKuIosoXu/OJ87GUWbrF51JAb31NjCsjZwqcphR4eYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399499; c=relaxed/simple;
	bh=XZz1xE+YE9rIrAv8TPfmjsTJZft86uRH+WeioLmBXPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg0cAyv/MRxuftvbeyx4IDPpe5B1963rmA42IGK1MntGazjKs3U3YEBQpKY96WJBGBbxl0BwS43kg+rLFJcdaQMRglkNbyEn/ilXQEkPDU1lKc/QWxou2IBX12fLfUE3xpb8RhD+v8jR3fhtcYZy1wYfhYxXTak48IJttX04zC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzhKcOo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFAeFDmf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzhKcOo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFAeFDmf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8QOMJ3931259
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sd3ZsPbmm/TqCzyvuwxbyZGAw0bOEcr60FfnyA+uFck=; b=gzhKcOo6lqBBJNa3
	c3Kn6JGPrLuJ4l9ysd+FN10JKgh+8loTKnkeQiFD+rHdHMjGA6ISKqRevxuNMeHz
	IMKM8cO1nts5Y7VYIvlLhvgXKOLlGS0j6xM6Lj6zgJp9pCDmfKbSfLI4w86klXpy
	UcNl1/J60YdBRQlfqizypQN2sc55NdaZKmx9PfGV/z9hU2HcmI/YSm39ej6IKdIr
	mu+kD82d3FfbmWSm5vqpL3tK+Tr+aXeL7yU2UaZAsKJP9ZRiEr5QuAuLvamdUyMH
	StVRu713dKM+6ytUtYCDpU8dA6LjPH+Cu2g8+uMsP57P9niQ1hoWzC+PaPeCNuPS
	7lj/jg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcpch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:31:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso5578993a91.3
        for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399496; x=1767004296; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sd3ZsPbmm/TqCzyvuwxbyZGAw0bOEcr60FfnyA+uFck=;
        b=KFAeFDmf7ykEjT1KrHUSQd//TULh1L/TtY6FmLzjoh9eImnyrCNZN/j8vjodvgXbf+
         HMNrQtgWcXsbrPFljvPjE4P5cMa9ZixhdP6pe9yXPuT7TRjsRyQLQZLlv9EImpKP+TZ0
         64FQthp4OooE/SNCY/JpUOkZJHySnm/DGdrBxtdglL5Qi5m8LgnuvIVnNuL8nZpQ4QPo
         PP5kQN8vW5jzmAyNGTXxkijAPiI+pzCJsZB75aVm/jj985TJbBtW7+njiTho3tVk2spe
         erkeC7L/thviGjDrWJHTtRYFwhuyhLaxEPHTJa3fRbaI7JKwwje+wVd3agkVlNTCMClq
         7EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399496; x=1767004296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd3ZsPbmm/TqCzyvuwxbyZGAw0bOEcr60FfnyA+uFck=;
        b=qn4KblY2+PFC2jvxDiJ0eQx1J/dCGPZei2ZWqXDnKMCFxniuXhD/U/IIC7z2Yq57w+
         xO0T9j9r9efeYGbCn2pWrUGBYu4sSTwEHIIMDQVp376EBo5+JKyzZJrDGVenAqXgAtDd
         7pOtFQfj0ALh4zsmUTVybj5BbnJuNga7jRRtak7MQ+uoQPGtfQfoivZjczYkYcxM7pJl
         eDRbvfKZz4QLnwyqyoqJfGmeDiXjswaM5maWYuUMmIU6g/jjZ1r/9xnoZxoXElFD07mX
         pbPjYPeRL0rwU+Zu0D/+C6G5gtwMJP/j1zhZchKwrph2hWf7aTOUYMsj4RZBf2jiq4U7
         nH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPHF+soF0117/h3fOQsvUVrJ91iEnelkBjAOn9DF2G1UPtqAo7EWnQQ6q9fYkrRmuHE2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+VGnLm17rXAhgUe2Amh0OOce30g9XiL0VNTvAzDjFSPqz62HB
	X64pWaHSkh5/fYthdinqfx7M4SBf0+D04YOxzU7h2CcwtRTdDHiuhLJLLpgkXvQ6k3ZOq5yWvU1
	4czKMJs0dD1QS2uLK4XOAETi/r+S6WrLO6H4Xb3HrQz4Yu/ri4569dQI=
X-Gm-Gg: AY/fxX7GNx10i1Kw9tWz0x6Lgh0tHwm8TV/njxtuStiucxbstnLq5I3OGXgWfe/wMAv
	T61+zliWx3/CJO1lTClgb+HnSiCTccON+wNbNEVHxbjDDGIAsHmcDcaLQTo8RnRmPp5VNkm6hG/
	8qQR/3ZgaEpXOHrBHDjMM3I1gqAko//qNsQqwX6+n9Ur6YsKQxsGIlCJEvH450TGKhPPpWW1wgR
	ry4T9j8DXKOfj+8AU6H8uWBMIksjdqwEzW17JVsGja890EhmOPYK9A3NNATUa7/i9vpPBxgWVhB
	MYn2e8m2RWrqDcXwbVsOuZkhpME4gLKaG5UMzZpBHwFoUg2ApDNBHSXlKkQMfc6DsdntpGnPjED
	VMpDW2EH5/aPaG5j126Zyyi1lGm3/NJi5bXyTJ832KovJ
X-Received: by 2002:a05:6a20:7285:b0:352:3695:fa64 with SMTP id adf61e73a8af0-376a94bf23emr10821142637.37.1766399496218;
        Mon, 22 Dec 2025 02:31:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuhGQa6gBuPSQ7RJMYPiXhgGuMHU1tafo5ELmcsVLK1rusMvXx55oS11VPo8V4uxFpTc3UrA==
X-Received: by 2002:a05:6a20:7285:b0:352:3695:fa64 with SMTP id adf61e73a8af0-376a94bf23emr10821111637.37.1766399495655;
        Mon, 22 Dec 2025 02:31:35 -0800 (PST)
Received: from [10.217.219.25] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc68ab5sm9256293a12.17.2025.12.22.02.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:31:35 -0800 (PST)
Message-ID: <54a25608-57d3-452c-a838-952d0935ef37@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:01:30 +0530
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
 <eaf79686-9fcb-4330-8017-83a4e4923985@oss.qualcomm.com>
 <a8e6a25a-24c6-4739-a9cc-0e0621f093ed@lunn.ch>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <a8e6a25a-24c6-4739-a9cc-0e0621f093ed@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SuKVcCDbWvaVnXaXUdnB4AN7l3YimjQo
X-Proofpoint-GUID: SuKVcCDbWvaVnXaXUdnB4AN7l3YimjQo
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=69491e08 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=82xI_hd8Nmh2SGOlAZoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NSBTYWx0ZWRfX8WAt2yhw7ees
 ebqON8CtcmbEvwzBJsSDEkV9GwCfHJemI5Gt1kKaYDIx2t75+uc2ecY6y1xrtmGEmiRm5xQ8jTX
 qlqKLxoqrPMiSl0llq7KafJysiFhnkadQLuxaPsYvookNMjau8oipj9/ikFxWXgYExMH+27A1Nt
 UZrdbn9DcsX0deaasozAEpt/jybNZMBoRhepsxP2HRcuW1as4YyAZTZoGWsPGGSqzjsbh9MyPaI
 /QDtZpHKO1SjYVMdVwTzUg+4XvAuHWqFINWnyWzAcmBVjgaAbaEOYl6BQf+XuJrJFvllNF6CMrM
 VoC8yHupW+z4iMwRvzqwJifXUiXw5uvuEzFHJHdS5jzcOGICEQWBqjYXWdwTAfunJxnoaLEvB3I
 jN7w9NaICaVJdgxf8kEwUOKEE2KQf2yugD0YqyO0k76ba+nR4kxt5cOhZeJd8vjEptI8MEue0cP
 29pr3gLRSvdWr7QuuJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220095



On 12/10/2025 10:20 PM, Andrew Lunn wrote:
> On Wed, Dec 10, 2025 at 10:46:11AM +0530, vivek pernamitta wrote:
>>
>> On 12/9/2025 7:06 PM, Andrew Lunn wrote:
>>
>>                  ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
>>          -                           NET_NAME_PREDICTABLE, mhi_net_setup);
>>          +                           NET_NAME_PREDICTABLE, info->ethernet_if ?
>>          +                           mhi_ethernet_setup : mhi_net_setup);
>>
>>      Is the name predictable? I thought "eth%d" was considered
>>      NET_NAME_ENUM?
>>
>>      https://elixir.bootlin.com/linux/v6.18/source/net/ethernet/eth.c#L382
>>
>>              Andrew
>>
>> For Ethernet-type devices, the interface name will follow the standard
>> convention: eth%d,
>> For normal IP interfaces, the interface will be created as mhi_swip%d/
>> mhi_hwip%d.
>> The naming will depend on the details provided through struct mhi_device_info.
> 
> Take a look again at my question. Why is NET_NAME_PREDICTABLE correct?
> Justify it. Especially given what alloc_etherdev_mqs() does.
> 
> 	Andrew

You’re right—eth%d should use NET_NAME_ENUM. I’ll update the patch to 
use NET_NAME_ENUM for both Ethernet-type interfaces and for non-Ethernet 
(SW/HW IP) interfaces.
Thanks for the pointer.

Regards
Vivek


