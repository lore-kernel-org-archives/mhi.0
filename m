Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A338C423
	for <mhi@lists.linux.dev>; Tue, 22 Sep 2026 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790050364; cv=none; b=nv/zF9lqpAR3rduUrgfFXKP8mJf47bn+hNVgoGbSVdWzNU8GxWSKZPl6tsmNlt4/v6rXrWVihAwQUJwg2VQ+sNK7VoP/U+nBJEfzUbM6usK5yKuywLAMDwpFccm4+/RJ93qRDwqPOxDLt/VkOjGzPDvJCIqvB/bc0T1WY5hJ6sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790050364; c=relaxed/simple;
	bh=RzHlk1F7njUH3BgeWZu92hSI239VbS2Vo6YeX7lNdpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqXFyL51w7LrhusuWg6RYlbt8rRlyG4uIwVwxOUMx76daGtmPX427yBT1fsWOKP3HughNrjynug4+6L2hxkX59C/cSuwsNGPCovrlUtEe9MRraPK8uCNnKKu20uLdyj0r2WEha3Iq0Z0sWDXuGR9wM2gRsDduA2rzAEZCY0A3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNZwFpqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ES5FKk2D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNZwFpqp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES5FKk2D"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00l9S2579582
	for <mhi@lists.linux.dev>; Tue, 22 Sep 2026 04:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXuMM402ka7tQl6eLpbXtaICayqC6t/BPuRsu7V4a7s=; b=PNZwFpqp4hwV5iMM
	hJRHOjFwSF80gz6kbf6051TWuk5p0d0ki/PZMoYvPf1g180Q+Mhv26os0zfuXEY5
	GmMbtkIClmU2bIm8NVmrGtd7s/nkaU8rS7uNDzGBTQlqyp7E20mvdnh9DO2+emXw
	dKUTu7GQV9HazhBed7Y0Vh2bw/Ot6FNchICCC9kbtGpQNgv1gvjKBphG5g+cX0u/
	VTLESnp7UbUaD20hIux8zJVuoLlAouneENqaBbdnxek5ddu3wOjHQMHh0bBVHssQ
	whtJOkr3dNg11oZYW5mRmyZESKjh4kw55872QzLHUHxxk5MrC9x/1HgpXoIl0GGo
	2j4j9A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub329gx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 22 Sep 2026 04:12:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so4497936a91.0
        for <mhi@lists.linux.dev>; Mon, 21 Sep 2026 21:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790050360; x=1790655160; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mXuMM402ka7tQl6eLpbXtaICayqC6t/BPuRsu7V4a7s=;
        b=ES5FKk2DPtkrKBfh4lKuwfLAUumC/QDVtFQfp5tB2Rm4lxUtM6xEoaepeDcRxAM+vD
         MMNbxPns9Yeyop3eoidjjtW+6AwpeQULCgqQOzH4b+ETbOQ62LTwvel/XYyV0It2/Za9
         ejhK9FMk0Lr6L81q6KYWcxxtRIREhKL/6fazrj3VzTVH0DJd2UEMBMaGdFlRlZVRGWxM
         X4bgwIJhPJa0k0JqyCu2yPtkqRaLX4UxKk1ftu0UU+AhnbWpINvfLN+AlY4VcgZPV4nK
         6FMsjpKVP1XgyymmzZBsgacSPOVCmMYxD7Kb4mOsgEgTL+k5s+1OvwswBaGRkp+T+3b7
         GVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790050360; x=1790655160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXuMM402ka7tQl6eLpbXtaICayqC6t/BPuRsu7V4a7s=;
        b=FBvFp2bxXfDN3/r0Sm5TjiKokVtIHqfAoAcPtfW6jmYPaLLxV402CjgQnmzS0g3a4y
         RSpFM9de4kVgFj1EqiETjOyQrve9xH06VKPGlEWPzuFLcFX0vOVcHSbCDsInUl0iKo18
         huS+ZX/2pCY/v5r9GgOZWTUTmyvMGg7TGsJUwVjI3hq7d+atTOqttbPGRgJqoTa0zgP8
         44UCZrPHLWE+upW68v9GdbS/ZKBvGBFYuX6SAfjwVErFnfj3/FzI3IynCc8MMSI5DRYe
         9465aUFOmMbJDAuRhoP+aCkJIAfvmR6BO8tNJpwN8tTAbR01ypnOkQ2n4q+vRkQVEFtJ
         q7aA==
