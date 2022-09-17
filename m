Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F871FBD
	for <mhi@lists.linux.dev>; Sat, 17 Sep 2022 13:01:13 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id k13so10997090ilc.11
        for <mhi@lists.linux.dev>; Sat, 17 Sep 2022 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pmOQzOLFS1bvq/UfoCxQwQ27cKIGMTDwAiqU872iItQ=;
        b=l8ZvtYoKqcPfOGVXOiWdbWyT6f5FFAuy/CSPOsQQkGYBaaI+MUhj+Prahc6u1fvgXX
         DKhWnP8chAzgOcYkTcJ/blo3y1/8SKuHEqlBHqKIlBGmp/tSOl2YZJ3NvF1w4iHRaBeP
         2I/aXOEowI5xOxWYRNv6n0K9bcY1rtgOP4AzImCMObmiNraHiCgEbSaBRQfsyXd66epJ
         L+BgMBQjDvLpJR1AA4iFczhw+tYwKGrg+MMID+7l/l2cUIX11+cv8V8sXyxTAfJpnEzc
         lMk4P/wQKVg1X0ozaOrBNfHEbeAD02TTraONXR1RxzSkBjOCdXSZTZPol+ADFjffnU28
         KtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pmOQzOLFS1bvq/UfoCxQwQ27cKIGMTDwAiqU872iItQ=;
        b=XXdtV9pcfFI2X7JuZdwABMAR2CDGXS2zM6jtymJ9+/+i7CpOhQnMQr5XuLsoKgrvyi
         6zf/9qousxTpjZgvaoAl29mPAhcn/Mhm6LKwMhDCZS//CXORaw13LBhEDIhPp3quMS7Q
         WYVtsDSVeo3dvbBoglr7tlwoTUnimx9ZP3KsxItUhWdFh3WHiXeOXG1n0f/PGmho225/
         fp1uzRZ1GFyXuM+T1mzXFVTsTJTWoFN/b/ELzO8ilJF0EttRzK6tHEE2qAC8gkMG+MdK
         u9UcZYkshWpIZXp1+kUbXY6sQkLbt4Xcm3quiNE2X8pWjtck5TEcGlucW1eV6glwl50/
         W4WQ==
X-Gm-Message-State: ACrzQf0faoGpBK/988aon0ar75zqHzVoTkQd9GrOlFdnIiIjIwGuyTNk
	MyotQ4i8VxKmQ6MdcRmDcJ5VgzG6+rXvBTC9tWA=
X-Google-Smtp-Source: AMsMyM4KMzv1esIWasUM+HGwEcBPXoKiZsCzw7O6Gm2Mv2VaL+Ofp+2dke6RuzzQ4s1Pvbai592HzIfHCQuUlwkeHwU=
X-Received: by 2002:a05:6e02:20c3:b0:2f1:b33c:63e4 with SMTP id
 3-20020a056e0220c300b002f1b33c63e4mr4377401ilq.144.1663419672315; Sat, 17 Sep
 2022 06:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220916144329.243368-1-fabio.porcedda@gmail.com>
In-Reply-To: <20220916144329.243368-1-fabio.porcedda@gmail.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Sat, 17 Sep 2022 16:01:05 +0300
Message-ID: <CAHNKnsSTj1TtONqCcjz3AxPEt5dRsPrT=T6i1kj2AO_=qL+25w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add a secondary AT port to the Telit FN990
To: Fabio Porcedda <fabio.porcedda@gmail.com>, loic.poulain@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	mani@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, dnlplm@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello Fabio,

On Fri, Sep 16, 2022 at 5:43 PM Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> In order to add a secondary AT port to the Telit FN990 first add "DUN2"
> to mhi_wwan_ctrl.c, after that add a seconday AT port to the
> Telit FN990 in pci_generic.c
>
> Fabio Porcedda (2):
>   net: wwan: mhi_wwan_ctrl: Add DUN2 to have a secondary AT port
>   bus: mhi: host: pci_generic: Add a secondary AT port to Telit FN990

The code looks good to me, but it needs to be checked by someone who
is familiar with MHI.

Loic, what do you think?

-- 
Sergey
