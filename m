Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594678F3A
	for <mhi@lists.linux.dev>; Thu,  7 Aug 2025 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554550; cv=none; b=tOc9c/ddoEjhrjlqJrZWhYsWbJsjn9j4v5RehXqhjFGOO6G4yF/3tpczvmyN0BUwM0VhiMDbY1GgnM8NNt31SiagaqBjj/NX8lQ8lymiiMMHG0sTTX4EyGkEYgF46aAEJwtKFJk/luNj7JkpvKEwDIVziP+SWrZyopTiGgjXAk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554550; c=relaxed/simple;
	bh=r7B6Q+7VnOlSFD9dmRU69c6xXNsKJZl6lpeNkdeAlW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMWrqia+xWObDSdRsn+aNc+u1ZpSJDQ/61qL4XlJEiPPhqb0cGRxbyKbFQ4nKISMow29jWhyBu5qrbbtpUowlTeN8dFnvKf0+cdnZbHuEN/iUphTzLJuu2Y0Rk4balFfLXQgOs5JDeoRMvjbcpvrQ5+ZYS0CbjOi/VfO2xEiN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zw0Hlf4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zw0Hlf4P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57724Rxo029756
	for <mhi@lists.linux.dev>; Thu, 7 Aug 2025 08:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FFkztz/vOpS42siZaTzrJaru4LZfNmwJ6q9DN41I/Q=; b=Zw0Hlf4PZ+FqrUk2
	meWkuRneDRHwocs9It4DIeEOTI0KAJIwAK3QcCnNNUaq3LaBzpVE4wIYeE9sdLJH
	HGQF2wv7yH20XDwoHYLAjuMDAzEBeHKTeEMlbJ75UUcI0pjrD0DExHbG2RvpDWVr
	XIZNyMJP89xuUgf+nSAHGqXmYMxZiLmRCXs8WEY8NoWq6IfD9MTGwCMLvFF6W2no
	DDn9ptcD4weuqS/fzSgx7uHQs/RPHM8holEp5JzkXVw6/s7DBOskZnBqI9sbnz/Q
	7ngqwm7mE0CT81iwMAjeFmABHKyC1/YK+Z5JywDJfuiXWGus50O1tYL3KKXiAux/
	ZC/5Bg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8dj3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 07 Aug 2025 08:15:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b427c287cdfso1272014a12.1
        for <mhi@lists.linux.dev>; Thu, 07 Aug 2025 01:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754554547; x=1755159347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8FFkztz/vOpS42siZaTzrJaru4LZfNmwJ6q9DN41I/Q=;
        b=ezFDV3pLC8h2UuU08BfoYWJsr7jvY6rPlEIovisS+QSjCLO4aD2h2BB2UkLcSYgD5S
         yvh0N/qLZs7ZyUaMuOu2nEggmgIUH/1QJRCqRkuPWi0+iJtJcBn003o/btCva80qMG54
         dW4rjndLqyzpO9BTnq07GOsmEEptd2Rf5cVPscFupXFxLFL+P2jn8xVhbvvULew9P5uy
         jQjg8YBOSjSJnb8XShBjhXhKq5bAyB02yigxs3YNKmCfDuLlq+gHpBb84nOJ/fO2iELp
         cx+has0wYvPT1afbxELmROFPJRfE3V2CG0yda0IdQLqIB/QAZJ1NgMj7opuQ3Nb9V9bM
         giJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRMK+UAKySLFX6wN7n2xuFAob6esf6nzZLBd2I2vCnbslfkXmar1izIz94r9g6VWRdN2A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywut1KyUqE5uZmC2Q2aSHJk9NNA/aexE98MYx2HWZ1uWi6zeAiA
	j9w3of6gM5xGjkt4Cd+j6unvc0dY6OafWxISEkq1A85egJfS9jCn9Cf2Riz/5OggckVyHhiVRY5
	iyrCiYvT8ggAX21NlVXzWrYJuiC2VcUrNX1BnHzDa2Nl5BNZSTzjnGDc=
X-Gm-Gg: ASbGncvyRbvVoDosRdP9BYlCsPVySzeuQR9Jh1ykNNZzQ1JoDb1ULfK7lC6tjnM9lFO
	/FZxcaD32e+DLwgBwxHsFT6yF9A9p5rEJHmdewd1oIOpHueVlmsrHNLUVNqkVfPFhQzCR7GQC0l
	HC9XZuZSzcaNkZtjhgWYNpw60m9VrJ+Z3Ed20p7tzpohRDywaSN3TxVdafNq7C83fpzfCKzhNAX
	A+QKEzdlASnukx7mYsN20VcZgYoU51OzPlxHgBLJl+PKQ/5OlMXnMKLbumnn8UJGymgnitlzv2q
	5GsRsaJxvCjOzc7e+ooXJ+RgqTVYbapgEDg5tvlzY7ey/EvUDtQtp57vxVSyi/ZO3iyTJydgZw=
	=
