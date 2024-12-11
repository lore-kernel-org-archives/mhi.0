Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBCD18BC3F
	for <mhi@lists.linux.dev>; Wed, 11 Dec 2024 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932614; cv=none; b=T/G20Zqptuc60fAeTDPY9rE/bO7I3Jh9WBmbM1NLuj0oxRwrAlsbefUy+ETxRWSZ4pPLmjW45nkDTBjXrvqC8f7M8wKXJuk1OIayMHv28rB3nDUjPgrJCVpLniAm8B59zMLAnUbs+/aQKMX2AgfihmeY7eU1O7R8Ib4tQb0MiCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932614; c=relaxed/simple;
	bh=KxTYuT0vkTL+6lVCC0QaDEDlT7tZIBhtwtLSD+T02wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNuljXZPy+bPHCEx40rvlyvVjpkblkAq7+lw3zjOOct+ANtK/KQbLWRau56Ash0nNyhnfC5XG2viXu7Pc04gDnxnKuztidGjaa/XUdXPKpqOOwV/LBBhldLTQ6D8p1yI/saw2SUewqBx6OpttR8ZjYlfd5SGHTftf+cvZhZsmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTJfUTTm; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTJfUTTm"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725d9f57d90so3193661b3a.1
        for <mhi@lists.linux.dev>; Wed, 11 Dec 2024 07:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733932612; x=1734537412; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xiuNCg1ODadPaFJsjkbY0AkkT/7XxAvNyr8sRXru+xc=;
        b=JTJfUTTmCJKcOLDooHC+6QGnf2cp0TgvDVwyQogdjKkFSHq/lPkLaaWDBpCFi+BBnW
         NMc1aK3x+fLuBtNznbyxFtEesQPDDRpFkSQZ89CAorUxpgnQboE4WMjMvIxcVz5LuzpO
         5Dmuq/M3DOV+c9fET1t8u70oCE8PXnKyGdf1MxSyPofsucLroxPuhpOnFbH4AgjS6/FH
         Hh239Q2IPhG0T9/AXcG/DmBtcVNadA9sRBqMm5trsmKSjZDD86es4ar9/ngWeP/J+PgE
         R9pph7pzeyksOLruwmuD94rmbp2LDXR5c1VL3DCRklJh7575c4i2HmE8nrjUv4j8RkD1
         FQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932612; x=1734537412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xiuNCg1ODadPaFJsjkbY0AkkT/7XxAvNyr8sRXru+xc=;
        b=Y2JF0w1+palGgexY2et+ZAVcHZSbKUMpaCiosHfGS9GJSYno9AHtXLytnjUWF9+l3v
         GXv2UWNQUaodRSwxd7zTUirgBmWwJqWEpB3crWSvLGaOWLt6i0+3gotsSxMYARx5GFgh
         6cytsfSHaPgn3LjSxDcPstdiKLiYte9JE40K4yEUBV3EYwGlOam8QhzlljF8W/a6/7/O
         2bKPcPzGYIOM4QQIPt37bLbCeOMZXPAtMPuFWzh6OOBWdf/oOn6L/6LrcTbaQ71qWGkA
         sWDIotLaeN+rBt0aWl9DEAc+21+JRFipdlDpa1FbAkCc0syutFYZlZbGSJQQ/4zUS/4T
         D4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXBwYiXgi83Lr2TMS+3k7WIzdrNoKOxMiBaaG/3gI9sM7LvyrSm5AZqw4c8yXC76O9iBz8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5IdSNFkai6VMmfm1ck7YgApkXzpIy/K5uPRQABFdI1VJuVPE2
	Bo2jELxcJZqVPeqZxSA1Al69m/Py5zzzSkDCtbLZBvn93/NXCeS4XKWEAB8WEck4pePtAt3jrdk
	=
X-Gm-Gg: ASbGnct9mzmTwQn01l+fDF/rssWe0kqeMKgCib2lXogExgVUxabbnPxp4C4ZJ/QmlYh
	FDn9r1WdB1c8Gj9W4j9LwUv1lxTV4S30DMmkdd3oyswSSjdHg9WT7e2V5aLKtSfFNcHrbbuCIoT
	bJnUgMvJp6fxHgQ5jxi7RJI36HU8FJVhStRkIxxCudOS41zzMQw+uSoUWYWFwxk8h+8lAl2vS/y
	aP1GxvNxisWrc0RfG++w0s1E9g+auZOnUd6fEELNrRB6ZU5Sf63b056AN1f340=
