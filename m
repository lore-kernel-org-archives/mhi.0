Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF6B3002DF
	for <mhi@lists.linux.dev>; Fri, 19 Jun 2026 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781894388; cv=pass; b=O2HSVqEN1bYyQG7Witk9+h2jOdNvFO2QUxIJs8psF62PJLYaIyh7CDc77EvtPq+wCAtkJD7xnlRgLlq+wJDaYXyxPBGzC/Rn2udeYoIR8StiiwxBuiG49dNpAwOlbJ+UScXCSL4KuZ+i9m+bHhATXSODbSpyT5dfHMo5u6uSfPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781894388; c=relaxed/simple;
	bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6mwPpNdMJD0/uyGTt7D382UzRL07Fg9As942d0OyAE0lFM4wc6hYDRGFQ6JqnHN51znpuYRC3d0HqgSa3Kq5iGHt/pCzt4kzVLKoVykUa8PaR1iVeGIV0WZm4vqXU1/9oY/9i1iSCCm8ICH9udZIQ9eLYYIYuVwbdVVhVWPMqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M71/ZJjI; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M71/ZJjI"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ad4c229861so1962278e87.2
        for <mhi@lists.linux.dev>; Fri, 19 Jun 2026 11:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781894385; cv=none;
        d=google.com; s=arc-20240605;
        b=SmG5zJImVHS9L4g8qjAi8pk1GiaJ97XVl9lYoolWfFc89Rije3etpFwmkYOEURBgae
         IE0YNqagMYvdGos6devqyOJAlw+hfAlaVC/CaqikMfT+sLfjzNNMj4rTLYreP9oAD74t
         /fewNtgimg1ABp8T6UIW73IhlYnm2ri4Am7eH+N+mXXzfkKa/MBgpmZTkhonuVuX2RGy
         uN+Yn7AYy4zdWGQn3LLf03BQArhegqaQFgV06nJOKx/kWJgvJ3Zm8Hl65Wd8SitP8xCj
         HN8gcK6u02h9iB2X72Sq4XbrJvzPWoufNOfhfDMyOWamE2mMhCADLt2uAKcZV4nHGncl
         jbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        fh=a0egc+bS+JyCDHqLpMKimWbjJFATJWhBEzsaemwtEoc=;
        b=GFpAcBpBnMMT3/RB1XcH5g/li8vW2HHqgvAhzVQ8hNG+w6PWoQxCkCa4Q4MYzdCN6h
         l6LveBi7OUvdKojt+Y2T/UK81hLZlfwnJ7Fz8sgPVhDM5AulQy/ahaLGqH46Uu8FHDBD
         xz6S7nlOfaj2ezoFREGEW/7iuW1RQ4kP2xqSRNE8tLjm3U3RdXV3pT0hUHR83+2fnGkL
         1KwYVrLWy6wTkqnuVS1B0oPJblhloOYGgj/gE2TDQYzPD6jAjzFaNLobHK5jPvhYZMMN
         pMuobx+XJXvRupmS211CUK0ZDHIQfX3/GY1It+ztk44dcIXEQMtugCFLxwN50YVYHIE7
         Y64Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781894385; x=1782499185; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=M71/ZJjIxXSejRIWkonsbJbnDhQH0jeIvajUG+0Jr0fRbf7Yf3DgoLhWZvKwyfp2ew
         UnMQNd6nCnHA5ftHO8Yt3WQW8a6cYMgHBOqd4ARunQNokjOHrHuIvNRkA2Tjq3269zbt
         8XSz8p3bxcSuk6G75AkCZVcueykG6hctXnBLhTXni/ffpxLWRkmXuWzMf24uAbPt+qAN
         JQsIgZmegw2bATNZYhJtNu7L5ONFvZ2aPc7sNEhG87/t+T/7yn/n9M1vO5pPKy69AguR
         W0kxVNEmficxUPhMJQqd1tjR//Aw2eE+PnJ+1ANLYZCoD0dwA36cEDpDkQOSEhcHBJGD
         j5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781894385; x=1782499185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=HbdW09R7SowkPYeDlsHTrayAxefu2mTyI2Ey6R3f6VTK73/0GbyHvwYFKvkWpA3/XU
         x4ovZRDndNjUiuteD/ry/7TUP+J34yZNjQJE5xCzLrO/+BOvN0wD84Z6pD+XtyKzTrCk
         Rw4MYERKICwER5fcuW28FPv/NInO3l3C3Glw2ig3xdAwfyoa/qJV7KYwfLPDcZfouUKh
         CNm3Iq3VJcbBZThgVvHzcVF1Z7jQPeQdI4RabEXUgRmjszWqUfH0N9xjXCloyiRlffDp
         HTaTsRdzKgpI8eBM6SOHC0+2vFdg8ifhwJBM1PQT9XeKvyNm2ZOrVl4AF83H1K/Pr8xI
         f4qQ==
X-Forwarded-Encrypted: i=1; AFNElJ/brsk0U2Y3aLo3JiS/krXdUHjFqBNkBcs3elErQzmnWcdDyL/JpwF9aZvtyacaGWwpbbQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6hPUWbm+MQxCpZrw+qW2cJ6i7OxCDoZl1jYh0cQl3EIbxG4fc
	r1Noh75wujlqOLqx9q43DwZ5T5+5/CPUd1mVbXzVyOF90GsvUw5Ni0KXTc/R6M3cHZ8sSeiVMXK
	tbnVQaqt503jUTBUWbxDC3ZJTHO37itM=
X-Gm-Gg: AfdE7cm3ndzsz/H9yvl3o45FabZzC+PC29F/UyABPaaLrjrlzWrZaix9BfETrFkj6tZ
	2ODK8THNw6pJ+qAbOKILvq895Ix8IUmFc6c3t7+sMZPJ8iZmIAOXRI0DlrHyP5Mu6hIQGZs3kn1
	gxwd3wFxe8yw1yUBQKHG/Gmz67s2xteiP/qTcO/eLEHyH08I2ds07D7E2kcyZkaSjsb1L2Yofd1
	Ee1Eh6rsz8Bfup2YX6NqXnQ9E++MHd6g7WdAuKjDngyAswjloW/VQQNavssRTGHHGTP6mg9FZfw
	aiKvWIWY
X-Received: by 2002:a05:6512:2c04:b0:5aa:7779:803b with SMTP id
 2adb3069b0e04-5ad5627b383mr1490706e87.5.1781894384458; Fri, 19 Jun 2026
 11:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603195142.2189386-1-dbgh9129@gmail.com>
In-Reply-To: <20260603195142.2189386-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 19 Jun 2026 14:39:33 -0400
X-Gm-Features: AVVi8Cfiwwl8mEN3E3SQ88x5utayZx3_Rw_a-AtNERdcfPbetJlN_gm0OG7DevI
Message-ID: <CACrCO_U-ZVzMAxekDWaL-8Ps++qBLcFLenPA97eJfZajEyz7xw@mail.gmail.com>
Subject: Re: [PATCH v1] bus: mhi: ep: Fix device refcount leak on create failure
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks
