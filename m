Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285980;
	b=LC+gsWMj5fBAjt0bM3lFJUuiz92/A/TB6obldZwFO2cPib3iYbrKJ9Yy/tc6SwA3Oa50
	 0xyF/UEVlwnYZWsVm6IDD58AzQZEzVAMgwZedCwku08mAzhAkOzD0U5D0CnLhp+6YcJMd
	 XegGphwwH1vCzttG4KSrHTAffj/rqjDhliiFT3RecnoE5tUZWdZxhr6wGkM+BV/o3Yhv+
	 jqJdFA3nL1o8jwBbHuf9vEFCEZDLb5T869QXV1oK2UtwoVy7VCgE+bitgy4nci5a4O34S
	 oKok5/ra060dt+F755RtOL4c1eLQlWVdtmpt37rFyc8WPU60qoRPHkNH8cJvn58TcyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=nUa+ypB/rpt+BZEGHzRfc1ssA4Mdi3dtAcbaRgnbYig=;
	b=txn92V/P5UFdk0wT0fA9EqKAh2oIB5KQv0LPKpMpdieeW5ReQpKumR/IOZEwAr2fyd0T
	 FWOqXe5+jZWByK/tNFUq3bZiAY4BnXPyVDpecahVyQmkdk4d8Ll7Tc80T4AJhYqfHb8Ts
	 3l5OFriS9Q2pJnIxjzieevkzKwhcw9ZFz0LzHYATAMR813afBBUJSGi6TaZjvwUiOIqIq
	 DQCojIMIn6cN+kyuH11VQ2k+p1WXuDDVLDCYkJn/jmKZbiMTByJNIO12YgMYxwxTNSuqm
	 vqGnnEmksyVJdRoRYNvJcfqfXE8JCNl+YeRupFs6IusjDbaLGCqKsOv0glNizoy56hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTSEEaqx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64540606A31A
	for <mhi@lists.linux.dev>; Thu, 29 Oct 2026 14:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64540606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTSEEaqx
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a707f37eso21560396d6.0
        for <mhi@lists.linux.dev>; Thu, 29 Oct 2026 07:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285979; cv=none;
        d=google.com; s=arc-20260327;
        b=U1bEqYk8AzSAPrwTk7ERkSKPZprGKPzFyUu6o/7ny2hE6vykN2noFabclylkUuI5mJ
         k4TiCys+SW1344+nmkaCiT2msLshjDnaM3Q9pREB/GX54SOlmxW2pTcE05KiijMDC0It
         lf4jJ76ZuJ9+rI30Cwpr4VsAVnTjLv4GpsNO7HOhuyFBQyrp/HOzEwpvS9tsZqFGMoCu
         UFfuIM0ykF/gzP1hjKrdL4sn86rM3ZqvcXjSjlEn249bIJXUnTP55xlTGWoHwOTud2CP
         V7WkIzj/9EK4NI8lckIG9Dc1QVFJyF603ylBm2dBUjNRT2JsK1e1zsh3sfaEwqsPjNIJ
         NlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=nUa+ypB/rpt+BZEGHzRfc1ssA4Mdi3dtAcbaRgnbYig=;
        fh=0bp717kWPiVQw8ePI4fuZCl429ucSXDRN3kIfqKRc5M=;
        b=hlxE1jX3SgzOrNATDS+bsqAWyl1Nid4wxeE9rgFy96z9vxm94cm3X2lUxMsk+kIvIZ
         BPjAVErOxpjkNMywWIgoFaDYuUXHYvfCn6Wh7SbBYXJJC5bKvit/fV7PCAVm9SIiZC/O
         GCv3ukDu0yds/pQLUrR2vYqUHeuIwAU+k89n1LnfgrYG0cH7XZ2SeAkxGZ0ezgsakfR9
         Wdxq4UF90jqnIhJ2+hSKRD4sqcZ0yrmutnSRHoLHEqpth2PKDKoZvlbKoi3ZUqL5e73s
         jtPNM9b3Ts6Zv3jjqBfJnQ6K7cQY9sCKodiraHOM6QKlHlNvBrDRc8JEV6FXGf4PLcJl
         zk1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285979; x=1793890779; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUa+ypB/rpt+BZEGHzRfc1ssA4Mdi3dtAcbaRgnbYig=;
        b=QTSEEaqxW9pXmLzgF+byibvhJempK361sLw72uMougOXTPk0OKgEX1E31eViCVf85K
         46k7Pkjs4+RmHCHDih+7zHYub0X0sR0wmA3pywC34xARD3JONfNGMVAL4LH1IhFTsZSy
         qT7/O6+ULQlW5knFfFFH27Lo39hoS1dm7Dh76J6ZR65dBZQCIcnl4cJzChnJuBT/N4vE
         /Yr24OT7f470Xk22ZGa6u6R296TzdP2WeH/hVZSH0LPvooAtnsPfH/0nr1WOxpPB/2Y4
         TyA+69GLbXhZ9mu5JJFSIEzhTcuAZ/2g8AqQG2sTwRNoWVxIwor0dxVNX6bK8lr2nJ5i
         CN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285979; x=1793890779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nUa+ypB/rpt+BZEGHzRfc1ssA4Mdi3dtAcbaRgnbYig=;
        b=oM1cLPUgWtYSt+utRmpRVXrCubt5WlISbN+4iJc6UCzdop+ql3+W1bm5GbcDpNTZM2
         UAr0kxnFWgKYRq0C6eWQVgjGqVgLvm3euBtJblRAbGRQmBEwXFAlVtCPqH2aBp9sYRRe
         XGa5V942NQa5ffDafu0hk8V65SPfbUP6OENEh3Mz8rz/gEulp9lUL4DIV0jarV+isd9x
         pXPZohlAmu+zpE8oMlToIIFF77MwyxKkbNZp+U3YIMGpGk4OfCs5ScdVcLwjxXCuFakI
         cyYJfRpSJhD5GDvrROIvwMpocoHzabFCypZlzpNH0gAQmElQyCwxluyL7wBx/sfp9MUp
         bPEw==
