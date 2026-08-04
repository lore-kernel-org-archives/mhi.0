Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13D47D93C
	for <mhi@lists.linux.dev>; Tue,  4 Aug 2026 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862321; cv=none; b=Cm4t9Fc4EwqfIsAU67gwYFZkQ6jOOIEJmG9wzMCaK8/Thk3Ks+xAh4cNPJLzCCAWwg1/D+mtdWOzMq9NTQrVsEhyK1Mn8XyCJM1DowaQ7QmyWWZ04xD8nPuEt1eR5iIkLgb3RyQwr+CUDU/M26+ay/RBDd1GGPS79WO09dTTs6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862321; c=relaxed/simple;
	bh=+0iaAebDZTu2n9MNDfpOO8xO2Pql0lKsfUHfy+zph+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4RnISC11o0gUb+7sg3NnaeSSPxYpgvkOQNCIZDp/NyfvciJnc/Hz5FVSczvCG5fvGWYB6vE6SZz4VkaS2aKyAl97FMS4Ts3MzDorUGLtoh3pj8SFfOeem3n2tnvrr4bzbCjPOcYedyDk40TRJaOw/2EXNWz0Ll91j4QQI/b9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USmE76bp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFNN99LM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USmE76bp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFNN99LM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfqQ9071416
	for <mhi@lists.linux.dev>; Tue, 4 Aug 2026 16:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHenXeOrbWY/SXqKB8NPQYcUSj7j7mcQ5KUAGFCPsmY=; b=USmE76bpPNJK8Afy
	RPzOs/hbkq4Bu9+FeEHNf0bY9K7FOskdpOZXryrD6DSwvq9CTPY4el7gf/1gqtzc
	mkH95U5WJYCoNin3u4F1R17l1A6h1xJQ9Ic48LyuNLBA/8GDhs1JaOVuqnCkjtVF
	q5kLU6dAZACitTB6JjGFsrl0Z7Uzl5C9Is/YPJooXyOyjqsJXOFZw9ajT12Tcp1+
	15yK/NCWf1X2Zbh8r1zmdgL/bIikTlbRdrCqrERCPiWjcbSIGYjz6RNzpc7GWXow
	/LDMidhmjeImiWV6D4UskguKyUTQ4taYL+Q6tAA87jWvqYqaoLXtIO6C8Igh8pyF
	z2D+ig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fujwsgc44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 04 Aug 2026 16:51:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso949233a12.1
        for <mhi@lists.linux.dev>; Tue, 04 Aug 2026 09:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785862298; x=1786467098; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHenXeOrbWY/SXqKB8NPQYcUSj7j7mcQ5KUAGFCPsmY=;
        b=TFNN99LMcmN22ZyA7+E3JdLTYJtU23UKBPf6PLFgI1a42m+DKsW0nPxYSt+EbqUkm/
         NVJVOIfrQqIANw2zXf4FVyLRcV9Dd+wK+YkKCZAUHQd/By/2kOsJyVsKzTU0X9LOJ3Ir
         Xlm5LKmkozqyxfVceGv+e/Povm7K7KtDsk0nJdsK+XC6vTrZnfz8hoQpQKxag2esMsb3
         NijkRTLzScqyqrW9JbaSevHfFcN5gkeyef7iYdzUXPRDuJwZIjDkVRphfEQKPzNXwS5V
         twMJ2IRVhF4aR+HACex4P2lMcMvRFRZkCjRC1h0wseooTw/rO1sDtgSEBk+Q4UPT7YUm
         v+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785862298; x=1786467098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHenXeOrbWY/SXqKB8NPQYcUSj7j7mcQ5KUAGFCPsmY=;
        b=M3FMyD3iyPIy/1ws74cKNRLT8QXlvct5fG0CimbNcdvzVnvAXWYsBmFrNerQVG5naU
         KkYEV+2ooNHEPHAKRW8KQzEj3MRwijpaLbS3x0CoVx1tDUR6fJi8VWzhaOpIN6ZjoQ/P
         Eo0MXldPlQsDy/YDuRDuB+2rZvSlcO8xx1RNAJQU3Acq1s1U2BK9atNjBLKoDX3g3Wm3
         AYxwxmlyO2chcPlBckvMvVrr6Omj7cSazTOoUffgkPYqq1dlq1ryYWFljCcjrpOJ5ANW
         qDNFTFm4QJWUMfukfjsIpt+FugvxZnRefDHiEbFyhvXOGSa//38cYo4myBGHhl1ADyGv
         xfVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+dbNXDuwWDGrjzoQwvZoFtRZVTDLVmy5+XeHkEjHE4IqeEvKdbgmbtQGyk5EKn4r9E64=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIg+PfuqwsGQIFbDRfTD4gAglqsZsmrTWQEzHubEO2ebNMFeOi
	kN8vnB8onRL98Y0Zu4v6MK5DhT+wwI9es7AuCnUuz2zbmGN2rkeqqyG6v5tBp9Mu1b5Uie8ZgBR
	4assjw0X7rMYRshS+W+JMHqRdgHdxqfFLesQBR6ninWuEl4gB+h54hBQ=
