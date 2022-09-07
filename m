Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239E57E
	for <mhi@lists.linux.dev>; Wed,  7 Sep 2022 08:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F799C433B5;
	Wed,  7 Sep 2022 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662537627;
	bh=90ylMoXY5CdNdeYF5G2KIHeYF40APZTZaqUwAJr1djM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXaY/jGMs8xHJ+KTWu3Va0i/cl3PA6Orcee/89HezJVT/KQ4i4BiMnin6nfzgKfel
	 ecE9/lAZAKOI0oJviN5on8QcogUdPrcUPV4UhvK+mOpbWof2USTGdmkGP4iYU/y/pz
	 QGmwn/uTrvctHhHlDwk+V5rST7yhQOHKnlgOlQ0mflZm7/EU6sybotVDO/hhswMnbi
	 1Rsiv/42lJYc3RV3LgRzbd4wxbVpfeSzcN8sPxA0Su1S+poQt25fNRJiYvBzZGJkRQ
	 aYdOicLlpDMetCDckV0OsisAsNBBW2UdlhsM97q4TZApVJbhj3a7vC+zbhuzEjttta
	 qc/Wp7d+AO+Zw==
Date: Wed, 7 Sep 2022 13:30:16 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v5] bus: mhi: host: make mhi_controller_config::event_cfg
 const
Message-ID: <20220907080016.GA22505@workstation>
References: <20220829205112.12036-1-quic_jjohnson@quicinc.com>
 <20220830171147.24338-1-quic_jjohnson@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830171147.24338-1-quic_jjohnson@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Aug 30, 2022 at 10:11:47AM -0700, Jeff Johnson wrote:
> Currently the event_cfg pointer in struct mhi_controller_config is not
> defined as a const pointer. This prevents clients from registering a
> read-only configuration unless they use a typecast. Since the
> event_cfg should not be modified once registered, add the const
> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied to mhi-next!

Thanks,
Mani

> ---
> v5:	corrected mhi_foxconn_sdx55_events[]
> 
> v4:	updated subject, rebased to v6.0-rc3
> 
> v3:	added pci_generic.c change
> 
> v2:	added S-O-B
> 
>  drivers/bus/mhi/host/pci_generic.c | 14 +++++++-------
>  include/linux/mhi.h                |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..0db437ac3ba4 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -238,7 +238,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
>  };
>  
> -static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> +static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	/* first ring is control+data ring */
>  	MHI_EVENT_CONFIG_CTRL(0, 64),
>  	/* DIAG dedicated event ring */
> @@ -305,7 +305,7 @@ static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
>  
> -static struct mhi_event_config mhi_quectel_em1xx_events[] = {
> +static const struct mhi_event_config mhi_quectel_em1xx_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_DATA(1, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -344,7 +344,7 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
>  
> -static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> +static const struct mhi_event_config mhi_foxconn_sdx55_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_DATA(1, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -391,7 +391,7 @@ static const struct mhi_channel_config mhi_mv3x_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
>  };
>  
> -static struct mhi_event_config mhi_mv3x_events[] = {
> +static const struct mhi_event_config mhi_mv3x_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 256),
>  	MHI_EVENT_CONFIG_DATA(1, 256),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -438,7 +438,7 @@ static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
>  };
>  
> -static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
> +static const struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
>  	/* first ring is control+data and DIAG ring */
>  	MHI_EVENT_CONFIG_CTRL(0, 2048),
>  	/* Hardware channels request dedicated hardware event rings */
> @@ -472,7 +472,7 @@ static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
>  };
>  
> -static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
> +static const struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(1, 1024, 100),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
> @@ -511,7 +511,7 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
>  
> -static struct mhi_event_config mhi_telit_fn990_events[] = {
> +static const struct mhi_event_config mhi_telit_fn990_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_DATA(1, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a5441ad33c74..ada2f18af4d6 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -281,7 +281,7 @@ struct mhi_controller_config {
>  	u32 num_channels;
>  	const struct mhi_channel_config *ch_cfg;
>  	u32 num_events;
> -	struct mhi_event_config *event_cfg;
> +	const struct mhi_event_config *event_cfg;
>  	bool use_bounce_buf;
>  	bool m2_no_db;
>  };
> -- 
> 2.37.0
> 
> 
