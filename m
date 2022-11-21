Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B67E
	for <mhi@lists.linux.dev>; Mon, 21 Nov 2022 07:08:55 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y203so10535891pfb.4
        for <mhi@lists.linux.dev>; Sun, 20 Nov 2022 23:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4F6oqrqFJPhhhwNPUsAzcSi2w5AvzPkTRl0QXXfRuc=;
        b=Czzkl0ffyy8hBjElY6C8m5GTTJ0R0Gbo3Pyx6ZPyFyQr8DF9hGGAYsdO7pvFBbJp7Y
         DrrnSl0lbidrbJsQXve8ZKO1p/6sVQdXcp0bpZS0agpggBjx+NOrZwrctV6GHSb7pSF2
         RRd4H0G5ie+te1QhwqBOxIaCvJFFuIAhwtJDncX6w696SIysdtGHbpKBV/H2keZPuhXO
         NZJhqk0EmEMB2LxeG5pf6mkNLTI4aoE54G5pqAwa3lciCcU6ojph4hgCMMHQqg3wH3y2
         W313EFE8oyU941+1x3zxTdOfRLjjtwG+D4u6m4D9bOzMwcHXGcVlGkEF4SfAlma18uEM
         IQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4F6oqrqFJPhhhwNPUsAzcSi2w5AvzPkTRl0QXXfRuc=;
        b=g0NcYxU11Ha2q0MteYB8ebj9MqeAyGpVRr56o+scNb20EVhiYMvDIpzziDJo/BZfZa
         FPjm+XKY7W2IQi0gYiL9Wi6UU6cr6TEuoLd8S5GKFdR3ZLDR3Uc9HQCZRfDe/S2Cye0Y
         5IPsnO+/2yGoHpXScKoSRWq0gJEV7kxG4FVkcL21QWvP1vjxDl82eU2DfB4ooj24EBtU
         QFwGfY8tsVuBeZpoI6LTD/Mvixkn2BDRCy9pIo774e4iZ1+uSmdqBAi6WS48NrcMNS2S
         xZMQWQTYasJVU2dm9z9vhw3vqhU6EKx8XpjzlBAFOHYVDs9KOmifRPenkAItLwu8IerK
         43oA==
X-Gm-Message-State: ANoB5pmrNU96qO8hnJH6UlWoX2QYi2NAkV9/Jt9FIEY7kX1AH/Qt4eh0
	vUnIWoIiGCY6IO/3x+JLQkLs
X-Google-Smtp-Source: AA0mqf579ucEWnZvbAzFMBcy8PhOnu5bfWaaXwg5XBJ+1sL372hxjAeotwJ8QlrS5nLgHgtsUz6JOA==
X-Received: by 2002:a63:580a:0:b0:477:12e3:6e1c with SMTP id m10-20020a63580a000000b0047712e36e1cmr1025179pgb.126.1669014534840;
        Sun, 20 Nov 2022 23:08:54 -0800 (PST)
Received: from thinkpad ([59.92.99.222])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001885041d7b8sm8870787pls.293.2022.11.20.23.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 23:08:53 -0800 (PST)
Date: Mon, 21 Nov 2022 12:38:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, fabio.porcedda@gmail.com,
	johan+linaro@kernel.org, song.fc@gmail.com, slark_xiao@163.com
Subject: [GIT PULL] MHI changes for v6.2
Message-ID: <20221121070849.GD11945@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.2

for you to fetch changes up to 5562c6a9657e1bffd4d66df841db142c596f411c:

  bus: mhi: host: pci_generic: Add definition for some VIDs (2022-11-17 17:20:40 +0530)

----------------------------------------------------------------
MHI Host
========

Core
----

- Use mhi_soc_reset() API for resetting the modem in case of crash.
- Fixed a race condition between mhi_prepare_channel() and M0 state
  transition. This can happen when mhi_prepare_channel() was updating the
  read/write pointers and in parallel, the mhi_pm_m0_transition() rings
  the doorbell of all channels without checking if it was enabled or not.
  Fixed the race by ringing the doorbell only for the enabled channels in
  mhi_pm_m0_transition().

pci_generic
-----------

- Added a secondary "AT" port using the OEM reserved channel of Telit FN990
  modem.
- Added support for a SDX55 variant modem that exists in the Qualcomm
  SC8280XP Compute Reference Design (CRD).
- Added support for a T99W175 variant modem manufactured by HP. The modem
  uses the same configuration as of T99W175, but with a different VID:PID.
- Added local definitions for some VIDs (Thales and Quectel).

MAINTAINERS
===========

- Removed Hemant from MHI MAINTAINERS list since he left Qualcomm and
  expressed his wish to not continue doing reviews for MHI patches.

----------------------------------------------------------------
Fabio Porcedda (1):
      bus: mhi: host: pci_generic: Add a secondary AT port to Telit FN990

Johan Hovold (1):
      bus: mhi: host: pci_generic: add support for sc8280xp-crd SDX55 variant

Manivannan Sadhasivam (1):
      MAINTAINERS: Remove Hemant from MHI bus

Qiang Yu (2):
      bus: mhi: host: Use mhi_soc_reset() API in place of register write
      bus: mhi: host: Fix race between channel preparation and M0 event

Slark Xiao (1):
      bus: mhi: host: pci_generic: Add definition for some VIDs

Song Fuchang (1):
      bus: mhi: host: pci_generic: Add HP variant of T99W175

 MAINTAINERS                        |  1 -
 drivers/bus/mhi/host/boot.c        |  4 +---
 drivers/bus/mhi/host/pci_generic.c | 25 ++++++++++++++++++-------
 drivers/bus/mhi/host/pm.c          |  3 ++-
 4 files changed, 21 insertions(+), 12 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
