Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04E7460
	for <mhi@lists.linux.dev>; Fri, 23 Jun 2023 23:45:17 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-668711086f4so884222b3a.1
        for <mhi@lists.linux.dev>; Fri, 23 Jun 2023 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687563917; x=1690155917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxpqoKiLiXHAYzo2GF/yRNN4ujaz4VhDxbbYENoZ7HE=;
        b=MO5Uki3XpE8DoU/U9pdbrC+SMdd1H2KLAbjuYzWFlsdCGIiOkj6xMjCmrNwkPxHlYg
         gg/JSMjuPunSfXbqIdQ9X55hKImJNSiLi4B0AwwWJDyuqsLiCRllyCE2ITFjgLCNc7ON
         9HA4X+tEwV2L6eky+lcR1MlmUzdMt/kvCzxvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687563917; x=1690155917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxpqoKiLiXHAYzo2GF/yRNN4ujaz4VhDxbbYENoZ7HE=;
        b=dTWSjuHm0ulVfg4PzZwL4klnFWgJJmUG6+dkZxMoPmSZTFMBxEc9LFdmNDHjF19a0O
         BvT/1M9HYyhiIwEv6ZRdEX8AAxPHxcADTOVrbyl3lBLjj45Ibwl2gTcI3dM7DpsFFOIa
         KEk7EIa/dvIX8nxtVc27ysYyWHkAXzkVdGcpELr+Q3RZYx0pfz8mzffLrD8sJnmtNdeP
         S47ob0yQiAjS3X3iEBaCnnGfBGrSOTmw0hhFgDQmXCO6GrF5hRCm/b9Z7Yzjta3UU5B6
         JCal6bQJ95qP4zGZQzz4WY+GE8BmUChNRPyf2OMzYdsgxEZYCZRiazdYb4clWNDMungA
         91zg==
X-Gm-Message-State: AC+VfDyy8TjHykeG0hoSR//kLteqUOccm5ZQgLFTDPtjmkHeHxYzxL7R
	m/R46l62SzTitJ7KTFY6rl8qtg==
X-Google-Smtp-Source: ACHHUZ54SvsRZGuby7rh6NGkLzQV2rO8W2svdlmGiXVK6ldfvev3mbsAUeaWTAJ9SaJHOMXk4MXy/A==
X-Received: by 2002:a05:6a20:12c4:b0:123:152d:d46b with SMTP id v4-20020a056a2012c400b00123152dd46bmr14778534pzg.26.1687563917013;
        Fri, 23 Jun 2023 16:45:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7809a000000b0062cf75a9e6bsm70691pff.131.2023.06.23.16.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 16:45:16 -0700 (PDT)
Date: Fri, 23 Jun 2023 16:45:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Manivannan Sadhasivam <mani@kernel.org>,
	kernel-janitors@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/26] bus: mhi: host: use array_size
Message-ID: <202306231639.68955384A@keescook>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-11-Julia.Lawall@inria.fr>
 <3b4ff79b-93b4-cf56-1488-113905b3981d@quicinc.com>
 <alpine.DEB.2.22.394.2306232340510.3129@hadrien>
 <58cb3bf6-5ffd-194b-1455-4e5bb045fc34@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58cb3bf6-5ffd-194b-1455-4e5bb045fc34@quicinc.com>

On Fri, Jun 23, 2023 at 04:09:46PM -0600, Jeffrey Hugo wrote:
> Kees, would you please chime in and educate me here?  I feel like I'm
> missing something important here.

The array_size() family will saturate at SIZE_MAX (rather than potentially
wrapping around). No allocator can fulfil a 18446744073709551615 byte
(18 exabyte) allocation. :) So the NULL return value will (hopefully)
trigger an error path.

-- 
Kees Cook
