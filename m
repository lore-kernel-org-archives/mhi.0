Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795164496;
	b=Wy8tzuYQNQnlj8FTaryOz1Mwkk8Ms4U4AtBXP6+J8I9WIkrySYPdyIXIT4u1c6NLH7yV
	 lqVDRjOL+Wh1cZJSc8Dhs3NyIbeD5JIwk2sToc03SP5yjNKu3kJYMMTLF6FOI1VPmXa2r
	 0WC+g21ORu5HMAw4SsdaFekk205obVMfqdpndGvZ6QTycbwnlgkpHmcPACsPF4l6vQ7MW
	 Xl0LDWWq3l5gjVIhomJGmbTnPP7WV0ezD5GZQkdeziZF2JJKOfQrNwX8lcDbTh1hvkfXk
	 s1vrqyU8F3s5u2130RH+YTD6c/QfliQaFqDCo42zYu4GEvIrHj32tE7FmZqVRpbr7XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
	b=jam0LzsxXp2yIvrHQRvxYhiHNixVOsovv6r1VXTDtdk3JnfWo3ri0pdnm6kX9wf1lfap
	 a+JHx4uPfH5VT0BrrLqaiJBll5qJ470UbKxHWtcE6GeKjlParnonlyYu4XuHe4wHFz3gQ
	 eyNls9PadWSi2hlKguIOWu6d2pQa79ZEyekWD0yfOlShCZNNLqgnuY70BxIecxeSZAtiK
	 f4oU8BwTTcMhUiULzVWZx62CGFgJTgPh0eViPxUQ+2hBHGitFvbeCzbQ7GnAEhg0skEeq
	 jn0fJsDWVM2xPihTb+SA0irN2eBd8VFKOa7PL8kMFwjENEKj4YR66XbR3grXtCYBQPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkcB1jRC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C479606A32C
	for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 08:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C479606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkcB1jRC
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be1e468a8so673793d50.0
        for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 00:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795164495; cv=none;
        d=google.com; s=arc-20260327;
        b=fgwjuSlx+cfSWmFF99RtqDP0T8Hj4lqbMgnR4kcnYBKoBW2KS9DE443sHDfYaxoVPn
         dSGrK10aoSE9paUT1d+++a4A8DpJpikoCcp04aw7HODB+CHfhF0kDJrtMPi4jPkV4Xvz
         BxnTXBIt2V1rYGPpnt1vKPD4iticSuhgI2Pfp138Nm3VbPogknCzEyKv3dzmhDaTttQ6
         bu7q663hnxTm3kFWj0NogxaWS/O1UwDozijDhDBoUlze6seFX4pMrcUWzC+nlchqC/BT
         YFFhJKQ5y90Q01VmDPw6fXoihUpKah+egfii/QmlXX7y+1uaqr+bWz6wM3n7KySEnOPS
         BBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        fh=1EBjV09iOKIkzsn4DgBYk2zSAXCTeWO6/in8r2fqE4c=;
        b=fH/jSlmxFtJiFIdXRqodKownotjwYxIKZF53cevz+1w5J5v2ma/+LwmbOe5GyA2UmB
         kxNCsNnNLLbGfdLdY0+haOl53m2J1Um1sHUtvSKS4QSu8mH0EMckEr5zWdtb7XIa+AbR
         OgYCSxCGv5jAjSNGZrhq6JyEGsRanF5GcKZ6xBVlFAa2LcP/biF0w+/BKSWSCckY3z+O
         71WuUkqZ7pvJ4F/ze5pzMGGlohPbSESckeJxhZZC4vUwpHOzRB52bw0LLnxxAN2IhWuC
         SCOY0DJl8HEYvk0HMfjpsVBAHLquKZpi37ggp9YgyZv1hxmgu/RUPqR0d+5JOX11XNi1
         ujng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164495; x=1795769295; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        b=zkcB1jRC6noj7xrjZmWpcOc0S3HT1H9LXUvjoJchzOA8NHrCUQ28UaHIBMSuCXICb2
         0dxHP7VruVYRBrrtA66S8ev53WFlIPnepmM3WtK+8FTfkAgmpKp/UYs573CbzPtodOtR
         uMJbqTb2TvcMFv2uexI2MybIP48F1LZ+2/1hjkUOX2YHj7pCooRR+M+ePfVsdJ8QkD1m
         f2T72IZH/w71CS/AcyjdZpoohTOZdKvI4ql4n9JdlDivj+XhRR18IcIcAVhIqXfj0S/8
         qACCi8RAQDpwiac2zmv6+K8Hp5/2cX6hWXHsjkSipEhsZ/PEcubJi5O3Uzcj99Qy7xFM
         WESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164495; x=1795769295;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nzwN7I5atRRGIeyKWGRRj5kf7A+6/JDlOIWENYlt34E=;
        b=rdbGyNnc2h+4VICqA9RRnenFuzHAAE67EWx8MNRttsHhDE68ZuL6HI5xFLTVEPeehj
         dCg8TCEH+Y5mPDpSQDvjFBNUhpyuDUQqahxHRUzwV7ykfdSrXwgGXZrFl2TsouCSDgCr
         X9VeqEUdeC1b8fLRbJ7HT9P8NIXcoONY0lHqfTqvCtcSJkMC9/xseqxwi5HPT44F4o4V
         NOGjvRkteNitzPu6zwB150NIjwY/uaaNFZ1IxM9ADzU6OkgqINtfrJq9hITMFrtjnvVi
         5ayoSWrK/rMYoNatAlPz88AtxGnZ8aJWBW0w/7/NgTPk6dGhPFd++VfosORy6XT3dZi/
         Ws3A==
