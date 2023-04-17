Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6504C2EB
	for <mhi@lists.linux.dev>; Mon, 17 Apr 2023 08:54:02 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id g6so7944081pjx.4
        for <mhi@lists.linux.dev>; Mon, 17 Apr 2023 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681721642; x=1684313642;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg/wKJdm9eMUbByDJsTZRJy04IGqfKKqjn7gNdE2cNg=;
        b=XBzZ3sF8bYGM3f7DhMDcwShBdTzjrpcGeIy7g7TwFwjKf9mU6Us9s9jmJnHPLs34dG
         hqsnYlm018+4bBf9zvn4qoCAXdnUNme9lYQ+tGfOOqS+FY9hXT0+cSTnH5KjhGhnj1u2
         GHu6Y03IUakX3Z4RDilckHHr9ilnJRveSq78tPpyTTrO/Alf8+9JHzVCuyRP7EhIH8//
         ADowZVcmvzj9V/FMqxUnlDfpKZ4rm6LLjlj5sPfJIQWUGaAklLAJipHJMEspr2PJZM+k
         2Pz6vzPLlZ9TYz9KmT5HLQr0OF0S7+Aj3n3/KB4J4Ayl8iXWE84DdWp9Tr9gmUxW5neQ
         cxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681721642; x=1684313642;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg/wKJdm9eMUbByDJsTZRJy04IGqfKKqjn7gNdE2cNg=;
        b=B210BUzVxs+SySqBS6kN0N1l8B7akpoEUHraOiwlntsZFy68VpY9pmxtYAZAi3cJqR
         THdKPZfnLcPuTaS6nuXd83xI1PKIvYN6p1iM6aAIGZfai9TlCcyngknF3CFHrWT9GKdV
         RAP8Xtn3vM+7D+6Hi7nXVCwn2A4Dajd0y0EDzzOdKitSEeeIWy+TwHwnfNbrD3He5p46
         BpmgSwKPQhV1WeUFR7RhRZOq699uPJj0KCjKlDxRp7KHTdACaKVRKInXccZ2Ps8KlDtj
         RLAY+WQJtiZs5Ti97pStzocJzrdSnY/zQqkO31h0aUA6s7GAjIxrvk1Ieov/w0O3bY5X
         e6Ig==
X-Gm-Message-State: AAQBX9fwolL77atxB6P7jWGlz6e0+Lg0/9M9UA93sWbiyOp8syscvVdk
	xj3iT3q64d+b20vMlkYbhI6k
X-Google-Smtp-Source: AKy350beR97dV1Y2ZwPn9jaeOe3rT7lqnlATCS0CP4T3Z+qDmX88B+WP3jemIWXrhjpAxNELVcHyRg==
X-Received: by 2002:a05:6a21:78a6:b0:f0:42b4:d428 with SMTP id bf38-20020a056a2178a600b000f042b4d428mr329297pzc.61.1681721641933;
        Mon, 17 Apr 2023 01:54:01 -0700 (PDT)
Received: from thinkpad ([27.111.75.72])
        by smtp.gmail.com with ESMTPSA id d9-20020aa78149000000b005a9ea5d43ddsm7249237pfn.174.2023.04.17.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 01:54:01 -0700 (PDT)
Date: Mon, 17 Apr 2023 14:23:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, slark_xiao@163.com, bhelgaas@google.com,
	quic_jhugo@quicinc.com, quic_vpernami@quicinc.com
Subject: [GIT PULL] MHI changes for v6.4
Message-ID: <20230417085357.GB2874@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.4

for you to fetch changes up to 1d1493bdc25f498468a606a4ece947d155cfa3a9:

  bus: mhi: host: Use mhi_tryset_pm_state() for setting fw error state (2023-04-10 21:32:55 +0530)

----------------------------------------------------------------
MHI Host
========

Core
----

- Removed the "mhi_poll()" API as there are no in-kernel users available at the
  moment.

- Added range check for the CHDBOFF and ERDBOFF registers in case the device
  reports bad values.

- Fixed the errno for the rest of the range checks to use -ERANGE.

- Modified the event ring handlers to ring the doorbell only if there are
  any pending elements in the ring to process for the device.

- Removed the check for EE (Execution Environment) while processing the SYS_ERR
  transition as it creates device recovery issues when SBL (Secondary
  Bootloader) crashes early.

- Used mhi_tryset_pm_state() API to set the error state instead of open coding
  if the firmware loading fails. This avoids the race with other pm_state
  updates.

pci_generic
-----------

- Dropped the dedundant pci_{enable/disable}_pcie_error_reporting() calls from
  driver probe's error path as the PCI core itself takes care of that now.

- Revered the commit 2d5253a096c6 ("bus: mhi: host: pci_generic: Add a secondary
  AT port to Telit FN990") as it turned out to be erroneous. This happened due
  to the patch adding secondary AT port for FN990 getting applied through NET
  and MHI trees and this caused two commits for the same functionality but one
  of them ended up wrong.

- Added support for Foxconn T99W510 modem based on SDX24 chipset from Qualcomm.

MHI Endpoint
============

- Demoted the channel not supported error log to debug as not all devices will
  support all channels defined in MHI spec and this may spam users.

----------------------------------------------------------------
Bjorn Helgaas (1):
      bus: mhi: host: pci_generic: Drop redundant pci_enable_pcie_error_reporting()

Jeffrey Hugo (4):
      bus: mhi: host: Range check CHDBOFF and ERDBOFF
      bus: mhi: host: Use ERANGE for BHIOFF/BHIEOFF range check
      bus: mhi: host: Remove duplicate ee check for syserr
      bus: mhi: host: Use mhi_tryset_pm_state() for setting fw error state

Manivannan Sadhasivam (2):
      bus: mhi: host: Remove mhi_poll() API
      bus: mhi: ep: Demote unsupported channel error log to debug

Slark Xiao (2):
      bus: mhi: host: pci_generic: Revert "Add a secondary AT port to Telit FN990"
      bus: mhi: pci_generic: Add Foxconn T99W510

Vivek Pernamitta (1):
      bus: mhi: host: Avoid ringing EV DB if there are no elements to process

 drivers/bus/mhi/ep/main.c          |  4 ++--
 drivers/bus/mhi/host/boot.c        | 16 ++++++++++++----
 drivers/bus/mhi/host/init.c        | 16 ++++++++++++++--
 drivers/bus/mhi/host/main.c        | 25 +++++++------------------
 drivers/bus/mhi/host/pci_generic.c | 28 +++++++++++++++++++---------
 include/linux/mhi.h                |  7 -------
 6 files changed, 54 insertions(+), 42 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
