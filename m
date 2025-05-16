Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147BE16FF37
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408455; cv=none; b=izzoovnTW0qDVpj9y8Oke3YW2mKNJSZR1+jRCEMWEC+4eHsih7sIvmGN7sIFBJPFCtQ/1zRdhcj5Z/2EXJTIpkEdXa822WOwGLfqXobbEpVQdlFZJjKtLNaFcN79t9SadvqFo4Zx3v5pfl6ggX7JLwKcl0MZ8AiMvTgCPRTTknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408455; c=relaxed/simple;
	bh=ji2MsarXRrFl7yeae/YtYv1fow4jjJzCAdklKRqtHLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pv7nY2NfAifoX8HYJTmKjbnZJMHI9B3XYo0rkYC0L/fxrqKNnU9joy7cocgWYWpPCMLL8pNN5k2W9nwUCCsym5FQyUs3Ulw4x9dVhqaewLbg1eyIKkyZ23T1Y3FEwiHZsjhSXnlCj54NEE7J6QjbYakRqJmWWFRewzEAIPk4Woc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UftFdbHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UftFdbHh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBLsgp007955
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 15:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLu3+hjcuIIAuWnKsxLgTgUWpF3MmcU4WCdhzBMUVNQ=; b=UftFdbHhwRRRmK2R
	RSge/Cz5SardokvD2dv2h7OEJs5RtaI5Lw7S4UheU7f6PGsbgehXUeeqZKjfGhUU
	FKzbGHJOW5B+NmWxKPwIep+BsUitqrno1pvww82d400k6evr9FhXsWd8jkAyIWIz
	ApaEEYreYINieATWQbV+z4ZWHyVlo+2D30ojN8UIf7yJP3yq4S3o8pVPe7OfeOEN
	28uveYgRIutobtekJUEvRbewVYaVFycqYo63SQwQE0AGTHTIqWIl7azD/AhtY8fp
	1fwoZq7mUhCdmj3jKgyshJVtDpLbBGkKqNWlqd3hA7eYdGscVWpcx3ch1qTvbDkq
	6aen7Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq29yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 15:14:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742b6705a52so230073b3a.1
        for <mhi@lists.linux.dev>; Fri, 16 May 2025 08:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408452; x=1748013252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLu3+hjcuIIAuWnKsxLgTgUWpF3MmcU4WCdhzBMUVNQ=;
        b=lx1u33JTbmeiIqU37+hyodEOkGaVxrkAmIjlyAfAhrRZw5WO07l7M+xFWmUlQD053k
         S513PjwXYujFGEcqX/gR8aqDMwJSq02+NzQYNYjtIzgLlwczGqP5SeZn7sgCrVuR/X2v
         lQ/QYyVEkCLRJrBcXT8ehx8/GilRVmnRcF4OVXv/SR9Q9obGaiqRb+G1Nz4WFv99ryd+
         Y9qpHzv0149/bOjPm4SsHteEvncd/xUJYRmtRiUoP9/cv5VwOUX1B0BfzGun2zNhTEiq
         XN6b7uHzFca82zpU2uYNUifhPm/XoHd3vvJEPWaSQdKN8ixveEHdXJ0RjaV8Tqv1GUMq
         ZAbw==
X-Gm-Message-State: AOJu0YxG8Q/rDgdY7UtvSd1Yw2gsvP2p9puvSjUUCxisLS2hVblgJeIB
	6DKeDKO1Y1+zPz+TsdV1EESZtPGGKPO8eKgh9M7SR2g+3wV++EtgNdiO3WW1eyeAKXJPY2S5CLg
	lNsXlxbGpXSzAFMMRT+oXIWAH0x797dq44bo0lhI0In3bRDnPpUsfS+AkmixDKeM=
X-Gm-Gg: ASbGncssBgwG2LiDB1nrvRPSEAmhmBYor22hEP5mN9/MD6hlOzREbWIdHHUd1byvu61
	x1lUXTm6uzfuabUSJ9Hcmj6uryf35KMPRrzgkb0PAXH3C3YYGS93EFv47WBV677JsFngkar6XuW
	loC5bs4ziSQP1sH5f6WM8X4IgH0z+Wt1xGEb30kEVPgL+F/KExNDq8MrU0R4Gv8GYoB8LEnMUpp
	XpZbQc6T3z/gYiIu745ZWVp/T8zUqX7AqlmWvAHYfTbf26S2QJGpRQrG5JTx87xMAEWE0Exg3sK
	g+7CxHfsRYfSHg+MDmLka6dZqaaxxEZNGLrqdmhbEs6pD6mOsCWAiK//nCQTYA==
X-Received: by 2002:a17:903:2284:b0:22e:50fa:50d6 with SMTP id d9443c01a7336-231de3ae579mr37310355ad.37.1747408441562;
        Fri, 16 May 2025 08:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9PI7SUtWE9rx7ZEEoLHR4WZhmKY8xH8K9phfkI6WzyFtFIQ7RTKmuVc4in7kjhjWVvfhq2w==
X-Received: by 2002:a05:6a00:391a:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-742acd5115amr3981025b3a.18.1747408430066;
        Fri, 16 May 2025 08:13:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfa9dsm1702805b3a.10.2025.05.16.08.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:13:48 -0700 (PDT)
Message-ID: <fa6e5f45-a6d9-4f31-ab5a-7c47200a913c@oss.qualcomm.com>
Date: Fri, 16 May 2025 09:13:46 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: fix endianness of BHI vector table
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2pIIkiTVbpSVlZ5qZA877_OIUqaMk1nk
X-Proofpoint-ORIG-GUID: 2pIIkiTVbpSVlZ5qZA877_OIUqaMk1nk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0OCBTYWx0ZWRfXwqUdRd/LUFr5
 jgjPpayHtVw8Bbid7+syVJTEgOS9XCm4JRnCK0Fp+lAoyaTBrquRLO0UtK1PTu5Brx9bC9Flmxd
 z5KwrF+BYf4Gf6AibBM2kVPSSidfjpMKR0FW8nUOhOY+QXNA1v/LLOhdRCZeW6IcwPU++NWOh08
 V53QVjEUNMzKZa0uB05aZg7DEmV473WUcHl52q5JEBQXRCw1OmHXz+JN6FOrMnNKA19BkaSNj+X
 zyqHcwT2NXAvqn9OjIgV0GvPKxVbf7uA4K9I1W/SYT01vhcZDd+WjwY3b/l1rT+7Bqa+RQ16jsJ
 xWAPHCzwDQxwR1SYPermM4XybBhOYQicIh8WEg7VXao76z/KYnNgn7EUS6FFwj5cC1DapFcs5pA
 xQsKBp3FCf/AqgNZf/CrI6Gqb2lz6sbLLesh5cGNz4oaUKp2tCTqyHIVbEcMjTLunmDE6yKy
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68275645 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=mnqbBUabxhxt7vZsbGwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160148

On 5/15/2025 3:55 AM, Alexander Wilhelm wrote:
> On big endian platforms like PowerPC the DMA address and size are required
> to be swapped. Otherwise the MHI bus does not start properly. The following
> example shows the error messages by using qcn9274 wireless radio module
> with ath12k driver:
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

Fixes?

> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
