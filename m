Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEB4C70
	for <mhi@lists.linux.dev>; Mon, 19 Sep 2022 13:22:21 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id y136so28092313pfb.3
        for <mhi@lists.linux.dev>; Mon, 19 Sep 2022 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XBEHv8ghKU0ZkmO5aCePvI4i1EV0Le+oBtd2vt+taKo=;
        b=vBLtC+xCcV3zfXN2PeQHL6+pSEHW7C9jVtTYHon/W+wS7M/1zwQlZyiKlB2wyB4AV/
         BM+sH2Kbisj+Hlx+yuhsB9a0GcwKjTm1u8cyEwMYBoCzJhGoRKniGeXx4PzB9NTCOlkk
         ssSM4AwZn5iuSTBW7NplxwMyhxn69mBU2ZpBvrcZz5PBweV0qzIgt3SRloqgDClQ8C08
         +P/Itd4sjzjoKvBJ/ep4uKoeYgFF1sy7zKdwfXb8AbGD52YDWHY0Of13br7vlpnI8bFt
         9ZuqYlTtrVO1KJ3Qql+Q3GFnbGB6cWkB5/v0Q8Ps9JahGaXL089DgmB2AzCK117msMi4
         TMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XBEHv8ghKU0ZkmO5aCePvI4i1EV0Le+oBtd2vt+taKo=;
        b=zdzenx02VFzf2PDfZVEcHmixF1j4S4LL0NM0hFqfUa6+3+RCIZyLitMG/1dhEaYBTi
         0+q2qLvhlKOf5CV+wSHiIDNi56dd9d4w3kySv3AwHKhpG8cOd8IYqKFP2K67RaNZWdYT
         x2jhCeRpHAmGtxGA9hi6tnEqVc+mkxlOTNZOMEoJQahSijB9Hq5QqKffOEMeE91wtTqd
         8yYu1JF36JjDA3nGW052uJQK8ze1fbSUPCXRep/qyejNLHX99SnraogqVYGxzF5XkIgV
         l/grxlneA3YVGImd5d9Eo2HIcf5+h4KX0ipr9vbZduD0LcXTtL7WmNdqVCKtnckzZhpR
         9xAg==
X-Gm-Message-State: ACrzQf2pUXF816plMnzvRYIVnYUpCq6ZOBn8X54Gcac8WQ1enJO0HGZo
	LX91tTQ2LX2Bt+xlWjGP+boDG+DOjyXQqt/RHdLFdQ==
X-Google-Smtp-Source: AMsMyM7VRhI9YdnRfz62PSK+fwQI96gHMYVt7kSw4Jq7YAX+9r8gA7/qgJwaA0Oh8DMDBFaKZlmma0A4PRjaKOz8uhU=
X-Received: by 2002:a63:e07:0:b0:429:8604:d9ad with SMTP id
 d7-20020a630e07000000b004298604d9admr15417800pgl.586.1663593740890; Mon, 19
 Sep 2022 06:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220916144329.243368-1-fabio.porcedda@gmail.com> <20220916144329.243368-2-fabio.porcedda@gmail.com>
In-Reply-To: <20220916144329.243368-2-fabio.porcedda@gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 19 Sep 2022 15:21:44 +0200
Message-ID: <CAMZdPi-hHph8Kuyq5Y-yAMt7BNHpLODnrEuC_zo2s64QCqrbGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: wwan: mhi_wwan_ctrl: Add DUN2 to have a
 secondary AT port
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	mani@kernel.org, ryazanov.s.a@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, dnlplm@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Sept 2022 at 16:43, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
>
> In order to have a secondary AT port add "DUN2".
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> index e4d0f696687f..f7ca52353f40 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -258,6 +258,7 @@ static void mhi_wwan_ctrl_remove(struct mhi_device *mhi_dev)
>
>  static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
>         { .chan = "DUN", .driver_data = WWAN_PORT_AT },
> +       { .chan = "DUN2", .driver_data = WWAN_PORT_AT },
>         { .chan = "MBIM", .driver_data = WWAN_PORT_MBIM },
>         { .chan = "QMI", .driver_data = WWAN_PORT_QMI },
>         { .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
> --
> 2.37.3
>
