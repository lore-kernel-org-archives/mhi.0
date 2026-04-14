Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55433BAD89
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160616; cv=none; b=C1gZTl+dbqM9AhZzKX+DcoG0ivcyKENpzCopJ+O8yhRCJMOUNDrwMoC4HdJVeTBxHCRqGMs4FOzk/mwycEcwiqp3sKEpdpslO61GdNq9HorLR2XGApuh2O71EFYMpZ+GefNT9Pync0szQwfDKdW09U5dpYlNNq/S9hNH2fwx7m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160616; c=relaxed/simple;
	bh=QzX1eIfDuXozU4tY7IyaWnqDasvIQsq/MODmmHbhvQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4p8S+IBTLTmsxdqt8MKZnBjD/0DLUrDc1NK/thOzHq46auD1/iB5A2TMzEjTvZ4xm9+w5dB+QJ2cDeA5S8c2gTrhcAOCT3U3rBS14lcUMIV3+huaHEF6SgO/x0ho8JEuS78bQKyqxI2eo1svRQDHTkNEs6eVsS1BFWWSJLL2O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fINXBuae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bj9mXfNd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fINXBuae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bj9mXfNd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6rNt73157263
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=; b=fINXBuaeo4mpid8+
	3BEEhZKngQhbZtJ4j6jFm+Y9za7UY4yTTIHiDG5J5+2AA3AcWwkUI15Oypv0jkj+
	ZX7yYnuUBT9sYCJY4h1N/S3EIrRRTM/hDraGd04y8kJoC7epbbshIwRSvVNcCcOd
	5V07kyB3cEnkp0Sj4WYN1E+rUumAyPYduw+Y7Lhpl21uAdTwquf39Wu+f79t/IRu
	/czo33J2MZO9kVwApxm8NleZXnFxKTRQZaBfpdnNEhSFIqSA9UZ36wR+uU+QyzqV
	IGJSeCaF4dF+c/2GhCQo2Q5ptQMFXCo0o0k8hA+/oWGibJc98GB/xSyFJxpOhNgv
	ldpcCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ba5ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:56:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76c62eb15bso2153167a12.0
        for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160613; x=1776765413; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=;
        b=bj9mXfNdHv2KBhxC5ijaPW3N4UvNZbX2rYpGKtxXir+KV+oCBrNQ7CKsIntOF3z5AA
         JK7ZMz6BsZU20BcRHBjDysV/0jvecE4W+W6gggIAKxxamFVRMzWBKmAcDncpIC4cADL1
         9N1hng5H2h+JrV5sj7+paIuIdapHoVwWZFaz6XaTjwgweGd4/S7nl/ZfXSOPOYw9nJwF
         CicAcg3BUPmLu3bMsO6b46ZfMwC+ZbsMukm4lBpotO0tRs59FO3eg28SQ5zVVFb1TrLV
         I4J+IWaFDKNclUYuC68UD8vzm9AwekLNbbRLxhCnSzyaOAJfXR3i334cwHdQndiRuYzl
         B1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160613; x=1776765413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=;
        b=GQD/hbL522awjrp/YSJPmUimkzG6yV8Wa5A3tf8G6oTjRwbt4Je02gCEPbZQQFJg86
         GxsgHXYXzF3HeuXCqyP1tCgZ7FcbCZ/S60CVMoo9UYNLngVp4wxND/Kjg9B5xUY3V+y1
         at+ynmIu2CeA0yC691DsMiSFSbskgSl+7WAumH+pdNIdCpgFGakvXWWpkHvZz/+luKd6
         VuW5LisiImH8qSPH7zM4sgUfXS5W44V4AKT521fhlmnhDroh525i6OfGDHvUpWpoUTzF
         NZVkVUVGLNdox0q1ANF5pdvIrFvhr8gWE8J3FBeM8X7Z1GpM/2I536MBtUkoKVFstzPj
         KQoA==
X-Forwarded-Encrypted: i=1; AFNElJ/1cKeN2vUar7h6XwD/J37WWJysvoiSrAHj3JQL6uzuc7P2YNX58XYJeZSMri0YvRvtV7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfnddeUVjfHEGqiAKZoo3cd2I1FnSiS5Ebjci5GJJRR0nMdNZH
	RcqdbjtwVLpHFULHX4a8Xf8SDgOZ0vvC3+zeervjmQhVriareQHEFD/UdrIF+kE0mdulUtApSwR
	z32UThV2xS9jNhqTw6qMVdRaaYV/MUOnfNsEaeOdNJXf7TgVode8aAAo=
X-Gm-Gg: AeBDiev9YM9NezRsGag+Ew96s/kAu3icdO8eP+oAj7UEmsgWWHU0ZTsCTFvL0mP4Tjg
	CX4iEXAhhofgrZoL7xNFBOdkPkbkNrpwTWtMt8FrLxyn0bLrIAJY6UWZoXpnvHGzNLS3XQ6LkwM
	mLuVW3mPStPW83Pj1J/FxN/5JFc+yGgGPswgUtfDB+68BLaOA9ZmwO2QppnIZ92gXqF/xdcMf+V
	a/P9C60/iKfUXPmc+cI881kbLJi78jckhfbfD46ZC7sJqYuAjuGRAM3mUZS73Z75l1Cod4yGrXD
	SO5h8TX5ehrVTJYVxi93NV/3PJmJEt29PEp3nfVdn4JacQZUyZHH1mGIEJiS72PIVxz1IiLW1Yk
	8FX783o5nQFie9+WQ2Slt3WDVyp25TNY5EOXAvJGZoprVhyPFK5C4Yg==
