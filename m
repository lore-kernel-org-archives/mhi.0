Received: from mxb.hotsplots.de (mxb.hotsplots.de [185.46.137.13])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503941E52C
	for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.46.137.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714513265; cv=none; b=Bww3S9aFViT/kgQzzYzY/kDznwo2WsKttvdgUb+tlNyuGpdJi1RQGb3NZ2grl5tQlcFW8j6J70vNNR03zJfYi/N6v4T5piW12VMfJz24M7tfgluxmwFqRKAkLoKDrSZJgpygxIv2U3lfdYyAWBF5WjOaiLkuYQoKAo63TVGdP4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714513265; c=relaxed/simple;
	bh=P7lVKZGI+IL8uZFAv3yug/V+Sym8HiighDz3wFJKURM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqPMKDu3x6DAq47nmPxW5P4hGf55kJZYgIsR5KaMP8yoICCazkCd/pCviZJGhUbOGcuG9oJuAscBNPMO1yj2OdbBc1wkUQRQRx+VuRTdSoPfxuearYiBuDxv63HemlXH7UT2+WUKBC9DH9skdiI0/dewD2crA6HY0uwGsljqjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotsplots.de; spf=pass smtp.mailfrom=hotsplots.de; arc=none smtp.client-ip=185.46.137.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotsplots.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotsplots.de
Date: Tue, 30 Apr 2024 23:30:57 +0200
From: Martin =?iso-8859-1?Q?F=E4cknitz?= <faecknitz@hotsplots.de>
To: mhi@lists.linux.dev
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: MHI MMIO endian issue
Message-ID: <ZjFjEe0-tJ6un10J@dev2>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.77 / 500.00];
	 BAYES_HAM(-4.67)[99.15%];
	 RCPT_COUNT_TWO(0.00)[2];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.50)[subject]
X-Spamd-Bar: ---
X-Rspamd-Server: mxb
X-Rspamd-Queue-Id: 96E218C044A
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=faecknitz@hotsplots.de smtp.mailfrom=faecknitz@hotsplots.de

Hello,

the function mhi_init_mmio configures MMIO registers using the reg_info
table:

  eg_info[] = {
    {
	  CCABAP_HIGHER,
      upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
	},
	...

  mhi_write_reg(mhi_cntrl, base, reg_info[i].offset,
    reg_info[i].val);

However, the values are in host byte orders, not in device byte order. I
have a PPC64 system which is big endian, but the device is little
endian. Without wrapping each value in eg_info using cpu_to_le32 the
device (sdx55) doesn't response:

  cpu_to_le32(upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr))

Hard to believe i am the first one which has this issue? Let me know if
i should make a patch.

-- 
Martin Fäcknitz

hotsplots GmbH
Rotherstr. 22
10245 Berlin
Fon: +49 (0)30 29 77 348-0
Fax: +49 (0)30 29 77 348-99
E-Mail: faecknitz@hotsplots.de

Amtsgericht Charlottenburg HRB 93460B
Geschäftsführung: Dipl. Ing. Sascha Schaub