X-Google-Smtp-Source: AGHT+IG79oEDGy15sALBwwOM26SFeKz9htGCpyYhhFB6RC1ODZSEyo3vCfl28XJ5iJEsPUIZnGagvQ==
X-Received: by 2002:a05:6a20:9f88:b0:1e1:ab63:c5e8 with SMTP id adf61e73a8af0-1e1cdaa7654mr641573637.26.1733932612149;
        Wed, 11 Dec 2024 07:56:52 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd157d2bf4sm9446322a12.74.2024.12.11.07.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:56:51 -0800 (PST)
Date: Wed, 11 Dec 2024 21:26:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Vivek Pernamitta <quic_vpernami@quicinc.com>, quic_krichai@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241211155637.yooehsxb6oskl464@thinkpad>
References: <20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com>
 <20241211064155.gqlbi3leoaaz3w6b@thinkpad>
 <540fa0c1-2e84-0c11-87e9-09198d6f270f@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <540fa0c1-2e84-0c11-87e9-09198d6f270f@quicinc.com>

On Wed, Dec 11, 2024 at 08:24:18AM -0700, Jeffrey Hugo wrote:
> On 12/10/2024 11:41 PM, Manivannan Sadhasivam wrote:
> > On Mon, Dec 09, 2024 at 11:09:50AM +0530, Vivek Pernamitta wrote:
> > > Add MHI controller configuration for QDU100 device.
> > > 
> > > The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
> > > servers by offloading CPUs from intensive 5G baseband functions.
> > > 
> > > Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> > > 
> > > Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> > > ---
> > > changes from V3:
> > > - Removed IP_SW1 and IP_SW2 support currently, will add once
> > >    SW_IP1/2 channels support are added to mhi-net driver.
> > > - Removed qdu100 edl images, as EDL images are not needed.
> > > - Added space inbetween kernel_ulong_t and mhi_qcom_qdu100_info.
> > > - QDU100 XBL FW images were pushed to linux-firmware git repo
> > >    https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/qdu100
> > > 
> > > changes from V2:
> > > - updated commit text.
> > > 
> > > changes from V1:
> > > - Changing naming convention from modem_qcom_qdu100*
> > >    to mhi_qcom_qdu100*.
> > > - Updated commit text.
> > > - Fixed and corrected by passing mhi_pci_dev_info struct
> > >    instead of mhi_controller_config.
> > > ---
> > > 
> > > ---
> > >   drivers/bus/mhi/host/pci_generic.c | 55 ++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 55 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > > index 07645ce2119a71c9277356e962252b840379cd81..dee9fa9e7ae441fbc9a86e53694568c0ba192002 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -245,6 +245,58 @@ struct mhi_pci_dev_info {
> > >   		.channel = ch_num,		\
> > >   	}
> > > +static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
> > > +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
> > > +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
> > > +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
> > > +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
> > > +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
> > > +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
> > > +	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
> > > +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
> > > +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
> > > +	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
> > > +	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
> > > +	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
> > > +	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
> > > +	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
> > > +	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
> > > +};
> > > +
> > > +static struct mhi_event_config mhi_qcom_qdu100_events[] = {
> > > +	/* first ring is control+data ring */
> > > +	MHI_EVENT_CONFIG_CTRL(0, 64),
> > > +	/* SAHARA dedicated event ring */
> > > +	MHI_EVENT_CONFIG_SW_DATA(1, 256),
> > > +	/* Software channels dedicated event ring */
> > > +	MHI_EVENT_CONFIG_SW_DATA(2, 64),
> > > +	MHI_EVENT_CONFIG_SW_DATA(3, 256),
> > > +	MHI_EVENT_CONFIG_SW_DATA(4, 256),
> > > +	/* Software IP channels dedicated event ring */
> > > +	MHI_EVENT_CONFIG_SW_DATA(5, 512),
> > > +	MHI_EVENT_CONFIG_SW_DATA(6, 512),
> > > +	MHI_EVENT_CONFIG_SW_DATA(7, 512),
> > > +};
> > > +
> > > +static const struct mhi_controller_config mhi_qcom_qdu100_config = {
> > > +	.max_channels = 128,
> > > +	.timeout_ms = 120000,
> > > +	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_channels),
> > > +	.ch_cfg = mhi_qcom_qdu100_channels,
> > > +	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_events),
> > > +	.event_cfg = mhi_qcom_qdu100_events,
> > > +};
> > > +
> > > +static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> > > +	.name = "qcom-qdu100",
> > > +	.fw = "qcom/qdu100/xbl_s.melf",
> > 
> > Can you first push this fw to linux-firmware? I haven't enforced this
> > requirement earlier, but that was my mistake.
> 
> Mani, this is already done.  There is a handy link in the change log. Did
> you miss that, or is there something still missing?
> 

Oops. I missed it indeed. Please ignore my above comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
