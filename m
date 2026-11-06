Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974573;
	b=msaql4dlFy9G6XthxuNE+HeL9KmXYFCwoKqu/RgZfIqTazOOvRxorsSeA55YL/VdXvwB
	 WXkWGgEhprF7p9d3Lxzx0dZoHmagcSSKK/pC+QatagkTfFX8xBEp/RGspXQQ5yyhx2ajt
	 6BqYQIH1PNcTEbAPhLX1CsxrzMHmi10ZwJqAfKOX8NlsW/aQzjKVkKSJC/hzc5HBYiubH
	 dGGFtwScu6pdZAGOJw3pUB2uucSdOeW1uAbTQh8ZfJajoGfpcXG3eJZV36rFwR1dq0tY5
	 Z0f3IF7xZQgCbgSYFCswYAVkQqD1K540Ai/SLKEyLWYNbj261jenljmG0BJIE5hO/XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DPqAuBS4T4u4zMA5n0n3Wuyb1m4HV99Rxc7qJYm5Ofk=;
	b=nrZiu4Bxx2g1MaKNj20/npiAcUsTLeTSpDI0deXDORr2n/a6hm28m1eHaFE5UPGO0vzq
	 TncXv3GQwUKsS1Si7dPo+gZbDT6o3+ofdAPPJN4vPtXCkZX8cf7CeuF2baBbeJL0oNr1s
	 BNB1pgQVCpU9C2hT2jx/QoEG6gJqyOAIuc/NcyKq9tY6d0r0gyQo7ByUkWomOnji698Zn
	 zzupjM85EFaneyx2ZdjG466UbXPI0X3L6BGyp1P7y+BFQZRUhWYMMQinEBDFylpZn9WoB
	 /tt4dx7oUTIOZp6R6jb/EFJgYBd9JUt3duGpAvl4Ng8040Iu6E7EGCuT32xXa07VCEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Zdo/ggi8";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE12606A32C
	for <mhi@lists.linux.dev>; Fri,  6 Nov 2026 14:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE12606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zdo/ggi8
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso342392a12.0
        for <mhi@lists.linux.dev>; Fri, 06 Nov 2026 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974572; x=1794579372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPqAuBS4T4u4zMA5n0n3Wuyb1m4HV99Rxc7qJYm5Ofk=;
        b=Zdo/ggi8RY4vPVZgXT2Sd3i+Uy4gS26Nv48A87NIbv32C1bXNV/zyXZmiuu+g7LpuX
         7KI8f23btcYvi24d6SyOwtsf2w6kPo7lBRunms1X77rs1/W4psglRkZ8iZoj4aFGwKNS
         JB/WEfgL04oC00+tgj/37lRt2Ntl5PMxTFq28j5gnzGGmhp3ForpmbMoenvcV6aBra7M
         s78hQLo6EB334VJd9R5X+f2D2YxgKXwe2eU1YAUlrsfc+28GF3vkD7XnWxKfPdvmm7//
         PtDqitbUISXKax9tDWf/symWPqeah+Vh/6+Abl9CcXxVpBfSrQmXWN7n/CJu5OOPXtHW
         /VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974572; x=1794579372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPqAuBS4T4u4zMA5n0n3Wuyb1m4HV99Rxc7qJYm5Ofk=;
        b=eR5NAOzeOKQmRK7uQ1FSV5HDQY/muBAdZY4dEkdXbsk2LcJ3ierh6L/M1WtNWyMs5s
         mBI15F8cF5dNggdN791npm5slYtlb4rbCNFnKqG7679ax/15+12rtjJo+M8NMUCfOx/g
         hd9Enm7RcAaebj/8r/jTGvDDrql8iGIN8MNO9JG0K2U/qclSQJn+zl+EcTUgEoUalaXm
         9yK/4WmGif+PnGW1dgAtpPn64eLWgZNaXfEtM/3PZfCdTNZNgEy7niy9p7iu6zKslzwX
         2mh8Sz7uonGhvmyuOcY3FpxzXeylO68XZ+2R3QXD0X6yuNYLjcTX/xGHOZcjVqZNHNlB
         dz/g==
X-Forwarded-Encrypted: i=1; AL+hErG4ri6dYmY9wn62TFtogf94cH9yTdghO1m+lz+YMpUCitFklVmKSGGas/ZCdh5fAo9CuNE=@lists.linux.dev
X-Gm-Message-State: APuU4Z91I4jSFUbPuAiVwDOdR0J8BRb98HsbU8I80j/fRhPZIoNfVa10
	zONPdQfZbkgKXz6BIocmyc6U0iuQ/iQsjgOgZajI6VJ8kGLMg0ng5xuj
