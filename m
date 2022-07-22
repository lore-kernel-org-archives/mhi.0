Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A915A5
	for <mhi@lists.linux.dev>; Fri, 22 Jul 2022 03:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658459982; x=1689995982;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=gEDWsiz11GhB4pUHw7t4kAgF8/TF7yajo/DSLMNkb3Y=;
  b=Ocro+ldQ5jeVCf5YyN5YPjJpoTk2xOQZmrhTougkVu6aiPhe6ARV7PRI
   eCRpmLHtHowyhoTvCpdyX/JMmeaR62/ApsFprlVG1WvXbNG4ZTgcb6giG
   LmKfieY9Nt9E1Xrh28iQ2Ka2S25eAtiFJmh+oE+62albhT1L75vdR1Bv3
   k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Jul 2022 20:17:33 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 20:17:33 -0700
Received: from cbsp-sh-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Jul 2022 20:17:31 -0700
From: Qiang Yu <quic_qianyu@quicinc.com>
To: <mani@kernel.org>, <quic_hemantk@quicinc.com>, <loic.poulain@linaro.org>,
	<quic_jhugo@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>, Qiang Yu
	<quic_qianyu@quicinc.com>
Subject: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in mhi_irq_handler
Date: Fri, 22 Jul 2022 11:17:18 +0800
Message-ID: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
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
 nasanex01a.na.qualcomm.com (10.52.223.231)

The irq handler for a shared IRQ ought to be prepared for running
even now it's being freed. So let's check the pointer used by
mhi_irq_handler to avoid null pointer access since it is probably
released before freeing IRQ.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
---
v2->v3: add comments
v1->v2: change dev_err to dev_dbg

 drivers/bus/mhi/host/main.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index f3aef77a..df0fbfe 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -430,12 +430,25 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
 {
 	struct mhi_event *mhi_event = dev;
 	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
-	struct mhi_event_ctxt *er_ctxt =
-		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
+	struct mhi_event_ctxt *er_ctxt;
 	struct mhi_ring *ev_ring = &mhi_event->ring;
-	dma_addr_t ptr = le64_to_cpu(er_ctxt->rp);
+	dma_addr_t ptr;
 	void *dev_rp;
 
+	/*
+	 * If CONFIG_DEBUG_SHIRQ is set, the IRQ handler will get invoked during __free_irq()
+	 * and by that time mhi_ctxt() would've freed. So check for the existence of mhi_ctxt
+	 * before handling the IRQs.
+	 */
+	if (!mhi_cntrl->mhi_ctxt) {
+		dev_dbg(&mhi_cntrl->mhi_dev->dev,
+			"mhi_ctxt has been freed\n");
+		return IRQ_HANDLED;
+	}
+
+	er_ctxt = &mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
+	ptr = le64_to_cpu(er_ctxt->rp);
+
 	if (!is_valid_ring_ptr(ev_ring, ptr)) {
 		dev_err(&mhi_cntrl->mhi_dev->dev,
 			"Event ring rp points outside of the event ring\n");
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

