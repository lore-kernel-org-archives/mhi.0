Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC0214F9FE
	for <mhi@lists.linux.dev>; Fri, 28 Jun 2024 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566815; cv=none; b=UOs+0cX8hAq/Sy3elz2e4w2ja3xEBWL0/VDoZqPW9mvbcq3+wCAxjfRhhkka3EDtQ6fZhwlHqBvktpYNwZNtqDvnDnzLfwacsTtLw0+1eYMqArm2l56IevbbGNPTpteCXcA0hJwxRRXC+E5Kf+7ad+lhETs7SQaCr0kBAKUxXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566815; c=relaxed/simple;
	bh=awHqXFlxPP8lfjXkvIjxe0HDyxCZOJaYWC2aPxNS3/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHsUcWBldRTqEarKbgF5iLcCIW8+BCgs32r9EOVmJmx8tiXvv7N7XMuk8zLvcdeCHDtXph7+9vNaxwXllwNiqbyhHcKBQbhOrwJOS05ILXZOSXK0t1j3q1Gmi2HxzUM+HHhKxTTY9VwGYAQB5x+ewMW6KUQFYynoW9GiVEYWOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c/Cbm+Ka; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/Cbm+Ka"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so449047e87.1
        for <mhi@lists.linux.dev>; Fri, 28 Jun 2024 02:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719566810; x=1720171610; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJY5fes8y/eceaUuSHKFgSKTtu1p3rY5k3qOE9DAYWM=;
        b=c/Cbm+KaoCdj6KyixM4ydGOg/Wn/snwNOWC1i2HGC0bZKSigYENJ7CJR22Ozneof62
         aBzmaYmJeWRBz5m8vHQBQGnJ2yCgLwlCCDES+T21oDb1Lagvfus3AAInyiqasO9y1PZ4
         6WCpiN02stYLGu50Q3qEUmz/k0nZON2h/vahfziyMGVYgF58CD7sg5GRPfpIYNx3zKUN
         eBS3SeAHFFjIs1wH13rtWo3rx8UvwcUIyJwUsOOF5bN+TQxldinSWsnH0pOiWRES4oGU
         N2M6OPT/cUBz5ZGBfjx3/C4wDqP/82bHvwMxH0qWCrT9vdc0G4PeMcMcmyFMTSyOp5tO
         1u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566810; x=1720171610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJY5fes8y/eceaUuSHKFgSKTtu1p3rY5k3qOE9DAYWM=;
        b=mMNIetMdNieFdw1YcgvaopRzX7Srjr7ABsZI30qKOCFMfwJmw4HfrJcpvuAXVLPBpg
         YYpaNuCg5W3G496TymDXwm9nIS0kMYiTka036O0dvGI3I6XtvNbPHsuyeqevSxhYAPKy
         qpK1SSZZRBa5KOh7sqBVY5lIn2N9AQpcIOdvMlGOSB/FTZGiIk5uiYli7r/CK3cVORSY
         VqEFkc14zjdPrhMJzmqlJMFVeW1R2inQsp05Ey+XeTxvlYMvA6x2RoGwNRuC8hBcEJp4
         oCvqOZkzKfkDsMFdu7bCl6jLCMmk2Sbnt1+wSfEhx7I5A4MlfU7uh4IvUh6JiwdyuPeh
         vJpg==
X-Forwarded-Encrypted: i=1; AJvYcCV2rvbl2paPw6DLX1vjAyL0uuXKuvkaraRpFYsqVZvgsH72ShXfAZfozwYogaxeQWkZWjykqwswJElDHeCF9TFHkPlK
X-Gm-Message-State: AOJu0YxTteY/q2Rg9sS5tx+cRzMxWcm9NyivRv849Tg4tKobfpXu/mO1
	4HQc4LJAjEjQy3NU2iuLBJ8EV+TaInyQdDlWmOyw8qu4+1CK/lgSqMu8P5JynRk=
X-Google-Smtp-Source: AGHT+IGLI7DnhKN2eEpzMawEemRB3nB1IrQwbGOlffIR7dko/3E83SMgD7+zmlsRDlsu7/SFPzQ+iQ==
X-Received: by 2002:a05:6512:1248:b0:52c:e3ae:2737 with SMTP id 2adb3069b0e04-52ce3ae27c9mr12366756e87.68.1719566810593;
        Fri, 28 Jun 2024 02:26:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab27ac2sm222157e87.129.2024.06.28.02.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:26:50 -0700 (PDT)
Date: Fri, 28 Jun 2024 12:26:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, quic_jhugo@quicinc.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <k3vupufeagaaqapzybop45sh7p3hitvcd5xf54nefiucb6fb3n@awtivqfpish2>
References: <20240628073605.1447218-1-slark_xiao@163.com>
 <2xbnsvtzh23al43njugtqpihocyo5gtyuzu4wbd5gmizhs2utf@d2x2gxust3w5>
 <455cd5ee.86ad.1905df8bbab.Coremail.slark_xiao@163.com>
 <31b6372e.8805.1905dfc1c6e.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31b6372e.8805.1905dfc1c6e.Coremail.slark_xiao@163.com>

On Fri, Jun 28, 2024 at 04:35:21PM GMT, Slark Xiao wrote:
> 
> At 2024-06-28 16:31:40, "Slark Xiao" <slark_xiao@163.com> wrote:
> >
> >At 2024-06-28 15:51:54, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org> wrote:
> >>On Fri, Jun 28, 2024 at 03:36:05PM GMT, Slark Xiao wrote:
> >>> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> >>> And also, add firehose support since SDX72.
> >>> 
> >>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >>> ---
> >>> v2: (1). Update the edl file path and name (2). Set SDX72 support
> >>> trigger edl mode by default
> >>> v3: Divide into 2 parts for Foxconn sdx72 platform
> >>
> >>Generic comment: please send all the patches using a single
> >>git-send-email command. This way it will thread them properly, so that
> >>they form a single patchseries in developers's mail clients. Or you can
> >>just use 'b4' tool to manage and send the patchset.
> >>
> >
> >Send again with command "git send-email v3-*.patch ...". Please take a view on that.
> >Thanks.
> >
> 
> Seems no difference in my side. Any difference in your side?

Yes, the In-Reply-To headers have linked them together.

> 
> >>> ---
> >>>  drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++
> >>>  1 file changed, 43 insertions(+)
> >>> 
> >>
> >>
> >>-- 
> >>With best wishes
> >>Dmitry

-- 
With best wishes
Dmitry
