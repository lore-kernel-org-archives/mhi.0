Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517097A
	for <mhi@lists.linux.dev>; Mon,  4 Apr 2022 07:05:48 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b13so8178267pfv.0
        for <mhi@lists.linux.dev>; Mon, 04 Apr 2022 00:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9RGv/LS+O2kSbyuxARrBEe2LVUddokYjQQ+aO586TDo=;
        b=QYIsZEs0UGdLrC0ERwEndhrqseOZ352Yv5Lld/YINfgm+IR1Wagq9ChtL85zJcY0be
         HL/llDeOtvM36bW4wU7hZE1qRIjnyTyRqqQj3DpFUY0u2KZav+PvH/6lx3vs3MC2p6T/
         +RiZrQTbaeH9sG3LfWtFn5AgpG2dDiiv7MAxpf6IIPKMdLp+XJSdQ3RWx/u8+7kIhIi1
         /jFglwi6Rg5vhkdnSCEQQiIWTUcSZj2X9DF7ADNMyCkPNzNZzZEQpEC/07t4xyq+xPJw
         p3uaYKKZY6XqQ14vUEgYh0Z1Xnvg+shEfK8gVca8wqe3I3cNt9s5Zk5IVZEN1DdvLyMC
         iFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9RGv/LS+O2kSbyuxARrBEe2LVUddokYjQQ+aO586TDo=;
        b=0gFUxkNzCMfNTScDUKJ6Q4CT0kqy1K/ziFCuKc0AjyfiOgsl81KUelGaOTwI+Enk8B
         XFPHU0BMctIjaGXzs+hmtji/Q18VefWbB0kwvMJIMrYSiGkZ7sYEo9k21aJGHn+8G3xh
         wxCGAX97TzZOrK0uNAK0h7X4oBua2coVU0wPe+BkazaClHjklof7VQe7K/YJVbh4U8DD
         KMrVf7biVsWLB7t2JTva3w4Ca7spxVbM0ADqqbhQ2pr0E/ijLnXvHpNIPFgTfcCVBv1J
         FG/oFFcVdtUjutKfTzpf9O982c136nKXoBE87jfGIbVtH3rRo1jVA54ygHjHoOy6AGjj
         zuLQ==
X-Gm-Message-State: AOAM531KG37qruCzaEdSOCb52vqagrvjdiSGEahzqnYc1iFCOjtM4qfT
	T9M6nkrFCpTj00pX0co8hn45DuyI17BHy+VPkEodvg==
X-Google-Smtp-Source: ABdhPJyr4EJ2GdaFWB3CtMS0IRaG/2gAwTeGZSFZmtrO3ONGcy5UJ5F/eR3/A5L+mlokCqLTIzlFUAiUQIlnWsqQYpw=
X-Received: by 2002:a63:5747:0:b0:381:54b9:b083 with SMTP id
 h7-20020a635747000000b0038154b9b083mr24407473pgm.178.1649055947667; Mon, 04
 Apr 2022 00:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220404064149.59634-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20220404064149.59634-1-manivannan.sadhasivam@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 4 Apr 2022 09:05:11 +0200
Message-ID: <CAMZdPi9LppZCpf3zvbSXEtmwSEip4VqBN3Z+JLLqbLrz1HtHiA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add missing poweroff() PM callback
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Apr 2022 at 08:41, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> During hibernation process, once thaw() stage completes, the MHI endpoint
> devices will be in M0 state post recovery. After that, the devices will be
> powered down so that the system can enter the target sleep state. During
> this stage, the PCI core will put the devices in D3hot. But this transition
> is allowed by the MHI spec. The devices can only enter D3hot when it is in
> M3 state.
>
> So for fixing this issue, let's add the poweroff() callback that will get
> executed before putting the system in target sleep state during
> hibernation. This callback will put the device in M3 state and that would
> allow it to receive the D3hot afterwards.
>
> Cc: stable@vger.kernel.org
> Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
> Reported-by: Hemant Kumar <quic_hemantk@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>


> ---
>  drivers/bus/mhi/host/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9527b7d63840..b1c0a8887496 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1085,6 +1085,7 @@ static const struct dev_pm_ops mhi_pci_pm_ops = {
>         .resume = mhi_pci_resume,
>         .freeze = mhi_pci_freeze,
>         .thaw = mhi_pci_restore,
> +       .poweroff = mhi_pci_suspend,
>         .restore = mhi_pci_restore,
>  #endif
>  };
> --
> 2.25.1
>
