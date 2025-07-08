Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E91267B89
	for <mhi@lists.linux.dev>; Tue,  8 Jul 2025 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969752; cv=none; b=W6fvhfssHHfrY8XE4hZhLZGMFxQnRjkgXIfwJlK0H7P9q8YOwbsWpfE+PSnzibn1R0gSxvYXsF6dH7WqhYSU5S+xvvxHlVx4vxLkyDVHhlVhUoqN+4y4VkT4QSPiMJk1fsQme76MxX0Djh8sxoErcPacz8D5Qqka0c/zMuHXm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969752; c=relaxed/simple;
	bh=4ItLoeTx3HRyKDPaO+sh4Kd3sq4cOgELPmOoot4c30Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/3dsM63QcOyU/L0zk107+MLPqEpLk0g3MNqlL6gir+cHPuqwZu6OX+QZN1YskI4No4HH/GHA0ncmQcIfX/aPkXZk2HUjmS7dZNCgpTDbSKgQL2mgtV0Iva1GRxD2U+u0AUau1st8yuUExovuatAOX5W1UIPev8HR9j/MmyWtng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3k1vUVj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3k1vUVj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAGw9008320
	for <mhi@lists.linux.dev>; Tue, 8 Jul 2025 10:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAz8ZIHuo/SWeC7W3wizcPsD4EK5ykNZLoU6WzbK4q8=; b=Z3k1vUVja7wSnnnH
	IketGHiTgcMn3mY3jYohCNO+NLu0OEc70r83fThGNsYDQTR0ehReQXLYWJ8uGIt2
	WmaltGpHUiwLkIAIcNIQG+g67x6KooEIKbNfiHsE2of5ftzRhgUX4ru+7Sah8v0M
	zyvO1FcZ4trf1AvEQLHhcDIZCo+g3H1/uJOvK/edJEF5rB+JFDKm94Gn6BVkVWv/
	4tdYnf6ojHJ+cx3C3ACaoS4BYnU3ozlXQGHxamRdv2Hlk3aAuv4gO2u+g+sBs6uC
	/2vMCceBDTCaZZt15NJziT0oeKr4GQgLUy7aQkUVI5XQ+LP3w5/YIqfCGBSA52O8
	YztW0g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmvnhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Jul 2025 10:15:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso4045378a91.2
        for <mhi@lists.linux.dev>; Tue, 08 Jul 2025 03:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969749; x=1752574549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAz8ZIHuo/SWeC7W3wizcPsD4EK5ykNZLoU6WzbK4q8=;
        b=lyqoaZEXqIBf6URhwTRA55DuPZTCPxYmU9dxbBSlan7OwAAM4wA1eHxN21nTjAGe42
         RLqkD9iFm6IAJZrbnMZThWX4BT81gKkEA84/CSK+2HTRzfquWiM0wQnCqy18E1wC0LcM
         VxJe0Jb0QjbIU2b0vU8mZCPEF7Cj+F8WfTS76dtO3d/Qe2oHWgwWtbxyMXz0gclyhZEH
         4q8yKPuDbInzFpeIoxuhVamZ5XAfjsUcBCwPTIx41uVtayY9IoL6Uc2/o8No4NUAVv/G
         2E48rvhUmiAB1vFD+QuUyyAOG/Hmy3DchAoFAS6v5q9Tmtqz+yZ00nhcBwBv5NyQJGgB
         eMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXryB4KSQC+2aQ5znEJ9fMnNp6hii5kM9rPPfWGpLXFqh0UcUIqOJM3kp5Q4kDJ8CXiGB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyssZqfFvPCrH/uINC67DxQUUuP5bG8mS41vyUcCqOVKfTT7mXO
	pIyv5Dux/fd9TVwYO3ELp+fuo6kco4LJzuZL5Xem27+48s1bJSUvVpdpYePcHHtBHTIW4i7bQfN
	9Y7PX0wkFcEZWFdQKgtM6GvDfykysQ0A2CkN5PeIiGddeS3F9RBsydVA=
