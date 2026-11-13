Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596759;
	b=Mvv9Tv5mIi0LU8A4cTVKiQw1j2MYjscp2Cbyb8jSIHZa3BcjpC5g+NVyQIHHdXrD+eZ4
	 3OUrrVu8mLGpE5Dt0olVBHx1guLn3mwI3PX8pqLTdXu9TKSXR/BukYl6TSS4CWvFG/DDV
	 IdtUmuzipEXnl7Y3+M+Tp1+htHJuxYE0BugFpFYleCa2gHrsvLlr4DkSUV130MSCJUdL0
	 SpOVfMpS48rzyR77Du3rOY2cdSodUPUAC9+U7g7NbwnHz1cyW78qIdIarqvsG7C0GsyFA
	 YyGkXjNIOPEOV3FUZ/0a0UjFGAPfVsj5m3GyzkVv3XwD9Ik7wMzKGuN6uN8xy0P5wqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
	b=ZYPZ2VhkoIO/buKcEZUeR6Dvaxt+Ls4pR2SwelEx7Z1iksWlQeutnlx4iXJIPigtyt9y
	 mjBIek2NWXsUjxv2l4jme4OTB/JdNyoWAAWYr9TDVrmBifiBONsWy7FTk/mS3gpVYy0SS
	 NEQT0LmULhTFHXPRs5i5PM7S+ssSzSx0igOUrZy8VwjVd14CG4P5jjY1DG21mS13zO5hN
	 r1BmdN6zRn1jW05W4pj0J36wBvyNWBirj7wEsZwrbJn1v5pkqXSdCciAd3wc6bQcdQxGw
	 MpXTTBEGBFuVRkdneciH4b1bSIIAoTbm6e/3eIE6yQdjmIAFddGx7b3/7CgVgoiVMdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=naturzKn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eR29Noo9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE0606A323
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 19:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CE0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=naturzKn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eR29Noo9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ1LQ22574978
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 19:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=; b=naturzKns/Ro24Ut
	42kO1hKMZb39rcdjc/j+jUi5OossdXeht+2JJb9mkcTOmi9HGwyczRA4363X889O
	LCSCjUOJWqEU3Gie3i8r+lBPGt3oW1xsAo8CXA4Wn3Sq6xzqWWCQ/+tJUHQzX9Tl
	eoiSoopRd8HdnULH127qu9iWTHq9aINfRw3PiFrmyiscHxbrrr/mXpvdTJTPpRAu
	MjMIzXrxEehOQI0KBKCEPnWFhEjuvR+yg+9mcXA4o7AsD1YvsrSNcX1ACyzi5M1C
	U1iqf89Tf9ZMr+zL3DshxqCz096BDZtNrr4KaTAEHp3SJ08ndImHL/JnLJRGq2Y5
	TNdi2A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21x7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 19:05:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so1646848eec.0
        for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596757; x=1795201557; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
        b=eR29Noo9GZ8vwBCYzMP1hHFgVXvQgY6/mzEiGvkoLbHu1ZQ8oYJmkgNOuhRAlKa5Qn
         KOFA8Iysl1gaxbE1mcZK8thVYY7rlXbHReR1yElymUphEtLZPPcVjoozXHCiV0eb1t5r
         pOJ47Pilvu1Zmi6xU3eE6nbUdjegYqElgh8kSK3/XWjbwLU/+lTbXCGTnuHsI4rvT8tT
         9BH055jIimar3P4/6bNcS4BQ51egWes0DNT6ie2B8yzX7yZcG+Suk02mCIDvWx3o4HIR
         OeUoGyKR7cvjWmCOxb3vQR6ULUKcnVkJ5jc4PS+5bEaoVe4mkWR53GMvIR67QX7VS8jQ
         mCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596757; x=1795201557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
        b=AEP2O32u39VLkfADsM0thVXFSsWxcsnm3Yf5ahRQpsNFo7oIJECg9/RgBwMAX9Z2RD
         Flr7hi/QqF/0cLfSWFJr4qEo20haU3ng/B/Hr0ZeFyVPb56KcvQ5othDj4f/blrMt5JK
         hwlzEueEJO0v9jwoEf8yvxym2cll1VVBNrXOcr416KmmO7oDZlYVuLNbS7AXEw/WbSgy
         ddw7pVz+H0O9/rmBINLIQGGrEXNe4lMNDjafeQSKr8JDolp+tyAUWOPOIBa4XMuwUSeI
         giXkNWEL9EwSY9tvJlArjTe/PpTc4O3YQC7YbAifcJUh6k69Xoj0KP5qh06ebaMohvlC
         iRwQ==
X-Gm-Message-State: APuU4Z8KFCn0Dw4AQ0YrCTkghb5zL9nZWs0swWUD8Hk0OfTfBwlJ/RUn
	akrzoZY0B/koF0a7EflH7jEqoOsUqDBhJMkfup0uaqPiVCrUvs9oMvKA6/VXN4wpuSRVvbOava7
	FEf5JnR8M4bAd7ntbqYMtQyuRz8po28eRD+9U87nQIue0PgXAVPhe+w0=
