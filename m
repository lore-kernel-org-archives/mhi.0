Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54038F64E
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927838; cv=none; b=LFkq5bk6i+lOFqvdkjE6+0uHNqoVuEs3rdgIk9oVZ6+/aUHVm58PgrsfXCh6ltsa0ewBcEYkRG1eE1sb/JGO8Dp2xwPhCmohwYMaexmQuNFmhh5sxkASX0BOiulof6jLG/FX6NkZABIPeKMqbbR8f0b+2BCLE5Mtr6lmD+Xn7L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927838; c=relaxed/simple;
	bh=Y+CcFGR2oOYkQpeQy0juSOs+7RRYPsi2bo3KBJtoaF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAPHTNTLc2p8G0zynoxXunErk8S5bqTTsQ66D8mHjLFMORiG8Wi4d4quH0L/WjlN9BYilXVGAY788wHu4a/1jbpULI9jzXKmPPL0PiL8LiNNksnST8h0MJcSyRdbMnf4FigSRACYffh8TeGFPyuR5cqE94kO781WAIr8ZGTPBIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFRZG0FB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ls0CnL0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFRZG0FB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ls0CnL0Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhIk648361
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Em8mVgyGdEfRfVq1ukW+9EQ7G6falQSSjNEsV/umQPg=; b=oFRZG0FBTXeGJMO7
	f5LvKnJ3r5wpsshA11v9obYuL3jKH64/1p+uVpjQ89vRdVurxK1TSUVGzT/0IKuH
	BoZjyVWB5FV1OXcTREh0siUr2XPrPTg9STj2dYweUWCtsivda+Z/lhJ3pno/+E4K
	+YyVQK1UkoF7yhpr8TQYwBgENLnJOdvUMaNh++9PhlguQ6o+wTG5myzklqYXbS6l
	upsNOmHwYJJaJQigTKTRI4yLU/7KHJ0MzmLjjEpzdOxpZ9nvT0spUZxRfeLu73CM
	qVYVITCw5AmSJLIt2y07or3Hk5tWmpz0jnasNBVTpAZ0zXmkQzmJj9bzdWg68lLC
	Q+DKKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4v1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:30:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384419c6c74so4072869a91.1
        for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927835; x=1784532635; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Em8mVgyGdEfRfVq1ukW+9EQ7G6falQSSjNEsV/umQPg=;
        b=Ls0CnL0Yh9mxfFrsUakKKtXUpd9gb5xt1NeFa6d3qTyGnsKzYmCK5MJIL5aaAyZd4W
         X11Y1O0YmETRPgRTbIGRcEkP0UC8oqZ+22GIIeyCzr4XSykX5AVxMnSvmAX1DLCT4bO8
         sRZMdbp+dqTsKFON+mOTzCB1789nuKGXbrPN2w3Z4/MH9WBqtlJTdyEtGjdMouCzHIbi
         x5DaM9uXOk3qJOKj6uVLXB7aeyCrcVgwX3QyMfFneHuZz7Ezvhgqymg4Y11xivn2wka4
         Gz6tVJoQzG2rD+/9KeLLrHcWYrK1/PysOwEJJbH06BYMes7LajLQQNnQmEe2Fuy06zHa
         SxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927835; x=1784532635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em8mVgyGdEfRfVq1ukW+9EQ7G6falQSSjNEsV/umQPg=;
        b=fILNWW0LwaF134ltuW81U8OCtaEki5ESufLTU+qOGiBnDcBhnycNZj35kKHMy/8jMY
         7NQyrchQjYrOE8Ph98BcmUiVh8TUQUL1W4GusG+cI8MN9IE1x+tKxP/grK677tF6WX48
         yptDGfD+1O/wRJ+NXkqh0hebe1TfN1oal5LeueEQQTuGcbAIiXCYLAJTk27XbSk9CWgH
         qzecI7BVoZNMEyeVx4NrFyyBz44R9rU02qzO7HFf95NK8QiPZjoH4s+/t0GPxyPZOzUI
         4yluJ2SD3My5DN3pB9zct3jostRPzhzcH9CNeKFCd1PZJw0VpoUhzoNqCgPG/0iR6/2H
         +GoA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6B9w/Qb52e+SPsXhM64r0fWdr9SEo4usBERVyS8q8S1rq1auTQaUWzWb7lmhaC/Y200w=@lists.linux.dev
