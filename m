Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B20187337
	for <mhi@lists.linux.dev>; Mon, 15 Jul 2024 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721040201; cv=none; b=QFrkr6yQb8rLnSoYofSQ7hJ0PB9vJvvLZS/AWRPsyef19JBX7I7wIsrRHCiZ14MJCwwx8iINCY73jzdtmQgafkWlrJ/hvhGQjwGTZrJ/zr26iOODbqt/uT5jTgVbmjupvDgoGZACrJiMiNfxJ6Q6GI2afJvLckrwZXDCSWzxI2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721040201; c=relaxed/simple;
	bh=0K4pca2vEBWU5NYBgV2Z87t7JJCI7Bs/YEhYZaDDJv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TijoAEvCauqqz6x/9q7WYhf25787H+r5vhB91MEUVefYXCfYcmNZ9XwRxy73vJRqhUyFJEPI/nJUyJD9EdtVudCs4804cYtmFMiJWG+gcLLu7mWRVZUIMuAHsCPTcle6aF63Cwk5gbMptOoz9WwHCu/B5vocx3yCENkd345Mf0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r79Ig76+; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r79Ig76+"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05a61303b7so1512973276.0
        for <mhi@lists.linux.dev>; Mon, 15 Jul 2024 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721040198; x=1721644998; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aMIZ4x5GWNB/IuXvoPEkpFndIdHvoqjyuE6tlVNLnc8=;
        b=r79Ig76+QR8vNiBQ1VF4eINiCLIJjWxbTH72+hB4bB3ZpYI12SdqCGf6WNjRr95EHW
         kIdpr62UTE1HeWgpKCFbp2SaE6IgO3Yj75B4n8nk/4bQmFB1hrpPN73yPwODxWk5LSX5
         auEDO8iWo26/+Y61mb0EqLDdIp5P/D7usIvUcDoLLRvoLay1TxeRgTjpBaHgJhjBeYkR
         w1l7o5ZEhJbszF3Jo5YtG5aj3vhPkU2rVObqLdYDaubyNy9k5CyN9U9ZmPizymGKE8ly
         oajjLbuOtRsGAS3xLaM3v++HwoHl2OSjwoF4bVAVY4DwlCBKIgMBz7OPt/1v+a/+QoEJ
         4VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721040198; x=1721644998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMIZ4x5GWNB/IuXvoPEkpFndIdHvoqjyuE6tlVNLnc8=;
        b=nBZRVULm8xTS+g14hNe5D8VJTwZWMeMYREp5bWSe8lHi7KfWkzIrGdcfD6VRNldDCu
         csiG5wER3oGnsmt0qub7FuYK25N+JWeiTxOeysx76YiMrjARiH8w06P8LvE3xNu8SbXC
         l426sE3d92ddsMsCX4Lm/QGARIosU1PnuqcoH6xs/350HRjjEIVP7TutRYPFeuZfFvxs
         knPPj+ct7VzbkkC2hcIdrTGSigaprhxFldFv4v3UnmWdZStB891Rf5atoDcb11tF2nTg
         zfht/IaEKGSnn2l37wG5COFjVVNQQRZI1l3dR86b3qAkMFUJeQfaRLTtTZ8CxCLdf5hx
         rWzg==
X-Forwarded-Encrypted: i=1; AJvYcCWIlmy5ifQIJXr4iUxvmhXLZgcTjeckcQkrW0u+/gMLGcQhOMIb4PTw22ZCIXRaYGC+qq5wMJ6FOeedi96c5Ix+mspm
X-Gm-Message-State: AOJu0YxEY+T+eERWYC3HrRstZERR0Tv6rAJaeNDYzKm0NKcQWR2jFRRR
	Kr6D29R2J7BA5dWgYKN1OJhr0am3vpI4GL3pAkti5s+z71Y5+8fM4MqwsCyVR5NzFeKyQtEQ4I6
	yeTW3CF9E9aOd+GcmT/u9V/VuIgh/gsrih/KjoA==
X-Google-Smtp-Source: AGHT+IEdJmxITor4+DP0cXXm+G3r7fPKDye0hwA/RbHrnncDjlEqNpYlw08Ebcg/221VFbFOphKo44hUUhrhArDY/qc=
X-Received: by 2002:a25:84c7:0:b0:dff:1b37:8215 with SMTP id
 3f1490d57ef6-e041b07a0dbmr20274956276.36.1721040198288; Mon, 15 Jul 2024
 03:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240709015818.110384-1-slark_xiao@163.com> <dduv77mdqe633m7amyljhqas7nomrtjrrimvmyqidymy3qjvfa@biepierrz5p3>
 <17f0f426.4faf.190b4edaadd.Coremail.slark_xiao@163.com> <CAA8EJpoiOLYMhxyJbdrgnMVfVggL9cOWtX8L__YKd=RPQWOcSg@mail.gmail.com>
 <7036d57d.5904.190b512d00b.Coremail.slark_xiao@163.com>
