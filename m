Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C744404
	for <mhi@lists.linux.dev>; Tue, 17 Oct 2023 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="paOzyoWy"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-457c82cd87bso1533974137.0
        for <mhi@lists.linux.dev>; Tue, 17 Oct 2023 00:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697528211; x=1698133011; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxT7pzdJESncQ/+9UX6/pYk1WP7pzSl0ESvB6teChuU=;
        b=paOzyoWyAyysTNe3BgsdDM8CT1Uk6fKb/7AYvQXzBGMBqpczq8ML7uLrhZuSQPfLF+
         J/1fIjtM5WeW0UCsEDQpXg4nDINA6XQRvCTXyiv4CaI3tzfEw0I3C11IyWNPGXQ+W6fq
         +6BZvNX+cDUFsM+tdjjhljkKW0tMsA8z8stkZFsvl3GA6sa40/qR4q7gUSDBsyzB5oap
         2p95fukVlAbsu2mQ8S9DACNMAhHgGozcfykJUCSIj8BYbeI35Ckk99jM1NTzW6eQsEEb
         sHtvlHLDMHtoOBCIpVZ3cTfGkWf5PdxZi1Zs+oWtDypYzMNoXK3emBP+sHrXhkHIPfXg
         1QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697528211; x=1698133011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxT7pzdJESncQ/+9UX6/pYk1WP7pzSl0ESvB6teChuU=;
        b=MYgEFX5fevKaMyq9yTW2k+aGOPrRm9StaLjVVyLYxcGz3eWnsvVeOrijVnBUIr9wav
         CHshrSszPwSiv7cRnpnj6cTeBD7eeuJKU7VBE8i1K7Fi9gYCNbsQAMEU4eo0Z0hZA7rt
         4HEmdZLmetVqL8AfBB+XLm1u8XlkWgzij89J0OacJBVoA7Asmv84sNSj2sZPimPM/pxW
         4ovX1qoQB2EQ4Zb/gCydUtL8EZsixipEO7P/SWjUAG/Grwqme1Kye2P3KxBSbJ152Qtf
         6hjvQew0IG5PTjnP1tqgveQfauD5xdQsXrG0OQHJ4/oRrW1tlBAXAhuJsWzmFvrmJ/in
         Egzg==
X-Gm-Message-State: AOJu0YzNRMTeCpguV6uynnsnidxPmVYIY9+z0Ew1Uu7Nvmi6RpUe8PiD
	Kkx1PPaXdqwyol6NfE0JDsAoWM5GlFybKxG7jQ==
X-Google-Smtp-Source: AGHT+IGFV6Oy9oyt9cc9+QXaBhIphbHezPtFo1fpD4ru8RrTKL+MKRETflutZYL7NmHrrU3OkLGrxA==
X-Received: by 2002:a05:6102:756:b0:457:cc6c:948f with SMTP id v22-20020a056102075600b00457cc6c948fmr1247130vsg.26.1697528210667;
        Tue, 17 Oct 2023 00:36:50 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id mk2-20020a056214580200b0064c9f754794sm342250qvb.86.2023.10.17.00.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 00:36:49 -0700 (PDT)
Date: Tue, 17 Oct 2023 13:06:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_msarkar@quicinc.com, schintav@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Do not allocate event ring element on stack
Message-ID: <20231017073642.GA5274@thinkpad>
References: <20230901073502.69385-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230901073502.69385-1-manivannan.sadhasivam@linaro.org>

On Fri, Sep 01, 2023 at 01:05:02PM +0530, Manivannan Sadhasivam wrote:
> It is possible that the host controller driver would use DMA framework to
> write the event ring element. So avoid allocating event ring element on the
> stack as DMA cannot work on vmalloc memory.
> 
> Cc: stable@vger.kernel.org
> Fixes: 961aeb689224 ("bus: mhi: ep: Add support for sending events to the host")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/ep/main.c | 52 +++++++++++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 600881808982..66ca470bf302 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -71,45 +71,61 @@ static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
>  static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
>  					struct mhi_ring_element *tre, u32 len, enum mhi_ev_ccs code)
>  {
> -	struct mhi_ring_element event = {};
> +	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
> +	int ret;
> +
> +	event->ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(*tre));
> +	event->dword[0] = MHI_TRE_EV_DWORD0(code, len);
> +	event->dword[1] = MHI_TRE_EV_DWORD1(ring->ch_id, MHI_PKT_TYPE_TX_EVENT);
>  
> -	event.ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(*tre));
> -	event.dword[0] = MHI_TRE_EV_DWORD0(code, len);
> -	event.dword[1] = MHI_TRE_EV_DWORD1(ring->ch_id, MHI_PKT_TYPE_TX_EVENT);
> +	ret = mhi_ep_send_event(mhi_cntrl, ring->er_index, event, MHI_TRE_DATA_GET_BEI(tre));
> +	kfree(event);
>  
> -	return mhi_ep_send_event(mhi_cntrl, ring->er_index, &event, MHI_TRE_DATA_GET_BEI(tre));
> +	return ret;
>  }
>  
>  int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state)
>  {
> -	struct mhi_ring_element event = {};
> +	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
> +	int ret;
> +
> +	event->dword[0] = MHI_SC_EV_DWORD0(state);
> +	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_STATE_CHANGE_EVENT);
>  
> -	event.dword[0] = MHI_SC_EV_DWORD0(state);
> -	event.dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_STATE_CHANGE_EVENT);
> +	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
> +	kfree(event);
>  
> -	return mhi_ep_send_event(mhi_cntrl, 0, &event, 0);
> +	return ret;
>  }
>  
>  int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_env)
>  {
> -	struct mhi_ring_element event = {};
> +	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
> +	int ret;
> +
> +	event->dword[0] = MHI_EE_EV_DWORD0(exec_env);
> +	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
>  
> -	event.dword[0] = MHI_EE_EV_DWORD0(exec_env);
> -	event.dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
> +	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
> +	kfree(event);
>  
> -	return mhi_ep_send_event(mhi_cntrl, 0, &event, 0);
> +	return ret;
>  }
>  
>  static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ev_ccs code)
>  {
> +	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
>  	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_cmd->ring;
> -	struct mhi_ring_element event = {};
> +	int ret;
> +
> +	event->ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(struct mhi_ring_element));
> +	event->dword[0] = MHI_CC_EV_DWORD0(code);
> +	event->dword[1] = MHI_CC_EV_DWORD1(MHI_PKT_TYPE_CMD_COMPLETION_EVENT);
>  
> -	event.ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(struct mhi_ring_element));
> -	event.dword[0] = MHI_CC_EV_DWORD0(code);
> -	event.dword[1] = MHI_CC_EV_DWORD1(MHI_PKT_TYPE_CMD_COMPLETION_EVENT);
> +	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
> +	kfree(event);
>  
> -	return mhi_ep_send_event(mhi_cntrl, 0, &event, 0);
> +	return ret;
>  }
>  
>  static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_element *el)
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
