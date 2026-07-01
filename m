Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0283F23B5
	for <mhi@lists.linux.dev>; Wed,  1 Jul 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902195; cv=none; b=T/ibtaOh0fJL22PjDmkCb+rtwcRzFAiX5u+NnsEfEDC0ne7Lgtv5FbixxLkPfqZeheEqCjTRLOQoELrKW2CF1qok9K+Mm2xrrowY4lkv06+LQ56x2/fk9Gmpkz4hCsGOexsz0h5bNYlY7TJDOYHReP9f+EcMbGahLR2uki8wm3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902195; c=relaxed/simple;
	bh=AFBuZF9+MK6MOBrXljGd2j9MG1qbHJ+p1ga5zd6y3rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHvbuvEacMij92WNmZlQhqpqt2lNlvsVjbp5iyHgbsUmnFwPu4bUdV7aZP3uaiSssZjE30DvTFQVcM4S8VIHB0xmKq3zkAlB2zBJYaUSv0nKLXF6zQbKYLOsffbGBqRd26jTeVTUsKfHQWoAc0lxt9SxRKMAVnuk9n+v1jibE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xjv5oH18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCZE0amu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xjv5oH18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCZE0amu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8PXv761398
	for <mhi@lists.linux.dev>; Wed, 1 Jul 2026 10:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=; b=Xjv5oH186eURa32i
	pv60++cqYka6A4+MLPNPZRWttiWo+5Uw2mVC44ibCjKYpdE0dW8g70mIx8/qk8gl
	G5zuZ49wxkH2HZmrNyKCN3vwBb8lFzGDz5jBklbIOFRrb7S6FJ+qAwkSvxiAiqc4
	QqUpem95ahLLmmqKjQHeYDkK9NkTi6IhynEpP1U5H4IySL6+zee/d2xxxT26ub1I
	LxhvIFr39vOOk171cF4ljxL8981ABXnArN2jjqza5A6ApZl4dYJ5kNCtJDsRsQ3/
	uomUn8l+wyrN13QziaD+IjncZ0ruKigT/S1KPDRXFxYcmn9Ri4AWG0NZ1GlBAqY/
	oyChAQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd05aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 10:36:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a2509456so600196b3a.1
        for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902193; x=1783506993; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=;
        b=CCZE0amuUo+R3Te2ymY/vcFifhYDmv9fSg2iwYwICvBlmYgqNmkWcJdS/pvV38LlPU
         jxXq2wwHZJ6dmR3M6wQbPxUkdPK1YmWuovN85n8qwQjFmgnYakJE+79TNSf2wdx/tAIs
         NmePOGmBKlRSNCUX0MyNif59+o5wvxdGU7XY6E7cgFo6GqCAf32sizF1Jz0WRkwfLHtw
         kOYbTLjJE0oH9UYbDYYwCOJgRmFCPSMk/HHkxrXAle1UF8PE4VBXJXdGZX9FDHxrQfo+
         Ig4Ku6JuDaEklaK68QTUDuaD2BR+5PfteixwMTKPK3iWENsWm+AUTxkgwMNllA0gvpL3
         Gevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902193; x=1783506993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8G6SEKueMAy0GKvF0ivRFmIBQ9+gkPfS66+uUscIR4=;
        b=jznhi+bV8dtHVV13Kb4AtyB2204LYrQWUNnBIyjFXCaTd0AhJxTrRJGQVh4rDfSRHr
         qs8NiXNP6jURVVvAmG9rD1gwn/ICGBKEZY6zCfgb0L0ndNcZWoew8BcP9b7jZhMns8ag
         3h4L5X1u8FWYxhZZSWirf0X9dqOdkjyoop34vc0Ab5JW26WhBgZ316UPdll702Lb8K3g
         1XlgyhRE6sPZFBlpEYdcnz5nmFXGVxwB4vxPPL0mQtrsvN8dQZXyGzzqUrBjB1X4KRP4
         I2OFtK9WH0XTRfvUnPGKpBSZnE0U8vCO47XlZZVbEE0Obs3DU3snX+tNDI0NVUgIQpjd
         AUQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7t+oZOo0ACduKh/SUzyFPUylDIjuh017qsaal2W8tx6457majN8lBjZpKlRQSNT10Ubc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/QuQJrn35oBHZsBSa82bRCRurVgYGrMg5zBEf2R2FwONQpDqI
	4fKbymTElHKeFmjk20jgUI+fYK+0jeMbAUD26NLFA0ZxcCy6HfZfCD4tq0JgN2HutsVWkhtP595
	k52yT1eA9oJNjDY3W+1rk74UMtfS+5wHg+UJHLgSD2XuCFNd1+9gCed4=
