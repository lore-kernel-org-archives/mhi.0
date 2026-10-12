Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE74CC26B
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828758; cv=none; b=RrKvzXKiFk1wesw6Zlkb+kcZkLeQT6eyE376FBiQwKjGrJ5zy3uhDnm9IuXXdt/y32ylBn47MSER/MOctn0+N4U8ucn/xjubr4+Yd6ms7a3O6kSO+dxJJa+gnZ+HzVwCVuvsMiyOygTjnOGP/QUS470i0FPiqL/kj9CidAKhMTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828758; c=relaxed/simple;
	bh=xMOB+Xeswh/VHG1JRXbW55ogVP/Sfyg4N3upBRTPGH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZVsioPjwmrZgsCieFMFExzFfklvFztP0Rcb8gheQtWdLdqhxOzXlXPWt2kllJDkcwOb91ZfVoAZcCYkW+/Q6b4a+y6lrdRCDzElpAvxnMIQ64eydQTNgaVm591/DRf+TrQiMytbvdfz8O9D4M+y7bnBiBQ7YPWVC7lOwZP3F5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNSM7lB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvKhqx2o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNSM7lB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvKhqx2o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv6aF4086147
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=; b=YNSM7lB4JH/yNGny
	CkiKnKe2Q/7w9vBoMyHJg/uLWTnONhHn5J+/1bsPsEAs9AUyIxXShnRefFp3lNN7
	5hqZyXp2gMfq9tjuyE4TlUWUQ2IW36U8gheCFvniVwXnJy8RETjpu0u0qjqWUgGI
	7iZCLRvwUy6/ZpMWCRXTEj27D6TzlX9+IdQh4vawLxl+t8yNoEDxfGJ6xvpRLVcR
	Ao/FfP1gSDZgFLvTgU9lCXKYwsPWi32FZmAd9aBiB1Sam2FeWMfCtsKkyphgXDSI
	IN1E8sbVGedTsfCtjh7QWbRGXiG03Oc5S/YOd6iBR3krdFZcDZIV7mNW+5wlBPPr
	wxa4/A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3jtap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:12:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso15089eec.0
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791828755; x=1792433555; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=;
        b=BvKhqx2ob6S49im0o0kwCLt+s6VPXBWPgbg8IzBlQP6cgTMm+XVIogIJzYf4EI+JvD
         SrTw9cYs3gdU/khXuFeI+WUHp6saX6GvBDMKVE2KNAs0aDH6SCj9i6XiNWH/PB+HJPad
         by0UBPua3oWJNtljrx5vN9bdV2Jan63Rq5yei0gF7VBttwcF1/FboeIHYfi7keYDZZv7
         VVbP7NBhUM/N/VHnSqWLFuKHWqsC1dxFcWrgeiG3Ffk99e2/f6Ar33KBKnj5Zr7WlfwV
         8fnmz/Hgoko/yebVaE25OpFhv/T2oHJ1/Xvtaj7NB6Q7Y1fEwEUjSxJZ11CaBgl3jSej
         jwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828755; x=1792433555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=;
        b=xAjdtbCgGcHYq0gB8TyKL1GFWoE/EyaSPdFLYksR3p2p80X5JpGEX7usqrfMaZczYp
         bNgOpavMYq/pde4IkjYdsyZCAheOspp/MKrzyapH0MaSnGVJ4MOt57y9jtGfJwVVt7GB
         ZTfLzddOoz/BqLkZC7SySdNmIJgf41ozU0Z9WRa7wkCHKDnvf+6wNvXo9H+ihsTubM3u
         Hoj7o44K9/NmSOYXF0KiLe1DCNTf9K6yKGka/Ti2F3iivmoXQTQXS2yLw6/mwncrth6Z
         2jZYPeUrsgKpMsha1M+qELHnAtdLwBpO4kvx7MxUw2KNxftsFq/eHD0sTRFRO+iOfiMK
         7m0g==
X-Forwarded-Encrypted: i=1; AKwUvByOaJOsnfC+xQiLzE6o8BadU6idtv5+H0AmuIoo5SGTp0IRSf+0K38jPEP16sEzwTECoPg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIrcsWpibT/6rBPKGhTn6xOnEWM/atb8o6T0Fp/RtG/d0Upu47r
	l24ZjhQ87PxUAZzf6aaJP/aUs5we3tCtepz6k/SSBsHZQhhOTYHKDrSA18SzqxuKpLyLfKU+WHl
	gJDaP95nvf9noLovKWurm5y4w3xBetfG4+HbsoQ/s67Cg9WG1mtcaftw=
X-Gm-Gg: AYBFou2aPKbPG+NlVRlkV/2q//VNYVDmyoIINXpOUhskfmT+ym/GrvIMPPxOLCH9fDt
	0C4u/7TW/2vJC/Ys/TF+jZjvBUq44OrqUn079mIy2O6CfEDgvPUiL2/jkYNDJvvVPTZvAmusqB5
	AJsrSRooghVTh33GZy8MuPlH/fMrWQQ0LiaHwGpcWtv2lXf5j9Xxc+qvG84wu/U2rVORrYqN2Jd
	2RWpZO6toKY9O72wQ0XZxcSm3aubgFXVrrwwMAkuxyb0GDetNBHovynDG/Ut27cV1S4rXJpQuqA
	/OhjInWsEtsClBuC2+2ihZBRwxHlStWVOd5EhaGkBF9AMoV/qCbi2/nwl4HSC+zvLukK3f+W/Pp
	0e34MMQzIF57Lg0mY8tnEWLfFBf48fFc=
