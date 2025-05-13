Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75922BE101
	for <mhi@lists.linux.dev>; Tue, 13 May 2025 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149421; cv=none; b=M4V2y4BlH6zyvJpkZV39sMlD2CdkS3A4zueABF8fCm0KqG1mJJsU5SSW1pvbOpaq1fgZ0yV/gSu+ob3thStMfAs9O27XmI5FlqCLDDY9HgB9XMdu6FVu/dFW06VYe61r716ix40D79CoVPMMmKjraXOzsH6OtHPhGVkgddsWtGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149421; c=relaxed/simple;
	bh=efFpneV7rV4EY30pj6fIANj7dCK+In4mFisjbvF0K04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pdo8Mr0H4/dpVptiezFEKYzTuXLIay6JzQkrpSBn0y/1Ma6OVODk6lx0Ype0vmG59qnO2scJkTYGt8VvrWR3Z3tqqzzlH+lNn7cXF7Lh8XDNyHh9XuPHtquAKAHpoFgnd8ZOk3P71qCTarSgFOZUz514Gx03mEzX4zkcKKlZcig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIZas53f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIZas53f"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDMLv0023252
	for <mhi@lists.linux.dev>; Tue, 13 May 2025 15:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=; b=LIZas53faEkTAKOj
	U+9+fr4CgM/DHXntykZu+DTxCM7n/wNvla8Yh1M+Anl8FZ44LK2LogmklpCLkpK9
	ONsYCV+6mRfxkfS5hLHXeS/+TSb6/aDAEYnmUKnwjV4PqZYtINQKI75BU66Wo+7X
	s8meOhsXZUR2zSgnWQVCvcnBs7z6wEJ2vf1smom/uOYDRtyQ/cak3+CYZ6hjYzs6
	i5OqptPTI4GG74bcH+w9cX4y1HTJ0C0dikakvsFgpOFvAuyk1PcIJtYMRXp2loFa
	Oat6rwKbqMK0h37WAFX9RGU4Juw/aOaCMdsc2RZna9NpYYng9tp5Se0b8TqUYNtW
	ysBcEg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp4dke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 13 May 2025 15:16:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7424d8944b6so2252045b3a.1
        for <mhi@lists.linux.dev>; Tue, 13 May 2025 08:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149417; x=1747754217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ztrdVxrn8TBfS/7xFyW3WzhZsuxUDilww8DQjUsNkI=;
        b=aw95yYOIm+3udkePY6LFoJTgovDFr5xw0MxHkrs5VuWVcgiCokC5g4IxllNlEZoocA
         788wQW7CY14e7hAHAsc2Bs39yXxMI8SOYu7MoA3KOx+T/1Q6qsBQpKMcaIUQbEfpf0cH
         UBdphb6PY+azWwZZrNR/0759rsryjDc5Eq/ycsHioPcKOmG6DSKW5nDIEuGdMIOCtvzG
         fLKYXUk3Quj80n0ZzMrdPleYLSmze6DGMF3rlDidwttdgzzqMDv8bPY9+worxZZULhI1
         +3nuMLAEC6/Svx/615czfySc5e+iD72Lq8JwUoKLyyt90nAMflScqZ1q9Uw7q7qIqJjc
         fiLw==
X-Forwarded-Encrypted: i=1; AJvYcCXDBQh1g1qfWaPLud1758M+cuvOoKdZ8OB0UVgZ2Wr/YyD422RWfIRzfLjK+9PcEYwJI08=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws/iI68orwkrkK91U9jQvXEZwD4w9wrfHYRSIa2+ArogsYlV+r
	rdZznqqhLRdPIvev99J8O8wFXHOu7NBqQBcTMVtyg0w5RvzwkpqRUtF5hmUqww26Yypbg1t3d7T
	DeufXrROy0Tqh49Us6SPUxwT7G6noOBkFzopIYOjOLkBJWQkRL6A=
X-Gm-Gg: ASbGncsjazunbH2RfZky8m8pyW0Yj4NRTq4xeH4o3H0n818k9xKXTNKGBMkES7RYslH
	YvuU1PUM4Teaf9QY7CEw+O3jdgMHyMC8DlXJf1p/uov4HctQ71dK8OvdBkMqRrhn9WN6jeXgt6z
	e1mXzIbaO5wisQu+GSt3tjJ9YJtxydJteUexVHct2Dc835Mxgc7LGIErJ6cPLeR3qjW5e/Qnv0n
	Yb9fvgJOTTJBJfP7gSTkcONMznHGSxURzTujR/N37A47XHNwR5Y0Dk2XuTV+Yd1pKvg38b2bm4Y
	1b+ZV6ZjTQIN2Iymko9lBkMesgFQabxjs3sihFzViKnyQAIE75GCDJu7nQr/sQ==
