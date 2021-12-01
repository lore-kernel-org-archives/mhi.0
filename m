Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9942CA0
	for <mhi@lists.linux.dev>; Wed,  1 Dec 2021 01:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1638320505; x=1669856505;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Tmns+pSWd50vLS9F74F2TuYEdYx1lfAxUZZYVCRGMt8=;
  b=GLZf/A5HXUsU43d8TG7GvaaGEGoYkSwfzhvCfmWQElXoNAIDvvI6JLyt
   fGUibAlP+2N7lLeGg/DZlddJsb79eO0+EveeyTwo3ZZZDYPB0x2uaNqyn
   8WIXe1gS2sTNowJPi5L2UjfvBTO5Fh5H0J/HNew3EgEuqEjNZzDUySFn2
   U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Nov 2021 17:01:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 17:01:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 17:01:39 -0800
Received: from vivace-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 30 Nov 2021 17:01:38 -0800
From: Bhaumik Bhatt <quic_bbhatt@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <quic_hemantk@quicinc.com>,
	<quic_jhugo@quicinc.com>, <linux-kernel@vger.kernel.org>,
	<mhi@lists.linux.dev>, <stable@vger.kernel.org>, <quic_olgak@quicinc.com>,
	<loic.poulain@linaro.org>, Bhaumik Bhatt <quic_bbhatt@quicinc.com>
Subject: [PATCH v2] bus: mhi: core: Fix reading wake_capable channel configuration
Date: Tue, 30 Nov 2021 17:01:31 -0800
Message-ID: <1638320491-13382-1-git-send-email-quic_bbhatt@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)

The 'wake-capable' entry in channel configuration is not set when
parsing the configuration specified by the controller driver. Add
the missing entry to ensure channel is correctly specified as a
'wake-capable' channel.

Cc: stable@vger.kernel.org
Fixes: 0cbf260820fa ("bus: mhi: core: Add support for registering MHI controllers")
Signed-off-by: Bhaumik Bhatt <quic_bbhatt@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/bus/mhi/core/init.c | 1 +
 1 file changed, 1 insertion(+)

v2:
-Update subject as per comments
-Add fixes tag and CC stable

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5aaca6d..f1ec3441 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -788,6 +788,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->pre_alloc = ch_cfg->auto_queue;
+		mhi_chan->wake_capable = ch_cfg->wake_capable;
 
 		/*
 		 * If MHI host allocates buffers, then the channel direction
-- 
2.7.4

