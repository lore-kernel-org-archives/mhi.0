Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770442E8FD
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952173; cv=none; b=JNiPppg1606cuhhHlaj0ET27egHIzH4jwFzoV2q/tRPQHVqu0su8DVxgyqZEL3GzgLm2kQvYGRTIlexQUsoy4M4YzPCerBfJK8jQEyryDec3OSr6w/gUlLIU9CnxGySC26NVNETut27zv5mtPCcDHJh1qn43GpXJR1XifPQ1DnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952173; c=relaxed/simple;
	bh=rjRRwXeoSvQ2Yt2kDuIXsZVmldbbQ93lhgFEVsggEBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzbLyY0zzyLIcnwmApJ75RRX/uqLXprZiIXwj58O9EeN/f0l7h8XbCMBEtJhcUqIKTv4zvXyXPazmcwLsddtUexHG053htqbbV+cR/8pzLjkTYbO67202BUkJ2H+mhQeLc+Td+KVrJ+dAPqwc5cK2ACXBhR7tfr0+T/48kbqCy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a89fZUTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDWk770z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a89fZUTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDWk770z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDjgA1453277
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 14:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=; b=a89fZUTKY0N0QfDn
	ltmn0X2fEeXWAMOmkV1ChSPUa4LS39VVSoRq/MX4HbD3qqM/PSJhF8PpwLaXSCa8
	o9nt5KCmu4pxH/m1eaEOoVi2fQ9Q9X2Kt7TTtdVbWz1ofkcMHyIdecFd/UW3j/Ak
	qqd0pgE1cnesSMa/qX/22P+8OfLKvnaLqAoWZqi0XhbhmKzjeDMWUWDZGmAagz75
	VlkBWRdyd5szxUzaEjlTba9l8CdVIuFjrbIYZS+ZbE2PXLX6aMTPY7RUq4ah5BSG
	R/pzV6uYg9lieDTYDjXTzL8sUm2HcMJCYuuayVxWkymPCXXUxbWBpiJ5QYGHGwvQ
	l4gJLA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01mmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 14:16:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso4923329b3a.0
        for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783952169; x=1784556969; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=;
        b=iDWk770zAhV8pGIGLtXUNNtNLKjJNIZgFqZRRDvlET0yJCKg4aouG2FNNB8P2ULnKa
         rf9SRfyCEksZU2etHdD3W0EG9MMVzFLWH/2+j6QX/AUBKKTD9F3HtLeIKYbCdYpGzr+k
         RkGSqypevFAOHb9jpp0huBIW01zIRLCugD/EVbED4VZyysnAy4O+eeNb54rXYqHq++LC
         Cd3fXYWpgYnPgoJh5vRKk+4ECaajJsh6C4VVOsG466n8N47Sm5uv8bTazUslwpenKpnm
         fg8SSOR0XP0CeVf4tEhK/sksXvUG1zRZXUx6uhbkhJ90CA7lwNZKJUJvAsG/BGH5jOrK
         tKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783952169; x=1784556969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=;
        b=CyekQKkAaGf/uu+cyhnKi/uHWqKgvY+/YR4rfSlpgM2B7oGQuhz+svl8M+gSoji18d
         ye2iZWYhLTPfm7Syo8ZEbkAuyal3T89q281lLecWFR6F6lPhtbfO53bVkBkLnvhnXM1W
         VaGwciRQ9aBffZ7/icg/g1GAV8gJWrqoFmoG0xtp6ZII+dzeuk2E/55C8qaJw0dBfkDa
         rNgIH0RsHuxvJ8DhWgKAZgu4FN+QsI8mwBvhw+soipsL+GbEL2d3qGS7SE9JRc4q/pS3
         Z6UPM+yK2EnlCVSQhwL+sIqL74gBaY9f7F6DL2vmFhrmNlCIF2fCj+suSADrdpYyhaH6
         3QQA==
X-Forwarded-Encrypted: i=1; AHgh+RoXnIIuH/7ORmZJIdxMQrIsIfqCcpGXNqWd8BP+mYfBBrCBqV3EqrJuQ0yIoCeevY68K98=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/WzDJeVje/cJfJE+O9mBJ3wZOCexz1gjyJd8NljO/euwT5pgO
	CLKUbXcchdGtMjLX2jO0kFIx4YwZ6mNdboKeNxX3tVeyAD6ujbKWyyjJy6Dm41DD/VncAgx2i7t
	kWMztjJemJMp7bKo7wBf7WyG2ajobj9kL85VOxnmPhtVpPWmE1v36j0E=
X-Gm-Gg: AfdE7cmYYhw3C53wYUHDP7MewnwWE5kDC9Oax2A694qYs3A9LMAGqkTm/0PWHD2BT+s
	HE2lwg8UKxBdoU/pL06jg7t1UbXttdg1EhWBlQU4EMEpLD+ntv51vh+Xjif2O0C9y205oXJRz+f
	V73oYoorDAwvaCvQbSMSDZPu3AZLMB/3A0IeIwj4Rb/1F3CqaC9IvcvQJMBdX9gFj+cz7I7QSQL
	xLgz9LSegNnDPRL3c5u2Tl+QJ2dZq8Vgs60x6Wng6bXHJdGY/MD6h5CMwgb+08ibWlcWWBry04P
	hjr31vbwrNSc4jB1f//RRTosmly2cDuzQY5riHIWAaHbuqRNogpHhLcVQThslNVRV2zchURh87W
	s2bhSdYH+EiI+sF/91W89RBR9l8Dy4OTlRn/CRWJVXtoN
