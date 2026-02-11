Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AD35CB7B
	for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805508; cv=none; b=iznRYQ3sdjHydqrB3KIdwdOYbgAXRM8fybviU5TWAKVyfhyNJ4r3sELN7n9TVCX8nbSsRsedYZ0HOgFLE91mBJhn/l4sUgnMrM9wmpORlpWvbgLEER5pYKIhswce3FRQ8Ydle9yxpQEE7lNCGVi83jD28d+gZNYj2LUQZ2eQQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805508; c=relaxed/simple;
	bh=Cl8ck0GuYNDR48oIXUJNz/BULGIgVDYNWMtl2wLzWKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdNYoxtNGybJ33dzIqQOeFj/VRbPLaHMOFLLkKKnPVXgRG7Rvm0k1rrmTKSUGUn9UDiHTf2ZdJ6zmeQPKiJcF1AsEbfI16V2osUI4nGWyaxdD4j4lZMiRxwcBmGAp6+JhuPMJotHodXgSf8eRTE1blG8vEM4detRHITb8zq3hMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGY0kZ6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaaDFa09; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGY0kZ6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaaDFa09"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BA19S34127441
	for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 10:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/+bh2HNeeTdt5zusNux5prvurN0Yp81hH0VAMMHLrE=; b=ZGY0kZ6hAeLy9bLL
	i/OTmeS5JZkxDjGrH03rq/Ny7F5hqGP9H6QRR2ev6+BiEs6xr0YJTy4FC5hd9qMw
	dnFBreBAqT7bRJA5wNs0FVjCDwi8dStKQ/lbQn1AkWTjktITU3WLvhC8acuc6DeB
	Q/10QprokpGSreAvfP0RgqMZSPR+myA6ND2QfHKnWlnvtJvTgY1nh+WheQkIQtpt
	AaKqMcSacyYzuWFQxZS7BN2UlWU9/BEhZKGodnOu/2w7fFLsVb+bPnoJkzAgF8wK
	mEjWLCYSCpf//XwXlERKcJtyL63NYXH5qIWK+IadIHZ4pL3UByIL229SzztViD2w
	5IDk4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8gvm1bbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 10:25:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8249ba7f6e8so274382b3a.2
        for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 02:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770805505; x=1771410305; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/+bh2HNeeTdt5zusNux5prvurN0Yp81hH0VAMMHLrE=;
        b=AaaDFa09cFjrU8Qto0Jt3KOhG1/xhsFOKwl9G93LZZ/iOnYAGKyGMZakRwSyJOmrt8
         sbKnVo40Yi8h5GxBfc1WyNhOm4gPTBuH2TmCKNkPHq6SCRMIj76IEDceADQz/UaZKthz
         OOBhJnj3ZV5Sfbv9o/3muGE+fv6pBQdBUNFK+0sT6uoJUna6yLe/T1i4yekRTPPhWHMt
         Q51gsPmu5GVzFCxl+8HCDQEN0jBSBZDMOneA2REIACKSWS5xEUweiXe3Egw92MjkkxGv
         7qdqlwCey3VFrUSc0ASB5BZ3kJXgyCanZXJX9ZN31TQ8xgAApYqH+/GVNKPaG2akeHGz
         UHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805505; x=1771410305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/+bh2HNeeTdt5zusNux5prvurN0Yp81hH0VAMMHLrE=;
        b=nrhrAcTswsMNJoeLr0Kf7ZS2FN/NTLzidJOE4mWlwebctMoN+el/V+biL7gqC1PkSA
         p/z1YoXeoQcuElKYdBBPB4/9Kij7E/st+yApre/VXGAHSDzlEP81xG785FEhU55k4UoX
         bFUUvP7IUfbNKdE5hEXwxoFSW3yt8t9xjNtScCLDVHoxc/4wAafY5sdcw9F6eZKJ+EKj
         7wB/SdispfRQNe988Wtcy8D5NCg3/ceYYVVR+qu1ITE9Qn9sc5lwlbJnNa+dt5z4Dmv4
         bB3YLaUZ3+MMgcfe5948mcn6iVlwGRmgKdeyPgFuxjScW4pN4Rq/wFqaH8Tu6MATMt9P
         HSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0d6iHD1UTyAB9kMt9UwmA83SjyA1SIjzPh5sLAl+y2oCa7D72fzfM/j2rnyTEZTmzdUA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZlZ8dhvIp6ik86vT4nWsyswsqGqFhsF5b7rMvjPkO4YB57nNR
	d+6oPF2iodKmSejs6tTnIOAeLi8dCmyWu7dGY25pt5ZZkLVFc6PyrrGRM6CRmc2LzUZw3nAKZaZ
	Z7IgjwvaPnv8JAjbT8hsYJ4BvvmVRd24Tg/uRCf54IqgdIl/yT4jrRoQ=
