Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF32D3A69;
	Mon, 13 Apr 2026 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081544; cv=none; b=piKB4cRjHBcNZHMNaC6Y2mwcBovbMaJD+LJ6o6tGbzYzEcKSNXi2wCD6bBg0VBWI0WhnXKTHi1C24TGiSKjBvnt1567AjRID78zlMWiGOWTg9HupV7PUeSQmQq6enV6gC8A7i4vVPWSzyNHk3+6m2UL+qK+nFG3duGvQVgnivqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081544; c=relaxed/simple;
	bh=IeAc2MAFD+TvhAlKL5vJUuT1PKIAfNuqDUkS252wats=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=je0m9W9o466W4Idkgj5vjcra62gHphg9j6sb2yJA54ra0uNjD5PRWwHT9z76rn89HoJNDh+FYFzVKVoTdWbNu+au1cPVWoGrD1l9gsLrUN6Rgu9MyMcH0DletDKRylMvY1xOPAM3UlNBo8wyG6j5TzB3VjLmWCANpnMlteHKyZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpcDVerb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpcDVerb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D00C116C6;
	Mon, 13 Apr 2026 11:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776081544;
	bh=IeAc2MAFD+TvhAlKL5vJUuT1PKIAfNuqDUkS252wats=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpcDVerb1NPxMSS+BV7Ogl7QnOC/LllsqBL/cT5i+428rZhDold7AxdrgVlbhGebR
	 3EQg0h31BKtMld41UWTNFCyLh3MnjAecuPu+9t+mLSklHDqTxR4gPerMv41ABVBbnJ
	 f9IPR3OzvLT6QN/d8FGQA0IAbjy0DvXgcIqaYo7BfkR0i0nCh1p59/jAtqq/arTd82
	 GJSolknUEYSauSdeAxWDOzSYbNV3z3csKwtI7iNwYVUV6tbwo65o+ttvzKHfOHepq/
	 +Dcep/LwF1aslFCTzxVrQoZWXcJq3YUTqhObBjMW4Ak6qcgE/pXB2IR3DufSuzaLXg
	 7dWV24Phdlhuw==
Date: Mon, 13 Apr 2026 17:28:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v4 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Message-ID: <tbwahssgudfeacfj3wcg32yw5fkqorswees4gv4geypjmmdcyu@tv6qkuhyw23l>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>

On Thu, Mar 19, 2026 at 12:01:48PM +0530, Kishore Batta wrote:
> DDR training data captured during Sahara command mode needs to be
> accessible to userspace so it can be persisted and reused on subsequent
> boots. Currently, the training data is stored internally in the driver
> but has no external visibility once the sahara channel is torn down.
> 

Maybe share some steps on how the userspace is expected to use this calibration
data.

> Expose the captured DDR training data via a read-only binary sysfs
> attribute on the MHI controller device. The sysfs file is created under
> the controller node, allowing userspace to read the training data even
> after the sahara channel device has been removed.
> 

So once the calibration data is read, how it can be used further?

> The sysfs attribute reads directly from controller-scoped storage and
> relies on device managed resources for cleanup when the controller
> device is destroyed. No explicit sysfs removal is required, avoiding
> lifetime dependencies on the Sahara channel device.
> 

Missing ABI documentation.

- Mani

> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
>  	return ct;
>  }
>  
> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
> +				      const struct bin_attribute *attr, char *buf,
> +				      loff_t offset, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct sahara_ctrl_trng_data *ct;
> +	size_t available;
> +
> +	ct = sahara_ctrl_trng_get(dev);
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
> +
> +static const struct bin_attribute ddr_training_data_attr = {
> +	.attr = {
> +		.name = "ddr_training_data",
> +		.mode = 0444,
> +	},
> +	.read = ddr_training_data_read,
> +};
> +
> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
> +{
> +	device_remove_bin_file(dev, &ddr_training_data_attr);
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
> +	ret = device_create_bin_file(dev, &ddr_training_data_attr);
> +	if (ret) {
> +		dev_warn(&mhi_dev->dev,
> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
> +		return;
> +	}
> +
> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
> +	if (!cookie) {
> +		device_remove_bin_file(dev, &ddr_training_data_attr);
> +		return;
> +	}
> +
> +	devres_add(dev, cookie);
> +}
> +
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  {
>  	char *fw_path;
> @@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  		return ret;
>  	}
>  
> +	sahara_sysfs_create(mhi_dev);
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
