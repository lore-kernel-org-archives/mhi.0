Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8333AE182
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071036; cv=none; b=SAHjEYUWSRfi/wRIVNuOcktxysTR+qkE6sweVERM6r731kQCUxeBmJnY1FfaJE8Ce1apEEx6ieUlLzAJ2HSoYVPSHqJbMZrNkkV1cPnZdDfyoIAYing4jUs5F/aBEEuwALog/7WyoR8S1gRmmqXBvlTGMxcV9PPSnIewBECZe28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071036; c=relaxed/simple;
	bh=pu0zxYCD9c6IOKjGd9j3cvN6srX6Z/ndXxXt6zTBxM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTAUDX/3+gLtp10nOVtNDq8Ti9hQOYls6KNmVlF6Ub0bDUCOTzREpCA/ZZ0RdYXoTK1jOIyKYY+2mCgFcXKgHjszUCkg9RgKhG83lHkpnUD9rTC26mFTOERc02WLrwaM1U5NHE6j0ifTrgFZjHMFx+GSqByoiwMKE5IT7qtRKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CITUBAp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erkfyTOv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CITUBAp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erkfyTOv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D84sMZ2302064
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=; b=CITUBAp09eWPDKy/
	FersKbI5gUwI4631ASffKdJlmjf0hn1b9wlx36aLpYzLbMkyDjHga4IS+3thwzj1
	xHx4e0UziD6fZWrGlmf5Unn7O7vWoIH4auZ5Wikikf2W/e+hjkDAQh34WwgfHffT
	grsmhwCUnYE7Eh6gpdYc36AHyEQdARnc2w6FSpn/e1RJV64GBNCjiLtJv0g6Gqqu
	dlJ5gWUxdl8UwY2Tj3d8xNQ4KxA8HDl9tAg8MTHD6IBEJmnblLPoqEhAbS3IinYX
	H6J2aYFFLP8MPay84OnD7D1JywKhL9o7pV8TuwPhFW62RTBNl4MB0uewoN+iopLF
	+6t2fQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvgvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:03:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249541063so39117295ad.3
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071032; x=1776675832; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=;
        b=erkfyTOvJr4T/kxv1+ChV5EHxByKPiuG/ceGqWeUpzTd9+pRbvnsazujMLJ0Y+ubUE
         Sa/+NgvIAzgsGJImnC00Jd/pCRuumBasvizX8zys/1VzImUGPnDSpjE8fmYbTwL+bEKO
         nLEvFXU1l+X6N0biVgNFODhGCUtPurMGiHZVGvKf/4cWsGajkMbCosGyPf1ul8vENg7K
         fmk1zN3NNNJEIYYzShc78DWZ8db/CwWUeN2w4WpywO/XQmaEVzZOaxsfzbKOVF+TFt75
         X1xbRJwisbuHdcMApI4+hlww5G9EXyi3yBuTtlI7ZpUF9unCoI1Ymu1vwLLH9zKsPbFp
         4I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071032; x=1776675832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYk10NAAdnCzljkbvIxpKLk40WOmplCWnYXCUOb45Dw=;
        b=DzzaWRzZMpF3rPHKAPjEkhu3MdtCbsKlr85wYoQpOmUlBNXs5zTDwaH+jrK624Tw85
         Bbveg0bnY8/x5ufKBpPhkDCIGzg1K9vcS7VW8zSEvBjB1e/7DtUMtYxlJhIBRWZdF4Qe
         ozPGccm0JeDgNi/ZQQrgxNU9lzZToyxxzlRWrEtfZ+kX+UDcB2tXA8ll6SRHZKqQUDab
         GPTPVhOHZpBKwgKOxxzDCxYHbPydRD6oTAUe1NKyjGTzimYhKWX1SUjEVCgbrCMCxaIW
         Px3GYOEgGch3rKL597FQQZ1l0pbKM1ygFE+jPJ5YkL7t0jbfeWWzOudZ/eFW1+xO7lBd
         38Vw==
X-Forwarded-Encrypted: i=1; AFNElJ91iOnCM+dOvR59Jdk0Is0EpiFPiFvUglQxFFcW51KZVG0ahJb7q+4ZCjLfO8tqcfwiK30=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAv2okOKchasEZfk98ZxeSZhodNtfUzTKYYZmlX3tSHnbJDy4A
	8dY75ziJ/5XtzQS451bRXO1mXS712OG2nd8Yius4ZEredJwwNfRq5K9YrMgk55sQIoko34VNkw1
	KVFfduIjoYDbpi/WYyqqu5Cp+rdCvPMmkxmEei+eMuhgAonZVSp8/Z0I=
