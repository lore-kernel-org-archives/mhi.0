Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794359218;
	b=0f8IXa+FZ8LTO1X6Urykus/LH9a+LsX48dTH9UWzuvAbVoxNkzS2OncdLAiQ3mXQFE1k
	 4CF8thH/vvVDWJVINvogguGCHeiGmJojaLK4Xkx4V2oraP8Qj+DuKegfgwENj+v5x50Gk
	 lA6nvPIsq3EBYFBzIefNQMZ/DzBLytwbeBzGb4KLRxV8zbsai8zSrZjIFR2R8hUz0l2be
	 9e7SUWbUVBgB0AFqjVne0fAxghh+9zCfLCp/CYWoGUwHPKlx16dbR15eCwgb22rviFXsw
	 CVr8ZCif/IC6VRBoVWL0dKuEXvo0Sjz8K9iJes85hg70sLM00On+d9YDpuDNiD/LPSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359218;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jtmK1+bR8Vpcga/gdTbnHubufTCEtNPEJ3YD6hd7teM=;
	b=HImIm0tUzF1EIgdCWlDzL9J5o2XW1+4d5SB7eQdfGOWFOIGNrz77HeC3S418m5PYWaQu
	 DZ2pAdU5KN2cTg65QKNP/Hvimt7AIaAGzL8MFYRi8H0aBjguLk5FZfNiaZsEiMiUVexyF
	 1cpWcWyZtuBRJr9PoaAAOse4Zq22ElB3S59wvIKfJ4JOJ059VBq45V+gk28Xl5SrOvzEf
	 djhY61k4eewfJVo8ajHz0afptLVX1XaXRT6YSOeFJz4HRkjmCE7NlFyDa+M+PaJj8b2di
	 Hb1hsHB23uAMQliFR+HNefEeIZ4VJwCCcPcpByJKu1oLHIrNBVbD9J2p3GGm7fOXmgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcugkCBo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49310606A31C;
	Wed, 11 Nov 2026 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcugkCBo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794359218;
	b=tgtYKebY6S4+u06/g3RpoLckz1BT1Wlgn0P8EPt9Mon/6NEBTk7Z2fmXgRPnRrJT1Qg9
	 f17kwFnQ2QWIRdIPjnjhKTs7l2tAx8X8iaht+4GYXLoyO7qkzVXSa9jD73XBLJhCOeIRy
	 4LeF7nSf3djC/VaGcuuFc6nbZkGd4SfuWycUuIokeT3T9UMJUhZfSgHJq940EWCAT7zge
	 TuJqj1mHKlHKzpBIlbaIg15xwwyApxnHdAeBRTUrqXzPwvjETlrxURB8phAPL17hUxfPr
	 GcEH0QowWRdjfthwbFl5Oh+LRoH7npVrR4vGbMZ+T2/P9V0do0xT4BpsTXjvNZCRUlA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794359218;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jtmK1+bR8Vpcga/gdTbnHubufTCEtNPEJ3YD6hd7teM=;
	b=Rr21Of+zcpczI2KQadRHHuqJ2kE3YRq1m7J2yV+bys6wUsc7JJS2gPLw0u49uPGN1r4i
	 kvpzxNqIVSxswb8mqoGQLqVT0z0Q8n1noM4MLpvWKs3pKzuJEHwTuhyUD4j8n/LcIOTgi
	 mX3PM+pRaNFmxkNzDKp7mpR+IyYGWr8ezrXZT307sQh2Zc9al20APFhAGE7TP18CHHvSJ
	 okFDdD+J4yPabqGXZi7d0bM//fqfwlHecIDHZLGlf9PWWD1AEEWtui3gSx++4BSVWM56W
	 H9VRt4zceIy3DVPZCDC/vwUw4MabPniPBT68fq3DHbGJcJ3b2vTrd+iv2B22jR4s8EA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 363D01F0089F;
	Wed, 11 Nov 2026 01:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794359217;
	bh=jtmK1+bR8Vpcga/gdTbnHubufTCEtNPEJ3YD6hd7teM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XcugkCBox/wXm7usJasRdokWSHYEY4g9uT610gzsl+E94KhgaaxDeOATg5ovM7sW2
	 cjBEhWwGYydRDzWDqgtjoufriaoASfABmLxw80pkw33r/YnId/ymXW0wHm3XtMr9nb
	 NaIFmFwlBZK14EhfKroFACmAWZRRxVmDOcMHYCSOur4Bh4OYkszhyW5/32qTZGkNfU
	 OrFkL12sP0kUaX/lyYtEjmyCYK1UfPvcwqmcR4FR+YZQ2K9P34sNwXQvxJq7vE0SeN
	 ekRIkPcjbvptLdl4oGDehcN4yQpWU2iJoRvZi/F5L1HJ5gRQR3RXhia7Nc27MEsFf8
	 ZaBj1GqAzyc7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9579148742;
	Wed, 11 Nov 2026 01:06:56 +0000 (UTC)
From: Haipeng Lin via B4 Relay <devnull+jimmie.lin.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 20:06:30 -0500
Subject: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQrCMBSEr1Le2idJa9voShA8gFvpIn9tH5hGE
 gmV0rsbcgCX3wzzzQbRBrIRLtUGwSaK5JcM9aECPctlskgmM9Ss7jjjHN1MGM3ategUOQyjRiG
 1UJKZvhcS8vAd7EhrkT7hcb/BkMOZ4seHbzlKvFT/nIkjR8HEWZ1M05hWXScn6XXU3sGw7/sPr
 DEQQLkAAAA=