X-Gm-Gg: AZuq6aKF9hWDd2N8jjrQyQxZwiFSOrynzbC5Xg8cT083Jb13AH0+0b8EqXbL3fAmbQM
	rBu6IBDA+mnxzAOORbApP+WwYAtaZVzyPqeEh6oeQTz229Vs7mLlVcXNPOX37cmY6+oX01Rz4Xa
	2ERcgrVl/PpD990wVKMGZYyR0MLPGC9KceewMtrCyMAXa69QEaqB3IWvYlKmkdlkyrKbyKEDdLK
	s0DoqOcPsTgiPHOvosrvLGHP+bMAP/gpdn3qTpPC+fl93j7Rb9KjRHqnXZMD3vKl9ufG+GoQYsN
	cdvTI/WR8uJE0cBMrSHTLnPHptybrMubcZ+9r15dyEOGIAyfnU/sUeINZMj9v7NPAqkrvd6wAU8
	IMWh1LcmFdZEDS+SfFVNTnLYZzbcqGeTEaYGM94ytTK5Mfvp+CyMClP5wuA==
X-Received: by 2002:a05:6a00:3407:b0:81f:40e5:34b6 with SMTP id d2e1a72fcca58-8249aea26e9mr1918591b3a.15.1770805505554;
        Wed, 11 Feb 2026 02:25:05 -0800 (PST)
X-Received: by 2002:a05:6a00:3407:b0:81f:40e5:34b6 with SMTP id d2e1a72fcca58-8249aea26e9mr1918573b3a.15.1770805505110;
        Wed, 11 Feb 2026 02:25:05 -0800 (PST)
Received: from [10.217.218.153] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e81976dsm1990933b3a.52.2026.02.11.02.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:25:04 -0800 (PST)
Message-ID: <d24a947d-6b6e-4393-b0b6-1e9281f8a0cb@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 15:54:59 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] net: mhi: Enable Ethernet interface support
To: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
 <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
 <59e7518f-65b2-4d97-ab81-bf64af758d00@redhat.com>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <59e7518f-65b2-4d97-ab81-bf64af758d00@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ctiWUl4i c=1 sm=1 tr=0 ts=698c5902 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=yHe4pzvUYGwmH7u3AtQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4NCBTYWx0ZWRfX8yk05yhRGJXe
 Bt52HCmYdtFZk+ZSYKjAlyDB6n7lf8Wg/iUNPSmN9aRPS4Azaqn+fOb3Pi4zO+AvGIC3AddIFVp
 JuV8zlfkapAtPoJeaWW1PQEZN7xl1J2SMKtWMe1f91PwGt5xywCFiG2g451HTNII10CI+G5rNr+
 Bbw5zh1k/IzlCQVwEd8PDb1nFIIE6mn57sH+9+m2vXUon91yWD7AQturA7kEXiTleLcXOcj5qWw
 XgYwHRlE3YDQ1nldbkWRZuz0yTvFkDwc4LOAHZ1YFaTQPkdv/Y/zoFg+/11VUrfhNtqshel6t4M
 l21Z0SvPyfx32tUrFwPcj5alCGb2ZP+E0nuGq/2FpsKpas0TvyAyIMgYvOcCnUAG28ZfNTl5eHI
 yigmrhALxC0taggty845YYjwSVGWx53wJakbPB4AJCsme9C4bYUiBC+OkvBVCNVaqde13Mhq1ZT
 p3XK6x1y0faQzlDQJhA==
X-Proofpoint-GUID: 1Z32Kiee0df8sfqmGXecDL1iFIdRYVza
X-Proofpoint-ORIG-GUID: 1Z32Kiee0df8sfqmGXecDL1iFIdRYVza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110084



On 2/10/2026 4:13 PM, Paolo Abeni wrote:
> On 2/5/26 11:34 AM, Vivek Pernamitta wrote:
>> @@ -4,6 +4,7 @@
>>    * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>>    */
>>   
>> +#include <linux/etherdevice.h>
>>   #include <linux/if_arp.h>
>>   #include <linux/mhi.h>
>>   #include <linux/mod_devicetable.h>
>> @@ -38,10 +39,12 @@ struct mhi_net_dev {
>>   	u32 rx_queue_sz;
>>   	int msg_enable;
>>   	unsigned int mru;
>> +	bool ethernet_if;
> 
> This is not needed, instead you could check !!dev->header_ops
> 
> /P
> 

As this driver supports only Ethernet and IP net interface types.
Will remove the ethernet_if member from the mhi_net_dev structure
and use net_device->header_ops for interface-type checks
