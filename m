Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C05246774
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 21:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769255; cv=none; b=aqzVyyCooV03YheTG8KpKyNmHozh2vZGbYPqdCGuY3RhbHjvzk/iK/62qtOv7Fztbbwd3rXlhoeEW9RaLpA6IJwAEQY649zS9vy3AibQsZfKmRNtS1eeWP7i3WFFpGh0l2b2nlj65MdWRoiqqb9rofec8dG61JHR9Z38cza/6Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769255; c=relaxed/simple;
	bh=fl4nGN4lCESvXQWVBOIXNbs8beARKP8jJmEhq8ZQvtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9pgU8pSxwHpLCQHgBF1BouJCN8Z88HGMhICZwO4CKdbIRPxilqTiH8TazQ+/jY9aiEHObBPYzHb3Uu3pySLSj6FdkA4jXejZvbWltwh2+rEZHqoXiQUBYOpePG1rL5cFnlHlqJJWmSn7F+G4XtsYZQT1phAr1RWKsjnmTRTLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz7dc2Aq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNSIqTkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz7dc2Aq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNSIqTkd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KOSoT729238
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 21:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=; b=Kz7dc2AqlffxzAgh
	cdh/3LtvfpwHCe7rSWC0Wldi7NbRmijlA9Sf9GouOVHCKU9yBzRS3ISBi9wJpGgQ
	qnfNmlkyPHDfsKbfBAda4+AKrx+4I5vj/AsMOHcItxVdA99VajhrZ7N4VOsLUGaB
	zjfrFaLt6B8Q0SzCj03gDfr/GQ8vcibfyXUFpavDPh+EDjrmMWSLZJALXEmhxW/o
	CtImuz5AnVs45OKk8Uw+CaKSMOb0Jahf4F1I9+BkrqtiuLpsq3gUDyW1cEEr+O+G
	NkW8aOABPN6XpOvK2f8NdSHhx/NmzAvZSUwi27/s1zfsVvw83aZcSDZJEsO3ih1W
	Qj9J6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c848g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 21:14:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c68a134df8so1153124eec.1
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 14:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775769253; x=1776374053; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=;
        b=UNSIqTkdcbcdpV63XjoZ9p660W7LsFjaZ6ZMwJ30H0cq1wU8rpgOoVtqq0j5fYLele
         lWr1QWVlDHgmeYV7uqjI7znzBMHqNDv0dZhnxzhXra6GcqjDmxGgnN0yxw/OjO6ePO0Q
         hJWj9x677nSJAP8HIcvKXEjmlO1vKbDuaqt0q20cUNdZMEF0cJKwxKhzIhiQlQqOgqlu
         xxSPzxBPb96Z0Ma3/6l5vS+Jc8qF09LyzbauxCTWyTMJ+gCwXAaZSOTXZMaJWab4xJNo
         laXLBDDsEIu7YpiI0f2qOcStgxaWvM87WcVrVsa84ppBaYZowo0N/XXDwjSBtuNX7Dvn
         H5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769253; x=1776374053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71bx/GMNtE6R0JOiEcxGItTozs6PCdIMyyDmKsMoGNI=;
        b=mf6cLVRRRYgf3Lr18vERmWw3tCyD/gIpkDTYfhFSbf4IDv+VxNTR9Jaj9aC1y3+s4O
         lA7eeIPRWj5r5KOMm7yiN+ProrNm1LplmLAOCTrH0LOUOeG2F5p+5UJ/OoUxy+5BUNqJ
         9yRzH7rboQi4TE5YlmalVBNzd4GwXymQgdFPWtSGh5gWMwXO3RvS3MfFiUsI4pXpFZ5Q
         zuXGulrbWL4L1ypJmlL0/cnlcRC6qSFrBh489sJRT+RRfd0x2cdDfVHH9wmNjgXNt0o6
         k2lOLeTGAikNs748Y1bH0yjzjUD9Y+0GgZDBH2YlMmXMs7w6nB9GexuIgd47I6W2Pe9Y
         QegA==
X-Forwarded-Encrypted: i=1; AJvYcCXdiNJs4SEOZBKVSewm74XypHwyboXMYLJGlKp2GsySIFHtpjoeFnwOqKFN3gC/pkeceU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwVvq9LR7hlLNn5YsY8uOQL11N5I9nqPDgMiJGwPIQrzCQW5Kt
	IfIMOoTrI8F5GBZu+yyMXVDskxO/ZKdCmEz1eQw5wjCGdhHrxouFoWQIzhdTpK99knh18TUEhUt
	D7qGG8iLDdmG+QQCKCUJXcr99wkshofi3tRmYB2UxVNEwISPaP7IdTdU=
