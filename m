Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71152192590
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775764033; cv=none; b=Cvh1NNzKU+K44WIuxoUCDVLIDGnQjo8j8x3gmuYOqcCvrE+BS0bedoJm0xQsMPc69K1Wj5F74FS9Zovum8adH7zrlp5N3yQ2YSU4w4wquUGdiIlBbj71tSsKHH8j8Y93bVRq1y3bN+sVN3IsaFIIaC6IMgdO9ojRNxmbYHNZtS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775764033; c=relaxed/simple;
	bh=wE2v5piXmBNTShghMARat1tBKYtFecBTpTLeG/24KeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEhp8RKxi0/5Gm4j54sr+aDCi5bcVE8gMYQT2DWFGBW5MD985KAABh7tCoUGOFWu53RrirIoruF48foR5Y5LBI41HiSKss3lKcYENCEIuHb/OQj/lLTK7bBE23jxTjhiFV9sUGQPK9h7D4V3O9lMlscg5WoHnuNrO5X7StSNGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E258ppeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+oi4bxc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E258ppeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+oi4bxc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HkM8o2698273
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 19:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=; b=E258ppeTaBTn5jcT
	fpDf25bOdp8etUBuri9dWIQ4KzrdxasmAACSd68I241xfpF97QvabQdVPyVnQ/qv
	21/gdNo0mRTcMj+LtHCjqcEk+N+0gKmm+VZBQ6955Cc/CTLHh+JIWl59J3Z2dqS4
	Px89Ewvg93okNdGlc7AdZcTUbtzoJYketddZTlbpqQh79enULdlXCJSeV70wrczL
	T3AQeQCsCxRS9xC9K4bWylVgmwSC27CsF9ZO7vOWAtbiMjeL+tuxeVlrvlHinebT
	TXbNN+64GRjB4hgYqyAz7MZ99QKvhR0CiLbt7B94zjY60pcja4oboMG9PLsovvwq
	Owd4fA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9rcq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 19:47:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1276e71652fso1792556c88.0
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775764029; x=1776368829; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=;
        b=J+oi4bxcxSvjtclZMlx3axPJNfq7wzK5dXrscTr7SVSuNRd+IbITVSlEAUjbV2eqGp
         4wtu/RdeJs6iNsizBOM1rvhvz2Kn7bwI6evqMqsMPMVWTmEZUmx3DetXYTxX4ImrKsA8
         mVaaIBQzJVmFsL/6Z1waeXwKyCi11iSwfcoUpkUvHDA13rw7sbt/Qy3nAYyWrA9ys17X
         ui7t+UWC+uU/r4JVWIedK604R0z/G9pB6Cll1fb2aK9aXojivWMpyRf8r+JlXyLBXm2P
         aojRW76WIVGkXWjZJuQFvHwNmCs+W6Z2MFCG2LgwjToPnoaz1CNSkw5pq6Zxen3yjmOQ
         H4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775764029; x=1776368829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/06ClVKS+CLMiIvs4gyofvU9apUnpcFRIbVbc5UPFE=;
        b=BJDDHwwHBkn3gDKlkhVHWyL5Mu5LIZP32OWYTodR4BDTG8O8m2hILUN0b9TkpblBLQ
         n8/PwPG72Ao2IwbG2X/yN4U4NtW5WBOEX3XIqH5QerB/998WG77lG9WDn298fd5wNmg1
         dkd22q7kr3DvyCxJkspNs3jFIXKx0EsZcJBVKfLOuhURTXA5pP7qTJ4rbAFzz7GLN6HP
         Sqx/V/pHJDR7idjG3jNx+mZ5+JyPuBtM/e9aMtqqiFoJG9yLm4sy5dlphdnxwUEAA6Vf
         PsIS5KBAVBj0vOkQtHb1t8ZcCH8RAZ2DweTbL257uWuR3MSv1ViGK1o53e/yqeDyEwoe
         cR8A==
X-Forwarded-Encrypted: i=1; AJvYcCVhwJNsE1+YD/loUrPGzltLxx6qU5voGUknmGkUJK7IiuWzKgOzPzxuiOhDZkHVDRuEEPo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8ZDrtLM2dFwHlBPkSF5CYnBxUkwKKTJWeJyzzYqrqHK7cpUGS
	b6RvjFLkYxm7Asu8MbaheoTPfgefdqxKgfXIl6ZyDqLDD1Syd22QXDxdClI569my7z48PetGJyM
	cCBNMQgUSaoM9wCzypElyYTsB5YYifpAOoyQeu0YvSKsKREIzfINd4iQ=
