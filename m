Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0943822B8
	for <mhi@lists.linux.dev>; Mon, 30 Mar 2026 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848540; cv=none; b=LAiOIqS9kFGvOsqoz8BvWvFl1b3GPOag9H18/PBoXcuDb9iNbXByKbAfvN9jf5OQVpHm6iwakG9h5NaQ3u2kR6K9SdEamrP0g7OpoBZftaA//w7kGQJ6hegD6uFDiebmXPp+F8gccjg+4nUsDr+W7x7YE3OckUCcWvYpSq8IpW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848540; c=relaxed/simple;
	bh=Oqnfe1B7pgXZGMnxOjT9IdortdmUJNYX97ief7kKKuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlJaaeOusbE8PclvTvs4OhSxQFxWT+3n1WB4gGsSr+ifF6c3O0H2a8R1jyTjCTqFsbqPimabZx2fVnHqxsyS2Fvt5lQhKUtEQ/6NoQWdnqSUxrRkLI4gL66uxbo/zLAI7UWFq8oZHBGBEQVrSeKYWkUwhHwz5SGzqUx0DMgocAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5lCeoyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkfEYmp8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5lCeoyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkfEYmp8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4JwdB3933557
	for <mhi@lists.linux.dev>; Mon, 30 Mar 2026 05:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20GNW5it+X2su5CUYneKv8hJ0SfE9B5LXD06+2GpUP4=; b=g5lCeoySpJ6p+RGZ
	xk5oP67iwVMc1hZO7Zph4sopamh8o7qo1u0ZHjXuRWpQVOcxa63+QEavAACHGdlt
	TbYQqLRmK23SAtatcXsAjoX03lT0H338vBOnzvt54beJK4OyH6ZHPNBYizKdHa8s
	QJ3PkYO7pQf3qPip/ZfTTGSP864jYNeAjMDha+s/uyaTJYAYz4UlQfRoCkcN3PvK
	Zz1EVi7IwrRGOQw+dI4DEMElxbrc7zeT/XeBpq4RZ5QE2AVizqtYdjT4SUn2gLSU
	PaYNuvCEwg0bXAOiCM9+2/ZdDXUN54ouW+auflLfMi8Tif+oG/ITyMi6LUtpbbho
	TZuShg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdcv4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 30 Mar 2026 05:28:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso2766015b3a.1
        for <mhi@lists.linux.dev>; Sun, 29 Mar 2026 22:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848538; x=1775453338; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20GNW5it+X2su5CUYneKv8hJ0SfE9B5LXD06+2GpUP4=;
        b=TkfEYmp8epqJGkyNg1ru8ZjIykTdWN+VlOsZwgYChnmNc30Ps1rkLReSMw8ikvcqMY
         jsc4fF4RvQbSDBbJupDYGkBbRf/2Cf22IzOjU6C+hn2t9+ggGE8A/wfP8s+ouL7fbZk/
         DR1atQLS25vfWrWWC8CnbVzvscKLtyayxmdZ7VQTk4aaYpTnGeXU9pvlhomHHA1t3BQ7
         BJS1ukoMT9mUOAFMvKon9Hs2rsr0T74dYnh5bnRRwnmYhZSDfCBJY7dWaBNUCDfnL3cB
         NV+7Jqm5MpcGwggFZe0eWOhxZn2zAIY+HAdKwiTlhfXFHjNJwx8JPuG2jJ4bM6wxXJbo
         m3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848538; x=1775453338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20GNW5it+X2su5CUYneKv8hJ0SfE9B5LXD06+2GpUP4=;
        b=UoBkhopHwcoGI9AeEXMdu8Co76RHZDUHIu/dSddorP8cNz0EluaYX6PRDCo/61HSQm
         q6nyvwbL0G5oJuoI0kUaJn4akYrLEXobYwRPW0m3SdBzGW1nqCNl4HGifYot6QuNYE3r
         /NP0CSNkWujWaC5EBATbmknxjXfO20EEUXOgBcdiXYEgDOkLaq3u0KxFzIwo/iQz1ybM
         QGL/XsQsezZzKBzDoWhLrrMdIRXqzphfovjT/FAvAuaypjXR5GKoGThKb6+W9GpV5HOc
         CEp0aBHmMAnArJppCjhnp9+WpmZkIX4iT9P8jSmUT57tS0vz7eSqXbySqucTE2OMxtV4
         aJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVQCjtJb2Mw8Dctgt/xbXfTqb+chPibYaJNCk9OeYysN8O3/uS5EpijG6SYqaeobRGh63w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTLEUYasR06ig0/TMkq0fpLDo55/Cgl9RRIb/7aJ++iYZgZlEr
	nA4jBe965zp/sExDQHSDQEIzC5gkC6KlVQmJmQfisZ3GYsHNeCfUaGa6t2AxRf6MWxbq9OIGcjx
	+CV5kJy92yzQEc71pmv1qt36WSXQF8B02tVamu5CRRJYUhPOD4RTG0nM=
