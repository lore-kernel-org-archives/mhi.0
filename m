Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A361B375C
	for <mhi@lists.linux.dev>; Mon,  9 Sep 2024 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885526; cv=none; b=VldByrSFwh46He89rPHPeeBvAdhM0IKR1tNF9pVLXq6Oi5UIPcrlUUjd03gNwlN7fUwLGSP9ZN+I4abN5KuvnLaU6EcQQEpmIlj47wzCXoOGMYxqo9ryS6OuAMDtDqz6miI7Jq55xwtfRHEmbfoUanyfKn3rXYRQZrSC/UB9Cm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885526; c=relaxed/simple;
	bh=XC7GnCvAhdg3j33aJZxpUrEQkq2Nf3EIjmct4dvyqnU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VaAX54geNsv0OnOPLxwpSVU1Og/PjGQhzvtCXHoXPQE4HCUwqBSxyocb/BQB7l07vCCahkpjanjJnGe9y2WhJjNxgXJwtdgKt9ANRHTwqHUkxgx2NoJ+LtVdHFlFs50O5gew52StrgP48OcR9MamxNrHpkx6kCdGxd7R/EpSYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMREDLle; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMREDLle"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1d06c728b8so4493854276.0
        for <mhi@lists.linux.dev>; Mon, 09 Sep 2024 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725885523; x=1726490323; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YtCEO069KrybQ4tQ0qbx6pegaKA3Un2LVAJO1KXyWcY=;
        b=dMREDLleJRMp9ZUn90vpMWjmqcrVhwX52ruThRYp+Ut/Jg8mCW3S0uf2TxyMpwgS9+
         E8K/bKU1sHPU9JdDYHrkUH4LSX9342ifHSi6g/8osNphSbLb1GcKRYPIOr2zLUzrFRZt
         /ZXR9xA2JttjLGjVW6Z2sbLFVm17SDjnG3OS/shqOJKhFrFzgTshTNxmCzxkN8EyjYkf
         /VJJDkHT6VtUxr2/wqK1cfU9COcNhkUZr4QzjaHRu/OQRpBf/xiMKYk106X+bsAP8aFK
         BN+DLr2JtEoSX9NsH3hh/mFwPm7gK7le+bM9UdX2EJeO2kr9x2H5WPZ6S37aGo0SmlRt
         f8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725885523; x=1726490323;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtCEO069KrybQ4tQ0qbx6pegaKA3Un2LVAJO1KXyWcY=;
        b=MkqtDbI+rQ1nrKDiX16o7rC8rGkODBTB55EV+8eayzLhnBzMCAYx9FvotqFmhScl05
         RvHFhYRkFZLtr0tW3F4o3RdmqF8N3sqk1QCPS8hy/t/5cPspJaDtt/pVSPqPZqtorlGw
         c+Rmwl8yMUxmh9LCDxlSUnsxfr+zPUJpyWLnluq4fYlaT0YRswt0LM17LvNi3oYPcYNY
         MsE6De3q0BF5CL7ZMYpxbzfE92wXTRa9qSpsBhQCZ4KkDnk2DOPTJNZqlVIj/c7x6bNM
         hrqYPQQeACk9kQZ79i46/w8LrpxpRBNrWo6XDmQWIC7hrM4pAGAktuV0RAdbVb8miyYv
         y3/Q==
X-Gm-Message-State: AOJu0Yw9xwkzZnk+I5dw0lkolY6STE5uDLtbEMm5jQuy/7foNrJxW6fk
	8OqCszKI9XJGvuE/eNFv83WA4mrBfNuXA2BRptlZh6CsRMLceouH7igFT9iqaDHafijUEyhI+uS
	scq/QzwBZjHBWHQInKe2cjADUVW3R8hwR
X-Google-Smtp-Source: AGHT+IG8xBtM0Z4KBFep/+nOmcWEAn3i0QoPMLl/MgTEbLBVhZRco5zcdSsSZud4qA1SYvgnzOzPv4dw4maWNSvdMHM=
X-Received: by 2002:a05:690c:ed5:b0:664:db79:b275 with SMTP id
 00721157ae682-6db44a5afcemr140439897b3.0.1725885522776; Mon, 09 Sep 2024
 05:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
