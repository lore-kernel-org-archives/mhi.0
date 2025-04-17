Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E01F0E5C
	for <mhi@lists.linux.dev>; Thu, 17 Apr 2025 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870065; cv=none; b=mtYaCzNAVibjOA6Hk7UJCF74LopSf3XuiiaO58BO9pjkZqzOE2yWhzXka1Xu5LAuDQdKbLKSCPyv8bBiisSJPvhrXl2+Urg6t/MVA/Gc4GvXfzysXYh8v0eUnvLj65mYjinW4GWd0M+a4Y1fxIkDpM67QpMoIjhBPCeqP9/OkjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870065; c=relaxed/simple;
	bh=SJ5pp2PEFU9Mosrf8HZCUtQXVnazURuiUC73cKCZalg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB9xLh8XVoME29354bgpSf++2mzQ4cUjTzk4sp+VkPk40uCLP3ci4UtqKlBocl11YLZymOEIjVK3wATX+QfMaGOGZS9YOkIjLxi3jLLWH1EiH70Bl/qCTrUGsIpUNEVsmhp2tjZa35Z1vnYSKytmAmHL5sLvEJEbkux/zdiWJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cmDYl8eF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cmDYl8eF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7370a2d1981so277060b3a.2
        for <mhi@lists.linux.dev>; Wed, 16 Apr 2025 23:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744870063; x=1745474863; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pd6OOWCuIIKAwnNGxCiRtg0jiUDcshaa45Tlc/bukVw=;
        b=cmDYl8eFgKVO7XilrxuFzQtuJEKjDlwhNrga0Aawp6OtoclzvQ3Ew49G0lmcljNFAQ
         TLmFqwI6oVlzrwf4KckhBlkWenXdHpN3oWyOGL2xk1y72xKcunmUnBWZt1sjdGvWulKx
         CleVhhZuWAykqTbBJuzhl+UcSKwlMBG3EhE1N9Pr9D7w6XlsyLJyjnFwwIvJInxc5wac
         yWyMgdKGYBWIfc3asV4hHaPCzWhX+e65Dq9q1OdaNHkntf9MMyObyenel5kbJOyj0pr9
         aihySnRWxjf1kBKwdHS2DfsAwxrV+I+d1q8HUL8RAH8f0MkIxit3E8W6WZK4DxMkovl+
         nYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870063; x=1745474863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd6OOWCuIIKAwnNGxCiRtg0jiUDcshaa45Tlc/bukVw=;
        b=bZoYP8bsAAx3Nu6ccNjlAIirIxuEM2v2nAU7p8hrzKno3GYzuq6jT58uq2hGiZTjFq
         o8xDPhBPKecme56HeSPQ90KVEKcd+zRi7AGds7+T2Z6ekHkxJGxkoeq5Edn7oUVUI5mV
         yh4Hb7vIASMbCiE70xFbF8LHzRi+zwEEknAR/wRa7tO5k18P2vZp+lXOzueceP+n+8DY
         wAhNlPX3dRRqwyXozwyAfTvmzduR8Wz8cRqXcP3CeHtqq2kdO1BYFPx6YXzIkMma7fCX
         +TCHgwkLJuqGFY24obnfPqxURbA2UE2TxfXXwyXW5GrUMO9j/OixEJKZbfPf8A13rxTC
         nIGA==
X-Forwarded-Encrypted: i=1; AJvYcCUiPg6Kd4aYUmMVPlKYYlHk36w+lbfkca5a/8wEGwoLykUdDgVPj+3AMmpvEMU5u3A1Sd8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhVoQW/wjFZ7xySvZn91aJ7da8QHCZtocXlZStUclSK13mat6F
	DJkYZ3OSEzK+JGA7gX5pyy0kM9t65WiJTYolu2XgonibI5EY6Qd4p4eauSND5A==
X-Gm-Gg: ASbGnctUr8jIQiLEHAPr1wb0SYWbsERZ8zRk7V3+Z0eNsmnLEFPMy1bzr1dtYQQ2jx4
	JuKYaOE5rB3yqzqYmk3yP5nB4SkyOyJaxkRk08pagV2XeZp0gxGmGUpeWZpeht341kb7wXXcJBS
	CThZyU+trgphNjh7wETk9ypgbEC7XtD3oaXVkZa1NM3AOTEBN4CXgFYAu63do+1Xjo8FaOKJJsv
	F4aMYimhzP0i9o71jWpfh/FP+eV0fJUw46vF3FIbh7mbJ9WM7MS3/2qTwa7RJMRQJB/Y7K2wv3d
	pvd7hdRPbTYH6nlQ6dTmraKldtFZKPeYX7/RuoGlemBiegqK
X-Google-Smtp-Source: AGHT+IEGKe8IgUll51m3XVZ/pKTgzfl3xR85lF+5Mw9zim0JsXl11h/TRDH0YYgMcdLUzmlGXqar4A==
X-Received: by 2002:a05:6a00:240c:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-73c266b5fcfmr7618028b3a.3.1744870062780;
        Wed, 16 Apr 2025 23:07:42 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23351fbsm11902923b3a.171.2025.04.16.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:07:42 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:37:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>
Cc: Vivek Pernamitta <quic_vpernami@quicinc.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <o7rv3xgg3btaoqjlzfenbfkrp3fuw54cx6zqojclcfslfg3ha4@c3sqaqqdjdjv>
References: <20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com>
 <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec99379e-fd54-42b0-a383-8ed212072396@quicinc.com>

On Thu, Apr 17, 2025 at 10:00:38AM +0530, Veerabhadrarao Badiganti wrote:
> 
> On 4/14/2025 1:17 PM, Vivek Pernamitta wrote:
> > The QDU100 device does not support the MHI M3 state, necessitating the
> > disabling of runtime PM for this device. Since the PCIe core framework
> > enables runtime PM by default for all clients, it is essential to disable
> > runtime PM if the device does not support Low Power Mode (LPM).
> > 
> > Signed-off-by: Vivek Pernamitta<quic_vpernami@quicinc.com>
> > ---
> >   drivers/bus/mhi/host/pci_generic.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index 03aa887952098661a488650053a357f883d1559b..a011fd2d48c57cf9d1aec74040153267a206d797 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -43,6 +43,7 @@
> >    * @mru_default: default MRU size for MBIM network packets
> >    * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
> >    *		   of inband wake support (such as sdx24)
> > + * @pm_disable: disables runtime PM (optional)
> >    */
> >   struct mhi_pci_dev_info {
> >   	const struct mhi_controller_config *config;
> > @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
> >   	unsigned int dma_data_width;
> >   	unsigned int mru_default;
> >   	bool sideband_wake;
> > +	bool pm_disable;
> >   };
> >   #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> > @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> >   	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >   	.dma_data_width = 32,
> >   	.sideband_wake = false,
> > +	.pm_disable = true,
> 
> |no_m3|orno_|m3_support|would be more suitable than|pm_disable|

Yes!

But does the device not supporting M3 only or D3Hot also? If the former, then we
should prevent MHI host to enter/exit M3 state in mhi_pm_suspend/ mhi_pm_resume.
There is an incentive in allowing D3Hot if the device supports it.

Also, is there a way we could probe M3 support in the device so that we can
check it during runtime?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