In-Reply-To: <7036d57d.5904.190b512d00b.Coremail.slark_xiao@163.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 13:43:07 +0300
Message-ID: <CAA8EJprd8pqnw_jVd2u_Sdf1L=SPY3tYojHtN_de672F0vN7UQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] bus: mhi: host: Add firehose support for Foxconn SDX24/SDX55/SDX65
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 09:27, Slark Xiao <slark_xiao@163.com> wrote:
>
>
> At 2024-07-15 14:16:57, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >On Mon, 15 Jul 2024 at 08:46, Slark Xiao <slark_xiao@163.com> wrote:
> >>
> >>
> >> At 2024-07-13 23:09:47, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >> >On Tue, Jul 09, 2024 at 09:58:18AM GMT, Slark Xiao wrote:
> >> >> Since we implement the FIREHOSE channel support in foxconn mhi
> >> >> channels, that means each product which use this channel config
> >> >> would support FIREHOSE. But according to the trigger_edl feature,
> >> >> we need to enable it by adding '.edl_trigger = true' in device
> >> >> info struct.
> >> >> Also, we update all edl image path from 'qcom' to 'fox' in case of
> >> >> conflicting with other vendors.
> >> >
> >> >Separate patches please. Also don't use "we", just an imerative style:
> >> >do this and that.
> >> >
> >>
> >> Do you mean use 2 patches (1 for enabling trigger edl and 1 for
> >> modifying path)? Though these changes are aimed to make
> >> firehose download successfully.
> >
> >Yes. "Do this. Also do that" is usually a sign that the patch should be split.
>
> Will do a update in next version.
>
> >
> >>
> >> >>
> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >> ---
> >> >>  drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++------
> >> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> >> >>
> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> >> index 14a11880bcea..440609b81e57 100644
> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >> @@ -433,8 +433,8 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >> >>
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >> >>      .name = "foxconn-sdx55",
> >> >> -    .fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -    .edl = "qcom/sdx55m/edl.mbn",
> >> >> +    .edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> >> >
> >> >qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn
> >>
> >> what's your opinion?Mani
> >>
> >> >
> >> >> +    .edl_trigger = true,
> >> >>      .config = &modem_foxconn_sdx55_config,
> >> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>      .dma_data_width = 32,
> >> >> @@ -444,8 +444,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >> >>
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >> >>      .name = "foxconn-t99w175",
> >> >> -    .fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -    .edl = "qcom/sdx55m/edl.mbn",
> >> >> +    .edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> >> >
> >> >Is it the same file as the one mentioned in the previous chunk or is it
> >> >different?
> >> >
> >>
> >> They are same for same chip, though we have some variants.
> >
> >Please excuse me, I can't fully understand. So are the files the same or not?
> >
> >There is a simple mental experiment regarding the file names: you
> >should be able to have a single host rootfs, which supports working
> >with all of your modems at the same time, without modifications.
> >So if modem A and modem B might use file foo.bar and the file is the
> >same for all SDX55 modems, it's fine to have it in qcom/sdx55m/ or in
> >qcom/sdx55m/foxconn. If it is different depending on the end-device,
> >it should go to the qcom/sdx55m/foxconn/devname/ .
> >
> For all Foxconn devices designed based on same chip, they can use same
> edl file. This EDL file is a common image of whole FIREHOSE image package
> of difference variants. The difference of Foxconn SDX55 modem A and
> Foxconn SDX55 modem B is APPS image and Modem image. The EDL
> image is a file for putting device into EDL mode.
> So I prefer to use "qcom/sdx55m/foxconn" since Foxconn's device are
> different with other vendors which provide sdx55 devices as well.

If it's common, sounds good to me.

>
> >>
> >> >If they are different, then, please,
> >> >
> >> >qcom/sdx55m/foxconn/t99w175/prog_firehose_sdx55.mbn
> >> >
> >> >
> >> >> +    .edl_trigger = true,
> >> >>      .config = &modem_foxconn_sdx55_config,
> >> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>      .dma_data_width = 32,
> >> >> @@ -455,8 +455,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
> >> >>
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
> >> >>      .name = "foxconn-dw5930e",
> >> >> -    .fw = "qcom/sdx55m/sbl1.mbn",
> >> >> -    .edl = "qcom/sdx55m/edl.mbn",
> >> >> +    .edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> >> >> +    .edl_trigger = true,
> >> >>      .config = &modem_foxconn_sdx55_config,
> >> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>      .dma_data_width = 32,
> >> >> @@ -466,6 +466,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
> >> >>
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
> >> >>      .name = "foxconn-t99w368",
> >> >> +    .edl = "fox/sdx65m/prog_firehose_lite.elf",
> >> >> +    .edl_trigger = true,
> >> >>      .config = &modem_foxconn_sdx55_config,
> >> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>      .dma_data_width = 32,
> >> >> @@ -475,6 +477,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w368_info = {
> >> >>
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
> >> >>      .name = "foxconn-t99w373",
> >> >> +    .edl = "fox/sdx65m/prog_firehose_lite.elf",
> >> >> +    .edl_trigger = true,
> >> >>      .config = &modem_foxconn_sdx55_config,
> >> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>      .dma_data_width = 32,
> >> >> @@ -484,6 +488,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w373_info = {
> >> >>
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
> >> >>      .name = "foxconn-t99w510",
> >> >> +    .edl = "fox/sdx24m/prog_firehose_sdx24.mbn",
> >> >> +    .edl_trigger = true,
> >> >>      .config = &modem_foxconn_sdx55_config,
> >> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>      .dma_data_width = 32,
> >> >> @@ -493,6 +499,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w510_info = {
> >> >>
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
> >> >>      .name = "foxconn-dw5932e",
> >> >> +    .edl = "fox/sdx65m/prog_firehose_lite.elf",
> >> >> +    .edl_trigger = true,
> >> >>      .config = &modem_foxconn_sdx55_config,
> >> >>      .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> >> >>      .dma_data_width = 32,
> >> >> --
> >> >> 2.25.1
> >> >>
> >> >
> >> >--
> >> >With best wishes
> >> >Dmitry
> >
> >
> >
> >--
> >With best wishes
> >Dmitry



-- 
With best wishes
Dmitry
