Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0333A9FF;
	Wed, 22 Jul 2026 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722992; cv=none; b=muHHPE4mcQE/x+3m8mU2ybsC4o6VeMGmOOmUibt1rynN+nh+buz+PfXIffYLx0a4zWrg8sNf8vm4wREEwXqBmOtI9kg6IWX4dzb2d5G9dkCsz4Z3316FVqTQ+fD58ddxycH10P5SCg/BLH8d1sEBsWi/33A6KqjtkeYwmK9FKL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722992; c=relaxed/simple;
	bh=/isOhpp5WmvCwxYkq1/y1tPUMoJBD2pPItulA2x6lTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQit5XbEBDroR8v2zwJDHXG1LifRLzBuIBhupDxFBFnPt211Q70HbZlqkYqYHcbUnDIsFCxKo2lOlpNeslBW5euddMiLVDZ3zsGRc0ZUx512Cq/4076Q9E6XbcVoPBK6o6C3odRuA9Gc7deEMeP60nfU/w6p3sedW5/SS2+H8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8Y9HrY7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8Y9HrY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B357B1F000E9;
	Wed, 22 Jul 2026 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722983;
	bh=EMbZsERoJKBM6voGPp6fXnvJFBr+APUW50AqH0s+A4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U8Y9HrY71uz3pEV5Nuq2yk8ortlGJVX0l72Ii0UtB9p7jNTxNFB6/sW4NXNIZe43h
	 9H+DPi0u4qhgwEL9Dx+B0Av4+tsSvsC7hE5p74o07zC2u32r92SnIRv4BZ86aX0XTG
	 j6Ib0DqU7asFsSnt5rtfHxCt4T6uAsgcaLLQnTYRkn+ouBy48xcPQgjdzaRGD+4d9c
	 YgS3WYi/LrzQFmV4XFWqNN1Z2+Hp0ZpAtinEkhr+d95fMqTo0nTY1MohHweqv2ArPn
	 NsIZGbAmCQhSzp8g+dbsnEWxsFesV3PRn96tagH7X8aj7+MyRWk1pd8tCv17Ycoj39
	 5KiwnaX8TDlFA==
Date: Wed, 22 Jul 2026 14:22:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v6 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Message-ID: <rwjiriaurj2ajowddjjerrr5wsu4ios6lpm6adglvlzsrxf4x3@tw2wbobghgca>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-7-3a78362c4741@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 04:07:41PM +0530, Kishore Batta wrote:
> DDR training data captured during Sahara command mode needs to be
> accessible to userspace so it can be persisted and reused on subsequent
> boots. Currently, the training data is stored internally in the driver
> but has no external visibility once the Sahara channel is torn down.
> 
> Expose the captured DDR training data via a read-only binary sysfs
> attribute on the MHI controller device:
> 
> /sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data
> 
> The sysfs read callback serves data directly from controller scoped storage
> and protects access with the controller training data lock. The attribute
> lifetime is tied to the controller device via devres, allowing the data to
> remain readable after Sahara channel teardown and ensuring automatic
> cleanup when controller device is removed.
> 
> Userspace flow:
> 1. For each controller device, userspace reads the ddr_training_data sysfs
>    attribute.
> 2. If the read returns non-zero data, userspace persists it using a
>    serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
> 3. On subsequent boots, the Sahara driver attempts to load this serial
>    specific DDR training image before falling back to the default
>    training image, restoring DDR calibration data and avoiding retraining.
> 
> Add ABI documentation for the DDR training data sysfs attribute exposed by
> Sahara MHI driver.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
>  drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
> new file mode 100644
> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
> @@ -0,0 +1,19 @@
> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
> +
> +Date:                   March 2026
> +
> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
> +
> +Description:            Contains the DDR training data for the Qualcomm device
> +                        connected. MHI driver populates different controller
> +                        nodes for each device. The DDR training data is exposed
> +                        to userspace to read and save the training data file to
> +                        the filesystem. In the subsequent boot up of the device,
> +                        the training data is restored from host to device
> +                        optimizing the boot up time of the device.
> +
> +Usage:                  Example for reading DDR training data:
> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
> +
> +Permissions:            The file permissions are set to 0444 allowing read
> +                        access.
> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> index 07bc743aa061dd2fa85638067d494562152474e3..72ac751c302a98448b5756c9feb438647bd0ce4b 100644
> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> @@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
>  	return ct;
>  }
>  
> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
> +				      const struct bin_attribute *attr, char *buf,
> +				      loff_t offset, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct sahara_cntrl_training_data *ct;
> +	size_t available;
> +
> +	ct = sahara_cntrl_training_get(dev);
> +	if (!ct)
> +		return -ENODEV;
> +
> +	mutex_lock(&ct->lock);
> +
> +	/* No data yet or offset past end */
> +	if (!ct->data || offset >= ct->size) {
> +		mutex_unlock(&ct->lock);
> +		return 0;
> +	}
> +
> +	available = ct->size - offset;
> +	count = min(count, available);
> +	memcpy(buf, (u8 *)ct->data + offset, count);
> +
> +	mutex_unlock(&ct->lock);
> +
> +	return count;
> +}
> +static BIN_ATTR_RO(ddr_training_data, 0);
> +
> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
> +{
> +	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
> +}
> +
> +static void sahara_sysfs_create(struct mhi_device *mhi_dev)
> +{
> +	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
> +	void *cookie;
> +	int ret;
> +
> +	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
> +		return;
> +

I think I asked this question before, but didn't follow up. This attribute
should be tied to the SAHARA channel, not the controller. There is no reason for
it to be available when the channel is gone.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
