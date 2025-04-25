Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4F11A5BAA
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745599436; cv=none; b=oi6kaQLjRu92c4VJZrVUhX9m1y8c4FjXfuDXNNaQnsiN84Sx6F7CKA2/aB/NzGn4cmEBBIbvr91afHYVKAiC+UMum859c2lLx0G6Nqmt5x5ejOH+4SZaafxq9AOiKfmzi6PKvFAogfrrypv+IJlpY5Qnz61MslZuUFdKU2ETME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745599436; c=relaxed/simple;
	bh=ZZfkMKg7jcylqNvLAYsToge78ohtGFBshofDoC2BdgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRZPdDsHFO9UpfR/F/dh0xT6uGocE/vuCgWUQTITWXqBOgmi0mY3VOCLxPXqjPX9i5XsM8WUDTDGZiDOaQNyul6d8am66/TVCsbM9YYGPQGKK4jj7VU+5nOSNWd3se7rqrr7p15qRY+o3azHYHsFJRQFlsS80+faGYJ76AGas+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZ6bGTtG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZ6bGTtG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so2215529b3a.2
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745599432; x=1746204232; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AS+QrpLqknNClF7aVTue78LBs0Liiy9mjcaX+EnSv3g=;
        b=YZ6bGTtG08u2ZIfa1ukjSjNcD5KzbBC3JReSTAE1tKIx/yBgbToMZ6fat/zKuxE2l4
         V6JZBFBTHgnCFWUNKNm30d3LUy6cjdE27m8iU81ZiO0to3fLW1fmMSjupEWvJPFkZEKM
         LgFveQ6UhQdhXFNLgHqkBtgQtxWbJG3wyOZfUm/OEPDsw8oQnYf6BWyjXH7WT+7HXeRm
         GVdzV5GYPW6guSL8uhD6NJn4CotNezSpckktECMY59Lpgt0mwTjEtqe437oMib9PeP/2
         u0GWwAKSz+LKwYJGJQ+NWMyHmUKmGEh6vIwfypRY1JYyqxZJM9snrg4q/mVEyaHVdu9K
         yxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599432; x=1746204232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AS+QrpLqknNClF7aVTue78LBs0Liiy9mjcaX+EnSv3g=;
        b=CIWWCBGBPyoYeam7LpXZkeG1M9VGltRHsmZNmhA/pFJsMh9B1vykhr4RYklzX6YH2n
         rbLAWCaWVATncBN3ioHn8pet7E3rOU5kCVD/vP4CfgplgD3dx93wtWevwjLW1++Aw08J
         R1sIe/lnbzR/hvwjQ6AThw7icIkaZXjRQPY3bSPL24HL9ZI7/f0ne45vm/GPCGk9OQhq
         IIJWZ2TNdXPU/imj+0HH50SXX36p0D/uOa+MGXABpc4X1641rNQqcaRUzx4uDxkCJrpb
         BDUAZD2vbbUM3TJIme69VYeXGB6qNctypMa3G1TjC2gRR23AWgCxGNu6OBfCPW92Lolz
         U3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWD5UnKVYvcyDzRKi8kiPk4v91F4HIXjUy32JF8gI/Evb6EflCcKzzqD4kB4+A5Yfy0kx4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyC0hXO2ClD8tK3DiEWi5jql1ejzaO9YqWFblS4pNwC4rcVLo6a
	aXvZkP6pOiw0PwExGO1t8Ev7bS1Xl/JxLCi2GIPQfN3WawRFkdolkmJKczAmew==
X-Gm-Gg: ASbGncu/O4BUOV6xcI/Cg6u4502TvWCDaWDMAuuBjxrEHR3wFntP8loi2+cu1JWZH5u
	yhzmCsXhlnWR+y4lWkcfOhdJOikXEgBwnn+HSauldWrAGz2gvZMNWgn7m+H26IN47xwAU+Y7W5G
	fPY9yGNA5+9X6rhfH8ngALz1LAGCqCsMYgz7WKzstxEBtTDJKqQ3WjACJBdZag60xLRSs+dOmQi
	d0flO/+KcRuvYRSI7W2rrVxn7/Ma9YTHH5m0aKGe0yXBy/S58ibGLCOH+7N61NxKL0cCSu0sjCi
	1JTRpTjJ89hPkdCwSj2iKQT8UvuC1OdPOS2gBvMBh9ZN4nXwJoms