X-Gm-Gg: AR+sD11+3NAjHy+xsi8mJgSDwZm2SBzbVTUnXcFzFYzzLnDvj3UaAyTGD1wOaiWMcUk
	UREcmkF/JjRebABxC6GSoIvkXiiIJ3SFOzJz0il332DXwsstr8J3RjSyI2DZLNi4sOE3KDDv6m0
	9CVYHskEReSXm9M9BaG3UC2TIF3E6UHGkkJL6QAz2RPW2fpNr/IttZDSuhGmGRUxRbnVXOV9k/O
	PxQLQb7gIaENYJGroru84RYMNGXwrlYnDWWaBWSiNPe/LjM0+52sLkeS0nQTTt7O3yDHrJHpKGI
	17WsmaX0miQ+OcrSUoPlM6idyk7siVBF4JzIWX4FSr7SZJWD/XSzQwoIekj7z103yLThR075HJw
	KMIfG0kzXS1oq44hG3eK3/z1yKE8MOnjuUYvIEbSUJ8DeXXddc4V5Ow==
X-Received: by 2002:a05:6a21:138e:b0:3b5:530d:d96d with SMTP id adf61e73a8af0-3cb859365b6mr531274637.12.1785862298425;
        Tue, 04 Aug 2026 09:51:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:138e:b0:3b5:530d:d96d with SMTP id adf61e73a8af0-3cb859365b6mr531229637.12.1785862297948;
        Tue, 04 Aug 2026 09:51:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50ad27sm4971328c88.2.2026.08.04.09.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 09:51:37 -0700 (PDT)
Message-ID: <3ce8f794-3582-4d69-8b7d-1f7c10689a0b@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 10:51:35 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
 <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
 <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
 <6e2fda2f-ce14-4f81-b848-9fee4e6a221a@oss.qualcomm.com>
 <jmyr2afsiqml7pkz6jcty6gsgq6kchfkwebj4dkqtkutd2zafk@iifzpmhngrrf>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <jmyr2afsiqml7pkz6jcty6gsgq6kchfkwebj4dkqtkutd2zafk@iifzpmhngrrf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g102YU7Qx2Hllm_t3OQTGDZDHr6kcXas
X-Proofpoint-ORIG-GUID: g102YU7Qx2Hllm_t3OQTGDZDHr6kcXas
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEzNiBTYWx0ZWRfX0nMG4TP3YlTI
 FziG8qiN+DfRtHacgEa2CyHqjNIGGchcZqtIpveTNZoxFDwp5e/ejpjJV4GIVpWTdgjvpc9m38D
 wiWGLQ1d8CiEieEqLhLVfRqAR8dMDH0=
X-Authority-Analysis: v=2.4 cv=Lu6iDHdc c=1 sm=1 tr=0 ts=6a72189b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ZXrcf1LaNO3NQIdrEiYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEzNiBTYWx0ZWRfXxLTXdkHIqGLu
 PKaUItLBI9EZJttd6LZ4wxup1oq6UQPGGnXew+zTEQ8HHKs6WWcTmwSiFSFq8sQpjS+Gf1ge/A0
 v+0bXCwfpI9mz+kqWHuoaqKot/wVqd+F8Jg8mrUn1JfBFVm48ZthDNjFM7Q5/Z1aOC8xjrVVkI7
 gm3YUxThku3Jj9au2lvhNhaDNQK0chMb4v99+gxoegK71bNwQk9cwM8DBFQt77wD4fIMr/h2/6r
 Yie85Gic/DqTqku/aBFKVmQ5a0W19P1U7VzvF8d7Y/W1vIg/Weqo9tNEkSBRDkE0DtNWfCOtu0I
 S2FkOHn53NP7t4CP+xIqSUxRluT+P+WRpBEBv+HwpTeUrkFz9rMEey6EsJRieg3zqCipiQOF7Bv
 yvL/RaJh7ppTcgX89MtXcb9YuD8MgYX1Xn566EggBj0QkStRS5hOq5+4aHU94yW6Ui3l074B5mX
 DczDYAcxeozxlDAjR8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040136

