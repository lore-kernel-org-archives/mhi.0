Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF622577D
	for <mhi@lists.linux.dev>; Wed, 14 May 2025 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214369; cv=none; b=kw5dJXfE7RDbB6vAz7OFiNElmySwXswdZv+4URK+DDlCSRJLtrmTTOWgByLfSpGg40cvhKq6oLO7GDDAawDa5OAG5KNKrdgTQvJoAYMqvOLp9ieUbB1VDT3/PmxfFb0ZIKx6cBHqu4+jdNduKNQlqFaQpD/uPHY6fPOOSxhddq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214369; c=relaxed/simple;
	bh=I2WMQW8fFlV/TM2ivarFT2pQdKUDLFyiZpTrJAQrh50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6+oB+/mGJhYJkjuLQHmUozVGq3IklzrFjriv6VpThAJJc2Y0v2sWLFzmyDtjWfpCOSUAIXT7OMfKgHVP/NFEMddw/QEWEyBCFUiqFGhL7QOAMKYfFMp0TByhD8OumyDQ/EBJ0BW4RRhcp9/86QYOYP+BOny1cWyPcRcDdc1Kzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FgNFNcl+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FgNFNcl+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so6396301f8f.2
        for <mhi@lists.linux.dev>; Wed, 14 May 2025 02:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747214365; x=1747819165; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAH7DI1FH78FQkYmM8oXAq6pi15EOIrEUZA08taI638=;
        b=FgNFNcl+SFDDNHH98zOVq/B4AiOrRYQ7VQ0J95ARoAV1A6ibdLt2YHuKpO0cxr8cUO
         gqTELutZesjbGhGvMZ1GiIB1WJp3p180OILoSqQewTsc3NQa4arHIvDIVPso3f+Gv4kx
         e+CM00YniCW+3SGEL76XS1ET4N8P4cHLuWD/XR8GbGCX1FO9hbpM1dcWKMr+7VipNhCA
         oAl28eKW+btl9H3/bkXyO8776BcOI3I3KIJZqW6oPepStYIbTBYmcdBtsewdVsd4Tyzt
         105PcCkcQr64f7bbMjA30NODqR/pGwJ1bBaDEdZBb0xT/WS8+tzTzcCPS0c/VCFI9M1m
         ipYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747214365; x=1747819165;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAH7DI1FH78FQkYmM8oXAq6pi15EOIrEUZA08taI638=;
        b=U5sA3Uqnw8gYPHW+lVBRYAH1jeCv9MqGkPBK6e0CmedhZ/FlWrrzAeNiasHqo4sz1N
         qWZflFEeBd806KJB1oSFNoCRAg1yKmXEVtQkOvnSphD1vp6S9/HzkqUUYkxWeja3USfm
         rdgSoDqQI7H014qtfv7sU2rdDzyWNSCrLTBR47/sSzViHrL3sPZjV02vNePGQD+iX/UG
         hHdjeQDr5Dho124dGTGP05FkVdr18VqoCh16GsloFFk2SD5aPkpodDAt6evu1LhHJ6m+
         ASOEhjp2dfcWIPQT+7JLpqQMyy27lBPB/BeOmwlJRzBIIZyrJf6e2o7WNJLTx3H2LGMR
         vugw==
X-Gm-Message-State: AOJu0Yx0s5PjwuhYFTjjC7tblSib25K0us3ypczQhS2BGN64xrZ2yjaC
	84P0c+kMBVcL/iQJfZ8FyN/ASzT/WVK9mj2qz8MAkABmiXfeQzLRWnlEdn2MPckOZNReuo1fu+/
	7sg==
X-Gm-Gg: ASbGnct589ExyxtSPQgwj+Pyvvy5kd6mj4Po/htcELRCxwfa35supb29pFJKWFJ5aE1
	5BYbubSLRUGP7ZHDp8y1r1f99XO1UROmAvQ46/Jr0BpPbEMnga1IdJeJbkViDR3h1FucP9c82Hm
	EClMO9xbIiEud9nY4BPYcuvBMi8ou4M22aBrnvF8H5bjR5yGLA0TD4FdR5o0v335dw+STuEk9Br
	cdoNkyf7s3ZgmdABhfZtPPl5pSRKyR03JFbvGmBlIULd/HinybWnicpv8rGTn3dBt8jHMr/dhxA
	rLtNkhsTcL6jSzlkFYUnotE7cFyG/dzsOMBYZP6xChMDipyN98htoiELF1HeHlC23VIL5P/tM9y
	ojDNzrYjBHSG9ww==
X-Google-Smtp-Source: AGHT+IFrtyNujRI6JwotYctFIojAdt5HQt+nFp9PrGmEAAADeLtWYk+7S5q/Y4jwgHcQWrs0reSrpw==
X-Received: by 2002:a05:6000:4382:b0:39e:f9e8:d07d with SMTP id ffacd0b85a97d-3a3496a497emr2139912f8f.20.1747214365532;
        Wed, 14 May 2025 02:19:25 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f32b447csm22713355e9.0.2025.05.14.02.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:19:24 -0700 (PDT)
Date: Wed, 14 May 2025 10:19:23 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI fix for v6.15
Message-ID: <w67btqvfqd6eeq3ufcjjqagnnigazqn64mjn5tofcc4onhkc56@6ke4pre2hgpa>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.15

for you to fetch changes up to 6f18d174b73d0ceeaa341f46c0986436b3aefc9a:

  bus: mhi: ep: Update read pointer only after buffer is written (2025-04-24 10:34:51 +0530)

----------------------------------------------------------------
MHI Endpoint
============

- Increment the rd_offset after writing the buffer to avoid MHI host accessing
  the incomplete/wrong buffer element.

----------------------------------------------------------------
Sumit Kumar (1):
      bus: mhi: ep: Update read pointer only after buffer is written

 drivers/bus/mhi/ep/ring.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
