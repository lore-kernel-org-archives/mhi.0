Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795235490;
	b=PPepJadQE70MgUQFxXaTawrgEYsO1ytvHJPty5R2wY6tBAZ2/r8hZoPhe4nxLoS6GD4c
	 HyffOwShMsfq/TWWmPpT4RGKRD8rTH4L/MXvlit9lcfsq6A3xOBsRUuGCKDKWutU1RVvc
	 zmWW14g7UuLIYtukRL9wvhX/BZtcLRQ+Dm1zT4jmZPuTsrIZrGopx25VEX+3UlxjLmQm1
	 507ACnbuULQ2ZKV+YpSqGowFJV3nGlll0cuygT4sl5nFDS05u44ZymRW92F01EJ0HZls8
	 pZX/DMFPA/gCfk0IO58cZXWwr1jj5m4fBDaG10LqTp+Wtqi576j8iPt4C9riiEl2nRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795235490;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NDGk6ILDCyHDNgYri/1MQaMsRnCxk5+Qhk6z2EMdnrk=;
	b=HTj584PABnpQ/IyadBjn1gMVz+3LOeyiA36KwmyQbQmvus/6YUlEFmBt/frs53uyrsgI
	 S/LZLbNnL2zEOdlB9eU2d7IHznqL3pATmyK5ZQFvXhQRw51Va+0YzlmWzJwVJOZV/U6sv
	 pQ90ep6scZWN2smV8t19+N2cjJknACCWTtJfQOO1o0uqv1Qiv2lFwe5VQCVzkZcyMct/C
	 267h+P0IiAG9eH5VaEgqWzu+TbS/8tMNRoqog9xgsy6ALA6kpUpnTxEJlKhm9iEZ5x9dc
	 6BrhccSHX3mY0P9e4Cd77US2Dts7qUlyDad1D0mDLlbAAQBj4jbwh8WtB2Ytmz6Wjrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUQRVaUf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500C606A6A5;
	Sat, 21 Nov 2026 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUQRVaUf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795235489;
	b=RDAFpeKy9JmLZ6YJf1NrBvgllJ7vq07sCvN1/5U2DuujImY3I7rQI5ml2n9EEbNG8jM/
	 yroUzV/reoAtRxc4DHV3BLsOKDR0+YQsjsxtXld8ikv6Wa04r2ksztupVUtIMIpujViuT
	 PbZKZb6+a0d7P6TAqX/xsagYjX2clnJ91OMx9+YKwrjTlPsTKA2SL96EhKuWv+CO/tMRy
	 bAAEBga7OdUq2d8foGKElijK6lGAFGN7IIpsVemHiXbxLf0t97ezwW0EPNeGbwDVLX3II
	 rlT03AI9frl62BMR2lhWdFwd2LsHuVQPR1My02tatpKt7H2NZmoGZzI5KUR2CniK4cg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795235489;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NDGk6ILDCyHDNgYri/1MQaMsRnCxk5+Qhk6z2EMdnrk=;
	b=mQvUqEbAwbXhFctyUuZNHNN5dbcHsYCeDmfeslZhlK8vbMD09SfAsXDzW4xgm7aKagY/
	 jSbpBmYe63A6avQu/tMu/O2SZiYMg628LoWjAun7U9x8yJPp8e9H9xrRTu+b9skZTC+4U
	 ZZlJuN/bVZJW1YXijw6gif1uYzS1Sx2SL9KT3NAOvF1aShVCI6LYeWhW+OvMUTx2jFFlx
	 Qu5zCJn7/D/c2QDD0a8iXbB9ZOIx4RSeaICUcEP6P8jdyJn2laBOIIH2qg5woFFds76yP
	 af+JYB2H1SxdfHtxdTl+RvB9GcCLHdjFdtNPn4s9pWE1QKrnCWdJsgimwVwc9j8dR/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 372DA1F000C4;
	Sat, 21 Nov 2026 04:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795235489;
	bh=NDGk6ILDCyHDNgYri/1MQaMsRnCxk5+Qhk6z2EMdnrk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=iUQRVaUffpnXfPJfxM7atvKBYCBHwONMSQQp1PGx5oTh8jDsZu1ggzp7YNNgMTySX
	 /4ABKmDJoRKwoosvIRknfFOJdCdLcJesDJetcNSATG3zSE3VSKTeaUSmemzAlPFyxH
	 F/WdPuK7MJBauyC+XWWpDTvsfA80rHCWw2rKlflYKzUo5FKh3ytzzij7LvxyW7HAu/
	 F2Mw8tbPEmum9Mz+IpcWmohYrHUnxDvZbMmgQ+a0N7yWWpOhFVz/uFMdD3zVGpyWnM
	 HCg5IUD3m1yEt1dgufg7DaMGZE3RFXJvStIbZco0uywr3KFBnZCh2UZIr4tRnd3FS2
	 35Xpvx+z9E+mA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 826324BAF1;
	Sat, 21 Nov 2026 04:31:28 +0000 (UTC)
