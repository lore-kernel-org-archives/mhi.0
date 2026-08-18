Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80B417BE9
	for <mhi@lists.linux.dev>; Tue, 18 Aug 2026 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043221; cv=none; b=MsqDD7fFsz61+RfkmaDPgrr61SgicaesSxAIWRyyiHiuMzysIo0eY0DGpmYvTuh8Kh/ctXtHisnjWzOK2LYOrjHl+gt6CXQopT1MmXlAJwenquguy9Qb/8z3wdy4rJrut4crJCWtW54+nYoJ32hQ4J+ajcG8EJFjnU5E7nReR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043221; c=relaxed/simple;
	bh=79RYIFF913FaQlkxpRypw1VybVy1tpFdCTmdzw/Dx70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP3u7QJdFue49GlpZR8rIgjf/GCgm+woLDGKLc3Z37LUvuQosWoVLKuR6yOoGDd1E8CG90E9PT1qwJLu04hdI/X2OSUqygVZEcPj1geE+sQan9o2uzCZfOx7ZbU6AhkNJb9G05MAQPfPXNC12kZY/rGa3LLCelU3HS3xAVGXsHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VvUQwVAd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VvUQwVAd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso2014344f8f.0
        for <mhi@lists.linux.dev>; Tue, 18 Aug 2026 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787043219; x=1787648019; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5mBjzB8/1EWlBo8ixiwD3uUsZbNFlGOVh/ZsCswiezY=;
        b=VvUQwVAdShIKE3JpCLR+gikkGFqv8jpi0Qo8ZyNuHgjoa8VA213Hzs7c9eXPctsIfZ
         Q4LY/wDU+EXpf5ThP0C/8D/+n6Qd12osbQ+daeh24FjIJ6vKtCVH/2twb8xNDSmiuJKJ
         iU6AWQYj96Eu0sCCHy36dlvp5U0o7mFD0chfro04LSHQFqSCW0NaFDtmKWAGyY0Kk7sj
         mHAsULw0dl7mp9pIkt70kxz8A4uVg7s3xCBZnV5CLYYdR1Fe7uKDyp1jxKLMaSKy6VRB
         McRsURWq1RN4cN8QbIEr03Qcckd8zMFcU0rNJaOuqG6ZkBNd3lgv0vNGx7cmhIfa3/+O
         uzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043219; x=1787648019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mBjzB8/1EWlBo8ixiwD3uUsZbNFlGOVh/ZsCswiezY=;
        b=QXx74NbdDqF+9UFm9ANRyN1YXrkW6HsfqtU6uObuCK0ZXKbqb7unE9nLZER22lcsiH
         Ng0ZjkZeGh1daMhXNI9aq79fonAYxRktGLuP+fNHNpwd85ckMfUg/5uYUIYWdztGis3k
         XZQcJIyib/BBNLC2FzyAvTSEuVla+tNY9awmf8Xq5PjKfXc9WK5BD75+q2DmYLldF0Vn
         A95kZ0aez/PXt9w78O1EUPPw/zuqwRh60IVZYBffCKDHHQ9WMLgDPkN3gaf9ixG8QfRM
         lpQ97Dt5DaF2pITLAQOtOurYvBsdgnC0p7VUP+Nc/be+raaNnLnB8WsvQgISXU124rax
         95Dg==
X-Forwarded-Encrypted: i=1; AHgh+RpQRb/GHY5mlTZz/g2OgahpjKlemz+hY4uMTfwk9CQgd2/UhDVUlgB47vyb44QYrpocAsY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2QoZAY/+aeihdrlXFR9Allc8jTERKlxMJKOH/D4+rRd6tD4SB
	DZnTmo7fB1IAzPqN2njhxUqZsAT6LOJNHlT3Rm9QIatZ2aXtaUJUQuYMZlzKGoCE2P4=
