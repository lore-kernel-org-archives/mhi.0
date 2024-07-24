Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FBE157461
	for <mhi@lists.linux.dev>; Wed, 24 Jul 2024 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721827737; cv=none; b=WNPNfW4F7D0om2gwEy9qTiTia+1p8qFBwEI5wTUWPfC+7J5pbJ901btW9l7Whe4/D42D64goGqB1+gHxWOw5gMmgNuZuf4f6e7UJY70MnLabMNySj90klZncs3Kk39dqcFtkF16wp2m2dV9eHFsMcM6EnZrcl3pdKY5gVTDzbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721827737; c=relaxed/simple;
	bh=NbryZMNi++9IyWDKCW43oXUTr404zUv0RT78qB3Do6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evrPTHDFIUZ1awuzri+HlyNltn1l8IDbr3ENEqGVadAm7mLyzBNnInmlnomIUZc4kgsqFZ4ZwPjefTB1kQS6lbKpZvdUJtMPp9X3QytHAaRiv3xybim8PRpoObqkIkTxsJd4CRojNMhpHX2VaeKtoM5tRieFp+/GWosXKYQ6KR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNtrcHF8; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNtrcHF8"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso2316707b3a.0
        for <mhi@lists.linux.dev>; Wed, 24 Jul 2024 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721827734; x=1722432534; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EK7J1tmmD0LeVUI1TCcORLh7QZq/9jUNRzduMUl+rUQ=;
        b=lNtrcHF85tyNsptNAZBEjhqx3WDdI7aVN7Wlcdr4NiVQ/0zbXdywoGaqrgapmJQrK1
         Is7V46AiEhaVjKLZEPcX6FqjhaHdQFzxIbMr/WzgU5vZzoiGQmXIU5MMyqxEveaPwRxP
         ZsAz/h63l9cBhovLUuV+q2aJMSwjia9LEdroW2htUwgT+kXJp9eDK3VL/CE8uN3taNan
         IDxBCTJR8PHIqIopYDSezkQsdvwBEqRADl2ml1fCwo4yVBZ/iK/1wtWmN9kh6DsKi3A4
         pSADaZ6FsfDnvaR7qgwPN8OCXMRqJVE0qwz/2o1fM9N+8WCgq2PzrUGo+baA1gLYDUjG
         UZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721827734; x=1722432534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EK7J1tmmD0LeVUI1TCcORLh7QZq/9jUNRzduMUl+rUQ=;
        b=TglzJF8lVF69ajdJy1scLKfggYmzmjc7ZpeBD8ksq1t/eObVKLXiwOOOch8L2OELjv
         cIpw4ZKmbRpsBW5IJWSVoaSgcAWxUFdhVLdF7jC2Qs5kheVngy/ITCvbi/Vi/iUXZ0Ls
         sCrdIOdpJPsqW54HrOwYKCFTTL4L71Ab2npKrMwnXXoer8JPLqy8r62DldzbbWO8EpH3
         f8g7m2wazFhII4owKhCJqE7bCma27LjxRUNuTuhChR/GrkFdqK9EGZFjWz4BJo6L25c5
         3yXeKwZIxCsW3baFfwdce5Be/2nZq668CUq/EhhEf++Zwm89oZeo9OdIaDLXZyPwzKCY
         E+2g==
X-Forwarded-Encrypted: i=1; AJvYcCWqMyRUiOZul/1BQq+LJr3f/0PRt8T3WunTaHyQrqWj5kG6+9xAT0WOgBy4v1tcq8ppeExlfwFe3FlX11A5gvKNrK/P
X-Gm-Message-State: AOJu0YxnmIFEZ0Uist4BuRzL1oYE3MOxatSPeb7GexOKNVtmuZbFZN5k
	BI7CxWjF8pw4SRNuJB24RLBRthp2V21IwwY6wl9hc7LZDi0iyIXvddyouv7cLg==
