Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2237B3EC
	for <mhi@lists.linux.dev>; Thu,  5 Mar 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704970; cv=none; b=cf+kn0i2jmxbChxgU/rqqI8hj1+fR2mbseMPMCLqhk7fAKTT0TEt+dPx/sAob3Tju2HXZT5HzSEAiE5GYZ5Z9NmCwwPirP6Sar9O/eLkiL6d/5rTvcBzTuO/XkTYcUzZTS0N7dUXRyvP4D2iH6FE0lYQdcAq9fAy/noj1KFVtr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704970; c=relaxed/simple;
	bh=hcnMZVDwUZ+EGbvLXxia/KehBwbwRkhgOkugMzIQI0o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=emYFcefkWAZp+SobTLRzrFG93708YguIqQp/VEztsEgjzvzU9p4Ftkaygb9ZLahkOUOHWCCxuSilfUEmyWKR5cQB0H2ufhi3gKVU8ZU5LCbfnVS/8/fOFRa/yvgr5BP9P2jUjV32l+MwqItxK7YxdcBJogwtm8YSnubyklQ44h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcTPQS81; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcTPQS81"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483a233819aso77129785e9.3
        for <mhi@lists.linux.dev>; Thu, 05 Mar 2026 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772704967; x=1773309767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FAdsTf7MFOGZ52YqX65Y5KfNmcZTpehqi/9UwGDGN68=;
        b=YcTPQS81bOPjfXDDrS9H5GCegjwwBQvuUkiOQzPqgjAJ+6WQ1kbzIViJJ+H54e6P38
         VX7z25me6dKfaqv6QaitWG+nV1csGf1bdOpqA6oxVjl+V26HAf3bnSolA2zpwENu/jJz
         P4qikO3br6Y0MbwfgMZgqykbwW7ADD87iPzKdiJUwaTWfoB724DYR6GGJDFh1WKRTvrq
         vaSUwJY5o/KIPNtpWZlVVg/BHEg0rIr+rVnDYFVyn4IcZBHcQ9AAvNxxbVGd+GagF23V
         amU5WOAuNYNuTC8OxwiVqbYQ5PuuMb2iAZTKDNze39p85fU3Lb9eJSurDjbeG0JJAWYa
         biqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704967; x=1773309767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAdsTf7MFOGZ52YqX65Y5KfNmcZTpehqi/9UwGDGN68=;
        b=lkuzKheX9lq62uc+qD1dDkRJe9p+VvUsvEDIIQcMgusBUVSzjt6UPh2CKFdv/lkgVY
         h87/kwC1YzL1WXALCH5SsnlXfWH1g+RAUnuyBOLOkYiZHao3IfVi1/N12o1ap65z6YG5
         /JSun2j5BE/0FSdY+TgdU5D1pp4xsl/eu3v+2vLgeZBMl7C8NrVl3cm2Z0gfLAVpOwqG
         qZGS0rraKLd2IGy4ydAyPm1qZQJMSyKnav+m/xh3qbYDKXTkYMT0+z62Kq2QRHcANl4E
         LkybPQMlBGSroDZur9hHPHFYC1kDRX0LvJYQbjFg9wdSA51IUirHL8hVapY9+oqtyvYT
         I7Ug==
X-Gm-Message-State: AOJu0Yww1v9f5pokflocglW06y4h/JcXXWH3hEz51GXC0/94Lm+98TCa
	Dwmh11x2oE4Z7tS+E/d+qSCBsCZFnc5P6FZuPj0wUNVjcMFwST+kI3Q/
X-Gm-Gg: ATEYQzym0S6muiFFcSb24IfFe4ZyZIze/YaJwTEQwsRRO8oYMa8zBz4VVFVhTpzNeZp
	3K5XoZR2VjdkYO0FGQwzkBkPSljQmR44BbsfbtlJ6zZB4E+8c5hxe0ERPO4hYrL/D85QR+Wl1Yq
	6wclgms9M9TxPzP767oPyfK7NdngQoOX5X/Q+Jli6dT6swzB/lBF2fcqKcaqASeeAlNFu4HevJI
	1M0TuRTXyrU7u8y0sarPjnRjuXC36A5S3yT80ieadjHwcukIoObgDgm77rMh6kWSB3OPdf69+ub
	VsQ+e8C1hVkclCHqsk3W4ytVsPi+bTm4V/9Ssh4kH08K8YoTSPOVN09cTZ7tj8XtlD6WLk84GrC
	Swlj86gF7aFFZgmmerfaCYfEeylzoWXeluzckLsEDwAYbT79d4LUEX+JTmfp/IbgDgUxAvUSl0X
	f/JewT864j5HOyVbRFSsOf5AyW8ZgTQ6CPTRv3TlvsTB6c5Knu7fthwuW97spPfknY7ynQZCiho
	xWFLmcW4C7/
X-Received: by 2002:a05:600c:8105:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4851983bf08mr76081195e9.6.1772704966997;
        Thu, 05 Mar 2026 02:02:46 -0800 (PST)
Received: from ThinkStation-P340.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm29409452f8f.17.2026.03.05.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:46 -0800 (PST)
From: Daniele Palmas <dnlplm@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: host: pci_generic: Add NMEA channels to FN920C04 and FN990A
Date: Thu,  5 Mar 2026 10:44:04 +0100
Message-Id: <20260305094404.1956028-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NMEA channels to Telit FN920C04 and FN990A configuration.

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 425362037830..e5b647486f7b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -798,6 +798,8 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(94, "NMEA", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(95, "NMEA", 32, 1),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
@@ -849,6 +851,8 @@ static const struct mhi_channel_config mhi_telit_fn920c04_channels[] = {
 	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(94, "NMEA", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(95, "NMEA", 32, 1),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
 };
-- 
2.37.1