X-Received: by 2002:a05:6a00:1c99:b0:848:2ef5:50dd with SMTP id d2e1a72fcca58-8488ad09145mr7755439b3a.37.1783952169266;
        Mon, 13 Jul 2026 07:16:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c99:b0:848:2ef5:50dd with SMTP id d2e1a72fcca58-8488ad09145mr7755409b3a.37.1783952168780;
        Mon, 13 Jul 2026 07:16:08 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a49591cbdsm452482b3a.40.2026.07.13.07.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:16:07 -0700 (PDT)
Message-ID: <21867efc-b5a8-4ed9-92b4-059a020731a6@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 19:46:02 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE0NyBTYWx0ZWRfX+S59eBn/XzXq
 MNKvLP5b2cbJUE5WACHcgFeAVI4Vk9SQdS+spU1YLocm0IacQiKiJkZ6HN5+RZjOV00vE1QsFiP
 kIc0J7d++0RwJb7UD8t8eH/Tt79c0sc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE0NyBTYWx0ZWRfX/jipD84dfioy
 u6Uq0yeTlkHbDZftphmiRsPS3i8mFHQ3iMQjGXri+N4i5isxTMwGBcRUYoIZ1QA0eN9nR9GUt89
 HBVYb+LOSV02NHwyWlenoKRWqLIyNmHN4RFWvnNfl9MRYkTEHP8qv7hght1GJiUaQqMm9SnpufM
 gqtPZlRpJ0GNgh6G0nUSoSTGY2993591hIM/QBO5iEalSwpFp65zZF2wNS9FiGJGn4NV3ilSQqT
 tBl281rYRCCo1o2KEiVde86pPXUU+Vi6Xadiwkenke+lwhuOzWix6d10Nuji5DfCs8MRVNjqJ+n
 QMfubS8qgstgqB9dIf5r9qU8oJsHLi1JxNUqM0xn8OLodG7tiCbeIuUJ6qrZYHWrWtc1dI87I2V
 GMSweBBn8T5oi9LdTiofZ/SXpLgt7wbJ362onB7+xvrekJdpOKqY+IqAqpW3ECHMPhe6P0YGiyX
 HnTOAsfcfVJeROmCwUQ==
X-Proofpoint-ORIG-GUID: kJqdK8jDd31rI5itpU7aHSrpMMHnatP-
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54f32a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ggBkse9BzyKxnYN-cX8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: kJqdK8jDd31rI5itpU7aHSrpMMHnatP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130147


On 7/9/2026 11:49 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:38PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects a firmware image table based on the
>> attached device, but it does not recognize QDU100 devices that expose the
>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>> QDU100 devices with the correct firmware namespace during image transfer.
>>
>> Extend the probe time variant selection to match the SAHARA MHI channel and
>> associate it with the QDU100 firmware folder. Add a firmware lookup
>> fallback for cases where an image does not have an explicit entry in the
>> device's firmware table. This allows required images to be provisioned by
>> the platform.
>>
>> This change only affects devices matched on the SAHARA MHI channel and
>> does not change behavior for existing AIC100 and AIC200 devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
>>   drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
>>   2 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
>>   
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>> +	char *fw_path;
>>   	int ret;
>>   
>>   	if (image_id == context->active_image_id)
>> @@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   	}
>>   
>>   	if (image_id >= context->table_size || !context->image_table[image_id]) {
>> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
>> -		return -EINVAL;
>> +		if (!context->fw_folder) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"Request for unknown image: %u (no fw folder)\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +
>> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
>> +				    context->fw_folder, image_id);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +		if (ret) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"request for unknown image: %d\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +		context->active_image_id = image_id;
>> +		return 0;
>>   	}
>>   
>>   	/*
>> @@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>>   	{ .chan = "QAIC_SAHARA", },
>> +	{ .chan = "SAHARA"},
>>   	{},
>>   };
>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>   
> This change should belong to a separate patch.
>
>>   static struct mhi_driver sahara_mhi_driver = {
>>   	.id_table = sahara_mhi_match_table,
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>   	.reset_on_remove = true,
>>   };
>>   
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
>> +
>> +static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
>> +	.image_table = qdu100_image_table,
>> +	.table_size = ARRAY_SIZE(qdu100_image_table),
>> +	.fw_folder = "qdu100",
>> +	.non_streaming = false,
>> +};
>> +
>>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
>>   	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
>>   	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
>> @@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   
>>   	pci_set_drvdata(pdev, mhi_pdev);
>>   
>> +	/*
>> +	 * Provide Sahara firmware mapping. Sahara consumes it via
>> +	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
>> +	 */
>> +	if (info == &mhi_qcom_qdu100_info ||
>> +	    (info->name && !strcmp(info->name, "qcom-qdu100")))
>> +		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
>> +
> Why are you adding QAIC MHI controller config in pci_generic driver? This driver
> only handles Modem devices.
>
> - Mani


Hi Mani, Above one is for QDU100 device. QAIC is not added in this file.

>
