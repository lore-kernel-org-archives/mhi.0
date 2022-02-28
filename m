Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223C87C
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 16:23:55 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id c18so15258006ioc.6
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 08:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QxHj11NmKEuyc0G2RD6G+kXcZ9Pm2N3LC7JblOU15Do=;
        b=ZiHaHT9f4OnOfnsDY4ChjFkcYK1DO1rzO11j0VhRZ6cBHyD2PJTzscX7i9DA6QNeIg
         JGZawxSsrzR3O62E52p0b5OI5ZdGdGjKVHKR3cziHQ898gFoUc3L201rKe2S8S7weBhg
         70+Q82iTXOzLiAvJQSRSDRTKTjFpbcGA4whysXisfr8cokDQizIH4hnB0PXnjIAl6Ng5
         YghnB+i+schye76/Lh6cKG1VPgmvqVqKfj4HLocCrYGKzg1chBzj8USwLrsGsqF41u1G
         oRunTORanq9EqY/PWqYz1H3RHqkosTI9HZoCAiCG6X08fZHr7Ui5VhHSmQWvL6YZraAO
         RcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QxHj11NmKEuyc0G2RD6G+kXcZ9Pm2N3LC7JblOU15Do=;
        b=zESm5wDfMSc72c5VF9TT3Rq+6p47MfrFzbrLflYnEy2G1jJkFepJFQI8aRMBYgcspQ
         +FfMFTysJE68tAn7EAAH8Vtu3DKjPeF+YJi1unGOv2jwQR5Vvjq+VsKUmWAnHiW+Zbik
         2ZEjmd3vWADcrqX9M1lsvAzZ0s4OSYoZC7Td3TLgDEVP+ytDVx4dchxpRbJs5u7ktAmD
         QzfGw0WqXoy56JRw2ztyfwSZttHPkeGeTswXEPeS8KYEQbfkvbn7g/c4zsfggqTT8RB5
         UAXdA1vmXWzNMcI5//Sjttk/UHDDu7f3cXtX/alljkzF6qEq1nyVxxGZk0danjWF1pLw
         sSsg==
X-Gm-Message-State: AOAM531l02yq+FYHDxEQXjqwkp6wL+jCkhLTvqQcOGWJJsaSvlfY15Me
	Z2wc34jNaR7wSfr7uka7Nusv5Q==
X-Google-Smtp-Source: ABdhPJyeL72l3ruTPjseVeq+zJTKGeNdf0b4TTz6Mi0UApBv+h+mKKRrehCw0yu/8KTA/K8Z7Pr6Bw==
X-Received: by 2002:a05:6602:2011:b0:640:dc49:ed8 with SMTP id y17-20020a056602201100b00640dc490ed8mr15582277iod.125.1646065434134;
        Mon, 28 Feb 2022 08:23:54 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id q7-20020a5d87c7000000b0064132d5bd73sm5983611ios.4.2022.02.28.08.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 08:23:53 -0800 (PST)
Message-ID: <85531c16-6891-3fc4-fd02-2ed75a3c1def@linaro.org>
Date: Mon, 28 Feb 2022 10:23:52 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 13/27] bus: mhi: ep: Add support for managing MMIO
 registers
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
 <20220228124344.77359-14-manivannan.sadhasivam@linaro.org>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20220228124344.77359-14-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/22 6:43 AM, Manivannan Sadhasivam wrote:
> Add support for managing the Memory Mapped Input Output (MMIO) registers
> of the MHI bus. All MHI operations are carried out using the MMIO registers
> by both host and the endpoint device.
> 
> The MMIO registers reside inside the endpoint device memory (fixed
> location based on the platform) and the address is passed by the MHI EP
> controller driver during its registration.

I thought it might have been a mistake that MHI_MASK_ROWS_CH_EV_DB
was used when iterating over channels and events.  Now I see it
represents the number of "rows" of 32-bit doorbell registers for
either events or channels.

I guess it might be reasonable to assume the number of event "rows"
is the same as the number of channel rows.  But *maybe* consider
defining them separately, like:
   MHI_MASK_ROWS_CH_DB
   MHI_MASK_ROWS_EV_DB

I also have one more comment below.

Whether or not you implement one or both of these suggestions:

Reviewed-by: Alex Elder <elder@linaro.org>

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/ep/Makefile   |   2 +-
>   drivers/bus/mhi/ep/internal.h |  26 ++++
>   drivers/bus/mhi/ep/main.c     |   6 +-
>   drivers/bus/mhi/ep/mmio.c     | 272 ++++++++++++++++++++++++++++++++++
>   include/linux/mhi_ep.h        |  18 +++
>   5 files changed, 322 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/bus/mhi/ep/mmio.c
> 

. . .

> diff --git a/drivers/bus/mhi/ep/mmio.c b/drivers/bus/mhi/ep/mmio.c
> new file mode 100644
> index 000000000000..311c5d94c4d2
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/mmio.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/io.h>
> +#include <linux/mhi_ep.h>
> +
> +#include "internal.h"
> +

. . .

> +bool mhi_ep_mmio_read_chdb_status_interrupts(struct mhi_ep_cntrl *mhi_cntrl)
> +{
> +	bool chdb = 0;
> +	u32 i;
> +
> +	for (i = 0; i < MHI_MASK_ROWS_CH_EV_DB; i++) {
> +		mhi_cntrl->chdb[i].status = mhi_ep_mmio_read(mhi_cntrl, MHI_CHDB_INT_STATUS_n(i));
> +		chdb |= !!mhi_cntrl->chdb[i].status;

This is fine, but I think I'd prefer this to be:

		if (mhi_cntrl->chdb[i].status)
			chdb = true;

Because you're using a bitwise operator to set a Boolean value.


> +	}
> +
> +	/* Return whether a channel doorbell interrupt occurred or not */
> +	return chdb;
> +}
> +

. . .
