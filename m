Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E7307AF4
	for <mhi@lists.linux.dev>; Mon, 15 Jun 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516762; cv=pass; b=r+t8G4yA8Vjwf3bHzBdfeNxOyFYB2lle+8zocrrquCd5W3Zj/rl4G/DT8PGXdOBydnldvqoSysZScIkVF2j2yXr3Nbvg418qTf/CDzUgtpdPnLT0fUplt1CgJWAtmjh+GTujKTb7BsK6bIB35zhf+TH8VNfnKTnPQJr8ew9ipSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516762; c=relaxed/simple;
	bh=+0PpjdZOtlZVdHY09clHhkAlxOivu8V467n0BMiBkJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ip00cHRWDEpY0nkvPZaoqbz70TAZHc+HGtCzgDCFr9RRy83GTNYadsG8smT4ZV29JDCvArrJ+0VjNlA4Ywz35fFCJ4//MYpvCjtxQxYlyTdpDLlENWs/lg2RHDf54aG1l8uHeDtEFJoWzrkhbbI1emvwH2jzPyYZTEUM1eHf6KQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6fSUT76; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6fSUT76"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso1061452e0c.2
        for <mhi@lists.linux.dev>; Mon, 15 Jun 2026 02:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781516758; cv=none;
        d=google.com; s=arc-20240605;
        b=dMcFySdXGJcw/94XqM3IPf51L5syRkEbuoy/9yyIOVNfqcI5R4MTWZ4x4EL6U8WhhS
         uKGEi5ABSIc+AYfc5/0tuTZa2x+X/a4Xr/KbqLa0YTb+P9UUaIs9cRNJiAR97FKIan0y
         5Ie8VrwrFPr4epBfL8OAyTy7kPKITawbZ2oCodofiz5xEcDicY6eDhzyrKWH+1B2iW+f
         fbFQEo6EcIllsoFGQk4WjYvyvYmmOpLuZFtwFN9jYncUN9b2ozMsojJLEuWcKc+kyiCx
         Scydkq9yjlqcn2MTJ+Nm//EEKnDliKG8PAD+cmp2n/tpKijEI4V7OgPQUqx5LVZsfnlA
         x5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYEPbdWhREgm72MPD718fjlljpJlC4uJ1ZbrV25kB0g=;
        fh=rGFRxypiv6/QAakq0+d8lcM4v2sHiSix+VOCuFDbeCk=;
        b=M/WtwoND6Bx7ksx306SnCqPdyc5GYMAiElsEL1XyfENmGNdFnuhmEF0QvgDf3AWoVq
         sAItwWjTPX+6ZLtii6Dkq/D9vYgbLYN8liPDM/OjWGrgdBCtpXRSa1JN0JisDVA2qBvg
         ev4pear9QLq6Pnxw80vaRnb2DJeG5rQLpO0Iqb6vVLYuUJV/Ch+W73SYAZut4wvTPtFs
         WmfkPirJ/yBI8DZWX8w3ZmZdlZU73aTL1UZPBG0W7M0Q0o8Pf39Cq1l2Hr5APFZBf0V+
         FrWXpWtRJpbjaligiNcGL1PaHay5dd/++yqj6vkl9tZ3MY3tRWi2uK3MNrEQiMqMB3l5
         K4vg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516758; x=1782121558; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYEPbdWhREgm72MPD718fjlljpJlC4uJ1ZbrV25kB0g=;
        b=V6fSUT76QpxcXFryaQXtnT1zTkBAlvKHw6c5vyF1zKXxy6bNMK1ZKiMgAywjamPQUY
         anpYKul+t6ulHQGBlWCDCTyB91HgedSK/86r3yDlHeQXIKXSMPIZ20gtjmg96Zz37dNE
         erNHeSyuyMfgWgaAu4MW5R/g5kBpA1NKbdaFvZqIfO2f9YlmJ17avw99F3n8HGSO7gs8
         zPVWnMO6HSnaexCGPVeR94EDo039J5+d1NmYR2VOdejU9livSOkkbvkqKJKc9XPgfSCE
         7fxDN1ubZuqx7kkSg+/NTrj5LN4WVVh7resJqIN2jvnE5SSA5GhpTyoyMNjsOC3r7mtq
         zwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516758; x=1782121558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYEPbdWhREgm72MPD718fjlljpJlC4uJ1ZbrV25kB0g=;
        b=A9wiBitP7JFgOr6MJS6gFNfYuvfCjGoF0/cM1vQESQn7gDovAnY8DZmCtrLGxQGGXt
         z4TxeEgPzWnd7NhkNvw9BTopy/GZwSZ77lH8LJaZdsq1rMGexLKepwOg5i+PusHmu/ji
         VhAgeQV4+l2FYaAXbpy8iPRsRNR1gQb5916pohZIS5DQ7PFW/vtXPUJZLHdWr69DDxp0
         p0gmbU83Lfmy/Xp1gwosCWt8OCpVPE2iq+7ZZ1U3DE38B6uis6Nr864jBPOVsdR4ULfL
         m/k1i7oYbR+AFeGYyWWK1iCUDxD2RTS1rKXqsDGjkPd3HpQtIQ48+jSCLJPDTnsonykV
         95LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OVhTatHpFNHzRIpIdEGSSW8x7Wokhecylf9dG5yaJz7RzjdbuApDngVP8S1b26CO1gQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yznihgs9FKKrKGXOFLkhK3F5MoR8XG1k2aFENHn/MAE4DXTbDqt
	Y9fd0/6kMamI1LfJBwiTMhsNArvypBZxyw7WwLMUFmOvOd1gYquEExQH++ZhkOrqD/rbohwJ3o1
	45da3igU9HH/8gWlaJnq2nl70B3BPTgo=
