Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573657;
	b=z67fxpCoHvHgYw7fvvIWvloG2UK52S+wDj+EKO36niHpl/SUvEou5G3yVyGij/WSw3SC
	 /WqjbyFzlpjwZ+pcyt/gjt3zLe/8NkCxOO2E51JEYPh1z65YHWtXDtbyQPUpjPVr2QTv1
	 J61SOfPXswVObb9i/nqFaClwqIrOwRb61TZHYJaxrtvsv8O5Xsb/MzUHeTVRolLSxHmdh
	 RayLFzFXtAMtJKOhXE2jyWznV4PwoJ8hPF7LtcJDOt6zMwQk6CR4ajY1P+jzdjHiJKet4
	 dkK4lbWBeEa0x9FVijo2eBXUgvw0puVa62CHqv9jvGpk1frxTQmpdZpZG6HpgWDw6rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573657;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=92DTiUUK71Q2LhIuCW5C/IPiDJObqZvJg6w+xoJeZg0=;
	b=4Atb4NZnVOwGiZStgKXDrxsVHq57PFge9J8vKo9oSrXAVSV8FSJIU6cHkDtS1FsY5nQt
	 gruIdHE5PsYKQL7SFOhY2fN5xryyBUutwqXhJW+wSjLngVDzK1QZVWPx51CqekqmS1LIa
	 gbncBDwvXA5ZdVj0u1FaXdT+NNcFvWL76Ea3z1bLmQPk9CZ317Cj6SlP7xAQs6b2u4FiW
	 kBHQsOBS0CHim0JEXHk59K5SODM1cyC/xBWpyx5UWZKtakruJ6jp4onaq2uytNXqyvc8A
	 LFcQ0QkU6OBPELv7bWmL2mf+WRpdsTmc1aznxGs0IhjmZFL5+aRrFGFECQfC9vLloTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Wi7ENg9k;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D3606A319
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 09:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA4D3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Wi7ENg9k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=92
	DTiUUK71Q2LhIuCW5C/IPiDJObqZvJg6w+xoJeZg0=; b=Wi7ENg9k9LJM6XDpUP
	F17zrGQfPluyE0Ot15pI5BtfMYoFi7JhjoEyoPZMaploq2z5QQIemjygn9RPPyjF
	NpKIdG+pSB4m+F65hZgLm0G+U4OR8/+BIZ0q+bEKtQuvF/OM0qEGmv7KFjOt/rLl
	CZNLwBcazQIa2f2L6CbeuCRqk=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHaYjAgNhq_ue0BA--.13927S2;
	Wed, 21 Oct 2026 17:07:16 +0800 (CST)
From: Wanquan Zhong <zwq2226404116@163.com>
To: krishna.chundru@oss.qualcomm.com
Cc: mani@kernel.org,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	kuba@kernel.org,
	wanquan.zhong@fibocom.com,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v4 1/1] bus: mhi: pci_generic: fix Rolling Wireless RW151 MBIM channel ring size
Date: Wed, 21 Oct 2026 17:07:10 +0800
Message-ID: <20261021090710.28118-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c53fe666-7cca-4d25-8ee0-a787e5d1bbce@oss.qualcomm.com>
References: <c53fe666-7cca-4d25-8ee0-a787e5d1bbce@oss.qualcomm.com>
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
X-CM-TRANSID:PygvCgDHaYjAgNhq_ue0BA--.13927S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjfO7UUUUU
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0QQieWrYgMTXPgAA3R

On Fri, Jul 03, 2026 at 10:00:07AM +0530, Krishna Chaitanya Chundru wrote:
> can you include what is the side affect if we don't have this change,
> like what is functional issue, low throughput etc.

Sorry for the late reply.

It is a functional mismatch, not a throughput tweak. RW151 firmware
configures the MBIM channel with 32 ring elements; v1/v2 used 4. The
device can then post more transfers than the host ring can hold, so
MBIM control TREs are dropped or never completed.

v6 will include ring size 32 in the initial RW151 config, matching the
firmware and RW135R-GL.

Thanks,
Wanquan Zhong