X-Received: by 2002:a05:6a21:328b:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-215eb73ff9bmr5239892637.10.1747149416993;
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/qZgi8tIjcUeE0ohWzU4Mnw55YfaTgtINhOjXu6Fl8drDxzQO1FyRbVY4oDD29OgLNL9FTQ==
X-Received: by 2002:a05:6a21:328b:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-215eb73ff9bmr5239835637.10.1747149416526;
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3ea02sm6349451a12.39.2025.05.13.08.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:16:56 -0700 (PDT)
Message-ID: <57e04b5a-9f04-49bb-8a7d-978276e9033f@oss.qualcomm.com>
Date: Tue, 13 May 2025 09:16:53 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
 <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
 <5521efad-1ca8-41e3-b820-5527d634c539@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <5521efad-1ca8-41e3-b820-5527d634c539@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xg34pntyoui-wv0KCVu6CJxm5_8r91iQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE0NSBTYWx0ZWRfX4tbZtP0KrQ8E
 cboBmrDj102KNIj2YKOxiWpfHwh4ee766z/ODZd31uoNEkh0vy83tWdGX5z36fpc5MSksil/rxb
 fWaZ24Guu9JFgX66330XlgKjfWznAjicQZLXQbhQRImKZTPtgacm7sT/cMiN0VXcyS872SSbI1G
 ZfPJ+jtoWdOXXoHacRLI672yV83LKOkbEYOVBjUyVlAtxp06exPQAUv2S4vyxmWalUtcE+DwoTV
 tyyBv7YQPI2SKuJdy0mIHrMXdCMDi3gPK13YqihTR6sXqGbYVJT6naQXje2HxXTM/0zQul9DQuG
 kdCLQuT9o+q2r7MI6S5401Zg6IT3NoF1V3ytWqKh4xQcs8d3X10jPG2xr6Dv5pjsKa88MVayuzB
 c6APK51zH+NLw6Kc8mxLsqr+vjNFGUK5zzgJsgKp5M3HaW0Z2RvRCnMDYSIo3sajwJ9o/hXI
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6823626a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=ql1YSk0x1lwMMiQrb4cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Xg34pntyoui-wv0KCVu6CJxm5_8r91iQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130145

On 5/13/2025 12:44 AM, Muhammad Usama Anjum wrote:
> On 5/12/25 11:46 PM, Jeff Hugo wrote:
>> On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>> allocation because of memory pressure. There is a report where at
>>> resume time, the memory from the dma doesn't get allocated and MHI
>>> fails to re-initialize.
>>>
>>> To fix it, don't free the memory at power down during suspend /
>>> hibernation. Instead, use the same allocated memory again after every
>>> resume / hibernation. This patch has been tested with resume and
>>> hibernation both.
>>>
>>> The rddm is of constant size for a given hardware. While the fbc_image
>>> size depends on the firmware. If the firmware changes, we'll free and
>>> allocate new memory for it.
>>
>> Why is it valid to load new firmware as a result of suspend?  I don't
>> users would expect that.
> I'm not sure its valid or not. Like other users, I also don't expect
> that firmware would get changed. It doesn't seem to be tested and hence
> supported case.
> 
> But other drivers have code which have implementation like this. I'd
> mentioned previously that this patch was motivated from the ath12k [1]
> and ath11k [2] patches. They don't free the memory and reuse the same
> memory if new size is same.

It feels like this justification needs to be detailed in the commit 
text. I suspect at some point we'll have another MHI device where the FW 
will need to be cached.

>>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>>> index efa3b6dddf4d2..bc8459798bbee 100644
>>> --- a/drivers/bus/mhi/host/boot.c
>>> +++ b/drivers/bus/mhi/host/boot.c
>>> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller
>>> *mhi_cntrl)
>>>         * device transitioning into MHI READY state
>>>         */
>>>        if (fw_load_type == MHI_FW_LOAD_FBC) {
>>
>> Why is this FBC specific?
> It seems we allocate fbc_image only when firmware load type is
> FW_LOAD_FBC. I'm just optimizing the buffer allocation here.

We alloc bhie tables in non FBC usecases. Is this somehow an FBC 
specific issue? Perhaps you could clarify the limits of this solution in 
the commit text?

> 
>>
>>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>>> fw_sz);
>>> -        if (ret) {
>>> -            release_firmware(firmware);
>>> -            goto error_fw_load;
>>> +        if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
>>> +            mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>>> +            mhi_cntrl->fbc_image = NULL;
>>> +        }
>>> +        if (!mhi_cntrl->fbc_image) {
>>> +            ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl-
>>>> fbc_image, fw_sz);
>>> +            if (ret) {
>>> +                release_firmware(firmware);
>>> +                goto error_fw_load;
>>> +            }
>>> +            mhi_cntrl->prev_fw_sz = fw_sz;
>>>            }
>>>              /* Load the firmware into BHIE vec table */
>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>> index e6c3ff62bab1d..107d71b4cc51a 100644
>>> --- a/drivers/bus/mhi/host/pm.c
>>> +++ b/drivers/bus/mhi/host/pm.c
>>> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller
>>> *mhi_cntrl, bool graceful)
>>>    }
>>>    EXPORT_SYMBOL_GPL(mhi_power_down);
>>>    +static void __mhi_power_down_unprepare_keep_dev(struct
>>> mhi_controller *mhi_cntrl)
>>> +{
>>> +    mhi_cntrl->bhi = NULL;
>>> +    mhi_cntrl->bhie = NULL;
>>
>> Why?
> This function is shorter version of mhi_unprepare_after_power_down(). As
> we need different code path in case of suspend/hibernation case, I was
> adding a new API which Mani asked me remove and consolidate into
> mhi_power_down_keep_dev() instead. So this static function has been
> added. [3]

I don't understand the need to zero these out.  Also, if you are copying 
part of the functionality of mhi_unprepare_after_power_down(), shouldn't 
that functionality be moved into your new API to eliminate duplication?

