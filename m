Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB84DD3B4
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791837814; cv=none; b=VQ4sNiFTV5f5tDeHtAnkAAoE7CbeoE5tIGpZwO9heipVxolJqYwPkvJPbg+fI9p6HwEOWndWboBInEpp7/srgA/eH5WLf4k23sniw3zIr5gs9i28G9SjfHfh5Xq2A0eHaGXxL4MNmskvfy6LczNAzP0ON/BxIcOB0D2WYjfG2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791837814; c=relaxed/simple;
	bh=SWVAfflsvR7uwsFRFLUgJMbObCSKiB2/FdyOcDm66zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqhUKCIG5shi3Vxz3Q3u+t1T/o63SEozbew/yQUGN2R1JxE0H+g+u3/LmpWP7A8RgWdzNBXCVwzHOtYcYqGVTNCpAN+6AprFwmH0bJeCW+ateprk1cbLxrcolL7N6beauGKiwgO+F7PCrKN1akNUY3oZ+3CW7RpFZZ8aCTVgtw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EGMPsDFk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EGMPsDFk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c411d6615so1593269f8f.3
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791837811; x=1792442611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XK+SEB+e/GS3thSnPWg9ZaAuDfBuOx8piTMr3Esm78A=;
        b=EGMPsDFkor0LKUiWJPQE7Dj1Bnwvr/hOV7mIzt4/b3VveGylSHTYgscxZ/7Ginm5tn
         ihhoLtDggGx679GL6/Xyy33vVTki+O6tllraew+oqsX0vvpaGmb8HmuzIgfgXdo1ytdI
         bUQNtlyMuvsjrbCwTMFeGB0dWg07zZSXt9JdUU7iNKwIogya4A/r5RTmLPhtA9psd0ZO
         Bxkko1R6iV4s+vhh+7UhFElF7/7uTabzg3Vcf/C1GlUpe06/J9ICXfUPqESla7gyrvmk
         vpRuNNByJ+HblK/Ky3rtjXOFO5ZcNaPnPIU72yNM8HQhnQZQOiq7JnBCAeV7gOeB//FJ
         3XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837811; x=1792442611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK+SEB+e/GS3thSnPWg9ZaAuDfBuOx8piTMr3Esm78A=;
        b=Vlqb3ddO6Tius+3WhrpDCGnbZALXnTEdD8uH+BEub0wOQk/P51LAWvpV/BMbbncWRA
         EAVeu7GIAqw07zIB4AMizq0bbeHPyh+hCeEepzHrMBTAu5OZJeowOPFhkpk4Zlfn6w13
         /uuuOuGYCXbmy9UP/PkTXV2/J1Dqkg2Y0AOhG6IK6R+4f13OJShjoUNMp/4NhD2xGYcj
         8nBetZysLLy9bGzEOyuK1menV4vKhtuBsrGnPHusEf7i/RjImoOou2e7Q0WUrBgYeXi5
         cElYRaNlMBMq02U9ddkTtgkBlMTj3W/jubuTTJJH4aZ6hCwcrilE10GhnODUgN799ICA
         egvA==
X-Forwarded-Encrypted: i=1; AKwUvByVrINth4k8qGNXqJxwtbQ/Flh1EHacVSgnrFivElKS6xoDh2Z0zYY6j6hvqMxo3ZQsvtQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLoaRK5abcjBG5MuxkC4PPRiqIoGXurOgaiwhaWYTXDzsJrxHy5
	3qx5SlIYYEdbgsPbi9TORKeAlL6dPpd+DrPolEgYiLTsqYix3h6Bb3iQdpp1unn/D2Y=
X-Gm-Gg: AYBFou1EYw0SWr96BhCliCQtdWOOARcIg7KzbzUQMH/MfPq7VRkDX7FTChYdC/E6BzS
	O2hdZATgmb7dS1Uv6b1+MrIrvJ/C7r2CyUfaBb1Qhbi2WwPhHc+dBGlbR9ckfdDg/MOagaMa54M
	rH6VMDjp7662+UY461Tp7KGLY87woMw+/lExb1X9qnov3Hh/48TsTsUoIjA+MPPkypWFQw3wQm4
	m6fWyulewpKBR5CKkmYhDQn2d2tuQ0z5b9vc+MC+ZY+zL0wEVk6uvbb9g4HYo9c6KBcOYfQrhOl
	fyMJw//X341R1xya4kSAhqGUo6OWKeO4DEMWYwmF2NQqz80ZuQMuQPPnCy8XvPE5n4yJ8LC/R0L
	SmVjbOLpAqpH19hmd17yDxSPI9p8MksBYiOJX+lPxGmnjjNNYcdipEkEacR9GL/DB8Wrb655EHs
	yH27+EXDg4YiRSYoIUzuDw6OUhnFcqvQPjW++kr+D0speIdmf8PXoANOIsm7FH0uoLsNfFkF30L
	g8=
X-Received: by 2002:a05:600c:548e:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a18e4aa057mr205547665e9.17.1791837811442;
        Mon, 12 Oct 2026 13:43:31 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a199e5db12sm197660805e9.2.2026.10.12.13.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:43:30 -0700 (PDT)
Date: Mon, 12 Oct 2026 22:43:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
Message-ID: <as1F08YNeWz_1bre@monoceros>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
 <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k75v5fxmll73bi5h"
Content-Disposition: inline
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>


--k75v5fxmll73bi5h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 11:48:00PM +0530, Kishore Batta wrote:
>  #include <linux/devcoredump.h>
>  #include <linux/firmware.h>
>  #include <linux/limits.h>
>  #include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>

Why? There isn't even a (new) usage of any *_device_id. There is a
mhi_device_id, please rely on linux/mhi.h to provide that. The main
effect of including linux/mod_devicetable.h is that the driver grows
many unneeded dependencies, so don't.

Best regards
Uwe

--k75v5fxmll73bi5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrNRm4ACgkQj4D7WH0S
/k4JaAf+LQbc81GUcwrqUE1hp5/ZCb05DUb37f03Yl819y3z00pXYZgwXJDUTd9T
GxJKc/iB9t1KKUv41uObbdOWw/pX8fpB4QMUgZQ1hlt7cRumJE11HOvk3ieg5WNf
pb4dIHEZGziIGLgCybUc7cofDnbPzwRnzZHOM7ngjQ1pg6U7wFlwInyjQD9mkett
cBtgIfwxlb61WfBOpmn2HajtmR/jVHmrj28oEqs6rJYH4yqR5eDpna/VhGCLfSV6
/AGqL77ZVNBz+bljTJO/GmIXlHHKNMQ9siCwfbX8dqLVG+HqxQB9+07RAtKA7t3q
ehCntiPriE7DoQa/XfRDpRlCwDiqzA==
=+TQr
-----END PGP SIGNATURE-----

--k75v5fxmll73bi5h--
