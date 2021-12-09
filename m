Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10048173
	for <mhi@lists.linux.dev>; Thu,  9 Dec 2021 14:42:40 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so7053031pjb.5
        for <mhi@lists.linux.dev>; Thu, 09 Dec 2021 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DlIzAa6h2Qdf88CQ4XAT+zAj7QyEiJFQv1x54NsjTKU=;
        b=izB4Ze5IwkTdDFN2UPnu25PTURU5BM0L76lRpnraNW9aOiFCIfT4kGA9KN4Hsp9dMI
         5yc45D+bNrTlgL5C6Ns35vhPzcgiVqugDyrdKVBl3GWVdyX7aH9sJ2i2mH2PkzvVFpfp
         FMB917/z54Wigzhm2+DyrWiRkYoIHWWOX/zgAVL3aB4rpx/GZM3/vGM6N0eWJ33hutyk
         cUzhIVJRdLGS1R6INlxbilcEnv2sI9plsP0iJ0PcxwL8zJooz2xqotKh3rt6BZUpHseP
         esFGUNhzXQuhALatzTkkVnEAVh3AG3FQzSy8RCUqvAmqnmf7IyCgQOFebnZCQFUodlQp
         EHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DlIzAa6h2Qdf88CQ4XAT+zAj7QyEiJFQv1x54NsjTKU=;
        b=lZwWBaY6asibnp+b4NyDyo5UQPmdErk+/FCiId3lFy4ZQuAZK7tL4e8bgoiynSO+zl
         lc3CxWpyO/hfaa8rEbd46o6V/+VZTBeMvclWqC3F26ZwK9F7EZfQG+/LXIdlUJopwYe/
         gi/MXWARLYU2crVFth5t1nMFWgdKdG/yQO1uB9ckRVyFulEOvairzkX2zZY0xkyHqBiH
         dJt495RfLJnkX2niosuTY1jNZHks03ukoipzTb5c7kA5pneQ6hg6YuBq/70OHD6WrT87
         NGFEdHbmwulEQYuSgwqNgNJU0qwUImXbNJAp4fRXKoACyDEwYFFgqwIzTaXnQMHGBPX2
         ma5w==
X-Gm-Message-State: AOAM530B5UdWqH3NL93yfrTShvWhXdgwL+mY+xjSY/R+5cLvDMxluL0R
	hoi+1DRxqXlYS5tAgh+B1u92
X-Google-Smtp-Source: ABdhPJxBp3vk9RdIYD+lyw7hUsxgLabInUSRiWT7uujnDncQbAcGGL+tWLA/fU6V5Iel2x2ks7eahA==
X-Received: by 2002:a17:90b:3149:: with SMTP id ip9mr16188630pjb.77.1639060960427;
        Thu, 09 Dec 2021 06:42:40 -0800 (PST)
Received: from thinkpad ([2409:4072:902:fac4:6231:3e3b:50a6:33a7])
        by smtp.gmail.com with ESMTPSA id b1sm5985623pgk.37.2021.12.09.06.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 06:42:39 -0800 (PST)
Date: Thu, 9 Dec 2021 20:12:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: gregkh@linuxfoundation.org, mhi@lists.linux.dev, hemantk@codeaurora.org,
	bbhatt@codeaurora.org, loic.poulain@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	stable@vger.kernel.org, Pengyu Ma <mapengyu@gmail.com>
Subject: Re: [PATCH v2] bus: mhi: core: Add support for forced PM resume
Message-ID: <20211209144233.GA9253@thinkpad>
References: <20211209131633.4168-1-manivannan.sadhasivam@linaro.org>
 <87fsr13kya.fsf@codeaurora.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsr13kya.fsf@codeaurora.org>

On Thu, Dec 09, 2021 at 04:35:25PM +0200, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > From: Loic Poulain <loic.poulain@linaro.org>
> >
> > For whatever reason, some devices like QCA6390, WCN6855 using ath11k
> > are not in M3 state during PM resume, but still functional. The
> > mhi_pm_resume should then not fail in those cases, and let the higher
> > level device specific stack continue resuming process.
> >
> > Add an API mhi_pm_resume_force(), to force resuming irrespective of the
> > current MHI state. This fixes a regression with non functional ath11k WiFi
> > after suspend/resume cycle on some machines.
> >
> > Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179
> >
> > Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> > Cc: stable@vger.kernel.org #5.13
> > Link: https://lore.kernel.org/regressions/871r5p0x2u.fsf@codeaurora.org/
> > Reported-by: Kalle Valo <kvalo@codeaurora.org>
> > Reported-by: Pengyu Ma <mapengyu@gmail.com>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > [mani: Switched to API, added bug report, reported-by tags and CCed stable]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >
> > Changes in v2:
> >
> > * Switched to a new API "mhi_pm_resume_force()" instead of the "force" flag as
> >   suggested by Greg. The "force" flag is now used inside the API.
> >
> > Greg: I'm sending this patch directly to you so that you can apply it to
> > char-misc once we get an ACK from Kalle.
> 
> Thanks! I now tested this patch on top v5.16-rc4 using QCA6390 and
> firmware WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1, no issues found:
> 
> Tested-by: Kalle Valo <kvalo@kernel.org>
> 
> I'm not expecting any conflicts with ath11k, so please take this via
> Greg's tree. It would be really good to get this regression fixed in
> v5.16, so is it possible to send this to -rc releases?
> 
> For the ath11k part:
> 
> Acked-by: Kalle Valo <kvalo@kernel.org>

Thanks. If this patch looks good to Greg, then it will be queued for the next
-rc release.

Thanks,
Mani

> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
