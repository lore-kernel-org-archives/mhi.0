Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F94361647
	for <mhi@lists.linux.dev>; Fri,  3 Apr 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775212223; cv=pass; b=qwA7eclbDDxTBgA+zP4JJd3RY/Avf19W4kfdB29E+ZxahFCWVJDShYyHMxWBnpjqRatp0cPT9ywVDuIwaf8SHQMVxBc0xogzwZFLnz4m1HO+PWnW05tGCaL8qOYSTDnxKYPU0fbCkeGAe5D57jKM2bZ3Tkt1IPMpNueo4MrQZCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775212223; c=relaxed/simple;
	bh=STsFR/UHAkhtYtAgZAkUYB/koSz8ZWnK/K0al7zsLJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IaDSW/7mlVkdgywu7QHm+yKPxYG4gvwtzye4antu1o3rrFVAIyavAtyxxP05pbLgPag4H8Upsy7UZ4MTXhFV+Ml4x33bAJHQ+qMnz0QZrDj+EXCw647XyHWq/TSfuwCbXa2QdSRF/vUparyPeZjaFdL9fgnrtHOEqA+RR9p+/Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEQI8Kxu; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEQI8Kxu"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so1543849a91.2
        for <mhi@lists.linux.dev>; Fri, 03 Apr 2026 03:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775212222; cv=none;
        d=google.com; s=arc-20240605;
        b=OjIi60w+Znkd1TWxyL4sxmZhD5A/W6fnzK9OuoZb1vS9sC2/Bpp8pdTvCPMNVp9RfA
         rVP5f4lXgvYqOj4ra0YEwaP94Pw+J65gYvLaROL/cPF6J4fpynwolpGQoN5RxPn9SRbD
         HhevJ1/YGBnijRTqIqa87janh1hNC0mQS2Rc+W2JI9RVkpdfnPc036Xm7aGUkeYN1LTw
         im3DRA85Jlx/wSx62x/qVpLjkTIT2dBmFxsgEYPBY2FziSroRCQdPwkEGZWEf0vOOmrw
         FFxwndfW5X9wfGX/yJQXQrHKTAauhKY+Xj/4QgOfWY4hxidM5nQRtKpn6euvRqJF1ZUS
         JwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Hzajg99Mhp2c9ByHP0Xe3Y9VLLKDV2Umj6Go3saTK6g=;
        fh=jzinDtpulrBZeawIVShGjGMqk1NfMBSOmtE/w+NUMK8=;
        b=hEtnEPITReZtPvGQM7MgaQ0GN250JAE7v86tnT92R3kt1+hV0f7cEpkVnPq+fGAcJ6
         x340+K1rzVuYaHU9uo3nk5ECKeUX7i1H0lyqj1PFmC1iYsGg1OR6XQjFxQgusinL0Bbw
         HtFyMB2jzqdtWfRZ9+BiVSN5OSj4FKtw40ZOGzVQxn6gXX5SSLnJRDcYm4oeD8LmPij+
         wwbLdbMH1Z8bKXFKyHmf2RQ10WxDFmJDRtFoymDcw8LIepj1CwQps/VNZCLujpDv9ufM
         jg1PmT7ndk6iqjRppzElrvUDezyzmuB8bdkP23ynvEMYBjx43R195AXGH/4LDNxV3GW+
         cwBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775212221; x=1775817021; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hzajg99Mhp2c9ByHP0Xe3Y9VLLKDV2Umj6Go3saTK6g=;
        b=hEQI8KxuhbGzxmyve542p6FCA4726hRpkCOMsP1TmqH8650rJ7lJeELyVwzicNuYXI
         KoY9sS9o45tWdHPMXJPl8Ib7p74E8PmdD/JnTXwhnh1GipjENxVP0Wh47Wfv7vbVZbzT
         NKZ89rCDJnqLjKF9VT+H9esZeFMOl983NylR02qUamAvHOYs5sxvPiCUDWrRvmacZhVk
         xWxpb3Gcq+x3wzAnQq+CDJwG+kxzVSxC0tY0av3vEZkaPq0NobRL8kQpsz3dp3g4h1ih
         2uBCOQfMa3aJLhEePMxYHchM4zgvuxf9jzHLQuhWrOll1byzCvixGc2IJHmHQ96VPwdR
         Jk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775212222; x=1775817022;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hzajg99Mhp2c9ByHP0Xe3Y9VLLKDV2Umj6Go3saTK6g=;
        b=RdX92v5aO66GGj9yz/GZV4hGwFC0A5jhj82H/seE8csDOtH7ivpz1klg8WxK5TtshX
         w8a7OVHBRHJAJSuXBi+jnYM7J9+tzocSvdRqcyLgz5D13oo3IblK58RzbOzSoKQApHTM
         jppKxWYpktr3Zf58+uxPFpBBM3qMRuVjmPvjhy3RxlBl0fuNCxHTBmHjvQymP1N2kNzU
         2uuafryQ1omnt8UpKwhl7x3Sylzy5xz+pv/ip5vlzm6BfgVG65fwYfgX8NZo1BsXB0uz
         AqtzQAvqQ1I4HfI3wm2b0fGJW4HtbDh7ziDAJ7pQw0doOnDkT5+79eC6QXK0M/vd5crD
         7beA==
