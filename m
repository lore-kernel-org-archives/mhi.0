Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45A6DCE1
	for <mhi@lists.linux.dev>; Wed, 11 Dec 2024 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733899327; cv=none; b=PmLmLs7tBefjXH4KqTsPRN8lIS+DcOxq3gF7lIfLBq43o/4NTe5s1cBZOgHpixfOgbVWuwTHyEHf24ZN+1SOosbZtvEGwwuMjBzLjWRUbrfJrPQrYhKQN4R56Sqrk/BafwK8rTIAfaGr9bcqkzhwgJq0rmOek8I1eNQWMhw7zpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733899327; c=relaxed/simple;
	bh=fFveP77bj++EtRJvy3YCVpCGVLLJJ20B4rPICaCeOGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pW7GYjRt/dOo0+ki2LbooM02Zn/BNJ9aQ2Q4NWrM3fLC14CH8e4o4hiHXGIcyQFGlsieqwEhN03aKSgtxnmY4yp09tmC+dK7jnAwKQu6YCc0Fbw4IeEGU04pnzpibTMlN2p3DFAOW45MSDK+hqy1RYlpNr96MIGLYc/gDeWZIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwSPgZCk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwSPgZCk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166360285dso25163685ad.1
        for <mhi@lists.linux.dev>; Tue, 10 Dec 2024 22:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733899325; x=1734504125; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SH3wSIT4qOX2QKfL+TrwrsCejAN9yTnzSj4WW/yKpJg=;
        b=AwSPgZCkNua98hiMt7hYbdTKkteoeu9ZSjmlZAV2PX0QbxmXEEMDwsSGzqh87N32aA
         JuAqgX8hHE5TMjb3dgG5udk14UBXEi8MUa/U8wpwAahZ11VNJmY4wrCfYs4lXaoLE3fg
         0DyCqr7p5Q2A426sh97Y2EHksmDOZTZ9Ix73BNH8hIp6X0PQQeNLz1y3k8NtjIT5hdgU
         j8Qd/z+D77yY7c+VAXkqCvdMgZkmLjZ8EHX+rvKt2jzAiXAjyontmVoIcgXE4+TSDSz9
         tuU6p+PF6twWp23Smmf9Q1czSUpo9+nw+irmVlu0bPM799yYF0vokdrOe4PFCWq20Hd4
         NFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733899325; x=1734504125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SH3wSIT4qOX2QKfL+TrwrsCejAN9yTnzSj4WW/yKpJg=;
        b=utzWQCJ+jN5c36IxDJ+wcK++cGbWhhdLUtElpIXOxo0/bmCaCNEv2W5KJ3he9VLunt
         rJjj5xgZ4ui36D4wNL31FjSvw2XaR9ABk0Jq5lkNKaSiEg7fvBjKdFoyd0zP4zKAlokL
         Am4eOJ1apRTSYicEHblwEDtIJzkSd8uWjgx4YKmZL6OcnQZqtQOO4xN+fgRVzuyHfIkQ
         segYlQ+UidRjQhhvKffjtiVwm4G/EwF3QOQ1ft1HGzm6BFQV7Xoqc80rimO8ju9fX+vZ
         j09WmJL+CrwcupDq+Xx8hglnU/2pGUOREkjAOzCt6ynzrAV5DFvXA007gbJ1nBrpgSjz
         QyHg==
X-Forwarded-Encrypted: i=1; AJvYcCXvxsYNJiJvMcqSODWnN9f+7SO+Y9qMJo+1/TDRDLSOT+Dow8NAoHY3UC1dIK0fhofW3Ag=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc5dJyyBrGWF1xuc4Cw0yPiGkf+DFG4LHegSLpmCdiw7i5Qp97
	9Ao0hkrlLmy2n2PNYE3HWdppTL/eKOZSxzGrd1eY/TqjZxvhznfkPAQMUuMasA==
X-Gm-Gg: ASbGncu4Ocpi/ZjKHUSlzIhne4IhE1B3uCCXmNXYUTAC98IEq3k/2yFmG8FEWU+wY2R
	Nru+QKvket4RJfwRuqjN7eRJp7RNyPUhcGHrdedIwQL1DWXnL21+/vKxUJvPaRHw+RdJsS9ajHM
	Paz+whQue7hx+rqLrueHqTncGaBhaM0NYOhlJ/QjknurNo4SvnX7qnYbvI8wnbx7vFzHSAxvsUq
	1iXplTMrwHgK7muacKnsosdis/8Idg+/6bbPJLjnGoAbKxRS3B0HKSZORqJruQ=
X-Google-Smtp-Source: AGHT+IH9UlXRucX87GfmhnSoQKYdfmBeTDDM2mlEgeF1Kko5nxbNbCHi9DSPm8qDL6kLUq2gp73FUQ==
X-Received: by 2002:a17:903:32c3:b0:216:48f4:4f1a with SMTP id d9443c01a7336-2177851dc1fmr29082555ad.16.1733899324633;
        Tue, 10 Dec 2024 22:42:04 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21618d9beafsm82495805ad.6.2024.12.10.22.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:42:04 -0800 (PST)
Date: Wed, 11 Dec 2024 12:11:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: quic_krichai@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241211064155.gqlbi3leoaaz3w6b@thinkpad>
References: <20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com>

On Mon, Dec 09, 2024 at 11:09:50AM +0530, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
> servers by offloading CPUs from intensive 5G baseband functions.
> 
> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
> changes from V3:
> - Removed IP_SW1 and IP_SW2 support currently, will add once
>   SW_IP1/2 channels support are added to mhi-net driver.
> - Removed qdu100 edl images, as EDL images are not needed.
> - Added space inbetween kernel_ulong_t and mhi_qcom_qdu100_info.
> - QDU100 XBL FW images were pushed to linux-firmware git repo
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/qdu100
> 
> changes from V2:
> - updated commit text.
> 
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*.
> - Updated commit text.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
> ---
> 
> ---
>  drivers/bus/mhi/host/pci_generic.c | 55 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 07645ce2119a71c9277356e962252b840379cd81..dee9fa9e7ae441fbc9a86e53694568c0ba192002 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -245,6 +245,58 @@ struct mhi_pci_dev_info {
>  		.channel = ch_num,		\
>  	}
>  
> +static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
> +	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
> +};
> +
> +static struct mhi_event_config mhi_qcom_qdu100_events[] = {
> +	/* first ring is control+data ring */
> +	MHI_EVENT_CONFIG_CTRL(0, 64),
> +	/* SAHARA dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(1, 256),
> +	/* Software channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(2, 64),
> +	MHI_EVENT_CONFIG_SW_DATA(3, 256),
> +	MHI_EVENT_CONFIG_SW_DATA(4, 256),
> +	/* Software IP channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(5, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(6, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(7, 512),
> +};
> +
> +static const struct mhi_controller_config mhi_qcom_qdu100_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 120000,
> +	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_channels),
> +	.ch_cfg = mhi_qcom_qdu100_channels,
> +	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_events),
> +	.event_cfg = mhi_qcom_qdu100_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> +	.name = "qcom-qdu100",
> +	.fw = "qcom/qdu100/xbl_s.melf",

Can you first push this fw to linux-firmware? I haven't enforced this
requirement earlier, but that was my mistake.

> +	.edl_trigger = true,
> +	.config = &mhi_qcom_qdu100_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> @@ -822,6 +874,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* NETPRISMA FCUN69 (SDX6X) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
>  		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
> +	/* QDU100, x100-DU */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },

Did you read the comment on top of mhi_pci_id_table[]?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
