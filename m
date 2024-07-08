Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672F6F2FE
	for <mhi@lists.linux.dev>; Mon,  8 Jul 2024 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432640; cv=none; b=Gsw+syrqNSz9Cbiy54zhf0XY1CCjb38juAU6eueGDIlu4Zf9Ybyjk2Z60S20zis/l+NPoWhZPRfH66HZdA8r0H1DRenQWn47/mu5+FvV6+tQpbeESB9U/tPMs3YbzJVNoUZjqcr9QmpV6dU8JQy3B/BtLNWmjhr7ungH8EhA5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432640; c=relaxed/simple;
	bh=kzpWgPQ+AXdJhpF4uskYQiVLH0Y4/sXVd8yVxupMt1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5YrBbFSV+dFjqg0AE91wXn9xT6aOIKOVYJRuorYQKpOlOigtfod99d4QmxfFwN9c9wVSQP0OmLaHTiXFxyHvr8mbZf9FAA2kT2+3zDmq3UcX1hj7Yl1pM+GllV4pZDGHchZttdZ+1F5Ou8Y0E4IvqU5w1OvN/NcV06jtXDiXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikznod2F; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikznod2F"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4f30734057bso679113e0c.1
        for <mhi@lists.linux.dev>; Mon, 08 Jul 2024 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720432638; x=1721037438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugUUhsmVNYwQtoTbN64bwPW2B/pPcC78bhF0bEn6TGc=;
        b=ikznod2F1CYBoLjgZrgft3yzYuWFHVma2zvphJXRg+VqAZzF/k4zy20mVM4H1Fuc/E
         f/JDyv+CjV7eRHZ1fLlOrj/r9bq70UiOr9qXQIIJyZQlTpYce7NWCoTt6k59NOvhkpD9
         T6KVAddSCIl9vitTAmX0PPN3016CMM9rkTAxw22t7Rvyb19rCdfF3sPqThBeMbajnBUP
         jflbJiOu4TNjHfpUCh2iA7mvrgLpgIlOuLnAybSy9fCz4pk/ePMoESSGLvBOoRPsAv8q
         1HgNVvM48Lh52tWOFqy0VT7WFXd9GlzPwnJBLJFcwcyeZN65viVh4/3J6RhSkoX8Yj/M
         tzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432638; x=1721037438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugUUhsmVNYwQtoTbN64bwPW2B/pPcC78bhF0bEn6TGc=;
        b=v8eqRjsFi9LELHgxSL9Dv9IuX8DI9Xgq6Q3X87rHCdH12LLJzaKhDo23WM4LDBGR+2
         JKHmAJ743gLy5o8Z5WPIVhxEjeVrwaTchzBUP4Dp/FvLKOVOrG4zJp+5BKKRBEYzzubh
         zLaX2uQHrWYM5QZzFV5dt1j8B61hKcNgrYG91xKvxJhKQPWFBngaPftClOn12sFUOH+9
         jgcpCS2SK81ayE7M0BirCRgPx/ybz8h2x4y3+88JLoLO0APsLg+xBnSlZNmJiM37DNdz
         HNuieHV9mY2TgJtUktxe0fj44Hb4VCtT9fza50D9zaYXVMzZckNKq8l4WZ5FfgTZtNUE
         +7+A==
X-Gm-Message-State: AOJu0Yzt2ItUL4GZmFXWyf+YPwvkGuhNiAreJVViKun/tYJh1rph0moV
	IEfPmNGoYdzR8cqtUcKZnVO4Z7t4VmNRl0whkQVDBTlO/FO/ffUlGzkjTY4ZeZRovcanm+e+lXj
	Q0Aoq0e9V7dD6o3+b2MrXPD+1EB6bjW48FaYY0g==
X-Google-Smtp-Source: AGHT+IEM7tiXc2WC9v3MUVQR0LfIGg28NNDwkISptdBpTomakMAfCWq2f7yHwbjnHv81VCajycO06GXEQ2aAsGQJIv8=
X-Received: by 2002:a05:6122:d22:b0:4f2:d451:97da with SMTP id
 71dfb90a1353d-4f2f3ff73a1mr11538359e0c.12.1720432637678; Mon, 08 Jul 2024
 02:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>
 <20240708082132.GA5745@thinkpad>
In-Reply-To: <20240708082132.GA5745@thinkpad>
From: Murithi Borona <borona.murithi@gmail.com>
Date: Mon, 8 Jul 2024 12:57:06 +0300
Message-ID: <CAHCJQqGPtSHx5LbRF69CJ78x7TwXt332-8cMwXrpVyPWURVFhw@mail.gmail.com>
Subject: Re: [PROBLEM] bus: mhi: host: pci_generic: SDX24 Channels
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, duke_xinanwen@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here's the sub-vendor/device ids.

Slot:   0003:00:00.0
Class:  PCI bridge
Vendor: MEDIATEK Corp.
Device: Device 7988
Rev:    01
ProgIf: 00

Slot:   0003:01:00.0
Class:  Unassigned class [ff00]
Vendor: Qualcomm Technologies, Inc
Device: SDX24 [Snapdragon X24 4G]
SVendor:        Qualcomm Technologies, Inc
SDevice:        SDX24 [Snapdragon X24 4G]
ProgIf: 00

Duke,

If it helps this is the modem firmware/config as seen by ModemManager.

manufacturer: quectel
model: EM120R_GL
firmware revision: EM120RGLAPR02A07M4G
carrier config: ROW_Commercial
config revision: 08010809
h/w revision: EM120R_GL

Full Firmware Version: M120RGLAPR02A07M4G_10.010.10.010

On Mon, 8 Jul 2024 at 11:21, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> + Duke Xin (who is adding Quectel modem support these days)
>
> On Sun, Jul 07, 2024 at 08:23:57PM +0300, Murithi Borona wrote:
> > Hello,
> >
> > Module: Quectel EM120R-GL
> >
> > This module does not appear to work fully with the default SDX24 config=
uration.
> > It appears to be another variant of the EM120R-GL (Also FCC-Locked by d=
efault).
> >
> > Issues:
> > - Debug ports are missing (AT)
> > - It only works over MBIM/QMI with Qualcomm's RMNET driver.
> > - In QMI mode it's really unstable and unpredictable with the QMI port
> > freezing up.
> >
> > Are there any missing channels in the SDX24 config or is this a hw/vend=
or issue.
> > When using Quectel's drivers (and blacklisting mhi_pci_generic), all
> > the ports are available.
> > The configuration for other variants of the same module brings up the
> > AT port ( with a recurring warning/error).
> >
>
> Most likely this device is a derivative product that needs a different
> configuration than EM120R-GL. Could you please share the sub-vendor/devic=
e ids?
> You can just share the output of 'lspci -vmm' command.
>
> Duke Xin: Are you aware of such derivative product?
>
> - Mani
>
> > >> [ 5074.472791] sequence number glitch prev=3D1 curr=3D0
> >
> >
> > mhi_qcom_sdx24_info
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> > Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> >
> > ports: mhi_hwip0 (net), mhi_swip0 (net), wwan2mbim0 (mbim), wwan2qcdm0
> > (ignored), wwan2qmi0 (qmi)
> >
> >
> > mhi_quectel_em1xx_info
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> > Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> >
> > ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim), wwan0qcdm0 (ignor=
ed)
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
