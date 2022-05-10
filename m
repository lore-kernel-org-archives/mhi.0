Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E323B7
	for <mhi@lists.linux.dev>; Tue, 10 May 2022 06:21:25 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id x88so3491671pjj.1
        for <mhi@lists.linux.dev>; Mon, 09 May 2022 23:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=f0ZQoiwRSTWeuW/E0qX/vgU+j2w7ZPOXgEISOXG2/K8=;
        b=rhbooEKxSweLF/hKTN6wo/TqGR2odyzF+HAlYzvlyW2M3o573J3e8/BCh4x6ye4QXB
         yBonBPk4b8Txqjxw55KdKLwjFjGvpDdHMaVkzzKJXz/EWKC4gDCIxtZ3agLZc+D/9KJw
         L9E2N6+SLNJPRBM7LKXwBGk+zIOFwr+WlXjm85lSXlSbQ6zIwI+FEEnLms/2EHfhV4eP
         FOVeKytypd7QBmIXueSRvKy8YPOLcmQ9KatpSEVnhApQToljdstSJxNPOAzxyH3ofGSe
         wpE9lnDhxaxMlnPRT/CvViVkG3odFeqfg39QVi93JMcRGyAMUJjbqXcEP3j3RGcqiii8
         T2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=f0ZQoiwRSTWeuW/E0qX/vgU+j2w7ZPOXgEISOXG2/K8=;
        b=kYyLSA5l3/f60GvtnbNVGRaQz4SHcPgh/qHkqQU/792gZvDen/9uLZ3DtRGfVybgI3
         x949e9GPW279VKKMLtPlUghBA2bHZRlXrR5SILT24oUaz2Ef0V7EAL1dZOVOn6qszeui
         QJG5Ll5XIyUweJ15iDZhiteWUMM6qUoQdCD5dG5Er502E9hXhZUvosnNyhXsCT97BsOk
         JbXLQFbvaW6y55LemDm9dqw6CpcGeiDkOARzdxopkUUdlygDt/yVNdrsmWpwYeKk/I2E
         LjWoQyXihPpzhkP1U1XMdXqr4QoPnBMF4Lh+56Qv6kdfWO9r77GUH1wbwXoS18GnhUOM
         4knA==
X-Gm-Message-State: AOAM5337iHD5aKlKRplQ2pIbKGOEK522oSQX1F0HNG80ty93KJ/ys1/I
	62mRlo/eZvKmvx2qTmjc/lrXyejZdY1I
X-Google-Smtp-Source: ABdhPJxbl+nGav8AiYmNljVz6gZZTrIxKjYDVGiZPJy5CyQg4eiieJxb9aDGLyuKH8TR5PaJAwb+mw==
X-Received: by 2002:a17:902:cecf:b0:15e:b10a:9f3a with SMTP id d15-20020a170902cecf00b0015eb10a9f3amr19895067plg.118.1652163685110;
        Mon, 09 May 2022 23:21:25 -0700 (PDT)
Received: from thinkpad ([220.158.159.212])
        by smtp.gmail.com with ESMTPSA id r3-20020a170903020300b0015e8d4eb22dsm1041830plh.119.2022.05.09.23.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 23:21:24 -0700 (PDT)
Date: Tue, 10 May 2022 11:51:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: quic_hemantk@quicinc.com, slark_xiao@163.com, quic_jhugo@quicinc.com,
	Daniele.Palmas@telit.com, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v5.19
Message-ID: <20220510062120.GA9140@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 5d4be19cbe6aadfad0a5f40df91bd478cedd8344:

  bus: mhi: ep: Add uevent support for module autoloading (2022-04-04 10:17:51 +0530)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.19

for you to fetch changes up to 13b9b814da2de5006795ddcff2bbaea46017429d:

  bus: mhi: host: Add support for Foxconn T99W373 and T99W368 (2022-05-10 11:10:56 +0530)

----------------------------------------------------------------
MHI changes for v5.19

MHI Host
--------

Support for new modems:

 - Foxconn Cinterion MV32-WA/MV32-WB based on SDX62/SDX65
 - Telit FN980 v1 based on SDX55
 - Telit FN990 based on SDX65
 - Foxconn T99W373/T99W368 based on SDX62/SDX65

Core changes:

 - During the recycle of event ring elements, compute the ctxt_wp based on the
   local cached value instead of reading from shared memory. This is to prevent
   the possible corruption of the ctxt_wp as some of the endpoint devices could
   modify the value in shared memory.

 - Add sysfs support for resetting the endpoint based on the MHI spec. The MHI
   spec allows the host to hard reset the device in the case of an unrecoverable
   error and all other reset mechanisms have failed.

 - During MHI shutdown, wait for the endpoint device to enter the ready state
   post reset before proceeding. This is to avoid a possible race where host
   would remove the interrupt handler and device will send ready state
   interrupt, resulting in IOMMU fault.

 - Bail out updating the MHI register if the read has failed during
   read/modify/write.

 - Use mhi_write_reg() instead of mhi_write_reg_field() for writing the whole
   register fields in mhi_init_mmio().

MAINTAINERS change:

 - Since Qualcomm has moved the email domain for its employess from codeaurora
   domain to quicinc, update the same for Hemant.

----------------------------------------------------------------
Bhaumik Bhatt (2):
      bus: mhi: host: Bail on writing register fields if read fails
      bus: mhi: host: Optimize and update MMIO register write method

Daniele Palmas (2):
      bus: mhi: host: pci_generic: add Telit FN980 v1 hardware revision
      bus: mhi: host: pci_generic: add Telit FN990

Jeffrey Hugo (3):
      bus: mhi: host: Use cached values for calculating the shared write pointer
      bus: mhi: host: Add soc_reset sysfs
      bus: mhi: host: Wait for ready state after reset

Manivannan Sadhasivam (2):
      MAINTAINERS: Update Hemant's email id
      bus: mhi: host: pci_generic: Sort mhi_pci_id_table based on the PID

Slark Xiao (2):
      bus: mhi: host: Add support for Cinterion MV32-WA/MV32-WB
      bus: mhi: host: Add support for Foxconn T99W373 and T99W368

 Documentation/ABI/stable/sysfs-bus-mhi |  10 +++++++
 MAINTAINERS                            |   2 +-
 drivers/bus/mhi/host/boot.c            |  22 ++++++++++----
 drivers/bus/mhi/host/init.c            |  82 ++++++++++++++++++++++++++++++++++------------------
 drivers/bus/mhi/host/internal.h        |   7 +++--
 drivers/bus/mhi/host/main.c            |  18 +++++-------
 drivers/bus/mhi/host/pci_generic.c     | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 drivers/bus/mhi/host/pm.c              |  24 ++++++++++++---
 8 files changed, 234 insertions(+), 64 deletions(-)
-- 
மணிவண்ணன் சதாசிவம்
