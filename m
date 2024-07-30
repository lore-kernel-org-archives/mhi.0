Received: from cdw.me.uk (cdw.me.uk [91.203.57.136])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED69157466
	for <mhi@lists.linux.dev>; Tue, 30 Jul 2024 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.203.57.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378198; cv=none; b=ZO4Kt9sSyDf3FXcUqLNCNOhCOlBjzEgdR5YP+w5rUpDbHrawtEfmmYPBgr8odncBg120GJfG6FY6etjRUCnA+zOx5wpePg9T5VyrHx1dJJ9c+wDLge/pbNvh2qSVNeFVeYbXoag6Ef5LkrYgd3AMdHaXsdqlWb3IumS3w/AVpEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378198; c=relaxed/simple;
	bh=MozgMn9F6vtNxaqVu0EPkIE+eQlOKBqQRp8tGf+WOa8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bAxm8GbKwmUkIuO5owp25I0HXgOqrqe7GVlYNU7DIzrvbwuwmtyxPux/GzJ1w1m1qiYNteAyit0MRHDPRIqtAmGVFl14MdE/CgVkK947WdxhDasQ19BBb621r0OYO8lPgUXByXzvMOptUSW7lQ0L1NjsVKKJBP5nufer2Y8NB/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com; spf=pass smtp.mailfrom=arachsys.com; arc=none smtp.client-ip=91.203.57.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arachsys.com
Received: from chris by delta.arachsys.com with local (Exim 4.80)
	(envelope-from <chris@arachsys.com>)
	id 1sYv40-0003Hc-W6
	for mhi@lists.linux.dev; Tue, 30 Jul 2024 23:11:24 +0100
Date: Tue, 30 Jul 2024 23:11:24 +0100
From: Chris Webb <chris@arachsys.com>
To: mhi@lists.linux.dev
Subject: PCIe MBIM modem not creating a wwan netdev
Message-ID: <ZqllDCWfiKravZAo@arachsys.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I have a router board with a Quectel RM520N-GL 5G module that speaks either
USB or PCIe. In USB mode, I have

  CONFIG_USB_USBNET=y
  CONFIG_USB_NET_CDC_MBIM=y

and everything works: I get a /dev/wwan0mbim to bring up the modem and a
wwan0 netdev to use with the negotiated config.

If I switch the modem to PCIe MHI mode and compile in

  CONFIG_MHI_BUS=y
  CONFIG_MHI_BUS_PCI_GENERIC=y
  CONFIG_WWAN=y
  CONFIG_MHI_WWAN_CTRL=y
  CONFIG_MHI_WWAN_MBIM=y

the modem is recognised as one of the models listed in
drivers/bus/mhi/host/pci_generic.c. dmesg reports

  mhi-pci-generic 0000:01:00.0: MHI PCI device found: qcom-sdx65m
  mhi-pci-generic 0000:01:00.0: BAR 0 [mem 0x20000000-0x20000fff 64bit]: assigned
  mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
  mhi mhi0: Requested to power ON
  mhi mhi0: Power on setup success
  wwan wwan0: port wwan0qcdm0 attached
  wwan wwan0: port wwan0mbim0 attached
  wwan wwan0: port wwan0qmi0 attached

and this gives me character devices /dev/wwan0mbim0, /dev/wwan0qcdm0
and /dev/wwan0qmi0... but no corresponding wwan0 network interface.

I can successfully bring up the modem over mbim exactly as in the USB case:

  # mbim /dev/wwan0mbim0 open
  # mbim /dev/wwan0mbim0 subscriber
  ready-state initialized
  sim-icc-id 8xxxxxxxxxxxxxxxxxxx
  subscriber-id 23xxxxxxxxxxxx
  telephone-number +447xxxxxxxxx
  # mbim /dev/wwan0mbim0 connect ipv4:internet
  session-id 0
  activation-state activated
  ip-type ipv4
  # mbim /dev/wwan0mbim0 config
  address 10.248.62.56/28
  gateway 10.248.62.57
  dns 192.168.253.31
  dns 192.168.253.31
  mtu 1500
  #

but I have no netdev to configure the negotiated address on:

  # ip link
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
  2: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq master br0 state DOWN mode DEFAULT group default qlen 1000
      link/ether 94:83:c4:a6:cf:d7 brd ff:ff:ff:ff:ff:ff
  3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master br0 state UP mode DEFAULT group default qlen 1000
      link/ether 94:83:c4:a6:cf:d8 brd ff:ff:ff:ff:ff:ff
  4: wlan0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
      link/ether 94:83:c4:a6:cf:d9 brd ff:ff:ff:ff:ff:ff
  5: wlan1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
      link/ether 94:83:c4:a6:cf:d7 brd ff:ff:ff:ff:ff:ff
  6: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
      link/ether 94:83:c4:a6:cf:d7 brd ff:ff:ff:ff:ff:ff

(If I add CONFIG_MHI_NET=y, I get 'raw' links like

  2: mhi_swip0: <POINTOPOINT,NOARP> mtu 16384 qdisc noop state DOWN mode DEFAULT group default qlen 1000
      link/[519]
  3: mhi_hwip0: <POINTOPOINT,NOARP> mtu 16384 qdisc noop state DOWN mode DEFAULT group default qlen 1000
      link/[519]

but no wwan0 link. Configuring the address on a raw link doesn't work.)

I added a printk to mhi_mbim_probe() of drivers/net/wwan/mhi_wwan_mbim.c
and this never fires, which might explain why no netdev is created? The
same thing happens on linux 6.10.2 and the head of Linus' tree at the
time I write this. I also reproduced on an older 6.9.12 kernel.

Is this a bug (with my modem?) or there something more than the above
I need to enable for the network device to be created as well as the
character devices, as in the USB case?

For what it's worth, my complete 'make savedefconfig' is

  https://github.com/arachsys-hosts/gl-x3000/blob/master/config/linux.cfg

Best wishes,

Chris.
