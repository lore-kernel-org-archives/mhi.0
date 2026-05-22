Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387838887B
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444061; cv=none; b=jHaNp4BwfAYEm+XJ3qQ/e12HQYNqDXRNsM6sTF6tiiFFQ/dY9y8+7gNlf+tVJi+9jgL7o80NP2N7qU+/dGp3cEXVV1QGjlJvckbLE6jDY1BMDBy4rY+842eO1BzkRYkZY38vWq9JB/YqCbolFsXc+1KGFDkA4REcKWfyyGJwaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444061; c=relaxed/simple;
	bh=eEEN3EXZH9+ocSgYvv06EBOEmhgPIImBeQeRcWVT6hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT4nClSf6lWRFivii1cOS7+hTowEpi/8gzmyy+MI2y/vGUEjiPTUNEUBF3a+1NgIr2soU/cozEOi6vDuuoIc2zaki1JBbUMygufBhUAlEi8KLYX/SC+3RT5P342CxbbxRwVy6/8z5ZTvjsjSa6p1vrhiWb5Sw3gJmylKzTKCz0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHh7X2gG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1Vg/lHe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHh7X2gG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1Vg/lHe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M98eEG3005817
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=; b=eHh7X2gGrSZekNOb
	xkDmqbEW54k9aNsjuHmVMXxsX8I8pWfkpIefqSA1ncFswM3zO7mNthHR9mPKM43H
	gdAmQwJvnzvcpAHEzUyu5HWmyqySgPIKvuiNNnXArB1Dm6Ws4O1XZvQdrUbrb0rM
	e5nH7dsWC7/h2UU/D6aL/v3gFuGWLccts+1ZPuEuleYzrW0DdofrlBxGwwdzeXO1
	n2Hx1KrVjELW8du55RA5vhG3FBDWrn0xMTbfzGDQr2TFvHW37LDxACLaIp8TgmjJ
	581P1XwAw4f3uPjgmxmq5AAPMezvBPq0QMjka/UXu0OVM2KHvs1t2VIbYinr6PTk
	RKTB0w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9esj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:00:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82751074c8so11346680a12.0
        for <mhi@lists.linux.dev>; Fri, 22 May 2026 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444058; x=1780048858; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=;
        b=c1Vg/lHeuPGIJzB2zb5Lhp7BA4qOL3UIf8hbnpDhWjN+m+acY+qcF7OGKOg0QI66Fi
         PPZwWp6K9MouraDYgLqcr2QL2IgCUtEVEvSbF/Pd+1Exy4+8NSUt70HsGIgQx3mMX/t6
         q5dhf6mRViaZs2KADT4nVFfy1Uf+nWYLA9KvA8DQwVCxtMDSlNK8MN9YaU3RMw2I0pVD
         zYM5cr8ZkwFiE3pzB3gwg44IvuiZtK6U/q9m9sqVgbJwfFBz8KOYyBmi0yWiYTJByltW
         5W4hHKqjrdDywONJ5BN/D5c8Oq3TtiZUlfxgDbXaNkCVt7xCA7ao8AhPiU7vfvlZ3msv
         lHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444058; x=1780048858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=;
        b=HOiI0p06PLdK6t8BBcKykI7qrcYLYJahthfkbP8SRZGLU9U/COj4vX99URnaRnpqs/
         fA5RAvPAucbUj/WpvonxYysORV210/JB62RspAJSH/MQUMjRnHBey08bybhIKoMC30Rg
         0Lp20nckIvwJlAHUfeoXTPyJAQG5Kan9XECFhyE2NmJsoiy95mWSTGXZDEc/+lDdzLk7
         0RDUmVKwZ8orNa6Zw26lBBY/itj+i/B8xtcVP53Vzk3umHrwPzD3JC39pfgrHEYjyNZB
         610U+GBpBnEzh3T8/QPM0a6GL4QptSvtBGzk3mxH8ldwN3azBYMtHBoJA/MP286976Cs
         D8kA==
X-Gm-Message-State: AOJu0YyNcrVf7y6AEIUpBhvOsXcAOzOR/2fPxoHSsQJ1dXUanjlbvX8d
	6974V3OFvY4Bchpv3qANaEcqXSLi6ZxfWqTxJqXka4k8kGKnYs47ECVDe9PIQhoA1+y4SdUHniu
	4q3ZX+oQb/ndcbZkCT5Pp9C12zvqywvNVe0Zn8JD4INluDElducH0f9Q=