X-Gm-Gg: AeBDieuoQQva9NFy2dovwbfcDZQCQhw+G4WRFr4YOvD/KBpxQEW7kqj3YI8AumZA46J
	y7EJKYZA5bQV4SwSgj6OdKZJWay/u4LZYQSu2Ru2bqcm/Scwob+QwNxEay0E2vx0y6YBoRoVIDu
	06c4elSJSPzNU3AbJ9nGVp+04rt5bDMwSjUW1sHED86W+MblKMCbpug/CPKgy4rLXcXbFtcbMpv
	JrhTfMyF9m3ahfpYie3+zBw1+6ysM+rXySBS5qtY+BG29ryVfU8OpaBJ09LMMMtvMr4Yo2yMn0N
	mjvpKjzwJlUCKDqleH4PK3lU+vEWf6nc4AVuaGjsI5Zn+H8qNkeyRZXMAQKTEMjZ7ic67i3hzwA
	vK0ADDN7bBkqK0kpGD34udXBlDD5mXqZWVfqj0KND6574RAv85mozQKo=
X-Received: by 2002:a17:903:1b66:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b2d5a18e13mr122848955ad.22.1776071032507;
        Mon, 13 Apr 2026 02:03:52 -0700 (PDT)
X-Received: by 2002:a17:903:1b66:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2b2d5a18e13mr122848585ad.22.1776071032011;
        Mon, 13 Apr 2026 02:03:52 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm109169895ad.3.2026.04.13.02.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:03:51 -0700 (PDT)
Message-ID: <31afe536-a963-4dc8-b2ab-96ed7ebb1531@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:33:46 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
 <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX8OV2BYAY+kWl
 ftYkqSZ6tacLehS6O27Wjl5GsBElkekffhWik7R4bNuuSMz3RJ3qxPC29QITHgtZm031YOjEQPE
 KCPoliesPoPdjtdyQFxLDUPoqbomjfjntFnR7fVT6njexS1h4BDcLcl9fhJ+6o2+mOMhfkf+NdM
 wY40/gIN03EbNu0Gz+cYdVnUu/z5uyKKRV2rkTGTD8vWLDj2J+aoqYucXaiBZ3Y/33+5AlIm71S
 SNOFrAJkpoELoFsmj07+o+apx1vzqwGvi4Q2Vl/PLVtSZpeLme2fb+43IvNLOeHz/E/aXMkJe6N
 NSvZuN2nUmh7KE05AwqyHeib35VtppfrNO7gAVuUt+hpwv3wmyYi55A++InofJ4U+jEQ1QJMZvm
 v6tnq0xHOxWpws5PDWQ05DrI0W4hYmR6JGZuliKWx5+uGmnnu6xXBcZAtbcMs6iK0bn+liRrep7
 T7j3qnzeYWGYcoSh/LQ==
X-Proofpoint-ORIG-GUID: FVa6ZzyTpYyNAyCt6dVjUzKfs_N9cxAe
X-Proofpoint-GUID: FVa6ZzyTpYyNAyCt6dVjUzKfs_N9cxAe
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcb179 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nb3vwdu8Oqwsy-ELd6cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 1:53 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
>> channel rather than a QAIC specific channel name. As a result, the 
>> sahara
>
> "Sahara"

ACK. I will correct in next version.
>
>> driver does not currently bind to such devices and never probes.
>>
>> Extend the MHI device ID match table to also match the SAHARA channel
>> name. This allows the Sahara protocol driver to bind to devices that
>> expose the protocol directly on a standard sahara MHI channel.
>
> "Sahara"

ACK. I will correct in next version.
>
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct 
>> mhi_device *mhi_dev, struct mhi_result
>>     static const struct mhi_device_id sahara_mhi_match_table[] = {
>>       { .chan = "QAIC_SAHARA", },
>> +    { .chan = "SAHARA"},
>
> This doesn't work and breaks bisect. At this point Sahara will bind to 
> QDU100, ath12k, or something else but not know how to drive one of 
> those devices.
>
> Just add this when you add QDU100 support, which looks to be patch 5.

ACK. I will add this in patch 5.
>
>>       {},
>>   };
>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>     static struct mhi_driver sahara_mhi_driver = {
>>       .id_table = sahara_mhi_match_table,
>>
>