X-Gm-Gg: ASbGnctEY5GmU9oS8xZORRg7vBdTFHWmWtD2GGgqnxbKu6S80yyI8uYkKe/PC7FktpM
	1n1oFqG8+Q9btx6G06okXo1WaVuTsw6ddc7V0fa5fMXjSFl/iCZ6JQLeCRLquHWSvD+DoNrfpAa
	aXIK0+o33q/Z6aj9FyV+fBU7DaeW2GbrbCQWqskmFUYQNROkiwz2pgfwLSjlePneg9o1z+wlgea
	YXP/tt59ZjLu+skQhTBiHAjh7fDSZYFEwN8KWpYmt1krwQX/L7B8BtZsFTfEnuVpapyOI6WMT1o
	ldE7hwGZqUDWYOWGLDFYnzVwTwp7N7D61B587q0VchiLbbP58o1E
X-Received: by 2002:a17:90a:634a:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31c21cfbe1dmr2713729a91.13.1751969748731;
        Tue, 08 Jul 2025 03:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxrinOt6UxxB4i1n+mV0391ziMXD2TDdWIyM6jJWyQXxor+uM7US8wRj4S5OLlgpGL8Qo77g==
X-Received: by 2002:a17:90a:634a:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-31c21cfbe1dmr2713703a91.13.1751969748239;
        Tue, 08 Jul 2025 03:15:48 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c21d6797csm1746635a91.14.2025.07.08.03.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:15:47 -0700 (PDT)
Message-ID: <b72b3635-1c09-444f-98f5-30fcc219b297@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:45:39 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
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
 <20250630074330.253867-4-usama.anjum@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-4-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686cefd6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=bcI8x_0Kv5OOx9b6aR4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 6nHJS5JXO2h0llqirJ4SwFapSmGXFO-Q
X-Proofpoint-ORIG-GUID: 6nHJS5JXO2h0llqirJ4SwFapSmGXFO-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4NCBTYWx0ZWRfX1i9LCC9rNHfa
 lwSewg0vmw1GcbDAxHDnNOETpukbqGw3JV1UdXFQmgkCWzKqSwpjik49lU7z67ZpXtJLnUySK+A
 2eavCRmKUL6ipajDwE+BBcdePyjZ3K4g7WkpuTioTDKJTYSYYJ0Cb0cefLjTo0SOptqEtwp/Xkg
 ptLKDR2eh5biC9OX1AYUL2z+baKInUni/5L+2XRI3EYdLp8YvGNe8raJCCHeGRdtsMWFYJp+3Kl
 oXCjky9NjHITd9pu/NePKAZAQSFa4xp2AH4Le854rBjv71IgptcBLy4ck3rn3k8rrnBdi1PBYxn
 OztKNjSAQrDvXhTepHuxY6yv8rYzlPX8jh3VQNQlBjx1q/dNGqMPNKyBSFzj3DX6+oc3PkID2pq
 bz74PBgqKUQ6sFYTZinjZHYXI6HOgo4Xamqacx0z6COKOqxxtjT5N72VYBnNPtcE7v+Ju9xN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080084



On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize the device context while going into suspend or
> hibernation cycles. Otherwise the resume may fail if at resume time, the
> memory pressure is high and no dma memory is available.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   drivers/bus/mhi/host/init.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 2e0f18c939e68..8f56e73fdc42e 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1133,9 +1133,11 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>   
>   	mutex_lock(&mhi_cntrl->pm_mutex);
>   
> -	ret = mhi_init_dev_ctxt(mhi_cntrl);
mhi init dev ctxt also initializes the ring pointers to base value,
I think we should take care of them also ?

- Krishna Chaitanya.
> -	if (ret)
> -		goto error_dev_ctxt;
> +	if (!mhi_cntrl->mhi_ctxt) {
> +		ret = mhi_init_dev_ctxt(mhi_cntrl);
> +		if (ret)
> +			goto error_dev_ctxt;
> +	}
>   
>   	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
>   	if (ret) {
> @@ -1212,8 +1214,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>   {
>   	mhi_cntrl->bhi = NULL;
>   	mhi_cntrl->bhie = NULL;
> -
> -	__mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   
>   void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
> @@ -1234,6 +1234,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>   	}
>   
>   	mhi_deinit_dev_ctxt(mhi_cntrl);
> +	__mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
>   
