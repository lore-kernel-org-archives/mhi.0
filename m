Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D7B33B94A
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 20:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767940; cv=none; b=rCKqqUvVilg0YsG2xMJiqOQtIkf9e83oAkKUXmRnCT69YT/BGorZoq7lwHCbgEeYg2iHiNP24j13ngmCBg+zwWeCpxjg3hG+D0T2gTWo5jxJpDlwsqd+Ec+ulDPBDPRocTezRxtohqmKg2ex8Zlkx6mQnsvuMVINiS7n7TfYsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767940; c=relaxed/simple;
	bh=Xdl4SEPIG1bTe8bbKcDft3BVAeSV/iIOez/utcM7wRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfzt2kZ0bqna5J8X5l1QbouBNWjuqOv8mTaOA33GTVpv0opjz0YKXl86h0BKDYW+7O6QjaKlluE+ymQTFHVOE+yWHGlZZDH6LmvJGQd7IdTIGvDG1KDrJZI55VKefh9JVYi+GsPcOuEzvZdODoffvDaWqOHzybXR2ENPMochyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erglGhfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMrnkDAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erglGhfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMrnkDAQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KbeIn2629321
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 20:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=; b=erglGhfyWNLs2xhs
	hqwT5Y0E58DH/3rzJnDP8Mb0HJYivfLS9OHlovYOb7XIpm0WPCGO1USuxhcnKLEr
	G3s2Dnt8gpIc+OFwenIsc3J+ZHs22ECsu0M9KGnxzZdlGkkzKa9iYR0xcC2l7ae3
	ZyMsno5XuK0Y3TRIhiVZAZlSASFSycf3QA0TNOOVrvafXAujeq8CTwlIk8rxeR7S
	NIdc+SoU0HHpJYUHfmdE97nMzCmXjEnm40+f+D780Di0pyU36k7fSB1VcvmgC26U
	M5OI8OubEVUfqFIexP+PCh2S2k25C47qvoH2yXvd4NFpeGL8koDnHNwzggv4zkOl
	/ruLiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu1n41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 20:52:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso1841671eec.0
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 13:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767937; x=1776372737; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=;
        b=fMrnkDAQ026lAODIRPtSIdMyw0pN24ytgt3Lwo0BBcMoeA0FwyLr5I4JNAKeXgOrKS
         6VIansiAb5Iz0IUkCQlnPUkAMjhyMmBoVS0eaAxzLTh/+xY7dJW1mqIx5q10ex+wZ1e+
         LDQiTV+50Rivc0fb/3Bjusm9p5EzOp6DyfHrltRGk/GxqSGKibBkkpSnDEeTbHg2qK/l
         uSgZx3d3tZ7OvjErYp536IH3ls9PpXQ0kmL8Y5rAdenyHkUi/oZoVcW4Aj4se9HIwcr3
         t6Vl3a/Zlkht+C+VdLT/+8O3jCjpiEnr1IOY8hKxKGGok91mQGhV6+icQ+8ptwN5Dxtf
         DpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767937; x=1776372737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=;
        b=Re2TpYLaSQIn3z+fvpwJdiGBxxPvxvMeZD9O2CcBRV17rS1qGjYB2InxGV0BP1fogA
         +pbMwdueMmbc7nSvZGkk/d0WaD97OEwDzMf5u0Ihql3xFcg6UU4tmdhvbgWosv5ELzMq
         MLtVJ7djZ8GzmBlnCECFN2plOi8Kji+yAh3Y3alLjYh+Mm+09LCMkEIkbSIfaEirLoL6
         nAMJ0t+KuY1YcZkfxlHSS9Y9jLfCijGLP4zAxY7CAknvo0Y8czDx4YB5xSOlNDsAy20x
         a8ckR4c6CAL2gow9AesMCudJbTgpRKpjIPnkLOnf5YXLnc8V6Lyx+PLeC0+OEygRd32D
         Q92w==
X-Forwarded-Encrypted: i=1; AJvYcCVKNLVHFoZ6u8s9y4js+gUdWT0pchFb0hE55ZZ89Oj/LRVULRe3vOk2VUDEHDj9wLiZqcw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVW5lOLZjp9cN95S8l6PkP+xFychhNU3t649zPJxsBCs3dWVtB
	VLTl1nfLO/raHfe1kdeoGyWyAiBEc3zEb5T7g1gnNcUU2+Py6ZeR1Uw4yksOW2uJm/zbfh1UYUN
	GdWDyUI5oc3NekSBRZuPDPwzKjjtheiULuoU3eszzs/EkCCIwOJMmDQHmeP3VlAU=
