Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837BA936
	for <mhi@lists.linux.dev>; Wed, 31 May 2023 06:30:09 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-39831cb47fbso3767754b6e.1
        for <mhi@lists.linux.dev>; Tue, 30 May 2023 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685514609; x=1688106609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1OpRRIldUM8jbeDsCgHJ5B0G7dPQN5jSdROds/1gnM=;
        b=x2SnnjMvophJanpT7imV8o8Qkovf+HPUwQN/5KQl3niG086cx6LZVDeKYaSR5fgD13
         /ZiQquEy1cgWuQypSNCkWwXnVL1QNU9W1drTXXpIjYqJDMEON0L6wlig4C3hf0jun5Di
         amYhYZPRdugSujRNi2uW2t/GPSCUl17Y7+in//0MvbL/GTriHlZnnx4xxcgVDmR7/jIl
         paZpWPW/MoA5gtUGup7fSXEGt1wJsp5cibf1KYgIMIA00ptDyK10xoypGHeofdGs9WK/
         m7L7+qvSBlF36lzbp3CteEwwiY1VOymZ9Yxl4Gx+JkMSuB3+8e9vzV62sx34zi/2JMyj
         mrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685514609; x=1688106609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1OpRRIldUM8jbeDsCgHJ5B0G7dPQN5jSdROds/1gnM=;
        b=HtsudX9xHPphL9BiqMcdFDsLJ+QNS8aJwUc9hw3ZGIhgqSyBjik6KGupKTtjHJkrys
         rNX4EyGdfhDfqz6X3tIQm3z++mwr+9R5CrIjHXGN2jf/KLtJ0ZxoPb+cN5BikJ22cZcP
         H+spd73uc4OV6OUZWtPQTMqsroBqAZlVdth3UAkHbCRsT7kdQ7qWXG8JafDILnxzaFzg
         WPeynNWwfTBnj7ns7QYuY2fLc+EzS6kJ6ipvTgo6VD8U1/y8ZWRbvHzSZ8mKF5Wp6oQN
         inR9qAvxmw7yM49gB9AR1bTaM+8KynCQzgT6LVmxDUbtX7QB4l04Vm5SGYRhbYfwc/pT
         xgng==
X-Gm-Message-State: AC+VfDwatNJkGeZQxw7VzJi8XQI0DnLRVoBcdH+EdGvvQktlzRBDwHDs
	mRRx43Ng22B0hmQ+w42o2Pa+OcfD5czeWqI0oA==
X-Google-Smtp-Source: ACHHUZ7FP+5ZnqUjMGXcbaLzxyktF5wU1Q4LTtszDkktWIiXviMTJH/V9NoQTPAK1XO/eYUiHygGmA==
X-Received: by 2002:aca:f055:0:b0:397:ed3b:f1d5 with SMTP id o82-20020acaf055000000b00397ed3bf1d5mr2542780oih.11.1685514608972;
        Tue, 30 May 2023 23:30:08 -0700 (PDT)
Received: from thinkpad ([117.217.186.173])
        by smtp.gmail.com with ESMTPSA id jb7-20020a170903258700b001ae0b373382sm431234plb.198.2023.05.30.23.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 23:30:08 -0700 (PDT)
Date: Wed, 31 May 2023 12:00:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: loic.poulain@linaro.org, quic_krichai@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for IP_SW0
 channels
Message-ID: <20230531063003.GB7968@thinkpad>
References: <20230519135803.13850-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519135803.13850-1-manivannan.sadhasivam@linaro.org>

On Fri, May 19, 2023 at 07:28:03PM +0530, Manivannan Sadhasivam wrote:
> IP_SW0 channels are used to transfer data over the networking interface
> between MHI endpoint and the host. Define the channels in the MHI v1
> channel config along with dedicated event rings.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index db0a0b062d8e..70e37c490150 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -212,6 +212,19 @@ struct mhi_pci_dev_info {
>  		.offload_channel = false,	\
>  	}
>  
> +#define MHI_EVENT_CONFIG_SW_DATA(ev_ring, el_count) \
> +	{					\
> +		.num_elements = el_count,	\
> +		.irq_moderation_ms = 0,		\
> +		.irq = (ev_ring) + 1,		\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_DISABLE,	\
> +		.data_type = MHI_ER_DATA,	\
> +		.hardware_event = false,	\
> +		.client_managed = false,	\
> +		.offload_channel = false,	\
> +	}
> +
>  #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, el_count, ch_num) \
>  	{					\
>  		.num_elements = el_count,	\
> @@ -237,8 +250,10 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(21, "IPCR", 8, 0),
>  	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> -	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> -	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 64, 2),
> +	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 64, 3),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 4),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 5),
>  };
>  
>  static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> @@ -246,9 +261,12 @@ static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 64),
>  	/* DIAG dedicated event ring */
>  	MHI_EVENT_CONFIG_DATA(1, 128),
> +	/* Software channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(2, 64),
> +	MHI_EVENT_CONFIG_SW_DATA(3, 64),
>  	/* Hardware channels request dedicated hardware event rings */
> -	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> -	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
> +	MHI_EVENT_CONFIG_HW_DATA(4, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(5, 2048, 101)
>  };
>  
>  static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
