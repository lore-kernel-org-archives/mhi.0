Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161F5B5BB
	for <mhi@lists.linux.dev>; Mon, 15 Apr 2024 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713177202; cv=none; b=slim8cGsqkc03o7uw3QFmi4QpLoY1Gbq16bw9KovhoV6IckzXGXKECHWDjW3gHJO2YJq4MuRx1dxY/Gi5c+MaelNOvPyVAAaysp2VyoD6uXAZOsU4vBfzsbgySmiIJ2IRsl7M9sNKzPdtlxvEX/NaGzcnS7MwTuI2+L/JYqAzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713177202; c=relaxed/simple;
	bh=iNmUx1Ar8A7W7bVGH8ZwDecBdKly7WiqY1W1UYiNuvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3t9SF11iH2Gin7xagtMmopuyyDHZsX9NDQU63rFXrgjo/rPZn2HrowCx8vgM6BVz8ODkSll3o3/hSW308cwfeYKn6+9gaduKYmX5IIcLe/KvHg1TehrneY8CxvVYW2oPLne3JCdaAUOoj3EogTjmAGgN/TdER8Q6DsNLz/R4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E27jsnof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E27jsnof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8701DC113CC;
	Mon, 15 Apr 2024 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713177202;
	bh=iNmUx1Ar8A7W7bVGH8ZwDecBdKly7WiqY1W1UYiNuvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E27jsnofbPO+JddNOQ8lhOnfqIWcbdghzztbYFw/3DU8fncXVG+MMiuO2oQNjyjGC
	 MfT9gENBItGYevLn8IZO7q20sKZVKPEUQbz4mFNzt2IHno6Pf5QEsAgNTZEG8SmO5T
	 pGshDAozKyK2MhYjGpVwh63dDulFGPIKqbEmK5Qjgy3pVVvu8CWEO3olhgnZzQHYvX
	 FHvTO7oE2MvVbXk0xy1aLLESo+pmFDXCExlqc5VoxN4DCnVdwt2rPsJR85urf4ow+9
	 vj8QtnxuB7wWB4Wmi+ip22JygKtv2HzJIcLUwY71yiXnuGYpwSGgvlqxQmF7XNBMem
	 y6NgjmEejk7rA==
Date: Mon, 15 Apr 2024 16:03:16 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Slark Xiao <slark_xiao@163.com>,
	Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev
Subject: Re: failed to power up MHI controller issue
Message-ID: <20240415103316.GE7537@thinkpad>
References: <38c7997c.10212.18e84f08a4f.Coremail.slark_xiao@163.com>
 <20240402045647.GG2933@thinkpad>
 <4d76dd24.edcc.18ebd2606cc.Coremail.slark_xiao@163.com>
 <5b6ca95c-92a0-4f47-9a92-ed8ba3c29fa1@quicinc.com>
 <40210cbb.3949.18ed6b904d6.Coremail.slark_xiao@163.com>
 <ca6b8dfb-7544-40c9-a6f2-e8c25a1b7c2c@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca6b8dfb-7544-40c9-a6f2-e8c25a1b7c2c@quicinc.com>

On Mon, Apr 15, 2024 at 02:09:35PM +0800, Qiang Yu wrote:
> 
> On 4/13/2024 5:10 PM, Slark Xiao wrote:
> > Hi QiangYu, Mani,
> > My case has a bit difference with yours.
> > In my local case, device can't be recovered except a reboot(mainly a cold
> > reboot). Workaround remove and rescan can't solve it.
> > Also, this issue could be occured in some platform in the first bootup.
> > May I know if this issue related with the power sequence of host or
> > pin settings of the connector?
> Hi Slark
> 
> I don't think it's a mhi host driver issue. From the log you shared, there
> is a
> PERST deassertion followed by a PERST assertion closely, leading to device
> run
> out of order.
> 
> // Here, suppose reboot is triggered on host, so mhi_pci_shutdown is invoked
> 91.474100278 [0x0 mhi_sm_pcie_event_manager] Handling
> EP_PCIE_PM_D3_HOT_EVENT
> event, current states: READY and D0_STATE
> 
> 91.747734185 ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST assertion
> 91.747784342 [0x0 mhi_dev_sm_pcie_handler] received:
> EP_PCIE_PM_D3_COLD_EVENT
> 91.748044394 [0x0 mhi_sm_pcie_event_manager] Handling
> EP_PCIE_PM_D3_COLD_EVENT
> event, current states: READY and D3_HOT_STATE
> 
> //Host should power up, so it deassert perst prepare to do link train.
> 92.475207677 ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST
> deassertion
> 92.475269968 ep_pcie_notify_event: PCIe V1711211: Callback client for event
> 8
> 92.475317729 ep_pcie_core_enable_endpoint: PCIe V1711211: options input are
> 0x2
> 92.475321427 ep_pcie_vreg_init: PCIe V1711211
> 92.475323823 ep_pcie_vreg_init: PCIe V1711211: Vreg vreg-1p8 is being
> enabled
> 
> //Process of perst deassert has not completed, but deassert happen, which is
> not expected
> 92.475366010 ep_pcie_handle_perst_irq: PCIe V1711211: No. 2 PERST assertion

Ok. I think I know what is going on. It is related to how PERST# is handled in
the host.

Rockpro64 SoC defines the PERST# GPIO as below in
arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi:

        ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;

