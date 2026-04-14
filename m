Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808DF3CA490
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159935; cv=none; b=lwwfBSfyXFZdQZ32hLn0201KThDeDlmQtHBKp/CJfRVgegzxA0TziBEFwso04ru0uztCPyd/U7J3QK85s1bBEoNta2nsYTXM6uJmqidu83C6DzrAu3jVSKuKa0fDqZ3Ngn/v8ldh0BODBSUYEUlZGdzldfVH4iuamUl9njCoOeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159935; c=relaxed/simple;
	bh=VfZJL/05CrykX+ouf4RhiP1e4++49VnbXustyYGDWMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7Lqs2Ly5xhArLl7A/KlML9AawLP7Mi5/SB2ilqvm/Pz1whnjoD5bi+ZOQNv0+1kfT3e/B1rzfu/C48Q30YKfd8D9KUU2J4ulu/ouO7sTLJ4IDEGw7I6SPuo50j+fopDIHr01/gMsqjztjx2v/sg3fzsPvjWGNP/OgceWEGSHnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Suhm7e8m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKeA5sAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Suhm7e8m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKeA5sAH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6jx2E2387091
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=; b=Suhm7e8mZGqcGosW
	9je+YigAKvzd5Q8YTF4XfC0yZ2BfpxQDLqaGpSJaampK3812YalnqDcGBVxYko5U
	GdFwsqe20bLeA3OPm+cN2L4EUjHsQ8tRdbwkm6M0ZcvHZQ4xrn6Qkf6o2/pfx67l
	c5yrVPdjEwnkN+vj687HmoRA1WNgQsAPMznaIxgBUuziNpKFurLiOqR/gYRHwGcD
	FkzKSI8t9EgVsN3DdxNg2Lx68yyoEgN9ZsfaydMw9GJ5e4n+dyJqqLLj6Y4mC6uV
	bNuqLLyaqwuhQKbXPYFI1YYJm0/F/yI+K26XxOKZuQDUqmaZ+8IgA8SJmWWxl6DK
	WMonVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w24wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:45:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so105168025ad.3
        for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159933; x=1776764733; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=;
        b=aKeA5sAH7rgPtCIrmo5EWy7JLTBBbVbTDT4wjSGlA2LmTehigDYbD+W/Yd6N5/twWV
         k64BSJk59X8FRmbej+/Cfj5mbZVf9aSMszAQzhLHw8D+wBGq1M3M+S5QxL2FvXNd4ACZ
         u63Vy3uXSXWi4EVnt2cyGRBngRtVXGKajDvgZTC2SzIeEbm4J2fomh0Y2FkuJqa1nVEC
         Ev94DbfGgc6UbJuJr4ys27jnpuyTDe9USR6CtfEiIHBsBDvGqyCUsFJfpaHOb33BwWJ9
         ERIRjKrl8Y1MAfX7r7uHjSuvsj+LOUnbanjZTe7xJOhU5dMjZRIeLf7ZudtWoSwXWbj/
         HA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159933; x=1776764733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoVEP8DtEXDmzrfxPRtDx5EueSkuJ2pFu6DjvKwz08U=;
        b=d5Mm1aBu044CPJfvgDFXi0xUo3QRi6NdVFat5J8jtu9wwQQiVuI3QEmU7HiztmTP+Y
         VJrKg7b/dBDzEkCH7PwOAarSrTmzuRZzobD43msV8c6H00KoHElkqVsyAprq7igUURtW
         XcPGGBp8ikuh2s9ASu+4bFkcX13rMEiuan+RtEVVoESoylU34z7fdDYU3EThCXmo+1n9
         X0oVXI3vOmQMC3R33Yr7AXXNTPrINSUOvJWMrh0Ib5L822tHR1pN1jHyGFwofvfY5a1g
         /mgwolYpah5/BREzS/0pOC4Qk204dzyYuV07ghFh4UOcU9raD+lEH81QGapBCNPZVUkP
         sEPw==
X-Forwarded-Encrypted: i=1; AFNElJ9uZjysw3SHA9SsPPhQndkQ3PAfV7m8vJ3mQqpSNm3GpLpUK4XRegDxrtceUnaeB9WMfEU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPU/d1s471PIdBxACYfD7X2isnz0y8o8hvNrOIxPDY0yHVDs4d
	fnKI1WaNON9oU17LqP5+edtj50IPUJzn0M2RgwQDUdtcmdwEMdl3iGYNbsIMzseVL6fMfAt/LUT
	Lb0AKhH27apKdTFsTcARW+xwo2fJek+i9ohSFFcWiv9nvDzzd0nzH4hg=
