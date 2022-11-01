Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC3A7E
	for <mhi@lists.linux.dev>; Tue,  1 Nov 2022 11:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E73C433D6;
	Tue,  1 Nov 2022 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667303092;
	bh=7gwTNaunjFo8HfcZYaWszNB8IHx8W1LUONJCI5yJcVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riT0cVS5esTODyFKMzdfWir9w0vqCNd52GWk17/mPevL+9X9eGXNyun4u9rOBX9hZ
	 1gL7ONVPLtzMHVbL/gaQ+bPa848mThLiF9tLSHw4YxrERQHjB6lsXlCfJztLskDPQ2
	 exq7jBH5I2uCZag6kCqUNQDeHD+zaSBV9CkvCFZFQD7VZRqr5vXwU4CZ1g8+SProhV
	 3o1qwfVAUp0wpX+NXvHhQjq5/xanoURruyIvRkIM0KdcOytgg6cpGrZTYn36QPM4kS
	 rLdgeJHiTqu7sM+4A/YVRYsUVYiL/jlP7ehyi7NZ4CnfrG0saIVWu+B5LobU6N3fWr
	 tbPcGvQR6Uyig==
Date: Tue, 1 Nov 2022 17:14:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Song Fuchang <song.fc@gmail.com>
Cc: mhi@lists.linux.dev, manivannan.sadhasivam@linaro.org,
	quic_hemantk@quicinc.com
Subject: Re: [PATCH RESEND] bus: mhi: host: pci_generic: Add HP variant of
 T99W175
Message-ID: <20221101114441.GC54667@thinkpad>
References: <676290c3-0435-d85c-99dc-084f120ee04c@gmail.com>
 <20221028172704.GE13880@thinkpad>
 <7c93e208-3d2e-2884-21a6-efebc1812e8c@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c93e208-3d2e-2884-21a6-efebc1812e8c@gmail.com>

On Sat, Oct 29, 2022 at 09:19:46PM +0800, Song Fuchang wrote:
> Hello, this modem is really a T99W175, but the vendor id 03f0 is for HP Inc.
> It also has some HP-specific serial numbers printed on its case.
> 
> Output of lspci for this modem:
> 
> 01:00.0 Wireless controller [0d40]: Device 03f0:0a6c
> 
> I don't know why the HP's variant uses a different VID, maybe some business
> decisions? Though it works well with this driver on my laptop.
> 

Okay, thanks for the clarification. Could you please add these info to the
commit message for the record?

Thanks,
Mani

> Thanks!
> 
> 在 2022/10/29 01:27, Manivannan Sadhasivam 写道:
> > On Sun, Oct 09, 2022 at 11:34:39AM +0800, Song Fuchang wrote:
> > > The foxconn T99W175 has an HP variant, so add support for it to the
> > > pci_generic driver.
> > > 
> > > Signed-off-by: Song Fuchang<song.fc@gmail.com>
> > > ---
> > >   drivers/bus/mhi/host/pci_generic.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c
> > > b/drivers/bus/mhi/host/pci_generic.c
> > > index 9e545f2a5a26..650e8b9c26ad 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> > >       /* MV32-WB (Cinterion) */
> > >       { PCI_DEVICE(0x1269, 0x00bb),
> > >           .driver_data = (kernel_ulong_t) &mhi_mv32_info },
> > > +    /* T99W175 (sdx55), HP variant */
> > > +    { PCI_DEVICE(0x03f0, 0x0a6c),
> > Why a new VID for this modem? Other T99W series modems are using PCI_VENDOR_ID_FOXCONN.
> > 
> > Thanks,
> > Mani
> > 
> > > +        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > >       {  }
> > >   };
> > >   MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> > > -- 2.37.3
> > > 

-- 
மணிவண்ணன் சதாசிவம்
