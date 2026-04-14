Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6176358375
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160325; cv=none; b=KBY9/AqgorNz+TkKJv3kvAEewr2OEizKq1LKY3+H8i8IodFAZNNCVQT4rwYPK4140O5jrlUvUcp6e75J1Z8YE14yX+j/JQnDnsy6MY4isB/6tojRR8iCUGH9b+Z7xAfUCuI44a6nctU3mlktY+1KpKEFlE6u2VeKD2LvlpVamUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160325; c=relaxed/simple;
	bh=I/Hd0vAKGMDZBsVaB8CR4NASLw78vH72UmpKGDKvXls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CChvynMfWV/l6pbeRDwD/MQAt4Hi1ROOxkViEEar0HdZyAOcBHQYB5Mw1IGyBFa0qG5WQlr2SJpDvBKQK2TI9JOXwZvrOd3EAVC01EjdLFsDCvvEOcO5HX5ODVkYU3juch26hfVj8VtgrtZGuOs53bX8j9Kq7x/AixhcoZHlqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHiqGMki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMVTyusM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHiqGMki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMVTyusM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6PxXS280842
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=; b=bHiqGMki65PNXwWu
	gXNn0tbZTg1G5l8GfGJ4Pkp0yMcVwCUwNSP7dR04q5O8C1WP7ckzIlJu2BdY/BvL
	LBycAzjEQXg8P+3DzmoMYlm1hB0iKBNIzylpkrssghagOmXAgPAS9k/Fbs/w9HJq
	DJGj3cxxlP1+T6Br5v/Yd9AGjM1/mdf/HYHjchx16byeoS5rtSy78fE1HsXzif+V
	ls0LGCwhg3kv21uXUt+2arqD5WPZ5Nyexw0WfRfpOB+kL27XfpYzaV2LZ2O0BBSq
	syUTun0532GqMH/rXLxEd75Pqckkq+7DDn4KwFl/XPgz2lMzX9CXs8N4ssRm4YhQ
	nCYIEw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj58s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:52:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f220f1dabso1668829b3a.1
        for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160321; x=1776765121; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=;
        b=TMVTyusMv38TTAgR5QF/SyNEzIlnEBLPqQZ0ZgqfGUWleHZ7jnemWvDuVqMkNYqjJS
         jM6vovhWbv+NQoZJ73QcDTJXCamG+LrGFuC9LS+jGFa+talYMq6KQ0Qp9g1UGb5f87bY
         o33Y0Zwj5rLOclSHC4k65s8eBSqcN3o8T41V5nRnKcdGtGv0BA5J25C0CW87gfSxwyTY
         FFMcvzt7ldPoKKnYhQSTWjtXsCfyZkXURunWf9Xu9cQ/YOot2o6GXHSqBkGoJ3bzqL21
         wnKtkUIdZ6btNk5n6IP4ZV2K83af/lgCQPEMW1tSeHPCOvEXumvpHoErxYOCrJgvYH/3
         FFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160321; x=1776765121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=;
        b=FC9RmWE91EFtRyflcInt5khPephcVJuEpuvNo8ZdlcVX7BUxIA9rZPyt/AmVYcvldH
         IBPvIZCyRTC10Cuu3gqnE3tCYEwUH+qibjqh9FrsCyyFsEvwCzr8CW834X7h80qcCCBj
         3HxAFi310sWHDUnc9er6IjFhUYItLwH1b9se/C6gK/cV9Vc8eXJxPFLAhrAUL9Ir0Dnn
         YTi82tY4A+rhUBquN3wKtNaQA24sNFm8gv79QWsuEMQCAxPq5IohmVwmI0vu025F2rpu
         Xw1gsfbaCLfP4QNj98g6OENVw2inVzuhCziCSZKA0M0PaigybZz/k2fqlqbEu9Lr/box
         Vf4A==
X-Forwarded-Encrypted: i=1; AFNElJ8PZq6NyVlbNdzlCAztNQ35Xl141Z36M0FrOgF2UwhGVKl1kJEa6YAZEcxOOAmH/Up14uU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr3WUydwnErwFbSPTMJBp2MK1bGveQQgRNUvreoFUCXMX6Gxcj
	fmojV7Jv0Qa8CxC8uuPLtlhkQjjpBciPRSJAnUl8L1fVP1uWAuOqyGoy6SWYa92219eedsWo4ut
	Df4NxsfJk88RntYNHMOX936HuGAtEZ8TPF7fzZmUdtJ8bS5LvrdWDlwo=
