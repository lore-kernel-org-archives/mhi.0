Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FF1415B6E;
	Sat, 26 Sep 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420818; cv=none; b=T42JX9qCPu5TdQ051+NYely3QCDPPPBREWBRV8JK2dt1JPN0VkMUUJutbytsk9X5pAr0+W4JvCL2yBPULtw+KDMyY9DoGxzqdKeDOpXuFQWLDgMrtOq8UwzWaw4N1q6zA1bN8E9SuDuSUmVLlmegeVIg2I59929Kt6y1qm5J4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420818; c=relaxed/simple;
	bh=W7mI4gTGjxlNCsXrGc6C3iq9sXvDW/6vSYG5vbcBje8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8m2zKjl9Rg/2kgfHS+eUeibp6Qar0WQGYI1CZbLr7rOQ5ZYwy8jLD2nbBquHOUXSI5W7vU+GFH+ob/nYCT/71ZFb3y+r4l7fLzsPH52Hq2jXWNT9aadpIDBTPRfDqp4lGyOuAocCklQFN11dWHrgS6nMDjI2YZivWXRRvhHAgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwehQIOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwehQIOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9121F000FF;
	Sat, 26 Sep 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790420816;
	bh=QGNOrjyJ6PWr4LmDdqZwbqPfTJT5WT6uKZE3BfJJ0q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZwehQIOsI8/DU4MisaFy3nj1IBH743u4OfUcuj3VwK5GPfACwSPTJaHaI5svTuzh1
	 1/jGghIq2mFDkcfOH7bpeatB267/ZsBSTpr42cVhzkmHGov63iJKEr1F3b7wRzv8tF
	 c36hOVyJkvd2u7Im/aW/gNdu4rAFkdPONoERAg7/Zy738pAzr+YxDp91bVJIhLI8zB
	 669LjMApL6uFYi49iLUGiZSmKLVvr/5+X0emw15PlPHdsQ7oHEGMK0om7+NnAzGYOw
	 uzRCyRoyJ3N8kFYLPWPk+MLn18cM/txOQHfxE6F0HIbZWcCgTQ3UdHv7Obw0BaDrVG
	 YavCopeYLCmDg==
Date: Sat, 26 Sep 2026 13:06:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Message-ID: <xji3thurj6lnez56opmh5xoxzjiwtlh4o5qd6iqokbqkcb4rxu@mblahsfmtioz>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
 <20260908-lb-v6-1-66755ceb16cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-lb-v6-1-66755ceb16cc@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 02:57:22PM +0530, Sumit Kumar wrote:
> The MHI specification defines a LOOPBACK channel. The endpoint firmware
> echoes back whatever the host sends on this channel. Without a host-side
> driver, there is no way to exercise this channel to validate MHI data path
> integrity between host and endpoint.
> 
> Add a host-side loopback driver that binds to the LOOPBACK channel and
> expose a sysfs interface for data path testing. The sysfs interface allows
> users to configure TRE buffer size and count, trigger a loopback test, and
> read the result.
> 
> The new sysfs ABI is documented under Documentation/ABI/testing/, not
> stable/, since this is a new interface without established API
> guarantees yet. It is unrelated to the existing stable MHI sysfs ABI
> documented in Documentation/ABI/stable/sysfs-bus-mhi, despite both
> being covered by the same MAINTAINERS entry.
> 
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  40 +++
>  MAINTAINERS                                        |   1 +
>  drivers/bus/mhi/host/Kconfig                       |   1 +
>  drivers/bus/mhi/host/Makefile                      |   1 +
>  drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>  drivers/bus/mhi/host/clients/Makefile              |   2 +
>  drivers/bus/mhi/host/clients/loopback.c            | 287 +++++++++++++++++++++
>  7 files changed, 349 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e47e8443f309199691a50d70adadf84f3237037
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> @@ -0,0 +1,40 @@
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
> +Date:		August 2026
> +KernelVersion:	7.4
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RW) Size of each Transfer Ring Element (TRE) buffer in bytes
> +		used for the loopback test. Valid range is 1 to the value
> +		reported by max_tre_size. Default value is 32 bytes.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
> +Date:		August 2026
> +KernelVersion:	7.4
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RO) Maximum allowed Transfer Ring Element (TRE) size in bytes.
> +		Reading this file returns the upper bound for the tre_size
> +		attribute.
> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
> +Date:		August 2026
> +KernelVersion:	7.4
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(RW) Number of Transfer Ring Elements (TREs) to use per
> +		loopback test. Must be greater than zero and must not exceed
> +		the channel ring capacity. Default value is 1.

How does the user know 'channel ring capacity'?

