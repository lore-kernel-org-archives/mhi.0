Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9571EB5CF
	for <mhi@lists.linux.dev>; Wed, 19 Feb 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974478; cv=none; b=YPDHMINn/6LW9jJBB5xJRJVKQSOluKyaMftMnlQG0KHk/mgD5xoE1DH4ZX6/V7HRbem2HDL75w8cucjfQO1lygAZtr0sztYO+TnRhC072xE4hcESQ/Lt6n73kSuOab3T7jBLILXeyaQ3EavLN4vIinqzl05/8aT+I1jB5EtwU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974478; c=relaxed/simple;
	bh=XL/FuYGImCvBKeDZ5q7HHmrFeYjloKD4TxJcQv2X7dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ao1Hm303D8+xAZ0J0lFBjcIWJmcXKGnjnWGDet3vnlmRnCLB+HuZKZhyFmCs11Y61+MYSq064LfdbrHsCdLhsYZFZvXYOBANStMbcvIp08zX8Aovh5d/Zr9nFcGY5Y9xAzr96YWA+oSmu2aaINuvKJIn8zIpsbMb2/+6nqcx/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tp3+5pcF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tp3+5pcF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220ca204d04so94588215ad.0
        for <mhi@lists.linux.dev>; Wed, 19 Feb 2025 06:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739974475; x=1740579275; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k2HtorTRfJCn5gYcOpWXXoqPoc/mFZAbh86mTY6fdYA=;
        b=Tp3+5pcFSeSttUgHsW0HBv2327wq+AGadi1g6Fm7XCQ333UK+QYByApRSUQxUHSKWC
         ztLEqvxBxOz5aOg1MjAuaMLYZhPUIz0oeHGQ764LgUt+jKjf6vSCH0MYh7RZOZ+N9yis
         7+b2qbjlQXFzjk/Kgma86N1amDT2h4EEEXPdHzUt39MUweQtl2Tze/kRn4C0UfPWsIRZ
         /rktXFncYDr1SFVilmY34erf4Uk9I3amZW5wrETINtt1j22wW4F/oDYy6u+6tbTAFYHK
         eVnI+jqGfJD6zgs5gjSm30UcnrnpGZLxZXVkWy+RHAQnmpkaP7j26IdYZBL919/C92w+
         ZZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739974475; x=1740579275;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2HtorTRfJCn5gYcOpWXXoqPoc/mFZAbh86mTY6fdYA=;
        b=LE+jS4/w53SSDzi2wYIIM34PpI+LSwxcB9L5Md3pMHCy82iwlBcLDz++m4mPQcq+qq
         NtNZuF3TVBLUcCN0rakKqO9QPTE40IGishP/Uchh9MMDMd+f8AjR+cWTShPTie46SqPm
         b11FQSHHVwkZae23R1d6w8cKz4RWX7rBWAFiviMfKs0VBhIKSRcIPGf/nIOeVb9Fv+ad
         jA71fmDattzALTuGnBdNjZcO7qB/lEJEiUO00XhGLzCa1zCJqYcLLYIw54mp0hqynYwb
         zuat1nVymp2dEhOjoiz9Mw8MnZrlUeSrp0qQBiEM6ejRiFZ7X8cxaBQgSOFlCq2W4Xq7
         fqpQ==
X-Gm-Message-State: AOJu0YwxuNvoeddaWgWF5ZsOklf1tA6cU9ZfHNs9MLu0OdcCgw1Azr7y
	KwysArZsN9ud6tGs9KyFSfFj36LF+uagW3vmuV/qj1fyxYIh+L+y0JjeGs6f6Q==
X-Gm-Gg: ASbGncuhJs02Mkd4H0WbE65CpHcNl/2cUmCN22KpnnXW6l8cs0vvRP1oL46UYP2Jr0b
	hNqSV0gzqzgnRYx5//T0dl87VXcsZXifphy2mnm6QEy/86ObyNLsieHwcIuBVY6EZUBTOkqphWB
	/CR5FsrPKzukRELksbOM3y6F3FfHwCqo0Fy44s/QmuuSi5SMKSSMNvuVy5cdj3IEkeLKeV5zncd
	cUlCN17JMTs7b+d/PJgQi334at/i0wVEyVyX58Y2yTeML2SffAlybhABdNwswLSkeMafICmyNfF
	bGmvgbEIWcf59ZdBIoDTjefoZQ==
X-Google-Smtp-Source: AGHT+IEeDEo2ltT751dR/sJKjSakroaM7te99A5gVKkjsKbIG+a1YUgHPEJvPjfTlYxMDg3qEDsA9g==
X-Received: by 2002:a17:902:dac2:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-2217065a24emr52285695ad.2.1739974473812;
        Wed, 19 Feb 2025 06:14:33 -0800 (PST)
Received: from thinkpad ([120.60.141.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349024sm106270075ad.8.2025.02.19.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 06:14:33 -0800 (PST)
Date: Wed, 19 Feb 2025 19:44:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: host: pci_generic: Use
 pci_try_reset_function() to avoid deadlock
Message-ID: <20250219141428.oiqgf5b2rg3aukvw@thinkpad>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
 <Z5EKrbXMTK9WBsbq@hovoldconsulting.com>
 <20250219131324.ohfrkuj32fifkmkt@thinkpad>
 <Z7XiKBD63EE7ZzNr@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7XiKBD63EE7ZzNr@hovoldconsulting.com>

On Wed, Feb 19, 2025 at 02:52:40PM +0100, Johan Hovold wrote:
> On Wed, Feb 19, 2025 at 06:43:24PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Jan 22, 2025 at 04:11:41PM +0100, Johan Hovold wrote:
> 
> > > I can confirm that this patch (alone) fixes the deadlock on shutdown
> > > and suspend as expected, but it does leave the system state that blocks
> > > further suspend (this is with patches that tear down the PCI link).
> 
> > > > Cc: stable@vger.kernel.org # 5.12
> > > > Reported-by: Johan Hovold <johan@kernel.org>
> > > > Closes: https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com
> 
> > > > Fixes: 7389337f0a78 ("mhi: pci_generic: Add suspend/resume/recovery procedure")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> > Makes sense. Added the errno to the log and applied to patch to mhi/next with
> > your tags. Thanks a lot!
> 
> Since this fixes a severe issue that hangs the machine on suspend and
> shutdown, please try to get this fixed already in 6.14-rc.
> 

I usually send fixes PR for bugs introduced in the current cycle. But yeah,
since this is a blocker, I will push it to current rcS.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
