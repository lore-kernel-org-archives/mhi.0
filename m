Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501FB2DBF76
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090573; cv=none; b=XAODdMdPnezzZ07c07UtWGI53t7ybTZgX+CM/rmSGGof4gEgQ3vGVu6Wu/0pJp23OnQQGYVO89ARuEU4m5SHP9czq9IubZMYMNPl9k+t0UvUlHqEM/MrgD+CNLZG59gRZlK3HnfHAetnj7TqQ7lbKRxygReDAmYPAE/CH5DlTcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090573; c=relaxed/simple;
	bh=dNB0PmhwKvuRZNdhHI14coEX6jfr7lJJHEa9kfva6WI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MVfX45b1JIBpDNViLNWW4LC9RfgMYLDE9dPp/bgSaz0amVcN3H+05MsDzY57cHRydUSdPvDcrJtyW++oTD+zur61tcXALqDn0wIwJSvTUCOKzXdua0e+z3qF5kqj8uAlJGrNAs4W2+73GreMc/JkBbdV1b0+iviSZPEZ0nZiZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZLJhDxv0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZLJhDxv0"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6492e25cd7eso1623440a12.0
        for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 12:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766090569; x=1766695369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XAkArI8TaofBn2k+TSYsotM1G/lLreSd7Oyuf53cT4=;
        b=ZLJhDxv0RHQ1np30VNSCQeW+Xoc2Rq1vesEaYSpEbW4d98QBjcm3dZ6aV3ct5gCdmU
         CkcQFSUnW8VO/aE++Zjhg01kjtdOzJu3PKzB3HbsIL5FZGQTf6PWLE/Jdhpl1Z+FciCK
         AK6icnduTugKsIxhtQH7d4xsHDSVoYHifBmat0VQAbmtEiK5tYfG/CeBsI2qu9ISOKQy
         yfgilpNdaojAo66Wl9vrtQTMEozjvisWMo2AoPdUlufiHwjvYKt9S/rQA+WTEzE5WS5l
         IN+pvqUI23wMXPeSejcOCYRRHZ054w1YkRkRb47onezN6A5P9KhiwW3wamLSMvXv67hx
         IESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090569; x=1766695369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XAkArI8TaofBn2k+TSYsotM1G/lLreSd7Oyuf53cT4=;
        b=WzciSeYw2tkQF2QqS4vVLXBux6Z+8pNeJ59GR+T3fqzQUdozT8aPdSlgCneuYF0iEY
         pWA6HBDOi851x+4CNCDXxSU+oXI9mL+UHnW13pkibld8T+IjzsNStA5iZ7MvbIJRJWB/
         nhjBmyXezZ6+AH4TEDfUfZvGO+haszdlbeSBRn78hW3moyPwFMzfk6+LE0t6l/cE96fu
         ZknFlWshTgxC0PkuR4IflfNEyBe/vhUsf2pfY23/IcRu9EQ3ON8hVQUziINwqJIW2qGy
         zioCxOPqSai3sFLqRu/zXIDy6D6jolxWk+LyLuLvKIzf6XTxIlguaq6cltB6GQczMZGk
         5E+w==
X-Gm-Message-State: AOJu0YzhXUO5KeFqUvj4KU21rRkNO1qShlrfsYH8GnvP4OFN1YlB8quy
	TFSTS4tXkrUpt46Csepl8/PlLkqgiSGJ7Pxdcpbg5JpD0YeAC7YnlpfNJmdw7A33qP4=
X-Gm-Gg: AY/fxX7GYwxlOVkuun4X6O2wdWd1JFtj20mSabpwOIGHxkYrdfdEVPqKdyaH7pOguLU
	nRMjhFgkG6aM9pwFwVPMLFjBLXJC5rZiWzdAaOo6lj4gdVynPj5CFvEoGvADoS8NAdReVgPg1OU
	HGfo7X++C3Q8RjP1kSuwu7vJvStxh8BXVK4GNClMq5Fmip3A3jh3iPPNrwcNlIHY/lnIslGOtuB
	q0U9nYIt33OIvCXwG+bP/7WRwP8iiy6408+WJnN4/5r4h2Ssp+ragxzVDpn/RZYD19H8lPWCVCE
	bj2xy2hI90RL5GJ7osz9CpUg4cdNpps4qM9FbQu7lFHGz6pKEZ/ngelLwqlnQy68vZgMurgNSIe
	FsKHNxXOEeaCj5z7wqLS0vC4x/KktCmBDvbEaJ3bUaOJFkB0Lsf+jP/iSqi+DPiYLiIe88i7yXd
	U/ADzVtAibwgZFvXmL
X-Google-Smtp-Source: AGHT+IEV+YY07VOnpvPuBNpIWqe8uuKBpuHIeLgJMdjAizzdhO4CYKl4vVTvwZlrlL1Cjns9PjC6vA==
X-Received: by 2002:a05:6402:1bd0:b0:640:92eb:aa24 with SMTP id 4fb4d7f45d1cf-64b584ec823mr3000252a12.15.1766090568601;
        Thu, 18 Dec 2025 12:42:48 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64b90f53c51sm360066a12.3.2025.12.18.12.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:42:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/2] bus: mhi: Use bus callbacks for .probe() and .remove()
Date: Thu, 18 Dec 2025 21:42:14 +0100
Message-ID: <cover.1766090211.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dNB0PmhwKvuRZNdhHI14coEX6jfr7lJJHEa9kfva6WI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRGcodGuNu6gXw9r5SvXhQunS8yvNv4OlMLejO fdPS/d5Ao6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaURnKAAKCRCPgPtYfRL+ TmvHB/kB0tg29WQDJssCLJqss8qXoPXpfrSe231c+rf0BH5h+Byvh3euS+IpTalGRz5XNwuLQzB uHo0PqxwsWyUs34uS49TCQLFRO2L8DU3GeE0Nk0MAIEOMEy+Hpd2cLwJIbhHWObkGimpUfYqG03 AR18qBiVFYFRH/tw6NmodoqZLhhlcYaXsfzXihuIg9B2CkyBT0mrEhXK6xp08IK0peQXwhKtWwG YD3Rfc8N1gSHZ7S1RUAg1DfFvDuFI7kdAelXTUP0DrvfB23RByqUqyGjRLcp8T79qcEpZloWvY2 5nlYerxCB6foAC/VCeowQ6OLnz4CswmmIzPNaOqw6bNih3+1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series converts the two busses defined in drivers/bus/mhi to use
bus methods for .probe() and .remove() instead of the respective
callbacks of struct device_driver.

The eventual goal is that these callbacks are removed from struct
device.

There is no intended functional change, the series is only build tested
(on ARCH=x86 and ARCH=arm64).

Best regards
Uwe

Uwe Kleine-König (2):
  bus: mhi: host: Use bus callbacks for .probe() and .remove()
  bus: mhi: ep: Use bus callbacks for .probe() and .remove()

 drivers/bus/mhi/ep/main.c   | 12 +++++-------
 drivers/bus/mhi/host/init.c | 12 +++++-------
 2 files changed, 10 insertions(+), 14 deletions(-)

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3

