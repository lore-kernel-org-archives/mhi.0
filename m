Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F5E286A8
	for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660279; cv=none; b=fmsXhD3kFPdI4FUGEMkpk+VMyx8m0Gsfywt0O5R5AQJSUK8v1qN1u2M3QqAmJ0vsT5TOgq9zvsODU6GIuG615+kmUydOaVddn3S30Ssb5VCSG1bttbiYgNDNv5D9Hb6KaDG6TZETk53OUe15joTdCGFn7WKz81gx7y8F+7fQEdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660279; c=relaxed/simple;
	bh=0VqKrvJYLw4AD7Wyu8uZCVmBAUUj5EE72EJvwC0RTZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prmmt5mUnpsuiom+oUfCsx6qpZNffESOppR70KFh1uFwIZeNDMAt4brObQCin2l9lYtEFKWfzvZ53HdmbGdsb5+/W6sCruyeq/+xFKQaDkk/GQaZ2P1TDmcmBG+W2i/CzP1Ljj9MDYWZUqxcdZo2h+QwInA+wIzjx24l5gs9K1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MuEUCY77; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MuEUCY77"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71423273c62so2824642b3a.0
        for <mhi@lists.linux.dev>; Mon, 26 Aug 2024 01:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724660277; x=1725265077; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CIogbmwPvZpOL2Lj+hez6PLcQ3VmsvaLft2JWkOO5TM=;
        b=MuEUCY77HJFwH/aHsZJbrabzVm/ZFrN3RGFtVNPsXzi08bmoh2XxHk2YqrCjuVoG0Q
         qMlnoyLSdYz8tZYyu5GMKt1B3iHxd7VEBQuBdKolmYXLRb+vjBwSyRFXLHRmS7H0klUx
         /T/t7ALZPgf90tI4/bbeNNY6ZHt8F5uUiwlcJ2KpGc7F9Wy25ffozUc2zHwsC/Ro3Hf4
         WPaxvaxJ4VVagUh9LUu+bPYq0bseOBrVXceg/k7wBrSiaFfCvkYTbRmXkUg42CD/vAGp
         SSAQSDu6jHPfiWPAvPdQZAUgof3+p+2hwoNkdHIDMD1HjOyisQyU2/fIw/G4vf1t54YT
         9k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724660277; x=1725265077;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIogbmwPvZpOL2Lj+hez6PLcQ3VmsvaLft2JWkOO5TM=;
        b=M/0fPV4edawReuTXhj49MZRYoZbzWP2kPXoS+yhIKXJa2eVqmsbq1qAv6H08wOEzEF
         Ug8wwGcF6p5/1NKgwzm2xYV8ND1je0DzPbShNNCo6oQA5717XY/Abw5T0a6ixlQ04gkw
         ujtIHMpo5rEo3QVqvC1fg/MNR8M37GSgIdxcQVeGIz1VDiksRMpYCdRW6NTT5fN7//wa
         9Umqo9u1Qm7gaEcXWLnOaQua4LqvNjzNqRNG+6Ejtvh0K90Z0Zsxg+kjgN34EZpYTxFG
         7ojKmA3PYlJ8wS4TamnVjfiVYdyjYSCRIyfGIcxK4xHsqeBJNav/exkZXXniFvk4LCqg
         9iuw==
X-Gm-Message-State: AOJu0YymwgjUl8bYM0tKiss6u52KN2XNZl/QcG08K7xxcjYetmtqRzTt
	sj/MyHk7tuqjivbOvQZOm3VbdGe4uWNMaMBKPy3CIaDvJjnSOHN9SXcBrXjXAA==