X-Gm-Gg: Acq92OENC1PBwTFGHzWJpZ47NVUKG4EnXO7Kvqm1njb249dTg7HVPu+8Rx01r8qSJWh
	LZT8TI22UsDz3V2wsr3OZBy4UY6bqJ/pDtVD2RmA8kbv0DixUWzjXWzjU9tFU8CiLF7BOm7HDpl
	Hry/elfwOaTgAPn7uPQpR1CNGxZwLEV3Dmwj9IhUo6F3SBP/luYIWa9nYsv8RN2YRxFdU03K50J
	88AxEo+EU+SdhWtzu6ik8e6rBVo4UOijsKsPjM057LPtRQCMl4ZjXkNhKZSVCIsdvQSEfWKDJjX
	rM0AYWsa
X-Received: by 2002:a05:6102:5707:b0:6cf:37fe:2cb with SMTP id
 ada2fe7eead31-71e88e0816dmr6614649137.27.1781516758273; Mon, 15 Jun 2026
 02:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
 <20260603011333.3306102-2-qingtao.cao.au@gmail.com> <0d3e4046-42d5-4f91-be85-8681215e84b4@oss.qualcomm.com>
 <CAPcThSE7wY7Zm=H5npSdCqnEFv0VEMP=3x8UkyJqwfqyEscBsg@mail.gmail.com> <cadb7c5d-d856-4217-9c02-98ba37713897@oss.qualcomm.com>
In-Reply-To: <cadb7c5d-d856-4217-9c02-98ba37713897@oss.qualcomm.com>
From: Qingtao Cao <qingtao.cao.au@gmail.com>
Date: Mon, 15 Jun 2026 19:45:46 +1000
X-Gm-Features: AVVi8CckJ1lCxpYrUd1VTz8eVNyssy9HrHtsI7IzkAAEjS2Kc7y0CraAYBtWLfI
Message-ID: <CAPcThSFP6RkBhXt_GVpSbRKzFmb9hzMYPY8R-tjv-iYhZVThnA@mail.gmail.com>
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: mani@kernel.org, kees@kernel.org, linux-arm-msm@vger.kernel.org, 
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>, Qingtao Cao <qcao@digi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes indeed, this is exactly what the original commit,
44b1eba44dc537edf076f131f1eeee7544d0e04f, by Loic Poulain on 2021 Jun
21 was about:

    On graceful power-down/disable transition, when an MHI reset is
    performed, the MHI device loses its context, including interrupt
    configuration. However, the current implementation is waiting for
    event(irq) driven state change to confirm reset has been completed,
    which never happens, and causes reset timeout, leading to unexpected
    high latency of the mhi_power_down procedure (up to 45 seconds).

    Fix that by moving to the recently introduced poll_reg_field method,
    waiting for the reset bit to be cleared, in the same way as the
    power_on procedure.

