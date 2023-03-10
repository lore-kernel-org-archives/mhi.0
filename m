Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847063B5
	for <mhi@lists.linux.dev>; Fri, 10 Mar 2023 12:18:26 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id j11so6297240lfg.13
        for <mhi@lists.linux.dev>; Fri, 10 Mar 2023 04:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678450704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0qIBavQvCE6UcJYU5B5vFYsQGNnMzPGwVWysAj/n8A=;
        b=Vz44vEYeb40jFle48nBxsOAfOSXfV/73vmnKtFNg4kKQZNSig5lv3c3xTQbNnE5q7E
         NKhx7AQ31SVf7wFlKehpifKHWzW/PQcN8OsHgmSyw6BEcSAg+Oyq03W3E30RWTlOlzRh
         bUZoRP4wV+7ORGt1Szw2Lw7oURYb6FtToPqkqyPOCSmHh4RB9L065figaLkPu/i8zluD
         XjpC0mwzc+41Rwev2oZ7nQGT+W9Wb3MIvHpVkbVm0F1vgvq8Df0DjJk+J93piDQRTk4W
         EhhM8l5663nkR9vQG2hq3RgFt4ZoRK76By7leKp5lWdVs+yNZ7QTHuEOVb0cmI2rn2h7
         7Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678450704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0qIBavQvCE6UcJYU5B5vFYsQGNnMzPGwVWysAj/n8A=;
        b=OifnF7KAEXaUJSS6LvS1h0mlvMcy0qMUqxdyY4EH6n85qZlmFA9uJVPNlnW1SHtQAw
         c/Vw1d3ataur7HZtWXUz/hyjGlgRxHd3esjKvJUghwFcgDJUn8Nvj5bppXDzSUE4AH6H
         uXe4PhFddIn1PmVxIpQczweYM0Q7cJt+VCCwt/2GUuSCDKpkpvYd3cFa2m1llLJnnOkZ
         VGWyRv55tDWqj3T7pXirAuPvzb4fXO5AKWLjB8QjJKI1OEG+NA50haXk1DUfu8bTESWL
         rPT6eK9T17NP9mRfr3/2kSn91+BNM9w6DVjQ7jtxmZEupN9m39fIDsTfZUelztxIhGKn
         SvdQ==
X-Gm-Message-State: AO0yUKU11Rpq9ZTf9TzRWfgF1pxy1CRIVOU6FmHxJ0Gimi6Gft907sWB
	iCLxEXkfSYKSft0A7BEkpL2VAQ==
X-Google-Smtp-Source: AK7set/jqxxNve93tdP/7NeHqO3Ez4ShpHWnW33ibJ0SD9S9dapr8c25RQn6pmC6ETRZEATEdqNJBQ==
X-Received: by 2002:ac2:5095:0:b0:4cc:597b:583e with SMTP id f21-20020ac25095000000b004cc597b583emr7040799lfm.55.1678450704309;
        Fri, 10 Mar 2023 04:18:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w15-20020ac2598f000000b004cafa2bfb7dsm222990lfn.133.2023.03.10.04.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 04:18:23 -0800 (PST)
Message-ID: <c5bc74dc-4926-9830-069a-fb30fbaf3189@linaro.org>
Date: Fri, 10 Mar 2023 14:18:23 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Revert "Add a secondary AT
 port to Telit FN990"
Content-Language: en-GB
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org,
 loic.poulain@linaro.org, fabio.porcedda@gmail.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230310101715.69209-1-slark_xiao@163.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230310101715.69209-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2023 12:17, Slark Xiao wrote:
> This reverts commit 2d5253a096c6057bbf7caa5520856dcdf7eca8bb.
> There are 2 commits with commit message "Add a secondary AT
> port to Telit FN990". But the last one 2d5253a096 was added
> on Foxconn devices. Actually the second AT port of Foxconn
> devices doesn't work in PCIe mode. And the commit message
> mismatch with the changes. So we need to remove it.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Probably also:

Fixes: 2d5253a096c6 ("bus: mhi: host: pci_generic: Add a secondary AT 
port to Telit FN990")

> ---
>   drivers/bus/mhi/host/pci_generic.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 6e13c43a84d1..91d02f84ba21 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -343,8 +343,6 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>   	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>   	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>   	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> -	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> -	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
>   	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>   };

-- 
With best wishes
Dmitry

