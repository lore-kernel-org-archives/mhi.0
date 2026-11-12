Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456093;
	b=v+J7T0mU3N/yAICT/EbL/JmWopA9hkeQAVm17/c6fXWZ4gq3KhE9YMjOMfx8wQh0NGhn
	 wqExIDQ2jIbXltK30pO7/nd/WLi/Pf0qX0YuzjoALTEbpuh739MreFuS+vBSYXzpskUzh
	 vSzs8ZQ9HY1c+1kiPuVnNY3KVqLNDJIwJrZOtaGYgXPE7z2yWhl4Qi7E56mA9A5pn3Wlo
	 K3VvfKV5jhc92SBxww0xH/eCTGFmwvUkkgxaJhdsuvCijAqBT+zaDF+D0IWsoEGs+aMu4
	 qw4Tuoh64S6ue4TWzFsT0dYfueeaorBjH1UK4Vgl0eFodCpSyKYhsYN6RjIII3roAGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456093;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ANLz23Rke/l4eT311lEL+8VsHPwwlR8dTechKyhxJwA=;
	b=zTdLicJKgwqeMA7yOMid19J850jSX7ZjYEHo22bNaxHrlb514S/82hQgnAUPuV3OCIQ2
	 9um4yuqdZDj0Nl6HCjIn1rTzXCh0XanCagp5/KWrgh+zwsNoBGvPTXTAfAF52Tqx+5/F5
	 ad3k4I3EfkUXl2pGb52Yxe3yhBwBtDzMj0zR4vORmUIaFrhGDThrsuj/jiUx1ZvMXvcUK
	 AsLkpI6s70ArdWGHDBQ5W/kNb9N0/j4iGj4ViEKJVKuHYZa643T/1nnHpfBPn0Y6izi2Z
	 3qqvwsgnvmJ8ktGCkI9PN9apamGZZbAPoI/A4SOiHR0iYRQwlCyVL1eeEv210JxBLpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MOfIkSRb;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEF9606A31C
	for <mhi@lists.linux.dev>; Thu, 12 Nov 2026 04:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MOfIkSRb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AN
	Lz23Rke/l4eT311lEL+8VsHPwwlR8dTechKyhxJwA=; b=MOfIkSRbAu9v+sKwb7
	k9BpOeaM6Deq5uRkrb5UD5qwRVuMpL9InnVi5CStr1+TzaEdQo1ialmc9iQg19ZT
	mdOhfsrenhKOXCjK2roi3vQzvZzMZhRSgI0yKdqw2iZN7j5NyY9sK9cBJpvQgqBw
	OGBC4ezI0ZswuWeiwU98lbMm0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3ZzkMOvVqkjBRHA--.54029S2;
	Thu, 12 Nov 2026 12:01:21 +0800 (CST)
From: Hongxing Xu <xing1989093@163.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
Date: Thu, 12 Nov 2026 12:00:58 +0800
Message-Id: <20261112040058.1986-1-xing1989093@163.com>
X-Mailer: git-send-email 2.40.0.windows.1
In-Reply-To: <c231a7b7-9036-4001-9ed2-e1c049f02dfd@oss.qualcomm.com>
References: <20261109110352.1621-1-xing1989093@163.com> <c231a7b7-9036-4001-9ed2-e1c049f02dfd@oss.qualcomm.com>
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
X-CM-TRANSID:_____wB3ZzkMOvVqkjBRHA--.54029S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr17Gry8Ar1Dtw1xJryUGFg_yoW8uF1rpF
	W7tw4DKr4kJrWIyr18Ja18ZFWI9395tF45KF1fJ39rAan8ZrW2yFW5tw1Fva9rCrs3X34Y
	9FWaqryDuF909rJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsiSJUUUUU=
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC+xGqZ2r1OhHJcwAA3p

Jeff,

You are right, and my wording was wrong. I will remove the claim from the
commit message.

Now the background, which I should have led with.

On Windows wwan modules are reset through PLDR. The platform firmware exposes
an ACPI method that drives the module's power and reset pins (FCPO#, RESET#,
PERST#) instead of resetting the SoC with the link in place, and the Windows
driver uses it for that. I am adding the Linux equivalent so that the same
board can be supported without a vendor driver.

What that path gives us, beyond simply being what the platform provides:

  - It does not depend on the endpoint's PCIe function being usable. No MMIO
    access, no config space access, no link.
  - The platform owns the pin sequence and the timing, so the host does not
    have to estimate it with a fixed delay.
  - The link goes down with the module's power, so the endpoint is
    re-enumerated and starts from a clean PCIe and MHI state.

Concretely, on two of our modules, RW135R (SDX35) and RW151 (SDX81), writing
soc_reset from Ubuntu reproduces exactly the situation your commit message
describes, and it does so every time rather than occasionally. The module does
come back on the bus, but it comes up reporting a MHI system error:
pci_generic takes MHI_CB_SYS_ERROR, logs "firmware crashed" and forbids
runtime PM, and from there nothing gets the MHI state back. The only thing
that recovers the module is a reboot, which is also the only step in the whole
flow that actually toggles PERST#. Resetting the same module through the ACPI
method recovers it every time, because the module is power cycled and the link
is retrained, instead of staying up across a reset that only targets the SoC.

So I am not asking for SOC_RESET to change. On these two boards it is not the
reset that gets the module back, and the platform already provides one that
does.

The point is narrower: these boards provide the host with a reset path that
the MHI driver currently has no way to reach, and the MediaTek vendor driver
already uses it. I only hope that the MHI driver can use this method as well.

Thanks for catching the first paragraph.

