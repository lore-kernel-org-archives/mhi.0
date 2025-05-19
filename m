Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0719280308
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663987; cv=none; b=St+ivxye/mhDZdzop8nBZt0jsI3ibCscZ5EETvJeVM1htYUp4VuRDk4wVdAIuHhyaSJKIqOOOb1/ldDXRz683mIt+NvuQz26y7Oz32SrE+8GYGEnV2HvaY6ZvijTtF6bKZ1DmB2ZjKxTbfsoOjw5wklUlhRINHfDh/qU11fWgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663987; c=relaxed/simple;
	bh=Xhux39lBBQKuPR8VzWQRXBJuBTgP/d/kAe1GmAif5J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IA4Qktv0X4X3bQZN+27QnlbH1EWWxQogy8iOQ+cdf9ZuPw0WlcWc2Jlk8I3R/JWBBbVGjlP/D/k4AKH0jMXhIW5SwKbK/F60SNv/sAbwEzyomZt4tH5sFJmxXDJtr8Kfvhq0HMLZiHxFmy8WARNeIbNi5KMQ8XHa/2v1539hm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dd8WW/JO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd8WW/JO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JA0st0012231
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 14:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCaJgluMmfXFVWvhFvT9T3CnWrQInCYbxFEso2AuIX8=; b=Dd8WW/JOvAUB19RG
	Y6xDTbA1jTR2Yth+8Dm3JLB+/nA8sVLWgwOAbeirpRRaYG5NV8FiRxzVCde/8V7P
	+KzXH5hfwXj78nmqfsqcEzY27BJxhNIsllTGkYNpwlklOVU8yfWV4G2scIksGDtj
	DbQdEUl7Jr11OMgmwwjnGGsExHDGBo0QpyuRlnhPOH4W5cxqXoACUfdWZeynylXz
	Od1M/Q2nSzFTk+cBHW4H81zmnKHquPArOXN6QF26H5vSu84gYoZ9TQSD1R5QVP+y
	3QXY76mtfTaaRhPWgGa9ocjQZzRiEQzEtseqQClq1MpqygvAioMbsQ7bRl5wOW0a
	dKwa0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsvhv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 14:13:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231c326fe2bso38715275ad.0
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 07:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663983; x=1748268783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCaJgluMmfXFVWvhFvT9T3CnWrQInCYbxFEso2AuIX8=;
        b=RgNsKuBF/baqAIgXMh2iHXzuvw5wgWNPrU6PGvO0sV9RANgoYCSmWWhNsTht1iZMB/
         CSg1ExFZgPYz1Sk4UAmENnAWNGWZa0M34hLtrVGMY6rpTPVgXlJGjgLL2b534ieFi/lZ
         rZcvhVAaQc8iGmcQ/uxQcrVRgTzGs+V7OPXF1Su1FWks01/nYtx5nmLnWFmIRnw3Nh/P
         F6Z7wfiFc+REYzOOGVu5samxNCM2NjL+8qvGTqutMVBRUi45JMTR3EroGUuuxBBiL4CR
         iRX3ts3pVzm+0qJZvwPGelSCDv5F0vznWyWavFK1xJ7gqZhe6azYJZrUBbTUDKAr+w/t
         UEQA==
X-Gm-Message-State: AOJu0YyWSy7P2tLhAwFP7dgk8GVmkjFUZKCjX4/NXJBVJPhRNfnzmmV5
	l6CtGJsQT81N8OISPakj9pLKXhmUca5hdL51XZSxFje1TUOdiZJRF63tEVavSvYz45nrcAocrgs
	wzM+eB6rIo5ahRF55lhuT6x055aK07KERwrQjyZtyDYFgcKaLPJaqQGg=