X-Forwarded-Encrypted: i=1; AL+hErGekvv7i8XR6VmadUirIpyMWywJf+NQuPPi8BfN0Wv5d6CUSy8LtV3UnBVH/J1LlW+SN6E=@lists.linux.dev
X-Gm-Message-State: APuU4Z+meIVImzAdSqT+f/BW+J1CUYD+JgEeK/tqpjk/+wMhIAtv20du
	v3Yx7FnZ1hZaSXBHgs4cgDTHb4K7iX9e9svFKQGs6gsMeaaRcHqC+k38ZeTqrjVNZvMZz1sQFMG
	WngsaDC3vZaMJETIrJ+88Lmp8ytigNUw=
X-Gm-Gg: AZFdTZd344aanzLtFr/rUY/IR2+CydFZsmzUOXykUSIWhv3K+OcGi5gFCm80d5fZfGf
	JfvYsRciKJUT44PG+XzOjOQbmmy7+VEMN+90tkFayo6qGm9RRWPSXM5TW62W23GiTZVeG2XNOsL
	joWw+sKcECGb1owHf2mC+swpa444OS2Ez8d818jrM7MN5In7fqkPsFVk8YUjbaqP1IHamMHPfaw
	ltPH1HIMfWvMTAuwAjf24Grk2iWga+U5Dm2N2B10QvcU927GEmBP8ny+dX+iCaz9YTvecTqhSpO
	TBXlHiFVNaQxL2JUf9dGcFeS2MtTek/6OBfihMjWhkPYpOHazG1svAJKB4vwHM9Qe17l0hR4fKv
	lsR+/ETV0fzluwvcDPTRA94YGP4QXUOl5S3i0
X-Received: by 2002:a05:690e:134a:b0:67d:c588:e563 with SMTP id
 956f58d0204a3-67df43ce393mr1241950d50.23.1795164495031; Fri, 20 Nov 2026
 00:48:15 -0800 (PST)
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 20 Nov 2026 00:48:14 -0800
From: Steve Meek <stevemeek82@gmail.com>
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 00:48:14 -0800
X-Gm-Features: Aa3M54o4Xn00jWrzGntZB2_JEfjGjvq32pmj2DjG_uE_x2Fy5EbZhNSqDP66XzE
Message-ID: <CAPzME4aUpO4foxtL7PpaHk=7dyz-qo1vxrbw=o=qEENEVj=Zqg@mail.gmail.com>
Subject: [PATCH RESEND] bus: mhi: host: pci_generic: Disable doorbell burst
 mode for Quectel RM500Q-AE
