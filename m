Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB092F83C3
	for <mhi@lists.linux.dev>; Wed,  3 Dec 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764770042; cv=none; b=C1HEyzZRX8eiOOlfjau9Mgz8HzuHOnsMe1AcYTjEosZk042q9E6fy5Yk72/+QlfNJ+qxH7S+XH8G7qnbaaLDYeqklYBrvBMCd/lCkTVp25SJFwhGlwPOZrtqmMnQCyF1hw7btjndRjd+/64TBoDuZd+Ou1/axC+KXZ4Q73vQzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764770042; c=relaxed/simple;
	bh=vMhda1+AxVHv3TrgQbdTvSItRk2i8ZQuMHNHAdy903M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUCGXL9Yt95oLcETCzqg8nn+Zu/FMfLquIkEx4/i4oXyQmakTDuvthw3RngzVohUD5oE4+/H1YwXw7ml9D6nxMSWVvoidmEBaBziUje4He7dKMaE0dOPlaov/LOSXwJqSzeMuLiGKVQiIYVafN8bvgCNmXXNxjAaVwj0z3vZ2Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2GCAD99; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2GCAD99"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so45185295e9.0
        for <mhi@lists.linux.dev>; Wed, 03 Dec 2025 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764770039; x=1765374839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aioLnfL0bmSCseYA1z3bCzauxJY/fb2sxvmbPwmSqFk=;
        b=X2GCAD99VlIQwEZmxK+Rpfw0yHAPUQgEAzVs8YvdLiRCczXlbTAaGro+iUsmVvOclG
         XRxrcu2uNRLbkc0nBjOp8vZbxxFWwxtkoU13/30IeeN+mshvwALVrVTsHuyfYFytZ98B
         L9iZPoOhq92BZpbe4kvaQfu8LPnBI7/h+wQp/AKlQSMR6pZdXFzLYiqnOU8dxJW1Gtmh
         06bc+DnoHD5nnm5q8WbZnX2I5t3RUFqtvduHGIx73ZzS/pM3tcxQYdeHIbdwg5nhDUM+
         M9R47LyyVqrc88hmwC5g4VB9DK/D9dPJjioAAJ1hyPaY7KHa5XxVDajrlfWoJJpwiCu/
         Zidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764770039; x=1765374839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aioLnfL0bmSCseYA1z3bCzauxJY/fb2sxvmbPwmSqFk=;
        b=pXzS2YkSAGVFYBLNc59kGprC4tgT0cn8stZH8/ytRrbHtTm3wh4T4aGPdH30AC5q0y
         8OYGhRwFqU1R8wjiCLN989jzyZSvH/6W4UWe6L04QnWby0ec+UAqJPlVgmoI1OeDkRLs
         R/tuVAkRVgaC/7r6oseSvtu2ADwRWBndh13J5RmIUKsAumAs7mmlhk5eJ8LkOuPtHOT8
         j3wImzqcYtT8gfOCSe1hu4N4K5b35Pg0U6ACvi6TuvNtzxWWiWt5KfEdc03ft6vheMiX
         diFdv2KD4bfoP9GbRvuiql5x8kc4r0LuneUVEuuZQQuT8scWYUMwGIG6SQjc5ZnGrcUL
         ywQg==
X-Forwarded-Encrypted: i=1; AJvYcCXmrvE5posFk6WwfXZ0zn/kCw0bGjcSHlKrmITbevShfYexV1RNp5Uszmk6bnRVHhuxihg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw7jdHTsr+K1hjACj9+Q6nBy/FREoIPpOhzagqPpZHvyczc36c
	SB2n9f2Icf19biJ8goj6s9mq4CB3dbmdUK6Gl8k1N7d/XepPNN+XJcKV5EVM9Q==
X-Gm-Gg: ASbGncs8NZ7sRdZK3Gty8cAdFNGr4HVAwl6mPHcAqkIwl+Ca67zWZgTTLGjAAtrufV3
	6rtCU5wA6GJGBiddk0kNZXgjWe8/AeKrZbyZqP6MwUkjL5M8JMc6n1gmPnA9QEjkMvSksHoMbLI
	ZG3o7YgbmqpkQkuDlozVG/hwf64PjgdhxJnFRcrtM8S9VEPDn9QEm4Ax2uazUBpHfh2vYWT845A
	euSmzM9enVa0gFgM1FaY1Zghoy+zoItb9JcMftvLxYHNfX8bGXH4vkq6pruLYjWGvdZzOsiX5I6
	x2EI9tlthBBF28UMpcpefK+lbDT2fzEqWHWHgQpwbHf3+lzqIUV71Iq8d0DFx9pOHxhWcqN2Cfx
	uB9ofh1WdftcCERAY5t1ruw9eKgmjThJ5OKleVJCwEuQ/jDJF9hSC/6GDj9ULK5pKQbHhcvFZrH
	SBDdZ3zLNDymRN1eq3LdbPIHvq8VhMRUvE/DUtfMkjBpjS2evGP2xV/BIfzDcJCfGVMRPF6QP+t
	OPfmHu8c5Qbkbhw9aUOLYjjDAk0DudSW8r0lSYTRw==
X-Google-Smtp-Source: AGHT+IHLG32qs9q4BIvUufo8fRRc6s9UdvNAPM7SZhhOitCuO55lRlGiuwa7xpNAuNetcMHEaEZUYw==
X-Received: by 2002:a05:600c:3111:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-4792aef705bmr26681805e9.15.1764770038569;
        Wed, 03 Dec 2025 05:53:58 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8e00fsm40433575f8f.34.2025.12.03.05.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:53:58 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 6.12.y 0/2] Backport support for Telit FN920C04 and FN990B40 modems
Date: Wed,  3 Dec 2025 14:53:51 +0100
Message-ID: <cover.1764769310.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
these two patches are backports for 6.12.y of the following commits:

commit d2b91b3097c693f784393a28801a3885778615df
  bus: mhi: host: pci_generic: Add Telit FN920C04 modem support

commit 00559ba3ae740e7544b48fb509b2b97f56615892
  bus: mhi: host: pci_generic: Add Telit FN990B40 modem support

The cherry-pick of the original commits don't apply so I made this
patches after fixing the conflict.

Regards

Daniele Palmas (2):
  bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
  bus: mhi: host: pci_generic: Add Telit FN990B40 modem support

 drivers/bus/mhi/host/pci_generic.c | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

-- 
2.52.0

