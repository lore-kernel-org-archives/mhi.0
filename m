Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE015F330
	for <mhi@lists.linux.dev>; Tue,  8 Apr 2025 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124209; cv=none; b=GFnedbEvdIL/WAhHkOXyxPtsufeI8w2jK5VfBNMUYzizHwr1CUFZ7+dWjw9Wmn0Mmo2qIPKBaTr/cBXOQHExGok20HeMA11CxKIXtxiTTZ3ljE8V5js18Kxu8JQIgNrvRoLgNRP0PRb4qoBr+u9MKF1c2SU6/PrxdaKg8+7C4DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124209; c=relaxed/simple;
	bh=8KR39FZSTUXoLdQpSJJx1Rg5AaamtIERM+a8BOs1a9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dN7eL0JD5cAp6cqHET8LhN/kb18Tln8Dcins8KGf5opWF8sWbewEzm8qKTLmvUIEqJl97Hec/hAiUQjjxDYvOUEteqhrIQ+Ogzxmf9howmgzpNTkx6gdUEMvETBCDUNUJOphEq6UCJid5dfoTH2UYOFNdkxxjtamEc/O3fvRST0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HexKUwP3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HexKUwP3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Bblcb011426
	for <mhi@lists.linux.dev>; Tue, 8 Apr 2025 14:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OnLhGRbnotHUC+BJAk6Gvios3/jKclEvVKBs/uKOxuo=; b=HexKUwP3wCqx+4yt
	ZkDJQZl33qdAl2J5O5rC6NsDXEVa4yPM8ZApaBW9NYrBtLYJAmSvE7aNjC0mrtlg
	r42wcW+4I81lSMLL4r7OgbH6ZakYVexCETZ4mueazovOoJyFeOGXG1HUdmkMi9xA
	YeFa2yI1wuWN++1Zn29ym+Hrn0ToMXvQOocI1HOHRwBkPdkI8WSKQK3QQqQ5937o
	3MHrpjNW3pd/2yf2h2uwQjBEZ2y0DY3l+a3Tet6TKA+4xJ9lh/RTAAOge8/SHDin
	Aw1j1EP1HlXn/e+EPWNS6talF40LrCsRh86pOJOewa7w4wemyzCLlAu0HTMpdvIA
	2//N2Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftg1mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 14:56:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af9b25da540so3695780a12.2
        for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 07:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124206; x=1744729006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnLhGRbnotHUC+BJAk6Gvios3/jKclEvVKBs/uKOxuo=;
        b=H1770MIHChW9sc0TAxEEk+zMIy1i567fQPMn0KprcE9amy+kssmX6YGQM1RHXURHR7
         pNiprqK8o0eQQpg2vO75E8Dqe8kBKNmIirqlrQEqoU+Vq/v4V7VR45ngY6s49DOSTGsz
         r9cArcgPAiuda7/KJJn/MSkTjruebp5hVbtgc554dI8xYrnOQwgNW31a+Peh0WgyxowN
         LzKKiHSIzmVurm4R9aCeQ6b8TtFISxF3u6JKIzgEcw5xGa3FmuHhfHzT6UFkuCBqW0lX
         MUr6SIoxBk9qrmp8nmnaSZz4mL4pXXHCaDIpxeexNT9FpYFqZQ7iyyKnfIlSEdFF8QLm
         rrag==
X-Forwarded-Encrypted: i=1; AJvYcCVSsvQUraKh5H/TOLTaaCODGNIjy+ObPH8rp58T9VxRL48W7SPanFsXwgmso3zt79GyG0w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0gvv+VfBu6SkYDJTDWxp5MaaLn53BqVmcN50tif3OgNJRAMJk
	vO0p7PuTh5HubhZ2af6VfOolJ2nakLzI08nNc1TzcllmI9bNKtvpthNzup/H5tOBwEq77REkCBo
	JlszK54oPQpOPuuMs62FNKxDEQytrqdacPRVKYKr0UJy8dbCUTZA=
X-Gm-Gg: ASbGncu3DUYxid1107di6YOFRQlhB5RrblSCSZ25OCusLeRmiANi7w+SLpZMVVYfICr
	bWLbOyF02qS6D6lFaldWwt0d947DvAMEhwVYZkBd2enSqFYGfqldmCNSLmvEgMOgfrNJRRQe4LD
	iCFWLK9bReTl659GD7Mt0zkAqbHdjOc1KuXCFq43MFZhcpjvGSxqHW5tWnd6I24st2JCfz7EnxV
	lOLnaqR9b2bwclVZDEaF+Vo4yiwzH8Q35GXsXnEpwmTj2ulKbO9gog7wPMYU75AK+KQspVmYA+l
	vOr2X6sSvHaKYv1N4Ij+QTFlc7Z2dvB/JbNWqCg7OlpaTGEhrMKv0X4NIg3bpB0zBg==