X-Gm-Gg: AeBDietQ1ylK/TCZ5jgdug6V3F7kDMsHjTHMkYatEK8/DFJrx+jOvU/iVIxBv51Ytsd
	6bQ36a6pzVTv6GwVaFJ4ScXMFVTK5zeHk7X5fzGOWwGoC8MmaVq1bhIH4LYXfa7VjLdzMU9Q6O5
	mPGOqVANmvTyyEz6eEP+r7llS9vB2V5sy6Ad4qAbrApIEQY5KYxYH0pumG86Wnm6KFeNR8OIc81
	X847xlp76CbS4dFT8yZ8dazdoMH32X15YCpdsn/BeKV3eYIWkMjwS42/jcQNTuq/jX/YaJH/mD6
	t0SUSzJdPsO0Fd53dXzTzXj9MvFOkMF5c3/8AQxOy4YSYY95kszjXVvYEMbC4PGCpO88TekvpKk
	E2Q3m91V9QONvZFJZ7cSsjMvMljx4dafH03YKqN6EtwZEYI3D8JvIFg==
X-Received: by 2002:a05:6a00:2d85:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f0c303511mr17536290b3a.26.1776160321535;
        Tue, 14 Apr 2026 02:52:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d85:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f0c303511mr17536273b3a.26.1776160321051;
        Tue, 14 Apr 2026 02:52:01 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c330925sm15955528b3a.15.2026.04.14.02.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:52:00 -0700 (PDT)
Message-ID: <dbcea41f-cf98-4654-bb30-49308a5422db@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:21:56 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
 <5lfbhyzyyji6cuve3uzd26rfgnqotcupelppgehdj36dq7op6j@hn3jmhtqzntq>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <5lfbhyzyyji6cuve3uzd26rfgnqotcupelppgehdj36dq7op6j@hn3jmhtqzntq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: owJzdh9d4MMSWqiz8qqoXKBQspQHEBRX
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de0e42 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Io-4PmWlcMg8xS9VqXEA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: owJzdh9d4MMSWqiz8qqoXKBQspQHEBRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX3AA7+QQuveHP
 OcmExgqbcXKQc/KRqht1oNMQ1oRun0IqFvJAGNTl/Ln3wjFE5uUaq6El8yA+VddXyra4qiE+DTd
 wjkK+53lsuGN6hNM6T3zAYYL+dMOGwNlVQLMVKgxW+L0ozRHKMCnKedG5uYzASPaefqMi5IuBOh
 86s/9zBC9Rh4WKPhvcXUVo8MEm9oQ2jhEb7zpxCblfp0+mvag9Ptr2ou/M90jOZBMNmqkzXqhrz
 9/hfEF36wAVlJppiFR2GE0ahW1DNFGQZKo2Nf41E1/Zrpy1HNSsSIEJ0p3DxCe9crb6d0lDNxht
 GSGZVqdKpTE6NwROL96VPH0OhBZMHEb00+kqmIGzZrcT0EEU0gwzJy4HH6WbErb3l5jTKUuc08m
 UZspoDJhmlf4veliVA3lQUzmWQQc4RS6FpLnuex8ygRuMJMOk6U2vhvLNJmItp2kmJ5Pi61S+j3
 mBT5rw19KM86w0GCrsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092


On 4/13/2026 5:04 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:45PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects a firmware image table based on the
>> attached device, but it does not recognize QDU100 devices that expose the
>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>> QDU100 devices with the correct firmware namespace during image transfer.
>>
>> Extend the probe-time variant selection to match the SAHARA MHI channel
>> and associate it with the QDU100 firmware folder. Add an image_id based
>> firmware lookup fallback for cases where an image does not have an explicit
>> table entry. This allows required images to be provisioned by the platform
>> without requiring device specific client drivers or additional registration
>> mechanisms.
>>
>> This change only affects devices matched on the SAHARA channel and does not
>> change behavior for existing AIC100 and AIC200 devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 72 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
>>   	[78] = "qcom/aic200/pvs.bin",
>>   };
>>   
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
> Why the Sahara driver hardcodes these firmware names in the first place? Sahara
> is just a protocol to transfer these images to the device, so this driver
> shouldn't have any device specific info hardcoded. IMO, this should just act as
> a pure library. These firmware names should come from MHI controller drivers
> instead.
>
> - Mani

ACK. I will move these image tables to respective MHI controller drivers 
by implementing a registration mechanism.
>
