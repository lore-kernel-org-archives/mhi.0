Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF0C8C4
	for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SFeBohVQ"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-77d632b35faso224322385a.3
        for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 04:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089143; x=1701693943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=My7gSFRp+Y7hoOV+FBK21Q8iK89AnBNbYhuMMj6/9YA=;
        b=SFeBohVQ9U8GhjmoIweMHGlCm6dsBNhelQeT7Ix+H8DVfgkcAFXvxVoX5ZLLB9/epX
         9ut80FW5/ta615mlWpFMIbch1fBiFs5MWM5GIq2eaq2z08zC65pjdo3nUIUNJsAaWrhw
         iB9oH2Ab3ObIJNypDNm0EaY9xvsZyRxl4LSyT8ZwRqvxkYc5gIl04/iPRB4HdCxo+frm
         FKNyjx7BxgxeabRoYFxrH4p9CcZ9MJcC3zjPYbj3nqzPdCQ+O9YFUj2Z4pmXXoNX7UNK
         GvsLzc9tN3AyvBOWceGVPeRlPMM/Kk5FOnlzUJ7Som82Rl2mi7VuoKL7FRtsiGNu5AfQ
         iJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089143; x=1701693943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My7gSFRp+Y7hoOV+FBK21Q8iK89AnBNbYhuMMj6/9YA=;
        b=Ghvb9ULH+8l51rT6dHCe1fD1naG7avB7CJe1BEFuR6p6a4fGv4qe0NdXSeeM7wYTd6
         uVGkZ/8u1HTBdcuzgWc5IxYCySZYMsvxnwwCOeAzDNCVhc9kQA5P7jf/xoN/uGAd/fUG
         68F+b/CA9biTvMUNH32Td0EswwOZksukWxXGQJobZedlu06ksHkfxzkcKpeXAw6PL9f4
         wBtfIwHpQbUd+GNta7kGI3OWAUdpVXx2lIvhmsAyLu81yNVyw2Ok7ScfVuvfYxH93a7I
         6nS65qXs4JkElMWZf6H/N+bguUxK5FL8nbQXu9NX9jhXlmGRuNFpK1gXk+mrXeaXn28d
         fBVA==
X-Gm-Message-State: AOJu0YxiF7Wp8T3ycrgxD7Um269HqNKyxReIEfGo4fUNiQiSNXh5mC87
	VQ1giQEh+aUPvPFrj+A6GbWs
X-Google-Smtp-Source: AGHT+IHxlyPEMgiSFO7SQKkp2Y9pFf7htAgqwPBMkxZfJRWlUXhmb2oNI5Vr/2R6YVNt+HXPnHuOGQ==
X-Received: by 2002:ad4:4986:0:b0:66d:5d31:999e with SMTP id u6-20020ad44986000000b0066d5d31999emr12774208qvx.43.1701089143185;
        Mon, 27 Nov 2023 04:45:43 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:45:42 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/9] bus: mhi: ep: Add async read/write support
Date: Mon, 27 Nov 2023 18:15:20 +0530
Message-Id: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series add async read/write support for the MHI endpoint stack by
modifying the MHI ep stack and the MHI EPF (controller) driver.

Currently, only sync read/write operations are supported by the stack,
this resulting in poor data throughput as the transfer is halted until
receiving the DMA completion. So this series adds async support such
that the MHI transfers can continue without waiting for the transfer
completion. And once the completion happens, host is notified by sending
the transfer completion event.

This series brings iperf throughput of ~4Gbps on SM8450 based dev platform,
where previously 1.6Gbps was achieved with sync operation.

- Mani

Manivannan Sadhasivam (9):
  bus: mhi: ep: Pass mhi_ep_buf_info struct to read/write APIs
  bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
  bus: mhi: ep: Introduce async read/write callbacks
  PCI: epf-mhi: Simulate async read/write using iATU
  PCI: epf-mhi: Add support for DMA async read/write operation
  PCI: epf-mhi: Enable MHI async read/write support
  bus: mhi: ep: Add support for async DMA write operation
  bus: mhi: ep: Add support for async DMA read operation
  bus: mhi: ep: Add checks for read/write callbacks while registering
    controllers

 drivers/bus/mhi/ep/internal.h                |   1 +
 drivers/bus/mhi/ep/main.c                    | 256 +++++++++------
 drivers/bus/mhi/ep/ring.c                    |  41 +--
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 314 ++++++++++++++++---
 include/linux/mhi_ep.h                       |  33 +-
 5 files changed, 485 insertions(+), 160 deletions(-)

-- 
2.25.1

