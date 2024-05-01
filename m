Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C537F
	for <mhi@lists.linux.dev>; Wed,  1 May 2024 06:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714546512; cv=none; b=jo6i7+JIEJhBjrYQJqYdR9A5FowBhQO8SXfDKwoAFS7yH73b4fo/0o9V6FZexnpyJSnT8QKG3WFwV8Cf1NoKAD7pmOeSAgwqBrhaDijN7xhm3LecIoY0Wn2t3lyD1vEpjp0Z/Vm9FPaijtNpWW14/jSPGiR9Pk9mMZD4E6/8pTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714546512; c=relaxed/simple;
	bh=i5KE1+1LQPtHUveVrNhgiB7rgyip2sY2SOZ1Flw4ehk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afB6ZG9qxXBesbMBvt3mxsUNNDNipNw0Hpe6rui55F5ZRkEkdeMgJ5F/XBkPWXjKIGi4AiTAil4zqPeQFlih2W/5nPjWjdYBO7DCc44vvhfpOULUSl+RFFTXlToSqxIa1Knr7jqrqF7Ud+hNSR7FbC6l2BLTnfGPjIpQZPd8Ob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNIftIXr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNIftIXr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so64934725ad.1
        for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714546510; x=1715151310; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i1DDBmBAI6tZyAC516w7TDjHiE9iB7rwJVJBkjDDDFM=;
        b=mNIftIXrbogQrYdxgad8rRcyvz0ZJOy70V/QJfYSk4LyVGRTcQfjS6YJWQ85bojmlh
         evqt+Fw+jK0MgYs5Fr1L3J+AKJ182Wjf435xXwRiwflHLqQ0jue8eEo3lu6IU+Z7oJpg
         XhrhU2UnQZlNndv0cT5SxX08zGEbuFoKDEgOF35vm+jOnM9tOd/ltHG3rmken0ZamjjK
         p35L0D5UFVOP3YgvYLK0Qe3WEE7HbeHAbFSSMri0EOlLo0hKN0pnGiNCcoVbgdCqucW/
         195Ul9xKQTeHB6d/w1AvZNHo22tuFSvg3fa+BhP/v4e0gBKFEmPqs1r/qa30hsOpBLbj
         nVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714546510; x=1715151310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1DDBmBAI6tZyAC516w7TDjHiE9iB7rwJVJBkjDDDFM=;
        b=lq+yFRvJ5AJ4+qyxRf2H4X2L7dszrd1cGYyD6yLEsQi9Mn0wAP7b73Wk5rmTnH8kmY
         6gNrwxR4Lfp1qIs3sZjpEuBiazl286dquaNh2+7NGHXc6LUDBlC1Lumd5xj3OIDTbjGk
         7S4kCvkTBNaCEs5pQ3e27WbeQVW7PICmGOZR2wLbXDFMIDHD6Tp3UaSGg8wSKrAjXZul
         WXvwMtXNxjX+mXTXUEPGtMtpJQMyK7AOgA4txPG0TeYsAp1UO9fMGlRwmNTMiQZh7ETG
         a8H6eaQueeSUanXCTp+ezBMEQ09HACOOp94wlPqe9OzQtF7jDuBK3qoYXa9MPV5qx6+b
         mCRw==
X-Gm-Message-State: AOJu0Yx7DoPzpjzKMqZLQAU9nuOqCDRmM3duxXNjO7J4rY6TWpOJT1bj
	zlS92yhd7HcDHV1kanpAF12TThgjytwcGe784p7zZOISwIdoWwcsUEx6TpKZ6w==
X-Google-Smtp-Source: AGHT+IFjizgid/x5kXM4kJaxDlZHOUrsuI+1nyDmTw7ctzW0j0Fna/ooGq7Ldus54uJuhFbokohwSQ==
X-Received: by 2002:a17:902:ea02:b0:1e3:e093:b5f0 with SMTP id s2-20020a170902ea0200b001e3e093b5f0mr1795709plg.8.1714546509379;
        Tue, 30 Apr 2024 23:55:09 -0700 (PDT)
Received: from thinkpad ([120.56.206.24])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902d2c500b001ea02645bc9sm15423189plc.148.2024.04.30.23.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 23:55:08 -0700 (PDT)
Date: Wed, 1 May 2024 12:25:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Martin =?iso-8859-1?Q?F=E4cknitz?= <faecknitz@hotsplots.de>
Cc: mhi@lists.linux.dev, paul.davey@alliedtelesis.co.nz
Subject: Re: MHI MMIO endian issue
Message-ID: <20240501065504.GA1979@thinkpad>
References: <ZjFjEe0-tJ6un10J@dev2>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjFjEe0-tJ6un10J@dev2>

+ Paul Davey

On Tue, Apr 30, 2024 at 11:30:57PM +0200, Martin Fäcknitz wrote:
> Hello,
> 
> the function mhi_init_mmio configures MMIO registers using the reg_info
> table:
> 
>   eg_info[] = {
>     {
> 	  CCABAP_HIGHER,
>       upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
> 	},
> 	...
> 
>   mhi_write_reg(mhi_cntrl, base, reg_info[i].offset,
>     reg_info[i].val);
> 
> However, the values are in host byte orders, not in device byte order. I
> have a PPC64 system which is big endian, but the device is little
> endian. Without wrapping each value in eg_info using cpu_to_le32 the
> device (sdx55) doesn't response:
> 
>   cpu_to_le32(upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr))
> 
> Hard to believe i am the first one which has this issue? Let me know if
> i should make a patch.
> 

You are not the first one to try MHI on a big endian machine. Paul did that a
while ago and fixed some issues w.r.t endianess [1]. But I'm wondering how Paul
didn't hit the issue that you are seeing.

Anyway, I think the fix is to modify mhi_{read/write}_reg to accept '__le32'
for the 'val' parameter and fix all the callers.

I can cook a patch if needed, but won't be able to do so for atleast 2-3 weeks.

- Mani

[1] https://lore.kernel.org/mhi/20220212182117.49438-3-manivannan.sadhasivam@linaro.org/

> -- 
> Martin Fäcknitz
> 
> hotsplots GmbH
> Rotherstr. 22
> 10245 Berlin
> Fon: +49 (0)30 29 77 348-0
> Fax: +49 (0)30 29 77 348-99
> E-Mail: faecknitz@hotsplots.de
> 
> Amtsgericht Charlottenburg HRB 93460B
> Geschäftsführung: Dipl. Ing. Sascha Schaub

-- 
மணிவண்ணன் சதாசிவம்
