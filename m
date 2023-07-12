Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39421200D6
	for <mhi@lists.linux.dev>; Wed, 12 Jul 2023 11:41:42 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e362e4c61so7823665a12.0
        for <mhi@lists.linux.dev>; Wed, 12 Jul 2023 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689162101; x=1691754101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GkLaNoWskYXvslP1Qpy+TOolPrbyrAyjVa+N07spH6w=;
        b=GdjQR8SX+x1pUX1Mtuv5xuheRUWPa4xiVxpkVzvnVRdbcp1cUzjP0h14IUqu6A49uh
         +ILaIzXUf2Mhdwplokt+KkGbaABFpL8/iEI694YXvZbBt7Sog7sBDmxeW+Y0f7ZsOdWe
         5ofrVDPbBcKUZHkbjXE8r4GO44GkCD/FlM/TEQSYzuMasTPzjCcd+Lq+xCrQ3EVK+2mK
         pv8A4mjEVcn1b4BRijKkmUZeFw8rnVWf32GcC4Xpfs95QPNVnjLryFYlRJay1WKbzbXy
         rPBtfLVfj+D1a26xpFSgBL4hhG0LAYfs7ama2jywMK6z6E0r+9Jtm/p/MKJkAvGCu6eJ
         zd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162101; x=1691754101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkLaNoWskYXvslP1Qpy+TOolPrbyrAyjVa+N07spH6w=;
        b=QnUu/r0myz1XlxkH7eKLK2bC4nZkV2vFAuYCyPdJl+9z4p7jHOueHWS+MJ7ajMy5ON
         S56FqdlNRivckGesEDvOLKXtl2K3ged4qqateZYrVXvZISkXtCxKMjoIrLAikY/1Whtg
         +VCbUoJ9XrhrDbJpP5tcBcdo3zK2f1fCQ6bQk3IC637V5OKmI8JUXLzgRXXJCGMmPgWD
         XKmH14q3bYAHKuT3dc4+Z7fFylUAw4Ont8xxhp3BjP2Rsorv82mlNy6iyWKxibLZgvcR
         zSJrRFR+ly5sjgU1TMnGBl8by9tlcg/3n1KlbCbtoIIexawV+CodqBehSva4BuEmmf2z
         DOTQ==
X-Gm-Message-State: ABy/qLaGLY/lQVCVvcZeqenoayQsrORhTk7tNx9Tv8Uqas2fwWEEV8GC
	tVOzG539JBo6fsvnEagB/DHVuAuy2u96R2obM7+u/A==
X-Google-Smtp-Source: APBJJlETTVGODR20/rwVslhngoGW4fSKBoGdRTlMwhh0V6YrmWG0usTUtZoVfuLIpCAbQ7YW2JEtyp8nTpjT009g3QQ=
X-Received: by 2002:a05:6402:1293:b0:51e:5789:a71d with SMTP id
 w19-20020a056402129300b0051e5789a71dmr11910654edv.12.1689162101091; Wed, 12
 Jul 2023 04:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230712083741.7615-1-slark_xiao@163.com>
In-Reply-To: <20230712083741.7615-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 12 Jul 2023 13:41:03 +0200
Message-ID: <CAMZdPi_qcLYGSUYg+4skkNUzUVSV5Fk1Ohe75ZWwyN7=MpfkUg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Dell DW5932e
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, fabio.porcedda@gmail.com, bhelgaas@google.com, 
	song.fc@gmail.com, duke_xinanwen@163.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jul 2023 at 10:38, Slark Xiao <slark_xiao@163.com> wrote:
>
> The DW5932e has 2 variants: eSIM(DW5932e-eSIM) and non-eSIM(DW5932e).
> Both of them are designed based on Qualcomm SDX62 and it will
> align with the Foxconn sdx65 settings.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
