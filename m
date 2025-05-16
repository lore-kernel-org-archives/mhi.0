Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E843192D97
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422536; cv=none; b=BYylFAIdanBP1D2JMsQySl95bxbdSk8JagVxvVjG6HyCycAqEZPMAEqcwlgt7MNNFW6HtpKrCUBvDVm1KzZkoltDl+Ssf/IvchMzsifzrjjB/Dd/fkoafXRTHkwmIyy3xgGqZQNdqw6VuMFKyVgIZ/voWo9O8IJYIXE4mSLGIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422536; c=relaxed/simple;
	bh=pxXpE/fZNq6yLvc52y7PdDeNl9o9v335j69UIWK1LFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r40hl5k0/iDT8quezZ5giHuQhtVOdYQjc6DdlGEpW1gN+cS4sDEoIHSbzh95Oh2tDYYeg6RhPM5+7mhxq/c2jEZNvK4tf45UGwE/7YER2s1fZHWDqXP6p698A+uBYaGBf1mfKkoEftdnlmxDU5vARgdRkkHXXAzmlsGpggusdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rh88UX7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rh88UX7x"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBpIbV014763
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 19:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1EJKheOMiPM9GqihfGtt+delr480OzcwQJk/CmfpTs=; b=Rh88UX7xz+3klM2w
	aTUXEORusMkVUL3WJQOOb3b2/WiVDz6HndDxyIzoyosIg9PJK2r6iH6H1BqCuadA
	1Fji2zptDczbA7437/kxynI4nB1ijYe1Y0XIebjYan5Wo/1/DUxCH1Fo62nLqG/R
	SsCBNDwHi6SUYkT1wMbs1R1k5/HwnVAe26DEVa18hh9heI513OIPktfYscrgIfyB
	8MzssdGq+f/9mo81ZGjp49Av5NU8nVLmEs62umkqCfoMDdgHvLejec4yRZA+cgS6
	AHOdZpAiFm5hKMlgNRsY3F5O1NcUfwsCHSoGon0To+vBlTZj9eAURzpV0sWg/n89
	yG2ZRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpk3rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 19:08:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e8aec4689so703751a91.0
        for <mhi@lists.linux.dev>; Fri, 16 May 2025 12:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422533; x=1748027333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1EJKheOMiPM9GqihfGtt+delr480OzcwQJk/CmfpTs=;
        b=fRWguG8qzlT3lnsTK/DMdikRIMa29fQ7rUaR/oR8CLxxHwkERyTC8oz1kHiqeQcXxD
         Te/SdgcGif38iKNMCYWsRio8N7acMT0HVm5Eo4++DsK1+oKlgR4HBCpp+wTg9IXm68OV
         igKelVi/BLfKdcH2cs64ABsYxzplpHpx2rJfyVPrCw39qTurhQQIaIWmie+qVURmsWCL
         dOp47vKMMRnTrwDV3nGhHFjoK8BIFiLk4gNyKTMRgJXCgl9DYwXjnXalK58rLlp9RcvC
         GaMF7d/CilCK4YZe6t1fUZy4xR3Lgr1n+6El4Cq+2e/uLC1htB1UNA2gVbtPJqKU3AqP
         d30Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwOs3XdixYrC0lBP+Yh4fqf2iO+sK/z++6AuheqZESvwQnC6SgjcRRYDG/sdGeHkYUk5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJb1S14PiRgCx5APPemyhhvm556txKfsSxDx7j9IBaKbhj8CWk
	280fPArpEs9+8HsOrPNaA484r1zvhwrQD+SAtN1dvc4YXU8lx3tDkzgMvf58aqUdtIkEgNITRuZ
	E3f5exvAu0om5fgXWZAx22luNrbFsru5SE9ZkpQIJUE8H3MfxcT3+xlY=
