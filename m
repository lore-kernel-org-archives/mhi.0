Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575A21A92F;
	Tue, 23 Jun 2026 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206250; cv=none; b=TGiq0QLqpR1qjETDDRjEoXLGIhLnqTes0lZ9oEBVObvJosZIMslLyaa/DjZt35UZh73zhRTZ8M3oh7J+SwOrnT6PcaRxD13BwsHYb6BdvbKHZQJBmrPfDAcitvuCvnEbUjBo+A3vfHnBGbcUbc6VSkXWB22R+Phg9DHsg9YBmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206250; c=relaxed/simple;
	bh=4PSBsndmxPy7HsqnYDcKi79c06dGmeOLikOnhsr+QaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWYZ0Ie+Q7aS47CAgW6MTh3zqMm1QF84wqzy6FTFyFJMcqYV9P0qiOEpHCkmf0u3YP12tWEVTQnQ8Ks9GwekZ6G+EjfvcXqMCq6lgKIuGKjcaF/cX3FdpD4rdGfRJXBZAQDXKGdz4H6cQWY58R7Yj08Pu5ALunjgS8uHH/FX3ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZcaSF/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZcaSF/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796CB1F000E9;
	Tue, 23 Jun 2026 09:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782206248;
	bh=BHvACODUYEm2KURO/0jElTO8XAuZRYqe8uxUHI9Kj+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MZcaSF/Wn2EZT9/TSWRyAQudjq5oFEYmutDpford++Sz2va0QVRZs9CBrvmOaECHK
	 wcuNaqWkVXE21cYfuoNIjGxwygjL78I7XW9gzi3pvlY5W3T5s99JgXRum7ZOTWuiLU
	 EyNK+YMJVqv9OtABzNrU7z8doOSB8ZbouVfxuBphbV8S7Xylzc4j5y685DW3/WtG51
	 vSzENdMpcE5c2JG94Df5yZ0WImkT6dTE5QwdLuddre8YMsJpC5Nzr8yn3aD7Twa33V
	 XVWT308RbT59ORnbwOpQa+9/hd79hQTeG65w55wlmSo1jzCt9/GBG3/NjeyFMNpcgc
	 dewTsIdrdlV/Q==
Date: Tue, 23 Jun 2026 11:17:21 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
Message-ID: <q2bgzlv6o5sgdzg7jdazjd7yultfsxuyww637h5zppidd2k32c@3syfqgbx2r7n>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-3-782b3a0f2eef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622-loopback_mhi-v4-3-782b3a0f2eef@oss.qualcomm.com>

