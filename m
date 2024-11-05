Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8CE16BE17
	for <mhi@lists.linux.dev>; Tue,  5 Nov 2024 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822847; cv=none; b=G2iCLqGw6EV19cC4IYgbLwc1ZQ6GGp8+DKokaUdvjKo+Ht6q8ubZ21KI5193yNi4WqYETBS4sZ3H5rcvZe6s/X/gSCfS027OteTn802RRCuMFXPoJQu7pwCrI5AG+oNCOTnCStS1L01ys7mkhuhBlmy6JIgQhwRGPVC5T8H/BRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822847; c=relaxed/simple;
	bh=VOFgJkIl2yKGWNfdb8bTJ6DOkAjPvxkFk3z/mhG/aTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXb4SQp/wDwXfN0u7FNA+kp3ThSOJTlTdihJcO2xtFwClDTk1giBHV+ao6i8LdExBJ4eotQsVixrxBaKWkth8MWh3MqBqWOXshaSd7WKDBTKfsDaEJQJtbk2w1aXtvj7PPW11nch5+9so30bSxTt+8QbQEGLlpiLkDse41d5rGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso4817438b3a.3
        for <mhi@lists.linux.dev>; Tue, 05 Nov 2024 08:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822845; x=1731427645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ogf0K/Q34hA3Cxoo6TgX4WGjXQUWYD7sZ9PLkWwfk60=;
        b=Sn6la1Ci/MR9EX3eHSX/nv8bWA4cy70pSfWbdE1Io8ZnLqOtleaVpQT60mozCvBcwH
         iiWRD7ypZKMe4HQ/E/A1SWLPuokRa71PPskf01x+EurwHj1XdDdUnF7tuoj88OW9CW2s
         PRjMQSpOsmvIhTP355z9+yyQ+c+6FNEBo7S/2RA/7Strn3cykHR0eSJAIullywNjU6PB
         xDTtNieO+gOoEDhBOxBgBrrq+MlAv6VYpNbEEZf4ZRA+e81ZEXlvtOOVqeKqkEBc1vmT
         pNipk1/Pb8BFr/BeEhm03LAAP8WfF/HUgTIjhLdNkUPTghY7MZ9TzB7dcyAHTG1qMwj7
         6uSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDerH3E5uNIX58QembIu7tjGcRge0OU2mkHk3iUxYyZRh+a1OHrcwyuqtFOGA94jE3LN8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWlaByTW5J3m1ZbADjErGV3en7u0bNW+p4v+3bi3slYhW2ZYgP
	6VBNynZfsNDoHae5XsZtb53JVq31NKcaQqXFUTF3bqluy7xCQuDK
X-Google-Smtp-Source: AGHT+IEnlS+/GQcAHPve3vyaQ7sB9wUbUDXU8ulNK8i1FEUHfJF4hri3CQgbF697cHOdDs7H4fpD4g==
X-Received: by 2002:a05:6a00:b86:b0:71e:7c92:a192 with SMTP id d2e1a72fcca58-72063093594mr47302502b3a.24.1730822845521;
        Tue, 05 Nov 2024 08:07:25 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2057f2sm9877889b3a.87.2024.11.05.08.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:07:24 -0800 (PST)
Date: Wed, 6 Nov 2024 01:07:22 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Zhongqiu Han <quic_zhonhan@quicinc.com>,
	manivannan.sadhasivam@linaro.org, kishon@kernel.org,
	bhelgaas@google.com, lpieralisi@kernel.org, dlemoal@kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: Fix potential NULL dereference in
 pci_epf_mhi_bind()
Message-ID: <20241105160722.GA448500@rocinante>
References: <20241105120735.1240728-1-quic_zhonhan@quicinc.com>
 <ZyofRAZoAE5IgCVi@ryzen>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyofRAZoAE5IgCVi@ryzen>

Hello,

[...]
> >  	/* Get MMIO base address from Endpoint controller */
> >  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mmio");
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "Failed to get MMIO base address\n");
> 
> dev_err(&epf->dev, "Failed to get mmio resource\n");
> or
> dev_err(&epf->dev, "Failed to get \"mmio\" resource\n");
> 
> Note: &epf->dev instead of &pdev->dev in order to be consistent with other
> EPF ->bind() functions.
> 
> With that, feel free to add:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Thank you Niklas!

No need to send a new version of this patch.  I will update it on the
branch when applying.  Thank you!

	Krzysztof
