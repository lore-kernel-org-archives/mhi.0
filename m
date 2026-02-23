Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53B30595B
	for <mhi@lists.linux.dev>; Mon, 23 Feb 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861900; cv=pass; b=QnwR+scjnuS9HhGr+LCtHRI+RjZLFnOAfM6vV9RUlP3GlilTKJLa1+pNTX9lyDXUdJ7QrL3b2q0WYfZHb5Or9eqDouxV9CLrrZ0Q868+tprvEF6GZ4+rVzWUk81gLLCzI58JSOyWZaw0rfbkIhfQ9nHl039eL0NqhPRRpsOOuhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861900; c=relaxed/simple;
	bh=d5zCa3ysNLijKNaGOI7tuajauNFQ8GHfuuwERS7PUF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcyuoRyRmyvAiGpjUqg/PGylJeL40Ern/CKGuOgZFC9HvNm1c4guq4yk5Ym3aL9UwSod2lJpkkgx9UFSXptmUUMX0um/5RshN4HzPEXL7ck8ojRHpQAM2x83zkwdutITV/w49J31w1OBiA2rre4xKdj5a1+KRzuxWcBjGbdZgG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ65wYz6; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ65wYz6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f96f6956aso617292066b.3
        for <mhi@lists.linux.dev>; Mon, 23 Feb 2026 07:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771861896; cv=none;
        d=google.com; s=arc-20240605;
        b=DZziAqCQy6c3CPiebBCFO/cagjbrl7neCL1/GKvBDZkVOGZTJiP2TJ6zMYvcn5r5S4
         FLXYRWzwB/ngxd2DVsG1XKpYyK7AQ2NEGJgWcYV+5S/oWuxWxKmnRQYfCFJP5m/6j+sH
         CVtwhAr/VtAaZ5BFiGqBZDE2R216Mp8iYkaVvEE1eOlH4CeXnqzhcmVppqG2zCPKYKTB
         hH08lecDreOS8mll8HYn+ioUhGLA2IwYVc6vaBB2w6dmu+W95SY2zQpLxCSBwNrnFWIW
         dpVR2Dy9n8S4QuBiDMG0bVL7qyBJQOVD7V+HAobECTHFkqcd05ZuiIJv4xXk0YknwwUL
         woFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        fh=WiktqhpIYI/zrmURVMzHVkX76v5/Z+eWRHXWxsRmoyk=;
        b=fQEmVwH52ySHiYEAgHDxT5OYJuptUf5bj9poQtRS37EFjg7J5tNYYDLv2ZmVTa2z6Z
         Y3rRKksIfPj9+VexwPF6W/AWAREQMR+AZBQnWdWwNa2y/VRugqtZPl8+RsMn867TGaQk
         7DJU+gx+ODBZd0eL1YdIdmK7qwfowuey4Y4DchCtu6eUFwHNrHdpPAE544wiYqcsiyz4
         uGoIu0Ey7ddFVB6rREkq2kZQNXH3fQFMavaVFK7GTmZU2DtG170hGh7LPIMtMSprga6v
         VL3aBnwBFjyO+B7rQEKm6XP6No4MajVVZ9z8glLXDfAlbkuQj+7erZ2WRdy5nQb+2Zb9
         WY9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771861896; x=1772466696; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=LJ65wYz6V0Ewp3RFifSsXbANZB6t5ldCsTpObnFVX9ryd/UDihw4YBq1qkNGcvrwd6
         a5R5+pRGtUsILKPOOMphucyF3jOg/t4o2GjX53JnAlfO8CaQVKRPlpUZ5S0pROZx8cg/
         tcVfYbTI7wKv6fC5I1uTAcy5E3N6DgsKAWb6fzdVVlbD7dCnojp0cqKRXLbXPd6KMbXP
         9I86jbUptgUjI8TVLtnbgrVPr1nH1M8heprYlJlAVrsDenazawy3guUIU+dreayGzNRM
         QZZnkc4eyTRbeEcdNHk1CCrVtg2/1xi7R4bu+um2owWw/RATUTnlFeKp0HuaknVRjEF4
         RZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861896; x=1772466696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=Tjg6pPkIdsInYuZopvjiyvvA+GO9BXKKi4vNeP0CvGoWYkYpPVVL9psNaN/GMJqCJk
         R0L9agbfpm4DCd3HwuUEmPPcocNUndftsynFQHjhJ6gejEhhCMzvmnoQBQPwFdgQznB1
         qHLSc1RewD/dLM2BYObu0eouJ3XSMPj545X8myVfVmYCzQmPitiNKknnll2JaOv41B8Q
         NoUHGkUzdfHgSxVEMyvyi9Wv0gKnUbT8Y1s4DbltuOtIhlfKwornxdgM+F+snJvCt90H
         suKrq0B7Fs4dpZeqlJOYl5AnQ66Lsm5QWh8ON7b/tsjvMl4vpEQWHC4SLn18Jow5TpXz
         Y7yw==
X-Forwarded-Encrypted: i=1; AJvYcCXuxysS6j3yoAhXPC83bYJ8bK9LBccVIrnKAuVudNKVbohughPv+yhtX6bybTxV9CsvI1w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4qVIjMXG6g3pDqvZgqaf6kApMtWVe36opBfMe4su+272L0WK5
	EeiKJs0VdWtnNkiGguSnGORZNFB5YI+wv0FeEryUE5W8j/PIuN4W2mLLMzApsek9FSXwiTOo5qu
	4qb0xweGGCggSa96ZtujqiGTDYG3Kf/E=
