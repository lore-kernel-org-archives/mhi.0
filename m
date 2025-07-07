Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AAD199934
	for <mhi@lists.linux.dev>; Mon,  7 Jul 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878885; cv=none; b=gIzjZHglbBbxVMtBs0YcA7bfA21DK3TtiJhuP9jy7bHJVg7EV/RWaXZ4SvpKMMNRxyOHOsCpjiMJSc4t31gHZNO9j837K7rLi9qNSq/22XwCPCffRgwdKWlwqjl+lUwxA131L7cz46dG5CT4Vz4FKTq5F1VpVoMnh6z/zWzPexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878885; c=relaxed/simple;
	bh=gn6V7zoAHvd9oT1v8THc1IYnXNnJpXQz9QXw7cnnjM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5Lk4Pun6y9MvHtTKHiVGtqXtypzWmzQgwtGUYHTkiQUKqW8Y6NPn6MO7JadHdBcCNbubPxOyfckBqaFHBTEi8R/I8I6lfTgsLwOiKa8rhPHhd6E7IeSSwofMd+Y+tTETQS1SY3xgZYDL4C3V7GLsEzOAYtzkB+Id4LC/l5HuNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcm+tfoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcm+tfoB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5670EK26027898
	for <mhi@lists.linux.dev>; Mon, 7 Jul 2025 09:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2e+UXhs3wbpvZ0zHeB++9+5phi56xOkJYBCLVBgJTQ=; b=hcm+tfoBKd0T53Zp
	7Bh+vvqHx8Ge3ZW05woa/aGjkxGKyrXKjSpjeXSKB1T2AwP/ZHO1oaQdqJhI3O9h
	B7XMsC3xnAjOWMqwM3ExqEoLfRIPRoHvSwnlPeR5J/OdlQIVtfCfVpBwrfzwiqEh
	UXrd3SwifmLoo+YWygcrRQpd7Ni8C0n+FTC+b7UB3wm3PyOvF3nUowRNkme007vJ
	JJH05SwfB0bjzrsjXB5GZa1s5kRD/2EC/HmZ+WtTn6yPUghR/vO3SpsNaSBdBgMZ
	dLGQpD6VL7M+4LaO+ekFc8n+JuBvs6y1Z+v825Sa6wrtYFtnVCcL3Lr6HWCz7WbY
	DyqDIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xm01a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 07 Jul 2025 09:01:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23824a9bc29so42025515ad.3
        for <mhi@lists.linux.dev>; Mon, 07 Jul 2025 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878819; x=1752483619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2e+UXhs3wbpvZ0zHeB++9+5phi56xOkJYBCLVBgJTQ=;
        b=Z22/OqpTAdH+JaXCU6MllX0jR1e103fzlWgZmAHPw9EyRE4ilCzNRM+wY/K9b1/DTT
         MI8E7OyMtHde2y4Y8EuhSWnZ5YRocRgQeQdrrX2gSPww9G0yb+FFb3TaqM+Asmif1g8o
         0GP3CwJdtSnXzty5iKRJtmnxfZdB5D63CgZ5ZNhWviWbUkSUqUR9s1cC6g5I2jpu/QXB
         lLrXZQUbtFDv0QiryqSwrrKYJXZCB+cOkm8JJRrgmRKSlTnHkogasdHFdsc3XUO4F+oL
         ruqefQLwsszRrLsFgJpEMvXxdOri6SVNtSNclC20JpYZtJuJsob+GmWnZx4ZEQITkTVM
         3zWA==
X-Forwarded-Encrypted: i=1; AJvYcCXdHfUXiiGPXRg5dntFTZyYhUsvG7qly9dAOME8jZabeJWyKljIoHeX7rklx0RBx3gjc8c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh0tClgZMrfT/5fNpITbkY5gLZsjaWH36k3dKgXbh3Awga2o/J
	BHP9LzVe+M36oaM7yHXV38mqRRFqjrGPDAp6zbhiT13bY0LP9EiRKfoYCLzpUlGskRHsR7YVf6Z
	NP1h7TReVVPvjfQgRo4pU7yaq6x1zwt2voL2/oxA9360QQLXevz+DXJA=
X-Gm-Gg: ASbGnctWmgwmn398L5K+xCwV6KzBvYkw2iDzxeB2gPiOJecPQfefvvLPFwIq/vCcGAC
	N+k655gD0hsyGyfEDlKhaFvgmedKx9Psh5b2J2eluvCuciHhaSaEQwiLmXH4Sga1sHs/DSUPK6s
	dbpzmJdMMRZ0Vv6w9xqgt5BVOWYXp6fL28yoVl1+2IdsM6YEfIUqP406P0BNWCWqH7f50ewlm3o
	3SNsTsdVN+yXpai8JaXz6rzMZBgIp0Cf/rxca1kfx+lHeBcepes+bGtXO7Z+orAyx+LfyEpcmYr
	mq7QI4VmZ6noARjjvdb+KQ0HBFJJw7LpA1tkGGsKDDHaOG65L4TE6IH2PtBHJdekJJz0lro5bU7
	WeBoue51oQT90+aM=
X-Received: by 2002:a17:903:24c:b0:234:f580:a15 with SMTP id d9443c01a7336-23c8747b74emr197490075ad.14.1751878818833;
        Mon, 07 Jul 2025 02:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUsHLYRDEjwSty6jv0erqnLMKM6mdS+v4Q42oEsxLYI9QjDOc3bdcxOjWAkuvoUwr2b1Hjvg==
X-Received: by 2002:a17:903:24c:b0:234:f580:a15 with SMTP id d9443c01a7336-23c8747b74emr197489345ad.14.1751878818295;
        Mon, 07 Jul 2025 02:00:18 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bde5esm85132675ad.254.2025.07.07.02.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:00:17 -0700 (PDT)
