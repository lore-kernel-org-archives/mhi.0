Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0185113633F
	for <mhi@lists.linux.dev>; Fri, 14 Mar 2025 06:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932112; cv=none; b=udyltlDNghQY12YmZ3CxDt953hdrbDWt1RgvvoodlenSBrNGk0/cfBzCo3k/2k/lknPijJLinAHd5ZFkX8JIDZokTTRkhUp4yUa5ph+rrQWIKUI/8L1jPNiBmEmajVuxqP9xwEn1r1zR5OjyZGaG3liojtGMfqfLYoVhVdGE1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932112; c=relaxed/simple;
	bh=wBbSvk6JwjVRwkfmCj9IYLki5kjJYbaP7Yuo9G55ZO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFNAqdkgUHG+q4G/+ruK+1EvjqARVWtkLngwvAzywA/lfQgkUEECprRBxheH5sSr/U90xUkd9IsD/0vXkoRA1YNXfsLP7Ppopu+qC1FZTMVQAq12WP8TifLazhru71CjB+w3tRr+V74m/Zznyx7I0fpGS15ytqrLxbedhGX6ez8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8dgVlvM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8dgVlvM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22349bb8605so38574265ad.0
        for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 23:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741932110; x=1742536910; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBkRi9jDyLGmlz+EiIMIC8monmVkVzFhWi0sF+I2zTE=;
        b=X8dgVlvMYYRku0KQ+HntMheB7LDHffBL3Q3YKsWzNPY6oEXzgK0hz42ZcCE5WScMpg
         ZMpiq1a2lftVX1nJl4/Jw0O2BrzjzPQ377zZ9Vxsezto8aulht8yTLnU0SSmOkc+fvM7
         AOogr64GohVREOHUBXw7ulxHPeedLQmDexbmO/PPTjC+AaQLhuGvr0zkd2t8rTRtWf7J
         ORomtx0O9qsM2z+73WP/gIog4LlXaJYPe+PLFq/dzvPHXp65sFHSVyrTQ9kGPjHBT163
         ikvfG9l7a6RmgLme+MLMhm/PtR/cst9OWCl9jRB06lwKhF9Lf8KvsprcSDzS3vDH09jv
         2ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932110; x=1742536910;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBkRi9jDyLGmlz+EiIMIC8monmVkVzFhWi0sF+I2zTE=;
        b=OJsBQxNS1pT7zZhi43GQ00AHSDwdufIQTdfMfflXb0TxJVb0Y++JOEppY7yE7PM+DH
         y/URt4JbRlpAZgM0zJuyi52qjWWWrKjakSB5W2yo5NzXMDuroyKQwjdnqt3+ZOlxrrDu
         0vZ2gv5nSEHYL6gDpcobqa4/xQsap4NDFF3GbfrafiZiEP9dXdigxyO25g6iLvbBoRsJ
         nia4Qv2MXaXhpl89dKEN8oPiKtCr8MQE8ePdJm/Ir2v/R2SQE7SKx2ToFpLpjF0e8Q95
         K41PQvbHEP7pNoQV/0xTCFNOt2qgTNek1KLEdKasEP/wTiuIrVId4zeXTBThCMMAdAu7
         7Khw==
X-Gm-Message-State: AOJu0Yxj9ilFv7CDHo/8k5KEzJ/K5H/QkDqf9Wmj6Pzqup9lEaCCGVoa
	eQkMFiaWVrpTKhnM2aeBTnItkyu47UfPOcKXcQJqwX6VDgRI1CEblG2z3p6v+w==
X-Gm-Gg: ASbGncsDZM7D15GS0eWci1k2iVJt/qwSHhuVS9t2vZQXL7o/wkOBVYiAI0vvNwJkkhK
	wGqtRqFZo9iuPLZp3oje2m7ip13s6y1dFRNxAsfYMsL9+mgezWAtGZXqJuDpflCRqGZors5lIQh
	YbU5Dl5/ON5JKyXtPNfRgyhw4V5/W0LnOWDf4g8SBB/9gdOHsqn8qadPs2AoPcW2VPkZ0wbbi0j
	3zPdYu64oF28iVkSR4OccihsOQt3qGgO4gtK50/dQepBJdsTqXUgwox+1gjsl7bzvkmUva5te9f
	D330VY6np1ZrM+5u4j17YBSWYBdAwOxJVy59ewObWGxnqTb37ejdFt3H
X-Google-Smtp-Source: AGHT+IELQUwNCvBS//D70lwXwRqdL1uE9O3jnTUjQadfvLxNZggdIbnNcXDMabOz1LdZMHkeWUr5Pw==
X-Received: by 2002:a05:6a20:2588:b0:1f5:93b1:6a56 with SMTP id adf61e73a8af0-1f5c12c749bmr2005493637.33.1741932110121;
        Thu, 13 Mar 2025 23:01:50 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711695a2esm2390434b3a.144.2025.03.13.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:01:49 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:31:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.15
Message-ID: <20250314060146.vlfazasu2vicyep4@thinkpad>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.15

for you to fetch changes up to 0686a818d77a431fc3ba2fab4b46bbb04e8c9380:

  bus: mhi: host: Fix race between unprepare and queue_buf (2025-03-14 11:27:15 +0530)

----------------------------------------------------------------
MHI Host
========

- Remove unused mhi_device_get() and mhi_queue_dma() APIs.

- Add support for SA8775p MHI endpoint device with IP_SW0 channel.

- Fix the race between mhi_unprepare_from_transfer() and mhi_queue_buf().

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      bus: mhi: host: Remove unused functions

Jeffrey Hugo (1):
      bus: mhi: host: Fix race between unprepare and queue_buf

Mrinmay Sarkar (1):
      bus: mhi: host: pci_generic: Add support for SA8775P endpoint

 drivers/bus/mhi/host/main.c        | 35 ++++++++++-------------------------
 drivers/bus/mhi/host/pci_generic.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/pm.c          | 14 --------------
 include/linux/mhi.h                | 18 ------------------
 4 files changed, 44 insertions(+), 57 deletions(-)
-- 
மணிவண்ணன் சதாசிவம்