Thanks,
Qingtao

On Mon, Jun 15, 2026 at 2:07=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
>
>
> On 6/11/2026 4:29 AM, Qingtao Cao wrote:
> > Hello Krishna,
> >
> > Thanks for your reply!
> >
> > I am using an old 5.17.0 kernel and Sierra Wireless EM9291, the MHI
> > pci_generic.c driver was modified a bit to support it,
> > which is very similar to EM919x and the modem_sierra_em919x_config
> > descriptor was reused for it (thus the timeout_ms
> > =3D 24000ms, or 24s applies)
> >
> > Without the proposed change, the AT!RESET handling will finish after
> > timeout in 24 seconds, whereas with the change,
> > the handling can finish in about 11 seconds
> >
> > I was inspired by another earlier commit to fix MHI_STATE_RESET handlin=
g in
> > mhi_pm_disable_transition().
> >
> > Warm regards,
> > Qingtao
>
> Looks like device is clearing reset state, but we are not getting any msi
> to trigger mhi state event. As MSI is not expected to send msi from the
> device after clearing MHI RESET.
>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> - Krishna Chaitanya.
>
> > On Wed, Jun 10, 2026 at 10:40=E2=80=AFPM Krishna Chaitanya Chundru <
> > krishna.chundru@oss.qualcomm.com> wrote:
> >
> >>
> >> On 6/3/2026 6:36 AM, Qingtao Cao wrote:
> >>> Bring forward the idea to fix the power down latency in
> >>> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
> >>> so that the transition into system error (triggered by AT!RESET)
> >>> won't have to return only after the timeout of up to 24 seconds
> >> Hi,
> >>
> >> Generally we should not see this delay, as device is actually clearing
> >> reset. can you give more details what is the device you are using and
> >> kernel you
> >> are using etc.
> >>
> >> - Krishna Chaitanya.
> >>> Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
> >>> ---
> >>>  drivers/bus/mhi/host/pm.c | 14 +++-----------
> >>>  1 file changed, 3 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> >>> index f799503c8f36..9d29f1591a45 100644
> >>> --- a/drivers/bus/mhi/host/pm.c
> >>> +++ b/drivers/bus/mhi/host/pm.c
> >>> @@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct
> >> mhi_controller *mhi_cntrl)
> >>>       /* Trigger MHI RESET so that the device will not access host
> >> memory */
> >>>       if (reset_device) {
> >>> -             u32 in_reset =3D -1;
> >>> -             unsigned long timeout =3D
> >> msecs_to_jiffies(mhi_cntrl->timeout_ms);
> >>> -
> >>>               dev_dbg(dev, "Triggering MHI Reset in device\n");
> >>>               mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> >>>
> >>>               /* Wait for the reset bit to be cleared by the device *=
/
> >>> -             ret =3D wait_event_timeout(mhi_cntrl->state_event,
> >>> -                                      mhi_read_reg_field(mhi_cntrl,
> >>> -
> >>  mhi_cntrl->regs,
> >>> -                                                         MHICTRL,
> >>> -
> >>  MHICTRL_RESET_MASK,
> >>> -                                                         &in_reset) =
||
> >>> -                                     !in_reset, timeout);
> >>> -             if (!ret || in_reset) {
> >>> +             ret =3D mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs,
> >> MHICTRL,
> >>> +                              MHICTRL_RESET_MASK, 0, 25000,
> >> mhi_cntrl->timeout_ms);
> >>> +             if (ret) {
> >>>                       dev_err(dev, "Device failed to exit MHI Reset
> >> state\n");
> >>>                       write_lock_irq(&mhi_cntrl->pm_lock);
> >>>                       cur_state =3D mhi_tryset_pm_state(mhi_cntrl,
> >>
>