Message-ID: <7b8ea9ba-02ef-4676-a4d3-d088920283c3@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 17:00:11 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <5f2a900a-3c8e-4b16-bd91-500af7d0315e@oss.qualcomm.com>
 <29ba0afa-9a1b-40f9-a174-d03902ea5d3f@collabora.com>
 <8b9eb6f4-6f0c-458d-b1e6-a1893c35b81d@oss.qualcomm.com>
 <a92b3d96-0c19-49c2-ad8b-ad31dec973c3@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <a92b3d96-0c19-49c2-ad8b-ad31dec973c3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MSBTYWx0ZWRfX+AfznZCg24/u
 EtxRVRYy/OBjxGJ9v6A/uZlxOeCKTOviKRRklYwPK6dzeAg2DvlQn7Ofvmo4p9W79m/UYiaGeMP
 +0KL+ndbj0Wyk1iITOl4iwBlRgIjyd1RWWEiCCtDkeD5/iCmyvR4JJzF4gUJzFB4aJYZZrxA/x8
 QpPuYCg4LSLORP9Fe0oeD349MsYnqvYSXMC/nWycbrCgNuZAqF5A3/e24ahDz1qJVUod4VE8Vao
 bwP7CNAA1nzQZ3vpXUvVe/29fVzGr5ef4PDNcTdHrKyLxOu1Z2LOA5PX0q92Qvh+bxB+nEaIK4f
 DN5ImyliVMBz8cdsThLsXAOoXM0Gd81wsOP45CrUXHV9JXLEygseu1YqKuOYAQVlbt1kUxRw+Jb
 y2OvSMJJP0zWWPVApYdrGqltpO5Nv2/aLE9k0eH3pt+oK5LABBxhM8bWWjA0F8M7UCRKQTme
X-Proofpoint-ORIG-GUID: OORDb8EL5FJ5XG9VCLmeyVJxxxiT_yIm
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686b8ce1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=hobwWvx8PSQhfgLp46UA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: OORDb8EL5FJ5XG9VCLmeyVJxxxiT_yIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070051



On 7/7/2025 4:19 PM, Muhammad Usama Anjum wrote:
> On 7/3/25 6:59 AM, Baochen Qiang wrote:
>>
>>
>> On 7/3/2025 12:12 AM, Muhammad Usama Anjum wrote:
>>> Thank you for reviewing.
>>>
>>> On 7/2/25 8:50 AM, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 6/30/2025 3:43 PM, Muhammad Usama Anjum wrote:
>>>>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>>>>> deallocated and there is high possibility that we'll not be able to get
>>>>> the same memory allocated from dma when there is high memory pressure.
>>>>>
>>>>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>>>>
>>>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>>>> ---
>>>>>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>>>>>  1 file changed, 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>>>  	mutex_unlock(&ab->core_lock);
>>>>>  
>>>>>  	ath11k_dp_free(ab);
>>>>> -	ath11k_hal_srng_deinit(ab);
>>>>>  
>>>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>>>  
>>>>> -	ret = ath11k_hal_srng_init(ab);
>>>>> -	if (ret)
>>>>> -		return ret;
>>>>> -
>>>>
>>>> while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
>>>> _deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
>>> Why do is it being done in the resume handler? Shouldn't those parameters be cleaned up
>>> in resume handler? So when device wakes up, its state is already correct.
>>>
>>
>> Hmm... not quite understand your question. Can you elaborate?
> 
> I'm trying to understand the possibility of cleanup of hal in suspend handler. For example:
> * The driver has been loaded and has been working fine.
> * The user called suspend. So all devices would be suspended.
> * In suspend handler of the ath11k, we should do the necessary cleanups of the states
>   like hal.
> * When the device would resume after long time, the hal would have the correct state
>   already. So we'll not need to deinit and init again.

The hal cleanup is not only needed by suspend/resume, but also a step of reset/recover
process. So If we are moving the cleanup to suspend handler, similar stuff needs to be
done for reset/recover as well.

> 
>>
>>> I'm not sure why it worked every time when I tested it on my device.
>>>
>>>> avail_blk_resource, current_blk_index and num_shadow_reg_configured etc.) inside the
>>>> _init() needs to be kept as the later operation needs a clean state of them.
>>> So should we just memset these 3?
>>
>> more than them I think. We need to take care of all entries in hal since current code is
>> memset them all.
> I see. So memset the whole ath11k hal structure other than the config.
> 
>>
>>>
>>>
>>>>
>>>>>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>>>>  
>>>>>  	ret = ath11k_core_qmi_firmware_ready(ab);
>>>>
>>>> the _deinit() is still getting called in case ath11k_core_qmi_firmware_ready() fails,
>>>> making it a little odd since there is no _init() anymore with this change, though this is
>>>> the way of current logic (I mean the hal is currently deinit in the error path).
>>>>
>>>> Thinking it more, if we hit the error path, seems the only way is to remove ath11k module.
>>>> In that case the _deinit() would be called again in ath11k_pci_remove(), leading to issues
>>>> (at least I see a double free of hal->srng_config). But this is another topic which can be
>>>> fixed in a separate patch.
>>>
>>> I don't think this is the problem as HAL is already initialized when before the system has
>>> suspended. So by removing deinit() and init() pairs, the HAL still remains initialized. Or
>>> maybe I've missed something?
>>
>> Yeah, it is OK in normal path. However in error path we face issues.
> For example:
> * When driver was initialized the first time, the hal was init.
> * Then system was suspended and hal doesn't get deinit.
> * At system resume, the hal is already init. We can memset some status variables. But its
>   initialized already from the first time. (considering this patch that deinit/init have
>   been removed)
> * So at this stage if some error occurs and we can call the deinit in the error paths.
> 
> 

