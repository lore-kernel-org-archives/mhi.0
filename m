Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0660EED8;
	Sun, 11 Oct 2026 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791704450; cv=none; b=jEcWn9tWKfIYdRYhkrdNuFdw2e6uNYGSyej1LhtfBuXAupSGpdMVT+yIuZ/z9tHoNOBQnJRTBVeh+BvaB5VO+qBNIxfqUd+GIyN9SgK3mV+O4IKOXZCnRo+XVgo08gkCgI6yoUn8lEgO3Jm5ecFwGWpnCkSr1vk8UXtAlUPVNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791704450; c=relaxed/simple;
	bh=Wvn5vGVOCuiyrtd6IcAS8MWS4vrd/x6er4NJZsA+3ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cNwuRxYIJ6BXKcSbf1TqfB2qxbNU0OhOckil4EbUsvIxuf023D/s2tYrmo/Q9UDGjjuPcjEgc7gNghr6E+SMsMUiSWdXsxQj7/ZmHHcAntETw5bEaYVnzMCniYqYlLTt5rYZ6Cn/PyU9xkSwrS6sbYNrOSLf42b1FXFN50doPIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCFWFnMI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCFWFnMI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9009AC2BCF7;
	Sun, 11 Oct 2026 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791704449;
	bh=Wvn5vGVOCuiyrtd6IcAS8MWS4vrd/x6er4NJZsA+3ZI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sCFWFnMI1yI/qZffUqpM2zGf0UGgqVcoDH0Ezjl35i38qogWVLhQ4iJ2idDgqgNTO
	 S8L7JJZmyerqx6z7ahTlU9Neov57OYDOp3/gY4bzd7bavzcP/rpQDY4OZIGIBVLos3
	 C6o/HIWjAZEZi9ndddSwGzCPt7jzXfC2HESnq4wqTVY9RzJhuChzAOV9HaPy8/IZ0L
	 MYxrBo4hmFivETnnZFwcyKMDv1uxrdVxZUq7qKe7x1briF9BVreM5xhKhuM9lIVE87
	 h92SLg46dOADwhSNHcVsTlVYIs1md1bnyV4rybjrjjmyt4EayulLYdJiSY75zYqpCM
	 MBwshNQwghnMg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0DACA9EC9;
	Sun, 11 Oct 2026 07:40:49 +0000 (UTC)
From: Steve Meek via B4 Relay <devnull+stevemeek82.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 08:40:49 +0100
Subject: [PATCH] bus: mhi: host: pci_generic: Add Quectel RM500Q-AE support
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-mhi-next-v1-1-13a738637ff0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIA9y2oC/yXMwQ5AMBCE4VeRPWtie6jwKuJADVaipEUk4t0Vx
 y/5Zy4K8IJAZXKRxyFBFhfBaUJ2bNwAJV006UwbzpjVPIpyODeVa901BSzD5BTz1aOX87uq6t9
 hbyfY7d3TfT9VxpFjbAAAAA==
X-Change-ID: 20261011-mhi-next-722da9ec1e67
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steve Meek <stevemeek82@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791704448; l=2893;
 i=stevemeek82@gmail.com; s=20261011; h=from:subject:message-id;
 bh=io/QJn53PxHW7eYjIVZAS/KTOiHuSPAsN2kr3z/nk8E=;
 b=FgvEHf+3iSqeuEC1hYAoPVKtziVZDwsVEf94/WSasxZ8u1Jlla0tN7T0cEsLByhFjHzzNIYgQ
 ay0nxsHUf4BBWCqD+c7LWGShO0CzcD9Focr4ShZnCbF4Ue7d8CKHvoS
X-Developer-Key: i=stevemeek82@gmail.com; a=ed25519;
 pk=dtyc4btZAMr4Kqf5DaioLF7wBCQbkFYyDo3X5EcpZw8=
X-Endpoint-Received: by B4 Relay for stevemeek82@gmail.com/20261011 with
 auth_id=1154
X-Original-From: Steve Meek <stevemeek82@gmail.com>
Reply-To: stevemeek82@gmail.com

From: Steve Meek <stevemeek82@gmail.com>

The Quectel RM500Q-AE (SDX55) enumerates with the Qualcomm SDX55 ID
17cb:0306 and subsystem ID 17cb:5002, so it binds to the generic
qcom-sdx55m entry. That configuration expects QMI on channels 14/15,
which this module's firmware does not answer: the modem probes, but
every QMI request over the control channel times out and no data
session can be set up. Users of this module have had to fall back to
Quectel's out-of-tree driver.

Like the other Quectel modules, the RM500Q-AE provides MBIM control on
channels 12/13 and data on IP_HW0_MBIM. Add an entry for its subsystem
ID, which no other entry in the table uses, that reuses the Quectel
em1xx channel configuration. The EDL image name is the one the generic
SDX55 entry already uses.

Tested on a Xunison Exigo D50 5G (IPQ5018) with modem firmware
RM500QAEAAR13A03M4G: the modem probes as quectel-rm500q and exposes
wwan0mbim0, wwan0at0 and an MBIM network device. A data session set up
with mbimcli and with OpenWrt's umbim reached 160-180 Mbps, the
limit of the cell.

Assisted-by: LLM
Signed-off-by: Steve Meek <stevemeek82@gmail.com>
---
Runtime-tested on OpenWrt with this entry backported to Linux 6.18.55;
compile-tested (arm64, W=1) on mhi-next at 710bf7329.
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 5471a6a0f..7193a384c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -490,6 +490,16 @@ static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
 	.sideband_wake = true,
 };
 
+static const struct mhi_pci_dev_info mhi_quectel_rm500q_info = {
+	.name = "quectel-rm500q",
+	.edl = "qcom/sdx55m/edl.mbn",
+	.config = &modem_quectel_em1xx_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = true,
+};
+
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
@@ -980,6 +990,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN980 hardware revision v1 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
+	/* Quectel RM500Q-AE (sdx55), uses the same vid:pid as qcom-sdx55m */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x5002),
+		.driver_data = (kernel_ulong_t) &mhi_quectel_rm500q_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	/* Telit FN990 */

---
base-commit: 710bf7329abf86e37db529f19c8f394099238892
change-id: 20261011-mhi-next-722da9ec1e67

Best regards,
--  
Steve Meek <stevemeek82@gmail.com>