Here, the PERST# GPIO is configured as ACTIVE_HIGH. So whatever the value driver
sets as the logical output for the GPIO, it will be reflected as it is on the
physical line.

In the drivers/pci/controller/pcie-rockchip-host.c driver:

	gpiod_set_value_cansleep(rockchip->ep_gpio, 0); # PERST# assert
	gpiod_set_value_cansleep(rockchip->ep_gpio, 1); # PERST# deassert

So when driver asserts the PERST# GPIO, the physical line will output "low"
corresponding to the driver logical value "0". And vice versa for the deassert.

When host reboot happens, the driver is not doing anything specific for PERST#.
So after the SoC reboot, the physical line goes to "low" state corresponding to
PERST# assert (default state of the GPIO) and this is reflected in the endpoint
log as:

	[    91.747734185] ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST assertion

Then, when the host controller probes, the PERST# GPIO is requested as below:

	rockchip->ep_gpio = devm_gpiod_get_optional(dev, "ep",
                                                            GPIOD_OUT_HIGH);

Here, the GPIO is requested with the initial state of GPIOD_OUT_HIGH. Which
means, the driver sets the logical value of the PERST# GPIO to "1" and the
physical value will be "high" and this is reflected in the endpoint log as:

	[    92.475207677] ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST deassertion	

Then during rockchip_pcie_host_init_port() of driver probe, PERST# is asserted
again to perform register initialization and this is also reflected in the
endpoint log as:

	[    92.475366010] ep_pcie_handle_perst_irq: PCIe V1711211: No. 2 PERST assertion

Once the register initilization is completed, then the PERST# is deasserted:

	[    92.503568354] ep_pcie_handle_perst_irq: PCIe V1711211: No. 2 PERST deassertion

The issue here happens due to the very short time between the first PERST#
deassert during devm_gpiod_get_optional() and then successive PERST# assert
during rockchip_pcie_host_init_port() as Qiang noted.

But the GPIO flag (GPIOD_OUT_HIGH) is what actually culprit. It is supposed to
be GPIOD_OUT_LOW as the driver should not deassert PERST# before configuring the
controller.

@Slark: If you can modify the host platform, then try changing the flag from
GPIOD_OUT_HIGH to GPIOD_OUT_LOW in [1] and see if that fixes the issue during
reboot.

- Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/pci/controller/pcie-rockchip.c?h=v6.6.3#n123

> > At 2024-04-09 12:35:41, "Qiang Yu" <quic_qianyu@quicinc.com> wrote:
> > >
> > >On 4/8/2024 5:59 PM, Slark Xiao wrote:
> > >> Hi Mani,
> > >> Please see attached log files(both kernel log and IPC log).
> > >>
> > >Hi Mani, Slark
> > >
> > >I ever met similar issue like this, where device treated D3cold,ready -> D0
> > >as illegal transition.
> > >
> > >"EP_PCIE_PM_D0_EVENT: illegal in current MHI state: READY and D3_COLD_STATE"
> > >
> > >In MHI spec, there is not transition path from D3cold,ready->D0, but
> > >in fact, we have this transition in some cases.
> > >
> > >For example, when we remove and reinstall pci generic driver. During
> > >remove,
> > >mhi will reset device and pci framework will put it into D3cold
> > directly >when
> > >rootport driver runtime suspend. When we reinstall driver, device will
> > >see D0
> > >event but its current state is D3cold,ready. The whole state transition is
> > >like:
> > >D0,M0 -> D0,reset -> D0,ready-> D3cold,ready -> D0,ready.
> > >
> > >During reboot, if device doesn't reboot with host, look like we will
> > >also meet
> > >similar transition.
> > >
> > >This illegal state error log may not root cause to this issue. Even
> > >process it
> > >as syserr, we can still recovery and go back to M0.
> > >> At 2024-04-02 12:56:47, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> > >> >+ MHI list
> > >> >
> > >> >On Thu, Mar 28, 2024 at 08:02:20PM +0800, Slark Xiao wrote:
> > >> >> Hi Mani,
> > >> >>  Hope you are doing well! I got a problem with our sdx65 device in some
> > >> >> >> >> specific platform. MHI driver would report "failed to power
> > up MHI controller"
> > >> >> when device bootup. Actually, I can reproduce this error when host doing a
> > >> >> reboot. It's Rockpro64 with SDX65, and kernel 6.6.3 or 6.7.10.
> > >> >> >> >> So I add some logs and change dbg level log to info for more
> > print. You can
> > >> >> see my attachments for reference.
> > >> >> It seems the host didn't receive the event of "MISSION MODE" and then
> > >> >> power down the device.
> > >> >> BTW, there are some extra log prints were added in function
> > >> >> mhi_sync_power_up(). You can find it with mask "##shawn##".
> > >> >> Do you have any idea to debug it?
> > >> >> >> >
> > >> >Looks like something gone wrong with the device firmware. Is it possible to get
> > >> >the logs from the device?
> > >> >
> > >> >This could be due to the way the PCIe controller driver on the host handling
> > >> >reboot.
> > >> >
> > >> >But let's get the device logs first to debug further.
> > >> >
> > >> >- Mani
> > >> >
> > >> >-- >> >மணிவண்ணன் சதாசிவம்
> 

-- 
மணிவண்ணன் சதாசிவம்