X-Gm-Message-State: AOJu0YzSawH53zz2kydaLCNtyJO91vtlJHK0Utareee5eBsgzuHIuLbt
	yYEn3lk213t+es/QnLg/bkSR/vG11Gz1deoXcR9z5FSDJniGNCgkJGFRuFhEDKMd/Ie5urn/uk7
	r48//xzNmETvzaV2aYKhAc2z6LxIZhYvmRotWPpC5qA==
X-Gm-Gg: AeBDiesT/X2VVRwg4sh2EJgZr+kageLnvkPIJZxTf8Cp9+4tWy3W3T3mDyj0O2fWldm
	detLL0ot57dMjgowp3/J7h8WN7ZquLRVnf8cgA/Y21fJh+hv9/bASovY4RSalWH0IAvZn5+OO2h
	tCZGM24gEM4HOGXAvALf7GExjTdGzT2G04VJ2Sgnr0deFSmMxtx91QAN5X1OGgkkc0Gq3zwpy38
	5Ocqe4aqAetZulpBWpohYyqLozeiQ7S4BspOqxQ9i/xNgT/cpMFFquxmVvQm9gbaPZEmhukQlng
	byQ58hH0LFeT/E0c1jnk+9oKY5kDpy8j7cgUMb95E/1hueq1cq7s
X-Received: by 2002:a17:903:283:b0:2b2:67cd:9963 with SMTP id
 d9443c01a7336-2b28194c2bfmr27371405ad.38.1775212216456; Fri, 03 Apr 2026
 03:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACixm21PgogxqCRSWHOaj2J5VmSphCULi5Lz2nMbGp6zb32beg@mail.gmail.com>
 <CACixm21E8g-k73HpPMQm2AjEu=PDONe5t0XhAHu3kqUMkYkrLA@mail.gmail.com>
In-Reply-To: <CACixm21E8g-k73HpPMQm2AjEu=PDONe5t0XhAHu3kqUMkYkrLA@mail.gmail.com>
From: Javier Achirica <jachirica@gmail.com>
Date: Fri, 3 Apr 2026 12:30:03 +0200
X-Gm-Features: AQROBzCwSzIKnTE9ia5S0705Vi6sKZ9x7_zPn6bwq-BCR0SHGRQRGlBTp5mhKSk
Message-ID: <CACixm21q7b_diEx5COZxVZm9EhZ0hnakM_WBjEWcCsznfWeniw@mail.gmail.com>
Subject: [PATCH v1] bus: mhi: host: pci_generic: round up nr_irqs to a power
 of two
To: mhi@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When an MHI device uses standard MSI, the PCI core requires the allocated
number of vectors to be a strict power of two but devices will only ask for the
irqs they need, so they might not be properly aligned.

Make sure a power-of-2 number of vectors is requested.

Signed-off-by: Javier Achirica <jachirica@gmail.com>
---
diff --git a/drivers/bus/mhi/host/pci_generic.c
b/drivers/bus/mhi/host/pci_generic.c
index 750da3dbb4c6..d6477ba4b4b3 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1189,7 +1189,8 @@ static int mhi_pci_get_irqs(struct
mhi_controller *mhi_cntrl,
         */
        mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;

-       nr_vectors = pci_alloc_irq_vectors(pdev, 1,
mhi_cntrl->nr_irqs, PCI_IRQ_MSIX | PCI_IRQ_MSI);
+       nr_vectors = pci_alloc_irq_vectors(pdev, 1,
+                       roundup_pow_of_two(mhi_cntrl->nr_irqs),
PCI_IRQ_MSIX | PCI_IRQ_MSI);
        if (nr_vectors < 0) {
                dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
                        nr_vectors);
