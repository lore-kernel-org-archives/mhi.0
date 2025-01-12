Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8EE339A8
	for <mhi@lists.linux.dev>; Sun, 12 Jan 2025 04:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736655484; cv=none; b=TkbFmopX6tG5tRkgFLhOajuMSUhBbVytd+Z+bUwEeAFNSHNZijog6vLuYmxpu0ChTwEdkAq7dz/GL4np3qoNe8VxmBv2NfkcXDj2h2J7E8fOTkvuku+iQ9a8JzyoDBQdWy+23IiqNrNOOKvIW5nW1cGJC3GBmuRhZ1e0R5U/sdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736655484; c=relaxed/simple;
	bh=bePBU8bqmAqxLL1BjU6llPG5DeHdHtSzigBekPC9Yn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnwULViMP+h/21zLXQtXAmcV66TV/ReWRTsUVDmnB5kgoyTP0f49QZ+14Gc0jwGW43IDFrYvS9TVNQNNbJNj8lF7DgQrjSgZKo+sjr2y4/W5SwmjPHcx4nQwcG+/5gqV9r4jHVk3+v8YfXekvi+4JM4y9nzOUgL81zs8mzXLgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAn8hPSe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAn8hPSe"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so4170073a91.3
        for <mhi@lists.linux.dev>; Sat, 11 Jan 2025 20:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736655482; x=1737260282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C83wN0wwj05M1F/Roj12WZ4gl65jlpcEQCrFb5VB7d8=;
        b=dAn8hPSePdR7YWUx1AKuilNi8YbFp7+NBIacvdjUCEZmgtTFOeosy2YX1PQSE30JSW
         7MZ9MUCMohRO7LOdL8EcbzajmvRadewp/p+2Uc0xZdLc2gv5jOYAcc8W2h3sxUMO6LYw
         /GANed6eUizVZUpfJPBxM4lzBP++QWu/z4iUwCyZTfO1j3+eiEWHnsR59wVWbocnV6kq
         Ka0/Y0F5kiVpCR1af1dmjo782Fg4j4UTYnapkndMfivVSYMs3E2FGqdJ+2e65pTnjaIU
         dxPyvoi7H+oN8fwCD7D9Qzrl13MbO0Y5QHclNHIOInPqBe81B29xqVvZNXXqcqaLr8Uk
         QlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736655482; x=1737260282;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C83wN0wwj05M1F/Roj12WZ4gl65jlpcEQCrFb5VB7d8=;
        b=ZuBhREcXqXgreHf5bQcdR14fbtgt/9+P8VAlbybMlkd47uIMjG5wfIHx5RlAccRChz
         3QJdjivWiaXp72UrJjpOgnDeqAaMd0Bgoa5j0ryaycHCmtnlA/KhCpu4bj0PS5UkiOk8
         85Y4N6IRxtJE7a8prHcW0D5EXZ0DXUn0IGjS3CES7UEIn84/X7oJsxEHZqwdJg4IwJ0z
         X1dMFvx5jV3l2ZJONPjhCCGXUD6KRZ9MhVEZb9cnTx80SubT+MvM00TU5IL6KnVUngmk
         9OhJHul2Odp+PooTZV5BGdQVqFERvsKRt4xyd0mMVR1bD85kzP3uTL0KWxlPBRcBGU47
         +pPw==
X-Gm-Message-State: AOJu0YwSprU/GQyo2Zvyc0vjg5SUVyuEwsJbaoa1Wncy0qRbX9OYtVWf
	sswkWijS52ijQbCqOK/fHoBOlq3E9MjJFMZb4AkrULe70EB8Xbm9HHe9tEYTwg==
X-Gm-Gg: ASbGnctFDxs+R4Q5ENosDqdNYygcekFrFO2R9gNyonXB8sygg1MPkx2t00RDTHQ9J9N
	2x0TiHBmHfBgDn6JCCq7WXXCzZE8MXR1dgpWXgLcwEuN+SyrWyOEgZyFpF9mL7qsprEpmW3cEwU
	5G7yEn2R6W6F4aAkLdYzdTE1uEmqQjb+CiMWUQXr0tTHlL+YQeS3q36Lpqch7AwZmA9G8+5Ij1+
	uaZqvJ9EI0oXG+Cq4GdMxDABzLDnTctW3OtU67MnTdoCXrgxPzpgfDUbMOlGOzUecLR
X-Google-Smtp-Source: AGHT+IEDuwvd+FZXHaj5PSfnoS3UlkvzleNSrJwp7I1VL9fX6SKSY7O1cqtGSbpYHMSv1zt/fM2zvw==
X-Received: by 2002:a17:90b:2748:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-2f548eac034mr23152884a91.13.1736655482350;
        Sat, 11 Jan 2025 20:18:02 -0800 (PST)
Received: from thinkpad ([117.193.215.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593feab5sm5510682a91.14.2025.01.11.20.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 20:18:01 -0800 (PST)
Date: Sun, 12 Jan 2025 09:47:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.14
Message-ID: <20250112041756.t477ztqkwd2h36y6@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.14

for you to fetch changes up to 29904a40127ca5df120bcbcab444ea725926b075:

  bus: mhi: host: pci_generic: Enable MSI-X if the endpoint supports (2025-01-08 22:50:42 +0530)

----------------------------------------------------------------
MHI Host
========

- Free the "img_info::mhi_buf" in the error path of mhi_alloc_bhie_table() to
  avoid memory leak.

- Add support for Qualcomm X100 5G RAN Accelerator card with relevant channel
  and event config.

- Enable MSI-X if the endpoint supports.

----------------------------------------------------------------
Vivek Pernamitta (2):
      bus: mhi: host: pci_generic: Add support for QDU100 device
      bus: mhi: host: pci_generic: Enable MSI-X if the endpoint supports

Youssef Samir (1):
      bus: mhi: host: Free mhi_buf vector inside mhi_alloc_bhie_table()

 drivers/bus/mhi/host/boot.c        |  1 +
 drivers/bus/mhi/host/pci_generic.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)
-- 
மணிவண்ணன் சதாசிவம்
