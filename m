Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876033209
	for <mhi@lists.linux.dev>; Wed, 11 Jan 2023 17:10:50 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y1so17458988plb.2
        for <mhi@lists.linux.dev>; Wed, 11 Jan 2023 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wbn0wOToWYz8Hqus0qOCdl65fCabjHuCUD8bFfQCj64=;
        b=PfTiVUep3xEEXd1CwcCgWM/skOcA1SOl2c2pnoewwiTXqAFMRGYHEl3tAboy/P89Sx
         hesN2lBOF8VTEH1Qp04k02SidAjeJqkEOnIdXRBOxY48WBLosMNAJFvvum8BhHb7e1CR
         zVf+o46D6GdR5hmPJEV50J31C38Ei+Sfa3W6CkKm19IakoKwdFz00D4Xz59YhYvmM8DR
         0hnmQK79ppN6iRtRvzIHPNacgW//0PM9q0amW3hax1NyiAEG3XZ4J/8oVlG6Dli1Extt
         zAj40+jCRt9lbx4zbAELmflze88AdQgaPX3RLOW67JGhc24wPdAYagNZ815W6G1ltHnN
         UpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbn0wOToWYz8Hqus0qOCdl65fCabjHuCUD8bFfQCj64=;
        b=Yen69PdbNIZknOgt5HtZOK1LHXrMRvRC99zZxhQPkenxroRQ0M/P/fFm5AgOkhgAX6
         tSMhUGJK9kfuryuV4IL7TTozj0M2EceIzZEtfmImSdns6rv+QzPxTF+I5GVcOuNkev7l
         j1VOW8ZABdBzgwkebgQiU2MOQeF9JD+HLC8eUYsVCrK6AU/aijE8JWZDzg+KQEm1sR8N
         jPkiHeNx+Azv788WGX6JOQX5chkZOYe4Ou5YihG1bnxJ1gUc/3GFkexvq+z/qTpuX6AS
         0LCq3F/GwoOYR4NFGxhNM9rBLD5z8B97y2ACS45xWOmNVn/YBOpk//oU3zt4cYrO+FuB
         2ZQA==
X-Gm-Message-State: AFqh2kpcDL3pNV1Yr9Leb3z1/2/PonmMxcpMIEvb7G8sXGB8r8bJJwPO
	J3mhN29rSqqyPDcggpGnJWf9oqp0Gnt2BI/5u9vBCw==
X-Google-Smtp-Source: AMrXdXuyLrj3KOt2zYA3aATYluNcRvTg5OCBMB3qKOVlm/93ZiJeMguzrue9ZVjvaNF+I7+L+/kGDr2M31vnIlaQdGE=
X-Received: by 2002:a17:902:8643:b0:192:ca49:4c50 with SMTP id
 y3-20020a170902864300b00192ca494c50mr2809774plt.36.1673457049979; Wed, 11 Jan
 2023 09:10:49 -0800 (PST)
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
 <87358hyp3x.fsf@kernel.org>
In-Reply-To: <87358hyp3x.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Jan 2023 18:10:38 +0100
Message-ID: <CA+HBbNGdOrOiCxhSouZ6uRPRnZmsBSAL+wWpLkczMK9cO8Mczg@mail.gmail.com>
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

On Wed, Jan 11, 2023 at 6:10 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> >> Really sorry, I just didn't manage to get this finalised due to other
> >> stuff and now I'm leaving for a two week vacation :(
> >
> > Any news regarding this, I have a PR for ipq807x support in OpenWrt
> > and the current workaround for supporting AHB + PCI or multiple PCI
> > cards is breaking cards like QCA6390 which are obviously really
> > popular.
>
> Sorry, came back only on Monday and trying to catch up slowly. But I
> submitted the RFC now:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20230111170033.32454-1-kvalo@kernel.org/

Great, thanks for that.

Does it depend on firmware-2 being available?

Regards,
Robert
>
> Please take a look and let me know what you think.
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