X-Gm-Gg: AeBDietcnx+/7z2xoY7cmnTpOjTm3RcLwOFcG0sP8nNvmddjA4+urwSTu2HxH4vp9Mm
	HEAFqt/QNSHxsOA9fOCcqdSAmC7RH0mFt/Sy1QsOvxgyLz2Zhagktxo16cjDg9NxTnX5E6ZB2fd
	iNJOq7MOFS6w+W0HtTjcOnV78zvlIc18VdJxGiNzjp7Wb1hqA9cLJ8gE50jLO2VilA+zJqTNQAw
	YyFk7QAIROWrV00wqhaX8CYQVvnABJzef0LFfC8gIkjoCkHANva66yXzHBkzhDnpWHrgup3Hbvx
	mIQjrV/BJTXzYi7q3dZSNDMBnWO+PGhbAn/sSuKIAd8Hyo26u5zA7OfFfoChTgOmrWSZ1u36OuN
	jym7QEq9v0U5FZKYHxQ/D17JZiSVJ4ZGl+oXxi/jC4eAau39u8jRuFzIv3y803rtxTbNJ0LIkg5
	U=
X-Received: by 2002:a05:7023:b0f:b0:128:d5bd:357f with SMTP id a92af1059eb24-12c34f09283mr224076c88.30.1775764029058;
        Thu, 09 Apr 2026 12:47:09 -0700 (PDT)
X-Received: by 2002:a05:7023:b0f:b0:128:d5bd:357f with SMTP id a92af1059eb24-12c34f09283mr224039c88.30.1775764028479;
        Thu, 09 Apr 2026 12:47:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345a96f0sm738890c88.5.2026.04.09.12.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 12:47:08 -0700 (PDT)
Message-ID: <a793d256-f0e6-4a95-943d-e5d85c781428@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 13:47:06 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] Add documentation for Sahara protocol.
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-1-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE4MSBTYWx0ZWRfX45YfYlMUsc+I
 5v/EUwslJKKdlL1LvITMnviLIzhMFOgzUa9Qm18dkQ2LSWOJwaNdWldN17nb4radGLcVV3BenXJ
 Vgo4lY4kb6Ww3/h2xMnXzbIj6wX9JJLEP21nXwro1IiCe9WufXwatBzlSxceRjdAst69jCcwLat
 DdFqT9iB0kRRXi4dHgN6g1ud/3fO6Jna0eEmRLakfKSi6VSITKESUVdPxKmEhR/hWmZX9LkCbHA
 MqfHHSo5O9ejlB3gv3sezcn7HGc6lFQjramYTlSqAKUywr6x56Ch1qToNovQw9gtpJpR9CJwOb5
 UbU8PtTJOmL+P91jAqetm1YWIEXUg3EbXAQHa84C6ztCGsMpWaDR0VZ+TE9GeCVgxjlgfj6bm5b
 5foMXF67p92RQ3VtuqsGswwxyqM0/V3NJhL1P4lW7J9Qmrcef9D9qo1Qtm2yKLoBE570lMTWVCN
 bh2QR8JeydgXUjuDD4w==
X-Proofpoint-ORIG-GUID: c7TB1_FrjxXenTufk4wrbkKJolUH1CiT
X-Proofpoint-GUID: c7TB1_FrjxXenTufk4wrbkKJolUH1CiT
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8023f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ddSKszWcQf2y6ZE3pzUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090181

$SUBJECT is not a complete sentence.  You should drop the full stop ".".

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Introduce documentation for the Sahara protocol, describing its
> operational modes and their respective functions. The image transfer mode
> enables firmware transfer from host to device. The memory debug mode
> allows extraction of device memory contents to host. The command mode
> facilitates retrieval of DDR training data from the device and also
> to restore the training data back to device in subsequent boot of device
> to save boot time.

Thank you for the documentation.

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   Documentation/sahara/index.rst           |   14 +
>   Documentation/sahara/sahara_protocol.rst | 1241 ++++++++++++++++++++++++++++++

I see from the cover letter that the sahara implementation is moving 
under MHI. I expect to have more about that move later in the series, 
but MHI already has a documentation directory. I don't see why Sahara 
should be at the top level if it is considered to be coupled to MHI.

>   2 files changed, 1255 insertions(+)
> 
> diff --git a/Documentation/sahara/index.rst b/Documentation/sahara/index.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..073002c15a203344524e258b2aa0a6ce839e064b
> --- /dev/null
> +++ b/Documentation/sahara/index.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +========================
> +Qualcomm Sahara protocol
> +========================
> +
> +The Sahara protocol transfers data to and from memory and describes packet
> +structures, packet flows, and their usage.
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :caption: Contents
> +
> +   sahara_protocol
> diff --git a/Documentation/sahara/sahara_protocol.rst b/Documentation/sahara/sahara_protocol.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..91204bb7d170be4fc4c85f142b8f0b93d3c421a0
> --- /dev/null
> +++ b/Documentation/sahara/sahara_protocol.rst
> @@ -0,0 +1,1241 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +=============================
> +Sahara protocol Specification
> +=============================
> +
> +The Qualcomm Sahara protocol driver is primarily designed for transferring
> +software images from a host device to a target device using a simplified data
> +transfer mechanism over a link. However, the sahara protocol does not support

"Sahara" should be capital "S" everywhere in this patch.