X-Gm-Message-State: AFq9FYKjOq/Mt9nT4HSqb08dGsFtj7O4Pr7Y6kmoR7w/OjqKT1/WwAt4
	i94ZwkzeUsC0RQ6qnfgRsf0NxK/HSB7K5nB/sZWCavJuhF/uh3YR913HeQ5lTOkzDP3eZC9jsAM
	/Sfn6hLGiQeNJC1X/V77jj/XMqYsHsQY=
X-Gm-Gg: AYBFou1xxQDoGQfyxlVQAYhyUM75vBJa3u59/AKwnIWMmc4mSez1lJSg1Fis4aNqTgZ
	MUb8gj8J8TpEcHeJQ46NNRd6Bfo6AVuRpnyG2Xa+plBrcVR9jJjl39SYntgtMZYx/bLcBkjAH4x
	qeAMfVJrIViCVOtcGUDpHtOr86fY1zUpJqT6T4ShFvhv3YZnsmAx6WlhzPFobp39Y0fjlVwiEEP
	qPhrb/Gdpew2+Dk8IVMylcAFdY4yrMZ+/S0/0C5mdq0DFOjIJz5Ipa4nD7LeQj9uBf9uredWt8H
	Pi1fAhYuLzh5Y76dMv8ddUcXhO4JVscXcPdWSJXmiAmAuQdUKORftjGJH+Gs5L07YTBGJ2tHQrS
	b+GVh1rk8WEQaMGVHF+zWjgZy88OnMqTrIanCdeBByCTx52E/OGjZYiMT7UIdBjlaC48=
X-Received: by 2002:a05:6214:501e:b0:919:5a24:d77c with SMTP id
 6a1803df08f44-91c7cf99ea6mr90070656d6.31.1793285979371; Thu, 29 Oct 2026
 07:59:39 -0700 (PDT)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Senna <sennas1633@gmail.com>
Date: Thu, 29 Oct 2026 15:59:37 +0100
X-Gm-Features: AclHuK8lQnX4-x6VPXfbXDMDGreCVfdZy5jVFAhXaaH-x3JOmzyHysCiQMvvSns
Message-ID: <CAOCq4u_iLTRk7RpSA=P63FYkTz=g8+SemaZQuQ3dwny+59+vsg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: ep: aggregate raw buffer completions
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, mani@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

Thank you for the code review. I found this bug by reading the code,
not on hardware, and I agree that the in-tree host setup will not
trigger it.

I will rework this for v2 with the lines you suggest: check TRE room
up front with a helper like mhi_ep_queue_has_room(), and invoke
xfer_cb only for the final EOT TRE.

A question on error handling: even with the pre-check, write_async
could still fail on a later TRE after an earlier one has already been
queued, so that earlier TRE would still be using the buffer after the
caller gets an error. Will v2 need to handle that case, or is it
acceptable to leave it because the write completions are in order with
the in-tree pcie-epf-mhi? I=E2=80=99m thinking of leaving it and note it in
the commit message, but I would like your view.

Thanks,
Senna