X-Gm-Gg: AYBFou2j+ZOtYL1zBtSFOInvwZZ54Uof+wzDTEnVlyKhcfQ/LR3ecxEjDpaJzASAa2C
	RFfLl6uOlpcrZMHWvF2MSqICF1+G8in42pqnbPCDoUrnLk0mG5cFz9yfNBjC8uywoGEuMEyG+lU
	ZwV2nnJDcVSME2E44VpVwD61Y1RrsKRfKHzhjp4PXgIUVak8KvGchXEGSMSv7VDnGij5+IZIu5r
	yNS2WRIC3GYSNj1tYoqZFuVXWGaYB8wiGw+TCBuz30x4M5100V5b5TBYAT8hcditAx6q98sntwc
	OIKe02vwgHH8Kgbs45kn0BAoy8YRX8PVe9OWQF52+J/rvRZfPK0KcIN2YWGPIpxmWluof/Rj2gG
	xdYlSi1FQVxii7cqi9wy2fl8lkB8f4FenwXoupNpMB/WJ0uk4cTeFvj7p6C49Yy4W710+ksK+LA
	ZeWXZBBoKlRI6byeNRxFrg33DjfgeZc8NSNrPUILQVahUaPcDdqAwty6uV6KDVwrrf5ten0oimR
	uNSSiK9SKjqyDAE/w3+XQgLGKpK6m9jUGtpsAq5hwrkc4Xl/veCR96gN+xR2DPNm0fApTUsH5TO
	OLPg/N/UfBMUk+msFulwxb8Ur1kVoACUK3mmCXupNto90hv1mbiNoC5wRQ3s9JzGxteIavlheq+
	IuSCtpWtxy013CpKkrqc3Om2zSXibvUoSKHu0G5FS
X-Received: by 2002:a17:90b:554d:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b0db5edb73mr2783616a91.7.1793974572380;
        Fri, 06 Nov 2026 06:16:12 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm8057305a91.3.2026.11.06.06.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:16:10 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Slark Xiao <slark_xiao@163.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: bus: mhi: host: pci_generic: DW5930e does not come back from D3cold on a Latitude 9420
Date: Fri,  6 Nov 2026 23:16:05 +0900
Message-ID: <20261106141605.2918662-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Mani,

On a Dell Latitude 9420, the Foxconn DW5930e (105b:e0b0, firmware
T99W175.F0.1.0.0.9.DF.015) fails every runtime resume from D3cold. I
would like to ask which way you want it fixed before I send anything.

The modem sits under root port 00:1c.4. The modem's _PR0 and _PR3 and
the root port's _PR0 all use the same ACPI power resource
(\_SB.PC00.RP05.PXP_). When the modem runtime suspends, it goes to
D3cold. On 7.4-rc1 the first resume after boot gives this, and the
modem is gone until reboot:

[   24.704019] mhi-pci-generic 0000:a5:00.0: Unable to change power state from D3cold to D0, device inaccessible
[   24.706039] mhi-pci-generic 0000:a5:00.0: Unable to change power state from D3cold to D0, device inaccessible
[   24.706667] mhi mhi0: Resuming from non M3 state (SYS ERROR)
[   24.707418] mhi-pci-generic 0000:a5:00.0: failed to resume device: -22
[   24.707731] mhi-pci-generic 0000:a5:00.0: device recovery started
[   24.728030] mhi-pci-generic 0000:a5:00.0: Unable to change power state from D3cold to D0, device inaccessible
[   24.730020] mhi-pci-generic 0000:a5:00.0: reset
[   26.742093] pcieport 0000:00:1c.4: unlocked secondary bus reset via: pci_reset_bus_function+0x1a9/0x1d0
[   26.885444] mhi mhi0: Requested to power ON
[   26.885794] mhi mhi0: Power on setup success
[   47.157078] mhi-pci-generic 0000:a5:00.0: failed to power up MHI controller

On 7.3-rc7, Ubuntu's 7.0 and a mainline 6.15.11, the reset brings it
back to mission mode instead. The mhi_pci_status_cb() then calls
pm_runtime_allow(), the modem runtime suspends to D3cold again, and the
same failure repeats every 58 seconds (7.3-rc7) or 79 seconds (7.0,
6.15.11). After 3 to 20 rounds the reset fails with "Failed to reset
MHI due to syserr state" and the modem is gone. On 7.0, and in the
first rounds on 6.15.11, the resume fails with "Did not enter M0
state, MHI state: M3, PM state: M3->M0" and -5 instead of -22. These
kernels also log DMAR write faults from a5:00.0 in every round. 7.4-rc1
logged none.

Setting d3cold_allowed=0 on the modem from boot stops all of this.
There are no errors, runtime suspend to D3hot works, and s2idle works.
But then 00:1c.4 stays in D0, and the PCH never reaches S0ix (SLP_S0
residency 0, SPB not power gated). So disabling D3cold looks like the
wrong fix on this machine.

Is this modem expected to resume from D3cold with M3 -> M0 at all? If
not, should the driver treat a resume from D3cold as a cold start
instead of going through the recovery? Or does this look like a
platform problem with how PXP_ is turned back on, in which case I will
take it to the PCI and ACPI side.

I can test patches on this machine and send the full logs.

I found and checked this with Claude Code, on x86_64.

Best regards,
HyeongJun An
