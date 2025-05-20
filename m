Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9A1E51FE
	for <mhi@lists.linux.dev>; Tue, 20 May 2025 04:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713847; cv=none; b=EIhcXYsubqpPmR5EPbMMMf+WYaD26t24HPEg09A7WfnAXR3+dUruS1OrBFPtI+Mb6vU+sqWnfFu9qVHbQXOjglIMZGQUQGTC+URwkFzr1U5j6P1OBF0CeDzYxAME/nwa3oHmRJrm3o29vt6vBMh1KgR6bYYVytR+VqmAlHSFNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713847; c=relaxed/simple;
	bh=KMb6HEc989YS4nvOynxObwK2sZg5PsL820yo8xKWB0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oftYivEsECT6rXNw0+mZ1rStppRnF/04ufa30pHwX/XHZbrVB0a4sj3ror0/Gp4grAiJ5ruakbl6A+qm+ZO7pSAkR4F5jiv20xy4YW+m0nmGPE2G2OfCM7MCok3ydkiJAGEzdsmdHfnFeOQj/gxdkYxq/H0IFv1cm0DYVziGhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzNNnOPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzNNnOPG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JNdSOi030732
	for <mhi@lists.linux.dev>; Tue, 20 May 2025 04:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+n9bkF0VD0V2oJ0zneDmypvwTmyRBfAOtjQDo3asjA=; b=MzNNnOPGPyV/g4gL
	Io3VpNxBw/F+jVACkQGvFl0/BXrvWr+zDY5nVInGTf8gLF6kI9JmgqpNIhvKW385
	/4dk0rIZDiP/AkSaJI/8ctqm/DlEUJ/u34ymu+XQVht8xG3xP/CVMbfJ97/sV2ty
	XtDRWnQQW1g0+2xV1/ZDKu8e5VfkbhqBMRLqQ/hKaOyP3IrDlszg/7/nopdJabSJ
	F/j0KWltPyd7FzKWqH7HicCnyYpNHTkWj/w697dOgfd20RcP4u/kqWoqc2EQTMQl
	4zq/i6ns5gO4SdSZMDxj/hYPx6IQ7VTz3SgH40qTZ/2bFLMH621ogpmrmaKabgO0
	cu+VIw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9xe3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 20 May 2025 04:04:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso3286534b3a.0
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 21:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713844; x=1748318644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+n9bkF0VD0V2oJ0zneDmypvwTmyRBfAOtjQDo3asjA=;
        b=CX2bliWPjWGoGuLO/jCMX3rJpSHbiKGNNUxqY9srr6mudzILKjm9/4rRR+vZEYc1BG
         pTk3JrJGEgMUZIkJiTvEgEUEAgRjuR2vh/diw9E2zLO0M41Jcuel1fL4vMJUK2ETeChV
         yqFMDzSb8IJqt3RMFwnP9bRRfheVCBVmOHqljsY6bsVpjqB9aaPUDMNpxVVkomZDzr8K
         sC3A7ANHYadq2QsiiPmQFFEwrvOjJB6xe6cDwR24zKdJEThN5f4ZtIOEnZQrCudXHSw9
         6Yu9+zyQwO+lW77PaxLOn37rtnJ2/8Uc9GW6sa+JrlW1g7XursTUbo7bTGYi+ymb8At7
         uDFA==
X-Forwarded-Encrypted: i=1; AJvYcCWeaYTTinUOfTQU6Q6vlrMDR8QiLlHghmvBOBxKfjLkAr7SgEyP4p37N/RndOyIdL8lNnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGdRfnfdXn4J4xd54KLYI0mNRIl6Y+mGH+SqszJJo9dM3v71P2
	EJ8LyjGqRycUNeq/S62LWHWb5GCbAJ4Y97A9JJ1x9d6rhAX/FD2W5FsUZr/EWUIpbcrnunOXiMU
	yfiLBPIafTmpR27Ki41xYMc0fRc/Rw0az4KRtlP7CUvwAIptbq6SrV8Y=
