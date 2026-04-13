Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EE33AB29F
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071000; cv=none; b=CU59dWV/1O+yxB4K/rHlLYwcAYbjrRQ8zXfI+fiP+G9D2G6Vmvly2DSIzK71/AmCAeJ1om25a7oAIIhPggZwUSQXMKPyZIh/fm+h+n7XdrpdTa6jythnEYlv0/bXxtpV75JoIe2A7ZaQcNCGvkXV4JZiAkGY0eoDiQ9SBT/IIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071000; c=relaxed/simple;
	bh=2fhfWqB0s96d9TRTPdduLQ8pllmNmEb/7aVSAY5VdBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7QKUSnoz5VDfUcXoXGbkZoPLw+CHaflBYFdiKkQsPcNy1ayoaK6RCC+CDHgTARWWvvpqvaKKKtovr7sT2Nm3uTo2KNysB5LOasnUtg0KTsqB2SJwgwUGkwkGXpa7qLWXgQ04cMuSN+IjsEIlF+v6bjwRLu4ekXF/ums2/RontA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ryp78dd9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Owfu+mOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ryp78dd9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Owfu+mOl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7XFTo2811968
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=; b=Ryp78dd989PduCH/
	DeBkaW9GFdsXXsDMpl+quFEk31zgyYSo/wNbmmZ4aSdRs69/gkbdN6l6rdsGvCQU
	OMlx7bfURuKpx2OFgSPa1rpHFIRNtClK9Dnb7UVyDDFXXu2xJCd4/ZtBKVbkJkJs
	oIaJw3TanayOPIWVFkjENuKNZiutvHAkpPHMbJyABlCeOaRhhV2b15wbr/7mUx78
	5zDPYIy/mRuPNvDsv4u8vTUjE8E2p8cSkvBOQ9Wf+0/FWZzXa1xQj6P2p0zIeoeS
	a7/H+NCbCSuPhfImD1OHv5Q8FhGBzGf1QMfvlOP1ShK3klas1LzF1z3RKoRpetNP
	tNGS2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6mjqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:03:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b250d3699aso82931925ad.2
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776070998; x=1776675798; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=;
        b=Owfu+mOlYGixlxooP/aQ4h/cE+IKo7UWgiCus/RKGqedX7vJmvl9P/qVpln/b4UBI6
         0BH6sr8XN1VmsaVXs6e8byshUBlcLPbw6cLqHYzyyB8gsb1MacDsPd+STZD/Jz7uWBiV
         U2ySJp6h/e1qk1yLL6IIUMzREZxbhAf/mqwHnd+XqBCAGjQBU/V23yyDdVIHcE/3siHq
         J6J3Z+x+DJmGJIVyOVbu36v5iLLWYRl/sHzM9/PNbIdE9DD6H1RSsTOidr3IoQKUWbu+
         VDdzaJ0g/TEjB3JwiMxWEK9KgG+ckQcPXU7V5GZWxJWP8M+X+ApZgTlF4uv2wwhyZX6k
         306w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070998; x=1776675798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXUF1cdkbsnywS2PX3oceiMZcoIG9dLG2GjPtUBr4wg=;
        b=pFXTdOK+Yc2kKxRyN+y3lPhW7xQGb3+3yTciX4pLvwhI3sg6Zi3BNswBMkKADGerNY
         INubLZmkP4hRJcViFj3PqWT+GCI27HR0mFbSnYraLYvsiuApVN7OP1w4Ynp7lLOvTF7s
         zg0X9Q02mNheha2jjOPRU9G0JaK54WBgoDAw8VhdjIhAm9nItx8gyhIZIXSFvFpKw2gO
         a/lEQQeRPbYqoQSeJPhMfCvuyz/AxFnTu4X13259hqq6uBIHGMB0J0NKtshNdWIFMn2K
         mpNGWL1XCFglYRHxbwxgo1f3bo8pMC20UcPydD9TWsbcYCEvaog1ov/QJK0t3cW6tvJc
         dYkw==
X-Forwarded-Encrypted: i=1; AFNElJ+24OEG+rCHsAtt0Kh+Yof3uz/86/UTzUbgbDo+FdA0ksAHyIryCgpsExOYJp3ljb04gFk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwN4q8Zl4yfevi5jdWgEzjPQxAtJvqWhgoEJeW0KJidcEgalDYY
	wvCcrc7YR20/1S6tECXNIpK1nmVmibFUl7D8w2IHp3iPDtErM7QYZZNLM23giPoJgQgV9nbQSeC
	uIDB+FnFXinsWFyUwg/enI4PlUf3qUeUnzWS/35iUYuIh8iTr1ajRkVo=
