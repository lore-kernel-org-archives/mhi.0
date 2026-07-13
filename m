Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E0C36CDE8
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927634; cv=none; b=d7SqIeavHHiWOEpygAbQS32KiAy5UFfxoIPhrJ+G579V4Wi6gYiIsvAvcPUuwJbU7d4T0otAE8uGgYY2es29bSNQDMnQFm0dhDpgOmVOvcaE746miQm0mJSwNSHRBO6HcHm+5njATxQqh2ghxVnd0xoG+1hSv2b0AJif+F+J+K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927634; c=relaxed/simple;
	bh=rzmaf5Nx+QMbOMDy0JTb5Od0rGnZuwwsagTUEYpVYjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFMWwVQxiguYmC6Om7EogVhcNDl0eAEeuzRzj9X4P75Ix1nrTbknjsf05LY1A0stKQM5aaj11SWwQlTjpo2gPexDE/ZJYSw8QgYidzFSjYjNIjWmaabhGiHcpAu7uFvjvSjtc+IUYWfQbeT34ZB+L8PalVW1HvvGjtRHgefjzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+Jjp9n6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIjIMEht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+Jjp9n6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIjIMEht"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6OcTW605113
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7+R+IEwGTa+tW+AFP3lb1nudfQDALMgZxFV8QusXX4=; b=Q+Jjp9n6AOakwWLd
	sZb73+z9Vlt9Hd5YTvKP1ayCn3AUxjmfoWeWhr16oqG4wcLX4wPBoQJxZ7VaPslQ
	xerjjswTr8aBuBPkj9DhvFBmdAXV7dCwx5WF9AhAdU2HGF3cv0pLwyoG38OlK3OS
	uiE6PaRNG4fMNS14+xWC4u+QKMJm7t/uaHt+p8DPmBKl9yaCBsdhZBcM2Z1pRIWI
	8lYkuMfqL7p98q7qHUcIWhx0gNLVEg254J2d+wNAiHMqrKIxrpBOA1QKEsneXqCz
	FOZyAFA3MBm1Gz3g8/N21k5HZD41WMGxyqNFNMXhZHmThEOW9yvcpIhP89ZQVF5M
	NVmJMA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehmygu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:27:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so3506642b3a.0
        for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 00:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927631; x=1784532431; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7+R+IEwGTa+tW+AFP3lb1nudfQDALMgZxFV8QusXX4=;
        b=AIjIMEhtko3lCCtXUXbTmTD8eqU8LMtWO53JSBjz6xClipSWPeERdmfN7eOKhkVIhw
         lsgvkLdaOV0++QGz4vw9YmRU4ruBEys4ehVuJcUl4ZdSPZ99QfMxJZl5CE2grYymM2F7
         tm/jFrK6pAIWTSqwtc3ihSfugJUjETjLc9iNE8vkZcNVNs1/mxRloa+tvBLf2LsMIFdR
         fBFjNdMwBK0OOeq3+uJwBBqh2cks5G6Tt58BJ8ukbD2fSxktbtFXakFR6m1qOVyqUTD/
         XWVzcZK2NYhIqWV50jJ+WV1LGEuux26K+wlcywGKp1I+Ash99FSY8VFS4CnB6xI7pL9L
         S0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927631; x=1784532431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7+R+IEwGTa+tW+AFP3lb1nudfQDALMgZxFV8QusXX4=;
        b=YZ6s6RJoJRScCoc7hk0hcw7GWYmwRsImG/wow7YyavZd0+w2xYCXtyTQzEZ6fJ9OW4
         OFURWOA6DnX7XGipl2hMJXoI6LNBUBzn/oaHghv//Bly+lZbSCVBVlUDUYlMdZQ9Ilc3
         U0AsF8mo546HV10Wm4ultxMICRW048VFt/SBW66aHBvXFtXmrECq84K5SBnkISEyx0Dl
         3wQCZ1JyZasOVEyI84+XNmXvaAjYHhkeFpG/lWwXTAgaLtI91waKCJ/5xVjCLWQvf/iV
         ezSLuj2bzmAFkt1U5m9ptn4qWP7SbHosvHb2k9aJpUfORMbq+9oaRc6WRE8X5gcxyeh8
         5hNw==
X-Forwarded-Encrypted: i=1; AHgh+Rqm+vFw1MITMgyOUB7nDNeSuvnfWzAGxXYcg6bo+8eOJCJtiFZ0+h7QEhCOYbaele6YXU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA0w4tHF5aJKw/6SAWZzcQww5LQKW830+vXOzmldJrSyi7v3Hg
	sNr5UohjyPX8H1GqvLyby4R83gMGe0ag2at65yPNjB9jLrvR8cM2c3/xTk3SUz1UFh7lKuuP4Te
	458KYKWx57p+TatTolSLtq3rAZKPFRgsSl7OjJU1y9zRG+Krc/NnSmRg=