X-Google-Smtp-Source: AGHT+IGDQRJDbqSrqfvrmyNkQNgUOxjcf2PQpCuTsETYn+PMjhYqJvb77APPqhvQ7ucbVHE49JTnzA==
X-Received: by 2002:a05:6a00:91db:b0:70d:311b:8569 with SMTP id d2e1a72fcca58-71445ed4f93mr8261859b3a.26.1724660277047;
        Mon, 26 Aug 2024 01:17:57 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434253dbesm6604624b3a.76.2024.08.26.01.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:17:56 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:47:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: duke_xinanwen@163.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Murithi Borona <borona.murithi@gmail.com>
Subject: Re: [PROBLEM] bus: mhi: host: pci_generic: SDX24 Channels
Message-ID: <20240826081746.j37b3k5s5eusx7qy@thinkpad>
References: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>
 <20240708082132.GA5745@thinkpad>
 <CAHCJQqGPtSHx5LbRF69CJ78x7TwXt332-8cMwXrpVyPWURVFhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCJQqGPtSHx5LbRF69CJ78x7TwXt332-8cMwXrpVyPWURVFhw@mail.gmail.com>

On Mon, Jul 08, 2024 at 12:57:06PM +0300, Murithi Borona wrote:
> Here's the sub-vendor/device ids.
> 
> Slot:   0003:00:00.0
> Class:  PCI bridge
> Vendor: MEDIATEK Corp.
> Device: Device 7988
> Rev:    01
> ProgIf: 00
> 
> Slot:   0003:01:00.0
> Class:  Unassigned class [ff00]
> Vendor: Qualcomm Technologies, Inc
> Device: SDX24 [Snapdragon X24 4G]
> SVendor:        Qualcomm Technologies, Inc
> SDevice:        SDX24 [Snapdragon X24 4G]
> ProgIf: 00
> 
> Duke,
> 
> If it helps this is the modem firmware/config as seen by ModemManager.
> 
> manufacturer: quectel
> model: EM120R_GL
> firmware revision: EM120RGLAPR02A07M4G
> carrier config: ROW_Commercial
> config revision: 08010809
> h/w revision: EM120R_GL
> 
> Full Firmware Version: M120RGLAPR02A07M4G_10.010.10.010
> 

Duke Xin, do you have any idea about this issue?

- Mani

> On Mon, 8 Jul 2024 at 11:21, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > + Duke Xin (who is adding Quectel modem support these days)
> >
> > On Sun, Jul 07, 2024 at 08:23:57PM +0300, Murithi Borona wrote:
> > > Hello,
> > >
> > > Module: Quectel EM120R-GL
> > >
> > > This module does not appear to work fully with the default SDX24 configuration.
> > > It appears to be another variant of the EM120R-GL (Also FCC-Locked by default).
> > >
> > > Issues:
> > > - Debug ports are missing (AT)
> > > - It only works over MBIM/QMI with Qualcomm's RMNET driver.
> > > - In QMI mode it's really unstable and unpredictable with the QMI port
> > > freezing up.
> > >
> > > Are there any missing channels in the SDX24 config or is this a hw/vendor issue.
> > > When using Quectel's drivers (and blacklisting mhi_pci_generic), all
> > > the ports are available.
> > > The configuration for other variants of the same module brings up the
> > > AT port ( with a recurring warning/error).
> > >
> >
> > Most likely this device is a derivative product that needs a different
> > configuration than EM120R-GL. Could you please share the sub-vendor/device ids?
> > You can just share the output of 'lspci -vmm' command.
> >
> > Duke Xin: Are you aware of such derivative product?
> >
> > - Mani
> >
> > > >> [ 5074.472791] sequence number glitch prev=1 curr=0
> > >
> > >
> > > mhi_qcom_sdx24_info
> > > ==================
> > >
> > > lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> > > Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> > >
> > > ports: mhi_hwip0 (net), mhi_swip0 (net), wwan2mbim0 (mbim), wwan2qcdm0
> > > (ignored), wwan2qmi0 (qmi)
> > >
> > >
> > > mhi_quectel_em1xx_info
> > > ===================
> > >
> > > lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> > > Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> > >
> > > ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim), wwan0qcdm0 (ignored)
> >
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