X-Gm-Gg: AZuq6aIPFL2sVgkoWa40Yhe1kyNJox7Q+3CN62GtFErOfBpHGKHxsdoMrr+kErf2Yyq
	w8Fjib8QAigDbZvxCO0+VGSR8s8FEo3S5AYzYyuQF5YWqeU15Ge4fdfeIwDQMKx0rRQyo86IOJf
	TvKdFecUPj4phR+Y4PsmTVSatfduKbYfMSkeNrbirMLL194iXiN2zci0Jh0MiSHZuePlQq6ftXd
	1gev2+zxxgWgTfiuBYbJba2bnHSeT9AZReVy6cdQu9hI06/jKvd160IS8Wj/Mm16DvXTa+GCYbg
	MGB0I3oiVMsS2TdGVffyzuyXlnHC6GLNcgfWiOGJeLz1SdRjSmOYaLkv36gCQX4GJLQilxU9GWP
	CEd0ekoA=
X-Received: by 2002:a17:906:5ad6:b0:b8f:e424:ae56 with SMTP id
 a640c23a62f3a-b9081badd6emr413937066b.44.1771861895691; Mon, 23 Feb 2026
 07:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Feb 2026 17:50:59 +0200
X-Gm-Features: AaiRm51McMZohKyigNQFIbQDImiJ8vF_g2F0DjapyVKPe6Rkgx4x17MorqEdw1M
Message-ID: <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, 
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Even Xu <even.xu@intel.com>, 
	Xinpeng Sun <xinpeng.sun@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>, 
	Lizhi Hou <lizhi.hou@amd.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-i3c@lists.infradead.org, dmaengine@vger.kernel.org, 
	Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org, nic_swsd@realtek.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-usb@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, 
	mhi@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 5:32=E2=80=AFPM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> This patch series addresses a long-standing design issue in the PCI/MSI
> subsystem where the implicit, automatic management of IRQ vectors by
> the devres framework conflicts with explicit driver cleanup, creating
> ambiguity and potential resource management bugs.
>
> =3D=3D=3D=3D The Problem: Implicit vs. Explicit Management =3D=3D=3D=3D
> Historically, `pcim_enable_device()` not only manages standard PCI resour=
ces
> (BARs) via devres but also implicitly triggers automatic IRQ vector manag=
ement
> by setting a flag that registers `pcim_msi_release()` as a cleanup action=
.
>
> This creates an ambiguous ownership model. Many drivers follow a pattern =
of:
> 1. Calling `pci_alloc_irq_vectors()` to allocate interrupts.
> 2. Also calling `pci_free_irq_vectors()` in their error paths or remove r=
outines.
>
> When such a driver also uses `pcim_enable_device()`, the devres framework=
 may
> attempt to free the IRQ vectors a second time upon device release, leadin=
g to
> a double-free. Analysis of the tree shows this hazardous pattern exists w=
idely,
> while 35 other drivers correctly rely solely on the implicit cleanup.

Is this confirmed? What I read from the cover letter, this series was
only compile-tested, so how can you prove the problem exists in the
first place?

> =3D=3D=3D=3D The Solution: Making Management Explicit =3D=3D=3D=3D
> This series enforces a clear, predictable model:
> 1.  New Managed API (Patch 1/37): Introduces pcim_alloc_irq_vectors() and
>     pcim_alloc_irq_vectors_affinity(). Drivers that desire devres-managed=
 IRQ
>     vectors should use these functions, which set the is_msi_managed flag=
 and
>     ensure automatic cleanup.
> 2.  Patches 2 through 36 convert each driver that uses pcim_enable_device=
() alongside
>     pci_alloc_irq_vectors() and relies on devres for IRQ vector cleanup t=
o instead
>     make an explicit call to pcim_alloc_irq_vectors().
> 3.  Core Change (Patch 37/37): With the former cleanup, now modifies pcim=
_setup_msi_release()
>     to check only the is_msi_managed flag. This decouples automatic IRQ c=
leanup from
>     pcim_enable_device(). IRQ vectors allocated via pci_alloc_irq_vectors=
*()
>     are now solely the driver's responsibility to free with pci_free_irq_=
vectors().
>
> With these changes, we clear ownership model: Explicit resource managemen=
t eliminates
> ambiguity and follows the "principle of least surprise." New drivers choo=
se one model and
> be consistent.
> - Use `pci_alloc_irq_vectors()` + `pci_free_irq_vectors()` for explicit c=
ontrol.
> - Use `pcim_alloc_irq_vectors()` for devres-managed, automatic cleanup.

Have you checked previous attempts? Why is your series better than those?

> =3D=3D=3D=3D Testing And Review =3D=3D=3D=3D
> 1. This series is only compiled test with allmodconfig.
> 2. Given the substantial size of this patch series, I have structured the=
 mailing
>    to facilitate efficient review. The cover letter, the first patch and =
the last one will be sent
>    to all relevant mailing lists and key maintainers to ensure broad visi=
bility and
>    initial feedback on the overall approach. The remaining subsystem-spec=
ific patches
>    will be sent only to the respective subsystem maintainers and their as=
sociated
>    mailing lists, reducing noise.

--=20
With Best Regards,
Andy Shevchenko