X-Gm-Gg: AeBDieujb+JDoQgq8pCOtoz3hdXWB5A5BFYzycAEzrmwfyb8uHp64B040HyQJAzTxuX
	t6dh4te8AaUugAHdnEUHviRMmicpMhktiC4UManFbmKGNMIXr5b7nfGMTd7FxivY6en9KoZdv3a
	9UgRv6TJfn+A9S3r1omGXXi4gv00SI/iLVVnFl5PCjckzxCA2nO519B5dRbTLBWsKCZp6JZwXHl
	V1qGr0PM0oT1EZZYLr7HkExJiNhG9I7O/xXMRqxodl5KKEBJuRlnYfkeo4pu1LoCII7GNt0XzBh
	JxtJgxv3P3NFKjPepB6nlWlWGGBHRmskuS/w7qwdIkFyLNhQrKGFYhsFyPG5EARbWbKZA05NX45
	e2Ons9iV07vjIWohh1AtXttHBv8FtgXleY/smJ+MIC2DF98AalHv+OQ==
X-Received: by 2002:a17:902:cf0d:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b2d59ae7cemr166707645ad.16.1776159933049;
        Tue, 14 Apr 2026 02:45:33 -0700 (PDT)
X-Received: by 2002:a17:902:cf0d:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b2d59ae7cemr166707295ad.16.1776159932546;
        Tue, 14 Apr 2026 02:45:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2f8e7sm134928975ad.65.2026.04.14.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:45:32 -0700 (PDT)
Message-ID: <5a2fa53c-a895-4c39-9670-c6d383ca17a6@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:15:27 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
 <0a2af0d1-27da-4f60-952a-409a5abc5647@oss.qualcomm.com>
 <sab2tgxtiftme5gscknsl7cfifpshtlrnnihbm2g56ppbowcit@bg4bzwuta6a6>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <sab2tgxtiftme5gscknsl7cfifpshtlrnnihbm2g56ppbowcit@bg4bzwuta6a6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q8s6zVGuPosccYaH8Y3jTBZ5VyMbTBYt
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de0cbd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=W_4NKV7oC5Mk2jKmMQsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfX10St7QN8AcLO
 x+LFI/MrLAAsn0YraI2PQeWPXOXSyy8ocT0e0FxTL2tsFIlLGb+j83S5WDqIKGFIpNlSE4dxSyB
 rDLBf0QwPdwktShEZPdnWdotzMj57gAwAcEXNGq+Q15dg+6HIvnd/kvzfihQPOMSPEWDUfkxrEJ
 sxpcCIOaYpSl5U4a/DPk6/aHwAZ8eKc5NQLtyGwsf4ztyWv1yOKH3dW3Sa1zsB/06IKN/8ZZPQm
 NjcIImFAqpjiZ+AtRxFddbOw6eEIsZAg9NPtBVnhrQ/ufniiXt8emqDJrXenN4YQqjxuO0BLukS
 JzyGG71M5NL8HjPSUnJImlMxgTNX+1D5wVxNF6ZjgCRlzQzXSn1cxJIC4S3nCEMfm97cM3Xi3fV
 m5OfrsReF+J9s1oyI2cud+AmxU8lK3Qms3YP7K2vhL5B7fmUk0d5r8kd+FUyzKEmoNl/h5KI8O4
 9y3NbqwjalgeOBEpIKw==
X-Proofpoint-GUID: Q8s6zVGuPosccYaH8Y3jTBZ5VyMbTBYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091


On 4/13/2026 4:34 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 09, 2026 at 02:20:02PM -0600, Jeff Hugo wrote:
>> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>>> The Sahara protocol driver is currently located under the QAIC
>>> accelerator subsystem even though protocol itself is transported over the
>>> MHI bus and is used by multiple Qualcomm flashless devices.
>>>
>>> Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
>>> an independent MHI protocol driver. This avoids treating Sahara as QAIC
>>> specific and makes it available for reuse by other MHI based devices.
>>>
>>> As part of this move, introduce a dedicated Kconfig and Makefile under the
>>> MHI subsystem and expose the sahara interface via a common header.
>> I don't think this belongs under MHI. Mani needs to confirm that he agrees
>> with the concept of moving this there.
>>
>> The Sahara protocol as defined by the spec does not require MHI. We know
>> that there are Sahara implementations over USB. I don't see a dependency or
>> relationship to MHI other than the current in-kernel implementation uses
>> MHI, but there are plenty of things that use MHI (qaic, mhi-net, ath12k,
>> etc) which are not a part of the MHI bus.
>>
> Since Sahara is a MHI client driver, it is OK with me to place it under
> drivers/bus/mhi/host/. We do tend to host the client/controller drivers if they
> also bind to separate top level subsystems like Net, WWAN... but for the pure
> protocol drivers like Sahara, MHI can provide asylum.
>
> - Mani
Thanks for the confirmation Mani. I will keep the Sahara driver under 
driver/bus/mhi/host/ and also move the Sahara documentation under 
Documentation/mhi/ directory.