X-Received: by 2002:a17:903:189:b0:240:3d07:9ea4 with SMTP id d9443c01a7336-242a0a91131mr91223185ad.7.1754554547099;
        Thu, 07 Aug 2025 01:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzSnmBX83MC5kqRMV7W1QAuTOZBWwPl92I78BofL/XeVsXz8pCRHuSkr0ugBp8auFgWzSvVA==
X-Received: by 2002:a17:903:189:b0:240:3d07:9ea4 with SMTP id d9443c01a7336-242a0a91131mr91222775ad.7.1754554546546;
        Thu, 07 Aug 2025 01:15:46 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef65d2sm178661625ad.31.2025.08.07.01.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 01:15:46 -0700 (PDT)
Message-ID: <7118392a-2a19-44a4-97c0-d5e8a3190c08@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:45:42 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vivek.Pernamitta@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-2-4bd862b822e8@quicinc.com>
 <luaoyvwqp3fpvqgybhstnnrutn46ry3tyfxw2launvnxzfvyqo@pdfdpfocfq6k>
 <1c79cda0-2645-4f88-a05f-9082e305fad4@oss.qualcomm.com>
 <tynmkh4isrbi473zh6t4kd5bswrthxy3garhgpzafq6n2wrmqk@rfanfjgciyqv>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tynmkh4isrbi473zh6t4kd5bswrthxy3garhgpzafq6n2wrmqk@rfanfjgciyqv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: biQX5k26RUhaA3Nrh4wZvwI9kX8G7UQf
X-Proofpoint-ORIG-GUID: biQX5k26RUhaA3Nrh4wZvwI9kX8G7UQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1lSXJ6FfjaOD
 EeE08GaLSWgvVARZAfoOCr+rAcGaXMOKesWThBjNeZfZ8KT9LSk870qkGGrsdrOGyxa8w3ffvRA
 buce05vDY1ImF+BRonlgfzPN0Ckpt5zgZsFT64SHHPuXsDt83ixrAdLfP7cCZl59f/PF6CrZRZn
 Gn6qXutxgm0i13QBXpHOM0YzWqUEXWL3Pzk3VprSDlifmE2ho34bT7QwrIdYaT0JK8AsIaOdZCo
 0eJNWVRRLsGuyuoEUDVvTgF+6Ph1PTpyZnqR1sT0su6WPqXPsur4s9vfVvrG/M8NtZ44OOhyfWH
 WVK3w0Xpc1Ik9Xa3/AenXRnNDrizvoMamq7Xa+ILMXOOlK0ujYAAvpvauTy9kZaJT+9oeUUdCgA
 7DZy0iw1
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689460b4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=uIgEQj9WjdynuVTCvEgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/7/2025 1:43 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 07, 2025 at 12:39:26PM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 8/6/2025 10:29 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 10, 2025 at 02:28:33PM GMT, Vivek.Pernamitta@quicinc.com wrote:
>>>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>>
>>>> In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
>>>> when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
>>>> SUBSYSTEM_VENDOR_ID to check if the device is active.
>>>>
>>>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bus/mhi/host/pci_generic.c | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>>>> index 7d0ac1c34ddf95ace2a85e5f08884f51604d9b0f..4bafe93b56c54e2b091786e7fcd68a36c8247b8e 100644
>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>> @@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>>>>    	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>>>>    	u16 vendor = 0;
>>>> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
>>>> -		return false;
>>>> +	if (pdev->is_virtfn)
>>>> +		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
>>>> +	else
>>>> +		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
>>>
>>> You should not read the sub Vendor ID for VF. PCIe spec suggests reading the PF
>>> Vendor ID for VF. So you should just use pci_physfn() API as below:
>>>
>>> 	pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor);
>>>
>>> This will work for both PF and VF.
>>>
>> This will defeat the purpose of having health check monitor for VF,
>> as we are always reading PF vendor ID and will not know VF status at all.
> 
> Do we really have a usecase to perform health check for VFs? Health check is
> supposed to happen for devices that can fail abruptly.
> 
yeah as VF is not a physical link we can disable health check monitor
for VF's in the probe itself.

- Krishna Chaitanya.
> - Mani
> 
