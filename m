Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B731716D
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439943; cv=none; b=N4ReXUB4Karek4yx5/bBVvjOXsi+au3WEAFvSxXDxSV7GEt4k7ifyeSrAzrS/xAk3Ue6IABDk1gBGlxNVeVh7l/bssszqqDUoZLFMqEa4H4CU2oNUVU2ao5nWNE9ijUg/TrBf7XkJ8YDX/M4F2a/qLV8/DcF32IvVUoJJcR24zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439943; c=relaxed/simple;
	bh=j/KDA/fKy8xM9BodrXOY4A3YfMh6Tmd8iHDMZBRj+kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWPQhRsCNr+8oajF6EnC9f6uwq4TOb3tWA8G2p5fabTBkeaLuNrRsoDAoOpmzJ9cnN6HIJIVPgMWxpyek7YsG+Mydya+pwgIKsR6Rl038Z4/83zGgs06q/a1znvCo0Pm0F5ldanpyDBo2E0YlNxcS2CwxIl1ZKdq0tw/Eb9TivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1eCv3Pz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hckBpCDd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1eCv3Pz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hckBpCDd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTvk928468
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wT8kLCkAimLo6XtCMpVmTv8XBbuyjKCgfUPaBP9qFk0=; b=D1eCv3Pz/KiR4aJz
	ljFOxnwpD8ujjVEFmRhkMJJOVDMH2uesmmXaawHFNW1/QHCxRkiZbUfEku2jWqIL
	HYNt9ls1BrNYbV3iTREvMKmVnu/mZcZBvWze0zeNH8aVCoA9F4DZPgVWmqY+p1Lh
	6O9zF1Rpg+ivD0qZUCRznZZ0XReBLHENbOW5qQLKUz4Ezn920uPvIGxnTQaVRgFM
	ApM6DoUg0nozIkENTWxeH60GnNRoDenO/vn8Z9wyHIecSAlBYthJlZtXmakNAEPE
	WFJgZLf2woO+yvTdV9qEdCzy3mwqmkkRSd57KVmk6lKyMlDFyYdIkP3LLE3Xq5WV
	c9nvrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sd9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:12:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a813204f87so3448173a91.3
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439941; x=1792044741; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wT8kLCkAimLo6XtCMpVmTv8XBbuyjKCgfUPaBP9qFk0=;
        b=hckBpCDdUsB7ELbMQcZHj2cUjDI2P3QEF83g2cJKvz8IyTF1mUhbL4IOrC7F6M30sx
         8mDFm3Y/YLdrAMbyF6FU6r0VW4DF9q9FfYWr6sFI+NU9ldmLZqZAhbK9To8FTHN8/fdc
         1ghmdET2nGymNcjS3/koUuAHzs2+rKwVDMaXNgdZQV3bLjzumWlkMQ8L6hkILJOGloxg
         W7H6ptflhIqaINGl7eUJ1tis4K0EwKU5NSVIclukyoh4Eh5Ao5hWFfoZLjnBeKeEhamV
         uNv3y/vcQc2ZBieK5nyKnFupYr0uWy6EXw6bs2XmViTOw4LBujShMTp/CnWC4d1nv41p
         l3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439941; x=1792044741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wT8kLCkAimLo6XtCMpVmTv8XBbuyjKCgfUPaBP9qFk0=;
        b=BAHfQGHRprfHZ/uvOToX2d4ny4DBdy8xvvH6YuSSV/J7Gfd/2TIlmv7uilPidy/Hmq
         SUzNodfMr/PqmY3qpzDPFMfANZx1TQpXX9PYTUm8sUM7ptwsPzojKZ7cI/h7LhLE09rB
         qLzk/M92v7v+HsJzWUhQtSLwGmRd8PI+XH/e3N1+qcZWfe3VoQ7I9l/IENDXelG8+EtS
         Z5Utv0Ms/7fJtmr6BMtyxwrgxs7M+yPhRMxS3pp4VTodUnJZcjwHJdtC/LLIWag5bt1b
         PC98WGoW122MaD5R2oJP7DlXM0Q6VCDo9X0xyRlaB1ZN9eH7339vV/52heJ6xVhzXHrp
         XPOg==
X-Forwarded-Encrypted: i=1; AKwUvBzjAoL4MHAhJKbAjcXQhcqQi4DBYEDsvVfAxFgngoLqxV06+g1n2Ubaae9VZfT56olS/JA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLRKZnSQzzWC2E5ROJAn96wtTG0cJwQzqsxu/IHR7fHMzKic7p4
	sFGc2mMKkxIHTBUN/Rh+seFjMiRQ5nQrbYkIWzrbKxC9/8PxMpZSYUDrifUcYjiz7QpaF1zFEKu
	F5EYCbCWYpV7ZkXhbfSfgGQE8vi/KAYarMRo5gZd+TX1MC2mNWDARjUk=