X-Gm-Gg: AYBFou3m8qR9KlOFLsXeVvJfKS4VCYrS7hRuszfzoPA10FwKjQyARUzlhYFHrW9hz+k
	smib+GDLhLfLteG1EJQPV5ZUooptmUOeF0y84OcQWwTfUST/9RDgODS9hn+/S6iatIqyYSVxz/u
	1bAhKOcaayRr1qN74CbmGU3JrZJcSsIYNY0latZ9D8KVG0+2KaLZGCfTwBCwGFFlkHew59twgTO
	TiDBSCsMk4+C0ZNr5vydx7fjR3KnO3Ob5EP3MSky4uOdeBkxkSLRQ9k6P4kX/U3878riHpYMwW1
	q2H5TTStOIN2+EUHbIdV1HGGlqFrgOD+w5/sUaidDHo9bXD9XbqLRbXv8LfAWPmJ410Qy1hapdm
	wDm4V9BA/5+oG19OZkh5YbbZ3+TzRoqSdW4YWXwqUL7gZ7TxX926wGruNWzteHcXysjcxNeZmG1
	DjZY/lo+xI9cO3zbFBA30tRuA=
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr2697354eec.30.1794596756854;
        Fri, 13 Nov 2026 11:05:56 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr2697326eec.30.1794596756183;
        Fri, 13 Nov 2026 11:05:56 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm8616314eec.4.2026.11.13.11.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:05:55 -0800 (PST)
Message-ID: <6b3fbc60-34ec-4b7e-bbc7-84a0ec5d496e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 12:05:55 -0700
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] bus: mhi: host: Add debug port personality switching
To: Hongxing Xu <xing1989093@163.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261113122302.2174-1-xing1989093@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261113122302.2174-1-xing1989093@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfXwdHaLfQwu3ym
 kmZb3DVeqtLwjHruiDrkxEiPMbq4Zrf2ZquSmvI9ucynXtVldJ/EZx9okIV3fqx+0j5PPqscaDo
 WtdslC+UjUnUCKRXB0v32/wq23y5I2nsSfyhap+t5lNHEfEL/YAIVVCNeuTu1fW0amuygy/3EIx
 YmxaIlfkpxuieRzrn12nE9AEon3CG13DXKId428nR4nJFplK64ZTmLFME0yaPASiyEKLD8FwOA1
 Ed8fCIld096bkq20A5CI4kA+nxRU5hy0cMc0vIh01/3bg7ZVgV8MIsuiF03gNdyQcWEtdDSKDFK
 ieRvFFR6Csul22kA6VfiQthZPAbuJ486bpF0wOfrzhmlFCoU/RdoRhEOW8kifDWq7mOTdZVCR8m
 V5usYY7pz4tXscYWkcYI3tOgiQyZupa2Yutk4bD9M3B359+7gifVS7+WXPJyuixDIjMOMHtfW84
 JUbDlP10o6c4JbWMXBA==
X-Proofpoint-ORIG-GUID: Hyu7A97TroVrkmFy_0WdxAMB48GQrg4j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfX8GNHZ8rzy2ac
 tnB3knO+WBH6fOQC5shJu1+WHbio/Q2UuIVGPH26ifZC9h2RiGrJsUTMBuhf9YQq4bTF552xJRQ
 RycmGEBVpLuSd78zRnEN/9KuMgIW0/U=
X-Proofpoint-GUID: Hyu7A97TroVrkmFy_0WdxAMB48GQrg4j
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75f95 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gG0Lje7BzgQcJ5p3n2kA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130076

On 11/13/2026 5:23 AM, Hongxing Xu wrote:
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> index 8b9698f..1fe8510 100644
> --- a/Documentation/ABI/stable/sysfs-bus-mhi
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -30,6 +30,20 @@ Description:	Initiates a SoC reset on the MHI controller.  A SoC reset is
>                   non-responsive, or as a means of loading new firmware as a
>                   system administration task.
>   
> +What:           /sys/bus/mhi/devices/.../debug_ports
> +Date:           November 2026
> +KernelVersion:  7.5
> +Contact:        mhi@lists.linux.dev
> +Description:    Controls which set of ports the MHI controller enumerates.
> +                Writing 0 selects the commercial personality, in which the
> +                channels that are only useful for debugging are not
> +                enumerated. Writing 1 selects the debug personality and
> +                additionally enumerates those channels, so that the extra
> +                WWAN ports appear, e.g. one for the diagnostic interface.
> +                Reading returns the currently active personality.
> +                Controllers that do not describe any debug-only channel are
> +                unaffected by this attribute.
> +

Why sysfs and not debugfs?

>   /**
> @@ -381,6 +384,16 @@ struct mhi_controller_config {
>    * @no_m3: Device doesn't support M3 state
>    * @irq_flags: irq flags passed to request_irq (optional)
>    * @mru: the default MRU for the MHI device
> + * @debug_ports: Whether the debug port personality is active, i.e. whether the
> + *		 channels marked with debug_only are enumerated. Controlled
> + *		 from userspace through the debug_ports sysfs attribute and
> + *		 applied by debug_ports_work. Zero-initialised, so a
> + *		 controller starts in the commercial personality.
> + * @debug_ports_pending: Latest personality requested from userspace, applied
> + *		 by debug_ports_work
> + * @debug_ports_work: Applies @debug_ports_pending from the ordered high
> + *		      priority workqueue, so the device creation it performs
> + *		      cannot race with a state transition

Are these optional?


