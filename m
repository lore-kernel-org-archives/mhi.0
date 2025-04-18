Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7641C683
	for <mhi@lists.linux.dev>; Fri, 18 Apr 2025 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980352; cv=none; b=Q0R6TIp4KbCX9NkYrrd6xfPq0vg7OGg+0QZHH3xaL1Z8niTses42uu/UxQ0VG00w/DqFdrNIhsByZp4rT5Ch3LwRIJV2vCpXjyDxX7d3LuEl71gDVIUqyKjr1Y6wfEVb3XKgMI1iJHTRu72gPdB3c7ROUoFgBLRBCoCuIaPJJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980352; c=relaxed/simple;
	bh=eJmcdcasqheQsUfjBkiQdMc04fHQ0iTzJ96GM9qZpd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsi/Win3iBtxYtNm/Gh84l1hTaw2HM5BChp2gcYuQOe6EPas2LEKL6JoTA7LZy4W/BhGHXxjoRaAKb9eqN1TKS71cwtnd0jkHG7NT1nF7we4yLxfDHgIu7dX+D3EYhQ2U8K3dm5ijTSZfm/YN+TncZDKMNMhF2rtQzhs2F0lWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ajmDYji5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ajmDYji5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224100e9a5cso21966135ad.2
        for <mhi@lists.linux.dev>; Fri, 18 Apr 2025 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744980350; x=1745585150; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MY1YeGNd6w1Dnai1dYNXkVTuw65HW6WJZU6tne3NRRk=;
        b=ajmDYji5LMrUFUb/bNLC2Np6icCT+OK2/16LTXNwz/vs626LMQYvXZort1ceBE89kx
         kT6W5FBoNP+80oa2fzLc0GXTiUbhtIDSyg7VpmchhP4/MyozRaGlbGSN0FRCdLbj7XCc
         NQyCEU7spFdRM2NhTR7Qi5TyAqqw8pDhc5ZOeiwhsoiIVCmPuHoIC8OC/N8pNtIHWJhS
         Yh/GVdpsMF29hfLoEsqAYv3C9pSAhSQ3MQ9pXvd8N8cmYZ13Oq+2fsPtLULSh48j9mvn
         pWtHqZPIsqw09bJ33YnluQs26YAIl31Iu0jnP2vwSyg/0exh9Ct5OmP1FiuxYMNtIcrq
         45Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980350; x=1745585150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MY1YeGNd6w1Dnai1dYNXkVTuw65HW6WJZU6tne3NRRk=;
        b=RgKbz86NRPV6sTcwcAhPf3klHNgKzLGhL1SzjEiUHEBQgs+KioTPiddLLOYPDfrwuK
         5dbr01RSvFgYg6/rc0V2SCH7CUS5ZeFrL8UOwy4YQjyu/QOGh4LI9+KYSLDfLWSGB3ji
         iFRP+QVOoxk9VhvI6n7b8PWq81DPj6s2qxt2DESirnWiulJAlhNpTLBPyY0GSI2bYxf+
         wEFShZg+uvvjfF4nmDcNeCOVPQZU0kyYMP7Ry193NvZUB1R29I36bRw0O0gr9hXRn6gJ
         2tWy4eLX3wPqy6RJ6cvVZePyburTs5N5hn3BulXTaQpzVXeWlnygpSUD7ZQEws/XZTNf
         KWXA==
X-Forwarded-Encrypted: i=1; AJvYcCUwJp/9YCdGrDl+Oh7ZTg4lciEpw3Uky0B2XR5ZR2M2TFecvQXS0IOkNnJRQ7PkW8XUXKo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxENNUdSERSP8OrHbQHbNYUhLGQ1GkwcjQpRZApdIVbNT1SH/8a
	Spq80Od4nFvpR5OWQXm2W6odPtDxYnjB9TnqGANWaew0XQAiOCKtRxyHsGxTig==
X-Gm-Gg: ASbGncvaHpMsNAWkSTt/G4XshpkQw112rVmFolmWa5tGsmxWm6aLF3pqQyejgqfxhvr
	KwhuboTyBj35LLyYMOjxINZQghGBMpNUbZd/1GNk7q5E+pZXVdkBU7/z5mhF8yt0f1bE+O9HiST
	z88YMEpuOr2v30pU72sC/JIdo3/agD7908HAiuBPbg0c8EcLbxA8h/jv/9KquUqRNf2fWTmIj/V
	VEH4/r3ZXizyRCfelqby11izPfyhi9IO0PuLyT9OSIHTf4CYu1x1fTvWNUvOH0fkCyIdQD5FnWb
	NTMK23lTQBe12gqRJr0JVK9X0LqSxjtvP+OCTn6KqQDq0fvdyqHdnDvXddb0iv6X
