Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433F6368D4A
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927563; cv=none; b=HrDDpigjo+Y4edebPXytf7X/a7ik7cJFXSlQYgFxAVP+Jv5vBB+f123q/+deGLYUdSvOb9YB2K6LujRvi2OWFPCco6NWHhZ+SxrWxqSK5YDKJiSTuJtEoXC/tsqJ7WYwwafuWQBfSIs3sqLG3EkzhRuYAxQkSRkmiA70DODDzgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927563; c=relaxed/simple;
	bh=xSsUd4+F9JAMqsOfTXvQ0ET3ZBW9Mja2/20RZUJBw48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rd/C8BE7yj8TzKg7WFMlCooyZPDos9On+CbFJeIpxgU9qwvU0fpBc/ATf2co1yUwM6IjS7+x9R5m/CSC2ysaW3Rp18XR1nBwh+2iSs/z/1T077f4w62pnGlIJPAB9qZvN8sWb3yr4ERj/n5WY39iTX+B1r1+Z4V2NNXHWpM/XsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwQx2fsQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ad5Wx3WT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwQx2fsQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ad5Wx3WT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77NCr810499
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhrdjE8+DdQexYgxMjUrXviF+vvjNB/D7Kmvlckb+5k=; b=UwQx2fsQGXdXQFOc
	/VdZH38tEgCj+u46WkNuQLxexnPhJhGVaFfKb1R/IF5/kxN9rEgdM5buIrd22dAg
	2lCchT7IRWSZ1Hq8kLubu6xb5FdrfiSrJH/CKuCPpxveySIdqp/DkW7KwgUFDhhD
	DqoCtfnBA7AyAbOnO50zOycIRXnckUo1dT+KLMV6DZ7BXhtdjnZXOSX7EPNcpEzr
	/0hAYszojz2Ve5vqeYYKL7KUl6wXc7EcqcFOA/FIgC2Rg3/mfzaDPH1rdLmosRCj
	k6aaVnnm1f7kbwloPaasoELdOZs5BlHbbWWWyqxny2SPKAPoNGqZOuPWBOQavdni
	o+XNtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsr21k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:25:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso70162965ad.0
        for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927558; x=1784532358; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhrdjE8+DdQexYgxMjUrXviF+vvjNB/D7Kmvlckb+5k=;
        b=ad5Wx3WT3KPZ7uQ6WaPKKrCx8JRk7a88exBYNcujdhilaVWNs8IENaN/3awGeVXYV0
         iNflLtJazXo9NE3MQoQhQ3Q136KYX36eELDeOUAdulMkCVYGI2/x8i4cPAGnrOwYocrm
         hl4NMuSEVroJ9z0KfmVyLvP6pZ1emX+LivYrHp/9hqV6qzwHuArvRinrMFY0FQePVMpR
         4n4wNQl+a2siJmyhiqCgLJPZidsugbrFwkBVl1oFKhw46SuZ57U6SnAz4Wfx4mRYlOcu
         EkQPSaudE3EbVRuECs4q+8jw/rNmbeiA/LMqnr04tNkSxFEqrOf7Aoz9DLEOl6JGb1sf
         1Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927558; x=1784532358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhrdjE8+DdQexYgxMjUrXviF+vvjNB/D7Kmvlckb+5k=;
        b=i7LjG+hhMDJ8DmxvkyVYbK4GB/AX4hYE2qv/BeHP96ZkXd9aPyiNnMJFDT/8ZsUNKn
         RPEIuakZEwg2/S7jztSX4/ZruJV/yNt3ewC4eF7SQQGJrp/D1FmPe9K9j4/hBQW4sCBk
         Gd3E5is4Y3WwFuHAa39uQ0NntTPefwiKmbcVZUzQqoy6fbD2qK0KZr0rlj9QHq/cCtX2
         fikjVjDoR7zPY87rt6NxXw6QEnWUjcfcYaqxH0RTX14ASnoGvWzYZ+4RtJhWt4QWk5EV
         0NNrujfU6h52Ne1FKK2yzDJWNsDFvIqxrckhHC54r/7DS42ultztQeOAl5/u05fiBozG
         XiNg==