On Mon, Jun 22, 2026 at 10:39:17AM +0530, Sumit Kumar wrote:
> When an MHI endpoint device runs Linux, there is no firmware to implement
> the LOOPBACK channel echo that real modem firmware provides. Without an
> endpoint-side driver, the host loopback test has no software echo partner
> and cannot exercise the full end-to-end MHI data path.
> 
> Add an endpoint-side loopback driver that binds to the LOOPBACK channel and
> echoes received data back to the host. An ordered workqueue is used for
> asynchronous processing to preserve packet ordering. Together with the
> host-side loopback driver, this enables complete MHI data path validation
> for Linux-based endpoint devices.
> 
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/Kconfig            |   2 +
>  drivers/bus/mhi/ep/Makefile           |   1 +
>  drivers/bus/mhi/ep/clients/Kconfig    |  16 +++++
>  drivers/bus/mhi/ep/clients/Makefile   |   2 +
>  drivers/bus/mhi/ep/clients/loopback.c | 128 ++++++++++++++++++++++++++++++++++
>  5 files changed, 149 insertions(+)
> 
> diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
> index 90ab3b040672e0f04181d4802e3062afcc7cf782..9edb81b39890e093a51138465a4d7705767eafa5 100644
> --- a/drivers/bus/mhi/ep/Kconfig
> +++ b/drivers/bus/mhi/ep/Kconfig
> @@ -8,3 +8,5 @@ config MHI_BUS_EP
>  
>  	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
>  	  such as SDX55 modem connected to the host machine over PCIe.
> +
> +source "drivers/bus/mhi/ep/clients/Kconfig"
> diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
> index aad85f180b707fb997fcb541837eda9bbbb67437..ab36ef2a40ab8174e5ddae44a3e6ccb8eb31168d 100644
> --- a/drivers/bus/mhi/ep/Makefile
> +++ b/drivers/bus/mhi/ep/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
>  mhi_ep-y := main.o mmio.o ring.o sm.o
> +obj-y += clients/
> diff --git a/drivers/bus/mhi/ep/clients/Kconfig b/drivers/bus/mhi/ep/clients/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..4cf27184058ca2be020885b6f57b4cc44b5054b6
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/clients/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config MHI_BUS_EP_LOOPBACK
> +	tristate "MHI Endpoint LOOPBACK client driver"
> +	depends on MHI_BUS_EP
> +	help
> +	  MHI Endpoint LOOPBACK client driver that binds to the MHI LOOPBACK
> +	  channel as defined in the MHI specification. The LOOPBACK channel is
> +	  implemented by MHI-based endpoint devices (modems, WLAN) in the field,
> +	  where the endpoint firmware echoes back whatever the host sends.
> +
> +	  This driver receives data on the uplink channel and echoes it back on
> +	  the downlink channel for testing the MHI endpoint data path.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called mhi_ep_loopback.
> diff --git a/drivers/bus/mhi/ep/clients/Makefile b/drivers/bus/mhi/ep/clients/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..71dc91cc63b02592b177cf66db6090748c0653a6
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/clients/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
> +mhi_ep_loopback-y += loopback.o
> diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..05db91be6ffc5afe5a2022962410c96a7ec19962
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/clients/loopback.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mhi_ep.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/string.h>
> +
> +struct mhi_ep_loopback {
> +	struct workqueue_struct *loopback_wq;

s/loopback_wq/wq

> +	struct mhi_ep_device *mdev;
> +};
> +
> +struct mhi_ep_loopback_work {
> +	struct mhi_ep_device *mdev;
> +	struct work_struct work;
> +	void *buf;
> +	size_t len;
> +};
> +
> +static void mhi_ep_loopback_work_handler(struct work_struct *work)
> +{
> +	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
> +								struct mhi_ep_loopback_work, work);
> +	int ret;
> +
> +	ret = mhi_ep_queue_buf(mhi_ep_lb_work->mdev, mhi_ep_lb_work->buf,
> +			       mhi_ep_lb_work->len);
> +	if (ret) {
> +		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");

'Failed to queue buffer'

> +		kfree(mhi_ep_lb_work->buf);
> +	}
> +
> +	kfree(mhi_ep_lb_work);
> +}
> +
> +static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
> +					struct mhi_result *mhi_res)
> +{
> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
> +	struct mhi_ep_loopback_work *mhi_ep_lb_work;
> +	void *buf;
> +
> +	if (!mhi_ep_lb)
> +		return;

Hmm. This seems similar to patch 1 race condition. But we do not have a EP
specific API to stop a channel and flush the wq like
mhi_ep_unprepare_from_transfer(). But you should add one and call it from
remove().

> +
> +	if (!mhi_res->transaction_status) {
> +		if (!mhi_res->bytes_xferd)
> +			return;
> +
> +		buf = kmemdup(mhi_res->buf_addr, mhi_res->bytes_xferd, GFP_KERNEL);
> +		if (!buf)
> +			return;

Error log?

> +
> +		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
> +		if (!mhi_ep_lb_work) {
> +			kfree(buf);

Same here.

> +			return;
> +		}
> +
> +		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
> +		mhi_ep_lb_work->mdev = mhi_dev;
> +		mhi_ep_lb_work->buf = buf;
> +		mhi_ep_lb_work->len = mhi_res->bytes_xferd;
> +
> +		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
> +	}
> +}
> +
> +static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
> +					struct mhi_result *mhi_res)
> +{
> +	kfree(mhi_res->buf_addr);
> +}
> +
> +static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
> +{
> +	struct mhi_ep_loopback *mhi_ep_lb;
> +
> +	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_ep_lb), GFP_KERNEL);
> +	if (!mhi_ep_lb)
> +		return -ENOMEM;
> +
> +	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_ep_loopback", WQ_MEM_RECLAIM);
> +	if (!mhi_ep_lb->loopback_wq) {
> +		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");

nit: Remove fullstop at the end of error message.

> +		return -ENOMEM;
> +	}
> +
> +	mhi_ep_lb->mdev = mhi_dev;
> +	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
> +
> +	return 0;
> +}
> +
> +static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
> +{
> +	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
> +
> +	destroy_workqueue(mhi_ep_lb->loopback_wq);
> +	dev_set_drvdata(&mhi_dev->dev, NULL);

As mentioned above, this should be dropped if you can ensure that xfer_cb()
won't be called.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
