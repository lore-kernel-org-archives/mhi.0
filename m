Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BEF7E1
	for <mhi@lists.linux.dev>; Tue, 27 Sep 2022 10:05:37 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id r5so3422526ilm.10
        for <mhi@lists.linux.dev>; Tue, 27 Sep 2022 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KMDPm9tfxqbkL9YemYDxZDKB4K9QzyoYtKdQxEFag6I=;
        b=CoDsXSwd8sG5Bs4BldgrkYONAW+DokpelmfcLoj9fOBdnH6QeSLExEsirl7Ls3MAq9
         mDzqWzv9HEChi13yiwgkXnr0KuxVjZpBA953zPf0Dlc1SrByIH7+GcL+/kK4Nun7PXVG
         kSP5xEX+gNvHP3dD5p1mHhebRdAIoLwit7UNH6iOe+q8uXyOwqHfEZYUjXQ9sp6CmwiU
         0btSngNIf2zY7tXDtfjLM/6R8G35T+DhSw5v2gBJLXpxtDu3fVckk93Rc/JukJWeFohp
         nD2on5+KGkJ7NdkAs8w4Pxl7G39BcvQ0jRJbJ7LAbsA25hfSuQzmuuGluBL/rULv3zwR
         DFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KMDPm9tfxqbkL9YemYDxZDKB4K9QzyoYtKdQxEFag6I=;
        b=iJt3fsdQIdIzfMdEmrt/0wXyFjFjHKoNdnqhLSxAC1ex/kPhuNDbmiUX9XL8Lw2Y7W
         uEoia4JFxsxMwbfKLKOWG3rgP2ktfwq68EcrFv2ZiLpFYyQ2WNTgvzzxTBlmPH0bASmc
         nWjJdrFDRBgY5uhkheBkOpZ+R/3TVPXUz+eOhPi2qASsDzAM0ZAdP4SN+cHaMERZq2/a
         Nb/OMBp8xZf7Y4gCwtKq4IuWZZ8PNLHwbbBU3HVD/aWYDESv4dmJQFXwxrvlLaEuoDJM
         aIRuvVQ5i1F/jT1WElqvPYG78p3x0rGPdP9VbWreagaYmPoTZmZUth+od8eMvz8QwDeu
         cOzw==
X-Gm-Message-State: ACrzQf0QpJHuSoQpKuFAC6uyTloICAy7fPbCjv5T5Eo+CZL1/llPllVR
	oGIaBBwqpVk0PANCn36K94vEKe9JQF9ZK0PKMF0RMg==
X-Google-Smtp-Source: AMsMyM5qtPTHDyEOFZW8f8BH9J8kzgkGtIgU5GquNcVOxcmrhNri4fDu8OutQMG+p1if1aaTHEpF3JJBrbItEkTn+zQ=
X-Received: by 2002:a05:6e02:12cf:b0:2f5:ddd9:b3d3 with SMTP id
 i15-20020a056e0212cf00b002f5ddd9b3d3mr12322716ilm.122.1664273136354; Tue, 27
 Sep 2022 03:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1664272126-82706-1-git-send-email-quic_qianyu@quicinc.com>
In-Reply-To: <1664272126-82706-1-git-send-email-quic_qianyu@quicinc.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 27 Sep 2022 12:04:59 +0200
Message-ID: <CAMZdPi_u75BVP9scBCV3OToGhmOgJ7df599-OYw9D6iXsdgdOg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: Use mhi_soc_reset() API in place of
 register write
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, mrana@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Sept 2022 at 11:49, Qiang Yu <quic_qianyu@quicinc.com> wrote:
>
> Currently, a direct register write is used when ramdump collection
> in panic path occurs. Replace that with new mhi_soc_reset() API
> such that a controller defined reset() function is exercised if
> one is present and the regular SOC reset is done if it is not.
>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/bus/mhi/host/boot.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 5bed8b51..79a0eec 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -118,9 +118,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
>                         /* Hardware reset so force device to enter RDDM */
>                         dev_dbg(dev,
>                                 "Did not enter RDDM, do a host req reset\n");
> -                       mhi_write_reg(mhi_cntrl, mhi_cntrl->regs,
> -                                     MHI_SOC_RESET_REQ_OFFSET,
> -                                     MHI_SOC_RESET_REQ);
> +                       mhi_soc_reset(mhi_cntrl);
>                         udelay(delayus);
>                 }
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
