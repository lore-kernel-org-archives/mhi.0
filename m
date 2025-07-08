Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB412DD5EF
	for <mhi@lists.linux.dev>; Tue,  8 Jul 2025 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995097; cv=none; b=lO8jY0tEZaoHVYoR8+Ah1PVHFCgjMAihfppX9E6US7v1wp7EiuVKxydCQoWq60tV+wLT4RaW6vHVY6kYJh31qT88zO7y1Nk8CwtMeM5yTKDMIc7t6L4L+4nNilI+oZX2iHfpVKktu4UGaIO8PgT8s0QqXgvIhLnPXe01gzEN+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995097; c=relaxed/simple;
	bh=ZxqmAlpZPE4GpQlH6qTfsRIina0dFeRDlh/OyTnSWOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMiu6ZAY15mIR6kHe1jET7OgVwmUNVMVPW0CbX7m/WXbjyU0C4CtA+CIavy/6jg+DaaMJrcwudKtupR1Ui0CerQqeAU5rfXmj0LYuReqLjhG1POcQJ6RZDWaMBeWy8twD4P7Ps4tuKTOGZwqXxSDpw0Wu8ZpJ6xGnTbUnLdtEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU1hhUqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU1hhUqs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAPuW001254
	for <mhi@lists.linux.dev>; Tue, 8 Jul 2025 17:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNZbdhmlFQUxsHOHqhI2G9n2d5YtMKeChku3vZES8/s=; b=pU1hhUqsEsRfw6Pl
	eXbAEK2TMtc24QjH1fXnAekI/mSVZ+JM4sI7Ct8zyOwf44/MQiFVUr7soTjtVupl
	4y/DcjkhSuElAsPKdKcUbn30J294VrCd/Ma70XBsOcLxoXftczLPNxy5Yqi9kZQn
	UzIBM1DVcOXR0tm2OM6fDzf/+pqzUwdgCMnfo1zPTB0RwrX93KqYPLhF1yKEIhM9
	H/kIvc8b6ybi2qzjCtUQZ5LROfV1nYitLLnVbcyZNTJ5Cr34KBXT2fZbMe5MIcEH
	iV/wVlyreAjC0PtDaDzKyxPp8VuKcrwcUQ+f+X/kdbqTZdUXAcNgw4Vy44DsrLZb
	TzHj+g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdr0vp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Jul 2025 17:18:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b38fc4d8dbaso3812411a12.2
        for <mhi@lists.linux.dev>; Tue, 08 Jul 2025 10:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995093; x=1752599893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNZbdhmlFQUxsHOHqhI2G9n2d5YtMKeChku3vZES8/s=;
        b=JfdSFG7RwS/o3EM1o380ZbpUDSViV+khZytg18fs1pmNOyseqB9NJS0sRq/7Ur03nz
         GaUAOOoH7lIwXJG1LPHD5ppAXaBxDslti+LNS6sxBNLBUhlgDyXn/C1hwK1KSz7CmnHL
         YnJB9TIrNZNWw4JFz0z/INrw8sN0NTRDMMDniKFBypWAaWEcEW7z4lmPMroTY9oEsfYt
         jjW0RsiXV1U2uk077UPUOKfY5pnAGu2BdPU6spSA/NSsVRhDTF3QxKhJNq5zXNwOdg2c
         t7puuVN2Se+QkMue4Fwsd4luzJwp6h+pHAjEJDuEOwQssWLus5cfSZJB/YjIbsZC06jW
         gddw==
X-Forwarded-Encrypted: i=1; AJvYcCUCEruZgC5tmLk+pXgwjddwwks0se/HoBL2COeKXhhVJmK6wyJOYwk+ZGH7lI62QEAk6os=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYKVsOm1uflfJAGqk8QGIGboPng00VZaOYqRue32Tqz2ecgfSv
	YK4OfvsEaQDkMbH5bz7HQzTKUSD5hrgeLXXjLda900QqXiW3f4075dI23/E92btwqSeU5ckJUEe
	M3wnDih7arTTQBnvZIhB3yWzE5tFAaSkupogUcwuEPsBGBCiSd7cVzAY=
X-Gm-Gg: ASbGncv3aufyiziAug7JqFO6Dc1OAxbcOpLJANdVsvPeuAvHraHkYbjnjNG57v44D9G
	ih2k+PN9D+dQRHyHRgR2qDy4XBxtY+tC1J4ehoT8ehW4ahSeKy3CM5m2CLPjreJDjh3lCFFHsmY
	l19Cipd8uZ5UqvP46AfBLyW5BBYv67PBgkXvXu6cXasxZzovaE56y0stz7xSyrWja7jVejywJws
	z/yUDHcJYkN0+KKY3h9IwtjPHbqmQNzgfyoT21+2I+61J5RYYrgy7UUSS8K6mnqrpUhuJ33PGs9
	SsayFA8cnTonhxvgvPew4vnzZSX/YFf8pEbVs4tXvgYdxU160HrC3JgQGO9G2jSLFur8PMSl