Date: Mon, 9 Sep 2024 14:38:31 +0200
Message-ID: <CAGnwK7r8satzZv+84ZG4GzvjGKwdJkdS73OyS6Z9E6MgiQu8BQ@mail.gmail.com>
Subject: Modem PCI/MHI on Raspberry PI 5 / failed to prepare MHI controller
To: mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I see some issues on the Raspberry Pi 5 with PCI connected modem (have
USB connected as well). Since the modem interface of PCI is found, I
assume that the electrical interface is OK.

Using the latest RPI5 kernel, 6.11.0-rc6.

Modem is Quectel RM520N-GL that is set in PCI mode.

The PCI adapter is waveshare PCIe to 5G hat+, interesting here is that
if I use the Quectel own drivers, which seems to be some kind of
fork/modified version of the MHI which is embedded in a whole kernel
package from waveshare. (I have added printouts from dmesg from this
at the end).

Using the same modem in an x86-64 environment will work with MHI
without issues. Which leads me to believe that this can be something
between the MHI initialization and RPI5 hardware that might not be
supported as of today?

Any suggestions would be appreciated how to be able to go forward, and
I can provide more logs and data if required.

dmesg:

[    0.000000] Kernel command line: reboot=w coherent_pool=1M
8250.nr_uarts=1 pci=pcie_bus_safe  smsc95xx.macaddr=2C:CF:67:11:F3:25
vc_mem.mem_base=0x3fc00000 vc_mem.mem_size=0x40000000
console=ttyAMA10,115200 console=tty1 root=PARTUUID=5f165807-02
rootfstype=ext4 fsck.repair=yes rootwait dyndbg="module mhi_bus +p
module mhi_pci_generic +p"
[    5.537173] mhi-pci-generic 0000:01:00.0: MHI PCI device found: qcom-sdx65m
[    5.537185] mhi-pci-generic 0000:01:00.0: BAR 0 [mem
0x1b00000000-0x1b00000fff 64bit]: assigned
[    5.537216] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    5.537325] mhi-pci-generic 0000:01:00.0: using shared MSI
[    5.537581] mhi-pci-generic 0000:01:00.0: failed to prepare MHI controller
[    5.538999] mhi-pci-generic 0000:01:00.0: probe with driver
mhi-pci-generic failed with error -12

[root@RPI5-RM520-105-BLUE ~] 2024-09-09 14:17:15
# lsusb
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 002: ID 2c7c:0801 Quectel Wireless Solutions Co., Ltd. RM520N-GL
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
[root@RPI5-RM520-105-BLUE ~] 2024-09-09 14:19:59
# lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
    |__ Port 1: Dev 2, If 0, Class=Vendor Specific Class, Driver=option, 480M
    |__ Port 1: Dev 2, If 1, Class=Vendor Specific Class, Driver=option, 480M
    |__ Port 1: Dev 2, If 2, Class=Vendor Specific Class, Driver=option, 480M
    |__ Port 1: Dev 2, If 3, Class=Vendor Specific Class, Driver=option, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
[root@RPI5-RM520-105-BLUE ~] 2024-09-09 14:20:01
# lspci
0000:00:00.0 PCI bridge: Broadcom Inc. and subsidiaries BCM2712 PCIe
Bridge (rev 21)
0000:01:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
0001:00:00.0 PCI bridge: Broadcom Inc. and subsidiaries BCM2712 PCIe
Bridge (rev 21)
0001:01:00.0 Ethernet controller: Raspberry Pi Ltd RP1 PCIe 2.0 South Bridge
[root@RPI5-RM520-105-BLUE ~] 2024-09-09 14:20:04
# uname -a
Linux RPI5-RM520-105-BLUE 6.11.0-rc6-v8-16k+ #2 SMP PREEMPT Sat Sep  7
22:08:47 CEST 2024 aarch64 GNU/Linux
[root@RPI5-RM520-105-BLUE ~] 2024-09-09 14:20:06
#

I have enabled dynamic debugging (hopefully correctly), and get the
following events.