X-Gm-Gg: AeBDieuFFhKtbtfK8xk3bRjEffhF8g0XeRjsElspc7uMB8A+Iq6zQEJpq9TEuT9AUaE
	V5URAGPK9FvxV7aGuwADjtaxeTdS63Kxc22Ckn9b7DoCUnz14s3tdYgCSM1aYWQk89X2wxqOLjp
	TtmK+NTLumd+zRB6GlDjtsodAP8bgbwOmGSM0V5CRtwYWeii8ngxErMJM/agGotVnKMltXB/3Cg
	GLNg39lC5HK75JC7NsE+wvFB+TDHXVdBmA3n6VIAfvIttqskuJXvXTCcrM2TEBUMacep9ZMS+xn
	Irtm75v30UFOdxsovyGzIXPJFvoyXmREoxuYC87dWj41DqiZseFXayGfyWwn5GnuITCNeDd0Zj9
	XRF1eSk8OEgl8WPOGyefmXzEyR2z5oBQePG3yO17v8n3tD8K9jvSmp5QjK0xj6dYN8ytkvAoOiX
	k=
X-Received: by 2002:a05:7022:419f:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-12c34ef6d62mr423008c88.30.1775769252621;
        Thu, 09 Apr 2026 14:14:12 -0700 (PDT)
X-Received: by 2002:a05:7022:419f:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-12c34ef6d62mr422975c88.30.1775769251987;
        Thu, 09 Apr 2026 14:14:11 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c698esm1454478eec.6.2026.04.09.14.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:14:11 -0700 (PDT)
Message-ID: <65985856-0a01-4856-af97-56caed5430b6@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:14:10 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NSBTYWx0ZWRfXwstqUtlpMXA2
 pMeECFVTaALpBNE1i9YcLzXXqv1hovO94EZYFijG65c4piQaxeZIJ5199De9CkBH206Q1YzyjRl
 3iegJjJlaKlxlBdGzYmZ/zoUY0tHoJ55VE99vRiQxm40DQz6Elq3cnA7aEpgjt6Ym12P2p3X2LK
 bY99FINLss7tB/Jj0BIISsTk9JRVvjdv+h51GFEf877QeH8O45o3hNbRqhp3MmX+V8T9Wf5l2C2
 YB4WQAJqTlAkkH7fFmoafycSh6ki93TliJHXsr5FwHc06mgTWzXT8FmNr4HuKN6V50qG9PVgXMY
 hsKLMnDL5ZNNUwXY8lzLxmtlenCBOdNltQdHAKTVJM7AH2TvSLwYbTV1i2QeP4hRkN7ibpt7qeQ
 WcwDACLSZ59yWhZyK+KfcCE+EgnHgMMaHB/ls6/JuPKnoxLHVeBr8mag83h7hlFwO2gOnF7/aZV
 crlGlc+Csv9dgz9GskQ==