X-Google-Smtp-Source: AGHT+IHeaaTGjZPgOQ9SxEkyin52xIGApRW/zhdV9OBxFloBKDs8lYnW8IxD27iYpLOVTohhHonpig==
X-Received: by 2002:a17:902:d506:b0:220:d439:2485 with SMTP id d9443c01a7336-22c535acc7amr38422685ad.29.1744980349832;
        Fri, 18 Apr 2025 05:45:49 -0700 (PDT)
Received: from thinkpad ([220.158.156.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed1301sm15807295ad.184.2025.04.18.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:49 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:15:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <tbktzaxkgsc6d4ma4o6vkkcpnqiwghxkvwryrm36znepgqjotl@5n3di2ew3s6f>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
 <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
 <c8699f79-54cc-4adb-8047-b37a69e69d96@quicinc.com>
 <qrb4ozkj3zxfpo733mf6xf35tetfyekytkty6sq7civhycbahm@c6s3wfvmdycs>
 <2ab9a8f9-b051-4213-a9df-4b2c2fa8c6be@quicinc.com>
 <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09ec85db-cc02-4b35-9939-aea3426d0e0b@quicinc.com>

On Fri, Apr 18, 2025 at 03:40:48PM +0530, Vivek Pernamitta wrote:
> 
> 
> On 4/18/2025 3:04 PM, Vivek Pernamitta wrote:
> > 
> > 
> > On 4/18/2025 2:06 PM, Manivannan Sadhasivam wrote:
> > > On Fri, Apr 18, 2025 at 11:55:24AM +0530, Vivek Pernamitta wrote:
> > > > 
> > > > 
> > > > On 4/17/2025 11:37 AM, Manivannan Sadhasivam wrote:
> > > > > On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao
> > > > > Badiganti wrote:
> > > > > > 
> > > > > > On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
> > > > > > > The QDU100 device does not support the MHI M3 state,
> > > > > > > necessitating the
> > > > > > > disabling of runtime PM for this device. Since the
> > > > > > > PCIe core framework
> > > > > > > enables runtime PM by default for all clients, it is
> > > > > > > essential to disable
> > > > > > > runtime PM if the device does not support Low Power Mode (LPM).
> > > > > > > 
> > > 
> > > Not true... See below.
> > > 
> > > > > > > Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
> > > > > > > ---
> > > > > > >     drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
> > > > > > >     1 file changed, 10 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/bus/mhi/host/pci_generic.c
> > > > > > > b/drivers/bus/mhi/ host/pci_generic.c
> > > > > > > index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797
> > > > > > > 100644
> > > > > > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > > > > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > > > > > @@ -43,6 +43,7 @@
> > > > > > >      * @mru_default: default MRU size for MBIM network packets
> > > > > > >      * @sideband_wake: Devices using dedicated
> > > > > > > sideband GPIO for wakeup instead
> > > > > > >      *           of inband wake support (such as sdx24)
> > > > > > > + * @pm_disable: disables runtime PM (optional)
> > > > > > >      */
> > > > > > >     struct mhi_pci_dev_info {
> > > > > > >         const struct mhi_controller_config *config;
> > > > > > > @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
> > > > > > >         unsigned int dma_data_width;
> > > > > > >         unsigned int mru_default;
> > > > > > >         bool sideband_wake;
> > > > > > > +    bool pm_disable;
> > > > > > >     };
> > > > > > >     #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name,
> > > > > > > el_count, ev_ring) \
> > > > > > > @@ -295,6 +297,7 @@ static const struct
> > > > > > > mhi_pci_dev_info mhi_qcom_qdu100_info = {
> > > > > > >         .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > > > > > >         .dma_data_width = 32,
> > > > > > >         .sideband_wake = false,
> > > > > > > +    .pm_disable = true,
> > > > > > 
> > > > > > |no_m3|orno_|m3_support|would be more suitable than|pm_disable|
> > > > > 
> > > > > Yes!
> > > > > 
> We named variable pm_disable because the M3 state is implicitly set during
> runtime PM suspend. Both are not needed and not fully supported for the
> QDU100 accelerator card, so we want to disable runtime suspend for it.

You are mixing terms here. Only M3 is not supported by the device. The fact that
you do not want to enable runtime PM for the device to avoid latency is a side
effect of that. So you need to name the variable as 'no_m3'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