# grep -iE "PCI|MHI" /sys/kernel/debug/dynamic_debug/control
drivers/pci/probe.c:3015 [probe]pci_scan_child_bus_extend =_ "bus scan
returning with max=%02x\n"
drivers/pci/probe.c:3003 [probe]pci_scan_child_bus_extend =_ "%pR
extended by %#02x\n"
drivers/pci/probe.c:2925 [probe]pci_scan_child_bus_extend =_ "fixups for bus\n"
drivers/pci/probe.c:2910 [probe]pci_scan_child_bus_extend =_ "scanning bus\n"
drivers/pci/probe.c:1304 [probe]pci_scan_bridge_extend =_ "scanning
[bus %02x-%02x] behind bridge, pass %d\n"
drivers/pci/probe.c:938 [probe]pci_register_host_bridge =_ "bus already known\n"
drivers/pci/probe.c:2313 [probe]pci_release_dev =_ "device released\n"
drivers/pci/pci.c:4913 [pci]pci_bridge_wait_for_secondary_bus =_
"waiting %d ms for downstream link, after activation\n"
drivers/pci/pci.c:4891 [pci]pci_bridge_wait_for_secondary_bus =_
"waiting %d ms for downstream link\n"
drivers/pci/pci.c:4865 [pci]pci_bridge_wait_for_secondary_bus =_
"waiting %d ms for secondary bus\n"
drivers/pci/pci.c:1533 [pci]pci_set_low_power_state =_ "Invalid power
transition (from %s to %s)\n"
drivers/pci/pci.c:1800 [pci]pci_save_state =_ "save config %#04x: %#010x\n"
drivers/pci/pci.c:1344 [pci]pci_dev_wait =_ "ready %dms after %s\n"
drivers/pci/pci.c:1310 [pci]pci_dev_wait =_ "disconnected; not waiting\n"
drivers/pci/pci.c:4399 [pci]pci_set_mwi =_ "enabling Mem-Wr-Inval\n"
drivers/pci/pci.c:4370 [pci]pci_set_cacheline_size =_ "cache line size
of %d is not supported\n"
drivers/pci/pci.c:2540 [pci]pci_pme_active =_ "PME# %s\n"
drivers/pci/pci.c:1030 [pci]__pci_config_acs =_ "ACS flags = %#06x\n"
drivers/pci/pci.c:1029 [pci]__pci_config_acs =_ "ACS mask  = %#06x\n"
drivers/pci/pci.c:1830 [pci]pci_restore_config_dword =_ "restore
config %#04x: %#010x -> %#010x\n"
drivers/pci/pci.c:4269 [pci]__pci_set_master =_ "%s bus mastering\n"
drivers/pci/pci-driver.c:1312 [pci_driver]pci_pm_runtime_suspend =_
"can't suspend now (%ps returned %d)\n"
drivers/pci/irq.c:181 [irq]pci_assign_irq =_ "assign IRQ: got %d\n"
drivers/pci/irq.c:150 [irq]pci_assign_irq =_ "runtime IRQ mapping not
provided by arch\n"
drivers/pci/setup-bus.c:2054
[setup_bus]pci_bridge_distribute_available_resources =_ "distributing
available resources\n"
drivers/pci/setup-bus.c:1844 [setup_bus]adjust_bridge_window =_
"bridge window %pR shrunken by %pa\n"
drivers/pci/setup-bus.c:1840 [setup_bus]adjust_bridge_window =_
"bridge window %pR extended by %pa\n"
drivers/pci/setup-bus.c:1013 [setup_bus]pbus_upstream_space_available
=_ "Assigned bridge window %pR to %pR free space at %pR\n"
drivers/pci/pcie/rcec.c:49 [pcieportdrv]link_rcec_helper =_ "PME &
error events signaled via %s\n"
drivers/pci/pcie/aspm.c:1141 [aspm]pci_bridge_reconfigure_ltr =_
"re-enabling LTR\n"
drivers/pci/pcie/err.c:250 [err]pcie_do_recovery =_ "AER: broadcast
resume message\n"
drivers/pci/pcie/err.c:243 [err]pcie_do_recovery =_ "AER: broadcast
slot_reset message\n"
drivers/pci/pcie/err.c:232 [err]pcie_do_recovery =_ "AER: broadcast
mmio_enabled message\n"
drivers/pci/pcie/err.c:219 [err]pcie_do_recovery =_ "AER: broadcast
error_detected message\n"
drivers/pci/slot.c:292 [slot]pci_create_slot =_ "dev %02x, created
physical slot %s\n"
drivers/pci/slot.c:315 [slot]pci_destroy_slot =_ "dev %02x, dec
refcount to %d\n"
drivers/pci/slot.c:72 [slot]pci_slot_release =_ "dev %02x, released
physical slot %s\n"
drivers/pci/of.c:417 [of]devm_of_pci_get_host_bridge_resources =_
"Parsing dma-ranges property...\n"
drivers/pci/of.c:362 [of]devm_of_pci_get_host_bridge_resources =_
"Parsing ranges property...\n"
drivers/pci/quirks.c:5856 [quirks]quirk_switchtec_ntb_dma_alias =_
"Aliasing Partition %d Proxy ID %02x.%d\n"
drivers/pci/quirks.c:5833 [quirks]quirk_switchtec_ntb_dma_alias =_
"Processing partition %d\n"
drivers/pci/vgaarb.c:1500 [vgaarb]pci_notify =_ "vgaarb: %s\n"
drivers/pci/vgaarb.c:1380 [vgaarb]vga_arb_write =_ "client 0x%p called
'decodes'\n"
drivers/pci/vgaarb.c:1364 [vgaarb]vga_arb_write =_ "vgaarb: maximum
user cards (%d) number reached, ignoring this one!\n"
drivers/pci/vgaarb.c:1344 [vgaarb]vga_arb_write =_ "vgaarb: not a VGA device\n"
drivers/pci/vgaarb.c:1341 [vgaarb]vga_arb_write =_ "vgadev %p\n"
drivers/pci/vgaarb.c:1335 [vgaarb]vga_arb_write =_ "%s ==>
%04x:%02x:%02x.%x pdev %p\n"
drivers/pci/vgaarb.c:1328 [vgaarb]vga_arb_write =_ "invalid PCI
address %04x:%02x:%02x.%x\n"
drivers/pci/vgaarb.c:1316 [vgaarb]vga_arb_write =_ "client 0x%p called
'target'\n"
drivers/pci/vgaarb.c:1273 [vgaarb]vga_arb_write =_ "client 0x%p called
'trylock'\n"
drivers/pci/vgaarb.c:1217 [vgaarb]vga_arb_write =_ "client 0x%p called
'unlock'\n"
drivers/pci/vgaarb.c:1181 [vgaarb]vga_arb_write =_ "client 0x%p called 'lock'\n"
drivers/pci/vgaarb.c:1416 [vgaarb]vga_arb_open =_ "%s\n"
drivers/pci/vgaarb.c:1405 [vgaarb]vga_arb_fpoll =_ "%s\n"
drivers/pci/vgaarb.c:1452 [vgaarb]vga_arb_release =_ "vgaarb:
uc->io_cnt == %d, uc->mem_cnt == %d\n"
drivers/pci/vgaarb.c:1444 [vgaarb]vga_arb_release =_ "%s\n"
drivers/pci/vgaarb.c:231 [vgaarb]__vga_tryget =_ "vgaarb: %s: owns: %d\n"
drivers/pci/vgaarb.c:230 [vgaarb]__vga_tryget =_ "vgaarb: %s: %d\n"
drivers/pci/vgaarb.c:907 [vgaarb]vga_update_device_decodes =_ "vgaarb:
decoding count now is: %d\n"
drivers/pci/vgaarb.c:362 [vgaarb]__vga_put =_ "vgaarb: %s\n"
drivers/pci/controller/pcie-brcmstb.c:500
[pcie_brcmstb]brcm_pcie_munge_pll =_ "PCIE MDIO post_refclk 0x%02x =
0x%04x\n"
drivers/pci/controller/pcie-brcmstb.c:494
[pcie_brcmstb]brcm_pcie_munge_pll =_ "PCIE MDIO pre_refclk 0x%02x =
0x%04x\n"
drivers/pci/controller/pcie-brcmstb.c:674
[pcie_brcmstb]brcm_pcie_msi_isr =_ "unexpected MSI\n"
drivers/pci/controller/pcie-brcmstb.c:670
[pcie_brcmstb]brcm_pcie_msi_isr =_ "MSI -> %ld\n"
drivers/pci/controller/pcie-brcmstb.c:664
[pcie_brcmstb]brcm_pcie_msi_isr =_ "MSI -> %ld\n"
drivers/reset/reset-brcmstb-rescal.c:51
[reset_brcmstb_rescal]brcm_rescal_reset_set =_ "SATA/PCIe rescal
success\n"
drivers/tty/serial/8250/8250_exar.c:1561 [8250_exar]exar_pci_probe =_
"Setup PCI port: port %lx, irq %d, type %d\n"
drivers/tty/serial/8250/8250_pci.c:1100
[8250_pci]pci_oxsemi_tornado_init =_ "%d ports detected on %s PCI
Express device\n"
drivers/tty/serial/8250/8250_pci.c:4139 [8250_pci]pciserial_init_ports
=_ "Setup PCI port: port %lx, irq %d, type %d\n"
drivers/tty/serial/8250/8250_pci.c:4121 [8250_pci]pciserial_init_ports
=_ "Using legacy interrupts\n"
drivers/tty/serial/8250/8250_pci.c:4116 [8250_pci]pciserial_init_ports
=_ "Using MSI(-X) interrupts\n"
drivers/tty/serial/8250/8250_pci.c:302 [8250_pci]pci_inteli960ni_init
=_ "Local i960 firmware missing\n"
drivers/tty/serial/8250/8250_pci.c:1663 [8250_pci]pci_fintek_setup =_
"idx=%d iobase=0x%x"
drivers/tty/serial/8250/8250_pci.c:1821 [8250_pci]skip_tx_en_setup =_
"serial8250: skipping TxEn test for device [%04x:%04x] subsystem
[%04x:%04x]\n"
drivers/tty/serial/8250/8250_pericom.c:127
[8250_pericom]pericom8250_probe =_ "Setup PCI port: port %lx, irq %d,
type %d\n"
drivers/usb/core/hcd-pci.c:618 [usbcore]hcd_pci_runtime_resume =_
"hcd_pci_runtime_resume: %d\n"
drivers/usb/core/hcd-pci.c:485 [usbcore]resume_common =_ "can't
resume, not suspended!\n"
drivers/usb/core/hcd-pci.c:608 [usbcore]hcd_pci_runtime_suspend =_
"hcd_pci_runtime_suspend: %d\n"
drivers/usb/core/hcd-pci.c:108 [usbcore]ehci_post_add =_ "HS companion for %s\n"
drivers/usb/core/hcd-pci.c:126 [usbcore]non_ehci_add =_ "FS/LS
companion for %s\n"
drivers/usb/core/hcd-pci.c:246 [usbcore]usb_hcd_pci_probe =_ "no i/o
regions available\n"
drivers/usb/core/hcd-pci.c:225 [usbcore]usb_hcd_pci_probe =_ "error
mapping memory\n"
drivers/usb/core/hcd-pci.c:218 [usbcore]usb_hcd_pci_probe =_
"controller already in use\n"
drivers/usb/host/pci-quirks.c:884 [pci_quirks]ehci_bios_handoff =_
"EHCI: BIOS handoff\n"
drivers/usb/host/pci-quirks.c:1128
[pci_quirks]usb_enable_intel_xhci_ports =_ "USB 2.0 ports that are now
switched over to xHCI: 0x%x\n"
drivers/usb/host/pci-quirks.c:1116
[pci_quirks]usb_enable_intel_xhci_ports =_ "Configurable USB 2.0 ports
to hand over to xCHI: 0x%x\n"
drivers/usb/host/pci-quirks.c:1105
[pci_quirks]usb_enable_intel_xhci_ports =_ "USB 3.0 ports that are now
enabled under xHCI: 0x%x\n"
drivers/usb/host/pci-quirks.c:1093
[pci_quirks]usb_enable_intel_xhci_ports =_ "Configurable ports to
enable SuperSpeed: 0x%x\n"
drivers/usb/host/xhci-pci.c:880 [xhci_pci]xhci_pci_poweroff_late =_
"port %d-%d in U3 without wakeup, disable it\n"
drivers/usb/host/xhci-pci.c:233 [xhci_pci]xhci_pci_reinit =_ "Finished
xhci_pci_reinit\n"
drivers/usb/host/xhci-pci.c:231 [xhci_pci]xhci_pci_reinit =_ "MWI active\n"
drivers/usb/host/xhci-pci.c:574 [xhci_pci]xhci_pci_setup =_ "Got SBRN %u\n"
drivers/bus/mhi/host/boot.c:196 [mhi]mhi_fw_load_bhie =_ "Starting
image download via BHIe. Sequence ID: %u\n"
drivers/bus/mhi/host/boot.c:56 [mhi]mhi_rddm_prepare =_ "Address: %p
and len: 0x%zx sequence: %u\n"
drivers/bus/mhi/host/boot.c:38 [mhi]mhi_rddm_prepare =_ "BHIe
programming for RDDM\n"
drivers/bus/mhi/host/boot.c:255 [mhi]mhi_fw_load_bhi =_ "Starting
image download via BHI. Session ID: %u\n"
drivers/bus/mhi/host/boot.c:166 [mhi]mhi_download_rddm_image =_
"Waiting for RDDM image download via BHIe\n"
drivers/bus/mhi/host/boot.c:128 [mhi]__mhi_download_rddm_in_panic =_
"Waiting for RDDM image download via BHIe, current EE:%s\n"
drivers/bus/mhi/host/boot.c:119 [mhi]__mhi_download_rddm_in_panic =_
"Did not enter RDDM, do a host req reset\n"
drivers/bus/mhi/host/boot.c:108 [mhi]__mhi_download_rddm_in_panic =_
"Waiting for device to enter RDDM\n"
drivers/bus/mhi/host/boot.c:105 [mhi]__mhi_download_rddm_in_panic =_
"Trigger device into RDDM mode using SYS ERR\n"
drivers/bus/mhi/host/boot.c:75 [mhi]__mhi_download_rddm_in_panic =_
"Entered with pm_state:%s dev_state:%s ee:%s\n"
drivers/bus/mhi/host/pm.c:737 [mhi]mhi_pm_sys_error_transition =_
"Exiting with PM state: %s, MHI state: %s\n"
drivers/bus/mhi/host/pm.c:690 [mhi]mhi_pm_sys_error_transition =_
"Resetting EV CTXT and CMD CTXT\n"
drivers/bus/mhi/host/pm.c:681 [mhi]mhi_pm_sys_error_transition =_
"Reset all active channels and remove MHI devices\n"
drivers/bus/mhi/host/pm.c:678 [mhi]mhi_pm_sys_error_transition =_
"Waiting for all pending threads to complete\n"
drivers/bus/mhi/host/pm.c:667 [mhi]mhi_pm_sys_error_transition =_
"Waiting for all pending event ring processing to complete\n"
drivers/bus/mhi/host/pm.c:638 [mhi]mhi_pm_sys_error_transition =_
"Triggering MHI Reset in device\n"
drivers/bus/mhi/host/pm.c:607 [mhi]mhi_pm_sys_error_transition =_
"Transitioning from PM state: %s to: %s\n"
drivers/bus/mhi/host/pm.c:401 [mhi]mhi_pm_mission_mode_transition =_
"Processing Mission Mode transition\n"
drivers/bus/mhi/host/pm.c:771 [mhi]mhi_pm_sys_err_handler =_
"Controller supports RDDM, skip SYS_ERROR\n"
drivers/bus/mhi/host/pm.c:1140 [mhi]mhi_async_power_up =_ "Attempting
power on with EE: %s, state: %s\n"
drivers/bus/mhi/host/pm.c:356 [mhi]mhi_pm_m1_transition =_ "Exiting
M2, pending_pkts: %d dev_wake: %d\n"
drivers/bus/mhi/host/pm.c:204 [mhi]mhi_ready_state_transition =_
"Device in READY State\n"
drivers/bus/mhi/host/pm.c:940 [mhi]__mhi_pm_resume =_ "Entered with PM
state: %s, MHI state: %s\n"
drivers/bus/mhi/host/pm.c:906 [mhi]mhi_pm_suspend =_ "Waiting for M3
completion\n"
drivers/bus/mhi/host/pm.c:892 [mhi]mhi_pm_suspend =_ "Allowing M3 transition\n"
drivers/bus/mhi/host/pm.c:588 [mhi]mhi_pm_disable_transition =_
"Exiting with PM state: %s, MHI state: %s\n"
drivers/bus/mhi/host/pm.c:551 [mhi]mhi_pm_disable_transition =_
"Resetting EV CTXT and CMD CTXT\n"
drivers/bus/mhi/host/pm.c:541 [mhi]mhi_pm_disable_transition =_ "Reset
all active channels and remove MHI devices\n"
drivers/bus/mhi/host/pm.c:531 [mhi]mhi_pm_disable_transition =_
"Waiting for all pending threads to complete\n"
drivers/bus/mhi/host/pm.c:519 [mhi]mhi_pm_disable_transition =_
"Waiting for all pending event ring processing to complete\n"
drivers/bus/mhi/host/pm.c:493 [mhi]mhi_pm_disable_transition =_
"Triggering MHI Reset in device\n"
drivers/bus/mhi/host/pm.c:482 [mhi]mhi_pm_disable_transition =_
"Processing disable transition with PM state: %s\n"
drivers/bus/mhi/host/pm.c:1286 [mhi]mhi_force_rddm_mode =_ "Triggering
SYS_ERR to force RDDM state\n"
drivers/bus/mhi/host/main.c:1448 [mhi]mhi_unprepare_channel =_ "%d:
successfully reset\n"
drivers/bus/mhi/host/main.c:1427 [mhi]mhi_unprepare_channel =_
"Current EE: %s Required EE Mask: 0x%x\n"
drivers/bus/mhi/host/main.c:1577 [mhi]mhi_mark_stale_events =_
"Finished marking events as stale events\n"
drivers/bus/mhi/host/main.c:1550 [mhi]mhi_mark_stale_events =_
"Marking all events for chan: %d as stale\n"
drivers/bus/mhi/host/main.c:904 [mhi]mhi_process_ctrl_ev_ring =_
"Received EE event: %s\n"
drivers/bus/mhi/host/main.c:880 [mhi]mhi_process_ctrl_ev_ring =_
"System error detected\n"
drivers/bus/mhi/host/main.c:863 [mhi]mhi_process_ctrl_ev_ring =_
"State change event to state: %s\n"
drivers/bus/mhi/host/main.c:853 [mhi]mhi_process_ctrl_ev_ring =_
"Received BW_REQ event\n"
drivers/bus/mhi/host/main.c:1099 [mhi]mhi_ctrl_ev_task =_ "System
error detected\n"
drivers/bus/mhi/host/main.c:500 [mhi]mhi_intvec_threaded_handler =_
"System error detected\n"
drivers/bus/mhi/host/main.c:447 [mhi]mhi_irq_handler =_ "mhi_ctxt has
been freed\n"
drivers/bus/mhi/host/main.c:326 [mhi]mhi_destroy_device =_ "destroy
device for chan:%s\n"
drivers/bus/mhi/host/init.c:541 [mhi]mhi_init_mmio =_ "Initializing
MHI registers\n"
drivers/bus/mhi/host/pci_generic.c:990
[mhi_pci_generic]mhi_pci_recovery_work =p "Recovery completed\n"
[root@RPI5-RM520-105-BLUE ~] 2024-09-09 14:21:09
#