X-Google-Smtp-Source: AGHT+IGrrJr+Oo0dBAP1RDU3YHrRkUwB1oBOMPFPB4/1gpiTJwDY4uP4ocgeH+a+h16PfoQZz0jhTQ==
X-Received: by 2002:a05:6a21:7884:b0:1c4:17e1:14d0 with SMTP id adf61e73a8af0-1c461a04b51mr2600716637.47.1721827734299;
        Wed, 24 Jul 2024 06:28:54 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d2628be4fsm5226884b3a.80.2024.07.24.06.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 06:28:53 -0700 (PDT)
Date: Wed, 24 Jul 2024 18:58:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re:Re: Re: [PATCH] bus: mhi: host: Add firehose support for
 Foxconn SDX24/SDX55/SDX65
Message-ID: <20240724132850.GA3349@thinkpad>
References: <20240709015818.110384-1-slark_xiao@163.com>
 <dduv77mdqe633m7amyljhqas7nomrtjrrimvmyqidymy3qjvfa@biepierrz5p3>
 <17f0f426.4faf.190b4edaadd.Coremail.slark_xiao@163.com>
 <CAA8EJpoiOLYMhxyJbdrgnMVfVggL9cOWtX8L__YKd=RPQWOcSg@mail.gmail.com>
 <7036d57d.5904.190b512d00b.Coremail.slark_xiao@163.com>
 <7b69f589.982a.190e4735077.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b69f589.982a.190e4735077.Coremail.slark_xiao@163.com>

On Wed, Jul 24, 2024 at 07:14:40PM +0800, Slark Xiao wrote:
> 
> At 2024-07-15 14:27:07, "Slark Xiao" <slark_xiao@163.com> wrote:
> >
> >At 2024-07-15 14:16:57, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >>On Mon, 15 Jul 2024 at 08:46, Slark Xiao <slark_xiao@163.com> wrote:
> >>>
> >>>
> >>> At 2024-07-13 23:09:47, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >>> >On Tue, Jul 09, 2024 at 09:58:18AM GMT, Slark Xiao wrote:
> >>> >> Since we implement the FIREHOSE channel support in foxconn mhi
> >>> >> channels, that means each product which use this channel config
> >>> >> would support FIREHOSE. But according to the trigger_edl feature,
> >>> >> we need to enable it by adding '.edl_trigger = true' in device
> >>> >> info struct.
> >>> >> Also, we update all edl image path from 'qcom' to 'fox' in case of
> >>> >> conflicting with other vendors.
> >>> >
> >>> >Separate patches please. Also don't use "we", just an imerative style:
> >>> >do this and that.
> >>> >
> >>>
> >>> Do you mean use 2 patches (1 for enabling trigger edl and 1 for
> >>> modifying path)? Though these changes are aimed to make
> >>> firehose download successfully.
> >>
> >>Yes. "Do this. Also do that" is usually a sign that the patch should be split.
> >
> >Will do a update in next version.
> >
> >>
> >>>
> >>> >>
> >>> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >>> >> ---
> >>> >>  drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++------
> >>> >>  1 file changed, 14 insertions(+), 6 deletions(-)
> >>> >>
> >>> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >>> >> index 14a11880bcea..440609b81e57 100644
> >>> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >>> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >>> >> @@ -433,8 +433,8 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >>> >>
> >>> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> >>> >>      .name = "foxconn-sdx55",
> >>> >> -    .fw = "qcom/sdx55m/sbl1.mbn",
> >>> >> -    .edl = "qcom/sdx55m/edl.mbn",
> >>> >> +    .edl = "fox/sdx55m/prog_firehose_sdx55.mbn",
> >>> >
> >>> >qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn
> >>>
> >>> what's your opinion?Mani
> 
> This format mismatch with Foxconn SDX72 edl path"fox/sdx72m/edl.mbn".
> I think we should align with that changes we just committed.
> What's your opinion, Mani?
> 

This really sneaked through. I shouldn't have allowed this path. We should bite
the bullet and use a standard path for all modems as Dmitry suggested. So the
path will become:

"qcom/<chip>/<vendor>/" where chip is 'sdx72m' and vendor is 'foxconn'.

If you need to use product specific firmware, then

"qcom/<chip>/<vendor>/<product>"

Since the firmware itself is not upstreamed to linux-firmware, changing the path
is not a big deal.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