X-Gm-Gg: ASbGncsigWZUUymJgHbbeOqEvljrzvMUShLtNrW6UaoR+Hr2AAUP7XdquTICOWTJhUg
	B8ZjR4RgQqyrT4BtP+MZYnHdgQYiu5JdJqFAv8txVUsm7LFaClnnAb0zbVBDcnlyZLRsA9cNGwP
	3P1s/igM2GOAhEUgZzTEqeEFCcwmaVUNrGmy8a/58OWV+VT9gEDod52+tac7N75ONmsT+Dj3zGF
	qGe7NGXpgut0E3tQZMJBebwf/Kci5sDCOlmAYsAMM6zYV7D7K/dYpIwwmRm3XbHdzDX7v8gkYPC
	E5l84qMHAkPf8ND8DeyHismTziLWsMeh6d7sKNHEhgHqOXiek9lWuRKkgx9dwQ==
X-Received: by 2002:a17:90b:1dd1:b0:30c:5255:ffd6 with SMTP id 98e67ed59e1d1-30e7d4f4016mr6537231a91.6.1747422533665;
        Fri, 16 May 2025 12:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjCoMdR7R7xPNjV/d+MGNlVvf+FoMIYIPH77AH2OP/4hldS1ZVPlxtnh5tCoi/7JYkYDA0OQ==
X-Received: by 2002:a17:90b:1dd1:b0:30c:5255:ffd6 with SMTP id 98e67ed59e1d1-30e7d4f4016mr6537202a91.6.1747422533311;
        Fri, 16 May 2025 12:08:53 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334fb87dsm5537527a91.47.2025.05.16.12.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:08:52 -0700 (PDT)
Message-ID: <7fa413b1-99ee-4f60-b458-cce2a2bca388@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:08:49 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>,
        Carl Vanderlip <quic_carlv@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kunwu Chan <chentao@kylinos.cn>,
        "Dr. David Alan Gilbert"
 <linux@treblig.org>,
        Troy Hanson <quic_thanson@quicinc.com>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250516184952.878726-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250516184952.878726-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UjRpz_bKrwA-2v4Qf7NfRdgAw-LcjYhI
X-Proofpoint-ORIG-GUID: UjRpz_bKrwA-2v4Qf7NfRdgAw-LcjYhI
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68278d46 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=uZSOL5_7EVOPlFl7amgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4OCBTYWx0ZWRfX+bFkz117f8gD
 DSqAYVKGfrtEP49QzYRYKDUDrPpn94e4QyuYOMCWMvpYtfLrDhRPxpGZZffETdaml9iY0gSScQr
 bQ6K9t3V8HEeg7H+pyE4kPMlw8u7+M2wAa2Z4rFOMFPJxhdm1WfMf/iHpX10RQV1+UFuQnGITAN
 1hXBtVZPyai+AKKMApS+Stll9TcENjLcMDkZdcx4F6dwzmtJ2sVDjTR509aNOTsQV8XEedXipef
 2rohPlrl1W9h5td+tVPuRfhYaqZ+EFKF5waJWW1VYuhjcQrJPhXyHXmLzwviRTcqGAhRWl27m3b
 DV9r11B6mfQC0UlZXBLOhLt5p054gnCxpgTO0XweJmY/YU+SG0Oq74xaTkzTbiNTP4+Ug5WH4us
 z72MswMc0xu5h34wvW0yKHG8CKRdZlzX5+dxMxf7Fh3NDLyKdiG7AchHUX29O/LDzhmwsTgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160188

On 5/16/2025 12:49 PM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> Optimize the rddm and fbc bhie allocations. The rddm is of constant
> size for a given hardware. While the fbc_image size depends on the
> firmware. If the firmware changes, we'll free and allocate new memory
> for it. This patch is motivated from the ath12k [1] and ath11k [2]
> patches. They don't free the memory and reuse the same memory if new
> size is same. The firmware caching hasn't been implemented for the
> drivers other than in the nouveau. (The changing of firmware isn't
> tested/supported for wireless drivers. But let's follow the example
> patches here.)
> 
> [1] https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2] https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

I think we are in a good spot now.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