> +
> +What:		/sys/bus/mhi/devices/mhi<N>_LOOPBACK/start
> +Date:		August 2026
> +KernelVersion:	7.4
> +Contact:	mhi@lists.linux.dev
> +Description:
> +		(WO) Write any value to trigger a loopback test. The driver
> +		sends random data to the endpoint using the configured tre_size
> +		and num_tre parameters, waits for the endpoint to echo it back,
> +		and verifies the received data matches what was sent.
> +
> +		This is a blocking write that returns when the test completes
> +		or times out after 5 seconds. The write returns an error code
> +		if the test fails or times out.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70663089f071c4eaa07fe7b9baf9003d8b981c07..b10f8cd592954e1450e5851045962bf05dcf1a50 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17628,6 +17628,7 @@ L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
>  F:	Documentation/ABI/stable/sysfs-bus-mhi
> +F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>  F:	Documentation/mhi/
>  F:	drivers/bus/mhi/
>  F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
> index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..627c57948235aa52348179ae8b2d0826ebaed01e 100644
> --- a/drivers/bus/mhi/host/Kconfig
> +++ b/drivers/bus/mhi/host/Kconfig
> @@ -29,3 +29,4 @@ config MHI_BUS_PCI_GENERIC
>  	  This driver provides MHI PCI controller driver for devices such as
>  	  Qualcomm SDX55 based PCIe modems.
>  
> +source "drivers/bus/mhi/host/clients/Kconfig"
> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
> index 859c2f38451c669b3d3014c374b2b957c99a1cfe..2a16008aeb38127494782bbff4e1656428d2b776 100644
> --- a/drivers/bus/mhi/host/Makefile
> +++ b/drivers/bus/mhi/host/Makefile
> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>  
>  obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>  mhi_pci_generic-y += pci_generic.o
> +obj-y += clients/
> diff --git a/drivers/bus/mhi/host/clients/Kconfig b/drivers/bus/mhi/host/clients/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..8bb5715e61d0d6e64a51012b4e1594ba46e5bfc1
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config MHI_BUS_LOOPBACK
> +	tristate "MHI LOOPBACK client driver"
> +	depends on MHI_BUS
> +	help
> +	  MHI LOOPBACK client driver that binds to the MHI LOOPBACK channel
> +	  as defined in the MHI specification. The LOOPBACK channel is
> +	  implemented by MHI-based devices (e.g. modems, WLAN) in the field,
> +	  where the endpoint firmware echoes back whatever the host sends.
> +
> +	  This driver exposes a sysfs interface for testing MHI data path
> +	  integrity between host and endpoint. Users can configure the TRE
> +	  size and count, and trigger a loopback test.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called mhi_loopback.
> diff --git a/drivers/bus/mhi/host/clients/Makefile b/drivers/bus/mhi/host/clients/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..3811b6928f42b38f94b1167941cf3b0fe512d32b
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
> +mhi_loopback-y += loopback.o
> diff --git a/drivers/bus/mhi/host/clients/loopback.c b/drivers/bus/mhi/host/clients/loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..058a8b587933245230eaae61bb7fe3361d4a362a
> --- /dev/null
> +++ b/drivers/bus/mhi/host/clients/loopback.c
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/errno.h>
> +#include <linux/mhi.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +
> +#define MHI_LOOPBACK_DEFAULT_TRE_SIZE	32
> +#define MHI_LOOPBACK_DEFAULT_NUM_TRE	1
> +#define MHI_LOOPBACK_TIMEOUT_MS		5000
> +#define MHI_LOOPBACK_MAX_TRE_SIZE	(SZ_64K - 1)
> +
> +struct mhi_loopback {
> +	struct mhi_device *mdev;
> +	/* Serializes the sysfs attributes against a running test */
> +	struct mutex lb_mutex;
> +	struct completion comp;
> +	/* Tracks outstanding DL+UL completions; comp fires when it hits zero */

This variable is only used in dl_callback.

> +	atomic_t tre_pending;
> +	u32 num_tre;
> +	u32 tre_size;
> +};
> +
> +static ssize_t tre_size_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", loopback->tre_size);
> +}
> +
> +static ssize_t tre_size_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +	u32 val;
> +
> +	if (kstrtou32(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE)
> +		return -EINVAL;
> +
> +	guard(mutex)(&loopback->lb_mutex);
> +	loopback->tre_size = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(tre_size);
> +
> +static ssize_t max_tre_size_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", MHI_LOOPBACK_MAX_TRE_SIZE);
> +}
> +static DEVICE_ATTR_RO(max_tre_size);
> +
> +static ssize_t num_tre_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%u\n", loopback->num_tre);
> +}
> +
> +static ssize_t num_tre_store(struct device *dev,
> +			     struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +	u32 val;
> +	int el_num;
> +
> +	if (kstrtou32(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val == 0)
> +		return -EINVAL;
> +
> +	guard(mutex)(&loopback->lb_mutex);
> +
> +	el_num = min(mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE),
> +		     mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE));
> +	if (val > el_num) {
> +		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
> +		return -EINVAL;
> +	}
> +
> +	loopback->num_tre = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(num_tre);
> +
> +static ssize_t start_store(struct device *dev,
> +			   struct device_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(dev);
> +	u32 total_size, tre_count, tre_size;
> +	int i, ret;
> +
> +	guard(mutex)(&loopback->lb_mutex);
> +
> +	tre_size = loopback->tre_size;
> +	tre_count = loopback->num_tre;
> +	total_size = size_mul(tre_count, tre_size);
> +
> +	if (total_size > KMALLOC_MAX_SIZE)
> +		return -EINVAL;
> +
> +	if (tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_TO_DEVICE) ||
> +	    tre_count > mhi_get_free_desc_count(loopback->mdev, DMA_FROM_DEVICE)) {
> +		dev_err(dev, "Not enough ring space for %u TREs\n", tre_count);
> +		return -ENOSPC;
> +	}
> +
> +	void *recv_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
> +	if (!recv_buf)
> +		return -ENOMEM;
> +
> +	void *send_buf __free(kfree) = kzalloc(total_size, GFP_KERNEL);
> +	if (!send_buf)
> +		return -ENOMEM;
> +
> +	get_random_bytes(send_buf, total_size);
> +
> +	atomic_set(&loopback->tre_pending, tre_count);
> +	reinit_completion(&loopback->comp);
> +
> +	for (i = 0; i < tre_count; i++) {
> +		ret = mhi_queue_buf(loopback->mdev, DMA_FROM_DEVICE,
> +				    recv_buf + (i * tre_size), tre_size, MHI_EOT);
> +		if (ret) {
> +			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
> +			if (atomic_sub_and_test(tre_count - i, &loopback->tre_pending))
> +				complete(&loopback->comp);
> +			return ret;

Both recv_buf and send_buf are allocated with '__free' cleanup. So these buffers
will get freed once this function exits. But these buffer might've already
queued to the device in past iterations, making these pointers dangling.

Maybe you should reset the channel as you've done below for completion timeout?

> +		}
> +	}
> +
> +	for (i = 0; i < tre_count - 1; i++) {
> +		ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
> +				    send_buf + (i * tre_size), tre_size, MHI_CHAIN);
> +		if (ret) {
> +			dev_err(dev, "Unable to queue send TRE %d: %d\n", i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = mhi_queue_buf(loopback->mdev, DMA_TO_DEVICE,
> +			    send_buf + (i * tre_size), tre_size, MHI_EOT);
> +	if (ret) {
> +		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!wait_for_completion_timeout(&loopback->comp,
> +					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
> +		dev_err(dev, "Loopback test timed out\n");
> +		/* Reset the channel to reclaim the TREs still pointing at the buffers */
> +		mhi_unprepare_from_transfer(loopback->mdev);
> +		ret = mhi_prepare_for_transfer(loopback->mdev);
> +		if (ret)
> +			dev_err(dev, "Failed to re-prepare channel for transfers: %d\n", ret);
> +
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (memcmp(send_buf, recv_buf, total_size)) {
> +		dev_err(dev, "Loopback data mismatch\n");
> +		return -EIO;
> +	}
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(start);
> +
> +static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
> +				     struct mhi_result *mhi_res)
> +{
> +	struct mhi_loopback *loopback = dev_get_drvdata(&mhi_dev->dev);
> +
> +	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
> +		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
> +			mhi_res->transaction_status);
> +
> +	if (atomic_dec_and_test(&loopback->tre_pending))
> +		complete(&loopback->comp);
> +}
> +
> +static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
> +				     struct mhi_result *mhi_res)
> +{
> +	if (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN)
> +		dev_err(&mhi_dev->dev, "UL callback error: status %d\n",
> +			mhi_res->transaction_status);
> +}
> +
> +static struct attribute *mhi_loopback_attrs[] = {
> +	&dev_attr_tre_size.attr,
> +	&dev_attr_max_tre_size.attr,
> +	&dev_attr_num_tre.attr,
> +	&dev_attr_start.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group mhi_loopback_group = {
> +	.attrs = mhi_loopback_attrs,
> +};
> +
> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
> +			      const struct mhi_device_id *id)
> +{
> +	struct mhi_loopback *loopback;
> +	int ret;
> +
> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
> +	if (!loopback)
> +		return -ENOMEM;
> +
> +	loopback->mdev = mhi_dev;
> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
> +
> +	mutex_init(&loopback->lb_mutex);
> +	init_completion(&loopback->comp);
> +
> +	dev_set_drvdata(&mhi_dev->dev, loopback);
> +
> +	ret = mhi_prepare_for_transfer(mhi_dev);
> +	if (ret)
> +		return dev_err_probe(&mhi_dev->dev, ret, "Failed to prepare for transfers\n");
> +
> +	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
> +	if (ret) {
> +		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
> +		mhi_unprepare_from_transfer(mhi_dev);
> +		return ret;
> +	}

You can use mhi_driver->driver.dev_groups to let the driver core create sysfs
groups for you.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