X-Forwarded-Encrypted: i=1; AHgh+Rprw53epSDMbQFUd2mZ+abjOefH33OqTSCLUNv1Xqdv/3ceJEMRhU11RiJJO2uIf4GtBno=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlMLiBCx0dMKTsTRM7sQm+3FPaAKo91fbi0DEMqvZqp4XVt0qk
	CCut15789nf5IJ9i7aHl4gzSdXUHLe9kZ6D1SHZ1B1mkD6QYsyL7HMmRgFdjujUKurO7nlwK9zu
	yMRomnOXKNIh6LpXlrjgtRGi+gQOrxQ9CfiBDI0j6z4jtR6M9AbnMpKU=
X-Gm-Gg: AfdE7cl9vN7grfjiyKUNvL52R18zI0QhVf3JXmSNIPXRoVCm+gYcEBCHHhglLRW578M
	aduz7jjbz4v/fo6BIYZrIZyw0mPjMn8GsID5J8B3nfVEQ6Z9E3zgeIiybbhaliIHh4BHjVPHdTY
	oG/6qY4eeK5RN6DHxPe9REVurFO1/OffJOUuat/iQMmkOWT4c3CqHyNjEnCpt+ECP/W8ans7ALT
	5H27lKwdhd0VD29KVlnl1Y9WfatqMR8/ZourE0tDs98+vdOt1/G+EQwegPCYgUUbA+4O7V4RNfN
	ETpOpdJ69eBfJGkutGDF9d8NYdTnQRVDWtXP08uZtz4s1rrVJEm1zlb/3s8GTGZk0u78iaQqLUq
	wh0KHieQ5fO3ey2t/pzythdnDWfJwnOqRcKUszT8bUEI=
X-Received: by 2002:a17:902:ef06:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2ce9ee16c76mr80260155ad.30.1783927558174;
        Mon, 13 Jul 2026 00:25:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef06:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2ce9ee16c76mr80259955ad.30.1783927557662;
        Mon, 13 Jul 2026 00:25:57 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdf5sm94513175ad.73.2026.07.13.00.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:25:57 -0700 (PDT)
Message-ID: <a05e7dcc-7d8b-4db0-bd51-754184afb7c1@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:55:52 +0530
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
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a549307 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_CfiQXmXAg0GS1E_7KUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0Z_6dRrZe5-3lHaCjZllfbJGnTreQSM7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfX18Y3R+X1eFZe
 C9ce9KEINYNZiZ8BQl6H+5UTuyFi84SP7/tA1vadb4EK6zT0te/jiI6UCUsZIyB7DJwQAcn/rIq
 sBpV+UfcYOERDxjl4/plFpn60ZqHM3g=
X-Proofpoint-GUID: 0Z_6dRrZe5-3lHaCjZllfbJGnTreQSM7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfX5h/HbEwdNzl9
 RTYIzmUHLL6xc+53DkHC48CW/fUOg7yd/M/tw5mMZNhKk5efuyQc0wTFDs1rbzHOZXLpH0zfbjF
 Pe1bp/Y9Y8YJwkRtValNoukt0DcAuY0+wmiZe0d/zaaHrNsUCF2qIjpftyxTUNkbwUpL/xi99l2
 kyx0v/x2p08QXrOraIUmyK4/6b3KNYLMRoNjorqoHDxTtUMFl7ATr98kMBxlhIuOV4Zc87WWlkI
 WwZqLzS0Snckzn7QyEsk5AyJCJErD5ZoRNPyzlgz8f49v9XRxKu4t7uBNwPL0Fic3/gfZHJm1zm
 Zr+VaEWRRBQbqrys7GSJuVn8EF1qv/cgeZ+J9C3OCp4yOediVMgEd4Ac6t7GJ4AtLwsfD2AZHBp
 GKo7wFyvZG1sDwnOaDtjIOuTPkb3aO7PckJXBR9AqFOYKLRlm4BayxdCXzVjPiWsx7BrAgokixq
 eJY8gVtBrLdK+HIz1bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130075


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

There was a review comment from Jeff(v4, patch 3) to move to this change 
to the patch which adds QDU100 support so that it doesn't break bisect. 
Please let me know if i need to move it to a separate patch altogether ?

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
>