From the waveshare/quectel kernel with same modem+adapter;

# uname -a
Linux RPI5-RM520-107-PURPLE 6.6.23-v8-16k-waveshare+ #1 SMP PREEMPT
Thu Mar 28 04:13:47 GMT 2024 aarch64 GNU/Linux
#

[    5.524534] mhi_init Quectel_Linux_PCIE_MHI_Driver_V1.3.6
[    5.524681] mhi_pci_probe pci_dev->name = 0000:01:00.0, domain=0,
bus=1, slot=0, vendor=17CB, device=0308
[    5.524937] [I][mhi0][mhi_arch_set_bus_request] Setting bus request
to index 1
[    5.524949] mhi_q 0000:01:00.0: BAR 0: assigned [mem
0x1b00000000-0x1b00000fff 64bit]
[    5.524975] mhi_q 0000:01:00.0: enabling device (0000 -> 0002)
[    5.525073] [I][mhi0][mhi_init_pci_dev] msi_required = 4,
msi_allocated = 1, msi_irq = 168
[    5.525087] [I][mhi0][mhi_power_up] dev_state:RESET
[    5.525089] [I][mhi0][mhi_async_power_up] Requested to power on
[    5.526043] [I][mhi0][mhi_alloc_coherent] size = 98304, dma_handle
= 1002620000
[    5.526051] [I][mhi0][mhi_init_dev_ctxt] mhi_ctxt->ctrl_seg =
00000000b08345f0
[    5.526645] [I][mhi0][mhi_async_power_up] dev_state:RESET ee:AMSS
[    5.526661] [I][mhi0][mhi_pm_st_worker] Transition to state:READY
[    5.526671] [I][mhi0][mhi_pm_st_worker] INVALID_EE -> AMSS
[    5.526674] [I][mhi0][mhi_ready_state_transition] Waiting to enter
READY state
[    5.526701] [I][mhi0][mhi_async_power_up] Power on setup success

Regards,
Sebastian
