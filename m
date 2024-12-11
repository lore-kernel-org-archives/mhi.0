Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0218A6DE
	for <mhi@lists.linux.dev>; Wed, 11 Dec 2024 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733928808; cv=none; b=PSsVENSQUQge4Mz79SZ6zBvatrGEbTy09aPIndGH+C6EbEpbpAgolaGb1Cchvgw37tyADHENUl8R3isijR31Rej+UD2W2vycFEL8JHDKWfRKVUbJYVZeuw1/Khp/dFU9nM7d8rHiSSla1R4iHGMgUDk2W0jL4/uu8xiqZ1OTBLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733928808; c=relaxed/simple;
	bh=71rnSn7wFVoD21U48pjt1zEn20evixs1VxJ1eb4i9XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjdNdjmuVyYqFgadTF4cHln3y5a1N78Z3Advt8x7rzpPXZ5fU6IMd8eYozPYNJrVI5ITHkOcwbIZWmyjt4wxWTazwrMpJkCdtfFlbxKW5ZbNJUvhLdkXU/ZBD7FefbMJkMUk0HmYhqwUOSL8iC/ipsbeAUnsSWeQsZBP2kt+2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/kNp7qN; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/kNp7qN"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7273967f2f0so2968244b3a.1
        for <mhi@lists.linux.dev>; Wed, 11 Dec 2024 06:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733928806; x=1734533606; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymW0qBk2uaFHFENJ06sbcJsCW5UbRGhhuFjHIPKzUxM=;
        b=S/kNp7qNHEhACQNKGMGCfdmt1XwfEa1dIMHkHgUGUHjRvjhJyaBDQmxk8q1L1FzH7G
         d9QP9VqZDNXgtmhhOWBytZoqKQH8FSb99R2hSWffPsFQMhWka2pJzT2YjpMJvDEFq2IH
         uw0T0nORNhulqpKpUxtrToXEeZiNpYG5sV+wa4SbWn308F3VUxj5ayc3uRLIZpTL2i9/
         ZbCVTD5DyueugWTNREP0OXeWNjGI/FvlhlDYGPJO2U6qtppz2kyFSrFrj2JyvZ9YsLD8
         rNnAFGIRbzIijUTuqTvRv7Pl4tkQ0HUNJe0k/qw4wXet2F+BZ1h9NVlBFUdPm/ERmBuq
         wPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928806; x=1734533606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymW0qBk2uaFHFENJ06sbcJsCW5UbRGhhuFjHIPKzUxM=;
        b=uZ0WjnjiVLKymTDc7gbajOx6paeRHPf1qRzJxY/dsQRcEBl6RFZuj80k2cKYS1gh0q
         xlYmDb7AYPZFOU8OcSt8hOe0r3Z8fThTEvAIJ84ECdcOPN1Bkg4noNi5iDfRPrSAq+IG
         LMN3wBsuAzc2DOkv2PiGJmmifF1R/SgKJNF8xNqUMOv/UtMRca9YVXwVHXNMt4FrQz4A
         2G0e/DpIcxLCwv3krMwG3hH+AP1CIAWFOCVPLdDQCZNqoJErHhMzBqrhjB1Ra84PRlhC
         GIrxoQLzv3z6Ri+a9BMcsA8lRiNiBEfX1Qyv6Z4e2yrpVMPQBKoaH+l8RIr2agIuacQJ
         4Cew==
X-Gm-Message-State: AOJu0YylLWXtmdsjdZtfrn+6akQAygjvv5fsmFIGalvpSpkdFva0H24H
	h1tnDUEEUBAxZX5h+iZueuj0nr9r3iG7EbrgV7PUk9eJKAyHz495FkiHFWfjPQ==
X-Gm-Gg: ASbGncvCgCDmrmHT+SzynBwYEnP0v5EvydnkX3qPgyPpN51aSvdPTqL8DEYDjkpSDvl
	y3tkew22uwUdzyEhh4c7Stnq6i4zDhSJ+CyqGnrOWSE/CQDYWOtvtw4x9UsuwyrFdGx9Gxzmrlx
	Ipsy+ijyxh716bq2JIaNkz5b/bEam8LMyUqzvb/pP61pUnl7xeQ37+14iAMUtJRD/YKOum4QF4t
	fEmXQcAmwGFSkOYmU4U5zKf0VlMuiQB0HWGkBxnGd/dfqVK+x5NtAVfaShFwVw=
X-Google-Smtp-Source: AGHT+IFq2maYgX0r5WCfZcfI+e7jk/jBe+sBMf30hjHmbIonDMVLKoFqFD2DGiVukLa2oSKZQbvJiw==
X-Received: by 2002:a05:6a00:c8a:b0:727:3b77:4174 with SMTP id d2e1a72fcca58-728ed4b9fa7mr5561458b3a.23.1733928806217;
        Wed, 11 Dec 2024 06:53:26 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f03a0ca4sm5205402b3a.113.2024.12.11.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:53:25 -0800 (PST)
Date: Wed, 11 Dec 2024 20:23:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241211145315.vaf7gbapieywcvau@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1me8iaK7cwgjL92@hovoldconsulting.com>

Hi,

On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> Hi Mani,
> 
> I just hit the following modem related error on reboot of the x1e80100
> CRD for the second time with 6.13-rc2:
> 
> 	[  138.348724] shutdown[1]: Rebooting.
>         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
>         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
>         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
>         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
>         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
>         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
>         [  138.702604] mhi mhi0: Requested to power ON
>         [  139.027494] mhi mhi0: Power on setup success
>         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> 
> and then the machine hangs.
> 
> Do you know if there are any changes since 6.12 that could cause this?
> 

Only 3 changes went in for 6.13-rc1 and they shouldn't cause any issues. One
caused the regression with pcim_iomap_region(), but you submitted a fix for
that and other two were trivial.

From the log, 'mhi mhi0: Resuming from non M3 state (SYS ERROR)' indicates that
the firmware got crashed while resuming. So maybe you should check with ath12k
folks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
