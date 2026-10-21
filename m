Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573029;
	b=PPZjhShgTZ1e2pd57DhQCg8cNkFVU6TE6AHlRklaHmYpjs1QmHt04bSvaj5nra6QF1Wi
	 IfshOzrArGw1K5kt/UddnmO8Wn3Ki/MH7m/Jk6ka1koaYzb9rOEMttOgXkMtkHK9IPiIu
	 7AsO7O0e/zMhrj397evWaujAJvt9kMf9eGxKR8giwKrAqqeZYjI7w3yqT4ET+Grn6rcYA
	 Lm5q81qesUr3C2Tv0g/p1uGM9me95YWS3Qc2pwJZw45/podl53SkwO8YMKBJIDob1dVy4
	 WxPgqTrlDc0dQR/xH8Bf7yMHOI/6vw+aZiPCjucvQ3uNOudfn0exGFV56cBO+9DDbZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573029;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=atjevud+3rfwFCpp16fCT+iNVtd9reiwkBSva2haHA8=;
	b=N9kWmklnOBpQ9Gbas5elac5YFr2x/e12sKMaRGI2eit8W5cXV3FQb29SUYZz2BDF1U2Y
	 3SWWxA96qouRR5oJ2v43zTgMrPl/E5lZXjSQeWD9+Ctn06kjgvF2OcDMP+fH0So95Wwtn
	 9DUnta55gmOEscJaoYDX+iP9wm8gFtPD0C0MM5j5wgMh77MfCX/rZlzNkI4/netuVgTFw
	 z7LYM3dPo8V2D+MXUUqaAQoQ/IpSzT8P1bV3Mk1r+AHgVJN5ZRrCWAQwXPek6iQPTonYU
	 SECfp/K/szg/CQflNRoV7gfzzcwHk9HZagdUC0Br72LE7e/NDza17IMVqb5047W5w1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Fmny/4hh";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA1606A321
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 08:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15EA1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Fmny/4hh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=at
	jevud+3rfwFCpp16fCT+iNVtd9reiwkBSva2haHA8=; b=Fmny/4hhaYeANg1PKW
	U30reo173QuIJCzO1C+Mtou4oqnyqFICDIvPRAuRHvGcp87nJ5aKGKZGPvScMl88
	yWLiR9PDwOuWhGYXAngqtbDNnhAW1JejAQj+lPOfzhBMoKixRj4Say6iWI9Blju1
	5L116LyWFR/Bgs2ntME/IyJ1I=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnPxJQfthqGZe3Bg--.35164S2;
	Wed, 21 Oct 2026 16:56:51 +0800 (CST)
From: Wanquan Zhong <zwq2226404116@163.com>
To: mani@kernel.org
Cc: krishna.chundru@oss.qualcomm.com,
	jeff.hugo@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	quic_vpernami@quicinc.com
Subject: Re: [PATCH v5 1/1] bus: mhi: pci_generic: add Rolling Wireless RW151 1501/1502 PCI IDs
Date: Wed, 21 Oct 2026 16:56:47 +0800
Message-ID: <20261021085647.27920-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dfwdvevwv6vyndv7uy3tsshw6vmpf3gregwxdji2n6uowrtpaw@664c3gau2nrj>
References: <dfwdvevwv6vyndv7uy3tsshw6vmpf3gregwxdji2n6uowrtpaw@664c3gau2nrj>
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
X-CM-TRANSID:_____wDnPxJQfthqGZe3Bg--.35164S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw47uF17Cr1kZFWrKw1kGrg_yoW3Awb_Ga
	yUJa1kGr40yrWxCw18Kr4Fgr9F9a1Fgw15trWvqw1qg340vFWUXw1rJrn0ywn0gr4Fqr98
	ZryUZw1Ykr12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRoUq5UUUUU==
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0ROE22rYflONIgAA3t

On Sat, Sep 26, 2026 at 12:26:16PM +0200, Manivannan Sadhasivam wrote:
> I replied too fast... This patch doesn't even apply on top of mhi-next
> branch. There is no config for Rolling wireless devices
> 'mhi_rolling_rw151_info'.

Sorry for the late reply. I could not receive mailing-list mail for a
while; the mailbox is working again.

You are right. v5 was an incremental diff against my local tree, not
against mhi-next. The RW135R/RW151 config from v2 was never merged, so
the extra PCI IDs had nothing to attach to.

I will send v6 as a standalone series on current mhi-next, with the
full channel/event config and all PCI IDs in pci_generic.

> These comments should go below --- after Signed-off-by tag.

Understood. Changelog will stay below --- in v6.

Thanks,
Wanquan Zhong

