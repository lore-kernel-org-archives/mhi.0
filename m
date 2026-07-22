Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428EB40F74E;
	Wed, 22 Jul 2026 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722745; cv=none; b=Zu37FyqKpJBzOGoEkKYy93yjkwo3MEw0MaY4fypYvf/RrlcU/gpfyOGkBGyJDKefSdHt3uF2MxuIlpl6b1dv5y3E+xZHP4smH+3yqZ0ZF4Oho8RLZtMJ9HIuqTx225qs5+xAQroK+YEPjJ8O0kUJQZrO23KLQZibk76v2QBgm6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722745; c=relaxed/simple;
	bh=dErIGIlmgS9qihi2kpWW7BktPQQwKUV4bDaA5OeyHFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWmD/wioalf/rt9/+eQ9HqW8oXH7SW16I9qWWZz7dBLRx/0jl9vmw/zhPVMl1Pjqphs9RHQn6UMpsOKZeb2ZDPnGLEofTvsz4WMeMDw+Gpi0X/GFAqeGbl/C8n5GtuFsjHIP3ZoaRai2jUpIbfqvlo0UCXMEJr44GL7/k7GJVwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUe4vN+j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUe4vN+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E9A1F000E9;
	Wed, 22 Jul 2026 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722744;
	bh=YBYxvphVzaO+exxtEUBtrzLqzhIi/n0DZS50ea926Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mUe4vN+jxqTkZivcklfZKiZiME9FB6L+MyLH4Z1PwR8dk48o79XFx2/2gF6HRa9l3
	 KTRYQsRq6XfDyMPM5BeGrILtpyMn+EzCSPuwLFWi3sZyuLM9b6Z3yYCBXb66VEwXBH
	 l4IOrnIBr34bauT1l4kd2FRUptomIGqeL04q/hkc13gBl3UOscEV1uGs/OXDbGw70M
	 DH70B1gc/uMdK3tbX+x251k2TdpGWi/MuPC+gi8zKevdCTF1Pu8ZdyZyKY75VAwtrS
	 sX4IqKhBDA88so1XeCjsl79SVG3HHHvwbFSxc0UStKeeGfmAQwdYKfHW5gGpMqkApo
	 W7BeydqvMYbnA==
Date: Wed, 22 Jul 2026 14:18:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: clean up some kernel-doc warnings
Message-ID: <zbt7s3siqmtuuiiknbsmdvm7yzy5p2qwwrvezwp4as5c6y4wtj@wfslwqxxg5jr>
References: <20260719223231.2855431-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260719223231.2855431-1-rdunlap@infradead.org>

On Sun, Jul 19, 2026 at 03:32:31PM -0700, Randy Dunlap wrote:
> Clean up some kernel-doc comments and warnings:
> - use correct format for struct members
> - add one struct member description
> - add one function parameter description
> - mark one enum as private
> - add a leading '*' on one kernel-doc line
> 
> Fixes these warnings:
> Warning: include/linux/mhi.h:108 struct member 'target_link_speed' not
>  described in 'mhi_link_info'
> Warning: include/linux/mhi.h:108 struct member 'target_link_width' not
>  described in 'mhi_link_info'
> Warning: ../include/linux/mhi.h:159 Enum value 'MHI_STATE_MAX' not
>  described in enum 'mhi_state'
> Warning: ../include/linux/mhi.h:212 bad line: for UL channels, multiple
>  of 8 ring elements for DL channels
> Warning: ../include/linux/mhi.h:236 struct member 'wake_capable' not
>  described in 'mhi_channel_config'
> Warning: ../include/linux/mhi.h:449 struct member 'M0' not described
>  in 'mhi_controller'
> Warning: ../include/linux/mhi.h:449 struct member 'M2' not described
>  in 'mhi_controller'
> Warning: ../include/linux/mhi.h:449 struct member 'M3' not described
>  in 'mhi_controller'
> Warning: ../include/linux/mhi.h:528 struct member 'id_table' not described
>  in 'mhi_driver'
> Warning: ../include/linux/mhi.h:543 function parameter 'mhi_cntrl' not
>  described in 'mhi_free_controller'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied to mhi-next!

- Mani

> ---
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Cc: mhi@lists.linux.dev
> Cc: linux-arm-msm@vger.kernel.org
> 
>  include/linux/mhi.h |   15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> --- linux-next-20260717.orig/include/linux/mhi.h
> +++ linux-next-20260717/include/linux/mhi.h
> @@ -117,8 +117,8 @@ struct image_info {
>  
>  /**
>   * struct mhi_link_info - BW requirement
> - * target_link_speed - Link speed as defined by TLS bits in LinkControl reg
> - * target_link_width - Link width as defined by NLW bits in LinkStatus reg
> + * @target_link_speed: Link speed as defined by TLS bits in LinkControl reg
> + * @target_link_width: Link width as defined by NLW bits in LinkStatus reg
>   */
>  struct mhi_link_info {
>  	unsigned int target_link_speed;
> @@ -173,6 +173,7 @@ enum mhi_state {
>  	MHI_STATE_M3_FAST = 0x6,
>  	MHI_STATE_BHI = 0x7,
>  	MHI_STATE_SYS_ERR = 0xFF,
> +	/* private: */
>  	MHI_STATE_MAX,
>  };
>  
> @@ -227,12 +228,12 @@ enum mhi_db_brst_mode {
>   * @type: Channel type
>   * @ee_mask: Execution Environment mask for this channel
>   * @pollcfg: Polling configuration for burst mode.  0 is default.  milliseconds
> -	     for UL channels, multiple of 8 ring elements for DL channels
> + *	     for UL channels, multiple of 8 ring elements for DL channels
>   * @doorbell: Doorbell mode
>   * @lpm_notify: The channel master requires low power mode notifications
>   * @offload_channel: The client manages the channel completely
>   * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
> - * @wake-capable: Channel capable of waking up the system
> + * @wake_capable: Channel capable of waking up the system
>   */
>  struct mhi_channel_config {
>  	char *name;
> @@ -350,7 +351,9 @@ struct mhi_controller_config {
>   * @dev_state: MHI device state
>   * @dev_wake: Device wakeup count
>   * @pending_pkts: Pending packets for the controller
> - * @M0, M2, M3: Counters to track number of device MHI state changes
> + * @M0: Counter to track number of device MHI state changes
> + * @M2: Counter to track number of device MHI state changes
> + * @M3: Counter to track number of device MHI state changes
>   * @transition_list: List of MHI state transitions
>   * @transition_lock: Lock for protecting MHI state transition list
>   * @wlock: Lock for protecting device wakeup
> @@ -507,6 +510,7 @@ struct mhi_result {
>  
>  /**
>   * struct mhi_driver - Structure representing a MHI client driver
> + * @id_table: table of MHI channel names that a driver supports
>   * @probe: CB function for client driver probe function
>   * @remove: CB function for client driver remove function
>   * @ul_xfer_cb: CB function for UL data transfer
> @@ -538,6 +542,7 @@ struct mhi_controller *mhi_alloc_control
>  
>  /**
>   * mhi_free_controller - Free the MHI Controller structure
> + * @mhi_cntrl: MHI controller to free
>   * Free the mhi_controller structure which was previously allocated
>   */
>  void mhi_free_controller(struct mhi_controller *mhi_cntrl);

-- 
மணிவண்ணன் சதாசிவம்
