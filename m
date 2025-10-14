Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A097E3090FD
	for <mhi@lists.linux.dev>; Tue, 14 Oct 2025 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436191; cv=none; b=RCrz+lKS0uuhcDQU+NlGJTRYqvmzImanInUjWdp0G92Wl1E/gdgl8PuoG9T+flNifFaQm014SwYSgXHJcsut74RRYxxbGiu0FO17uJXAoz8vSz4R7sQITX9H2fwnPRCmx7tl+g+Dxe4KcrDdLX2mUdZ8+43QxeKSt3xfQhdCkP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436191; c=relaxed/simple;
	bh=pN21Y/mlFy4wSxMkjNgxJeTfBPTXMlYf+2hBZ8yW5DE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cGHl+8rqPpyNSS7rmA27HYYVDadLnfr0nvwJY6uM4hyj6cAuREgqCFeGqMpFAUME6/FCG9tplTQFG7p6vnstHaZMq9ZwTxyIDo3iaOu5eVNJ5eujZxYkV1qlugf0CoJcL0xny7kwGorOEjtAM/PnTz1y0oq95dtBkeVITNvX+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogaP22rO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogaP22rO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87K0Y020052
	for <mhi@lists.linux.dev>; Tue, 14 Oct 2025 10:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpMjtNS2t8Qsmkv7Ge8cz+FmpPP0fXDLuqM5OfZKDac=; b=ogaP22rO7+NPhQxR
	TNl7vl3Pj0k9mStaduw0OP7EwFbB99CiJMY5tJHvo9wJn5ick554S/FbItxOVfxn
	I6vRFSdJXT5BQxOoI+E3dNWYMzk5X9DOPXsVCpUA3A6OMJFJ66REAGG7eTSIRJIy
	iqEYUBErCClc1I1VvNZ3CoSgRBFjf9wEOMbrnp2DCraUDfcR53paDA7hnG09R9Bz
	dnf3Ye+hUOy7nvl6IKY8hhMYEw01M3FfDKMJ/t4Mn87a3i+U7gTjtJ7oAv7dibsA
	tD587XVjtsHELsQm5XxaKXhiOhhhDq1wGn3Z03iif7KJ05RTFOZNSxrSPJXJk97q
	fkEvtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c007f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Oct 2025 10:03:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2907948c307so20023365ad.0
        for <mhi@lists.linux.dev>; Tue, 14 Oct 2025 03:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436188; x=1761040988;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpMjtNS2t8Qsmkv7Ge8cz+FmpPP0fXDLuqM5OfZKDac=;
        b=Ntn8k1Fxowh7kElhHoo/rVx5BOIvIVfNWzJ5GwITeYjFnGPwBPMOX2Y8uHpTKEQ95h
         gNVzo6f/86sA4EDg9iyfT/aeu2JLJjAqJOMfuDYHzIg4DKqzCfHgTeNFA/1fAQJ5jb/k
         CURA2TIiEcZvzJff2lV6qkybfQgDQQxGxTlOjJLyHGNlt3coaq9nLH583qu/KSEvOYub
         mzHd30W2tw9oOwOrKoDnWd/TKM59iOEhOZ7TdPJpWtYguNsxMVmwpcRYE+AFOrFFI83p
         kXT8ZvLulZL/JZuII4dBx7639j0ldyXShIX9RilDdBhbuZYGFThIruTcv8HbiDVk4Ett
         ylPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3pndWKM161VrfkqfXiLfousYgxuOuTAbfks7ZqCNHyerWj+QE3V2xRPfiRGmVreXuV0U=@lists.linux.dev
X-Gm-Message-State: AOJu0YysgPPORN7G/+jq77HlurQFHcmpj2BdI3j2NHqEk1mcnWT4HfrR
	sNxd8Q/fhNE41WSUKSYxYYTO/PvsPfQpvDtlQOiX66UK9gd4ySpvvhGQfHlS9pVrBMxrJ80sUlq
	JB3TCwvNDAaZwkYNGBrRZEt15PVMHhFf24UsaMrIRHKOysz022zqoFE4=
