Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93327129EDD
	for <mhi@lists.linux.dev>; Mon, 18 Dec 2023 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlcLHBxJ"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-425baafa3c3so30207091cf.0
        for <mhi@lists.linux.dev>; Mon, 18 Dec 2023 06:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702909116; x=1703513916; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwN7NRMVrn5Cj1ouV+gdYT1eOMlbFHbSF+nSRWU0+iU=;
        b=XlcLHBxJtPmWCTPYVhYLHNEkTraj5XwHJaSmG830TXXgL0HHLtLySMYkCadZK9gW2V
         g1+K3eJpd6PDFIr0/yjsyEB98Cb5SHxYqNkEAhm0Qp1BHA77Ma2d8QVkPGpzaToOSeSo
         lsdZrysUpJDIKadDR0zRzPUkp60TZ8fFT3X0NH/rre/BfeG37YGSzVSYekmwNXK9yhrP
         8JxLFbs/ZBYsv9wRmU6lh7HX8zip7G1aUbeCT8V37CSEQIULPRfWH0djHe2W+FwZTh/l
         yooMx7bsZvzewDxEsdlRPP+cahxLg9Dnn36IXErDM7iOLDd2VPHUEBhivQ+OhX9mH6aN
         HJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702909116; x=1703513916;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwN7NRMVrn5Cj1ouV+gdYT1eOMlbFHbSF+nSRWU0+iU=;
        b=oZjbpXBZcNqHJmm6WHUpeB3UimLzDc+o0TNmSl8kEl9Pjz2Q3kUN6h4hdvmiPuTj5C
         cwsI36v7FDpD5zFD2CyZcSpwDLf7PyV56jWD+9klPxwx+Yj2ZqC+cu2qMKz7YZqqHW6M
         hXj9gAKGwsKU0mOkq7UaoHVsYwm5n6PDjcUhdL7BDCjrwrbXCYNseR205X4feA/U+9Kd
         o3CJH652xSW7yfNNVEjy2GjNmJowmbeVtpgzOkt6sMF+MXAwmwhNoiDduHVNOjfCECK4
         pZQChMPsE9D9s/8Ww157ZwROOzclDR+HjSuje0u358Gv+G3EaYYN+GTHZUuD9ALCmyeI
         0LiQ==
X-Gm-Message-State: AOJu0Yw/SasP8fd7Ao46le1s4Mhu14lUosjKrzfoJSzK+uw787Oem0so
	hyFwzh8PevUTMSlrEGFK4lQP
X-Google-Smtp-Source: AGHT+IF8V5c9mOts85EfkFvu+/r+J1mMYOS8qKzY58qhGcbLjdFbvVZ95Q8+KCycSUGnazcuXcOAXQ==
X-Received: by 2002:a05:622a:1d0:b0:41e:31b5:5c8d with SMTP id t16-20020a05622a01d000b0041e31b55c8dmr23794684qtw.56.1702909116390;
        Mon, 18 Dec 2023 06:18:36 -0800 (PST)
Received: from thinkpad ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85145000000b00423d75e0444sm9311637qtn.73.2023.12.18.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 06:18:35 -0800 (PST)
Date: Mon, 18 Dec 2023 19:48:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, quic_krichai@quicinc.com
Subject: [GIT PULL] MHI changes for v6.8
Message-ID: <20231218141828.GB2900@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.8

for you to fetch changes up to 01bd694ac2f682fb8017e16148b928482bc8fa4b:

  bus: mhi: host: Drop chan lock before queuing buffers (2023-12-16 10:54:29 +0530)

----------------------------------------------------------------
MHI Host
========

- Added alignment check for event ring read pointer to avoid the potential
  buffer corruption issue.
- Added support for SDX75 modem which takes longer time to enter READY state.
- Added spinlock to protect concurrent access while queuing transfer ring
  elements.
- Dropped the read channel lock before invoking the client callback as the
  client can potentially queue buffers thus ending up wtih soft lockup.

MHI Endpoint
============

- Used kzalloc() to allocate event ring elements instead of allocating the
  elements on the stack, as the endpoint controller trying to queue them may not
  be able to use vmalloc memory (using DMA).
- Used slab allocator for allocting the memory for objects used frequently and
  are of fixed size.
- Added support for interrupt moderation timer feature which is used by the host
  to limit the number of interrupts raised by the device for an event ring.
- Added async read/write DMA support for transferring data between host and the
  endpoint. So far MHI EP stack assumed that the data will be transferred
  synchronously (i.e., it sends completion once the transfer APIs are returned).
  But this impacts the throughput if the controller is using DMA to do the
  transfer.

  So to add async suport, existing sync transfer APIs are renamed to
  {read/write}_sync and also introduced two new APIs {read/write}_async for
  carrying out the async transfer.

  Controllers implementing the async APIs should queue the buffers and return
  immediately without waiting for transfer completion. Once the transfer
  completion happens later, they should invoke the completion callback so that
  the MHI EP stack can send the completion event to the host.

  The controller driver patches (PCI EPF) for this async support are also merged
  to the MHI tree with Acks from PCI maintainers.
- Fixed the DMA channel direction in error path of the PCI EPF driver.

----------------------------------------------------------------
Bhaumik Bhatt (1):
      bus: mhi: host: Add spinlock to protect WP access when queueing TREs

Krishna chaitanya chundru (1):
      bus: mhi: host: Add alignment check for event ring read pointer

Manivannan Sadhasivam (13):
      bus: mhi: ep: Do not allocate event ring element on stack
      bus: mhi: ep: Use slab allocator where applicable
      bus: mhi: ep: Add support for interrupt moderation timer
      bus: mhi: ep: Pass mhi_ep_buf_info struct to read/write APIs
      bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
      bus: mhi: ep: Introduce async read/write callbacks
      PCI: epf-mhi: Simulate async read/write using iATU
      PCI: epf-mhi: Add support for DMA async read/write operation
      PCI: epf-mhi: Enable MHI async read/write support
      bus: mhi: ep: Add support for async DMA write operation
      bus: mhi: ep: Add support for async DMA read operation
      bus: mhi: ep: Add checks for read/write callbacks while registering controllers
      PCI: epf-mhi: Fix the DMA data direction of dma_unmap_single()

Qiang Yu (3):
      bus: mhi: host: Add a separate timeout parameter for waiting ready
      bus: mhi: host: pci_generic: Add SDX75 based modem support
      bus: mhi: host: Drop chan lock before queuing buffers

 drivers/bus/mhi/ep/internal.h                |   4 ++
 drivers/bus/mhi/ep/main.c                    | 387 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------
 drivers/bus/mhi/ep/ring.c                    |  60 +++++++++++++++-------
 drivers/bus/mhi/host/init.c                  |   1 +
 drivers/bus/mhi/host/internal.h              |   2 +-
 drivers/bus/mhi/host/main.c                  |  34 +++++++-----
 drivers/bus/mhi/host/pci_generic.c           |  22 ++++++++
 drivers/bus/mhi/host/pm.c                    |  24 ++++++---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 314 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------
 include/linux/mhi.h                          |   4 ++
 include/linux/mhi_ep.h                       |  36 +++++++++++--
 11 files changed, 680 insertions(+), 208 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