X-Received: by 2002:a05:7300:6822:b0:35b:bb89:231e with SMTP id 5a478bee46e88-35bbb892336mr1842429eec.29.1791828754972;
        Mon, 12 Oct 2026 11:12:34 -0700 (PDT)
X-Received: by 2002:a05:7300:6822:b0:35b:bb89:231e with SMTP id 5a478bee46e88-35bbb892336mr1842396eec.29.1791828754450;
        Mon, 12 Oct 2026 11:12:34 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.115.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm40504487eec.3.2026.10.12.11.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:12:34 -0700 (PDT)
Message-ID: <1997618b-1350-4b67-9168-794be3e40683@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:42:28 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Qualcomm Sahara protocol enhancements
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
 <asu5x72z9-p0U8G0@debian>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <asu5x72z9-p0U8G0@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXxXJwPZE9pEQN
 stthO/eZ+X/YEupWtbOYauZnS+3717dejufFLCRpopMqSwAe5FTU6obdE0OUyCFw0eYexogxP4I
 9L8alLgoSixLw11w9IF4UUz5LpXOVyJIK6rINqAxgF/6nd6W0k/trVvOBF4zpjUQF0+8WGq7ewc
 +TfGiduMQwVRSTyPiDPAx/G+hbFGAAenCTv4klvACap3SSs+io39DaxeIJftxfcUc+MxFjo56mF
 BYmQFL779f3yoN9IOljMBUtqboc3x93e7Hvi/YJvPYwb2QuE3OdCzQIlv7FDCFgkHEUjPwGvMpL
 mvAg7llMpxnslJuqUtFIqJ4Uu50Q9tETRg4gTfVtsHA7UnpYDp8tFfsj20qTeQVRnLN94FMFVvS
 Bp2PR5FWrz4JzouRnje/zgcNWzQO8CkXvSF4ocN1NlS9X7UOXnHdgmIImsHla5MotfgJzT1Sg/p
 fDQOFbkMLiOD80EWxSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXw8J7dOIRvjsp
 m9gZxch0lfn1r4LJT45BgmHNzsOGmr4bIkwpDLKINXEDG/6CXN/mNyqxdWEzL6wcwO56jxPsDkd
 3+ml4+dbi9/67ZSJDFglW3w956166i8=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd2314 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=rMnsrh5NOwviKPWndHUBiA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YvxDvPKW4DV_tE5yJ3MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: A3v6TpLqLDYuWv_5OnGqTxAmi41dzsF1
X-Proofpoint-GUID: A3v6TpLqLDYuWv_5OnGqTxAmi41dzsF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072


On 10/11/2026 10:03 PM, Manivannan Sadhasivam wrote:
> On Thu, Oct 08, 2026 at 11:53:44AM +0530, Kishore Batta wrote:
>> Hi All,
>>
>> This series reworks the Sahara protocol driver to make it reusable for
>> multiple MHI based devices and adds support for capturing, restoring and
>> exposing DDR training data using the Sahara command mode.
>>
>> The Sahara protocol is transported over the MHI bus and is used by multiple
>> flashless devices to transfer firmware images, retrieve memory dumps and
>> exchange command mode data during early boot. However, the current
>> implementation lives under the QAIC accelerator driver and contains
>> device-specific assumptions that limit reuse.
>>
>> Some MHI devices (for example, QDU100) expose the sahara protocol directly
>> on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
>> data with the host. The existing driver does not bind to such devices and
>> ignores Sahara command mode packets, causing training data to be dropped.
>>
>> This series addresses these issues by relocating the Sahara driver to the
>> MHI subsystem, centralizing device specific configuration and adding command
>> mode handling for DDR training data.
>>
>> Overview of the changes in this series -
>> 1. Move Sahara under the MHI subsystem:
>>     a. Relocate the sahara protocol driver from QAIC accelerator tree to
>>        drivers/bus/mhi/host/clients directory.
>>     b. Register Sahara as an independent MHI protocol driver.
>>
>> 2. Generalize device matching and configuration
>>     a. Allow the driver to bind to devices exposing the protocol on a
>>        SAHARA MHI channel.
>>     b. Centralize firmware image table selection at probe time using a variant
>>        table, instead of scattered conditionals.
>>     c. Preserve existing behavior on AIC devices.
>>
>> 3. Add QDU100 firmware image table support
>>     a. Add a QDU100 image table and select it based on the matched MHI channel.
>>     b. No separate client driver or registration mechanism is required.
>>
>> 4. Add Sahara command mode support for DDR training.
>>     a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
>>     b. Query supported commands and retrieve DDR training data from the device.
>>     c. Allocate receive buffers based on the reported payload size and copy
>>        raw data from the MHI DL.
>>     d. Store training data in controller-scoped memory using devres so it
>>        survives sahara channel teardown.
>>
>> 5. Expose DDR training data to userspace
>>     a. Add a read-only binary sysfs attribute under the MHI controller device.
>>     b. The attribute reads directly from controller-scoped storage and remains
>>        available after the Sahara channel device is removed.
>>     c. Cleanup is handled automatically via device-managed resources.
>>
>> 6. Document the sysfs ABI
>>     a. Add ABI documentation describing the DDR training data sysfs node.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> Series fails to apply to mhi-next branch. Please rebase and resend. Since I'm
> about to send the PR for v7.4, this will miss the upcoming cycle. But I can
> queue it once v7.4-rc1 is released.
>
> - Mani


Sure Mani. I'll rebase the series onto the current mhi-next branch and 
resend it in v8 version.


