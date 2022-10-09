Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51915139E
	for <mhi@lists.linux.dev>; Sun,  9 Oct 2022 03:30:37 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 2so7784626pgl.7
        for <mhi@lists.linux.dev>; Sat, 08 Oct 2022 20:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WeoADxLl8ydpkkR0e7Ei/IrpXPF9Idl3Bo+EPXIq9+Y=;
        b=Im74RQM8Do2kp3F902NICqXlTaW2ilRva6QMiK785c6EzWulkUjKlhdgPJLTP529nX
         4eaGpiDlr593WZn5pFKHrQFJ+vo7Af96Ivlp4ReMgb0/PJ/neTsObsu3rnpgrfaXLdfN
         6TVQmOD2iGL/qZKLuhDq2J2f5smh/jxOertk1a9Uz3Z1+pyEOhKzylrKnfY++oZ2sTv8
         WOZeakEPQRmyKj/iKPPAFu0aY17UrisMQ6gIzkLx2N82Jdm954stEI2RIYT3HXgqZZLy
         AgLb67BKMojsEaor1MW/wkESMv2++yojfQvK8xHr6h5vtfkD4DRDio2J1Msbggl7DBpv
         qW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeoADxLl8ydpkkR0e7Ei/IrpXPF9Idl3Bo+EPXIq9+Y=;
        b=Y/hu51K9m0wTCpKm8MoSCIpiGEgw2GV/DZlKsGOWw0HzC3egeWX+WYBPiiyPTMtWOO
         DELg91AkzLZe8DHOxOC86o0KUQVE9GOJ2LUcA4cMl59ozEwpTS4jKd8cbyK3gl+aYicc
         aw3f5ugu7cfin47ntY8aOb/rFAZEN5IJyGAHVxqe2ZUrhLeXCmi5d8BDm6vTP6fOuKSC
         bG3uuNEgAa44+nKI3uhsgXuYcGa9NHob/HQ4kPYBl5qq3EWhh1kbXeCq2sdgPFFopEOb
         k3dJubS/M8NdT6Z6GdmiOGLGNkw4wYHARn2OOhQ/cB+iRP1hNM5ilpeZcK9mX4BEcTrb
         TkoQ==
X-Gm-Message-State: ACrzQf26LnbFPLbRyyjMzLxbZXVrDSV2C+wfezNZ2g+/pQEHgpcDVcfW
	giumWgcqtenYtr1KfIm1v9k=
X-Google-Smtp-Source: AMsMyM6zoZGHtxIuAmeNktk38am1wb+Uu3LGrVQAdWEni5DIAZiCui93wGpi4aBjh8k3eqSCkdFBrQ==
X-Received: by 2002:aa7:85d7:0:b0:562:6079:3481 with SMTP id z23-20020aa785d7000000b0056260793481mr12997329pfn.77.1665286236799;
        Sat, 08 Oct 2022 20:30:36 -0700 (PDT)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id ix14-20020a170902f80e00b001780a528540sm4024725plb.93.2022.10.08.20.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Oct 2022 20:30:36 -0700 (PDT)
Message-ID: <7fe1e632-277d-91a7-2818-560acc6451e6@gmail.com>
Date: Sun, 9 Oct 2022 11:30:28 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add HP variant of T99W175
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <quic_hemantk@quicinc.com>
References: <CALL0vWGr0i9Qaf6PYH3V7C5wbV36wSWUSOWKL83uECY9iN+8JA@mail.gmail.com>
 <87y1tq4cvc.fsf@kernel.org>
Content-Language: en-US
From: Song Fuchang <song.fc@gmail.com>
In-Reply-To: <87y1tq4cvc.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, I'll resend this patch with correct name.

在 2022/10/8 22:19, Kalle Valo 写道:
> notsyncing <song.fc@gmail.com> writes:
>
>> The foxconn T99W175 has an HP variant, so add support for it to the
>> pci_generic driver.
>>
>> Signed-off-by: Song Fuchang <song.fc@gmail.com>
> Your name in the From header is wrong:
>
> From: notsyncing <song.fc@gmail.com>
>