X-Received: by 2002:a05:6a21:118a:b0:1f5:93b1:6a56 with SMTP id adf61e73a8af0-20104736aa3mr22802003637.33.1744124206322;
        Tue, 08 Apr 2025 07:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZbrtBGbreOoRxCYCm3eRyTvBvIuVSmC/EM3vW1ZUoT19SPFn7c1fZ057K1+nQeDdYRsw2xQ==
X-Received: by 2002:a05:6a21:118a:b0:1f5:93b1:6a56 with SMTP id adf61e73a8af0-20104736aa3mr22801970637.33.1744124205926;
        Tue, 08 Apr 2025 07:56:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41aba7sm9229213a12.71.2025.04.08.07.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:56:45 -0700 (PDT)
Message-ID: <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 08:56:43 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f5392f cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EqrZPqEe0gY6MFZa27UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VKg-aKY3-Qq0fqzohbOlLxNnmtuf_8H1
X-Proofpoint-ORIG-GUID: VKg-aKY3-Qq0fqzohbOlLxNnmtuf_8H1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080105

On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> MHI control configurations such as channel context, event context, command
>> context and rings, are currently allocated individually. During MHI
>> initialization MHI bus driver needs to configure the address space in
>> which this control configuration resides. Since different component of the
>> config is being allocated separately, only logical solution is to give the
>> entire RAM address space, as they could be anywhere.
>>
> 
> This is fine...

We tripped over this when experimenting with an automotive market 
product. The FW for that product had a rather strict interpretation of 
the spec, which we confirmed with the spec owner.

In the specific FW implementation, the device maps the entire MHI space 
of shared structures in a single ATU entry. The device cannot map an 
entire 64-bit address space, and it expects all of the shared structures 
in a single compact range.

This applies to the control structures, not the data buffers per the 
device implementation.

This restriction seems backed by the spec.  I can't find a reason why 
the device is invalid, if limited.  I don't think this should break 
anything, but more on that below.

> 
>> As per MHI specification the MHI control configuration address space should
>> not be more them 4GB.
>>
> 
> Where exactly this limitation is specified in the spec? The spec supports full
> 64 bit address space for the MHI control/data structures. But due to the device
> DMA limitations, MHI controller drivers often use 32 bit address space. But
> that's not a spec limitation.

Its not the clearest thing, sadly.

Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers" 
table 6-19 (page 106) -

Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE 
and MHICTRLLIMIT registers must be equal."

This means we have a 4GB range (32-bit) to play with in a 64-bit address 
space.  If the upper 32-bits of the 64-bit address for both the base and 
the limit must be the same, then the range of addresses from the base to 
the limit can only vary the lower 32-bits.

Invalid:
BASE: 0x0
LIMIT: 0xffffffff_ffffffff

Valid:
BASE: 0x0f_00000000
LIMIT: 0x0f_ffffffff

>> Since the current implementation is in violation of MHI specification.

For example mhi_init_dev_ctxt()

We allocate the chan_ctxt with dma_alloc_coherent() as an individual 
allocation.  In the case of AIC100, the device can access the full 
64-bit address space, but the DMA engine is limited to a 32-bit transfer 
size.  The chan_ctxt probably won't be larger than 4GB, so the size is 
rather irrelevant.  Can be allocated anywhere.  Lets say that it gets 
put in the lower 32-bit address space - 0x0_XXXXXXXX

Then a little bit later we allocate er_ctxt with a different 
dma_alloc_coherent() instance.  Being a unique allocation, it is not 
tied to the chan_ctxt and can exist anywhere.  Lets assume that it gets 
put somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX

Now we have a problem because we cannot describe a single range covering 
both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper 
32-bits of both registers is the same.

>> Allocate a single giant DMA buffer for MHI control configurations and
>> limit the configuration address space to that buffer.
>>
> 
> I don't think this could work for all devices. For instance, some ath11k devices
> use a fixed reserved region in host address space for MHICTRL/BASE.

Why would we be unable to allocate all of the control structures in a 
single allocation out of that reserved region?  Is it larger than 4GB in 
size?

-Jeff