X-Proofpoint-ORIG-GUID: NSXnJk60w-bQsfInjnRaWLVrjWX9wOUS
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d816a5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-PYeUNOmlN0cYKBwraoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: NSXnJk60w-bQsfInjnRaWLVrjWX9wOUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090195

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> The Sahara driver currently selects a firmware image table based on the
> attached device, but it does not recognize QDU100 devices that expose the
> protocol on the SAHARA MHI channel. As a result, the host cannot associate
> QDU100 devices with the correct firmware namespace during image transfer.
> 
> Extend the probe-time variant selection to match the SAHARA MHI channel
> and associate it with the QDU100 firmware folder. Add an image_id based
> firmware lookup fallback for cases where an image does not have an explicit
> table entry. This allows required images to be provisioned by the platform
> without requiring device specific client drivers or additional registration
> mechanisms.
> 
> This change only affects devices matched on the SAHARA channel and does not
> change behavior for existing AIC100 and AIC200 devices.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
>   	[78] = "qcom/aic200/pvs.bin",
>   };
>   
> +static const char * const qdu100_image_table[] = {
> +	[5] = "qcom/qdu100/uefi.elf",
> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
> +	[16] = "qcom/qdu100/efs1.bin",
> +	[17] = "qcom/qdu100/efs2.bin",
> +	[20] = "qcom/qdu100/efs3.bin",
> +	[23] = "qcom/qdu100/aop.mbn",
> +	[25] = "qcom/qdu100/tz.mbn",
> +	[29] = "qcom/qdu100/zeros_1sector.bin",
> +	[33] = "qcom/qdu100/hypvm.mbn",
> +	[34] = "qcom/qdu100/mdmddr.mbn",
> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
> +	[37] = "qcom/qdu100/multi_image.mbn",
> +	[38] = "qcom/qdu100/xbl_config.elf",
> +	[39] = "qcom/qdu100/abl_userdebug.elf",
> +	[40] = "qcom/qdu100/zeros_1sector.bin",
> +	[41] = "qcom/qdu100/devcfg.mbn",
> +	[42] = "qcom/qdu100/zeros_1sector.bin",
> +	[45] = "qcom/qdu100/tools_l.elf",
> +	[46] = "qcom/qdu100/Quantum.elf",
> +	[47] = "qcom/qdu100/quest.elf",
> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
> +	[49] = "qcom/qdu100/shrm.elf",
> +	[50] = "qcom/qdu100/cpucp.elf",
> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
> +	[54] = "qcom/qdu100/qupv3fw.elf",
> +};
> +
>   static const struct sahara_variant sahara_variants[] = {
>   	{
>   		.match = "AIC100",
> @@ -250,6 +280,14 @@ static const struct sahara_variant sahara_variants[] = {
>   		.table_size = ARRAY_SIZE(aic200_image_table),
>   		.fw_folder = "aic200",
>   		.non_streaming = false,
> +	},
> +	{
> +		.match = "SAHARA",
> +		.match_is_chan = true,

Theres a half dozen non-QDU100 devices in pci_generic.c which expose 
"SAHARA" channels. Considering those as valid usecases, I don't see this 
mechanism working. Everything non-AIC is now going to be treated as QDU100.

> +		.image_table = qdu100_image_table,
> +		.table_size = ARRAY_SIZE(qdu100_image_table),
> +		.fw_folder = "qdu100",
> +		.non_streaming = false,
>   	}
>   };
>   
> @@ -278,8 +316,21 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
>   	return NULL;
>   }
>   
> +static int sahara_request_fw(struct sahara_context *context, const char *path)
> +{
> +	int ret;
> +
> +	ret = firmware_request_nowarn(&context->firmware, path,
> +				      &context->mhi_dev->dev);
> +	if (ret)
> +		dev_dbg(&context->mhi_dev->dev,
> +			"Request for file %s failed %d\n", path, ret);
> +	return ret;
> +}

This is a pointless change. Drop it.

> +
>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   {
> +	char *fw_path;
>   	int ret;
>   
>   	if (image_id == context->active_image_id)
> @@ -292,8 +343,26 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   	}
>   
>   	if (image_id >= context->table_size || !context->image_table[image_id]) {
> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
> -		return -EINVAL;
> +		if (!context->fw_folder) {
> +			dev_err(&context->mhi_dev->dev,
> +				"Request for unknown image: %u (no fw folder)\n", image_id);
> +			return -EINVAL;
> +		}
> +
> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/image_%u.elf",
> +				    context->fw_folder, image_id);
> +		if (!fw_path)
> +			return -ENOMEM;
> +
> +		ret = sahara_request_fw(context, fw_path);
> +		kfree(fw_path);
> +		if (ret) {
> +			dev_err(&context->mhi_dev->dev,
> +				"request for unknown image: %d\n", image_id);
> +			return -EINVAL;
> +		}
> +		context->active_image_id = image_id;
> +		return 0;

I don't see a usecase for this fw path search functionality, and I think 
it breaks the documented firmware loading guidelines.

>   	}
>   
>   	/*
> @@ -301,9 +370,7 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   	 * Only the device knows. Suppress error messages that could suggest an
>   	 * a problem when we were actually able to continue.
>   	 */
> -	ret = firmware_request_nowarn(&context->firmware,
> -				      context->image_table[image_id],
> -				      &context->mhi_dev->dev);
> +	ret = sahara_request_fw(context, context->image_table[image_id]);
>   	if (ret) {
>   		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>   			image_id, context->image_table[image_id], ret);
> 