X-Gm-Message-State: AOJu0YybZx0Lxb7rFt9iY5lJMXq9mRLiV/N3FGVBlh2efoYm7lchid7E
	CwW/WEnMhsb0T8ZPsCjKhxEzxcQg/qig6xoudgTd4PJPB8MjL/klBmuKNBmxW0MmGr2F/hfk078
	rJd+m+MSphcdkfGpNJ8u+WfHPUwzke1bhsLRWqcIIai29kyzr/tOmCzw=
X-Gm-Gg: AfdE7cn6r98InY2yJbP6YkBYB9B3f6yZYwY33R08rUQwdrr91T+lgeRNY4AGNKJfs3T
	HJCodbCjnMyb9DQ7K9U+MqDISo/e/+37qM+eluG+GFvw4JX5nrDK0QgKGUUftuOUd4bHplxjYvo
	gJNgTiIp4og5Q/Pe7+HuikLUAhDjFz1xzmUzMFfF9eb+1o6ClPOs0XNxe85qpxC3c5pTsgpj0BE
	rX1I9zCm0hHip8Moo7Im4M1gnV7onhLZPD17WQtdXf0jZWZyJgT4+tSz0ylBIG5ow7JKb9hKUMA
	49Owkpy0Oy94VYjku7u0wB8jmxD0WRoNiUS3AfZyEJEMKTntpaar/cX+LAzFMg8oHZWeA99ABcM
	ZilIzTpQPKaDJH9uD3gJnLTjQk9uCo34vcxPUEwQYDww=
X-Received: by 2002:a17:90b:1fc6:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-38dc7769973mr7950699a91.27.1783927835000;
        Mon, 13 Jul 2026 00:30:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc6:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-38dc7769973mr7950579a91.27.1783927832681;
        Mon, 13 Jul 2026 00:30:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a56417527sm6208769a91.16.2026.07.13.00.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:30:32 -0700 (PDT)
Message-ID: <fb34c262-5c91-4beb-a792-f00da203d1b6@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:00:27 +0530
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX4ufb/OKS8PRO
 fv7poUKsPdZZejgyITk022O1BM1OwFTfBhO21FUJy8wK6g8qjTY8abAMkDXYkjQs/YkjXyLP3G1
 DIY3LOSnn4KiXSdMMnraEHNVgFNtZv0=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a54941b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0IlxrgZsFcjQ__LXY9EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: UqchfbrtZ_DHOBisIvDApQ0_PfgxfJvI
X-Proofpoint-ORIG-GUID: UqchfbrtZ_DHOBisIvDApQ0_PfgxfJvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX68N6T4Y09HJL
 mLNftafkpYa9xFydTWIqmLcgTjoBfFrC3czHZhwUSIQipfz9i5TQiWYP772vNTLgB9uy2nVVOjY
 wsSP8EnZfWtyGzkCrxRgBvGbPr7ZDPlnwGA58VEweZLajJtVdLiLD7Ao5FINTOX7nxRt/0H8DMR
 yFMzdCLQ4EdcG6P5kWY1YpfEseslfnqzu8VcEq3TBVXPpiz0aKGS/+w5H/WIl5Inp3SP8t2Htmz
 uUoZ+maPHgK6hVCFug7Dki4hRQdxXCGQxIY582s6aWRUnQuEUcdvyPcn4awPo3XD9pDBYTr8tBe
 pIria7fCMUX02DWt9h6VAtN89cJ61pi3ZIhH6iqh4fdai4LUMbe/1Mop0Rl4XgGR96Ip6R9Femi
 NEEhoxGroGS0XpynHIcV/sCJRnlclHNv22rsYm9bKec62A8UA8tCSHrq0N44hoKbNS2vSfCZ4sz
 1I3esExYzjQ4NYv6Glw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076


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

The userspace component will read this from sysfs and save it to a file 
named mdmddr_0x<serial_no>.mbn.

On the device's next boot, Sahara will read the training data file and 
send it to the device. The DDR driver on the device validates the 
training data and restores it without running DDR training again.

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
