Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80735168
	for <mhi@lists.linux.dev>; Thu,  6 Jan 2022 00:20:45 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id e128so1178646iof.1
        for <mhi@lists.linux.dev>; Wed, 05 Jan 2022 16:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=ZWZNAaMYuUOkfqGJtxgdMDo0PTZ6C2mdFW9/wSPlfYQ=;
        b=CfJtSGujrA2TNT3Xw23jHcs2FegGt+FambbYo6Kh4lXBVJoqtncGvPPsxXJ37I3jz8
         XuF5Z1KJSRApnNjlNOxqAY838U4eOk/giezI7HYdQ0URH5HbanXMDX39Psb5Jr1cRWeV
         rRI9f0xbQCmrckIHPrecfiikk28np48jqqQuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=ZWZNAaMYuUOkfqGJtxgdMDo0PTZ6C2mdFW9/wSPlfYQ=;
        b=aXUY8Z46jpuAeM2AlnQBWiisf3i6zAOqE/bSco6AZTxJOaLsExm1aBWkZLR5jWDqa8
         hMrXuxn81KJqvhTe/mjcxE9l8HKl2EX3GtDGgZV4R9gVtjyPbIqgD8/tN5HWK1TsNI3Z
         hTGlysXz9Gkb7wHWgOq8x2rKGgjmJExFBL+5L53zGD09CeDcaNUx1nY6gTJTVHAxM3aw
         OKCToInIMuxoI8AKo0dLdGyqeaITHmj6Hxci2lU8dgMqBkXKGxz6dyDKnffiKpLCTnly
         A593xBnlgmmYKXxLYaBLlcnqIIspmpBmqeMqGGVfpJDxUDmyD9dNaD11TcO9vP+4mzO8
         iEXw==
X-Gm-Message-State: AOAM531tyfEpE7ZYrD+mDN/JyMweB7EewVVGSXw9IIZMeWyuESvcI39f
	biikR/1IZeVIUVkTLZp2P1zmCQ==
X-Google-Smtp-Source: ABdhPJwEAohfzRiEkVBc6VvCbYmtedQJjXtSdczgudU+olr903/NAPGyTJmeU4GOe2w/wWuUIV9jng==
X-Received: by 2002:a05:6602:214a:: with SMTP id y10mr25647617ioy.121.1641428444736;
        Wed, 05 Jan 2022 16:20:44 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id m14sm284397iow.54.2022.01.05.16.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 16:20:44 -0800 (PST)
Message-ID: <dcc9e2c6-c4ce-9a0b-9448-622e9546790d@ieee.org>
Date: Wed, 5 Jan 2022 18:20:43 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
From: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 01/20] bus: mhi: Move host MHI code to "host" directory
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org, quic_jhugo@quicinc.com,
 vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, skananth@codeaurora.org,
 vpernami@codeaurora.org, vbadigan@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-2-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
In-Reply-To: <20211202113553.238011-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> In preparation of the endpoint MHI support, let's move the host MHI code
> to its own "host" directory and adjust the toplevel MHI Kconfig & Makefile.
> 
> While at it, let's also move the "pci_generic" driver to "host" directory
> as it is a host MHI controller driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

This is a fairly trivial movement of code, so I have no real feedback.

					-Alex

> ---
>   drivers/bus/Makefile                      |  2 +-
>   drivers/bus/mhi/Kconfig                   | 27 ++------------------
>   drivers/bus/mhi/Makefile                  |  8 ++----
>   drivers/bus/mhi/host/Kconfig              | 31 +++++++++++++++++++++++
>   drivers/bus/mhi/{core => host}/Makefile   |  4 ++-
>   drivers/bus/mhi/{core => host}/boot.c     |  0
>   drivers/bus/mhi/{core => host}/debugfs.c  |  0
>   drivers/bus/mhi/{core => host}/init.c     |  0
>   drivers/bus/mhi/{core => host}/internal.h |  0
>   drivers/bus/mhi/{core => host}/main.c     |  0
>   drivers/bus/mhi/{ => host}/pci_generic.c  |  0
>   drivers/bus/mhi/{core => host}/pm.c       |  0
>   12 files changed, 39 insertions(+), 33 deletions(-)
>   create mode 100644 drivers/bus/mhi/host/Kconfig
>   rename drivers/bus/mhi/{core => host}/Makefile (54%)
>   rename drivers/bus/mhi/{core => host}/boot.c (100%)
>   rename drivers/bus/mhi/{core => host}/debugfs.c (100%)
>   rename drivers/bus/mhi/{core => host}/init.c (100%)
>   rename drivers/bus/mhi/{core => host}/internal.h (100%)
>   rename drivers/bus/mhi/{core => host}/main.c (100%)
>   rename drivers/bus/mhi/{ => host}/pci_generic.c (100%)
>   rename drivers/bus/mhi/{core => host}/pm.c (100%)
> 
. . .
