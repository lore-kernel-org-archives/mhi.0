Received: from out199-12.us.a.mail.aliyun.com (out199-12.us.a.mail.aliyun.com [47.90.199.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D009622
	for <mhi@lists.linux.dev>; Fri,  4 Mar 2022 00:11:51 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0V69QsyJ_1646352701;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0V69QsyJ_1646352701)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 04 Mar 2022 08:11:42 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mani@kernel.org
Cc: hemantk@codeaurora.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] bus: mhi: ep: Fix an ignored error return from ida_alloc()
Date: Fri,  4 Mar 2022 08:11:39 +0800
Message-Id: <20220304001139.95082-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return from the call to ida_alloc() is int, it can be a negative
error code, however this is being assigned to an unsigned int variable
'mhi_cntrl->index', so assign the value to 'ret' concurrently to solve
this problem without affecting other functions.

Eliminate the following coccicheck warning:
./drivers/bus/mhi/ep/main.c:1422:5-21: WARNING: Unsigned expression
compared with zero: mhi_cntrl -> index < 0

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/bus/mhi/ep/main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 3e98107f08c4..b27e90d97029 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1418,11 +1418,9 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);
 
 	/* Set controller index */
-	mhi_cntrl->index = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
-	if (mhi_cntrl->index < 0) {
-		ret = mhi_cntrl->index;
+	mhi_cntrl->index = ret = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
+	if (ret < 0)
 		goto err_destroy_wq;
-	}
 
 	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
 	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,
-- 
2.20.1.7.g153144c

