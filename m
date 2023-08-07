Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5BECA
	for <mhi@lists.linux.dev>; Mon,  7 Aug 2023 07:02:47 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-523108efb36so4573641a12.1
        for <mhi@lists.linux.dev>; Mon, 07 Aug 2023 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691391765; x=1691996565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU5B2EBHhQjBavzHa+Lju5JaCfU4uGI90WK0F+KwopU=;
        b=D2+pEqFLwGX9TPKCDHNgJfpbnfHaC0s9ballaAGrnHGRkH0lJPw53s+B/QJM9iDGeJ
         alreyZzPf2i3J36Q+fEMCXTejIOAsv588jCjFO14PooeZb6nGr58ZmpUCb7mtGJ/Ha2J
         ekoSzfzhiTQQZ08dFSnnkJtOzxce402ynNUrSGHBHkS7XsZm40PQLdwB+yedRbuDNbPk
         y2ab+bXtPVs9MEA9tPhzEIK5Tcx1jXPitRpt8KWJdqexJ5H+PPeCzsX6VMwmFiHY4mIv
         ujqHUrlclo3BOIJSdmKIhwOWnhCHllMIvJKh8nqjAmosFmC64ypVeKNK0x0dFsz60/fI
         fRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691391765; x=1691996565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU5B2EBHhQjBavzHa+Lju5JaCfU4uGI90WK0F+KwopU=;
        b=IXNI6YWzdqUbibQcSwOPODGkJhOBPf3QVUa6YEQsaUmj3qoBjA/KQ28H2XfryvldOX
         aaWSk/S1urBvX5tzkmhqrlwKIs2ksXH9cEvd09AhLxxFf6MK+Swv5am7MaurDX1L9Yv+
         e84Pj6nHkuLR3oAuTJmeS/QSzBozzlwvprbpPsXDfLNwHzhNjKNRO5iaVFGMEK80yw5+
         AmhF9CGKg/FTL49yupH4wKYudfkPX59prqrvy5VHjG/D6PdIWQEnUlLFiL7/6Vv/PM2F
         aA7MQGSbOHaj+nQVA7QFie45tpt3Tvkh6YSflXOTfDPnHBZ08T1ujKMYrwshX3eoIYur
         0+Mg==
X-Gm-Message-State: AOJu0YyRfhTkFKsl/P42d80cpPy3rLqbqcFtztiBKLgHgU+TiJ13ehYi
	1aAzLoEh+L92lcv0tPHNMrDh3wmaE0qoArP1qiNchg==
X-Google-Smtp-Source: AGHT+IE8fCofi961DObv0VFjUtKUaX4ki8nzGwBAjm4iMSth8k6td3HgtEY47o4ONGrjlAN7E72usAGLUfXWmDvnvqM=
X-Received: by 2002:aa7:dada:0:b0:523:3e23:15ab with SMTP id
 x26-20020aa7dada000000b005233e2315abmr600196eds.26.1691391765628; Mon, 07 Aug
 2023 00:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807030454.37255-1-duke_xinanwen@163.com>
In-Reply-To: <20230807030454.37255-1-duke_xinanwen@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 7 Aug 2023 09:02:08 +0200
Message-ID: <CAMZdPi8jijOw5oEeNFkPG1U4qi8cV+MHTE3FAm5oKF49yG5tmA@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for Lenovo RM520N-GL
To: =?UTF-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
Cc: mani@kernel.org, slark_xiao@163.com, fabio.porcedda@gmail.com, 
	johan+linaro@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com, duke.xin@quectel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Aug 2023 at 05:05, Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_xi=
nanwen@163.com> wrote:
>
> The Quectel new RM520N-GL product works with the Quectel's existing
> RM520N-GL modem settings.But this one is designed for lenovo laptop
> usecase, hence Quectel got a new PID.
>
> Signed-off-by: Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_xinanwen@163.c=
om>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
