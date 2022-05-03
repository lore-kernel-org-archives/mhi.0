Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691017E9
	for <mhi@lists.linux.dev>; Tue,  3 May 2022 07:23:01 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id e24so14617976pjt.2
        for <mhi@lists.linux.dev>; Tue, 03 May 2022 00:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYOKOnX/ag89Q7FWf4mTvhnDEvPe9ePWto1EYZGs+OQ=;
        b=kJL+2m3UswGuMwUa2ADnBKx9k7XiM5W2DhfJJnyiYigWx/2+gpJi9pNp+p5CwvOkpJ
         VUs9E5GM/VNuRj1ZxO3KHDcQDVZ/O7X1IQTsVeiD6MMn+j7VYSU0CRis9H7/hjkkpL4s
         oXCheS3gL/+nL90EFP4hNrVHEIc+hFzauf2IHKpXBZe1VylWQJRily8n9UdrzAIvTr0H
         OTZGXUk1E0WqjSRV3FVBRhf8r/mlL4/IMfyAF+5X0eLOyyWaiHrpT/q08sNGvSH5LI4g
         A/wd7jyOlLmL2UMjYCalSQaZzL2YMi50+eCTCQdcE2A9V8pxHd68kL7swWWc1y6oZvq6
         Hz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYOKOnX/ag89Q7FWf4mTvhnDEvPe9ePWto1EYZGs+OQ=;
        b=SeaCGeWrW3PE71dh4YVXvqbDLDseSqrIhjU4hlpqK6uP6i1KzIBq11Egt4meClNGEA
         HKgsMWEFHfF5P85YcQR6R3F08E2Qjn3Omzt0Sids/VhGPUY+bG2NKzXY7eb1PeUA8Rpv
         9iwimydJisDr9w3F7bXLxor00MJDWc03lzzOEli+PJt00PvP1DwiA0NsFLJYt8Svsg3y
         DqpPZb2ca6uULLwZsgfaRepAEXBMgz+SMhSt/G7a2LZDmZRVresUePcUhGaDXKddHvm3
         AAq7z4xlZXhicoctMlyc3snowj4QWEwOE+iKJCotHNgiznrw/itF1WHtaN+dvBTO9too
         v2Vg==
X-Gm-Message-State: AOAM532AjZwAGiRuyDIIXP1oGgHl3yrj+K6EJBNyrdQKQcE1l7mCwOcs
	DIQ23PIG9uPAPjEnfpi8g3ntVrprJxzp3e8vZ9fURw==
X-Google-Smtp-Source: ABdhPJw1s1JswARQvRGebofKaxoOTfTVyYJCUT38LUSf+snPURnEtm8yFrO3id35Fi7bWxmtCBqqpDNYEc7nKS57z0E=
X-Received: by 2002:a17:902:70cb:b0:158:424e:a657 with SMTP id
 l11-20020a17090270cb00b00158424ea657mr15285007plt.6.1651562580619; Tue, 03
 May 2022 00:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220503024349.4486-1-slark_xiao@163.com>
In-Reply-To: <20220503024349.4486-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 3 May 2022 09:22:24 +0200
Message-ID: <CAMZdPi-F96cLTXjCvVEQ7udpbk7KOBsqpMD3E03bE_A+Pkx8JA@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Foxconn T99W373 and T99W368
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, quic_hemantk@quicinc.com, gregkh@linuxfoundation.org, 
	bbhatt@codeaurora.org, christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 May 2022 at 05:03, Slark Xiao <slark_xiao@163.com> wrote:
>
> Product's enumeration align with previous Foxconn
> SDX55, so T99W373(SDX62)/T99W368(SDX65) would use
>  the same config as Foxconn SDX55.
> Remove fw and edl for this new commit.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
