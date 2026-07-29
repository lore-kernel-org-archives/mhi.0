Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395853A641C
	for <mhi@lists.linux.dev>; Wed, 29 Jul 2026 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359226; cv=none; b=ULnXl2EfOlXGZ+yodkFuTCZLPoFpS6jUBAlq1/Qpw7B0gq3PAHFp9KadB/aOeLaGv/6sKWV9izBz/dAvZx6TXoNb+UXIQArTndBz6RSmiWksqoA0/n1Ac1+jOm964Q9ozyUDsVPT39dIWBR9wtO+VbIVTdnTj89pmZGtIci3X4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359226; c=relaxed/simple;
	bh=Xw/5ZltwCtw3AUoZIF/AG/UvNI1OOm1dwK4rjeX3slo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f48IAXpFxgp8t83WJnl08yTQPPnUE25a60dnil+deK1eOLx6k9JG0SU9WDXAIIM+Xr9uh3R3zylYdg7HApOt2qjRSbNuKhEg7DEQB6/Y8fBlGMlKMHxLL21dNDMB9fNnzvOgNAd8p92JujtHAvNH+K7BoSJIpxT/T8Qnu7s97dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pujv7Uq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yi1q/yRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pujv7Uq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yi1q/yRD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TL5cF82775926
	for <mhi@lists.linux.dev>; Wed, 29 Jul 2026 21:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuWF9stGyUCSIAWOWqLbaSKdFKVMhyVOXirq6Nin1i0=; b=pujv7Uq7ruBhfF1t
	TTbOYnX7Rn/pqdmFLJNmUKjBX8N6XRmR9Xt9AjTa0lio1+I1mTUTgFlByd6DOHhH
	A01A7E3eRZdTjQoe0kxAZBfdZ1LvLxOP34dYmR+MQRlsP3H68hPhHiD7OSXT2anq
	fUxQJEI+MDwt9Wk6iXeqo5gqIBQPln7nXjpfPn9/yfVZXIEWCaX/31cHHtxQg7Ff
	JxlL/598jS0+Re8VV50aKl9QIFLwRVbv3teAqGJISnsS6FnzNd03xnmfiM+dzzSn
	rIXJlwb5p5bptvSHqjypp9FkKUYUq6P1bgULYsZfKvlTnWpA40kThwPerP1RRqj8
	J6NmZA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqs2580w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 29 Jul 2026 21:07:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1511632a12.0
        for <mhi@lists.linux.dev>; Wed, 29 Jul 2026 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785359223; x=1785964023; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuWF9stGyUCSIAWOWqLbaSKdFKVMhyVOXirq6Nin1i0=;
        b=Yi1q/yRDX7Icch+rY5GrD3gEFgc5JhCbLE7VbYWfEKchFym9ZYmTkXAqEHsFvGj6fa
         VhB3+KPPiDsiJp0IPDgai9XA3rn0+OQTJpd9oSVqEs8UUzurISinj/x/TRdKv+S55iPC
         y6PVFUR7Pm/S5wtBua0ra47vm3cPzFtzJx6GGhPxe/+piITcAI8qDB8fFNOiQ56cJSHC
         iZL5zx6h1PXE6z7O9TZwoqFaPVds93Y0fp9dZj36yPh5VwqRFa0ii5ePFSBsfC0eCZiS
         bS1fbeBjfL1gLR5+EuZDzLjy/N0CJbKqPdxwlG4SVleZ9COU5AD2QedppJ1ontay1psI
         vqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359223; x=1785964023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuWF9stGyUCSIAWOWqLbaSKdFKVMhyVOXirq6Nin1i0=;
        b=TrhA5wHGdfJNkgTu6xOnIXkyHKySUvvM57O6P1QU+xqEUxHDVVIkC7/9is8k2n6q2+
         tEfTo+GEkyyjo46VhI+G3AnZST9e0YADAIl2lgw/2yMQUI7GlFwOSBBMUxcUSDkvmVb7
         VndC1fBp7qbdWY6w+3esfpm4ml/KgUD/XOGCfuF9Y3ubZvsOtayFZqyUKdW8ZEwH+oBE
         j8xq5IT3rkbEfS8vZvdqfCb0tRbnzFGn1ca5LTJRlTdbMwctqm/lFn/1LBIH7ZCjywgC
         L2Z5cXYechE4v+nSavN0I5T7TG6rAQLyegYLVaYTrUSRjTATruhkA/N8oJgpyH/3pBg8
         TNZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwsU8Wj9TRhTswL2LWAFJUnT50YR44Z1Ca2u5tOzwpn+d2xBPHfEz/hh9GSk3Iz4YQ2SM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFwH0vqqmgt+xws8bHwjksy5uX+YMrKQqrERoSc1A4Gjh6y9fi
	WLkUGzKS7QwudVHt7PDeylmScvV9q1VBZ0bkwieOQmUcmCeQUE8DgUq+ZKsfgNK+PiZw8vxlAB/
	Yw/ph/X2jultxaMxOuX6++LUbVKkt1Fs7UhfZ00bcVb6uV3TTBCIk1dfdq3zsVY4=