X-Gm-Gg: AR+sD10kb7raxInstK1Kt0YQNo6zvXNqTL7gEv2ZX9bm8/np+elWSmssNWqG3BiFFWV
	mWOWgCkTmB3ppQ7iIBQFZoGP+lp6II6FcvkBn4/qDQcCLC9VhfHDRzaONsL9pdsWgXe7jF0iIFs
	BrlQhjqfTNCd7aYWawFmoka3SugBUqVo+CVOzA3aH3V3nh6DARCngorYIzgK/fyP/6YAvDIkgnM
	XLYGjgUnuoiC7++yOWt6vkYfY7OQjgfzabVR/bOyN2IZw/U/C3lp+2XCtI3JWQRQmn+8BpK+1Ba
	vrs2j+abElaX9nMBIGhSJu9mI6/nU+ha5WZjoFqVwTUCbLLh2No+Yfu3oTciA2h94V1Rku1dArq
	SsY0n0q3KNDtCBtqeoCR+tIhmZLPBLshw2U7iuNcYR5H6fI/vtTscXy3NZyprOv5ND1pWek2+OO
	xmTq3tePShANhLr9YBn/Vcs7PgCjY+MnMNd3z2Nm0HzuY7kOyacxbCBJ/ALKMvQ8Ov8FP0qPHNA
	va6rYzOIAdI5aTFkCFNOOJrv42yBx7hPtHhi23zAYMjEMFp1mXrOSX4wEv4wj8=
X-Received: by 2002:a05:6000:40da:b0:481:5003:c654 with SMTP id ffacd0b85a97d-482a8ff6003mr10697063f8f.7.1787043218545;
        Tue, 18 Aug 2026 01:53:38 -0700 (PDT)
Received: from localhost (p200300f65f01710416869d85a644e839.dip0.t-ipconnect.de. [2003:f6:5f01:7104:1686:9d85:a644:e839])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-482a5b77f41sm9680514f8f.27.2026.08.18.01.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:53:37 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:53:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
Message-ID: <aoQc2aVZ5MR5OKje@monoceros>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-3-50efc7360b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7oc3zz2p7n6vaxev"
Content-Disposition: inline
In-Reply-To: <20260817-loopback_mhi-v5-3-50efc7360b7f@oss.qualcomm.com>


--7oc3zz2p7n6vaxev
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
MIME-Version: 1.0

Hello,

On Mon, Aug 17, 2026 at 03:44:36PM +0530, Sumit Kumar wrote:
> diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..18a92d6a40e0f7de277d155cdb5495d14a60c19d
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/clients/loopback.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mhi_ep.h>
> +#include <linux/mod_devicetable.h>

Similar as with my feedback for patch #1, please don't use
<linux/mod_devicetable.h>. Either rely on <linux/mhi_ep.h> ->
<linux/mhi.h> -> <linux/device-id/mhi.h>, or explicitly include one of
the these headers but not <linux/mod_devicetable.h>.

> +#include <linux/module.h>
> +#include <linux/string.h>
> +
> [...]
> +static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
> +	{ .chan = "LOOPBACK"},
> +	{}

Again, please add spaces before the closing }.

> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);

Best regards
Uwe

--7oc3zz2p7n6vaxev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEHY0ACgkQj4D7WH0S
/k7YBwgAmrxBnCENBhtnqeEuJ1yhX/F/+5dP+2pviuRThhUBDMwsNGw27KtBZEaU
S5y/S3T7dEbOQyqg9rGireCNBBpuLilhdPhSU/srmyf6MbjL+KrYL1apHKMzEGF6
mO18Q3h9zTatfoUDTQY8ahqDTX4CoOgBzcEfK8Dc9r/GfkT2CVQhC4EkgqVDJN+T
vnlXq8KecLz5ynZM2OVGfHuMCPZi4OGzM8FEzqU1116/67AGYEXhlKbpQfybK0wZ
tNVLfVNkoYRmu67Nlu4aC9vvhj27pNkQ8QvvIYViPhA+Qd3VZL8nBcE74WSWB9AR
rsjBXwRj1qpzw7VK2WnW4MFO8mKvSg==
=0Wif
-----END PGP SIGNATURE-----

--7oc3zz2p7n6vaxev--