X-Gm-Gg: ASbGnctzfpv+eL+tu1OgLQefqFEkD+mG0YWf7fuudACKcW8g3GLk3fDyt2dtQi37z1K
	428zraW4nCrB92p1Zhgad7K/wOH6Ilga/07Z+eOVRxpTLl3fgzGQJIVbYPW4GAW6RbNphpqXyAh
	aPWZGPD1RZ7tc6fBEncIANOWrYkZqP7JPHBwLkUGoTy86dgLOlyqpFAXzE0kFqpBZnKP3AcyTpp
	g7/N2mLRacWVbDgzWCzUmCSHSDwVJC3gXzL1pzCZHufvMrjXK93Cf8smDHWK2fCmjdyTiKaL2xO
	0QDnmzL9ZTukvC3LS5FEYbgaeMw+H6X1pKyMFa6zDg==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr19341310b3a.4.1747713844019;
        Mon, 19 May 2025 21:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtuj7Wq5AEHuJuYXpcnavQTfMcYG2SpoMb7J/CFpeG/fY8muA2u1bn6wkzdg+/GXDT/INQfA==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr19341277b3a.4.1747713843631;
        Mon, 19 May 2025 21:04:03 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d777sm7243378b3a.68.2025.05.19.21.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:04:03 -0700 (PDT)
Message-ID: <48a98603-d2b0-c279-6b04-0c89baf32d05@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:34:00 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] bus: mhi: host: fix endianness of BHI vector table
Content-Language: en-US
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iXZj229Sh_BfTXUTJoyN-8kPbamFU4yw
X-Proofpoint-ORIG-GUID: iXZj229Sh_BfTXUTJoyN-8kPbamFU4yw
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682bff34 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=QTSRpw9t3mQaVZ-RB_kA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMSBTYWx0ZWRfX1+gsCrE2n7mA
 aB7S/ylp+Q13/X4lxRzTAyzl7Hgyy0D5aKHbUxoMho46ZMMhnSHgyI5MIOxEtMZfZ8aPsSxznv4
 fLzVNeD7hcOPX42czISGyRfmHxQIRWsXVt914r3A9dHlEnjdq817jAfkncbO09sZhosCSnyI5Po
 1oOJE8VNHkntTj9T3iideQk0UMcD2A/8xdcDuztQe5AMysJxdUCR7C4UbIntv9HD+njZjFAr3fV
 2InQ6nIWQKcEOlroBAj5a9go49tPcCfwUL+5JfOgVh1BkU5Xg7vrQPhVWaCN+NXs1TYzotjgsGR
 U85pZX2NPKPoXhzhcllu6DNFWVv0dHNpjYKuvxSVGFuGvRNs+y2WZ5lR72bjOn88Kq7B31osjsQ
 Ar0rRYhf3uIBg/q1HSueGw6d6pVQSomR2oyKd1SSfc73qe5oc/H60q82NQ9GxXjT2my2LGrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200031



On 5/19/2025 8:28 PM, Alexander Wilhelm wrote:
> On big endian platform like PowerPC the MHI bus does not start properly.
> The following example shows the error messages by using qcn9274 wireless
> radio module with ath12k driver:
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
> Fixes: 6cd330ae76ff ("bus: mhi: core: Add support for ringing channel/event ring doorbells")
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
>    - Set __le64 type for dma_addr and size.
> 
> Changes in v3:
>    - Improve the clarity of the commit message.
> 
> Changes in v4:
>    - Add missing fixes tag.
>    - Fix commit message character width.
> 
>   drivers/bus/mhi/host/boot.c     | 8 ++++----
>   drivers/bus/mhi/host/internal.h | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d..205d83ac069f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -31,8 +31,8 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>   	int ret;
>   
>   	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
> -		bhi_vec->dma_addr = mhi_buf->dma_addr;
> -		bhi_vec->size = mhi_buf->len;
> +		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
> +		bhi_vec->size = cpu_to_le64(mhi_buf->len);
>   	}
>   
>   	dev_dbg(dev, "BHIe programming for RDDM\n");
> @@ -431,8 +431,8 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>   	while (remainder) {
>   		to_cpy = min(remainder, mhi_buf->len);
>   		memcpy(mhi_buf->buf, buf, to_cpy);
> -		bhi_vec->dma_addr = mhi_buf->dma_addr;
> -		bhi_vec->size = to_cpy;
> +		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
> +		bhi_vec->size = cpu_to_le64(to_cpy);
>   
>   		buf += to_cpy;
>   		remainder -= to_cpy;
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index ce566f7d2e92..1dbc3f736161 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -25,8 +25,8 @@ struct mhi_ctxt {
>   };
>   
>   struct bhi_vec_entry {
> -	u64 dma_addr;
> -	u64 size;
> +	__le64 dma_addr;
> +	__le64 size;
>   };
>   
>   enum mhi_fw_load_type {
