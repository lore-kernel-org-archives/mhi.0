Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4216BE6C
	for <mhi@lists.linux.dev>; Tue,  8 Jul 2025 01:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751939046; cv=none; b=DKTInYTSt8gAoRKIMkyCLWGhhf+cDx2L8D5unK4T4Ms695WmiDRkW3Fs7UyC2/A14gJckR8FX5PyhzuIATGKsF0mteaq+Bo45Go6+8CMa7Z33a66q92EFpZrG5v6bhqvTdaFYBfLaTKu7oF2A/vgdcFaUnP3iVXilvzER011loQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751939046; c=relaxed/simple;
	bh=ITnGl44Ugo75QxOk/V8xMNfq2AqSpn/y/RhZTD6rxqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mu1fbgHxs2siQPer7P4/0fxSllaZX2U2BaaK+DXMlC0WwMdUOWXcX5XYnvZ8Uey9dMh2j/JJl2Jvym0rY+/2oIVnPLAglEeUZi+iZbfGR8Wk3JbRnewnt+sQWYJVL0u5Zy7P5pYT+joazTPbxh52dgVNWfuiHh3PbzKRZZ8x5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgFVotnK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgFVotnK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567KgSfu014843
	for <mhi@lists.linux.dev>; Tue, 8 Jul 2025 01:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl777uk8TYoa7yrfsLRZl56fRfsxTMHbE+ZHD3LEddY=; b=kgFVotnK2ssORDpg
	gLmjlCNYd4OFkuzOzbKRe8qqIBJLkn0j1WXGhNafywS1pWNGb5KE7DBoxfB1wnFW
	qjJByEcVos5+h05YWtLnduwG3JTKiOt6iJd/KYDNiER5Cce2+vgMhbuEFHUAPmYH
	Ix/kilkpPjssem6CaACpmD22o4+1ipsjZe9tjF9m61Ml7cBl2qzNsvYSu99HC6Tv
	eHuQ40rqmsVnD8PlvlvNKircE5KhWBjsJJbgEFJsxzGracJK5JihALuIkN2XTpgm
	69UmRXZceNIpswksCsWYk0veDSaTs8SFlouKfjgcs4yGQqXZTC8Ji1c+2y54G0UM
	HB9MkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkhrfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Jul 2025 01:43:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso5552967a91.1
        for <mhi@lists.linux.dev>; Mon, 07 Jul 2025 18:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751939037; x=1752543837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yl777uk8TYoa7yrfsLRZl56fRfsxTMHbE+ZHD3LEddY=;
        b=K+2XY2jQWnbdnpixB80zaVVxvAsQpXQXV2QJ2HS0opMPHmNbfLyTk8bCY9QUQ+6xcr
         6pAD3BU9ZCunJx0IGq8HVqQyF30BNfYLGrXxs5+m3Qb5XY8qimAe4CIs4jP6qQo7VZCT
         xfMYODT2kuIx5NdORBvhTako31SA6nrwItmN94S2FL7PYVJNkJqD4gp7jGpWH/JvZQpf
         G8YzLvX249Fi6dBaD8a+WRtDyVVcZ4HBkeEKmrPIFeQ4ABYtMuKQB4NNJ3eekx6i/CaR
         +p+DgASQ70zze46hXsNRS7XzkxrfPEdAGN4vFVqoH080V9Yc5eaRFycECdkE2UdID8q5
         /3VA==
X-Forwarded-Encrypted: i=1; AJvYcCUkJisBgyuVzzyJz35An7bh/yBsj2iNRVUBevNFZDX96jvxHFZXtX/l6s74fMeY4ruJ9XA=@lists.linux.dev
X-Gm-Message-State: AOJu0YydvzQOEgxYfwfc4Bu5pj1J/ObqwCpyJo6fDIQe2d1cSRx5i0AN
	K1ZwZw7uShPBDF6/wXH+FpvHH/zrx+BuzMQjZz2uvHSo6/E3+FKBY4GpsTvmX5arsQc/WHWkOxr
	3DzxoNhuGqBe2w6Ok9dKKweJDc6uMdXcdCfWU/ILIbjzGZUKEcDR1WeQ=
X-Gm-Gg: ASbGncvRK44Z6WHPmJmhGB28g40/1bRy12OnXw7xAW2djpLOueL4JTAXXoZxrxDxWqh
	8Q1cInI3x6qlClzL4kxUf13oAyYicSa8OsFUke5H69Dcg0FZ9pHYkSICVXEW30lshY6dq/i1yP6
	QFryoKJNTM42JShRE4bFkjSWvm8WmiJgRw026YQcSPSm4Ue8XQVtvtsHOYvncosqwoEIv8Ex0I2
	h0HqWp4JVdj/W6fdAZ9CAiChrw7KbpRxY9+q/M72jfI5Wbq92049DZIhgmaAucwn1rIHpltS8Fp
	dgd86bBgQy//YTtxbWmKuisl/pwmUhApgnl9qTgKDsc9BcEx/B3kBt8ZL6wr1vgXUqR74+RNjJU
	LU52Td5XYtk2kTX0=
