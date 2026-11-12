Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794455991;
	b=YK1hHdsRPqTq+0OQXM+ZtEFGIhdU1Gniciag84k8OfAsgvyvUordRtggICYRHyg+r6LZ
	 U0FmUNoJSPlI+kDCkCsDAZcwEC+pwBE4Vd8WrAGHy9G2GOlU0zj+Do4hD0bKZ9tNwt3Hx
	 0xjBZPfyIzpww8mgQ9TisLnS2u1uXa1pwG/VLbtZxqCC87SAHtwyaT7xQmL5yl8bycu1c
	 Ej0um1h/r+IopA21JWBP+rfI0+X8lkaueoCMYwI6e3p2dluEros1iSW5AaKNTVlt6HlfN
	 sE8W4TRtSfpvufhgH/dHfqGr+NJKMXv/765wLE8JKsu/8MpKzmkMmo3viKGeiI2CItQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455991;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ANLz23Rke/l4eT311lEL+8VsHPwwlR8dTechKyhxJwA=;
	b=eBJwnAfUf4iZJd20clioBDO/JdBPOJwuiQcYGs4SbWywKGhxYWKCRRqt1iLBB3faJKJz
	 0W7E1lOVFyhNsS9pKj4+VdoGbePjVx+bpQsYH954/XDy+oXXaqTSqjx9WCM/K02VpiIUU
	 LU6AogpH3J5jzZmDZ4wBte0IG1DpiDhOQQy9vzPxxQwZMbwR5qVjkrnD1T9tVQpX5wuLN
	 cOE91lnxUL7aMxkieZ9e/9NprEpvEsapBWGB71PrfAThna/u0TgkXmZZwAMvDiiWBLT+S
	 jlw+gzg5Sfd5KkxUCKl4ZOHz89J1PWYXwz+Ov6bW7kieSL3IYZVyswHloU6zWfQihHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EX84Tn4e;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A088F606A31C
	for <mhi@lists.linux.dev>; Thu, 12 Nov 2026 03:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A088F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EX84Tn4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AN
	Lz23Rke/l4eT311lEL+8VsHPwwlR8dTechKyhxJwA=; b=EX84Tn4eosQEz2RdZR
	cLoRdPgl7QOxJG/7s47/d1mk/5UvXxp1Pu8GLUIkaihD4GSvDFjRaMEtmjRMk2vi
	rsChY8TskS37JT0BiPXcUZjSwbJQJ8i69PHeC+fVgyx2xLqCajjxmIdO5jB15Iib
	hdm9u/VWxm3Cgzb/2vl0TJOIo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnLyOjOfVqoxypHQ--.28331S2;
	Thu, 12 Nov 2026 11:59:38 +0800 (CST)
From: Hongxing Xu <xing1989093@163.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
Date: Thu, 12 Nov 2026 11:59:14 +0800
Message-Id: <20261112035914.1949-1-xing1989093@163.com>
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
X-CM-TRANSID:_____wDnLyOjOfVqoxypHQ--.28331S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr17Gry8Ar1Dtw1xJryUGFg_yoW8uF1rpF
	W7tw4DKr4kJrWIyr18Ja18ZFWI9395tF45KF1fJ39rAan8ZrW2yFW5tw1Fva9rCrs3X34Y
	9FWaqryDuF909rJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UnAw-UUUUU=
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC+wqQTWr1Oaq+cAAA3u

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