X-Gm-Gg: ASbGncvVV0e75IOUrJ+D7MOXdm6WLsq0sxyA9S8bDTgAKoztDCyO+1noauhGSTXfie/
	vCsA/mAko3RMWiMUKHGTSccTB2tWGsR0ZQeoRfuKsR7RjxMk5Yt9+uHpsIl9aMJI93Quc1ruq/l
	EZuqK87qg00u8iJ8SX4V2eSojJU7YH8rZPelKQtqwRvEPh1IBtXwuaguKnpSd6ncO//ZtBfzZkf
	C/5dMGW4yEKUDPaRYRUiYwEeMyqYUYdFPYqt/oaUpss17JL9uk4Pp/2nZvE+yp4bHn5U75RQhha
	xORpd/qztc9DJQ916mW4WyfwbWohgwMBVilcmFf1idxXGDEmBGN+2RSv/Yu+PA==
X-Received: by 2002:a17:903:2ece:b0:224:283f:a9ef with SMTP id d9443c01a7336-231de35143fmr144134435ad.6.1747663983182;
        Mon, 19 May 2025 07:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOyFknI1B/0ShJdLNtgetMKBIvN9RE1Qjwwuij6mD4Q1x4BLuZcO7/mmxxHNOCBDtnP7jDsA==
X-Received: by 2002:a17:903:2ece:b0:224:283f:a9ef with SMTP id d9443c01a7336-231de35143fmr144133945ad.6.1747663982607;
        Mon, 19 May 2025 07:13:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edb0d0sm59771315ad.254.2025.05.19.07.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 07:13:02 -0700 (PDT)
Message-ID: <cf4adaba-5601-40b9-bd17-1b1bfa686b0f@oss.qualcomm.com>
Date: Mon, 19 May 2025 08:13:00 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] bus: mhi: host: fix endianness of BHI vector table
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250519061014.12225-1-alexander.wilhelm@westermo.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250519061014.12225-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XBLH9-nAotREIxeD4ut5zKdjN5nIDaN0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzMSBTYWx0ZWRfXz1rXmRZx1SGK
 pKi95HPLvXqniSW9vWOI0ADWIp/BqiVVeCG/ieWychCsslra4LGtnVjl0Ej4HndeIKJb7Ksh6BB
 M/YfOaYG9gQM3/YMZNd8fgmBgISLPtOdcsvrn76MtwMYV9n4nvkRybN9xtWCsswUn3XlzG+RWR3
 nHtacwho+/UE+Z6fIht6hvSikLADMYuDpyJQXArsg/M4f7YjQAHMRWk2jzYHFvoKWXXHy36id0k
 SoD+f4QhpDTHv4XW7I+1FL1cHjiKeaFQMizlaNcmHsMBWQqMLCjbUXyxtKR/VoiTmutDLggjT+2
 5ZtQLArdgY81zKcLUWWWLaKf8chr27LjCK0Uymo9imen6tPme/EntwRkn+Cc5HW8PoRoyyET47D
 uPGdeDaty3bfGTI4/FKtDGcHCVUQzn4i72kgYSbI7bTq/vtSyn4jdK4pulNxW6xI5NDFe06X
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b3c70 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=rGmKAQFIsUGY2xqShAEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: XBLH9-nAotREIxeD4ut5zKdjN5nIDaN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190131

On 5/19/2025 12:10 AM, Alexander Wilhelm wrote:
> On big endian platform like PowerPC the MHI bus does not start properly. The
> following example shows the error messages by using qcn9274 wireless radio
> module with ath12k driver:
> 
>      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>      ath12k_pci 0001:01:00.0: MSI vectors: 1
>      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>      ath12k_pci 0001:01:00.0: failed to start mhi: -110
>      ath12k_pci 0001:01:00.0: failed to power up :-110
>      ath12k_pci 0001:01:00.0: failed to create soc core: -110
>      ath12k_pci 0001:01:00.0: failed to init core: -110
>      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> 
> Fix it by swapping DMA address and size of the BHI vector table.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Shouldn't there be a fixes tag?  Probably pointing to one of the 
original MHI commits given what this change is touching.

-Jeff