X-Received: by 2002:a17:90b:1f83:b0:311:df4b:4b94 with SMTP id 98e67ed59e1d1-31aac432a89mr19916290a91.4.1751939036594;
        Mon, 07 Jul 2025 18:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhKVpmGrrRXQtES7O9YfBq82/o7OuEhVZMyofryc6rLrPXsT448ckzR8EZfAtTqPI4xY9GZg==
X-Received: by 2002:a17:90b:1f83:b0:311:df4b:4b94 with SMTP id 98e67ed59e1d1-31aac432a89mr19916248a91.4.1751939036125;
        Mon, 07 Jul 2025 18:43:56 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c220bc5basm642199a91.42.2025.07.07.18.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 18:43:55 -0700 (PDT)
Message-ID: <fdb9f1e7-bf8f-4018-b0ac-ac8a70d9b8ec@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 09:43:49 +0800
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
 <7b8ea9ba-02ef-4676-a4d3-d088920283c3@oss.qualcomm.com>
 <9eba0149-290d-4010-8791-d4d8d8be3786@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <9eba0149-290d-4010-8791-d4d8d8be3786@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UHTIpdQR_G4-xboKOrVMopxeE5tmcsmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAxMyBTYWx0ZWRfX5JtdBi5wHnqE
 8oUCE+TM+f/EJxLfJDxNVAw77GFpuyDcELH3uZyLqCHRVCx9AVXcGHGTkxB2ET0WwZX0g8Co69+
 l1BTe3jfOYR+wj4u/oKUmJF3vy9u/fjFyVyKyfAVxDHCNaFOu6E3Rij95RIicdkRCo2qBtoOq6W
 YkbRb1QQyqpxUfcPMPWH+5XrwjzKpG4FOXlhtLSt3P/wdcPLHSKJFkbU4fQK7+TOKYkfZQwCKfB
 m0h2fYFKYBpf+sdTsDQGzFMCNrwKrsi/88ib0q9l9K49hTf2DEfq4dTvoyOFLfzWe0Xndnn/Dga
 mBk9OKUCqm+gb6h3bVIa4E8H80PZGl1VbEEkGVzr414w7QRbkGGwSi2SOajPZ/RwFUrn7wGeu2g
 90xKZD8FwPT7rhHrYe9AZ/qULfHUj+SYkKVReBSxIKLDPTkr2DAnWbM7XkZoaAD0XH4++NTf
X-Proofpoint-GUID: UHTIpdQR_G4-xboKOrVMopxeE5tmcsmX
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686c77dd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7V90euPs39zsmW6lzs8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080013



On 7/7/2025 9:11 PM, Muhammad Usama Anjum wrote:
>>>>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>>>>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>>>>>  	mutex_unlock(&ab->core_lock);
>>>>>>>  
>>>>>>>  	ath11k_dp_free(ab);
>>>>>>> -	ath11k_hal_srng_deinit(ab);
>>>>>>>  
>>>>>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>>>>>  
>>>>>>> -	ret = ath11k_hal_srng_init(ab);
>>>>>>> -	if (ret)
>>>>>>> -		return ret;
>>>>>>> -
>>>>>> while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
>>>>>> _deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
>>>>> Why do is it being done in the resume handler? Shouldn't those parameters be cleaned up
>>>>> in resume handler? So when device wakes up, its state is already correct.
>>>>>
>>>> Hmm... not quite understand your question. Can you elaborate?
>>> I'm trying to understand the possibility of cleanup of hal in suspend handler. For example:
>>> * The driver has been loaded and has been working fine.
>>> * The user called suspend. So all devices would be suspended.
>>> * In suspend handler of the ath11k, we should do the necessary cleanups of the states
>>>   like hal.
>>> * When the device would resume after long time, the hal would have the correct state
>>>   already. So we'll not need to deinit and init again.
>> The hal cleanup is not only needed by suspend/resume, but also a step of reset/recover
>> process. So If we are moving the cleanup to suspend handler, similar stuff needs to be
>> done for reset/recover as well.
> It makes sense.
> 
> So clearing the hal structure completely other than ab->hal.srn_config doesn't seem
> right. I've also tested it and it crashes the whole system.
> 
> On contrary, with only the current patch applied, there is no abnormality.
> 
> num_shadow_reg_configured and avail_blk_resource are non-zero. If I make them 0,
> driver still keeps on working.
> 
> 	ab->hal.num_shadow_reg_configured = 0;
> 	ab->hal.avail_blk_resource = 0;
> 	ab->hal.current_blk_index = 0;
> 
> As you have suggested setting these 3 to zero, is there any other variable in hal
> structure which should be set to zero?

IMO srng_config, rdp, wrp and srng_key may keep unchanged through suspend/reset, all other
fields should be cleared/reinitialized.

