Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A105256E
	for <mhi@lists.linux.dev>; Sun, 21 Jul 2024 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721550928; cv=none; b=glo+0Xi8mtynBU0xPFrfwDBDY4JEjPCfVHcG1r2TTy5wyCjfn6D1QELsPLc+LvN8w+FwAkDXDwu9g9dDJHAp/p2k+07AK29wKfTOCuOALfKrgbS8qWRy1XLl2ToWbtpTNaMtWuG+ph6yaTqTu/opVaZkIthqGKXumoheaJBwW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721550928; c=relaxed/simple;
	bh=1LQIzZsW5Nos4xMixFIYGgsI6v5T1JThXgYbh3Dssfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hthJymJixGNmOdHf6vSKpFCNYYFp0ir63Xcnxy9b37bXhG2L2uQgUxQ9emw322TVkMlhfBAmiNb8umOj+4Ee32bID4zcmLDfNK8YXbmv2KzSaVy0JAnocTyb6hOwaqzRc4jWtY9ZHfNS4eRI5T1dPDgD5zYS7N8XxdKhch22Hq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqSf9sU3; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqSf9sU3"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-708b273b437so1795781a34.0
        for <mhi@lists.linux.dev>; Sun, 21 Jul 2024 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721550926; x=1722155726; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0AdzDctxg3QK3t7FtygOftyU2qoizZ9cykvy8Jq8iVc=;
        b=oqSf9sU3yUIhXS/5wTWgj2rrd2ZxRzq3NwiUPYy+i/GQumuEwlq3/+EFzCS/z3TgJL
         9TxpziVaa61T+Eg4XEvpHb6InFumA/bViQKP61npunz4GUYDHdSmGLrABeR2maWhha3h
         /ReL781yWJV3DaURuR805UFHBkVvZB3fIHNbnDcBH95P/50nMx5OiD1erXyqskhaLlKg
         jVNYKGHjNelmZCHnrna6fSzYdOoN45AczZVTUtHY3lWA0J/WQ2a5QUQMsjk4oSYk9SWa
         1dvTyNergLr6HzGYtUK1+T4+Trt7ICZt62hh+P+cxWAE2Zn6iKGYuINXny58FNFCCL34
         vGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721550926; x=1722155726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AdzDctxg3QK3t7FtygOftyU2qoizZ9cykvy8Jq8iVc=;
        b=Oe+WcaICJ6C2fgZ+wnMBtFi2N2m0cDGrjXmOViCHkAy52ziBV0gazf1GyjsZzW+TIu
         1qrnlp8Sj+a8C/Vpc7whKir7IPz0gNnpbQnGnWze9N5N3feDHyKE8lo8kJplOtZCVbZr
         qaFOmI5fhGECuvQGA+Eqqsglrr2gptqcpoEHbkM8da4UmaxaJP4rMbBqZuBAqKMP+3/o
         J5l8M7/CNz9MrV73Nf/qGqLj/5SMQwalm2zdaDmdTxhFfSpKM21MTQpslt4K2qNcaHZ/
         3/2uformQmSjbZhz3UBsJibkXK9KxDG7OlE5hmaPZmQ++xOTB9ufMEj0poVoHlVDP4jH
         bnvQ==
X-Forwarded-Encrypted: i=1; AJvYcCULHf5jkMRIUBWZTK8eRux2PS99lX8gMgpX7Y9yEh3JbCwtcIi61F9wKpBnFrI5TqP/FVvrX85FbM1/FVwQhQTjtvN3
X-Gm-Message-State: AOJu0Yw87IExkHKMj97STVtYpacXxxtjsq2HuFs/3n5ODXNPbb4J1bDO
	Dkv9WtrPGTlkZ2ELso1zNWTdF42Xgv4lKhs7RfYPIrqySfNlk5N8txCXXiLYDA1f8TGD0SIEkpM
	=
X-Google-Smtp-Source: AGHT+IERffJLZyytvnRqxBNZYHH3CFEt0B4He9k/mndUHdc7BhACPVQ7Vs22DGUEH5pLlRsochVNYQ==
X-Received: by 2002:a05:6830:6113:b0:708:9433:3574 with SMTP id 46e09a7af769-709008941c9mr5533968a34.16.1721550926089;
        Sun, 21 Jul 2024 01:35:26 -0700 (PDT)
Received: from thinkpad ([120.56.206.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff5527e9sm3526446b3a.138.2024.07.21.01.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 01:35:25 -0700 (PDT)
Date: Sun, 21 Jul 2024 14:05:22 +0530
From: "manivannan.sadhasivam" <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Johannes Fischer <johannes.fischer@verificationpartners.com>,
	Steven Edwards <steven.edwards@verificationpartners.com>,
	mhi <mhi@lists.linux.dev>
Subject: Re: Re: Linux Kernel 6.6.36 and upstream mhi repo latest: Interface
 definition of sierra_em919x
Message-ID: <20240721083522.GK1908@thinkpad>
References: <AS2PR03MB90043BBFBCA2E14D2EB62E84E5A62@AS2PR03MB9004.eurprd03.prod.outlook.com>
 <20240712161303.GC3571@thinkpad>
 <716a2414.bcfae.190a7cf2247.Coremail.slark_xiao@163.com>
 <AS2PR03MB90046596AFF0AF0F78D4C125E5A72@AS2PR03MB9004.eurprd03.prod.outlook.com>
 <1ba76a65.4185.190b47cf475.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ba76a65.4185.190b47cf475.Coremail.slark_xiao@163.com>

On Mon, Jul 15, 2024 at 11:43:26AM +0800, Slark Xiao wrote:
> 
> At 2024-07-13 17:41:27, "Johannes Fischer" <johannes.fischer@verificationpartners.com> wrote:
> >Hi all,
> >@Stark,
> >first, I accept that changes may have side impact on other modems.
> >Please have in mind that I flashed SWIX55C_03.14.10.04 and the respective generic nvu a few days ago, so I assume to be quite close to default config.
> >
> >Using  the sierra_em919x config with IP links changed to MBIM in kernel I can establish data traffic; I do not see a component converting the MBIM stream to RMnet in Linux kernel (?). I wonder whether there is positive  confirmation about a EM919x working in PCIe mode with the current kernel config, in which mode? (We did not have trouble using the EM919x in USB mode.)
> >
> >About GPIO handling, as said there is none for for Full_Card_Power_off# (6, 10k pull-up to 3V3) and RESET# (67, just a C=100nF to GND) on the BPI-R4. 
> >We  have not validated the timing in BPI-R4 with 6.6.36 or current kernel versus the timing diagram at "AirPrime EM919X/EM7690 Product Technical Specification". As you said there may be a corner case that we end up 
> >with the Foxconn config due to timing at BPI-R4 power up times.
> >
> >I get from your statement, that the valid config should be sierra_em919x, thanks for this clarification.
> >
> 
> Yeah, I just checked this issue again. We met this issue in our ARM  platform.
> Device boot up shall through PBL->SBL->Kernel boot up. And there are 2 different PCIe settings between PBL and kernel side.
> When host mhi driver probed, your device may still in PBL  stage or SBL stage(the PCIe EP in device side is not ready), then you will get a "foxconn-config" since your PBL ID match with that one.
> Solution shall have these:
> 1. Update firmware side to keep ID same between PBL and kernel config.

Having 2 PCIe IDs for a single device doesn't sound right. If it is fixed in
successive firmware releases then fine, otherwise please fix it for all.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