From: Haipeng Lin via B4 Relay <devnull+jimmie.lin.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 23:30:54 -0500
Subject: [PATCH v3] bus: mhi: host: pci_generic: Add MBIM-mode config for
 generic SDX65
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
Message-Id: <20261120-mhi-sdx65-mbim-rfc-v3-1-20741d24da0c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTQ6CMBCG4auQrh3TKQLFlfcwLvoHTGLBtKbBE
 O5uYWNMjMv3S+aZhUUXyEV2LhYWXKJI05ijPBTMDGrsHZDNzQQXNXJE8ANBtHNdgdfkIXQGpDJ
 SK26bRiqWDx/BdTTv6PWWe6D4nMJr/5FwW/9yCQFBctnqky1LW+lL7xXdj2bybOOS+BCI/CchM
 tGhbVBVyrTqi1jX9Q0TJKFs9wAAAA==
X-Change-ID: 20261011-mhi-sdx65-mbim-rfc-8ac8ba0d778a
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, daleyo@gmail.com, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 Haipeng Lin <jimmie.lin@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795235487; l=5133;
 i=jimmie.lin@gmail.com; s=20261011; h=from:subject:message-id;
 bh=6qEhayVyUMduqrYRZdyaVcdgAqFbrpWlcIPHaQarGjA=;
 b=CrJJ5ZywjFK3X/Wtr7iQ3v4P+75Fo2r7ASY4c49UU3U36L88N90G74rOl8KikUc8ZxEmZ7TjL
 acpD9B1hL21CKDtv4MO9XE+StDrk6nBzy23E+xdC4g1w4CEHXJEs/+T
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

There is no known way to query the modem for MIBM mode before the
channels are set up. As a limitation, a separate SDX65 using generic
IDs on a matching machine (e.g., via USB4 PCIe tunneling) would also
get the MBIM config.

Like the SC8280XP CRD entry, reuse the Foxconn SDX55 channel config
which works with this firmware. The MRU is 32 KiB to match the
modem's downlink aggregation size.

Tested on a Surface Pro 11 5G (Surface_Pro_with_5G_11th_Edition_2077,
modem firmware 251216-DE-dc49bb9-00197) on a v7.2.11-based kernel:
ModemManager registers the modem on wwan0mbim0, uses wwan0 for data and
wwan0at0 for AT commands, and connects over LTE and 5G NR.

Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
---
Hi Mani and Jeff,

Dropping the RFC prefix and resending for your consideration.

A known limitation to this patch as raised by Jeff in RFC v2 was that a
SDX65 dongle would also match to MBIM-mode by this. A bigger patch
could be adding a property on the PCIe endpoint's DT node. Please let
me know if machine-compatible matching is acceptable, happy to try
other approaches.

LLM was used to draft the MBIM configuration patch and assisted with
testing on device.

Thanks,
---
Changes in v3:
- Drop RFC prefix
- No code changes
- Commit message updated to note limitation for SDX65 dongles on
  matching machines as raised by Jeff Hugo.
- OEM PK hash method ruled out in discussion: https://lore.kernel.org/all/088d0be9-5d45-4454-b160-efff83e7a647@oss.qualcomm.com
- Dropped Assisted-by trailer and clarified in cover letter per 7.4 guidance.
- Link to v2: https://lore.kernel.org/r/20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com

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