X-Gm-Gg: AR+sD13x9D+OBaeXKcr4hmwAMJj4rmfR6Kr14mick30Y8Mq/yESGDqyEqzpca1pbSe4
	TjaonObE3hJtvOyLQv/OCvlSrQnE5/btycBU8yZjQaa8nzL6kvQHMHqfhJVwD8jXZto+gGfXyAR
	PpmhvzV+1yUnkchKP0W3GcUxuk79zA2p8QZ/5nKleUKD4CxK797pN4OusHlADxsG3rZpAO2gZgU
	FGFdkOJzdMi7Dn8Qc4c3C8nsmQcdb2L/8txmyk4/Opd33wI9tXMt1FFgGyS+XjyIp2rVmvyjeyA
	zXV6pvC51+apXH3tW+qMb747H95/NHbVFA6At1mqem1wyvRwlnrEz1nFamplkDVCzKfcjCK6a/h
	u1Qh0tgMwnqgDiQfT0mD8zXIshLpaS5d00R76agk4cqwa/lAvtBLoJQ==
X-Received: by 2002:a05:6a21:6009:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3c8aaf8d31fmr10052343637.10.1785359222982;
        Wed, 29 Jul 2026 14:07:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:6009:b0:3c3:f371:1ea9 with SMTP id adf61e73a8af0-3c8aaf8d31fmr10052303637.10.1785359222450;
        Wed, 29 Jul 2026 14:07:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm24048005eec.22.2026.07.29.14.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 14:07:02 -0700 (PDT)
Message-ID: <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:07:00 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mani@kernel.org, mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Williamson <alex@shazbot.org>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1OSBTYWx0ZWRfXx8yD0+MOcpuh
 WkrQMqIHxa+/PrO2P5hupEfiSn2j+H0AjsaMcJFFGPwFJYmH3mwJ60Q2sZiM+6/elot6CKPWH8U
 zo1H/MDt1Gq0UPgMB356G+8bhEP9x8U=
X-Authority-Analysis: v=2.4 cv=L/AtheT8 c=1 sm=1 tr=0 ts=6a6a6b78 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=nEv132rEWRdaR2lrs_cA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1OSBTYWx0ZWRfXwQ7O4t/5xC/D
 CaI9EBh+7s5H0nu9eAE1QeaUxTeVD116ofxjNV1+/BTU0ffNOg66Lsemb7tO+mnJisztsVXb3pX
 QTtccqYBfSn0Vd8B2NdcOhpEew/2p2Bgk/ychb8Vqz5TG959dD3IACWirdZfEVtPR19svboqQKd
 BumvWpSrcWgbCylm5bSWP/2tpGqgEcywA8csU7wM/J8qeDook8YMTL6SEFfDjUu4eWDYiib2SVy
 3cl8RQ1HjS+8AbO2lYbQsu1suk6GuP3acsHdae90qjwS8grLCwtF1f5y535XgOqTMaq2cYuW9hg
 xnHZj7/SCUf3oxmEp6iRLhGGi45/AmylbfIWesubOlH/uFewb85HP3YdidMTRcvQ/k0nMTs8LfV
 94bGYP7EpoofOAvf/wANe/yKAqqX3qLxDR6O0eY+HuMbnRTbLfUjlcbYk3K7s8Yo/iZ304QLZiv
 jR83nir8hYjS6XG9ADg==
X-Proofpoint-ORIG-GUID: NKt-kt0trO_x_4H7UUxluh6x1XXOqLuX
X-Proofpoint-GUID: NKt-kt0trO_x_4H7UUxluh6x1XXOqLuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290159

On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
> mhi_soc_reset() tries to reset the device by writing to the
> MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before returning to the caller.
> 
> This may lead to the delay (if implemented) on the caller to be
> insufficient, if the posted write doesn't reach the device before the
> delay.

Interesting.  Is the delay tight enough that a few ms will possibly blow 
it?  Seems like a poorly defined delay.  All the devices I'm familiar 
with take multiple seconds to boot (with some variability due to ddr 
training and thermal constraints), and if the reset triggers a crash 
dump, then its easily tens of seconds.

Regardless, since this reset will either kill the pcie link, or 
disconnect the SoC from the link for a time, I've been trying to figure 
out how this change might break, but I haven't found a scenario, so I 
suspect this is good enough.

> So add a read-back after writing to the MHI_SOC_RESET_REQ_OFFSET register.
> 
> Fixes: b5a8d233a588 ("bus: mhi: core: Add device hardware reset support")
> Reported-by: Alex Williamson <alex@shazbot.org>
> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/main.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 53c0ffe30070..4d458396233a 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -170,6 +170,9 @@ EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
>   
>   void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>   {
> +	int __maybe_unused ret;
> +	u32 tmp;
> +
>   	if (mhi_cntrl->reset) {
>   		mhi_cntrl->reset(mhi_cntrl);
>   		return;
> @@ -178,6 +181,9 @@ void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>   	/* Generic MHI SoC reset */
>   	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
>   		      MHI_SOC_RESET_REQ);
> +	/* Flush the posted write to the device (ignore return value) */
> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
> +			   &tmp);

If you wanted, you could fit this all on one line.  word wrapping for a 
3 char parameter seems a bit silly to me, but I suspect this is highly 
subjective.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
