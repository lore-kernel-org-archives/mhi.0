Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9455030F81A
	for <mhi@lists.linux.dev>; Tue, 18 Aug 2026 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043026; cv=none; b=bNa4kZrAiJFIwk4hx6+bCjInKfguHwIWtJkgs5op4Ayruzv01Z2D191g2GqvNPLaZachJCVnscQvkIGu8k3e0uO1yx3AsVG0TierQJI+v8rKQ7KFgvoxRfCHnnfNfGDMhMtVO3MQLA6VDttBTKdZ/P5UAJ4TLa1PFQrIrz0BWjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043026; c=relaxed/simple;
	bh=hVjwrs36QDvWL50htkLYGsmbGmGTIUKSnLJBPQH8pPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWuj+HPF5Ax1JNBNYEfwzU64W9nP/NA3YinXZzgncle5qMfdcPW8bUbMdICTMs7B5xzNe+7p1gTFb6i1H28XSZQfUx66Tr6YkRMWwVo1bWwK8iYgALVlAAc+Bx8gzbNFhRwrifk4mOeDubgsA2/TGgmuQW3XPc04BJb8rUs3B8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PCubFW0x; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PCubFW0x"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980dc26022so44110245e9.1
        for <mhi@lists.linux.dev>; Tue, 18 Aug 2026 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787043023; x=1787647823; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g89jeqUdrFfNXRk/XO6uIU0AIb/g2xr+NqXbPSW0USg=;
        b=PCubFW0xkXyoDjmlGDE4l/GkRItqiJdVBAwPKARNkbPTNHbFbhRPtnWyUSqFMUwFJH
         gNyPoo1ON81oQhd2oZtNErr77ocNJmOW9nPTTomRR5I/FGyVVSKPuMaXRy8kJY8lwFny
         PO23NQAnjX1nMpeAIg3w0D1zQCaJXsXzQi0GkWczWF2oiQDp7OBwN0L9jNCwqAqoMG4J
         3uowkJ+KkM/Ci2zyk89lVbst53YV/ND3CWhUF+EbFIdyKgB7sigYANtq3NQ4E8Ds9+GB
         IaygPsXpRqSKLF5dYW/Wx3KqV9EVWCxgbAbKG5IORut/jMO9dNeUemiTOFIFlXa8+4xl
         lObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043023; x=1787647823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g89jeqUdrFfNXRk/XO6uIU0AIb/g2xr+NqXbPSW0USg=;
        b=elmTfwVyq3MEHMaiYTTp98uJ2pbb8HaGZenXFJsTc+hHqf/VHBned5CrL8T8zYoB/Y
         hqXcnZLrR7dPhwfkqa5Zr6+jlczVvuuEyeLFb4it3AV+LIQ4jx7pPstJ1V8FG0U2zwjm
         UftgwaKZA/pLE+1HBCKCFDmrnQtssnwnN3WdJUcDzacOwQ/InM00h1aPdzqKDWwAhsf8
         TNUan9J21kgALNQnbCtIRkBPD44n+lsnaUgPDQKnyxAUQX+zrcVhOq10YcxpUcqmpCXy
         zh/iP0LITDQ4IFVzl1NkTZ0m33+vgA7dRXoeNLF6IqG6JpWkq5rrWDq0YmfcSxpcKB3X
         niyA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5xiD3NY57IcBbgu8Raj3HvQ66oXoHufqk/XiLIKv5wLROW1EVXXz9TT3S2U/bUYh+DPg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyttvDih5c/YSw9QSKIPXpFpoE1+jbE6mGuVNWRnkezlYbDVue1
	fnDT5Lqu2AaTi9gXs8TMngrnjIEyO8qJKThcRNWnZpJHKM9trXce3q/A4BXgXfIsvL8=
X-Gm-Gg: AR+sD10nxKgJdc/01kXN5jDQa24Uq2bB8/9686s7C7lNdfXebyX9Tt082IrXzHwe7gX
	s2i+enuky1FGMPD/hPLXe8JuJLycE3cLicOo/LtheoLY0ajZyNnO/L8rZw06hvrFyTI4e83i+Ny
	L3YeRVnVDt6eFvzuC3/BNPMwurFlz9MrsBIN3UFYJophRS69WIU3Ejh6UyrhqNIMsMUE/ZQ0GsP
	X/yCPjp91QA+D7sneyBTziL+5kdiIggjHJX3iGN3I3AziKXdm8r3Z+PPxebCZo7/OHDu7Bhh0b5
	Z9+A2PNdh2O/0CKjYzFW+PD4SON3Qo1yoaFk8SoPTKvHc17B97fNSTCNeCzMTuiIsDEJsUGGOd/
	nIVFn5AFE9//rIUGGrWii8ev9lIR1n3pDoHvHpOQdTI2DnB5N8WKwo3wAFTcg545A2FD9KFhhAy
	zNZhLp13RcUWJOnbQBK70si2bJxB72XVBpRdBiBXH1Z7qqYdymgsks2zyqe57oRgrAIFHlzJqoA
	rVbmErzgkqkK0f1V4r/VgT12JdX4Rnt46Z04RBtz3+13b7H00NRsi+AhZUbfJXv