To: Manivannan Sadhasivam <mani@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With burst mode enabled on the IP_HW0_MBIM hardware channels, the
RM500Q-AE downlink stops under sustained multi-stream load. The MHI
state stays M0 and uplink keeps working, but the downlink event ring
stops interrupting, and after a while the MBIM control channel times
out as well. Only a reboot recovers it.

At the stall, the last doorbell the host rang on channel 101 covered a
single buffer. The host then refilled the ring without ringing again,
as db_mode had been cleared, and the device never signalled doorbell
mode again, so it never saw the new buffers. Writing the channel 101
doorbell by hand with the current ring write pointer restores the
downlink immediately.

It is load dependent: it reproduces within a 25 second 16-stream TCP
download when the wwan0 receive work runs on the same CPU as the
modem's MSI, and was not seen with that work moved to another CPU.
PCIe runtime PM is not involved, as it reproduces with PCIe port PM
disabled.

Give the RM500Q-AE its own channel table with burst mode disabled on
the two hardware channels, so the host rings the doorbell on every
transfer. Other modems sharing the em1xx table are left unchanged.

Tested on a Xunison Exigo Hub D50 5G (IPQ5018, RM500Q-AE firmware
RM500QAEAAR13A03M4G, 6.18 with this driver): with the receive work on
the modem's CPU at up to 100% load, about 200 seconds of multi-stream
downloads at up to 135 Mbps, no stall and no MHI errors, where the
unpatched driver stalled within the first 25 second run.

Fixes: f6985f512f82 ("bus: mhi: host: pci_generic: Add Quectel
RM500Q-AE support")
Assisted-by: LLM
Signed-off-by: Steve Meek <stevemeek82@gmail.com>
---
Hi Mani,

Resending as I haven't heard anything since 13 Oct. No changes, and it
still applies cleanly to mainline.

A follow-up to the RM500Q-AE support you applied on 11 Oct. Under heavy
multi-stream download the modem's downlink stalls with burst mode on,
and a manual doorbell write on channel 101 brings it straight back, so
this turns burst mode off for the RM500Q-AE's two hardware channels
only.

The stall looks like a lost doorbell-mode handshake rather than
anything board-specific, so it may affect other modems on the shared
em1xx table under the same load. I've only got the RM500Q-AE to test
on, so I've kept the change to that device. If you'd rather it were
fixed in the core, I'm happy to send the traces from the stall.
---
 drivers/bus/mhi/host/pci_generic.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -470,10 +470,57 @@ static const struct mhi_pci_dev_info mhi
 	.sideband_wake = true,
 };

+/*
+ * The RM500Q-AE stalls its downlink when the host refills the hardware
+ * channel in burst mode: the last doorbell covers one buffer, the host
+ * then queues the rest without ringing, and the device never signals
+ * doorbell mode again. Ring the doorbell on every transfer instead.
+ */
+#define MHI_CHANNEL_CONFIG_HW_NOBRST(ch_num, ch_name, el_count, ev_ring, d) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = d,				\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}
+
+static const struct mhi_channel_config mhi_quectel_rm500q_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_NOBRST(100, "IP_HW0_MBIM", 128, 2, DMA_TO_DEVICE),
+	MHI_CHANNEL_CONFIG_HW_NOBRST(101, "IP_HW0_MBIM", 128, 3, DMA_FROM_DEVICE),
+};
+
+static const struct mhi_controller_config modem_quectel_rm500q_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_quectel_rm500q_channels),
+	.ch_cfg = mhi_quectel_rm500q_channels,
+	.num_events = ARRAY_SIZE(mhi_quectel_em1xx_events),
+	.event_cfg = mhi_quectel_em1xx_events,
+};
+
 static const struct mhi_pci_dev_info mhi_quectel_rm500q_info = {
 	.name = "quectel-rm500q",
 	.edl = "qcom/sdx55m/edl.mbn",
-	.config = &modem_quectel_em1xx_config,
+	.config = &modem_quectel_rm500q_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.mru_default = 32768,