X-Google-Smtp-Source: AGHT+IGgd1HtqxdK7jinzzvwPbQz6WacgkM6n+ith1cHu12K4F2zyq9TXM0KGNyrUE/lmduyvdzWiA==
X-Received: by 2002:a05:6a00:1817:b0:73f:1c49:90f3 with SMTP id d2e1a72fcca58-73fd73c806emr3425152b3a.11.1745599432205;
        Fri, 25 Apr 2025 09:43:52 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259414d3sm3376691b3a.47.2025.04.25.09.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:43:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:13:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 07/10] bus: mhi: host: Add support for Bandwidth scale
Message-ID: <fzin4uttqtf33moiew6bazgxea7w72at5quumjg646s43wnq2g@3eupbyomplgw>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-7-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-7-869ca32170bf@oss.qualcomm.com>

On Thu, Mar 13, 2025 at 05:10:14PM +0530, Krishna Chaitanya Chundru wrote:
> As per MHI spec sec 14, MHI supports bandwidth scaling to reduce power

Same here, add spec version.

> consumption. MHI bandwidth scaling is advertised in devices that contain

'advertised in devices or by devices'? Difference is subtle, but it changes the
context.

> the bandwidth scaling capability registers. If enabled, the device
> aggregates bandwidth requirements and sends them to the host in the form
> of an event. After the host performs the bandwidth switch, it sends an
> acknowledgment by ringing a doorbell.
> 
> if the host supports bandwidth scaling events, then it must set

So this means both host and device has to support bandwidth scaling events? What
does 'events' mean here?

> BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
> doorbell that will be used by the host to communicate the bandwidth
> scaling status and BW_CFG.ER_INDEX to the index for the event ring
> to which the device should send bandwidth scaling request in the
> bandwidth scaling capability register.
> 
> As part of mmio init check if the bw scale capability is present or not,
> if present advertise host supports bw scale by setting all the required
> fields.
> 

Sounds like the host is depending on the device for bandwidth scaling.

> MHI layer will only forward the bw scaling request to the controller
> driver, it is responsibility of the controller driver to do actual bw
> scaling and then pass status to the MHI. MHI will response back to the
> device based up on the status of the bw scale received.
> 

Why the controller driver needs to be involved for a spec defined feature?
This is not answered here.

> Add a new get_misc_doorbell() to get doorbell for misc capabilities to
> use the doorbell with mhi events like MHI BW scale etc.
> 

So this is a spare doorbell? Why can't you call it as 'get_bw_scaling_db()'?

> Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
> which will called by the mhi controller driver can sleep.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h        |  16 +++++++
>  drivers/bus/mhi/host/init.c     |  64 ++++++++++++++++++++++++-
>  drivers/bus/mhi/host/internal.h |   7 ++-
>  drivers/bus/mhi/host/main.c     | 101 +++++++++++++++++++++++++++++++++++++++-
>  drivers/bus/mhi/host/pm.c       |  10 +++-
>  include/linux/mhi.h             |  13 ++++++
>  6 files changed, 205 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index eedac801b800..0a02acee709a 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -208,6 +208,22 @@
>  #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
>  							       MHI_PKT_TYPE_COALESCING))
>  
> +/* MHI Bandwidth scaling offsets */
> +#define MHI_BW_SCALE_CFG_OFFSET		0x4
> +#define MHI_BW_SCALE_CAP_ID		(3)
> +
> +#define MHI_BW_SCALE_ENABLE(bw_scale_db, er_index)	cpu_to_le32(FIELD_PREP(GENMASK(31, 25), \
> +							bw_scale_db) |				\
> +							FIELD_PREP(GENMASK(23, 19), er_index) |	\
> +							BIT(24))
> +
> +#define MHI_TRE_GET_EV_BW_REQ_SEQ(tre)	FIELD_GET(GENMASK(15, 8), (MHI_TRE_GET_DWORD(tre, 0)))
> +#define MHI_BW_SCALE_DB_ID(er_index)	FIELD_PREP(GENMASK(31, 25), er_index)
> +
> +#define MHI_BW_SCALE_RESULT(status, seq)	cpu_to_le32(FIELD_PREP(GENMASK(11, 8), status) | \
> +						FIELD_PREP(GENMASK(7, 0), seq))
> +#define MHI_BW_SCALE_NACK			0xF
> +
>  enum mhi_pkt_type {
>  	MHI_PKT_TYPE_INVALID = 0x0,
>  	MHI_PKT_TYPE_NOOP_CMD = 0x1,
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 0b14b665ed15..71abe02f5726 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -496,10 +496,56 @@ static int mhi_get_capability_offset(struct mhi_controller *mhi_cntrl, u32 capab
>  	return -ENXIO;
>  }
>  
> +/* to be used only if a single event ring with the type is present */

Then open code in the caller itself. I see no benefit in adding it as a separate
function.

> +static int mhi_get_er_index(struct mhi_controller *mhi_cntrl,
> +			    enum mhi_er_data_type type)
> +{
> +	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
> +	int i;
> +
> +	/* find event ring for requested type */
> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
> +		if (mhi_event->data_type == type)
> +			return mhi_event->er_index;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static int mhi_init_bw_scale(struct mhi_controller *mhi_cntrl,
> +			     int bw_scale_db)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	u32 bw_cfg_offset, val = 0;
> +	int ret, er_index;
> +
> +	ret = mhi_get_capability_offset(mhi_cntrl, MHI_BW_SCALE_CAP_ID,
> +					&bw_cfg_offset);
> +	if (ret)
> +		return ret;
> +
> +	/* No ER configured to support BW scale */

What does it mean?

> +	er_index = mhi_get_er_index(mhi_cntrl, MHI_ER_BW_SCALE);
> +	if (er_index < 0)
> +		return er_index;
> +
> +	bw_cfg_offset += MHI_BW_SCALE_CFG_OFFSET;
> +
> +	/* advertise host support */
> +	val = MHI_BW_SCALE_ENABLE(bw_scale_db, er_index);
> +
> +	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, bw_cfg_offset, val);
> +
> +	dev_dbg(dev, "Bandwidth scaling setup complete. Event ring:%d\n",
> +		er_index);
> +

"Bandwidth scaling setup complete with event ring: %d\n"

> +	return 0;
> +}
> +
>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  {
>  	u32 val;
> -	int i, ret;
> +	int i, ret, doorbell = 0;
>  	struct mhi_chan *mhi_chan;
>  	struct mhi_event *mhi_event;
>  	void __iomem *base = mhi_cntrl->regs;
> @@ -633,6 +679,16 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  		return ret;
>  	}
>  
> +	if (mhi_cntrl->get_misc_doorbell)
> +		doorbell = mhi_cntrl->get_misc_doorbell(mhi_cntrl, MHI_ER_BW_SCALE);
> +
> +	if (doorbell > 0) {
> +		ret = mhi_init_bw_scale(mhi_cntrl, doorbell);
> +		if (!ret)
> +			mhi_cntrl->bw_scale_db = base + val + (8 * doorbell);
> +		else
> +			dev_warn(dev, "BW scale setup failure\n");

"Failed to setup bandwidth scaling: %d"

> +	}
>  	return 0;
>  }
>  
> @@ -778,6 +834,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>  		case MHI_ER_CTRL:
>  			mhi_event->process_event = mhi_process_ctrl_ev_ring;
>  			break;
> +		case MHI_ER_BW_SCALE:
> +			mhi_event->process_event = mhi_process_bw_scale_ev_ring;
> +			break;
>  		default:
>  			dev_err(dev, "Event Ring type not supported\n");
>  			goto error_ev_cfg;
> @@ -1012,9 +1071,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  		mhi_event->mhi_cntrl = mhi_cntrl;
>  		spin_lock_init(&mhi_event->lock);
> +		mutex_init(&mhi_event->mutex);
>  		if (mhi_event->data_type == MHI_ER_CTRL)
>  			tasklet_init(&mhi_event->task, mhi_ctrl_ev_task,
>  				     (ulong)mhi_event);
> +		else if (mhi_event->data_type == MHI_ER_BW_SCALE)
> +			INIT_WORK(&mhi_event->work, mhi_process_ev_work);
>  		else
>  			tasklet_init(&mhi_event->task, mhi_ev_task,
>  				     (ulong)mhi_event);
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 3134f111be35..bf7c6a7c9383 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -241,6 +241,8 @@ struct mhi_event {
>  	struct mhi_ring ring;
>  	struct db_cfg db_cfg;
>  	struct tasklet_struct task;
> +	struct work_struct work;

bw_scaling_work or bw_scale_work?

> +	struct mutex mutex;

Add a comment on the purpose of the mutex.

>  	spinlock_t lock;
>  	int (*process_event)(struct mhi_controller *mhi_cntrl,
>  			     struct mhi_event *mhi_event,
> @@ -403,7 +405,8 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  				struct mhi_event *mhi_event, u32 event_quota);
>  int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  			     struct mhi_event *mhi_event, u32 event_quota);
> -
> +int mhi_process_bw_scale_ev_ring(struct mhi_controller *mhi_cntrl,
> +				 struct mhi_event *mhi_event, u32 event_quota);
>  /* ISR handlers */
>  irqreturn_t mhi_irq_handler(int irq_number, void *dev);
>  irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev);
> @@ -419,5 +422,5 @@ void mhi_unmap_single_no_bb(struct mhi_controller *mhi_cntrl,
>  			    struct mhi_buf_info *buf_info);
>  void mhi_unmap_single_use_bb(struct mhi_controller *mhi_cntrl,
>  			     struct mhi_buf_info *buf_info);
> -
> +void mhi_process_ev_work(struct work_struct *work);
>  #endif /* _MHI_INT_H */
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 4de75674f193..967563d86aec 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -472,7 +472,10 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>  		if (mhi_dev)
>  			mhi_notify(mhi_dev, MHI_CB_PENDING_DATA);
>  	} else {
> -		tasklet_schedule(&mhi_event->task);
> +		if (mhi_event->data_type == MHI_ER_BW_SCALE)
> +			queue_work(mhi_cntrl->hiprio_wq, &mhi_event->work);

To avoid the hassle, I think it is worth changing the mutex in bwctrl to
spinlock. I don't think there would be issues in spinning inside
pcie_set_target_speed().

> +		else
> +			tasklet_schedule(&mhi_event->task);
>  	}
>  
>  	return IRQ_HANDLED;
> @@ -1049,6 +1052,102 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  	return count;
>  }
>  
> +/* dedicated bw scale event ring processing */
> +int mhi_process_bw_scale_ev_ring(struct mhi_controller *mhi_cntrl,
> +				 struct mhi_event *mhi_event, u32 event_quota)
> +{
> +	struct mhi_event_ctxt *er_ctxt = &mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct mhi_ring *ev_ring = &mhi_event->ring;
> +	dma_addr_t ptr = le64_to_cpu(er_ctxt->rp);
> +	u32 response = MHI_BW_SCALE_NACK;
> +	struct mhi_ring_element *dev_rp;
> +	struct mhi_link_info link_info;
> +	int ret = -EINVAL;
> +
> +	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state))) {
> +		ret =  -EIO;
> +		goto exit_bw_scale_process;

exit_bw_scale?

> +	}
> +
> +	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee))
> +		goto exit_bw_scale_process;
> +
> +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
> +		dev_err(dev,
> +			"Event ring rp points outside of the event ring\n");
> +		ret =  -EIO;
> +		goto exit_bw_scale_process;
> +	}
> +
> +	dev_rp = mhi_to_virtual(ev_ring, ptr);
> +
> +	/* if rp points to base, we need to wrap it around */