X-Change-ID: 20261011-mhi-sdx65-mbim-rfc-8ac8ba0d778a
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, daleyo@gmail.com, 
 Johan Hovold <johan@kernel.org>, Haipeng Lin <jimmie.lin@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794359216; l=4467;
 i=jimmie.lin@gmail.com; s=20261011; h=from:subject:message-id;
 bh=ZLVxxQwkggsrloBrxJyjFyMexniwKJn2AL6lIKjlQ4w=;
 b=QboCyMkwfvriVeAw1+gALoE8intbzqfiWahZTM9uJq33pOwZ/IHc2Yt5cJW6tboFn5cL8/ey3
 J/ycjjJzXIhAcJLA4TBrt4m78+WfpJzLBmsDfnmRpbyr/pvzebI9x+A
X-Developer-Key: i=jimmie.lin@gmail.com; a=ed25519;
 pk=3KDRF1RQ/9A7ZUVTdRVEZnVrGltdmq1bRocsOYeXezI=
X-Endpoint-Received: by B4 Relay for jimmie.lin@gmail.com/20261011 with
 auth_id=1164
X-Original-From: Haipeng Lin <jimmie.lin@gmail.com>
Reply-To: jimmie.lin@gmail.com
Content-Transfer-Encoding: 7bit

From: Haipeng Lin <jimmie.lin@gmail.com>

The Surface Pro 11 5G carries an SDX65 that enumerates with Qualcomm's
generic IDs (17cb:0308, subsystem 17cb:0308) but runs the MBIM-mode
firmware it ships with for Windows.

Control is MBIM only (the QMI channel never answers), and data on
channels 100/101 is framed as MBIM NTBs: the modem reports a WDA data
format of raw IP with MBIM aggregation, up to 32 KiB downlink.

The generic qcom-sdx65m entry names channels 100/101 "IP_HW0", which
binds mhi_net. mhi_net expects raw IP, so no data session can work.
The MBIM-mode modules in this driver name them "IP_HW0_MBIM" instead
which binds mhi_wwan_mbim.

Boards with a Qualcomm-ID modem in MBIM mode have so far been told
apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
This modem carries the generic subsystem ID, so select an MBIM
configuration by machine compatible instead.

Like the SC8280XP CRD entry, reuse the Foxconn SDX55 channel config
which works with this firmware. The MRU is 32 KiB to match the
modem's downlink aggregation size.

Tested on a Surface Pro 11 5G (Surface_Pro_with_5G_11th_Edition_2077,
modem firmware 251216-DE-dc49bb9-00197) on a v7.2.11-based kernel:
ModemManager registers the modem on wwan0mbim0, uses wwan0 for data and
wwan0at0 for AT commands, and connects over LTE and 5G NR.

Assisted-by: LLM
Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
---
Hi Mani and Jeff,

A follow-up to the RFC I sent last month (linked below). 

I tested the Foxconn SDX55 channel configuration on this modem and it
works, so v2 reuses it like the SC8280XP CRD entry does, and only the
selection is new. Hope this makes the patch clearer.

I would appreciate comments on whether matching the machine compatible
in probe is the acceptable approach, or if you would prefer a property
on the PCIe endpoint's DT node (although that would be a bigger patch)

Thanks.
---
Changes in v2:
- Reuse modem_foxconn_sdx55_config instead of adding a channel table.
  This adds the DUN channel (tested: answers AT commands) and drops
  IPCR which is unused by the Surface Pro 11.
- Link to v1: https://lore.kernel.org/r/20261011-mhi-sdx65-mbim-rfc-v1-1-8089b4d33d5b@gmail.com
---
 drivers/bus/mhi/host/pci_generic.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a384cca4..29b275572603 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/mhi.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/timer.h>
@@ -582,6 +583,34 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.sideband_wake = false,
 };
 
+/*
+ * Some machines have an SDX65 with the generic Qualcomm IDs
+ * (17cb:0308, subsystem 17cb:0308) running MBIM-mode firmware
+ * they ship with for Windows.
+ * The exact channel configuration is not known but the Foxconn SDX55
+ * configuration works with this firmware.
+ */
+static const struct mhi_pci_dev_info mhi_qcom_sdx65_mbim_info = {
+	.name = "qcom-sdx65m-mbim",
+	.fw = "qcom/sdx65m/xbl.elf",
+	.edl = "qcom/sdx65m/edl.mbn",
+	.edl_trigger = true,
+	.config = &modem_foxconn_sdx55_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
+/*
+ * The PCI IDs cannot tell these modems apart from QMI-mode modules,
+ * so match the machine instead.
+ */
+static const char *const mhi_qcom_sdx65_mbim_machines[] = {
+	"microsoft,denali",
+	NULL
+};
+
 static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
 	.name = "foxconn-t99w175",
 	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
@@ -1389,6 +1418,10 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	unsigned int dma_data_width;
 	int err;
 
+	if (info == &mhi_qcom_sdx65_info &&
+	    of_machine_compatible_match(mhi_qcom_sdx65_mbim_machines))
+		info = &mhi_qcom_sdx65_mbim_info;
+
 	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
 
 	/* mhi_pdev.mhi_cntrl must be zero-initialized */

---
base-commit: 0b1883ca75c0005ab5ca52c7bc1a26329bc39746
change-id: 20261011-mhi-sdx65-mbim-rfc-8ac8ba0d778a

Best regards,
-- 
Haipeng Lin <jimmie.lin@gmail.com>


