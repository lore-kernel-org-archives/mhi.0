Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2701A1FBEA6
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736356911; cv=none; b=UfOW/42aPd4KANNJcq0W2pJjQWPfJVgnxoV/H1i2htAse3g9qxlVq6VucUKEkpGCXigAJ5gPzb95bpGLvQvoqlVOFWJYL+0WsfeAhKo9i4vq/qCUE5xkl0m24pTzVJKO7JNkfnM4YmwNb9Sz0+jOh5A0P/B5zn4TsyfeBDf1zpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736356911; c=relaxed/simple;
	bh=bBtlESOrwSq/zlgHChS9VnkzArAlqbgTXlvXI4GdC4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loCu53iq3gbXpCK1spcLjgX4LVFGdgCntV2hvs8h5cvKGm5QooYwzpRdB5JfY2zgR2UV+B/A5L111bmYnTooAhc0Jz9LsxiB7/bousiL3H0Di9cruSkjvDqfRgoo99E34HjWxYr0OLAgiJP29Dxfx1LDyCImisfYU+rP8PBEQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U75WFyrE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U75WFyrE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2161eb94cceso179682215ad.2
        for <mhi@lists.linux.dev>; Wed, 08 Jan 2025 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736356909; x=1736961709; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QhlLvY/LJFPsKd0vZK8f+ntXmApUkmDSgWg3tI8gkOY=;
        b=U75WFyrE+g8+kuCqofxZ8tuceMIdZGWEwIHIfaiujBtSuyTYnu4abtrIkjaC7XB6C4
         4duSkp8HWA0cYdFrliXe05E5L6axa0SgF/gBJ7sV+1MykGToTCogahSaCA46567Vlzd9
         IJcrDFJoHuvyHMzFtIMlQrrgjJISGRE+zyPHvShtPuNg4/eU6uPLIXDoO53Fnql7sPzv
         ctn8wdat4Eb8rkTAsQHAh+J9WFYNp3DW4g8brYOrgZWiYbWna0wLu0BLAQ27U1HVrVdT
         Nt9ygMF5o8ELgeEQWqiJF+cu4qzUJuCemFHSeMawEpxp3hKL6zp5j0rLo/iM2fefIvKF
         +slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736356909; x=1736961709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhlLvY/LJFPsKd0vZK8f+ntXmApUkmDSgWg3tI8gkOY=;
        b=JKyQAjLfFYF0E9DMvhT5M9owty9pkAfrVv+qKPs41QRUV3b3YnMKUkYZF5A67sUyqK
         Udaa0V2jtHabIug0A4CZvI49Tsq7zVONjDQPEycZdWJ65D/gTGhNvFqVsiJfM9p3Ua01
         ac/g4CsGDpDxSnlkspvY+8qzu89icw7ALjEmhqEF9PhzLRT2J2kay1sFejojqKdCXcu9
         htE6rH7a8B8OuKxg1dgehjbZCfRI0RMALgKJgv3/Z0DYbuCvsmvVvZw4Oc5eIHCSIj9/
         d+2acernFvKSktxFPx9hNYnGDFft0vZmBpiU9+oTNs57JSQ1K6eGpjDJEERlLmcs7uUZ
         alqw==
X-Gm-Message-State: AOJu0YywqG0Rx/XbcM4XfR+JEqcai9y5UGaIhAft3sAZqBiapAwSkKdc
	MirqqcSinFO5HdHv5bbXS6na48X+QFgbv8ADUZPEO3r12Z1sOzVR1QUFgk+qM3vKMEmZqQNwr6A
	=
X-Gm-Gg: ASbGncsrhaXmu7kovNkAgIZ9QzPewOch7NQzG/DYclqec7NgoFgws9xyRbpE9jXZzWG
	2a/CCFCSxQpolST4DXLsGS4yZlFwCSuB0CdD0Baxdkz7FriuW1TfCm6F9Qu/XFLX1Ka3ELVWvkH
	TimQJhNPeOlvXDLLoj8xqrwFAwLaEnBe7TbqtbRZdJL+riNGGzIoWsLpQV0wil57WgFlCYtbZNg
	Botwr2NpmfL3hcTssXpqeaHBFbsUwDhynoZvhNWkawDHGvUddEu5QmfPYjNEbCGCeiD
X-Google-Smtp-Source: AGHT+IFljXVpvzQRAJ50/FIKhBnt62pZLnBANrFqHk/UT1k0QKO94GXBwdjA1EjgYjW3r8Th4loC5g==
X-Received: by 2002:a05:6a20:c792:b0:1e1:b35b:5132 with SMTP id adf61e73a8af0-1e88cfd2470mr7055029637.20.1736356909503;
        Wed, 08 Jan 2025 09:21:49 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb919sm36768138b3a.149.2025.01.08.09.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:21:49 -0800 (PST)
Date: Wed, 8 Jan 2025 22:51:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Enable MSI-X if the endpoint supports
Message-ID: <20250108172144.73nuhop2ypbfgyxv@thinkpad>
References: <20250108-msix-v2-1-dc4466922350@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108-msix-v2-1-dc4466922350@quicinc.com>

On Wed, Jan 08, 2025 at 09:52:07PM +0530, Vivek Pernamitta wrote:
> Enable MSI-X if the endpoint supports.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Applied to mhi-next!

- Mani

> ---
> Changes in v2:
> - Updated commit text.
> - Link to v1: https://lore.kernel.org/r/20250106-msix-v1-1-91d7b7143118@quicinc.com
> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 56ba4192c89c16b4882d2e7c95f0dc689fd1e267..af1380220904a7e6232ff1b374da0a4ea49cb470 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -949,7 +949,7 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  	 */
>  	mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;
>  
> -	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
> +	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSIX | PCI_IRQ_MSI);
>  	if (nr_vectors < 0) {
>  		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
>  			nr_vectors);
> 
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20250106-msix-a4c5488ecafe
> 
> Best regards,
> -- 
> Vivek Pernamitta <quic_vpernami@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