X-Gm-Message-State: AFuF++k1omyOyhsbuFFkkSiuhE8UEWU/6D+Er5zRh8splQcgTDL1tWOM
	Px7Njz2BXzEO59McLMZ94bMwoJQ7vth0pJ1tLc3UOkvlXr73JfdSX4TOK4FJt4k9OD8zN7G1o1e
	9lO3axUaJQ4Vx7yKsPmmDerRmwCYSlD6C0y+/BowhdSwE9ezRrqrnRKw=
X-Gm-Gg: AYBFou134Hf2gaY/TMooIo1cNC+8HYGci2if6KYupS1OrnJ3OEFfz/0b0iA7D01+5CH
	vakAm77Ly477aNdp0+ctI594fKEtuPHnmk1MRT6f5GmXBTF8QdNxOhkymnQeqWy1M+81gYZegTb
	HoSTmQzPMuULNoDsRD4Ek/YKFfkvkGQruEthvJjnKLsATZENiE+YcpIyFcVjEH3v3NaDQa3ydaW
	AOY8GEAbhwd899XMrqsLxdRCp5T74ak1vitgtMRAwv1QVJR4EwAL6/RsQbk+uDkA5R2wuoSxIis
	9jMnldfvAliKXJ1/ou1oUEbwB7ceTbIrg0xw1izp/YG+NPVs3VmXYyLWgV5guXXiie+NaA4oXzF
	Uzfo8Zu0+0rWlKz+g7BO1uJHgaPpQ0I2J
X-Received: by 2002:a17:90a:c49:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-39e6c6a54ecmr8967700a91.67.1790050360409;
        Mon, 21 Sep 2026 21:12:40 -0700 (PDT)
X-Received: by 2002:a17:90a:c49:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-39e6c6a54ecmr8967674a91.67.1790050359872;
        Mon, 21 Sep 2026 21:12:39 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a504a2sm1176446c88.14.2026.09.21.21.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 21:12:39 -0700 (PDT)
Message-ID: <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:42:35 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay
 customized support
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org,
        jeff.hugo@oss.qualcomm.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919095506.9570-1-slark_xiao@163.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260919095506.9570-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab20039 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=ErJ0Kj0kYxbwwNmegfYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 5aLOLocP4DTMq88rE_6JTTs7n7MGTFFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1NyBTYWx0ZWRfX0y6CMDLKsXw9
 KmNqHR46crQpOLSIlnpmTSOaKYJ96HXl0STBq+kRwm4+THZA497GaTdRbiZN525hn0pSfjK5Z0B
 qmwr0L3dZHQUwPv4h1dwGP7AkX94yQJp3QDWxLyz3T1oU/rGv+gsCu1mDAWPfOUXOyJuGyk+YRY
 HVaZBgy9/LFeCrvqmtAJPYXuEOV7SGe+XRPunRao92YggytGnnTdYVZjJ3QRc0F6c4mqQ5RBH9D
 5m9mmdu8dYk+TO3/N7j2nyPNx0BI4QHowzn8kw71JVuZAlbDdlDmvE9uMlUVKAw4z1GEGSLdZF7
 sKp/DyhKOPsYcUAAVwZLImec9IhNHP2J0zxTDGEEYw9OtgbnPXJO2oY5dBFZxFE9dBWjgSy/Tkl
 SJAZuloqFbvoKhJ7eyE+ngy9ntbwtEx1fBlWgUxA0oqkdY8gvOOKL7fXu02qFF/mfKEe/zc3rjH
 pz0g70n03oYyoQMSa2w==