X-Gm-Gg: AeBDiesWMD9F82tGI2f3O9hDwRKB2QYWjGMmJikI8vNl2sqpNnh8oUp6Dz0FeboJdDJ
	ZALBTAUEa7UiTa242VfUObMitb5C1aEKKsz8s7R5rnRNDsgPlYPNvjXDeJl/eBaZ/U/Q9n0EhzX
	lD47niFpuCJlmtQN6O2nT96ggBNbuPeLN1XeTSKKPPwa/SA0HAh3IcNbNa3zzgnfTopVyRwePkG
	n9NSnJ9pdE5EXR0CM2rZyjcX+eja+81r5W0VRBLPGsOSh5hIGSTpmyUjgHOQnOzl6JO8RrS9Apr
	IJCKnbO8hn5OpC7CtRcSz82yEQlNlrGnXz6EuKavSh5Re9hQxIjhSKnvKWUcIQ3RUV219qVSjjD
	7fYePDybzrB50ht+nB9+13a7ponUK/qE79RpBXlMAqdCX0rSWiR/qstM=
X-Received: by 2002:a17:903:40ca:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b2d5a88d7bmr132829135ad.45.1776070997762;
        Mon, 13 Apr 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:2b2:42da:25cd with SMTP id d9443c01a7336-2b2d5a88d7bmr132828655ad.45.1776070997059;
        Mon, 13 Apr 2026 02:03:17 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b462830bc5sm16069325ad.50.2026.04.13.02.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:03:16 -0700 (PDT)
Message-ID: <65e37364-f721-4e86-a105-1058d6267121@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:33:11 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] Add documentation for Sahara protocol.
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
 <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfXzg1Xl6NISuQk
 R0Cc35+jKUF99LHn8fZJK9CVQJpD0DQRSqh1+pr0MAL0nF2f23ppiz/drxnfZONOtMScxmiu8AT
 R5q9ABJrs2fE2mRZV1sOqhtS5wRpjffQO3z3JrU1hMuJ1jH32WQtkm8U7UkdNUpow72mb94FSlc
 0N9IyT+yRK7lkjrhjjBYox2O3KaHa2qJP6OXAOHTy8c2nght6sXOAEsaOZhV3NSoNe61+iROKFg
 NhWCyZeD9lHKJ0yXgjPWlgxaJKxCK2xCxrUiCGjPKcCVfG0z5Sjoi2xVrvFddRkD4g10g68sHgJ
 KvM0dH2iEiZAOpXUh2RzLrS8CxRVgU77ebtlXrW7Ks8qpxCB1ETG/zDUDoq6UE1Syfk+Xf/fs8J
 uRJ1NOgZDV184MtTnkpjFsH9XVePd9ZJskeTGmNemEP5X5LkNd3splC7FhvdOBzmtMAWZTC0iem
 zJAo1fyMODpXBKPv6Vw==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dcb156 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=05GiTeiPTPDWsqTu57sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: SRBVMCVNd0Zd0YdJdv6eKFoCZBkgZ-lR
X-Proofpoint-ORIG-GUID: SRBVMCVNd0Zd0YdJdv6eKFoCZBkgZ-lR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 1:17 AM, Jeff Hugo wrote:
> $SUBJECT is not a complete sentence.  You should drop the full stop ".".
Sure. I will drop in the next patch.
>
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Introduce documentation for the Sahara protocol, describing its
>> operational modes and their respective functions. The image transfer 
>> mode
>> enables firmware transfer from host to device. The memory debug mode
>> allows extraction of device memory contents to host. The command mode
>> facilitates retrieval of DDR training data from the device and also
>> to restore the training data back to device in subsequent boot of device
>> to save boot time.
>
> Thank you for the documentation.
>
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   Documentation/sahara/index.rst           |   14 +
>>   Documentation/sahara/sahara_protocol.rst | 1241 
>> ++++++++++++++++++++++++++++++
>
> I see from the cover letter that the sahara implementation is moving 
> under MHI. I expect to have more about that move later in the series, 
> but MHI already has a documentation directory. I don't see why Sahara 
> should be at the top level if it is considered to be coupled to MHI.
>
Okay. I have shared comments later in the series. Once its concluded, I 
will move the documentation to the right directory.
>>   2 files changed, 1255 insertions(+)
>>
>> diff --git a/Documentation/sahara/index.rst 
>> b/Documentation/sahara/index.rst
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..073002c15a203344524e258b2aa0a6ce839e064b
>> --- /dev/null
>> +++ b/Documentation/sahara/index.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +========================
>> +Qualcomm Sahara protocol
>> +========================
>> +
>> +The Sahara protocol transfers data to and from memory and describes 
>> packet
>> +structures, packet flows, and their usage.
>> +
>> +.. toctree::
>> +   :maxdepth: 2
>> +   :caption: Contents
>> +
>> +   sahara_protocol
>> diff --git a/Documentation/sahara/sahara_protocol.rst 
>> b/Documentation/sahara/sahara_protocol.rst
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..91204bb7d170be4fc4c85f142b8f0b93d3c421a0
>> --- /dev/null
>> +++ b/Documentation/sahara/sahara_protocol.rst
>> @@ -0,0 +1,1241 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +
>> +=============================
>> +Sahara protocol Specification
>> +=============================
>> +
>> +The Qualcomm Sahara protocol driver is primarily designed for 
>> transferring
>> +software images from a host device to a target device using a 
>> simplified data
>> +transfer mechanism over a link. However, the sahara protocol does 
>> not support
>
> "Sahara" should be capital "S" everywhere in this patch.


Sure. I will make changes accordingly.

