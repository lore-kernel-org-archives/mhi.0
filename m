Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7101318ED4
	for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169531; cv=none; b=GeuWyZhzdec3TVCJMbKPU8w67aJ8JVq5Yuymkhhgsvcb8ylZE7apRA6829oKPhVUus8h8fDwkcJ3cAqlaQ12GHEJxcrhgzEF43zuhdXO4J2pLGMX0USZnCxJNc2khcaX1OyMRdkKWSnKzxdN5n9xYyplcNNAOLcOBZ8jME4PylQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169531; c=relaxed/simple;
	bh=ee/6fvX0F8AF9ceEiHWoE2FNkivy4xu8OLjEmtUKMzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzLbz23GkL8jfMBbXxxuuo9cStAQR1YYFXnxykIXRJBIVQ38ip3N85jvwK1OMJdYGQEmGMxwYEhYz49m8JuPulDoJm/gbtPd33F1WmYF6Ze3rqk30bgIudT7O8iUh3ThMy5CLcMG/NDh96R6okY8EJJGUVl1wQhp7p7EQhROiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fySF/epu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKHsvnlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fySF/epu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKHsvnlV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N8dhdx3649785
	for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 11:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5emdbylXy9MCV4YYnwzmxryQ7eVqw/YFx+HBSKGus5o=; b=fySF/epuNgI3sCry
	6ebfrfbQsNtpeWX6x4e7vZ+DYaomUhuttTXCygDdX2j/RiDukQ+x/VjY7+8juA3b
	rhszWdCW7EvSzBx3DJi0UkSBa4JGppfxpsMZLT066USOsWB0QQjqYg7BwTuAt4ex
	9NcWlYaSNkTOniobD89T8F/4zroqAXU2W+iAOVDh8WwBphWd+llrog0ScXPmP+/z
	CLddlpYNzQRKvfS9BBk3rztD89m7Pc7DvMId21UF3JmSe3xDKGp7KJ+zhS7VRSeL
	rPFfP9jgRRymcxjcloWvCzYRTEI+7cILiHI29eTNcfqb+vw8zZEkWcCTiH3lEjsJ
	lRaDvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nt72c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 11:58:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6d6b0f193so45501885a.1
        for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 03:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769169528; x=1769774328; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5emdbylXy9MCV4YYnwzmxryQ7eVqw/YFx+HBSKGus5o=;
        b=YKHsvnlVl4DbI365PIzCBGj9rMRe+BRY36giEPDza4fR9629zWD9XXRW56cBgzpe2x
         rR48LK/P3mcWZNKyD9vjX+mu1AE4Fln/VGRtYOqEo635/qnODkfmtUaDYQ+W2EkGIx8u
         zaVs9X2NkboMmDCGkRRvJzR50j5WrAq4SKXFc2P7iwrtOLazwXVMhabhsaje4XbwCNAJ
         3KANRIaU9jefwV+IdxmQHrP2WmsQo9oH+RpRBFKj8eMJ8kQR+Y32vLYadHEig2cSr8kF
         70wx923XHIv45MatyrvG7eJr2N88gbMq/HguxsrUiu7MKyWKT0xIk/YcbjUrQ2QUeZQ/
         9IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769169528; x=1769774328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5emdbylXy9MCV4YYnwzmxryQ7eVqw/YFx+HBSKGus5o=;
        b=Jz8NcuogcWU5ocMswAWO6Nrghxo8Eq0MDF4Vloz4Ysfc5MCbUmqKl8jEMqYpwkZx/6
         Pxdtl0dKDtv/npsimVXpJ7Wbq6JrQX06hongnqncbmj57dOJEnZcMQFB8yHwOORyWvpK
         uLEFS8Ra6tPHropWBPI5cBvWIE/FxOnt9yKbfLVu+55v8GOfi5t7EgI8nthXMXAjaFgr
         Q0ZliUaMuXwMF5R3t15mF1egDGwX8bY5cLTbADzOWon6vM3A94lOiQlPPUtOrvFmb7Sb
         6LXIxnuMztyoN+Wp+59TDRLrwxBKz9pLXBrFUwBBxTTPwHOpP2cBW0Q2++JxjvRGdVkG
         PMow==