Nit: Use caps for starting letter and also for acronyms.

> +	if (dev_rp == ev_ring->base)
> +		dev_rp = ev_ring->base + ev_ring->len;
> +	dev_rp--;
> +
> +	/* fast forward to currently processed element and recycle er */
> +	ev_ring->rp = dev_rp;
> +	ev_ring->wp = dev_rp - 1;
> +	if (ev_ring->wp < ev_ring->base)
> +		ev_ring->wp = ev_ring->base + ev_ring->len - ev_ring->el_size;
> +	mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
> +
> +	if (WARN_ON(MHI_TRE_GET_EV_TYPE(dev_rp) != MHI_PKT_TYPE_BW_REQ_EVENT)) {
> +		dev_err(dev, "!BW SCALE REQ event\n");
> +		goto exit_bw_scale_process;
> +	}
> +
> +	link_info.target_link_speed = MHI_TRE_GET_EV_LINKSPEED(dev_rp);
> +	link_info.target_link_width = MHI_TRE_GET_EV_LINKWIDTH(dev_rp);
> +	link_info.sequence_num = MHI_TRE_GET_EV_BW_REQ_SEQ(dev_rp);
> +
> +	dev_info(dev, "Received BW_REQ with seq:%d link speed:0x%x width:0x%x\n",
> +		 link_info.sequence_num,
> +		 link_info.target_link_speed,
> +		 link_info.target_link_width);

dev_dbg()

> +
> +	/* bring host and device out of suspended states */
> +	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
> +	if (ret)
> +		goto exit_bw_scale_process;
> +
> +	mhi_cntrl->runtime_get(mhi_cntrl);
> +
> +	ret = mhi_cntrl->bw_scale(mhi_cntrl, &link_info);
> +	if (!ret)
> +		response = 0;
> +
> +	response = MHI_BW_SCALE_RESULT(response, link_info.sequence_num);
> +
> +	write_lock_bh(&mhi_cntrl->pm_lock);
> +	mhi_write_reg(mhi_cntrl, mhi_cntrl->bw_scale_db, 0, response);
> +	write_unlock_bh(&mhi_cntrl->pm_lock);
> +
> +	mhi_cntrl->runtime_put(mhi_cntrl);
> +	mhi_device_put(mhi_cntrl->mhi_dev);
> +
> +exit_bw_scale_process:
> +	dev_dbg(dev, "exit er_index:%u ret:%d\n", mhi_event->er_index, ret);

Can these entry exit debug sequences be avoided?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