X-Proofpoint-GUID: 5aLOLocP4DTMq88rE_6JTTs7n7MGTFFU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1NyBTYWx0ZWRfX/fCJ9XTqgcPO
 ckIY4CJhwbvkUDWBcvzqV7mRTSYYfrcjy7s3vPJZ/m/pLjoKgY2fhQiScL7wnkTAKBbz82aNkT3
 UexFd5XIo0V9LJRW3PZi3rxLFuV3YBU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220057



On 9/19/2026 3:25 PM, Slark Xiao wrote:
> For some WWAN device, it may get a SYS ERROR issue when resuming
> from suspend state frequently. Refer to the Qualcomm Windows
> driver, the default value of autosuspend_delay_ms is set as 5000
> ms. But in Linux side, all WWAN device were set as 2000ms. We
> tried to set this value to 5000ms and we can get a positive test
> result.
>
> So we add a support to allow vendor to set a difference value for
> specific WWAN device.
you can change auto suspend delay from sysfs, please use that way instead of
doing in the driver.

- Krishna Chaitanya.
> BTW, based on the principle of structure alignment, I moved the
> location of 'trigger_edl'.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index b636e2c23b4d..3339b9b2d16d 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -23,6 +23,8 @@
>  
>  #define HEALTH_CHECK_PERIOD (HZ * 2)
>  
> +#define AUTOSUSPEND_DELAY_MS 2000
> +
>  /* PCI VID definitions */
>  #define PCI_VENDOR_ID_THALES	0x1269
>  #define PCI_VENDOR_ID_QUECTEL	0x1eac
> @@ -38,11 +40,12 @@
>   * @name: name of the PCI module
>   * @fw: firmware path (if any)
>   * @edl: emergency download mode firmware path (if any)
> - * @edl_trigger: capable of triggering EDL mode in the device (if supported)
>   * @bar_num: PCI base address register to use for MHI MMIO register space
>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
>   * @vf_dma_data_width: DMA transfer word size for VF's (optional)
>   * @mru_default: default MRU size for MBIM network packets
> + * @autosuspend_delay: customized autosuspend_delay_ms value for specific mhi device
> + * @edl_trigger: capable of triggering EDL mode in the device (if supported)
>   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>   *		   of inband wake support (such as sdx24)
>   * @no_m3: M3 not supported
> @@ -54,11 +57,12 @@ struct mhi_pci_dev_info {
>  	const char *name;
>  	const char *fw;
>  	const char *edl;
> -	bool edl_trigger;
>  	unsigned int bar_num;
>  	unsigned int dma_data_width;
>  	unsigned int vf_dma_data_width;
>  	unsigned int mru_default;
> +	unsigned int autosuspend_delay;
> +	bool edl_trigger;
>  	bool sideband_wake;
>  	bool no_m3;
>  	bool reset_on_remove;
> @@ -1369,6 +1373,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct mhi_pci_device *mhi_pdev;
>  	struct mhi_controller *mhi_cntrl;
>  	unsigned int dma_data_width;
> +	unsigned int autosuspend_delay;
>  	int err;
>  
>  	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> @@ -1394,6 +1399,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	dma_data_width = (pdev->is_virtfn && info->vf_dma_data_width) ?
>  			  info->vf_dma_data_width : info->dma_data_width;
>  
> +	autosuspend_delay = info->autosuspend_delay ? info->autosuspend_delay :
> +			  AUTOSUSPEND_DELAY_MS;
> +
>  	mhi_cntrl->cntrl_dev = &pdev->dev;
>  	mhi_cntrl->iova_start = 0;
>  	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(dma_data_width);
> @@ -1463,7 +1471,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
>  	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> -		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, autosuspend_delay);
>  		pm_runtime_use_autosuspend(&pdev->dev);
>  		pm_runtime_mark_last_busy(&pdev->dev);
>  		pm_runtime_put_noidle(&pdev->dev);

