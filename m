Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D195026868F
	for <mhi@lists.linux.dev>; Fri, 14 Feb 2025 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739554464; cv=none; b=BxNhx3mI78l8N/jGsYhKArAIh5OrKHDKBdtjJREFy2PrTjsyItT2uYmWtGTDGaDO8gLyjTSCuZGxtuO4Wz/PIw1fn61brwf4Wa5gC/z3kyDD55eT4epT07abGpypM/L1QS/OFD26cyO9gF+v874JIkdwBcUDjRAzqzjKYnQzOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739554464; c=relaxed/simple;
	bh=wyews8vfBUi0DfJTYdfIO2a1ZXwvPbE/cYzjPRjQrj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwxGPb/FzXA0hBb/UsTMfQXYTEkShlim7DM8I7jOxxIH6pU6P8G28KQv71M6Ovhd8YPT0o6nImjT9mVDjPCYMCiJsQO7dOT7wc2netb/dsYLiEmeuVqRGFpKKUqmWzvsMs3e5lqXnKvx2a/JT/Dd7yvIvegmtNtJlhfOYM9pwqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3U09Npw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3U09Npw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f2339dcfdso36749625ad.1
        for <mhi@lists.linux.dev>; Fri, 14 Feb 2025 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739554462; x=1740159262; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GSFBEwov7SYxp73AsWF2Q+VXEt3MRx5pEFKdxej0uOE=;
        b=I3U09NpwP6k4NzHDCceP86PaXN/ttRG36gi5ZCewEEfAIg3kkJzV7Y0xDqZ6OoAYXf
         nPSYIGyhik8I1uN5HR0jfApSWysEErERo73p07MWXCKgCjU9vdVWiNSjX5aPC0AwnR0q
         TNkRq5LmbaKn0DMhqsYfN9Um6UA0WDJtGpABvddeKKwBh75aXpYczw/rDO3GyPnhHDVU
         3w7fLrsbRzDt5ljJ1m2hnXZCisn/tlrd1L8DBXwUYjyThbMkbUPWKDp9saqcASlzwHQu
         YZaGcns1+j7fp26rZ5RiFKY2t2ynDoUgjODmfDIMc6yJoaLOFxXvsXgZS7QOouNcOYs2
         6ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554462; x=1740159262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSFBEwov7SYxp73AsWF2Q+VXEt3MRx5pEFKdxej0uOE=;
        b=Fth1EyOS8EcN9ONCKHPt0JIgKm+hFlvg32ncw+lcw0XHYb8ExeeIpywmpLHhTxbsWT
         ny65MC8udAPi3pQqR/8/cvS921nhiRkYW4YfzwGjPr3JfCL5E9rwwJ2kc+Xf2CIaUQaG
         YG7uawb08rADCyqryybskaUdvzLs4OUhFxsscLS2Q/ML1KdXg/RPIPybjFF9CaA3BM9J
         cgJB6IzNblE+4RQALsX3e5WtShPVUlOEQs5LrDwah1pgrPIXoNghA0kWVutpyk+dlRML
         sn8wOHsFb7+feXMODV3tEOgvQbmqgGW1PhCNfRPMRrhLooceE79y8/WsDSGLQIBSWnpB
         n6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVRrtRq53Y46RVEfxfZ0wxstW624oclG1Kfg5jl2AUV/Bc4Xv3AwBZtSVpQK2XwZcrZrlA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe52UaH8GexpaxT1da1PYmzDorhR2pZMNF9J+4FmqTj/nus7hz
	YMegrkun2neKDS0tkzzC8DhVqgqTfl57hAzAj33VnXdswTZHESZJrVKC95lWQA==
X-Gm-Gg: ASbGncupA+RRzzevweth89YkbZp4GmZgdkUZMxvS+ZFe5dXAGjjvspDs4UHOzOnc+2M
	yV5htyn17H/mEUsSaHwpq2Ojw8pNkGWc9vTyRXd1udpEqn9qVOJm0O2BGx4UQaQRS074NL6W0o+
	87rPrVKS7vN8EYa4G+LGa6cozeZN3nLNLODYk14fHGCgdNy8MTJ03sPR7oQUFUuycA0WBGuDRqA
	48y/f/ScPIYFW+w4XJ0UOxvQ4mBW8XWC8uKNBzqWzR+3OZAWtDW98gHRnzSOX6KquYFBNdFLoH7
	ONzPVIRq32ahb/M62plRP+MBuR4=
X-Google-Smtp-Source: AGHT+IFFgRVHE1TWwpWWAfTH1Nd1d99UjW4+AL/w3P3sw93jVzRmaegWBJLBzf4sbPwtEerPHqeTSw==
X-Received: by 2002:a17:903:27c7:b0:220:fbde:5d70 with SMTP id d9443c01a7336-220fbde5df6mr18990985ad.21.1739554461992;
        Fri, 14 Feb 2025 09:34:21 -0800 (PST)
Received: from thinkpad ([120.60.134.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-221040434d9sm193265ad.196.2025.02.14.09.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:34:21 -0800 (PST)
Date: Fri, 14 Feb 2025 23:04:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	dan.carpenter@linaro.org, ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
Message-ID: <20250214173416.b6y7o6tqsnkuzkbh@thinkpad>
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214162109.3555300-1-quic_jhugo@quicinc.com>

On Fri, Feb 14, 2025 at 09:21:09AM -0700, Jeffrey Hugo wrote:
> If mhi_fw_load_handler() bails out early because the EE is not capable
> of loading firmware, we may reference fw_load_type in cleanup which is
> uninitialized at this point. The cleanup code checks fw_load_type as a
> proxy for knowing if fbc_image was allocated and needs to be freed, but
> we can directly test for that. This avoids the possible uninitialized
> access and appears to be clearer code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")

The best thing would be to squash this fix into the offending commit as the
fixes tag would become meaningless once merged upstream.

> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index c8e48f621a8c..efa3b6dddf4d 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -608,7 +608,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	return;
>  
>  error_ready_state:
> -	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +	if (mhi_cntrl->fbc_image) {
>  		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  		mhi_cntrl->fbc_image = NULL;
>  	}
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