X-Gm-Gg: AYBFou3O2jciMfem6tBv1pJir7TSicdyx0gO4txfv1tib/+xigYAigKFLVKtyUQOl/K
	krSOE14A0ktRw/Af6gUo6PdjNvydAeAEK7xjoPCwYc55oAMzaRPfcHq0p4BfSqwgkPKvbfvNeix
	C1OfajvKJ214DDrDD3/eBtcWl1Uz8nc5CBjRLeLinM7TLXEzpgiuQlg4jgpAN7dra8CXESg+ig5
	I6s09tttg17aAaiJdbfn2/jrto8OkSQ0F1SQPaYzWkvOApl1pjQSnHWfTubV+/6bjOqVYYnfkRh
	pRDY5KAhYpmehCerANuqfhfiAkcyRQq9RVrXA2HjPJv75fR8Up0BjTji3O/amx2jV6CJ2LJODQz
	0QLuAiiPaexUpDWlMveSOhV3qwBxAUKk=
X-Received: by 2002:a17:90b:534c:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a8a1964d47mr3525628a91.23.1791439941072;
        Wed, 07 Oct 2026 23:12:21 -0700 (PDT)
X-Received: by 2002:a17:90b:534c:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a8a1964d47mr3525609a91.23.1791439940636;
        Wed, 07 Oct 2026 23:12:20 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm3393121a91.12.2026.10.07.23.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:20 -0700 (PDT)
Message-ID: <7127ab66-7413-4f54-837d-b773b75026e9@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:42:15 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
 <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
 <fb34c262-5c91-4beb-a792-f00da203d1b6@oss.qualcomm.com>
 <wkuia7mvgcwtemuib4abzjffrceekzheuyksqdzrykusxzvgxe@77ggixknltoc>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <wkuia7mvgcwtemuib4abzjffrceekzheuyksqdzrykusxzvgxe@77ggixknltoc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX2bcbl4Lz8OjH
 vMrQfRZDbLO/JFP17pdA+ZSo6jNQJXD4un+NiFIhEt74/MMq5i0Kud+naXEBrTFFJfKRQKXRkqf
 Tni1yNDPdCOjZRuABxn+Mn9fS4l57UU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXyrJ4DZOuahv+
 CIpYiBll/E5K0tB7oOop2PUCGMRTV2c0srGqi7wzLl0KO/sjtGJ3QW34JLC56uE8xQV9z04jwif
 oNzKTYqnx8DwDs8GQROHT2ekq8fhWbxoc1wrn+CjWmbCzqMKruCwW7BtPJgYKRWB+MKFAnoLXkx
 qBdU/Io6LYtAhy55ISKnq/EOUVPomYLt987iaahtsKSaJM4vYCQyCFTlAXaceEepvCB/iF0nUTD
 VMBX3cMYdXMMAESEvVTA6NPjJM/wSHrzIdu4ox0WbE4LSESPWlfyLinFjIJ0oyDSLUDoVJCQTgQ
 6xk10qCHedsrZL6iuuGITmuLlVbX4PyAnFomjdAW8K5rHuB/OJkHzbCVZaN1Zzu0vS3o6DAVeKW
 3/KnjKDQLvYAjKVnV7ztP5F+NQHjSs6FuBNZtS4eVR+Him5GUsUy8mvqip5jEgbXONeBPN2OZgD
 p6sCtqt9Bm/XQPHKfDg==
X-Proofpoint-ORIG-GUID: 40KB8p3f6yyENYAKZEIxPpR_1oVaK94M
X-Proofpoint-GUID: 40KB8p3f6yyENYAKZEIxPpR_1oVaK94M
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73445 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=J_FEIbamH7nEwTU2i4QA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/13/2026 10:38 PM, Manivannan Sadhasivam wrote:
> On Mon, Jul 13, 2026 at 01:00:27PM +0530, Kishore Batta wrote:
>> On 7/9/2026 12:27 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
>>>> DDR training data captured during Sahara command mode needs to be
>>>> accessible to userspace so it can be persisted and reused on subsequent
>>>> boots. Currently, the training data is stored internally in the driver
>>>> but has no external visibility once the Sahara channel is torn down.
>>>>
>>>> Expose the captured DDR training data via a read-only binary sysfs
>>>> attribute on the MHI controller device:
>>>>
>>>> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
>>>>
>>>> The sysfs read callback serves data directly from controller scoped storage
>>>> and protects access with the controller training data lock. The attribute
>>>> lifetime is tied to the controller device via devres, allowing the data to
>>>> remain readable after Sahara channel teardown and ensuring automatic
>>>> cleanup when controller device is removed.
>>>>
>>> If this training data is RO, then what is the use of exposing it to userspace?
>>>
>>> - Mani
>> The userspace component will read this from sysfs and save it to a file
>> named mdmddr_0x<serial_no>.mbn.
>>
> You need to mention the exact file name for the read data.
>
> - Mani
The exact filename used by userspace is mdmddr0x<serial_no>.mbn. For 
example, for a device with serial number 0x12345678, userspace saves the 
data as mdmddr_0x12345678.mbn. The file is stored in the corresponding 
Sahara firmware directory. On the next boot, the driver first requests 
this serial number specific file and falls back to the default DDR 
training image if it is unavailable.
