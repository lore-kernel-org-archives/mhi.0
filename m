Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E61F4727
	for <mhi@lists.linux.dev>; Tue, 21 Jan 2025 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737479173; cv=none; b=rvPf3DFu4UArit09UYYSSEX+3Q5zQ1ObKRPPo6WNt4ptXi/bcFawj7Yzv+X7GWK7cElWjgd7KzqDWhLT/hGXEWYuL/26Z+Vn09cKTOs83tudiSIcUsclTXTBk/qLO+/ATL7PYvz1vJQ5D+KLCdyoGtUOEJ2vtNF4f4f6wNVl+Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737479173; c=relaxed/simple;
	bh=aeJDFFM/KU6G8Vm9vw086ZB0Rc48HlsP+3yObWcRotc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DradGUq5YHV/Ym/VqUgIo+oHOGBrKgqio6/crvj9KXL4/23EGKGo4S9I5JyG1eqnde6kB2p1vlTn2ltKBxtMHCKzv9CQHW22UOaNBa0katwZrBRNG18SNy3XOkSwtMRLAiyrpBFopr1C7tN21gGtaOsCG22AtoujowUHVCP+/K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tB8/CAlL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tB8/CAlL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163b0c09afso107647145ad.0
        for <mhi@lists.linux.dev>; Tue, 21 Jan 2025 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737479171; x=1738083971; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLZ1M91Tz5+90Z8EdtBju3QcQgjWi+pie1RGDIf4/y8=;
        b=tB8/CAlLFjfDdROMzEE26vOqRwKI0+w+T76SiDml7ZeVZ01W8Bq+V6YJr2nTsr+xkJ
         cQ4vPg/Z0XzDEm7KTImyz5/InXPdLm21KH/N94y3riUoATiE5zRVMIpANfPyp2AT0dIf
         EYucLinstXuqfobaAlzPEp2QbKbC239oCrDC4gVNFPOu7UD8KOVBDjeHJAb453n7W/Sh
         dTEZnltRHn0yQbGLy9ZWraoJ8FgMiISkqobT7tVKnBG0vm+LKbea/EwY4V0MDnkZ5B/E
         xhj3hQBctPMioDuOtE2S0cYHFsR4d8xwggR5uhdwjoWsKEg1YIGWPjzh2pEFXPFnLkIO
         ykVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737479171; x=1738083971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLZ1M91Tz5+90Z8EdtBju3QcQgjWi+pie1RGDIf4/y8=;
        b=lmyGlE0GWXv9PIciMFKN+3T8I0eVLNyGmAjJDsQWkbHc6jGr6+nOxylyvnaHWGfDq7
         hdLjtDW5kNq0OnzNRx5Ebq4NsI/APBCFl21/GRZQ25OHf9/IDWb2yPDNqZQU5VMNP7Iv
         kmdx41FLRHoxDZ9ny5ok9oQjFYdAtJoUsUpi2OLBvTPKmjnpcfgEyPksf2/9z1FeESSc
         RQTd4Z3hFG/uRNbtLDHcB/gQFgcSWClQiDqBgwXejTV6krzv3ap+52NqjNJS2yBqV6FX
         4W8arPDt21soNOvkVF3h5nNRGLXMqjULmBYmtMSvVAcoGJa6AtM4HQHePOzG4SpKJCyC
         Z8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWk1xU4g/1VaOj1eIQdQbYLehnBIS21J3V2R7IL3rdetm1+xEvbJTAzYy9FSodLUI+Jpns=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8zx0LJ6ZJe31JbsyQZIGvbc7CoJutDlbY9ycRkm8D2AN6SesS
	NSXmy7pwSQxjZGF5+HMI0sKUEbGZpo7EhH7gU+WeDJlnqXuciXiEbyS433l0Yw==
X-Gm-Gg: ASbGnctqFlM5tefj9IMXrTJqMy1NN4WnRevOPZhwQ9BvpKmP4wSGFUhvzS2U1TleO9G
	TPssLQkC47qyovM3smFomMSdx3dbjXjO+ZajIOe7kseZmSmBZhv2BwL+jpSIKfGZq317rSHR/J5
	+l8lURBIaHSQMimQwZGjwK9b6eeMSJyKQftbk7XnIwyxTONW7Nl83rHKLGP81KO76FNBQI1zel/
	BFyJov7sMhjrGVLpZCWFxNS7vS5cfpp5UCh/dkLOC1Bz/qXb8mXHRk7x958772B7VfpuwTno1nQ
	ByqnyDM=
X-Google-Smtp-Source: AGHT+IHn9TYsLmD7P0Ha+IDfjAk5r1UYZLHtwz2kbDOobhswOY9mYpBT9qI01ULKC2BhTtnxTxy1sg==
X-Received: by 2002:a17:902:f546:b0:215:72a7:f39f with SMTP id d9443c01a7336-21c355b78f5mr265880945ad.36.1737479170859;
        Tue, 21 Jan 2025 09:06:10 -0800 (PST)
Received: from thinkpad ([220.158.156.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3abf17sm79278015ad.148.2025.01.21.09.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 09:06:10 -0800 (PST)
Date: Tue, 21 Jan 2025 22:36:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 7/7] accel/qaic: Add AIC200 support
Message-ID: <20250121170606.ribist6ayw75bzlv@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-8-quic_jhugo@quicinc.com>
 <20250121051624.nhest7s6iyh2ll4m@thinkpad>
 <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>

On Tue, Jan 21, 2025 at 08:29:32AM -0700, Jeffrey Hugo wrote:
> On 1/20/2025 10:16 PM, Manivannan Sadhasivam wrote:
> > On Fri, Jan 17, 2025 at 10:09:43AM -0700, Jeffrey Hugo wrote:
> > > Add basic support for the new AIC200 product. The PCIe Device ID is
> > > 0xa110. With this, we can turn on the lights for AIC200 by leveraging
> > > much of the existing driver.
> > > 
> > > Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> > > Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > 
> > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks for the reviews/ack.
> 
> Do you have thoughts on merging the series? I think I could take everything
> through drm-misc, you could take everything through the MHI tree, or we
> could split the series by tree with a phased approach.
> 

You can take the entire series through drm-misc. I don't forsee any core changes
to the MHI host stack next cycle, so it should be fine. If something pops up in
the middle, we can do an immutable branch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