X-Gm-Gg: ATEYQzxD9renAKi2JH8dx78cRImLpKWUoJ8v1SGNsAeyhLD8EBZdRHRVKEnlM/exOoX
	MerR70DTHCToAmuDb7sNYVAoJiDvMPbhf+kn+8fnNOB2BpAKA4AUMR/WIJKe7ZqTNg02xJDMK5u
	3y+gwtUx7DvTudAr4EbT7JZQR7C+qxQAQaXcB3Qy4GQKuFAc7HWoNNE2B9pmKYSYUjXk9PYArTH
	xuxVDwBksoAhO23LMnPV31lEELxIOrwo079x4FsDzikigcqSa2EfJQnOgF+ZRunTfU3Lmv9+2af
	IhP7I8ZdEx4iEjZd371LkzITA/hCwymuEYidszPWIJAy0HjaOE1OoSZWhJms8bdEznpQQE9Fg7S
	ZdSUU0zVjKv5RCBVokkYeTRLefAFfiyQtIX1fg36oC8y/etcBruA=
X-Received: by 2002:a05:6a00:438a:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82c95e7c457mr9909599b3a.24.1774848537570;
        Sun, 29 Mar 2026 22:28:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:438a:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82c95e7c457mr9909565b3a.24.1774848536921;
        Sun, 29 Mar 2026 22:28:56 -0700 (PDT)
Received: from [10.217.219.124] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8465785sm7263307b3a.18.2026.03.29.22.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:28:56 -0700 (PDT)
Message-ID: <d98d21a9-b355-45a8-a8c0-a0659792e76b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:58:50 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dmaengine: Add multi-buffer support in single DMA
 transfer
To: Vinod Koul <vkoul@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan
 <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pci@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
 <20260313-dma_multi_sg-v1-1-8fabb0d1a759@oss.qualcomm.com>
 <abkyyBxSnwZWAt4-@vaman>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <abkyyBxSnwZWAt4-@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zBb_UoZDBMGGvT2Y0LmHmHRQrKrG7njq
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69ca0a1a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=kGe3cHaNJUDbgVJfyvsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: zBb_UoZDBMGGvT2Y0LmHmHRQrKrG7njq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzOSBTYWx0ZWRfX1AkU7bgxECME
 CdXddQPzsL1YtVSWaHeZ1f95NL92GZYtLyUCeJ2A85xbMDZOchN6rL7pFmTMUMlYcTdc32e+ktS
 SdTI/yQQFT229tFKHEtJ+nEnbnUpPKW8vrgMwlp/+7QDYDbSuJq58lU1WDgjfST9vJzQ7/kTfZG
 uTo5SCUKCrtcA2tLpXmBZ2KiC7Gc5Blc3kdJhYsruzk1GRVTMHOWYmsBroKs3hd58UP7PwqNgOM
 YAy1ubbSiksgli3KHO/jfvtffT2uHQg20/yd4SnCXFvh/oeN92SkPcy/xTfm6u+/GTdR+gB6GzB
 VgAo+/hrM6P3b3DNjLQv1uvAzOmHAtFzpId4iH57iOc8fTUOXcDzTUj3lFhRDbEpIluPoq3A+4K
 wDbIkYXHDFPzsScFgOw6X095aIFP1LW9kPI/q5k4tSvRz6jP1b/hmOxd+/V1u82mLDGmwgpbbrF
 oCz4WBoQGDpu46OGzng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300039



On 3/17/2026 4:24 PM, Vinod Koul wrote:
> On 13-03-26, 12:19, Sumit Kumar wrote:
>> Add dmaengine_prep_batch_sg API for batching multiple independent buffers
>> in a single DMA transaction. Each scatter-gather entry specifies both
>> source and destination addresses. This allows multiple non-contiguous
> Looks like you want to bring back dmaengine_prep_dma_sg() see commit c678fa66341c
I was not aware about this commit, I will bring back this change (only 
the core dma part).
Along with my changes was are integrated with the above commit.
>> memory regions to be transferred in a single DMA transaction instead of
>> separate operations, significantly reducing submission overhead and
>> interrupt overhead.
>>
>> Extends struct scatterlist with optional dma_dst_address field
>> and implements support in dw-edma driver.
> If this is memcpy why are you talking about dma_dst_address which is a
> slave field?
As we are going back with the commit c678fa66341c we can ignore the 
current patch.

- Sumit