X-Gm-Gg: ASbGncs9F+koA28fqKEVxQQx5S1dTycPjMBgy1HcY3NVfjdL1enfX3tYJ7Es0aKbxRj
	0533vY0d8Ir91S0m34FDWlsATKHTTNOMnOnbDvTR8YIuS8U+SYKENRpkBG9EMHxnqumMZlgzSVH
	UsJ5T0mH6JqeoTvEKFfoP/O6rQihn37++VaOz1jCHa5oO7cAx36cWPfagAxPrvr8eSj19eTQESF
	tzSUX98L35PcIL4bjnULK5SMRvGo1kN53MX0tMp07NjFQydGRqNWY/SVXd7qUjRKzx41VWi9lFD
	uEnQbw+zmaGT1uQdtPXlrPLX/Rp6OVeiimeX1jv2WtRx6X5Dg2jZT3dgOY4Nwob/rG8=
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr333722545ad.40.1760436187352;
        Tue, 14 Oct 2025 03:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaR4sHqbZzJquEl4UlTgUvAbfqjTkOISLr3MINnz0WCArr+8zC5qPyhZB1fBpUV5mZajByaA==
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr333722105ad.40.1760436186736;
        Tue, 14 Oct 2025 03:03:06 -0700 (PDT)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f87b23sm160005665ad.113.2025.10.14.03.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:03:06 -0700 (PDT)
Message-ID: <486d9339-c7c0-462a-97e2-92a243bbf200@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 15:32:42 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] bus: mhi: host: mhi_phc: Add support for PHC over MHI
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, taniya.das@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
 <20250818-tsc_time_sync-v1-5-2747710693ba@oss.qualcomm.com>
 <20250821180247.29d0f4b3@kernel.org>
 <0b950a45-21e5-4c8d-bc76-1c801b86e2ef@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0b950a45-21e5-4c8d-bc76-1c801b86e2ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -g-2YO1blgj2Ls9QfgwZEx9wYuBQvZ8L
X-Proofpoint-ORIG-GUID: -g-2YO1blgj2Ls9QfgwZEx9wYuBQvZ8L
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ee1fdc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=elLdLcMF98_VclgcXSwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX1vRDI3IkYx4u
 JIKKzl+p+9vxH7ypzyEA5ITVMIBNCXDmmM94w2YCUKc3TU0fCTCnKduuJnNwU3beqTrXmFnhCPV
 W1TnZ/d7RomJR5X9vuICQBxCrJthJPzmJk1L8xqQTWM39Dqdpns2z5AGlaS0hiLPZUhZd9VKgyW
 KNzDtXYFNQDVxvaGXUc9aLDeoX1ara+GhVHED8xXLU/BS9pjvLXnHbE5mQGcqg0ZEnvHUSCFkRp
 XXNwzStg83Z39gdipE2ipnGstPMPEMz7r6t/ed0CsB6o17GCR3GwzROD5Y1/R/EKBTESY4DsaTB
 3h9UtZekIpLNF0pHmj9/dFH14uV+WyMkcDxxSXA8k33DLmbMo9fJcXohamYAZxMlELPCZYfUaaa
 j9Qo9El8E7bWa0mQZNN2exkaabApXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 9/16/2025 2:47 PM, Imran Shaik wrote:
> 
> 
> On 8/22/2025 6:32 AM, Jakub Kicinski wrote:
>> On Mon, 18 Aug 2025 12:25:50 +0530 Krishna Chaitanya Chundru wrote:
>>> This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
>>> registers a PTP (Precision Time Protocol) clock and communicates with
>>> the MHI core to get the device side timestamps. These timestamps are
>>> then exposed to the PTP subsystem, enabling precise time synchronization
>>> between the host and the device.
>>
>>> +static struct ptp_clock_info qcom_ptp_clock_info = {
>>> +	.owner    = THIS_MODULE,
>>> +	.gettimex64 =  qcom_ptp_gettimex64,
>>> +};
>>
>> Yet another device to device clock sync driver. Please see the
>> discussion here:
>> https://lore.kernel.org/all/20250815113814.5e135318@kernel.org/
>> I think we have a consensus within the community that we should 
>> stop cramming random clocks into the PTP subsystem.
>>
>> Exporting read-only clocks from another processor is not what PTP
>> is for.
> 
> Hi Jakub,
>  
> Thank you for the review and for sharing the link to the ongoing discussion.
> 
> I understand the concerns about using the PTP subsystem for read-only clocks.
> The idea behind this patch was to use a standard interface for syncing time
> between the host and device, and also to make use of existing tools like
> phc2sys from userspace.
>  
> I have looked into the on going discussion you pointed, and we’re facing
> a similar challenge. Based on internal discussion with the PCIe team, we’ve
> confirmed that PCIe PTM isn’t applicable for this hardware use case.
>  
> That said, since it seems the community prefers not to use PTP for such
> requirement, could you please suggest any other way to support this time
> sync requirement that would be acceptable upstream?
> 
> Appreciate your guidance!
>  

Hi, Could you please share your thoughts on other approaches or directions we could
take to support the above requirement in a way that’s acceptable upstream?

Thanks,
Imran