X-Gm-Message-State: AOJu0Yyd5AbO2T2xhTRsBsOrCSf7ARfgGqkE39eqSwv5lMpsmBcucjs3
	TxLp9/96h+6Gsi5AojfJ1syoDaGi9rR20BViAPvRdHWgEYDNIlr1PA9gRVmypOvns2Qaivoaq9l
	6GX9iQZjgswkniM9yvCKY/ibGNwLYPuExSrz65ueN45x80DKgUwMHKeM=
X-Gm-Gg: AZuq6aInemUNPImCwTNzzLh6OuDtNKLeqwnmmXLftCwCUuRW4BTU5BuVBwQNQQcMU24
	n1Jluiv0vtSoV13NHUaicAsSyd0jt+BwE7wbvtJ/YuIoLXbDWnKk0tkGa31RRBTEKvAWwFOyUBZ
	TNF0CblwSA/Zy2NJLXIqwApudi2ZHrBHkkXkyKQbjhs5JZLwY1tPACnQcUfrDhorHtbS+WSuLLu
	ZBDA/VcCycm67oLm7tGa22A5tXl/A8KdVHIGHbtVQblZTLAw7ttOQ0jYlMHGtXn8EEQPZMawvQH
	dBvTUecUlCGmxM8xpsRafT3KsnZc3YWVHuEe5DOrpT2L4DVR4s7RIfzHRZJhhRr8t2rQJ9IfSnx
	hj9xqugEVUOEryrmdYUhn42eDuNP1SQLtb+YdGJL5nEU0AjwnevTJxF8JFIo1oWJiMzs=
X-Received: by 2002:a05:620a:4707:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6e2dc774amr276558285a.5.1769169528009;
        Fri, 23 Jan 2026 03:58:48 -0800 (PST)
X-Received: by 2002:a05:620a:4707:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6e2dc774amr276557185a.5.1769169527604;
        Fri, 23 Jan 2026 03:58:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b754122sm95376066b.46.2026.01.23.03.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 03:58:47 -0800 (PST)
Message-ID: <4c552f50-a712-49e1-addf-7f0950495496@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:58:45 +0100
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: btYy6PaD0b0Ug87T_m2SP7xbep72IZP0
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=69736278 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dLtuw2zWJCuVnVCbnloA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: btYy6PaD0b0Ug87T_m2SP7xbep72IZP0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5OCBTYWx0ZWRfXw9V3DP2IpLh7
 DYteBJPwMGi4M5uPCrQDDAdmY7ZEptkKvJKEbveygnmbmagPzBxjjFysmRBp3MlIhcasN6KiFex
 uRwUVe6QEDTBZTjvLDaaF+aei5upR+sjI2a7R4HYD69d9L9XCSsTRZp+Sc3hQ/TGoh7S09Wi8hy
 trauFLlS1nvmv2e+Ic0J2CSCE/4Dr+TjYepex2VbpCGRGqL2lb5WMIMOb1nbziMNNA16bNNCueP
 J0DnNEX4maWykE4R00crvxix3uF4uLPIcWDEjVUOh3EukmqgK5ZFi78eZd/mbGeFZJP6bGJrwoV
 2IhQcIPKhhHYD2Qh5cSUYVMITqxbCGBoomMV378aTm/JPSPJl5mlBZPpBQ4oQb4KM87D36oDRvj
 zuVFQvR7kYmKUWYtAuxpAW4TG/UVBGwm3ofDneG0S/faKrgEu9pPhFgGGKt645fuZtjtGMbNpmw
 S2Q7yfW68I22mp3hHVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230098

On 1/23/26 12:46 PM, Krishna Chaitanya Chundru wrote:
> Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
> transition to ready during power up, so use modem_qcom_v2_mhiv_config
> configurations.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
          ^ this looks like a separate bug to fix

see e.g. qcom_fixup_class in drivers/pci/controller/dwc/pcie-qcom.c

Konrad
