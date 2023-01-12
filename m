Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA7BD19
	for <mhi@lists.linux.dev>; Thu, 12 Jan 2023 09:43:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id y1so19700473plb.2
        for <mhi@lists.linux.dev>; Thu, 12 Jan 2023 01:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCnOI57UTMuZBY8ttuWaWyhOE2RAr35dNvKJuI2jpjo=;
        b=ygbcPKK4FYbKlI0784ZnOo3Y1vhA15ypnakMPlk672u1KjbUYgoAYZVLpiQ2CsCD1n
         pMeo6j6iE/90fiCxgCTTpAy5wkqUWqw9LE5VhJfDFor1q8M1aeZW5tV+XmSid6ZaPkoH
         BilQqYsq37+eAf2Ws9aLkY8HxoVp+hpJapgAZID6KWrJjz4mdj6rv4iJiD+1NNPTRF1L
         fLf5iznch9aVN9mjHJtbZUBtiroso/RJsPwAEjs+eyJWkekbsyJWP3DUnAtrXRudnR3x
         i0N54hDX7EgHZFV9L0UGmgr12AHpE3QGISYtuQ0DYCJpg5Cr/d8vUikXiQb3tXH3HPtn
         jLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCnOI57UTMuZBY8ttuWaWyhOE2RAr35dNvKJuI2jpjo=;
        b=XLhyBia2so0AyJe2ocwormvJMkCvau2usdIfpWRAVqQrkjawmvWIzM8JgRWQvOYJWj
         psYxWV0Sy0AB5JD6QvffEJiJ1/8e1nSl62dDDt5QYjwH0J6t1EtM4jDGVvtEKfRZDEG4
         mo9hB0xznOGIMyn5Nqq52klnAYWX/CvqfAcJKHTFcQddF1K9wO32mKIxQ7ZvOrR5CJ8l
         qeQALF1yE3gB/t4jfVmHL337GdWGPq42U1+/6U4sOh33VY82CSGvd6X857NNN+6/Ueno
         AUP91wyy1AT/9yKLcjQNA9Bkuw9IurUt+kwJcpJx5POeg5WIpGigtrzvB4tJO5sNBZwH
         /qNg==
X-Gm-Message-State: AFqh2krh99cR8qL/HKs2SDYVw8z0kUYfaJ5WEhlLbqMCJHM5grzs+8gc
	YU6qa9BrwuFxKdeZg9SzvKcKg9xJcLGWYZ7lZq4cLw==
X-Google-Smtp-Source: AMrXdXueoMMev/WBFF9vUihTNyWPTMJxjr2hVS/wMKsdd4Z2hy1m7ecn34yBd4kpcw5X3go5dMJsCg4sMDlHq8PGPsU=
X-Received: by 2002:a17:90b:48cf:b0:226:164f:522e with SMTP id
 li15-20020a17090b48cf00b00226164f522emr3948204pjb.22.1673516628746; Thu, 12
 Jan 2023 01:43:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org>
 <877czn8c2n.fsf@kernel.org> <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
 <87k02jzgkz.fsf@kernel.org> <CA+HBbNHi0zTeV0DRmwLjZu+XzUQEZQNnSpBMeQeUPiBu3v-2BQ@mail.gmail.com>
 <87358hyp3x.fsf@kernel.org> <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
 <877cxsdrax.fsf@kernel.org>
In-Reply-To: <877cxsdrax.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 12 Jan 2023 10:43:37 +0100
Message-ID: <CA+HBbNGbg88_3FDu+EZhqMj0UKb8Ja_vyYsxGtmJ_HGt4fNVBQ@mail.gmail.com>
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

On Thu, Jan 12, 2023 at 10:40 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> > On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Robert Marko <robert.marko@sartura.hr> writes:
> >>
> >> >> Really sorry, I just didn't manage to get this finalised due to other
> >> >> stuff and now I'm leaving for a two week vacation :(
> >> >
> >> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
> >> > and the current workaround for supporting AHB + PCI or multiple PCI
> >> > cards is breaking cards like QCA6390 which are obviously really
> >> > popular.
> >>
> >> Sorry, came back only on Monday and trying to catch up slowly. But I
> >> submitted the RFC now:
> >>
> >> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/
> >
> > Great, thanks for that.
> >
> > Does it depend on firmware-2 being available?
>
> The final solution for the users will require firmware-2.bin. But for a
> quick test you can omit the feature bit test by replacing
> "test_bit(ATH11K_FW_FEATURE_MULTI_QRTR_ID, ab->fw.fw_features)" with
> "true". Just make sure that the firmware release you are using supports
> this feature, I believe only recent QCN9074 releases do that.

Hi,
I was able to test on IPQ8074+QCN9074 yesterday by just bypassing the
test and it worked.
Sideffect is that until firmware-2.bin is available cards like QCA6390
wont work like with my
hack.

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
