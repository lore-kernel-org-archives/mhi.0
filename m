Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADB290C
	for <mhi@lists.linux.dev>; Wed, 13 Apr 2022 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649865578; x=1681401578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ES87OSBxlG40IumnNSe3tDebltkv7o6zRDRSKloQCJ4=;
  b=pagHz8tTuGfTKfVUOY+4R1Pk0TDJpBTt2AQKu2Vd+hd7SBbjIS12ARRU
   RPxVmCZiJkKnDNuYH2AZUE+ix0w7HlOyQu1adp9rBYbkPkdQHnM6WIwfw
   bTUqIOAgEDonZ2EH7JLYvOwDW1axzDzWCIpkn95n99z6f9TWy9iH13dH+
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 13 Apr 2022 08:57:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 08:57:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 08:57:08 -0700
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Apr 2022 08:57:07 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <loic.poulain@linaro.org>, <mani@kernel.org>, <quic_hemantk@quicinc.com>,
	<quic_bbhatt@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v3 0/2] MHI MMIO register write updates
Date: Wed, 13 Apr 2022 09:56:44 -0600
Message-ID: <1649865406-30198-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)

In case of MHI MMIO writes, the register field write function needs to do reads
before writes are performed. Propagate read failures such that callers are made
aware of those and can take appropriate action instead of running blind.

Optimizing the MMIO initialization function to use mhi_write_reg() in most cases
should also be done to improve design.

These patches were tested on X86_64 architecture with Ubuntu 18.04 and SDX65
attach.

v3:
Noticed this was reviewed but never picked up.  Rebased to -next

v2:
-Fix testbot reported missing set of changes from pm.c

Bhaumik Bhatt (2):
  bus: mhi: host: Bail on writing register fields if read fails
  bus: mhi: host: Optimize and update MMIO register write method

 drivers/bus/mhi/host/boot.c     | 21 +++++++++----
 drivers/bus/mhi/host/init.c     | 68 ++++++++++++++++++++++++-----------------
 drivers/bus/mhi/host/internal.h |  7 +++--
 drivers/bus/mhi/host/main.c     |  9 ++++--
 drivers/bus/mhi/host/pm.c       | 15 ++++++---
 5 files changed, 76 insertions(+), 44 deletions(-)

-- 
2.7.4

