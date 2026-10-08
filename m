Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B0C35E926
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439909; cv=none; b=joko1WmbLj++s1Og3qgJ2xXjK8YNGn7uALEuXD+TWyplXqUXR6e0n/YSSYkkEavZSwnZ9qcU2+Yj8VDgPRGj65DZhpasqqUrOSos9j9cQvn1oAY22JWc46JiOI3qy4BNnvowehFyFygjrW8baWnHj/S17Ehr41zvymjQUALK7rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439909; c=relaxed/simple;
	bh=mQM8iO+zt5QYIp0Zyu8xKeOXW6PSpr6CP7eG/xPY764=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pu0Cn5oEmtfk3ajqeiUQDdQVU6FeqreppWQgGWQ7V0sbsIYxLuIP6J8Yct3Z1/i8RQwKIRj/ci37dMWC81q+W/xAUkIL/4l68Y44JTjAoSgTpqEZClRZISeaCPxEWmhXtzqMiFibtpum/9CGcu0Ugu6of16hC15O69avD20JQ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C60Yibao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFRiItWR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C60Yibao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFRiItWR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BeEo753999
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=; b=C60Yibao8onkV6FM
	w2Vqcu1Ki0Yr6cfzts0IeIUvieAvOvsXjV4alKG8EFG2PXC+l+CYbcDTQTMliPWq
	c9ecXeXC6vhJKzKBY0rzPCtES5jeYjuG4JzBbu8sp6M13BbBS0zsPLx7y2Kd5MIW
	WaZbZbUnAbNIjEuBShDWvoO+csLWikYp5zCRjHkj33hSjw+3MIK+bmAqjr71Ijk4
	XY988HPKjnP0FwnXLvCrTEq1PFA80pq7IabbK4RQAgCv3u9DGx87eOBZVaZUkMVV
	2PIx1kfdbcWnlPqwx6d5NItHcn3xDzlFl2/cEXbmFWc3NYvt+yldy37mnnGDjfpK
	3dYMwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39bgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:11:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a82c7e8fcfso3574762a91.0
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439906; x=1792044706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=IFRiItWROWKYZV3hXhTsLdmUf/Bxr6FYWrGr/leWxtwO0gx9e3A6hX69vhKViICVXV
         0cwF/r57lHzPYCumZy2WhjYUycLlW7Z7jDJ69NQhYwJ35c9FONV1DSMxFXOlM0DKO7lj
         rf+MD5fEuZuhvpARpQD5agMPoOrhCTU8c1tTNa7ozvDBfYkk39s+kk2kk1vdh293WbKT
         K6ltAVMlIjzdEKwLdxDTo/ZdQIY0vhuVc2t8pxkP4oZO/g0CbUOBPYSZ3XgpYgLapzuz
         hohENU/AKuMeDGkPufvUAmRp5t9Kz6ls3CAwweAyr4n0cC3Fc/muNEK2zm2eC/N83YmT
         VrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439906; x=1792044706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=ScJROc3V1QaZ9jFdk9j3qW+xd7zveZ2g4eFSstOIcOmud5GKwVX5Pw+CIk4g5yRBgT
         8WUAMvtx7DRetbMPYLs3w2FxyMWcD91IGETffDBC/ijBIV2iMRVtx3pVxD6FVI3ukklq
         XakL7pJJjvGmVx3mpwfiyZTNKnhBAWb8SohKdyKgaulYt5lZUnTuEq3akR9wHfokJ5NH
         mbez3ypz659GZelgwPBLXc5z2m7tUHpBE7AKgoI4+msE4rEU92clFJ4QzF3EAvZFz1bv
         LbINZF9cDBo+ZhLvfpTpla3dPTNKQd9ap6ZUdXUPcKi2u48vs+E5psAtYEa2Z5/zWCVt
         N5DA==
X-Forwarded-Encrypted: i=1; AKwUvBwNV6JjFPi4OdwV8n5cIdeffB9DQEZDXu7QJd+aKIKREvWep8qkJYNr/Hy7kZRo4CZx0AA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKXc/ubLFT1zLZekUMk3jdL5HguI3EFOLdMgjeCJfEuUuI77s2W
	SH8H8u6TcTL9trtzYl/IfvmMsKD/+YImxOcDn55X/2DRhC0B8VejqMNr58yF+vsymF9AGQqJxte
	3BL9mUJETDGh4Bm1j/WyKA5MxyPMx1efVIWXJIuC7yRhCyOc7SLTO5Ec=
X-Gm-Gg: AYBFou3n629sLHolqDp8OkdpPo878S2WS4Ty0U/2nDb4XR/prXGRmMt0Q2H+rymgIkx
	0kVWsIirU2zKGfB0EHWlzNrCmDfDr7G9QUa0H1kslbAnOojx5FI2WVfNf6LocOxhvpA9NYOKGuw
	F+mI6UC6HKpUCMMi02p+RSF/jMjOPji2h4qQSwhKm3weH0cN9nyN0R0+/Y7hgdsgV9a50Kyr2fp
	2kBFz9uKaC7+zcxXkUxSeHle0kn5i+O3HXKf/LQuxZzpm+XKCtTwqmcdwz4Wjqy4Xbz90AMAWi3
	GEJQCVzIdTqipdov+U0OAyJpkFoGpZhR/Jby9rr+6Vck5apAvjmQ8qJCWqF83fyCGBY2T8UHeOH
	BPoCbWQqKgtUjoq6NX7eeb6S9KsB7XgY=
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571765a91.19.1791439905516;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571754a91.19.1791439905042;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d416348sm4247427a91.0.2026.10.07.23.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:11:44 -0700 (PDT)
Message-ID: <4ab383a0-5fd3-4cda-a0b4-8d9bd5d015ed@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:37 +0530
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
X-Proofpoint-GUID: CwB1qcmHivtbJ7TyEwRPXiaQT97RTEA-
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac73422 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BmEjwzUHSYKQsWGf9k0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX6HXQxLTiDllQ
 +GC8cXTaG3WymBd6yikmvIXTcAngntqu/+9PLTvebbzyTj7alXJOAPtHzJvR4VTMBNlt+u47MgY
 z4yGc2M6q8n6fxN7Zz/DHvqEqbRdqmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX4XQVLN9wmumX
 O9PVXK2XIGzMgFn44P/4WLHwoFtYluHrLM3kj2aw8QBpBPLiLx6k/UCodmyZ57ptxPDSmYtggxg
 Icm89ftm6kBqHf/z9hI/NlL3O70E2/BrVbqCUEkT4OW/dFtmWhW2ABVwIJStK3Jmg+v7qzVIiNl
 dYeSyc9qugYJCBTCerpDH8Rsi5IToSjXi8IjKbYTKufYp8+14IPbn2YtMNEkvPTbhipSJB1hO8R
 twRP/44v+eke1WPk4CiLJMEjQM8YicVwQ+pE9rm/3VZpsmeJOGUE5YS41fmsUstaSr8Csg4GifK
 JIhotkxno4L6l2vWnpC41xrryPnqSZXSb0mbVOl1wURyQpwIimrI/SuTlQmyTIDHMQ3TaVI7w/t
 GrWKayG3Lfc4bm2emvRqqrwEURgTUKoygJejpIodfJBTIpizFWsSSSwvkeMXaRMZUQ/22GJyuH2
 8aELCKqVvI7ghJ1k5hw==
X-Proofpoint-ORIG-GUID: CwB1qcmHivtbJ7TyEwRPXiaQT97RTEA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


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
ACK. Will remove in next version.
