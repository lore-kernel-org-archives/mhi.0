Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F57E0
	for <mhi@lists.linux.dev>; Mon, 18 Apr 2022 05:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029D7C385A1;
	Mon, 18 Apr 2022 05:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650260817;
	bh=a4is7aQuiZZ09kf3wlEldFj6voxc6ZngoAIX5XQ1M3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R17xXsI/tUrYE4+GI7+RQkmF3rAy5r9pxiJQseZhMRR9bYlSPZTQnXmKCoy/IxtsL
	 S9kzMmaDtJg3ekYITnIyLbAfjBGZ7+MCJssHqaQAkI5LjSn/mnuMWK2DQZ7bpXsWxQ
	 lpsHZzhVVqwZNJzRru03/bltguUOtxniopCQp5jeVfqqN3TSO4RsCNQL4AlQxkETOV
	 dVivRIGF4Kgjsm840pAiJNhnBwwTH1dei3iFE3yTl5dEeRZml/hkxNXzsdHsSqRQvT
	 PuwzMQtMg9td6h/L1TUugqUSag3xH8ST2wQWBTp3sbdFO+/PezXoUxi/byTv4bsqx7
	 gJgb2PTF6bnBw==
Date: Mon, 18 Apr 2022 11:16:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v2] bus: mhi: host: Add soc_reset sysfs
Message-ID: <20220418054649.GB7431@thinkpad>
References: <1649883619-17609-1-git-send-email-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649883619-17609-1-git-send-email-quic_jhugo@quicinc.com>

On Wed, Apr 13, 2022 at 03:00:19PM -0600, Jeffrey Hugo wrote:
> From: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> The MHI bus supports a standardized hardware reset, which is known as the
> "SoC Reset".  This reset is similar to the reset sysfs for PCI devices -
> a hardware mechanism to reset the state back to square one.
> 
> The MHI SoC Reset is described in the spec as a reset of last resort.  If
> some unrecoverable error has occurred where other resets have failed, SoC
> Reset is the "big hammer" that ungracefully resets the device.  This is
> effectivly the same as yanking the power on the device, and reapplying it.
> However, depending on the nature of the particular issue, the underlying
> transport link may remain active and configured.  If the link remains up,
> the device will flag a MHI system error early in the boot process after
> the reset is executed, which allows the MHI bus to process a fatal error
> event, and clean up appropiately.
> 
> While the SoC Reset is generally intended as a means of recovery when all
> else has failed, it can be useful in non-error scenarios.  For example,
> if the device loads firmware from the host filesystem, the device may need
> to be fully rebooted inorder to pick up the new firmware.  In this
> scenario, the system administrator may use the soc_reset sysfs to cause
> the device to pick up the new firmware that the admin placed on the
> filesystem.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Do you need double signed-off because of change in domain?

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> 
> v2:
> Rebase
> 
>  Documentation/ABI/stable/sysfs-bus-mhi | 11 +++++++++++
>  drivers/bus/mhi/host/init.c            | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> index ecfe766..306f63e 100644
> --- a/Documentation/ABI/stable/sysfs-bus-mhi
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -19,3 +19,14 @@ Description:	The file holds the OEM PK Hash value of the endpoint device
>  		read without having the device power on at least once, the file
>  		will read all 0's.
>  Users:		Any userspace application or clients interested in device info.
> +
> +What:           /sys/bus/mhi/devices/.../soc_reset
> +Date:           April 2022
> +KernelVersion:  5.19
> +Contact:        mhi@lists.linux.dev
> +Description:	Initiates a SoC reset on the MHI controller.  A SoC reset is
> +                a reset of last resort, and will require a complete re-init.
> +                This can be useful as a method of recovery if the device is
> +                non-responsive, or as a means of loading new firmware as a
> +                system administration task.
> +
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 04c409b..e12b210 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -108,9 +108,23 @@ static ssize_t oem_pk_hash_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(oem_pk_hash);
>  
> +static ssize_t soc_reset_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf,
> +			       size_t count)
> +{
> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +
> +	mhi_soc_reset(mhi_cntrl);
> +	return count;
> +}
> +static DEVICE_ATTR_WO(soc_reset);
> +
>  static struct attribute *mhi_dev_attrs[] = {
>  	&dev_attr_serial_number.attr,
>  	&dev_attr_oem_pk_hash.attr,
> +	&dev_attr_soc_reset.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(mhi_dev);
> -- 
> 2.7.4
> 
