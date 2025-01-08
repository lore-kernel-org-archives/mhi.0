Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD0155382
	for <mhi@lists.linux.dev>; Wed,  8 Jan 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347625; cv=none; b=BYidTUdS4DQFmCXocejC/x0Z1HUor7emcyVdxw2M4a8Otpj/2jj3X3Su3b9zz6o1rRC6woyZVVfAPJkzn0mW107PpuTWj+tQeAV47F2ny36kdTSuKJwWCQI+dvmGkvfdTOI1m9NmG3VpLs2fmIUbgqxhNOJ6pVekzmzZU0WEIIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347625; c=relaxed/simple;
	bh=OdE6D5N8RrpzSeHpeycvSVWOB2W1RR8oVCgZ0kZqXjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkegO7nHcPQlWuuFIfWh/PHdrv5qv2L20/13qrBhtXWFPyYi9mzfozhnyxH0VFTJ0yxSi9DXv20w6o1IWz+RcCO204ASNndADYScwuoa5K832BIV3dryhMS/FWSSANBBtnZNeA/rTnZYlUT4D+8xYIK3PYXxnhCTuduN2t7jx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krhZil3/; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krhZil3/"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f2e13cb356so6975006eaf.2
        for <mhi@lists.linux.dev>; Wed, 08 Jan 2025 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736347623; x=1736952423; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OdE6D5N8RrpzSeHpeycvSVWOB2W1RR8oVCgZ0kZqXjo=;
        b=krhZil3/3+2I2LM7DzJEVNDGOFQ2Rxt+/mX7UkQt3dBjrpeFop7WqkESJazAFJMLvc
         LVeLYFGdo5lshhTdZ9RTimuYkrirqI6OIjXP3v2e/djJQkUq757dH0qqUoAwII3FPjEC
         EhUZe8MXQxFZ00LdE2Q3aXioJLW8Z7jVFDWHD96J46VZjzggKWn7YyY0uH6nUVXyBMgM
         6HWmpY8Mw0w5ThpMMYUnfUtB/Q11PWt+gPDm+voDWWBHaGCPjyz+QRXH5fHZu+DhxQtE
         rVqOB/euDWDyw6697P6Tm3sdEIHfnU30FN6C2H1AGHMUF+JlhAr+oX9TeI0l836pKU1l
         zmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736347623; x=1736952423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdE6D5N8RrpzSeHpeycvSVWOB2W1RR8oVCgZ0kZqXjo=;
        b=brIX9NUXL48vU/Gq9hLs2sWo9nR2p2ZJ4OLZn0jtx1/pZI535Gpwe8KqNr/8tygODL
         31X7c5P6opGTcpjeqJmqEn4PUAD66dJwZesn3QtkDbg9MzxrmngKjiUcqFk3p/k4E6jQ
         sT5Tk1UpXhsRsszzxmd5gmMZuQSiSqdIb6SOnMMwnU1/GDSjzFTR6VePyspHjX5FWybS
         NR3MpCS0PiT8gkWxPcDtxUDKZ8F7OORfh44yXcXDGE82bzdrjJst59UFSnFDNhu35531
         bbaHX8u9mgUQYgtvWzuX4HgPQe39oMyG8DwSVQd9uufBY3qIsXpnNsIX6mXPhB66MyyF
         7Fsg==
X-Gm-Message-State: AOJu0YwwZ+NBrGAZQGMYzQcdQn2VH4zqaLto2UX2t80Kx4V3mpsBh+xA
	2/xSA4np9dWhdcpayDWC3/PiJZPM8lsMfl07Fb5x4Ex9P9zZYRNgid/KsdpBWqgPA6zdU3ipCvz
	jT43kF6MsRrdBWvqE9Qz7wJwONuJmfbsR8vyN0g==
X-Gm-Gg: ASbGncvG2lPWMZO6W9aN7Uyaw2kLvJFTbnsw4DbnailNaIIjdi62/+wLlYoTNmUfc4D
	iK94a5l12TFQiaP48ZZFJq13xh2x5oHCevHb49cB7NSrlZ65IrP1dY7poXkGxDMMwhXKl
X-Google-Smtp-Source: AGHT+IGozL0b6866JXapQ+PEbHnvhj3a6/0QQ88A8IJ/+L+igHRG0D/Vq+aG6UHzobmpoTeJz0Mbo/TlMtGJUaQpZJU=
X-Received: by 2002:a05:6820:4b07:b0:5f6:d91b:ef36 with SMTP id
 006d021491bc7-5f730849a23mr1529084eaf.1.1736347623278; Wed, 08 Jan 2025
 06:47:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org> <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
In-Reply-To: <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 8 Jan 2025 15:46:26 +0100
X-Gm-Features: AbW1kvZfPY4Kk4qbtmTD0fHBZZNdvUZzXO5U_uMo2FSCqxn2gzTvApC3VGAA_jo
Message-ID: <CAMZdPi-2O_aNWHnRKkMGUKsrTdfTTuNM70y_7X5xvADiyk-+VQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] bus: mhi: host: pci_generic: Use pci_try_reset_function()
 to avoid deadlock
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> There are multiple places from where the recovery work gets scheduled
> asynchronously. Also, there are multiple places where the caller waits
> synchronously for the recovery to be completed. One such place is during
> the PM shutdown() callback.
>
> If the device is not alive during recovery_work, it will try to reset the
> device using pci_reset_function(). This function internally will take the
> device_lock() first before resetting the device. By this time, if the lock
> has already been acquired, then recovery_work will get stalled while
> waiting for the lock. And if the lock was already acquired by the caller
> which waits for the recovery_work to be completed, it will lead to
> deadlock.
>
> This is what happened on the X1E80100 CRD device when the device died
> before shutdown() callback. Driver core calls the driver's shutdown()
> callback while holding the device_lock() leading to deadlock.
>
> And this deadlock scenario can occur on other paths as well, like during
> the PM suspend() callback, where the driver core would hold the
> device_lock() before calling driver's suspend() callback. And if the
> recovery_work was already started, it could lead to deadlock. This is also
> observed on the X1E80100 CRD.
>
> So to fix both issues, use pci_try_reset_function() in recovery_work. This
> function first checks for the availability of the device_lock() before
> trying to reset the device. If the lock is available, it will acquire it
> and reset the device. Otherwise, it will return -EAGAIN. If that happens,
> recovery_work will fail with the error message "Recovery failed" as not
> much could be done.
>
> Cc: stable@vger.kernel.org # 5.12
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com
> Fixes: 7389337f0a78 ("mhi: pci_generic: Add suspend/resume/recovery procedure")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