X-Gm-Gg: AeBDievy3qkUMArwW5itMD4F9Mn3H2z759PZL//ee+/HUyPmVPAUdOkURAd3j+G+H9Y
	lClxGE1OZXmLV7TRfq91CVxDhJ3y0loxEAglx3WVb/UPDQGZdH0WtZ0tGM/kmZZ6A7CRgHJTK6J
	CkMM+7vLfaHzGS4qtWnooex7VrUrJ0zWaHTKVjqvqo5tuKnLVmHHa2KNK0QSdxLatWidSE9U/68
	OrvLrcEkkREgqP1Kl/VQp6FRBdQXU10awSFr/Af3TYN9eGcMOXYFM7TEADKSAVCwS9gnkDwXzf3
	oOFUueDDJy3Gf70SNG6Zg6+O0CdjehLv0yyS/krKBJw93MePjqqu7vBemxez8v6ubjIbDNmx+rp
	68jbrp1W8O4iBp6/Zz+LPpwVsMmqBXh92fnyr38uo03IUBcnp61QyE+ZQI4OhZqOLB0wk0N7ZVi
	o=
X-Received: by 2002:a05:693c:3117:b0:2d3:dff7:13ba with SMTP id 5a478bee46e88-2d5871afaa7mr376375eec.5.1775767936370;
        Thu, 09 Apr 2026 13:52:16 -0700 (PDT)
X-Received: by 2002:a05:693c:3117:b0:2d3:dff7:13ba with SMTP id 5a478bee46e88-2d5871afaa7mr376348eec.5.1775767935665;
        Thu, 09 Apr 2026 13:52:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a64easm1452705eec.31.2026.04.09.13.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:52:15 -0700 (PDT)
Message-ID: <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:52:13 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
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
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CooBa5-utIzvwb9pNCj_ucSdISJFBWgG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX/0vw/2Xi4gA8
 i/zpNuhF2euOO3qRj1ZU9LEd+uN1c3UnHYqfg1moIYiLdklGjuKnuVFkIozbmCc9oAnIUl+rXmu
 gZVcbj+aYmVv3TWZV7OgTC5ct3AVwm6ZWxeV2D4YMJ/YkLNGZZHw6FQt2nXTd75Dch2nFjTIF+0
 8wN9+Bw8agGgUBfUsg8xRrtHb4vHHWKXX8cO7Q6poIb6FJ1owWfXfbnNTzExO7J7xRg6HVkKtU7
 c4peUh75eADtPLcc+/R+6Rzi60D4UYp22RGL5cNob8RpRQ55hPC8M6sCwVbeJGeQma381kqygbd
 1dBQ+tqwljtdKo+mrBVsM/YbilPeEVLYH9FwRlwHqCNUPwimS3TqOrzwr5HJAnTMHikVLLQrVq1
 ia6dWNROkSgRs4jzQ0xjd0DxNfXLkoWB7ToR62krjgeHVVq02hgw0Zks69m2BiHOQeNnBrXXZVK
 f15feVAiEha0A75iXqg==
X-Proofpoint-ORIG-GUID: CooBa5-utIzvwb9pNCj_ucSdISJFBWgG
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d81182 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AsT2qU_2Mam4ECEOgGwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> The Sahara driver currently selects firmware image tables using
> scattered, device specific conditionals in the probe path, making the
> logic harder to  follow and extend.

"to follow" (remove extra space)

> Refactor firmware image table selection into a single, explicit probe-time
> mechanism by introducing a variant table that captures device matching,
> firmware image tables, firmware folder names, and streaming behavior in
> one place.
> 
> This centralizes device specific decisions, simplifies the probe logic,
> and avoids ad-hoc conditionals while preserving the existing behavior for
> all supported AIC devices.

It would probably be useful to mention this is in preparation for adding 
QDU100 support, otherwise this reads like it is just change for the sake 
of change.

> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -180,6 +180,16 @@ struct sahara_context {
>   	u32				read_data_length;
>   	bool				is_mem_dump_mode;
>   	bool				non_streaming;
> +	const char			*fw_folder;
> +};
> +
> +struct sahara_variant {
> +	const char *match;
> +	bool match_is_chan;

This is dead code, add it later on when it gets used.

> +	const char * const *image_table;
> +	size_t table_size;
> +	const char *fw_folder;

This is dead code, add it later on when it gets used.

> +	bool non_streaming;

Please run pahole on this structure. With the interleaving of types for 
every other member, I'm expecting there would be quite a bit of compiler 
added padding.


