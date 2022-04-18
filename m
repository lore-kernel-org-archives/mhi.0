Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23837A29
	for <mhi@lists.linux.dev>; Mon, 18 Apr 2022 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650304242; x=1681840242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7vgg/X3YRmaa1v+s/vbemQypwN7iFeNr7xRuJL8O1bE=;
  b=kRChmf0jkzeNMcGWEjohOgqoL37ADv5QG81i67DCLnUvELb8Si2o08LH
   SRpMGTCyk/Wjey/BfaPAzz/D3MgoIVAGZjCzQSkSRkajjWyWKS+go81vr
   nLs/XPE3NgU6yCrTAwpCv6omZoHPSvgAWziDUVGpZaCwgjwErkpXF+R/F
   E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 18 Apr 2022 10:50:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 10:50:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 10:50:40 -0700
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 10:50:40 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <mani@kernel.org>, <quic_hemantk@quicinc.com>, <quic_bbhatt@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v4 0/2] MHI MMIO register write updates
Date: Mon, 18 Apr 2022 11:50:24 -0600
Message-ID: <1650304226-11080-1-git-send-email-quic_jhugo@quicinc.com>
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

v4:
Address review comments about log messages, and a missing blank line

v3:
Noticed this was reviewed but never picked up.  Rebased to -next

v2:
-Fix testbot reported missing set of changes from pm.c

Bhaumik Bhatt (2):
  bus: mhi: host: Bail on writing register fields if read fails
  bus: mhi: host: Optimize and update MMIO register write method

 drivers/bus/mhi/host/boot.c     | 22 +++++++++----
 drivers/bus/mhi/host/init.c     | 68 ++++++++++++++++++++++++-----------------
 drivers/bus/mhi/host/internal.h |  7 +++--
 drivers/bus/mhi/host/main.c     |  9 ++++--
 drivers/bus/mhi/host/pm.c       | 15 ++++++---
 5 files changed, 77 insertions(+), 44 deletions(-)

-- 
2.7.4

