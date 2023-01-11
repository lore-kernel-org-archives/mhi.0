Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8BF17EF
	for <mhi@lists.linux.dev>; Wed, 11 Jan 2023 09:21:25 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s8so7831248plk.5
        for <mhi@lists.linux.dev>; Wed, 11 Jan 2023 01:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BDAYJ0rba9Lt9b0XJjJxh+A0UhRZ127T1rCwiGZHjnc=;
        b=x2XQxLUwZR2yYsRMaInf7HWF92ZLD+A8Ta/XpfOy9ltRTG81C6B4t3CzTcmvP7jz3/
         lWh6f2dtGJ219/jUuv2iH7m/U4NGBjFHzp4071AJBOgyXRI1ViS2OKfAS8IL4VqJH41J
         Sy8z6MGyzL59k+PLtxV0hmjP4lkCDie1EJO1VFeVSeJqtTm1ierzThCCy4zhfPI1bJJq
         WFxrtIqvv7HqOo8fSEqABusv8jmYDrsdBNamTK0v9HWaNAQhTdj17J1A/NH1zrh3/0Vf
         IZODWNH23nkOj9DJvhqo5rr6LJGyKBZnO2cbdGaE+ivTzuOeqxf0C3NlLLut3Tsm9Dtq
         uu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDAYJ0rba9Lt9b0XJjJxh+A0UhRZ127T1rCwiGZHjnc=;
        b=Je/e/FYVrBAIbfEGBxYrhMlozcVRyZPpanNCIr8PI7DKLvsQIN3DS8/xvRVGVdBPa2
         hg/1KfAqsIz9/kAui7ttuh7rGnHZFOOJKFdc1c2s0B/GblDNd0NIDzC8FHzX26cyjYEL
         Ei0W8KQ1ATzMpn2Xd7VZFVgXniDN8TcMrAc+LcxYdwtcYacPWDY0ARDEGrjO6maAkbRx
         Xxr4m/v9Je4dSytTdK1gktn7kse/V91kG64orAEYj8kejwDnk8u2GLJ5wh9VjD5MnAEF
         5tLveT8LBftzUDQoxN1xiqgvWqjJPxSCngbQwmDgExyCSLZOK5I7Q3tG/hxl2QpbpCyS
         4baw==
X-Gm-Message-State: AFqh2kqlk9+Ae+tSamMYjA5WbB7nJfXVQb5FQKrwSSabQji9E98Uwk6e
	H8Jzg0dNIZcJfzjqEs7yr02579P6IDJsjnquuJxzAA==
X-Google-Smtp-Source: AMrXdXs1BfLQg12NC/c7gfJ2HOmIPIiSva1z4dPZByoL2IWMaM3TOIFUfRduiYyr0b0soYPNL3Jt1Ey8jdQq4xjQLaw=
X-Received: by 2002:a17:90b:48cf:b0:226:164f:522e with SMTP id
 li15-20020a17090b48cf00b00226164f522emr3628516pjb.22.1673428885353; Wed, 11
 Jan 2023 01:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org>
In-Reply-To: <87k02jzgkz.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Jan 2023 10:21:14 +0100
Message-ID: <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
To: Kalle Valo <kvalo@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Robert Marko <robimarko@gmail.com>, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	gregkh@linuxfoundation.org, elder@linaro.org, hemantk@codeaurora.org, 
	quic_jhugo@quicinc.com, quic_qianyu@quicinc.com, bbhatt@codeaurora.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Really sorry, I just didn't manage to get this finalised due to other
> stuff and now I'm leaving for a two week vacation :(

Any news regarding this, I have a PR for ipq807x support in OpenWrt
and the current workaround for supporting AHB + PCI or multiple PCI
cards is breaking cards like QCA6390 which are obviously really
popular.

Regards,
Robert
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
