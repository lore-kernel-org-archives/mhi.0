Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D73BD246
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439930; cv=none; b=lOkbCwopPSyR+Y/7NvqnZK+cnZ6lnjW3CI77cZLIF0A04z93SOkXrciNqZABgbe3YwDICZqxN4Nng/USlmIOD0x5jQ4eb59b+jPCbtdbPv7Bw+2k51hOXr7RDx8DLu/5YqMZOaiYVRIDL1Ac1miMqLW2TtZ4TP2inBgVX7HW/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439930; c=relaxed/simple;
	bh=BYJ5rVqFRgTnxeMSjvRhSgYe8ffD+B5w+Tjsrc21jZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWbImyFLqrWPG1DELBHsDXT+mpkPqfT7e9MUwY9CxsOYUnorCCt4Pi5nPrhQ1fx33UDflDjSMeTFDlvOfyV49M2DGtKf4GJ/0Fu0RBb/qqFJZGclnaThWEAPs0j9XfwfWPy559kOJrDKG3ose2wRuFCsITTl+HulfPFArTpByyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fqnbnf5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbBF8a0x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fqnbnf5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbBF8a0x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BmHQ1433843
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0KchWkDklqgs7rB211yiwG6I+6COkYJkCvle0beTDA=; b=Fqnbnf5DNqxV1Qjr
	xFJ00qsGb+AHPKJk2tXgx+blgdntm/qaHerXv9ZoOjfh9Bzr/dhUOAPt4fROgDYm
	BC1KgEWfNEbYYx2UTlpOGutf/+W1GjoA73ESXBPdO6hklKsEDo98TEFidH9mISFw
	mql3VFK5F+HiuPIlgW21Dn7zh/CtwRXByM0i6uX8tks76YPQ7Ke1I1kj1zTKUsx2
	tJ0daANecaMunovsfAfFGuKAStk4BAGqYxQJ9L5KZ2/HOYZxiZvQZ2fQHYns8y8l
	cGNxOrbtOS5WliWA+5bjdssRnDEdWu+MfdaFhKHj6nL5IgoB6yNlLjc4JfAod8PH
	q2YHQw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hgfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:12:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so5615387a91.1
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439926; x=1792044726; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0KchWkDklqgs7rB211yiwG6I+6COkYJkCvle0beTDA=;
        b=IbBF8a0x7eZpdL513pNjlSAef8BjAkg2mSbmIPEBBbUc/Nt5iamE8tPCuSEdTbgmt9
         dgyJRHGPY64WtVVKb/zOkLcBRmgFlu3FtWJbZ6OKRSaMgbzBrBK0wKcnmjWCNAV61UWZ
         Cmz5OMxZIUgIr7YJa4Lmo6itjseP0QLsoUb4pkqe26+D6FEH0CN4bbqunzuDyqojmQ+j
         xM2JNSkvSs9xpeJHWaYZknzYITxcs9V5Y0rYCIvYHrfdK/tK42H6GaUF9CPgnLUO5ruJ
         he6xLhY1b6X6F7lfG/jd8Fgf+qc7e8picd0HJA5rqhsiK6TWZJtxix1RxH9L+p+yTuDT
         +eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439926; x=1792044726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0KchWkDklqgs7rB211yiwG6I+6COkYJkCvle0beTDA=;
        b=Jsw8XVG7TeNBYoOS/R/J+wuUYMHgG272r5LkSw9i2zJJq/e2Ef+t/A2Zhm/lB7i48X
         Q9TUTUmSTnOXWmXwb21RxcjKIUIPGEbxV0+fqju9XadPV8Tj3Om1L05XGEIyZ0A37gFt
         0bUHgVB3OE2ZAecI7MBLfCw6W1MPrQrpdz9XWtPtcTwWas5F80nsNQlbfGBaWujL1swh
         /zayExVXLwJs0/+sJV0hEC6m3DCoOYppSH8WKhzTWsZXAap/84Isr+9toXaNppHBqyCS
         hQCjZn1+a4AAgm3gg6f9v4x04rflDmqJe7TauW+xtZvyTq/RpSwAZV9ZVmzgS5mxqf+z
         tNNg==
X-Forwarded-Encrypted: i=1; AKwUvByiiCHPicJvbZ9GLRYcfRiUxwn6w2lm2vObqFlJw6NCCqQqEjvuPjxlGwFNHqZbywC4tAY=@lists.linux.dev
X-Gm-Message-State: AFq9FYL6cb/ouDni7yKlWLK6rvsak5pChXs81r4WkcZKny3znusRulLQ
	sVtyb9vSHLi+Uzf3QmTxj8Zl4T10e75Yu9K43c//8v6T1+nGKFu8i5vOJ35eZ+F1q+cqxYgrpa4
	hGsMJJQGSNF0LWq9biH9j4sQRFFrPf0SSHQUKPKXd+ZnntGwM/9FDpvs=
