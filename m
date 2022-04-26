Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7933C3
	for <mhi@lists.linux.dev>; Tue, 26 Apr 2022 21:26:49 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 15so8720724pgf.4
        for <mhi@lists.linux.dev>; Tue, 26 Apr 2022 14:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PEo4D4bdSYpeDMz9JZm7KkOWj6DXC/CIJId7e4HzmSk=;
        b=b3Gu0eY7U5IQHGKcfdYMdQxoneUyHYN6t0ILw1/E5N15QRMokh322X81jWZmTc+9IN
         o7obfkEb//U9xX33jM5h/00zEKC1nWBwDuzxk34hDB+b5CvdIcheHOPjrbZXY+Ff0uCJ
         wubvdiaCoFgqVsbUy9/tOxBs9sPae45FmhO58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PEo4D4bdSYpeDMz9JZm7KkOWj6DXC/CIJId7e4HzmSk=;
        b=ilbIXP8X9BoC9vPBhdcCLCvNpnvIJn4TwMbJCGvzwAz9XLM0wCj+qc6Ww8p8hrWHnb
         I9YzWVkDWkKPe8ELRZxlhdnug4DygUYr5FRrCVc4UhQUrDTet77Imp2Ub9Nd1GGO/eG8
         W0grOkULX4OjVet0r24ZeuTets9zqGNN22cNwYz/7DyK1lZfu64Zc8OxB9DT6nbJaFZJ
         S4CqUDTZ5mpgpgQGQe40lNTV7RWnelXe/Xo0iGS7VyQHGRNON6HkIjaxKk30wAsFjaIf
         ghDd1Aqw5DRwqb2wyU4Hq8z3eua8Z/gw0EyzqFKKnVf0zMbF/DwKDL70W2e7foK2fqAI
         n6ug==
X-Gm-Message-State: AOAM533+Ileqrf5p9VVKnulSJBEUvNW+ipMdn5+DJK1MhVNobvn1v5Id
	SOtauZ5SYrW5UatJVdNSVHpykg==
X-Google-Smtp-Source: ABdhPJyipjluNCoM0gz1DLluPHYgiDyFHbU5+ZOL4Ij2kGeYbGdD4umggWfLSOZvVh+t4WM1cEIAIw==
X-Received: by 2002:a05:6a00:15d2:b0:50c:e283:f701 with SMTP id o18-20020a056a0015d200b0050ce283f701mr26396606pfu.23.1651008409110;
        Tue, 26 Apr 2022 14:26:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t9-20020a63b249000000b003aae4f10d86sm11358167pgo.94.2022.04.26.14.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 14:26:48 -0700 (PDT)
Date: Tue, 26 Apr 2022 14:26:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Bhaumik Bhatt <bbhatt@codeaurora.org>,
	Paul Davey <paul.davey@alliedtelesis.co.nz>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: replace snprintf with sysfs_emit
Message-ID: <202204261426.FC012A74C7@keescook>
References: <20220426125902.681258-1-wanjiabing@vivo.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426125902.681258-1-wanjiabing@vivo.com>

On Tue, Apr 26, 2022 at 08:58:59PM +0800, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./drivers/bus/mhi/host/init.c:89:8-16: WARNING: use scnprintf or sprintf
> 
> Use sysfs_emit and sysfs_emit_at instead of snprintf.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
