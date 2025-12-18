Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F961FC101
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766082682; cv=none; b=HdLbjopTmn6DyZhWd1fn/s26p2SSdgIjKhpBWPwMgjNDEbNM2NZf9O0u7p+i/W0Qgr5joHylsIYscVKI9YWURNOnBPLKCxxB6AFDZ3kWLLVOGsr1pBcKQyPQdNKoD4G0AxkRyRejvKYgKJmsfhtkPpuOk44ecwmN1Tu9WZLSu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766082682; c=relaxed/simple;
	bh=Ijc5Z5HWHuvCfxym8nKQ8+iwr11xgjKO1sfrcDU+QaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MH73hFClZME42F52ZKGrUnuGPNmWSaYJ2lk9ZRFh7gYD1y4WggDTJOMqk8CP1tl2SyjZzpTNkFEVeDt2GqofMFrdMdI8QB8Ghll2Gks7288jnw8zP0KJIZ+ZvI6JZbAHM4NRCTvnDrk7XU6DTu2JyRF1SQi9VyStsOA+D0szTvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2qlX4lA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNt2eP7f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2qlX4lA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNt2eP7f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIGkZ3W4191476
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 18:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+p7fNtxvjjEPo9TyMSnQOxUM+7AN184mtgYSmSkQtQ=; b=m2qlX4lACQLhnVvE
	kkHEPfkNT2tCTX/SeoaqaXH8u5wSeJB7aAMBaOOIhyFznWiT5RZ6MoeuDKBZD1mp
	woqrOkVMho8fiF65Jznt4O/OM7q2j+DJdDMi3ZWZJoC8p/JppQFCc0ZtTk6OWyFP
	05U+3VfL9o+UWfD5loAzpN2ApgOrNCqCcYnDg3WXJfFONQoepFAD6MgBMFzqu3wW
	p4bEtjunBbgiDFdp0h6HiWVJOt3azx0JtP7NSvW1VJR4EQRxWgYvupfDk8Dsd+fr
	FsDP2vIlAokpNOPxppucDVi8JoM1OfF0GxFG5siCm0FhnOPcHseobYmtjJbt/Lpf
	FwQXrg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkk310-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 18:31:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f4822f77so23009985ad.2
        for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 10:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766082679; x=1766687479; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+p7fNtxvjjEPo9TyMSnQOxUM+7AN184mtgYSmSkQtQ=;
        b=kNt2eP7feXuOcRMrZAxqoCx5WbO77MTXCNCAZglP68I0Td8H8ucYaRVf64TtYM42qC
         NPinX5G7mTQpu44Vxk+j2FWQxd0Q0FBoO8WtLhtfhuuiMrBE69+9FWzda+Mny1HRVZ2c
         nK1KPB0nCq1agaIHmO4Tr9YT6BTN3TAfe9xCAypkN4/Z/iBVCMd8Y/pG4eiR8r4GhiPg
         C7rcssnMA3ZhuY9RQIZg2zmVWFk9Aeavqto+hNjYZYCd6o+q0dkEyO44oQIirlEtEhDD
         ZZGiY1WdmQvXlMrCXewT1yYfAeU/ycW3WPcmqJTk9UQTZkqgBzDFuAkNOBMRsX22+P6Y
         rOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766082679; x=1766687479;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+p7fNtxvjjEPo9TyMSnQOxUM+7AN184mtgYSmSkQtQ=;
        b=e8sEGC5EC8q/db3otouVycUslYDM0Ayycep+VAQndhZim/g0vvnwFj+RAr8M4casa9
         aCWNgbE1OvBwKLyq1kCTgXXqRllmB8a5urw4Fwks3CqTvsBUqntn3y3KDVa7ZhC4gnrF
         WhVKXeoW6IyE3jwNOBqfGrpbofljfLfGJQtADIPPe/r6Lq/i8M+LOD/jpGmiO/GVkcy0
         mTjfXe6JPe3JQ4ETkurxVpacRMqP918AoiriCc+dpHVqq6AnAVH55mz7Dwl/nwKMuygB
         0HlFZjqFnq/nJk9zKVIFKLyIdpz7IoQfvjWhym+YRZie/b6gsJsRpBLzLjq+ApfappiO
         h+6w==
X-Gm-Message-State: AOJu0Yw1odF0Vzd5exE6qLhpnWhxnG+iVAnINqJASfJJHatIbX4HjxTg
	cQVrp15wa6Jf3VT8nx3XDSkb90ipCB028DNtIaoRUm1DHen8i+x3IkCijSwPAwSBhjBiNNFbCfH
	idEGQ6i0UUoLTSAs+8mEJrozFDKIfq414S9cxJ+2UsxYBCSzPeMC4ny0Pkd+hl9w=
X-Gm-Gg: AY/fxX6DJKequo3CpIlh5eKsCSxTjp1gfj0XG1B+kIeV3xLEUkwfFgF7Hn2Eu/idI+e
	wXfijowfgmi8/s9NjASaW8lpqCkDGUMi49/Q6lHjhgMibtjBN4nWMgpyWmVsZjDa+S7CF+wdsjh
	3PDPRGulFwe9StvELWCFdkr6vvEq4RBNnScjKbd5plgSF2SlSQ4orW8dCoQcxzoBxkZG1um6FzW
	ObcWaPItU+gC+CR+XGSW58ZAKZF73/K2sc9xF7MHTRAoA9WXBHcRWRs7whjJgu3/MiFOx2Bm2Ku
	FUWAtSyADUB0ML0Fci0vitRvq69GbL0egnj5X2AuswHVIXM1yCQ0fhOmNTuiFqwiJoglTfuOIlI
	iLP0lyFAVkZyLR/UtvPfWmyVdaxy/lnsGSdAC4pQRMzpmBrYmFG5Yv03GqjG8MwSFz8nZD8uqX2
	HU
X-Received: by 2002:a05:701b:240f:b0:119:e569:f60d with SMTP id a92af1059eb24-121721ac0a6mr179725c88.6.1766082678581;
        Thu, 18 Dec 2025 10:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHOI3G1xkkhHSMBDjk/WgWlcfCBPb17ltbO/RhnXPiHqP8lwsGFivgQv7NyWc1JhaHgWHRpA==
X-Received: by 2002:a05:701b:240f:b0:119:e569:f60d with SMTP id a92af1059eb24-121721ac0a6mr179701c88.6.1766082677918;
        Thu, 18 Dec 2025 10:31:17 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm185460c88.5.2025.12.18.10.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 10:31:17 -0800 (PST)
Message-ID: <590f6b8a-02a2-4ec7-ae43-27b267f0cbff@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 10:31:16 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T80_5rL_mMZYVHUVYoYqOSJ18Z5oefbG
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=69444877 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RiReJqOkU6IqVSJkrfMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1MyBTYWx0ZWRfX687FP2WfBv7Q
 v5RvGomrfWxjoFtamSWgW+QvxlRn4d2j84Jqt4jgWhwxgRWwbVZaMJW/9R3rgdZvYvJLvZiLwJE
 OfB7cXfWvmSexYAoN3L3JA5yWlORXTT3yJuBKhjf5qOYnRQ2C+qtdhlfVQtTfGFTalwqV+tuvPF
 J1QLSsbyyd5WNmYJmbb3WV1DjQ6Shi00yWhT8EH2JKx53NQflWZhfIrEkMDkTU9UfSBWvZ/05MG
 6veXahLBzBiWdntzj4hNaDF/Gc14pRZjn6VimWyZ2eVdwkXP14x5SwgzwRjrY3Egrt2z+0i9npv
 pNVt3fK64K5oKXHqurjaFQ5Lz0gUqYre+7dm2fZqj1DRWMua2ILd8+qHxBJfS3WkycT6Iyq6St2
 uPexnJWP061DkWP7hgdFoKiOR04czw==
X-Proofpoint-GUID: T80_5rL_mMZYVHUVYoYqOSJ18Z5oefbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180153

On 12/1/2025 6:33 PM, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image is a non-standard ELF file that contains a single
> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> authentication requirement.
> 
> Current image format contains two sections in a single binary:
> - First 512KB: ELF header + SBL segments
> - Remaining: WLAN FW segments
> 
> The TME-L supported image format contains two sections with two elf
> headers in a single binary:
> - First 512KB: First ELF header + SBL segments
> - Remaining: Second ELF header + WLAN FW segments
> 
> Download behavior:
> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
>           2. Full image via BHIe
> 
> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> 
> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> supported image format. When set, MHI skips the first 512KB during WLAN FW
> download over BHIe as it is loaded in BHI phase.

FYI the consumer of this functionality is now available:

series:
https://lore.kernel.org/all/20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com

specific patch:
https://lore.kernel.org/all/20251218-ath12k-support-qcc2072-v1-11-87928cf8e547@oss.qualcomm.com/