X-Gm-Gg: AfdE7cmw37RVt0a0OkEpwtbCBx5AF8Rw536i6BOiGz54Jh7/fMC0LJ3WV51sDiZYTCN
	SEUVWTzdEi3N9VyliIG/tq/E1Z0TIV6HLOY9KadRG7GacbqaRy0SbcsZd7qYZG36Fx+MaOmFLYu
	MNHkxAaaBSeWiD3x+ZfqwcU8tgEFi7sNJusfLy1i3gyVbkhObX7Hp07fbf/XgekTXdvAr2ioItJ
	pzCjwUSkZmpU+404bhbnJc0OUdtOPnvMG5DxfeCDSnAaSmgf66STIkdPuoUoVj+djjOUN42sZjR
	zOE05EoeRv1uuz0LpwaBetFPL7FmGts5+51N3qEkurSi8JHLif3MZ1VlG75Fm5zeAUXbyZi+gqD
	Kez3w65frbEtrHLUvYUWxGO3tov6LONWBN6QGszsxAfA=
X-Received: by 2002:a05:6a00:a117:b0:848:824d:aff4 with SMTP id d2e1a72fcca58-848896fee6fmr6817086b3a.56.1783927630855;
        Mon, 13 Jul 2026 00:27:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:a117:b0:848:824d:aff4 with SMTP id d2e1a72fcca58-848896fee6fmr6817067b3a.56.1783927630381;
        Mon, 13 Jul 2026 00:27:10 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a15e36158sm2055595b3a.47.2026.07.13.00.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:27:09 -0700 (PDT)
Message-ID: <d8d0818f-4f3b-4efa-a89e-e304be91f3cb@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:57:04 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
 <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfXx6A0XZ2+/sSr
 1Unpi8n9lQxQOD7gfijNscj5T3AIARB2cQOSh9PCWWUYOMRci0zxhFQl8hV0AtzXR9lePBq5Won
 h6lJfRHwl9K07T1Ytzmkh+saowtIzfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfXzrEd+qQyLPkF
 iPPZTxX4jYb0ltRCmUjK64Xs5ZPBwH4ZQYJuESk4f6y2FIUuCcuz0MV1XkfbkNyRC9nf18IO/MY
 ohESAphWqGOzNbyDydQnSTFz34cWZ/YwjUpHsZVKSkyi/FNpERh84slJBF0USXUEGcwgfsME+v9
 bRhdJEJl5jM3uzn5H2iFEl5c2p1ndHTd3+EXFs2J3Iy4yRdIOkN0Y5ts56q/KTw3MzHAxrJetaT
 X2hTTpzkhy/8LcP64U2+A2dyo1xeHjmRpcdUyROMeXZU6/2gOZRPLNm+4m/EamVS4hYNmW4jgva
 Wpm6CzFw3y7jMrOlK9HGN+OqpKavAVmAdIg/ogE36fcgXLpyKgOlbwUhz7Zctd8RAw5DRWQvFUi
 RUdjTRj1KsumAbhegxGA59f3ZYMrYw9C2g6Yei7jYwu5DG0z03GM7xSnt8JTeAnDQ+2OJwzgii6
 KkIJZP0qYJgjInYJ2wQ==
X-Proofpoint-GUID: bvImiDUDip_ynA7ZMrO6F7K5DcfDAox4
X-Proofpoint-ORIG-GUID: bvImiDUDip_ynA7ZMrO6F7K5DcfDAox4
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a54934f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BmEjwzUHSYKQsWGf9k0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130075


On 7/9/2026 11:51 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:39PM +0530, Kishore Batta wrote:
>> Devices may provide device specific DDR training data that can be reused
>> across boot to avoid retraining and reduce boot time. The Sahara driver
>> currently always falls back to the default DDR training image, even when
>> serial specific training data is available.
>>
>> Extend the firmware loading logic for the DDR training image to first
>> attempt loading a per-device image dervied from the device serial number.
>> If the serial-specific image is not present, fall back to the existing
>> default image, preserving current behavior.
>>
>> This allows reuse of previously generated DDR training data when available,
>> while keeping the existing training flow unchanged for devices without
>> saved data or for all other firmware images.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -59,6 +59,7 @@
>>   #define SAHARA_RESET_LENGTH		0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>>   
>>   struct sahara_packet {
>>   	__le32 cmd;
>> @@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   		return 0;
>>   	}
>>   
>> +	/* DDR training special case: Try per-serial number file first */
>> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
>> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
>> +
>> +		fw_path = kasprintf(GFP_KERNEL,
>> +				    "qcom/%s/mdmddr_0x%x.mbn",
>> +				    context->fw_folder, serial_num);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +
>> +		if (!ret) {
>> +			context->active_image_id = image_id;
>> +			return 0;
>> +		}
>> +	}
>> +
>>   	/*
>>   	 * This image might be optional. The device may continue without it.
>>   	 * Only the device knows. Suppress error messages that could suggest an
>> @@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   				      context->image_table[image_id],
>>   				      &context->mhi_dev->dev);
>>   	if (ret) {
>> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> +		dev_dbg(&context->mhi_dev->dev,
>> +			"request for image id %d / file %s failed %d\n",
> Spurious change.
>
> - Mani

ACK. Will remove it in next version.


