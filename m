Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4D277003
	for <mhi@lists.linux.dev>; Tue,  1 Jul 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381376; cv=none; b=obMLM2QA6jPdDL/F6Y6bZ22UV4yeMmDJ1FYstAovORhsYYjnULWFldBroKTdkCIRSnL6uyzVjBeBi6GLN5y1Zscho+vEinXvYVxxqJHwpKu1yBr4T7NUScZnqzxS0T0X/YFGaNg/kwvNPTM+hnDRhMVzk4zpv3vmU5Mshed9mcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381376; c=relaxed/simple;
	bh=e8cofJFzf1imC1xcaAYUYmQi7KXDT/mVIdcDBWP3M8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0oxjy7+Z+fOJk90v6mN0NLKgOa9i7Ii48TbVAbzjms43O9Hvg+SsdMiHIVViSrD98GWZNRPzvOdwaicQnd90iL0AB8vBNkrqpHqxwYIh2NqA2thoNs8NQuOMblOev18FbD6XGZPzrdJwRPLWVZ18IRdTDX62PENHapGuHEsngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUEXXjWR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUEXXjWR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561EHoqN010475
	for <mhi@lists.linux.dev>; Tue, 1 Jul 2025 14:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=; b=kUEXXjWRWGbQa9Qr
	r003MGh6bnCm/U9M6kQDeZMtgTiFPgdiyzAxD/uqG0MkynGqevwcoXh6SnT5nM4O
	TJRcpGDH6GCbbUN/R3l4ReqRfSmbecTz3FyiaUCYkA42H+vqZR7IdkCSEdgp2eme
	QSm2NMRKJjpj2S7RL3m10Xrw42NuUrb0E3zW8lbv3bVztyRNgT9ERSexM9AEfQel
	pUgezVzsK5OirGkybTbMz6flVssAKmep+jmdCn48johrd2u26d0aW4GK0Zq7qS4J
	2cZ2Yoojq1GoG8wGU8yZHFk1Pzs19Aeg1hXXnG9qjDIGzP7XxiT2rflPjRGwLWtR
	festrw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm98g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 01 Jul 2025 14:49:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23507382e64so30420755ad.2
        for <mhi@lists.linux.dev>; Tue, 01 Jul 2025 07:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381372; x=1751986172;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGmB+YfykJEgHd/lXi7FY+QDtnoGkDNaBJlLAV3kCVQ=;
        b=A6bAfpw8YdX2BXUmrSNCYzIlCIVQnnR0TBH1Xna0uF+SjfvQWC9PHzYfbS3fUgREm7
         lMtsaB+DRRIx9NZym5fAZuRe4FPtsmx4sLvQYSfuJvA0GYLAIm/rlkxZzn/FLJXWce7s
         Bx0jxMDHHRs4a28M2PCqx3z4wwVpQltaejrrJpEMWN/g4jyI3GRIjquh2CPHfdlXBUKt
         ftB1qAdQIJTrZpMaR8dwHOOA3Df33oFiqL5lAj0HFfgbjdGDHA1PTPuXe6OvoU6p3Tyx
         4GFEPNXK021lnE/B8PMw0XCnS5r49G5Q5UxOfAQwTDv3C4siP2Dx6ptqLd3mnGShvd23
         ZeVA==
X-Forwarded-Encrypted: i=1; AJvYcCWxwRRC8u21VZd39ji/j71yUx1Cs12QrWuvgG6Apr6zTee50auVqVdZ0sSLtVXVyqrZanY=@lists.linux.dev
X-Gm-Message-State: AOJu0YydxVJ34NBOzvOR21obDW4PamWvQYQkrTSGxe9OJYK0XkWauooj
	xY1fqSaqbj9ZswBCeJi5G3z6fvtgHrWMUYbYK9KgVGncI7b+Y2cu2TPMMpPgdYlV1qfWCHBwQbV
	w+1Mpq/ADfpa1ebev561ieUISauRtzsAGhB3Tvbu/o3fCowzihh/yG2Y=
X-Gm-Gg: ASbGncvwyayCui/ZL4iox6R2yTzNteOsc3B4+uxMcf30mxwHZTuk/hMnWWe17sWzDFH
	Htx7WNdtsBuSGRGWYdDG82B+EpfVSvkYIFquARoCV1sqyn6vwnZ1e1iSADSsO2h1DjefyMGaeon
	rW2ILTmi5/zmMsEPYfQIa//+KdXBiWohnz3RZLnfLVf2LLYlp/yQ+60CxZDfe8q1J0j6yb72+ZU
	D7i0aSKRxCqJ7+Gam0Btq+3OyMZYbDU/KBKtpdPX/6v1KckLcZ/MUTohi2dU0fKbGyfdTr269Az
	Aw9jfJJJRLUJm8fUL42X6TnfBfmhM1zGvjACn6fpfDPP87gV9uINZJ0Hew6v63yAnBosoMCHao8
	OZt9xeAnGla89J0Y=
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303424325ad.40.1751381371763;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp1Ad/hhib51T+HK2hWQlQ5i/UENf7EU+ytKDeILLwtSvTV3KWZcptdDryg6BFVQuicGgoIA==
X-Received: by 2002:a17:903:2ece:b0:236:9dd9:b75d with SMTP id d9443c01a7336-23ac4606753mr303423845ad.40.1751381371312;
        Tue, 01 Jul 2025 07:49:31 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b001csm106117515ad.154.2025.07.01.07.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:49:30 -0700 (PDT)
Message-ID: <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 07:49:27 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6863f57d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=IWbF6JPFI0dN2yP9E1IA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: ki3ey4_Vgtqw_6wIErckoDriLgn8Ex1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA5NyBTYWx0ZWRfX2n3cYxqMCIFb
 tiiIco5NIaYQQDF0tiLyXhiyUMuXieE/gnEXIb8AtzkEfWUcGSInaYQkXnFaiVXW/DVUbXq8DJY
 Ql1iYaxUVKUfLFqSFpnmfG/O6Zn6cSTj+cdRh2QOQJeHIwlCLL319Vi3bwHMG0cRLfSde0tMfyS
 32D9d+IsLtV9JEkNBECflPem/8euojHJVZx6L9YicDUbAeozYGuneZ4GRTwMDuGzcFNZoMS3y23
 /qhCNjIGvElwZvFJo08KfbWuZlCD93HCdsJkAsLDl2iACk9q9U6DTGOuELi3C9xyF+mUBHnSIwS
 sHnsDGNRkt5Hmp0CxegmkTOP9UIhXbUzAezpRNEQCEC1EKAD9gGrW9eDLEIjcsvYQ47k2aGZYS7
 tl1AiCXQ9zV5gNnjCjAPKe6XixJAWG9DYkR6wKLLy3a+/ZJ/NrFHl8peEZu4T63+pVDd5mhF
X-Proofpoint-GUID: ki3ey4_Vgtqw_6wIErckoDriLgn8Ex1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010097

On 6/30/2025 12:43 AM, Muhammad Usama Anjum wrote:

Subject has incorrect prefix, should be "wifi: ath11k: "

And ideally it should mention HAL SRNG since it is specific to that allocation

> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

not quite the right format since it is missing hw version and bus

> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 4488e4cdc5e9e..bc4930fe6a367 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -
>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);

does this patch have any dependency upon the 1/3 patch?
if not, then it should be sent separately since it should go through the ath
tree instead of through the mhi tree.

/jeff
