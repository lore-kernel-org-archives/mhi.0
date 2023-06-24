Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F25818
	for <mhi@lists.linux.dev>; Sat, 24 Jun 2023 07:08:54 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51a2de3385fso1692914a12.0
        for <mhi@lists.linux.dev>; Sat, 24 Jun 2023 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687590532; x=1690182532;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ++pJQT3qurKKl0Y7MRbbZ8cEjCKiblHc1G+P4gnzk=;
        b=TKTtg2moSy6mxVY2o1tStfyWPWtCy0iSvS+zaXlxY11MH7tYLciALaEVDYaZlVRUmi
         WBVDU+0zffvGeZLoNoxwldlG+UZDdRe5t6R5iXRUULXQfhFN7gNLjTZkwSqHP0LYlcl0
         o/ZFuD0lgd9aBloYmU8kzBklPDTbfwVN5Z4pHCycS71FkdBShYNKBRL7P7T0us3icDCq
         dcQlLbqnzaBHjj8aQopLA6KziWOlm1OCXCdSyyBespmUJqir7IfJ7uGFGlgNFegvpl0H
         0+RwgdOT2YGf7cPeqDhYLlx70lgMq1NuuaA0D6mQ6OV1jD4dpF0RQ4R2tvtoJdWAi3i+
         Y4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687590532; x=1690182532;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ++pJQT3qurKKl0Y7MRbbZ8cEjCKiblHc1G+P4gnzk=;
        b=R+O5pR+zQrtKuiSYR0i/fwvCuqNVZhKK92q5X3e4MYhVSnDHFvmwWAFycAV0rVtyVw
         pxpj57JMtT1z5sGKNl12ZdPOp/2LJrYgOHNrQsdrwUGmVpZdnnY3GuvsndmON8cn4bg/
         KkYbEyiOAzR3wOf1UEQ0mEe2HzVtYLnQEgclix6EBc38gBrwucaqREoGVkojUAbIS6Rs
         YXBmsrW9AsV4sKttW9GPEMVgxAe9tWNtTfG5pylyEylkMciaWzc4fECX2mfwZ5VGf/RG
         TTvDLuw3AjgXJZlXaMyQvpdZHVsQvfV8l4sbvywQSk4LAmq9w5CPCRjxEYutuA4UpPWt
         K07w==
X-Gm-Message-State: AC+VfDwcnwY+3ZPrXs2u5B7vhwoYGsnzw7Onvb3a11sAUFkwbwFyEuTR
	8ETGwmTmn+od4cvhJlEAyGxf
X-Google-Smtp-Source: ACHHUZ4l5vzfnQaLzD7gqGAZEE6VB1pgrzOF6Dqc34LJyLYxtxpPKUHNLNHBY1rv8S62lpQZqbd20g==
X-Received: by 2002:aa7:d7d7:0:b0:51b:f868:a090 with SMTP id e23-20020aa7d7d7000000b0051bf868a090mr2663205eds.16.1687590532407;
        Sat, 24 Jun 2023 00:08:52 -0700 (PDT)
Received: from thinkpad ([117.217.177.236])
        by smtp.gmail.com with ESMTPSA id z24-20020aa7cf98000000b0051bfcd3c4desm367196edx.19.2023.06.24.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 00:08:51 -0700 (PDT)
Date: Sat, 24 Jun 2023 12:38:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, duke_xinanwen@163.com
Subject: [GIT PULL] MHI changes for v6.5
Message-ID: <20230624070843.GH5611@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.5

for you to fetch changes up to 6bb6aba2f57ab58a8853bf09cc4e875a46646c0b:

  bus: mhi: host: pci_generic: Add support for Quectel EM160R-GL modem (2023-06-09 21:07:17 +0530)

----------------------------------------------------------------
MHI Host
========

Core
----

- Skipped MHI reset if the device is in RDDM EE (Ramdump mode) since the device
  cannot process reset request.

pci_generic
-----------

- Added support for MHI SW channels (IP_SW0) so that the host can transfer data
  from devices over networking interface.

- Added support for Quectel EM160R-GL modem which uses a different PID as it is
  targeted for laptop usecase.

----------------------------------------------------------------
Duke Xin (辛安文) (1):
      bus: mhi: host: pci_generic: Add support for Quectel EM160R-GL modem

Manivannan Sadhasivam (1):
      bus: mhi: host: pci_generic: Add support for IP_SW0 channels

Qiang Yu (1):
      bus: mhi: host: Skip MHI reset if device is in RDDM

 drivers/bus/mhi/host/pci_generic.c | 28 ++++++++++++++++++++++++----
 drivers/bus/mhi/host/pm.c          |  5 +++++
 2 files changed, 29 insertions(+), 4 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