X-Gm-Gg: AfdE7clS2U1Zz4RM1tAF6SDZJVBhYLPHmvqJbhzXizmIJkw/2PYnfvHhm64jOYN0P+W
	Ufh7SoJR9KBDVgk1R0smxQ2WpoM4gu/+btRZBQOYtrp5VtRgR1ZbL4AKLqTJVxUT1mC8EjO+lck
	XvR8PznLco/0e6CWHSCjfKWNFsgpy8JNp6sMZER+9fdRv4Zv4k2YzSO01asCsUqvNlqn0Mrg/Lg
	BfUhqFw7GSo5JEZ9/9Rgqv6ZsJx0w+mJAJgyAK+4UeHDC9z7YfnO0tvgo1z9sJ/kO+Z1uM8qMdk
	jISU2iyoSFhqwyshrjpebXseqTuU/R3dr7CJm8cNil/tHdMUVkgOkZ9mayXXwoRmhkZAbhTL1uL
	kQWJkV/4CLUFv+C18VwI8h+miy5Db40z/htS4XrTMYE0=
X-Received: by 2002:a05:6a00:1a88:b0:847:8625:f7bb with SMTP id d2e1a72fcca58-847c09f1bd2mr873345b3a.60.1782902192716;
        Wed, 01 Jul 2026 03:36:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a88:b0:847:8625:f7bb with SMTP id d2e1a72fcca58-847c09f1bd2mr873321b3a.60.1782902192198;
        Wed, 01 Jul 2026 03:36:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3803736b3a.19.2026.07.01.03.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:36:31 -0700 (PDT)
Message-ID: <6a40311b-8f3d-4bcc-a3d7-98022ad119eb@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:06:26 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
 <20260416-sahara_protocol_new_v2-v5-7-6aebf005e4ba@oss.qualcomm.com>
 <x732txb6wf2giiv22xw66sqrnkjluaua5kbsmjugv4rbvpjqrw@ro2wbv2olzbd>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <x732txb6wf2giiv22xw66sqrnkjluaua5kbsmjugv4rbvpjqrw@ro2wbv2olzbd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44edb1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n9NIK8s-xoBB9Vmc4qAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5hrdImBTVyQI1E0KnXjLV7ai1fBVO8lz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX+H+SsDpgSiYH
 DHKhccnwrGSRZIpJR1xD2aw0HkIpHsvboOO8jMN7q0ZEZEsqpvS5CLeHKzNx3vp5QkZv14+AwZQ
 fBWchKUvtyfqOmqZIEf/YGzWSt1v5I8=
X-Proofpoint-GUID: 5hrdImBTVyQI1E0KnXjLV7ai1fBVO8lz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX/rLXJXaPmbqx
 QCzWTwOntyhhUEUmBIt4i+FX0w1bGN1qlxs6vlN9B/yxm9gEufUpZ3WFYiiVAWC1lck1p2/2yxa
 wRkvkJHCgs9t1EgRPFPGMJ7bNIKsUA25MtNwAcPyxTrijbnwugq5zJhtiyO1cdTupVqoQuaR3bl
 0PDwm9jeSwb+lahfQyt0o6w79wZp0XGG+WrR0/6ta75ExCpe0Zt9iVbwsVaPXLwZSARHHhSmZFZ
 MW0gOGECdwPY7PSJBRrXen5tNfohBVbKhKsBQCoR/OdQe3awT3kZfNJT5skxWWVDPABT5raGCqL
 /IoxywnnGc2rTQ/YdJkl3AksM6fU/dVLSftXuWxFj6hNrUhjkvUYFNlZ4RKy44w/PxUZztpL/k0
 zNPpjlzvTMAWg7i6CxoWze6FxC9mYHZ/q2YGqw+t50A4/67U+5w0Crt7Kk/LJHAco+GsSAF0pxg
 nd8QbDuY3e5lMNAsLzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110


On 5/12/2026 7:49 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 16, 2026 at 07:39:48PM +0530, Kishore Batta wrote:
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
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 ++++++
>>   drivers/bus/mhi/host/clients/sahara/sahara.c       | 69 ++++++++++++++++++++++
>>   2 files changed, 88 insertions(+)
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
>> index 07bc743aa061dd2fa85638067d494562152474e3..fef5dc1d8884133397d204f23361584fd1d9b075 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -273,6 +273,73 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
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
>> +
>> +static const struct bin_attribute ddr_training_data_attr = {
>> +	.attr = {
>> +		.name = "ddr_training_data",
>> +		.mode = 0444,
>> +	},
>> +	.read = ddr_training_data_read,
>> +};
> You can simplify the attribute creation with BIN_ATTR_RO().
ACK. Will use BIN_ATTR_RO() in v6 patch series.
>
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
> So you are expecting this helper to be called mutiple times without teardown?
>
> - Mani
Yes. This helper can be invoked multiple times for the same controller 
device without a full teardown. In this case, Sahara probe can be 
re-entered across events like subsystem restart/warm resets, while 
underlying controller device(mhi_cntrl->mhi_dev->dev) persists and is 
not re-created. Since this sysfs node is associated with the controller 
device (not a single probe instance), it should only be created once per 
controller lifetime. The devres_find() check is used to make the helper 
idempotent and avoid duplicate sysfs creation when probe path is 
re-entered. The sysfs lifetime is intentionally tied to the controller 
device, so it is only removed when the device itself is released.