X-Gm-Gg: AYBFou1SRYKWaeDxNPWUAkXQffExSh+JAnMyWMBFo1okMdlZw8scIyAAsDcmdT+W4+d
	xaZYMRPN3hxY3s39e68wNKoOaAdZuX1gRLHvkaXAxFO67u6eSfum+H3AfQz0Hpp2oCmt/y1sBqH
	iwz6ptKVgEULihecoaI1ZMGqP3CyO+vqxksiYRmvKiLzOC6rhaUTJCaTFXl9o+zyKBevqFGUvJY
	17ad+3/u+/alcVOE6ZZKdhIyMqBYsNhDnH8jiisaswbY9RxVMSxxhOZoBdpKQhm8J/tR0Q8jTAq
	x9RNUxlcYC1SQqUBQRKDbRxnv/zfwuqMTDUARDLZYO1HkvAqLdRxTWMLFeOKYdL2YHJTz65Vm0Y
	8+QLhZ1TcxSvyruwKGRSBOJdKcii/oY5N
X-Received: by 2002:a17:90b:3ec9:b0:3a9:8482:420 with SMTP id 98e67ed59e1d1-3a984821aadmr1865882a91.40.1791439926375;
        Wed, 07 Oct 2026 23:12:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec9:b0:3a9:8482:420 with SMTP id 98e67ed59e1d1-3a984821aadmr1865857a91.40.1791439925817;
        Wed, 07 Oct 2026 23:12:05 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aafbb29c12sm803186a91.2.2026.10.07.23.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:05 -0700 (PDT)
Message-ID: <4e3cbe78-7a32-42e8-90be-db5158907cad@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:59 +0530
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
 <rwjiriaurj2ajowddjjerrr5wsu4ios6lpm6adglvlzsrxf4x3@tw2wbobghgca>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <rwjiriaurj2ajowddjjerrr5wsu4ios6lpm6adglvlzsrxf4x3@tw2wbobghgca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX/O1nkvjf6CAg
 nqMSBgEBGHshepZIuggyFVbDslx/ArH1oEWPqg/iK/2/OTBtKZhimK4ZdZPlfSXD9jJ+fgQlDzc
 bt+adIWUj5F0VDPWfvSzNMCjKN9KyBI=
X-Proofpoint-ORIG-GUID: 052DKYFm2UpOdH4B2krn3ozcjsDjZ42b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX/G6TSwbeYQTc
 J9xlRIawpSeYMQmbP09XeIh91qRqh8qqNLDazlEgs8tX13y7dhOcHInXNBZoD6D8cHahG9XuloC
 61lX276AYqNp3+yTbK4N3yCXK8JD6rLsiQKw/VyV5yzG0Qa+2U1R/xkQRNyScpKQM4t9e+Q2LUX
 pl5RUOmnNY+2eqRBPQuf0Kb5f//+PM1q4N22rfWlurU0YDJCXIZtf5wLM28y1y7NG96AHNuw6DN
 SM+jhkiN5LDpNb0ILSfv9vnBLtc1RFcWbvXZLORn9eOfVnMZI8L1jAuaPFJGX97l52+qVSkIFwF
 HSJN3SM9zIEWdtqD3hiAq+iJIpAgYPFQjpxwUJ1zCyTOG3b5B5cYn0N1Cw9ZgU7rtZcha1BzZ1F
 pqHqVbq/vkte+HnwkpVY0umq4ce5iEUF55xgGBNGrMVgdXRuEFDLvQkvhgENRNksAHVe/vGxTWf
 G2hFoLEl1wjFabK0UUA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac73437 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pIBEpd9KSKheSvzPkZgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 052DKYFm2UpOdH4B2krn3ozcjsDjZ42b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/22/2026 5:52 PM, Manivannan Sadhasivam wrote:
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
> I think I asked this question before, but didn't follow up. This attribute
> should be tied to the SAHARA channel, not the controller. There is no reason for
> it to be available when the channel is gone.
>
> - Mani

Sure. Let me clarify. In this flow, the sahara channel is used during 
boot and is torn down after the image transfer sequence completes. If 
the sysfs attribute is tied to the Sahara channel, its removal can occur 
before userspace has an opportunity to read and save the training data. 
This is why the attribute is intentionally tied to the MHI controller 
device. The controller remains available after the Sahara channel is 
removed, allowing userspace to read: 
/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data. This attribute 
remains empty until valid training data is captured and is removed only 
when the controller device itself is released. Thus, its controller 
lifetime is required to preserve the captured data across sahara channel 
teardown.