X-Received: by 2002:a05:6a00:ad8d:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f0c35628bmr16502547b3a.29.1776160612644;
        Tue, 14 Apr 2026 02:56:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8d:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f0c35628bmr16502526b3a.29.1776160612161;
        Tue, 14 Apr 2026 02:56:52 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm15060311b3a.2.2026.04.14.02.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:56:51 -0700 (PDT)
Message-ID: <8f620562-2e1e-4d61-a823-767fbe51828a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:26:47 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>
 <tbwahssgudfeacfj3wcg32yw5fkqorswees4gv4geypjmmdcyu@tv6qkuhyw23l>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <tbwahssgudfeacfj3wcg32yw5fkqorswees4gv4geypjmmdcyu@tv6qkuhyw23l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX2Q7tDf9YQa6b
 4yvd4uSBmogfOgfPfwpjamAbvuHs9WfGthaMy7v5A6hbtXwvHgv7jDXTE3Wwj3GPg/1UofhHu3C
 i46fs07P5NCPceRrB2ox5YKg+UlNYxH+/omhqTWzxiBopt8aAMPYclGr3ml0NgtiC9czeJCeTCD
 5NwDtV0W241hjXeHiftMwoaUE5wIt7flxK+qVmCs/eNMDmCHPS4PpTaDXbWDHQbFOZq/lJjSGt4
 CgPV+5k/agsd+0m5XP5IEyFVJUG77YfCH2IZhh7UoWbnIWvjpbyyGvnWBwGF5o1Wob43F1MLeNt
 DnSWDIfwAy4eoXiIY5wAxiQptjCrNTiL+wRtoKXynnbaZMnpDybYHGNRBX18EeFqTnFTCRiHHgr
 mVzcuAh6rePwLOtblG0afIT0s4WwUyLbM3d9uXBKsM32N6Y7RznAfAbRdsd7dedyyUESzOjXbzf
 IgSd06J58IoHeQk33iw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de0f65 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7NWoxAv4aW94f8snxxYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: DfBidZfyk7yrHeCK5a83lzxpT1Z3fsLc
X-Proofpoint-GUID: DfBidZfyk7yrHeCK5a83lzxpT1Z3fsLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140092


On 4/13/2026 5:28 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:48PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the sahara channel is torn down.
>>
> Maybe share some steps on how the userspace is expected to use this calibration
> data.
Sure. will update the commit message with the required details in the 
next version.
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device. The sysfs file is created under
>> the controller node, allowing userspace to read the training data even
>> after the sahara channel device has been removed.
>>
> So once the calibration data is read, how it can be used further?
The userspace will store the calibration data in 
"mdmddr_0x<serial_no>.mbn format. In the next boot, Sahara driver loads 
the real DDR calibration data and training data will be restored. No 
repeated DDR training is performed at target end.
>
>> The sysfs attribute reads directly from controller-scoped storage and
>> relies on device managed resources for cleanup when the controller
>> device is destroyed. No explicit sysfs removal is required, avoiding
>> lifetime dependencies on the Sahara channel device.
>>
> Missing ABI documentation.
>
> - Mani
Currently i have added in a separate patch(9/9). I will squash it with 
this patch in the next version.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_ctrl_trng_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_ctrl_trng_get(dev);
>> +	if (!ct)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ct->lock);
>> +
>> +	/* No data yet or offset past end */
>> +	if (!ct->data || offset >= ct->size) {
>> +		mutex_unlock(&ct->lock);
>> +		return 0;
>> +	}
>> +
>> +	available = ct->size - offset;
>> +	count = min(count, available);
>> +	memcpy(buf, (u8 *)ct->data + offset, count);
>> +
>> +	mutex_unlock(&ct->lock);
>> +
>> +	return count;
>> +}
>> +
>> +static const struct bin_attribute ddr_training_data_attr = {
>> +	.attr = {
>> +		.name = "ddr_training_data",
>> +		.mode = 0444,
>> +	},
>> +	.read = ddr_training_data_read,
>> +};
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &ddr_training_data_attr);
>> +}
>> +
>> +static void sahara_sysfs_create(struct mhi_device *mhi_dev)
>> +{
>> +	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
>> +	void *cookie;
>> +	int ret;
>> +
>> +	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
>> +		return;
>> +
>> +	ret = device_create_bin_file(dev, &ddr_training_data_attr);
>> +	if (ret) {
>> +		dev_warn(&mhi_dev->dev,
>> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
>> +		return;
>> +	}
>> +
>> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
>> +	if (!cookie) {
>> +		device_remove_bin_file(dev, &ddr_training_data_attr);
>> +		return;
>> +	}
>> +
>> +	devres_add(dev, cookie);
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	char *fw_path;
>> @@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   		return ret;
>>   	}
>>   
>> +	sahara_sysfs_create(mhi_dev);
>> +
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