X-Gm-Gg: Acq92OEUuKZ++eSWtCU4R4Vqj40TvFF0vIulSCPckDU2MlULD5pFFWnalHuyov/BAE9
	/w1awM/L2K3YIOp9GA7MlEZ3svuMOF+ElOoATWRkz09NcJbJrUEdemgJn+ufcJE69myXGO5srAL
	6/XqNCq4c5u73BxOBv+wAMM9PIfAHorlOQ2+wuu2prwRTe9Ju/akzLPyX8bdDdwtvu27FJjxqnA
	pbB0CuMmM5xHObAVW5NSh1LtgMxo7RS1wN0ccBaj0GCMESlXbLLT2bEAmBvhxRtfQpkwrLUipx+
	cX4RXUKMXrBrpxc1zhVepZp36xiDMVmHchxHvrQqhv5zLPykEIa4oo8DAbwixv2ygM3wvtBVz1L
	Z+efVc/zUekL7eZW9yJV9zZPgZMRkGF8/JXQ/GxLielS+d6mpvMmsF32k
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr3309577b3a.21.1779444057537;
        Fri, 22 May 2026 03:00:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr3309509b3a.21.1779444056898;
        Fri, 22 May 2026 03:00:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:32 +0530
Subject: [PATCH v2 1/6] bus: mhi: Replace controller runtime_get/put
 callbacks with direct PM runtime APIs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-1-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=4878;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=eEEN3EXZH9+ocSgYvv06EBOEmhgPIImBeQeRcWVT6hU=;
 b=yYhT3RpS8Nz/uaR392bqwxteKBb/FYzWe1XQYz9VQyNj0buTC58NW65aH4cKIQFB4iRyHRzbO
 TWR0AthcqCIB6R0xOUx+HaDt8erCDViPTRy7/AJD6uO/Nw6HrkjyI/U
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10295a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=A_fZCR7qwrwYhkduS1cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX9LfJrY+YNQL8
 LIw+9ntWmsE9gEB9YTqsCqIleC98/IFyzBLZ/gek9WF7vvMTdrGfpO0Tv31TXwHtsWEiN/lxndO
 bBV0mCUbdp/J1c3oK/TkEDsvfnePbAy0rI5Q7nCe6xZ3IRWSbAzYSghMNVaUnkHPpYtYVAKNSeP
 7Mi/1Oeb2i2f6sPBSxjkjhDJuLixxOSXNuVLkEyTv5ABIhsPFef3H6W8Yo67USWzqiQ7C7lGAZs
 +9KfdC0JiycU+yHpagLQtB1sIRaiYVgF7T4Q/G6a9FdyfoXmJyQ2nMb/ZZsMGnnwVs8t6yrRzev
 pK3zQ/bANq3SpgIXruk32jQ6X1/VWoTwTCBIO0hGyOFFAqGnbJ9CPHR7LeCw99lm/kJy29mHG04
 M8swy5xWGOGUbCYILaob0pXV7ijl3066/jAi495pL6HJFb+Wm/iDcHn9x9FNNPOn9rZLZBePTyl
 6YXkJV0HRR1Q2yqdweA==
X-Proofpoint-GUID: UUrIJHahoQrW1blqTJQqcWsACP9dXTjW
X-Proofpoint-ORIG-GUID: UUrIJHahoQrW1blqTJQqcWsACP9dXTjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099

Remove the runtime_get() and runtime_put() function pointers from the MHI
controller and replace their call sites with direct calls to
pm_runtime_get() and pm_runtime_put(). Also add pm_runtime_mark_last_busy()
before each pm_runtime_put() call to properly update the last busy
timestamp for autosuspend.

The removed callbacks provided no additional logic beyond wrapping the PM
runtime APIs, so eliminate the indirection and the requirement for drivers
to implement these no-op callbacks.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     |  1 -
 drivers/bus/mhi/host/internal.h |  7 +++++--
 drivers/bus/mhi/host/main.c     | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 0a728ca2c494..9f3ee4a14418 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -927,7 +927,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	int ret, i;
 
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
-	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
 	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
 	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7b0ee5e3a12d..a7493aabc6fa 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,6 +7,8 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
+#include <linux/pm_runtime.h>
+
 #include "../common.h"
 
 extern const struct bus_type mhi_bus_type;
@@ -352,8 +354,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 }
 
 /* Register access methods */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53c0ffe30070..71919c2e9462 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -661,7 +661,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
 				/* Release the reference got from mhi_queue() */
-				mhi_cntrl->runtime_put(mhi_cntrl);
+				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+				pm_runtime_put(mhi_cntrl->cntrl_dev);
 			}
 
 			read_lock_bh(&mhi_chan->lock);
@@ -1138,7 +1139,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	 * for host->device buffer, balanced put is done on buffer completion
 	 * for device->host buffer, balanced put is after ringing the DB
 	 */
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1149,8 +1150,10 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE)
-		mhi_cntrl->runtime_put(mhi_cntrl);
+	if (dir == DMA_FROM_DEVICE) {
+		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+		pm_runtime_put(mhi_cntrl->cntrl_dev);
+	}
 
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1352,7 +1355,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1383,7 +1386,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1524,7 +1528,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 		if (mhi_chan->dir == DMA_TO_DEVICE) {
 			atomic_dec(&mhi_cntrl->pending_pkts);
 			/* Release the reference got from mhi_queue() */
-			mhi_cntrl->runtime_put(mhi_cntrl);
+			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+			pm_runtime_put(mhi_cntrl->cntrl_dev);
 		}
 
 		if (!buf_info->pre_mapped)

-- 
2.34.1

