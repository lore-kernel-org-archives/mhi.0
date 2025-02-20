Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769F18C322
	for <mhi@lists.linux.dev>; Thu, 20 Feb 2025 06:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740033240; cv=none; b=g2+zUG6Jyr+RtiPb91ko/Gi1LGW4QcizvD71Vhun6ioH+741SeBQCIypZNVlzHZoM0Ncfktyzpvhqam3Cw4shPVLhCKETTmixV6GW22KG6aaW50PQFFf1CtGBJx1TJ0wUV6luGaleMOQXkUNVIDM9ya1ogpaPy5k4LuFxCHaIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740033240; c=relaxed/simple;
	bh=2RzI6izlfqQMP3gdaoJN2/Q6jCBmNkqownJjl4xzehE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CUksjzw+nw4AzwiZ1Qrr/96BeGh3tZcUxRNWfib/gsv8hmRIaUKk1JDcltJTkbRxrij/Kvoru49q9MkPYmmMdkBoCa51SV/lCOfsaQwdhAeRwMENSMReAmQ+m63tpaEUrwIYME8WCh4niDNM7LOnpwhs2MmzBWbHeJKcXBYOEYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCB4uX+8; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCB4uX+8"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c8cf98bbso11310515ad.1
        for <mhi@lists.linux.dev>; Wed, 19 Feb 2025 22:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740033238; x=1740638038; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNehbcZpYD1N0pX7n7bYAyNxWVHzPcusSjDYzYUv7jg=;
        b=fCB4uX+8EMxgl4qkoStHZXMtuzewVMKLbybk3FAHZnheqcZ7gsJcgxrmKCgVQ5tiEW
         UXi60JzGRfpfzviv9dNStkL1qAk5t0psL2ubyyi0dTunbmgkICrFg+5q3TYRwSYuli05
         cEA11AXHMzIOtNIaaoD+oF5A4hpV75OO0K/z7AJyTlD6GQ1+sYzqO6jtpmbZEhs93gO1
         TyCz4j12jR1bQcfk4Qh9KKWhcMmLHvgLB0fS9I0gJHS0tX0ft3AVKFnXsxKjpcLFjqx2
         T96C9BLNpXLmot+YBCDjV3VXCEc1HwOuRdEN286zDvfs2BuozHP74GcY1te1OIP98qIW
         NyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740033238; x=1740638038;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNehbcZpYD1N0pX7n7bYAyNxWVHzPcusSjDYzYUv7jg=;
        b=EiAdJmjzhw/ESpql5f3SRMEb+O1RansX2/vc1VgLRAstyz7zKJvInWbh4dqZk30H1N
         gZcbxdY2guW+qTKfmeFeGOyvtWPBlfwRsonhgiqmscjbDenCp0M7ucT3z6Pz842If1eW
         22NjBAUa3SCk2H7twcm1BspPiO/0KGpGVhP4FtpXQEpO2TC3c2naWrNzTG9fuBp/k9rI
         ujcQKQuBychSInkj+lwBjGyXfuxg9xEsm+AO7y7WaOLIKnywlrYO8TQV14cHEWHve89o
         Iki/JZxVuOCS2v/FgilLvkLI3kuyi7E/uSTmIWlI3jSKujHbYzM10PuQMF/00Bvjix6K
         PUOg==
X-Gm-Message-State: AOJu0Yy6U7gzhykolafndHN6o74e5hwxhBNvvBhsDLEIBejt3yzVcplG
	6V/tXuBgQCMK3icztE+oBXw2sp/1rRXCl6WfuTRlXRWOFnwwYwaYiqa3d3fFrw==
X-Gm-Gg: ASbGncsnz9dzdT6D9O3VnmrF8yAcaTldITm+WwqdNZ+2XXkpLNz/io3Bgy0pT/QJ1k9
	iU77yj2I50J29hq5MvUODAwFh9SXWdy74XvV1kepDL+X44x0y0joIPnWL6MRS+EVYs2vi1++1Gs
	O/HzDh+dtrhOg0FzSJyPXkA/LF+/FL1fG4JUaqVZ+FtYS7mpgxjLITe4N05D++yu8z2h0StENAr
	XHCtZS2BaU4uo0StqLRE8PFymgNsIh19H4yGtlz5K2H4T5U3h0VXwD3gG+YmwJAfPBBHuviZd0g
	R9uSd2+F9uys2TkH6hDlLVZ+UQ==
X-Google-Smtp-Source: AGHT+IEoc/umKC5Mqdc07cO6cgTiw3rjBOJZW5/0seQJbsm2336ZZcguQ394zEsMLb23aImWufHiJg==
X-Received: by 2002:a17:903:1d0:b0:215:6816:6345 with SMTP id d9443c01a7336-2211c5501dbmr275584605ad.16.1740033237658;
        Wed, 19 Feb 2025 22:33:57 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-add286bc8e8sm9630401a12.39.2025.02.19.22.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:33:57 -0800 (PST)
Date: Thu, 20 Feb 2025 12:03:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] MHI fix for v6.14
Message-ID: <20250220063354.4vbhdnvhfl7c56ck@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.14

for you to fetch changes up to a321d163de3d8aa38a6449ab2becf4b1581aed96:

  bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock (2025-02-19 19:50:23 +0530)

----------------------------------------------------------------
MHI Host
========

- Use pci_try_reset_function() to reset the MHI function during recovery process
  to avoid the deadlock reported on the X1E80100 CRD device. The deadlock can
  happen if the caller has already acquired the 'device_lock()' while calling
  the recovery function. So using pci_try_reset_function() avoids the deadlock
  by returning -EAGAIN if the lock was already acquired.

----------------------------------------------------------------
Manivannan Sadhasivam (1):
      bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock

 drivers/bus/mhi/host/pci_generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
