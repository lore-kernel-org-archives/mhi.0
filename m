Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64041C8E3
	for <mhi@lists.linux.dev>; Sun,  5 Nov 2023 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVQNbBB6"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-66d264e67d8so23560586d6.1
        for <mhi@lists.linux.dev>; Sun, 05 Nov 2023 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699197075; x=1699801875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tNR9gzwhUkkacWgh1uKn9LVJjKEaq5+Pu5l7LkuMdYM=;
        b=EVQNbBB6nOt0WVi4Vb/jF+84Mt+jrThmHkNf4u2C1zbJEK8M+07G8E+I0cTb53vDmW
         XORRQ2WDHf/+jF912BQgMRfJYYvlWYs1D/Yku2QTcsgWw2OOGdDGYCj6URtU6BmiTwNP
         cr4Trcyb611n10MDVagFMkhKcaO37n/HQEn1KQY5Tkhe4lt0L1gdhEHyUV8E95HBxvtu
         jTEylZSBKBHKRNBsFyFMw2BuynO931aHLTnMvhq1kgU7mX34n2q1a6KG9Y6eJg2CY4Rt
         hPWUI1DmIo/q7d5r4Y8lMdneqtPj+qjAWLMsTu4/SzmwbVu5EndhL7cnWhzTp54mvCIs
         MubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699197075; x=1699801875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNR9gzwhUkkacWgh1uKn9LVJjKEaq5+Pu5l7LkuMdYM=;
        b=RyB4YUFbgIAvZjttYHsX/gANGdQX54BkFaxJGyZVSMBgdUNpmxPs9ZgTbfjxz149IW
         CeLEDGZkpntMLTHttpVokhSvO+xZE2WD8rYPekL89Ap0hdCjdA1fs4jAnYsmLTHU/x7+
         hYlwJHCWB3/6WEmXuRsUArXdHAzbhA/jlSEKitbbXpSvMZitcnqYSKXfqNBp6/neadLv
         y1dsZv+pqiC7Du7W5KUGvh52Hp8Tfy91Lj3PzaXCA0IOaX7SNdICmNaymWFojysy7tZu
         RK9eyspltQ0rHBJti/jpxAmluo1pfqKj3dKbJy27JRc11Dmtg/QDiLsrtipynDs8nD26
         YAAg==
X-Gm-Message-State: AOJu0Yw502yN6J7M0pflLb4aeK9NpV7Gk5R4tYZGlulHFzv0YM03rB+m
	ZqDR5cjvAoO2iyWR/t2tMyE=
X-Google-Smtp-Source: AGHT+IFPvklZ50nijQ+nGgDBoKWDBwDUQMsPZqT1uGGNdYN9pbgjD8KK0+d3I0wLwwyaC5xbqWAeOg==
X-Received: by 2002:a05:6214:529b:b0:66d:136f:a522 with SMTP id kj27-20020a056214529b00b0066d136fa522mr30455208qvb.26.1699197075173;
        Sun, 05 Nov 2023 07:11:15 -0800 (PST)
Received: from luigi.stachecki.net (pool-96-246-165-101.nycmny.fios.verizon.net. [96.246.165.101])
        by smtp.gmail.com with ESMTPSA id ef19-20020a0562140a7300b0063f88855ef2sm2603903qvb.101.2023.11.05.07.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 07:11:14 -0800 (PST)
Date: Sun, 5 Nov 2023 10:11:42 -0500
From: Tyler Stachecki <stachecki.tyler@gmail.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra
 Wireless EM9291
Message-ID: <ZUewrgy0acOUkSAk@luigi.stachecki.net>
References: <20231105150510.96136-1-stachecki.tyler@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105150510.96136-1-stachecki.tyler@gmail.com>

On Sun, Nov 05, 2023 at 10:05:10AM -0500, Tyler J. Stachecki wrote:
> Add support for the Sierra Wireless EM9291 modem.
> Empirically, it seems to use the same configuration as
> EM9191.
> 
> $ lspci -vv
> 03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>         Subsystem: Device 18d7:0301
> 
>

Hi Mani,

I just want to highlight "empirically" here. I do not have
access to the IP which confirms proper MHI configuration
here. Given that, not sure it is appropriate for submission
to the kernel.

However, without these changes, AT is not exposed and QMI
submissions time out -- so better than nothing...?

Regards,
Tyler
