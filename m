Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD621D4D
	for <mhi@lists.linux.dev>; Wed,  2 Nov 2022 13:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CBBC433C1;
	Wed,  2 Nov 2022 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667394064;
	bh=Ya+iV47LngMO5VZBW5zw3eNDPPh+/xOf7mFH1rcefm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWf2L0nP1CzYSuCw4UIYQPM0LcIFv2V1WlgxECyN4mzjXlJfEyeUQU/9AISPjlsxd
	 Pw4b6aQJQQ1IlsvAWKSFIbczFeQBoEhygkNp+a0YnuL+whqT8m+228rfpezw5Y0xav
	 pbbSYulTImNaJyh1PU4wv3yjpL4yVSQXh6ZiANhkw72Aq2qHfMMKVgxytZVCRiip+S
	 IOl97QHbliKNFYqPyxVR/ecaABZrRgdtS7DiF/1lxqdthO32SpXR6PAHJPJ1W/zM1Z
	 pGALiy8svhptgcXY/TfeDDh/sSbgO9aTg5sKIPr7pNxTLiAiqbIO4/iC0mgGG45RIq
	 zWTOMZ1Rb8Ikw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oqDMN-0005YT-OQ; Wed, 02 Nov 2022 14:00:48 +0100
Date: Wed, 2 Nov 2022 14:00:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mhi: pci_generic: add support for sc8280xp-crd SDX55
 variant
Message-ID: <Y2Jp/wNPmTrC6sEy@hovoldconsulting.com>
References: <20221031083429.18971-1-johan+linaro@kernel.org>
 <20221101114258.GB54667@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101114258.GB54667@thinkpad>

On Tue, Nov 01, 2022 at 05:12:58PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Oct 31, 2022 at 09:34:29AM +0100, Johan Hovold wrote:
> > The SC8280XP Compute Reference Design (CRD) has an on-PCB SDX55 modem
> > which uses MBIM.
> > 
> > The exact channel configuration is not known but the Foxconn SDX55
> > configuration allows the modem to be used so reuse that one for now.
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index caa4ce28cf9e..f9f4345d472d 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -542,6 +542,9 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
> >  static const struct pci_device_id mhi_pci_id_table[] = {
> >  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> >  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
> > +	/* SC8280XP-CRD (sdx55) */
> 
> Platform device name is not needed.

Ok, only added it because the other entries had a description.
 
> > +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
> 
> Sub ID looks wierd. Did you test with mhi_qcom_sdx55_info? If it didn't
> work, what was the issue?

I obviously added the new entry because the default match did not work.

I haven't had time to look at this since before the summer, but based on
my notes and a quick test now it seems that the QMI channel is not
supported and ModemManager takes forever to enumerate with a bunch of
failed transactions every second:

  ModemManager[469]: [/dev/wwan0qmi0] Checking version info (45 retries)...
  ...
  ModemManager[469]: transaction 0x2 aborted, but message is not abortable
  ...
  ModemManager[469]: transaction 0x2e aborted, but message is not abortable
  ...
  ModemManager[469]: <warn>  [plugin/generic] could not grab port wwan0qmi0: Cannot add port 'wwan/wwan0qmi0', unhandled port type

According to my notes I could connect to the provider after the (~45 s)
timeout, but no data was coming through with the default config which I
attributed to the differences in the data channel configuration (i.e.
"IP_HW0" and "IP_HW0_MBIM" are handled by different drivers).
 
> > +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> >  	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
> >  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
> >  		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
> > -- 
> > 2.37.3

Johan