X-Received: by 2002:a05:600c:4f52:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4998793dafcmr498537755e9.7.1787043022601;
        Tue, 18 Aug 2026 01:50:22 -0700 (PDT)
Received: from localhost (p200300f65f01710416869d85a644e839.dip0.t-ipconnect.de. [2003:f6:5f01:7104:1686:9d85:a644:e839])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49996183b89sm277907285e9.12.2026.08.18.01.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:50:21 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:50:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Message-ID: <aoQbo-k7QA5YpUNm@monoceros>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55khwhgfrwnyjsj7"
Content-Disposition: inline
In-Reply-To: <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>


--55khwhgfrwnyjsj7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
MIME-Version: 1.0

Hello,

On Mon, Aug 17, 2026 at 03:44:34PM +0530, Sumit Kumar wrote:
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>

Please rely on <linux/mhi.h> to provide mhi_device_id and drop the
inclusion for <linux/mod_devicetable.h>. The latter header is ugly and
should go away soon.

> [...]
> +static struct attribute *mhi_loopback_attrs[] = {
> +	&dev_attr_tre_size.attr,
> +	&dev_attr_max_tre_size.attr,
> +	&dev_attr_num_tre.attr,
> +	&dev_attr_start.attr,
> +	NULL,

Please no , after sentinel entries.

> +};
> +
> +static const struct attribute_group mhi_loopback_group = {
> +	.attrs = mhi_loopback_attrs,
> +};
> +
> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
> +			      const struct mhi_device_id *id)
> +{
> +	struct mhi_loopback *loopback;
> +	int ret;
> +
> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
> +	if (!loopback)
> +		return -ENOMEM;
> +
> +	loopback->mdev = mhi_dev;
> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
> +
> +	mutex_init(&loopback->lb_mutex);
> +	init_completion(&loopback->comp);
> +
> +	dev_set_drvdata(&mhi_dev->dev, loopback);
> +
> +	ret = mhi_prepare_for_transfer(mhi_dev);
> +	if (ret) {
> +		dev_err(&mhi_dev->dev, "Failed to prepare for transfers: %d\n", ret);

dev_err_probe() please.

> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
> +	if (ret) {
> +		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
> +		mhi_unprepare_from_transfer(mhi_dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
> +{
> +	/* Blocks until any in-progress store() has returned */
> +	sysfs_remove_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
> +	mhi_unprepare_from_transfer(mhi_dev);
> +}
> +
> +static const struct mhi_device_id mhi_loopback_id_table[] = {
> +	{ .chan = "LOOPBACK"},
> +	{}

{ } (i.e. a space between the curly braces) is the more common way to
write that. Please also add a space before the closing } in the line
above.

> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);

Best regards
Uwe

--55khwhgfrwnyjsj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEHMgACgkQj4D7WH0S
/k4Yugf/VIbH7UA6qkvWrTAx0hVC7cD+37HWFqkx+JBQkWIH3GNC4GBqdiFF0QUt
SbQ7kzmrBFpVoag3BE7OyuFRYkUTToDJ1gPrBpCTaar1L620vJhADxQyeMqLgDVn
gTxRAIgZt47wXLmyyAd2NP1bD5fw5o1IOf1mmSBEuIyIG2j1Kx+k9DIHLU3bSaMw
6ZBZSVUvM7twDtxUGqLchNqtPwM8I/X0HTEw8CUrEmnACQBdU4Epf7i2Q/+HiJ/k
/SrieoMHYSbZdwdD/OIBpDVNurLU1uOfWU73VY7FWgTlx7pxhNgVn8ijH8vY1rm2
ZAlWvXubjzmvOR4Yf+URP8R72NhMuw==
=n/i3
-----END PGP SIGNATURE-----

--55khwhgfrwnyjsj7--
