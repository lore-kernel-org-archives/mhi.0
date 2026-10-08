Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481943BD246
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439962; cv=none; b=WzaxPq+cs+Ida6os/V1Ew4CavjbrBZXmGFsSwMCr82iuclYraep+eJMstbn0KAC/ql8NXjjv77ZOMEXYVJUaXQwwRyTO9cDAHJyYk+nLmgysvq0HoJTM6PIKjRhdsH0VoH6774jopwetoQBVp8EFN2f0JHcnWKAPdK0VhFtxJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439962; c=relaxed/simple;
	bh=sCkEiN+qolnUMYJu0zZCdc1+ix2cmxHcK5i99B9vty0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDvQsD9+/bWHfeCJr8W7w0EVxEgvCKRrLAatnrqdBnLJ70BDVB8Ca9OQzcX4swtvNxmcMP/HOljyDoDX6naQkiWFvZM3vcPnlUyx6CinECuGIoDgJJfH0FozQnLz4yiWseC7ovHudI+1NUQBpsB3PB8iogiC7EYUm/pybuRDyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+Y8weLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0+IR1Vw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+Y8weLU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0+IR1Vw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTSm1157574
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=; b=d+Y8weLU28GSBE3q
	hyzTdHjUqu0MoG9oE7BMMVpixr0jym6chlbVLyh95W9Eji88xVsqFZJNef/DoUw7
	Obx3sfnhxloT9BDE4BWjzaggfa5zK6RhZvt5Fn5e03n1QSqVN+5L/Q09mf5s3A2m
	6m8E29+WzGV6cSLDo2zKcwsUMkQZEEKMXzGXewuQ9g3z2VwazZOJDakO5hU+J6ue
	jn353z90aVVqQKwpnSbMPgAsfI19ORNDVGef9D7QiAn2jhihcVk8Kg0GWS195L6C
	IB5lYTVH3G+1aSlcItsbmf31Dq5zIu6O2XgAXelbEGz3Fzhq7dOX5uBwezXMiGQQ
	y7YsxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51dff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:12:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3922459a91.3
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439959; x=1792044759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=;
        b=j0+IR1VwgZ2ZKIjXWDFaiPuHiigynEeDGREzW0BjeAHfmd75sL+HuDKKRPaQT1MEml
         W5a2FdoBKiCqYcqBiIJPbBfjY5IWM21BFS51j9pv56hLXz0+MVeLoxr1qE7m277qyIV+
         5IZR6McNNUrHyfYzRIeonRrmbTfTEjM3xX9V2d6ksmSmMzYOe2u8FE3kF5n3v/afmWk9
         hcHN+0A6cch37mKF6kl6+GYlM5vtsjROdx21IBFZK2M9LdrAt3O1Qan990SIBniTvLuJ
         kx5y3LH4EQ00AK2U5Ltw+esUZheQGxHFTxbSPEfTPG6uOHHkrvn8ARJp8xQj8YW7Lptn
         NvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439959; x=1792044759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPGiFq54jDa1xyPtt96t6RMiyZYDpPryks68gXkQPlQ=;
        b=t/vKtb8OEvejoxtqcb0TeozNYZNu7kF3i8rPSh2HQJAczFWRfN0Vx5kHH8w/vo2vY9
         jR4Wlj7ABkhn9Ax62oO+oxSHQwO/GMv9+1k++TLIK2MQoI+MCCDI2oYC5hURBE6bg8Y6
         zpgLdHKgGw6FeRUS/pDjgCcT/5Zxc4BXSnEil/hVCQmdhEqdIR00ZM+luFzk8Anf2ufZ
         EBXriDsnJosWYIMbifrcy2u+sQJIp+K32U3pFS4PkfFYT1S8Wrj1Se2/UkuVEQVufd+R
         vv6tWlN7wvES7IC/AhFqpsRMJwZHdIbIEfTkVZGbXkOWtkynA5HqxLmYkEqWrWIwSPmx
         D8Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxXrledG9ybD1wk7uFghHjYlrJ9V+REhLiPSoKcY0rbPwZonQpQchvVRHN/3ikmLvK0VMo=@lists.linux.dev
X-Gm-Message-State: AFq9FYIbzrz0y1F00MRF63GtM5dKXShdD9gr2iaam2YTI/dfNJK2Gxzs
	hDft55qTT824Rr0CA6QEg1nXbh/lH0vmRkI6fngC5uOV+KazjkBGYm7zCnynumIjvRQzolaSeCh
	BYomNqJf3daWn27onUpgPB1cREOb+R0KWFd/2OU7YSxGoQzeBSsZOT9s=