X-Received: by 2002:a05:6a20:729f:b0:201:85f4:ade6 with SMTP id adf61e73a8af0-2260c2401famr25701533637.27.1751995092808;
        Tue, 08 Jul 2025 10:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHongpWNESLAVgwtBOry820wNxr3RL8aa+ojutFfz5Zh1wSOxaKFJlRS8eGzSYgs83bpWs4mg==
X-Received: by 2002:a05:6a20:729f:b0:201:85f4:ade6 with SMTP id adf61e73a8af0-2260c2401famr25701499637.27.1751995092278;
        Tue, 08 Jul 2025 10:18:12 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62c615sm11869772a12.60.2025.07.08.10.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 10:18:11 -0700 (PDT)
Message-ID: <a3e2a410-76b0-458a-9b9a-ba8f91283346@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 11:18:10 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
To: Manivannan Sadhasivam <mani@kernel.org>,
        Youssef Samir <quic_yabdulra@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
 <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
 <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>
 <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686d52d6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Wp3K0ks6gaFnrRQnQwIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: MlckQt6l8NYJWx1J4gnYuP25z-NWNFwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0NSBTYWx0ZWRfX65w2eBvjmuC5
 PcCHPF8Oj2nwFyABPlqUeoo8yqyaw4bcdbpBZhqERtp+CPMfN9iMcOsQTWlHzK4Uf6Fbi9Nw8M3
 5pQYK1nMhxeIbgeIlzSVehES4GcpsgHGYzyMHnCHdrF7O2M2gX4uE12GGYQozLDsPk8YmxlXE1d
 +8nZ6iYk5EDgrg9lWkiw2DPGBUmK+aXMAdb4HyCX5M0hggbijimLEsKlgKnjziBrjlzTqS0R/iO
 SmqS69XXvtL1X20nfAhWRPX+6ZJ/+XbsMBJQlEXJ6YUqw3ESfe677nDh6QsDHZj6is1hzoghP6U
 WEXDYw5WV6y/9C/+X0bah4GyIgyKk44u98V+0lYZ9iIY25jd55UvM2TjcxH1XgYHrA3EriAQrCD
 X8jt0l1spNPkobllMI3ddvjgHEDi4W52HjDuQTo1eM7SgNoTR+JROHPfkFKeYQR2Y1R4uMkC
X-Proofpoint-GUID: MlckQt6l8NYJWx1J4gnYuP25z-NWNFwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080145

On 7/8/2025 7:26 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 02, 2025 at 04:06:55PM GMT, Youssef Samir wrote:
>>
>>
>> On 6/17/2025 11:24 AM, Manivannan Sadhasivam wrote:
>>> On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
>>>> When a remote device sends a completion event to the host, it contains a
>>>> pointer to the consumed TRE. The host uses this pointer to process all of
>>>> the TREs between it and the host's local copy of the ring's read pointer.
>>>> This works when processing completion for chained transactions, but can
>>>> lead to nasty results if the device sends an event for a single-element
>>>> transaction with a read pointer that is multiple elements ahead of the
>>>> host's read pointer.
>>>>
>>>
>>> How can this happen? I cannot relate this with the scenario mentioned below.
>>>
>>>> For instance, if the host accesses an event ring while the device is
>>>> updating it, the pointer inside of the event might still point to an old
>>>> TRE.
>>>
>>> I cannot interpret this, sorry. The host is supposed to access the ring elements
>>> till the RP. Even if the device updates the RP while host is processing the TREs,
>>> it should not cause any issues for the host which only sees the used ring
>>> elements.
>>>
>>> Maybe I'm missing something?
>>
>> Hi Mani,
>>
>> This is related to the behavior that 'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'
>> aimed to fix from the endpoint. The scenario I observed with a device using drivers/bus/mhi/ep/
>> involved the device sending an MSI to host for an event that hasn't had its data
>> completely updated. the event could be pointing to a TRE that is not local_rp + 1.
>> As you mentioned, the host will process all the TREs until the event's rp,
>> which allows it to access data that were freed or hasn't been written to yet.
>>
> 
> So you are saying that mhi_ep_ring_add_element() didn't update the ring pointer
> before triggering MSI? If that's the case, we should add a barrier to make sure
> that the RP is updated before raising MSI. Though, I thought that the implicit
> barrier offered by the mutex_unlock() would be enough to make sure that the RP
> is updated before triggering MSI.

No, we are saying that an ep without 'commit 6f18d174b73d ("bus: mhi: 
ep: Update read pointer only after buffer is written")' can cause the 
host to crash because the host is trusting the ep, when it shouldn't be. 
  This patch hardens the host by removing that trust and checking that 
the ep didn't do something invalid (to the extend that we can detect 
invalid behavior).

The ep updated the ring pointer before it updated the ring contents. 
Therefore there is a window where the host can see the updated ring 
pointer, but the ring contents won't be updated therefore the host sees 
stale data.  This is identical to the scenario where the ep updates the 
ring contents with invalid data (maybe a FW bug), and then updates the 
ring pointer.  This proposed patch catches both issues and avoids the 
host consuming the invalid data.

-Jeff
