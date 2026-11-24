Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524254;
	b=5QyTK9WS6PK258f41Uct4D6FDs7NX0ikEGeOk8u1RBNCqrBKr8WEqPCfZaYHAlmBt+gZ
	 PFVtWk/hdHD8NeIxNBvMQCURtujAfNahRbMiQsF7C7crufjIK+YNCx9aJymbXS/7kF4l0
	 dsyVZw64Op8XVpYRZ2FyiJC9tYJ9Td5dlGmn8q92AMuxPI17Z/u2Ytrgji4ScPAsyOBR1
	 x1WB+GCFFJr0C9wAenkRnfq3/y+ayU8szJKjKpZqPd5iSUE7OYUy140FV3AiQwIyJITH0
	 sYPnaejJKyW7UfkEyDdx+9aXN1io5HIYSP9kYU0BQ3u+C2oqpO9CObr2z/Wa7y+1ZJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524254;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=N3NTmfX35b2vV6UrMxA0DBPxvecP96wM7O5DoxJIPqY=;
	b=X73p5O2gn8Fb+Wb3OxmlaQy+pv4Oa/sGLd42tgSrZvj87ICUB9HZNYpLe94WRs9AGgOx
	 TMDZgjz0sWlkWUpgNuyy4gVrsy+7La6NIgEgk4xkxXtbYgLEtrcEzioMMe6v5O35e9GB0
	 wJa7HV79Dq8se7wLi9+HVte7SNYn4OKz5qEntHzX2Ux24mnzv2SPU5MlnQVLm9Axe2KLt
	 2PvgDEcCAI+V3VZJpy5P8Z+dmA+3Bv5zf6TUM9A4uS1olAkymjXI8WiHASADtf5VedMPh
	 wXb+C4eFUzS2CsV9emiBLiYomSkSH+WvXJ81fRRgID7mo92a2KEOgVWlT5N1GLAighw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=l4dtxQ4R;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D1606A322
	for <mhi@lists.linux.dev>; Tue, 24 Nov 2026 12:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA5D1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=l4dtxQ4R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=N3
	NTmfX35b2vV6UrMxA0DBPxvecP96wM7O5DoxJIPqY=; b=l4dtxQ4RqQ/yceEb/K
	yIFCu72UhYrVxChs+mcZUOBVlFkrMejN174rUcGCMo7ToULhdap9F8BqnwlhmmUU
	KbHIe8nnYA8RfTxV4RnPGFb+XjsBI3RQ8Q1mCsWEZRVe0gNKePSXsxd4qf1q7iM7
	m92EUFefLeW6uxYikp8THgYyg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXH4WDhgVrkSAEKA--.1379S2;
	Tue, 24 Nov 2026 20:43:51 +0800 (CST)
From: Hongxing Xu <xing1989093@163.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xing1989093@163.com
Subject: Re: [PATCH 1/2] bus: mhi: host: Add debug port personality switching
Date: Tue, 24 Nov 2026 20:43:18 +0800
Message-Id: <20261124124319.2316-1-xing1989093@163.com>
X-Mailer: git-send-email 2.40.0.windows.1
In-Reply-To: <6b3fbc60-34ec-4b7e-bbc7-84a0ec5d496e@oss.qualcomm.com>
References: <6b3fbc60-34ec-4b7e-bbc7-84a0ec5d496e@oss.qualcomm.com>
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
X-CM-TRANSID:_____wDXH4WDhgVrkSAEKA--.1379S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF45Ww1rZFyfur1kJryftFb_yoWrXw4Dpa
	nxGFZrJw4kJF4Skryv9F48GFWS9FZ7GF43GryDC345C398G34Svr1FqayYva47CryIqryj
	vrZ8JF9xua4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRYg4-UUUUU=
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC3wjfnGsFhoipFwAA3K

Two questions, both pointing into this patch, so answering them together.

> > +What:           /sys/bus/mhi/devices/.../debug_ports
>
> Why sysfs and not debugfs?

Because this is not a debugging aid. It is a documented ABI that end
users and provisioning tools drive on a shipped system, and it has to
remain available there.

What userspace gains is the ability to bring up, on demand, a group of
ports that a given firmware product configuration does not enable by
default: the diagnostic interface, and the same applies to the ADB and
AT ports. A single switch that creates or destroys that whole group is
what is needed; poking channels one at a time is not. That is why it is
described alongside the other controller attributes in
Documentation/ABI/stable/sysfs-bus-mhi.

debugfs cannot serve this, for two concrete reasons.

The first is availability. CONFIG_MHI_BUS_DEBUG is a bool with no
default, so it is off in the configurations product kernels ship, and
it is a compile-time switch: with it disabled, debugfs.c is not built
and the calls in mhi_register_controller() resolve to empty stubs. A
user who needs these ports would have to rebuild the kernel to get at
the control, which is not a usable interface.

The second is capability. MHI's debugfs already exposes states, events,
channels and devices, and all of them are read-only listings. There is
no debugfs entry in MHI that can create or destroy an MHI device, so
this is not a choice between two equivalent interfaces.

There is also a security reason to keep these ports off unless they are
wanted. The diagnostic and ADB ports on a WWAN module are a meaningful
attack surface, and a module that does not need them should not be
exposing them. Hiding that decision behind an interface that is absent
on production kernels would defeat the point.

> > + * @debug_ports: Whether the debug port personality is active, ...
> > + * @debug_ports_pending: Latest personality requested from userspace,
> > + *		 applied by debug_ports_work
> > + * @debug_ports_work: Applies @debug_ports_pending from the ordered
> > + *		      high priority workqueue, ...
>
> Are these optional?

None of the three can be dropped for this feature to work, though none
of them is populated by a driver either.

debug_ports records the personality that is currently applied. It is
read by mhi_chan_is_available() on every enumeration, which is what
keeps a debug-only channel hidden while the commercial personality is
active, and it backs the sysfs attribute so userspace can read back
what is in effect. It belongs to the controller because the setting
covers the controller as a whole.

debug_ports_pending carries the value userspace has just written. The
create and destroy work cannot run in the store function itself:
channel devices are created and destroyed by the state transitions on
the ordered hiprio_wq, and pm_mutex does not exclude those transitions,
because a transition releases it before calling
device_for_each_child(). So the work has to be queued on that same
ordered workqueue, and by the time it runs it needs somewhere to read
the request from. Keeping it separate from debug_ports also keeps
"requested" and "applied" distinct while a switch is in flight.

debug_ports_work is that work item. It is initialised in
mhi_register_controller() next to the other work items, queued on the
ordered workqueue, and flushed by the store so the write returns only
once the ports exist.

All three are zero-initialised, so a controller that declares no
debug-only channel starts in the commercial personality and behaves
exactly as before. I am happy to say so explicitly in the kernel-doc.

Could I ask what you have in mind here? If the concern is that the docs
should mark driver-populated fields as optional, these are not
driver-populated and I can word it that way. If you would rather this
state lived somewhere other than struct mhi_controller, I would like to
know your preference before reworking it.

Thanks