On 8/3/2026 10:57 AM, Manivannan Sadhasivam wrote:
> On Mon, Aug 03, 2026 at 09:57:47AM -0600, Jeff Hugo wrote:
>> On 7/29/2026 11:19 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 29, 2026 at 03:07:00PM -0600, Jeff Hugo wrote:
>>>> On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
>>>>> mhi_soc_reset() tries to reset the device by writing to the
>>>>> MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
>>>>> that the write gets flushed to the device before returning to the caller.
>>>>>
>>>>> This may lead to the delay (if implemented) on the caller to be
>>>>> insufficient, if the posted write doesn't reach the device before the
>>>>> delay.
>>>>
>>>> Interesting.  Is the delay tight enough that a few ms will possibly blow it?
>>>> Seems like a poorly defined delay.  All the devices I'm familiar with take
>>>> multiple seconds to boot (with some variability due to ddr training and
>>>> thermal constraints), and if the reset triggers a crash dump, then its
>>>> easily tens of seconds.
>>>>
>>>
>>> Which delay you are referring to? RDDM delay which is just 2ms? Yeah, that seems
>>> questionable. But this function itself doesn't implement any delay. So your
>>> comment was somewhat confusing.
>>
>> The delay at the caller of the API referenced by the commit text - "This may
>> lead to the delay on the caller to be insufficient"
>>
>> I looked at the thread referenced by this patch via the closes tag, and
>> while I can follow the virtualization flow, I didn't get a good view on the
>> specifics.
>>
>>>> Regardless, since this reset will either kill the pcie link, or disconnect
>>>> the SoC from the link for a time,
>>>
>>> No, this will not reset the PCIe link AFAIK. PERST separation logic available in
>>> the Endpoint should make sure the PCIe link is active while the SoC is
>>> undergoing the reset. Otherwise, if the host tries to access the device config
>>> space before the device is ready, it will blow up.
>>
>> Reset separation (PERST separation is one part of) is not always enabled.
>> PBL won't enable it as it requires loading the reset sequences to the PMIC,
>> which is outside the scope of ROM.  So, if you have a non-flash boot device,
>> or a flash boot device that has a non-provisioned/otherwise corrupt flash,
>> the EP may be sitting in PBL from cold boot without reset separation
>> enabled.  If the EP is then passed to a VM per the related thread, a reset
>> will occur, which will take the link down.
>>
>> Also, if I recall correctly, automotive products do not enable reset
>> separation at all for ASIL reasons.
>>
> 
> Ok, I was not aware of these scenarios.
> 
>> If the link is down, the upstream component of the EP should complete the
>> read with an error, not cause the host to blow up.
> 
> If the PCIe link is down and if the host tries to read the Endpoint config
> space or BAR, most of the PCIe RC integrations in ARM64 platforms return AXI
> error instead of the typical 'all-one' response and that causes 'Synchronous
> Abort' on the host. And that's what I meant as 'blow up' as it will crash the
> host kernel.

This feels like a PCIe spec violation, or at-least undesired behavior 
from the user perspective.  Maybe a DoS attack vector?  I assume you are 
specifically talking about Qualcomm MSM Arm64 platforms, and not the 
entire Arm64 ecosystem?  I don't recall seeing this in the Arm64 server 
space.

Do we need to talk to Joe about this?

> Anyhow, the motivation of this patch is to ensure that the posted write gets
> flashed to the device before the delay. But I'm not sure on how one should
> address the concern you raised on waiting till the Endpoint reboots.

Sadly I think the user implementing the delay will need to be aware of 
the specific device they are using, and the likely required delay to 
account for the various scenarios that device implements.  I don't think 
we really have the infrastructure to make this universal, and if we did, 
I'm not sure a blanket "all MHI devices reboot in X time" is going to 
work in the long term.
