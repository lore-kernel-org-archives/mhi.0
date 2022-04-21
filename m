Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1617A
	for <mhi@lists.linux.dev>; Thu, 21 Apr 2022 12:59:43 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id c23so4818357plo.0
        for <mhi@lists.linux.dev>; Thu, 21 Apr 2022 05:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VSJ2rJFM71/kL79jCnpAQ93KJ/x7JSaLjByZLJIvLis=;
        b=bQtAXsYrpcScFVSrq4QfayE0uHz89yJvJj+NWwQJz3uspPNZ7IfaI8i0n4MZTB3C2P
         q5X1w6+0UxgI7xuJsjLYgN2vxjbYCTgEuSwIrxO6btQEvZXb2kc9rX1GTF9c/da9lXb1
         7qzBHOjpjiInSMm/AEtcos16xxEb3L4VPFng5koQvwWdWcnOFcuM7RhhjV+RNVnY/Z7A
         wGIMq+5NiH3sxrQzNiP5Lqx25Ep/AkpKP5FQazdNeRVVFD3v3PzXKKrQU/gNqlBNM2hr
         An1M2YUl7YkKW9ubxieNdfg+dQBk+7RA186t2O7yi+zmPDuwravC2jbaC3rNWul1SQqY
         fqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSJ2rJFM71/kL79jCnpAQ93KJ/x7JSaLjByZLJIvLis=;
        b=H/h/OVSCxmui/cKmJ+CDWBBSh/DI0/sLROCPGIBIGe3a92G3tjK9v1n1EAfs1t0qWb
         HZJ3cpF0Tx/YdfbE+etEuahEGwavhsD0dqB/E9r5chFB+J7Mjx9gCpB+R65drKE1NsAQ
         aFQnkUH/5tIzcRk6aEYyGmEr4R6a3v8lwZeJn/eoiVezt8oAwa4mtGaB2tJwBBuPLFFX
         3DK/qwZQJTeYR8qIeEJI3rfScCFOEXNTAt3dnL+d/BwJuL5vShROJuPMbA20Y6noMiLr
         E0g2+aeIiMQbgJLcF0JZQSeBkfrKRRu0W6NS1CpFAnP6WrX4b5j8At4XWS2u/YN8xBWq
         NPmA==
X-Gm-Message-State: AOAM530oVAwpoR5PYJBU2goxQniDlN0kle+oJbNk/sOURyhXGNqDBtSS
	XYFLhKdotG4Mq+1YH3CH3jmWtBYDF66E3NkwdsVN1A==
X-Google-Smtp-Source: ABdhPJwIQ+2mB3qv1xOCuDVLDbz2dL0D2KptMiV9MvVDYueNqS5LsR0SqIrxmiAg5fGEmFqcn+ZywX4Ga1cLAZuoQPg=
X-Received: by 2002:a17:90a:558a:b0:1c6:fad4:2930 with SMTP id
 c10-20020a17090a558a00b001c6fad42930mr10366902pji.159.1650545983470; Thu, 21
 Apr 2022 05:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220421092141.3984-1-slark_xiao@163.com>
In-Reply-To: <20220421092141.3984-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 21 Apr 2022 14:59:07 +0200
Message-ID: <CAMZdPi9hsxGqiw11hUkN3dmXVUJ6CUXQdb6P7STPWyfPErpUhg@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, hemantk@codeaurora.org, gregkh@linuxfoundation.org, 
	bbhatt@codeaurora.org, christophe.jaillet@wanadoo.fr, 
	thomas.ulrich@thalesgroup.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Apr 2022 at 11:22, Slark Xiao <slark_xiao@163.com> wrote:
>
> MV32-WA is designed based on Qualcomm SDX62, and
> MV32-WB is designed based on QUalcomm SDX65. Both
> products' enumeration would align with previous
> product MV31-W.So we merge MV31 and MV32 to MV3X
> for some common settings.
>
> Fixes: 87693e092bd0 ("bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI")

The patch does not fix a bug, but adds new hardware support.

> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Without the 'fixes' tag:

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