X-Gm-Gg: AYBFou1fvYgJ5e9rma3d+23ZrYOBJlmx3+UrggDh1B15Yop0YZVkszgZuf9tz1ZevwQ
	8zibw962NxRUXwEXqIuW29Y1DjY5BTZzaIJsFzLk1IuaUlF/Yu7SS34oM46jNIheTlqG7mSXnlI
	VlTI8cH0CdJYtXdlUVL+qhORaGHjoXssogUNzdBUQORpcuA256ha67wXnPvfoG+n67CTnY/n5TU
	Ek9N45XeMSX/vBATnH8NhXliyF6G2g9yIsJYRxlFzmku2tAqmhhAYuukRoCwV15WLJ0I27dQSqv
	0M/797w3eW1dXpXTkhwmYPt2r+fix8ptDQOrRrRJsSLjNaYuPfcbN8RlT7Ve92lbWZZYFpNvnWq
	qrl8P+izkSC052QW43uChyMqKa6UXOFAv
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4086859a91.45.1791439958825;
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4086833a91.45.1791439958315;
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a23c82sm2882655a91.1.2026.10.07.23.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:38 -0700 (PDT)
Message-ID: <d57835a1-9a56-465c-946a-ff261d2df0e1@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:42:33 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
 <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n35ouuyvy25ocbfaedksryoz5d53cylk2pcsxz7f25us444gh7@7ybkifq3fbae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: apTkjx45wAXHnSDNi4CrZscRrB4Vev7w
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73457 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0IlxrgZsFcjQ__LXY9EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX5gYUVMi1ywqX
 mb/IvcsW+7jvy0RpsZi0BgjBdJljTWRnNwKB3JbcSZCEKSVoYpxEb2xgPL5Pe6Qk7w2bbfAsROS
 ocUTWrxuKOXAHv4iOpwbZtBFq0Zy9bE=
X-Proofpoint-GUID: apTkjx45wAXHnSDNi4CrZscRrB4Vev7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXzSDckwbXo6nI
 pj0wHJiUauOjC3A8x5nhtI3HqK9LZQUJ/mlvPvYbeLjIVX/DiTBCaDKzfePmQiFs5rmRMcsio0/
 W8AsJNu7sjLtY2x+feFPSpeG/kLnFbLdxsiRCdhiAo3wDEFlr3mrWzCRxzlI+VdR1n2C5ybElCZ
 gJrbqRP5nW9qfvpXFEgUYCKWU423BnIhGHyvnOHkDM3hQgtoQj428EcWi5n6ls3Rtl6XnemaBfq
 MZeVEmJarXXnjY5uhqYQ8CHnZogmw0FC90n8BK2Lah63I+OJeh45b1XYdjqMueX1AbbPFHcGox4
 RW+eIjWACJ3V8Bb+st0U7PJA1UMwYjTI52ajGA7qZwYN23P6HeWusxp+zEkENcl9TDtUKYS+ULr
 dRfz02f0mm4wmIWzFbLc/lq7KwcA4Cg0Ntg69zQtYLB7x7JsLx3WuH6njix57fxAVrOUajBAaK0
 jNww4kn2ZrgAVs7oBjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/9/2026 12:27 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the Sahara channel is torn down.
>>
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device:
>>
>> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
>>
>> The sysfs read callback serves data directly from controller scoped storage
>> and protects access with the controller training data lock. The attribute
>> lifetime is tied to the controller device via devres, allowing the data to
>> remain readable after Sahara channel teardown and ensuring automatic
>> cleanup when controller device is removed.
>>
> If this training data is RO, then what is the use of exposing it to userspace?
>
> - Mani
The sysfs attribute is read-only because its purpose is to export the 
training data captured by the driver to userspace. Userspace reads and 
persists it as a serial number specific firmware file. During next boot, 
the Sahara driver loads that file through the firmware framework and 
transfers it back to the device. The data is therefore not written back 
through sysfs, making the attribute writable is unnecessary and would 
allow arbitrary data injection.
>> Userspace flow:
>> 1. For each controller device, userspace reads the ddr_training_data sysfs
>>     attribute.
>> 2. If the read returns non-zero data, userspace persists it using a
>>     serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
>> 3. On subsequent boots, the Sahara driver attempts to load this serial
>>     specific DDR training image before falling back to the default
>>     training image, restoring DDR calibration data and avoiding retraining.
>>
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> Sahara MHI driver.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_cntrl_training_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_cntrl_training_get(dev);
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
>> +static BIN_ATTR_RO(ddr_training_data, 0);
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
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
>> +	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
>> +	if (ret) {
>> +		dev_warn(&mhi_dev->dev,
>> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
>> +		return;
>> +	}
>> +
>> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
>> +	if (!cookie) {
>> +		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
>> +		return;
>> +	}
>> +
>> +	devres_add(dev, cookie);
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	char *fw_path;
>> @@ -1131,6 +1191,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
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
