Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6399131A547
	for <mhi@lists.linux.dev>; Mon,  1 Dec 2025 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593035; cv=none; b=I0WD0X3X3NxCcxw7kJkVWZ2KjG08Wlh48iZHavix2RYmHOTMoIwZ8PhB1X7ITWz5YDwz3NAr/TVsgi5AXyGoY/HK0Cd+oMm48bXDEYSyLe2KhYWR9/k/SaLfOi0u/LbbqICl5CSy8j4+dRN/DiSsd06dXqjiUV9eAt30u7PTPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593035; c=relaxed/simple;
	bh=GH482HQseJW7R4QoliiIACcw54hmP3LITJI8fgJuTts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jHULMOB+dvBkxuLdKYpErNCsftKqcotQLHfWp1Er0LaOJqGrUxzHKUNEvNa+nX58XZBSfkvt7s9lhdLoFcaxf8juvx5NVk0qX31iQzG67hssoR6CqbZ5euw7DjT+r2O/yvaD8izL+E73S6sJeDXHr9NBdPjERBP3lsW5f/vleis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gv12s/IH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LD3Wn01h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv12s/IH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LD3Wn01h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19a1Ff451837
	for <mhi@lists.linux.dev>; Mon, 1 Dec 2025 12:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3eWAp1Uztlnh+JGWFxdF/vF9gNgmc6EwOi5LM6HCKM=; b=Gv12s/IHP5hSlfis
	zkDXZpDoYamcMTEOyJ1p0r9bM8Y/Puj1Ba5v1QbW66gJM65C5DN6JbercA1y2ldq
	L+G6uEw/hBvpwRCn5FIlG4qwn9yhQ+Gv95ANFSAAv6zTVyHy193kJ3zh7Lt9hv3N
	+j2iUG1JQpkggG+Grfn/zCN1oLMPTuOI5RTe1UxdRd57RaRxkOT6QfGGMBOJaffb
	kaC284BGLOz+3TgYmBwWjvRIskHXXTkI7/qCdvCYvN/zr7yruadYlpX0bgnir+KF
	AVy5Z5waXZt0KH2Ziw7eTTTKWxlHQkQ3iaaIAJ8iGkFBDVX7ywTeTE5NqJyJTQAR
	L5PYBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8hergag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 12:43:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297dabf9fd0so53088165ad.0
        for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593031; x=1765197831; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3eWAp1Uztlnh+JGWFxdF/vF9gNgmc6EwOi5LM6HCKM=;
        b=LD3Wn01hqsi+PaQYK/6TPBk06wuWoQEtv6K1bkDRHipUIMpiFcFJ+aoI0CvI+O/93f
         5SWBOxm+CnQIIJWNVSpeQveEGui3rbcjiEUPVu92dDocRP4mUT9SgQuBbkmdv8fnwBS/
         CN4xz/vcqr763idL7amp3i7qVpKvtjFCNArPomozkprmnaKZRjrWK3CEhqy5SPjDYOO9
         JJ2rzGf2g7lQxCxLti+i8wmx/nlij4d8kRl5feJSTx0fjXEiZZ2TUZfR8wPG3E4WO4oB
         RsClRo0bRCQsvQJZQSi2WW/QSsfhx/y86BL3V5ezmvYYJ5ZE8U6d5PVZ7dRqzSq0/IQd
         aqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593031; x=1765197831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3eWAp1Uztlnh+JGWFxdF/vF9gNgmc6EwOi5LM6HCKM=;
        b=vxdZ0655K8zID0ciNCxGWZZIvlT0nIGpCxz8QKSIriALO/q7AiRWyNFnssU+R18nct
         /7c9Edt8gSOR5/7LvRTZBsRls4NuNGXSIADD4jvJdYxBCHWFKzMOi+8Nc0LukWxBTzkI
         0AUSmXSPoNitE9qEcsjU0SUREg8uk6/N5D3eptEIj614g4l8oK3BQuGARNj6iJxDKexw
         xCcbhs5ijjbui9T2Ny3eroAqdzOLIwpyCWNywfJPj5j7BLWQZcgT2YdWJXZpPcgWElaL
         N8Orv+AFOmvUZzL3940htLQS5PbGobTlYL/2WFviVMPYg1KQmbu7RQuRJCcIDlM9gfBk
         3vFQ==
X-Gm-Message-State: AOJu0YyAjEK0vzzCn9DU/w6Gi/+9PxEuZoHHBUojwaxUvGyi2aF1piEG
	Hdal4juH0EfJndDwghbwIcZKCSyGqGXTvH9xVn6bkmTTWI/FgpWCt1PfZAKkCfP+9Uly71jdUdK
	13nLkfHnhJhuyQ4dbZBzfp5TjRY/83G9qKW42ZCIKiOuUynvT6CfRIHQ=
X-Gm-Gg: ASbGncsnrfICgQmic1aN96fEII6MYmbJKb16ra4I+gGi+EGG38K8przFruhU/nat/nL
	zMfzRIHZrGtf9bCq8FKKDWajltiOZ+4kh6iMzdAdZrz61xVmhroy2NaP33jRoSnamKguri0u4Cg
	C51vliPfhPUQloVr2x7LKO8pkvF/tnLNdn/um3NTtGYVpr89TPAbnmwx799q9kRe4RL+27F52Iv
	NxXgJW+OTQDkHx3fnfNAcxf4c9YQfPeTyUHzs4459wrmB3pmCxV7BTFjhzkjLG8A67HMmpqOVdR
	ObQpSS8isscuvWo8C9UnkvxTDJywUXCwhvLdWSXWK+QR6w/WOJdaNnL3M5OIyy+C+wrOufaKC5Z
	Kdm2EwHONBtqsjrZpRV5Xwx9yXkfxZJWaPe4Y6nP4/zjk
X-Received: by 2002:a17:90b:4ec7:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-34733f4ac35mr37194042a91.29.1764593030912;
        Mon, 01 Dec 2025 04:43:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+1AJmch3kW0mA+J5AWIFl5cR6CskMUYu3HyMBvIiPCYmUUTKrD3aXjJSClrHjHz/ZGceKoA==
X-Received: by 2002:a17:90b:4ec7:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-34733f4ac35mr37194006a91.29.1764593030406;
        Mon, 01 Dec 2025 04:43:50 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:50 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:20 +0530
Subject: [PATCH 4/4] bus: mhi: Fix broken runtime PM design
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-4-fab94399ca75@oss.qualcomm.com>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=7600;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=GH482HQseJW7R4QoliiIACcw54hmP3LITJI8fgJuTts=;
 b=6iTeiDENHrbVLHbi/ceLO/7iDY2j59zpb8UbDBQqB3y4mszKHxMTOmMfNQCmVJepmbVUaIH3P
 FIGaMVQ5N2wAm3TcemuMJi1WTt4sNs8Uya2mNRCAqG28Z03+njJQ/cu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=LewxKzfi c=1 sm=1 tr=0 ts=692d8d88 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=A8rfxp3GyOsx1I41rDQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: nV3ulFzp-ULSP7NuSb83EgM3_t-44hoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfXwFk4GxhgPcgx
 sJh5mEGruf1X7C3TqXLq0j1rHf7w/SViTbCATp94BwdptL+L9Qwx7vMQdFkouvIqUIN816y9Wjo
 EadCekasiGSTdOvybaBR9eY/N8hVYAhft3dpQZ+EJ0mP0GoO/4f5eMbyNrQuXnZdNUqAUw9gwKP
 +blNRWpAW+baihn3NAWhYbApJIyYTip9cqMhWsBKc/Gwsz6CUHjoWw2kHmMXiaOKYpOQOqX2wfU
 wl/cGGmIFmm711iarqs+SnHWuwlmI97K3XDEFxtU0e9DpxJgT9LF9cXhB2VauARtqoUAb1+wSbU
 DROWPgnkx+CV/S633slXvkAFFvNCMlMmLuPwEE7lUFuSPX9vLtm9dbbmPUosH9Jdpx/F5VDD4pc
 N3JOM0tUmWORI7N7NU1EX/IKd9Q89Q==
X-Proofpoint-ORIG-GUID: nV3ulFzp-ULSP7NuSb83EgM3_t-44hoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010103

The current MHI runtime PM design is flawed, as the MHI core attempts to
manage power references internally via mhi_queue() and related paths.
This is problematic because the controller drivers do not have the
knowledge of the client PM status due to the broken PM topology. So when
they runtime suspend the controller, the client drivers could no longer
function.

To address this, in the new design, the client drivers reports their own
runtime PM status now and the PM framework makes sure that the parent
(controller driver) and other components up in the chain remain active.
This leverages the standard parent-child PM relationship.

Since MHI creates a mhi_dev device without an associated driver, we
explicitly enable runtime PM on it and mark it with
pm_runtime_no_callbacks() to indicate the PM core that no callbacks
exist for this device. This is only needed for MHI controller, since
the controller driver uses the bus device just like PCI device.

Also Update the MHI core to explicitly manage runtime PM references in
__mhi_device_get_sync() and mhi_device_put() to ensure the controller
does not enter suspend while a client device is active.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/internal.h |  6 +++---
 drivers/bus/mhi/host/main.c     | 28 ++++------------------------
 drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
 3 files changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 61e03298e898e6dd02d2a977cddc4c87b21e3a6c..d6a3168bb3ecc34eab1036c0e74f8d70cf422fed 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -355,9 +355,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	pm_runtime_get(mhi_cntrl->cntrl_dev);
-	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-	pm_runtime_put(mhi_cntrl->cntrl_dev);
+	pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
+	pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
+	pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
 }
 
 /* Register access methods */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1..85a9a5a62a6d3f92b0e9dc35b13fd867db89dd95 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -427,6 +427,8 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 		if (ret)
 			put_device(&mhi_dev->dev);
 	}
+	pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
+	devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
 }
 
 irqreturn_t mhi_irq_handler(int irq_number, void *dev)
@@ -658,12 +660,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			/* notify client */
 			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 
-			if (mhi_chan->dir == DMA_TO_DEVICE) {
+			if (mhi_chan->dir == DMA_TO_DEVICE)
 				atomic_dec(&mhi_cntrl->pending_pkts);
-				/* Release the reference got from mhi_queue() */
-				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-				pm_runtime_put(mhi_cntrl->cntrl_dev);
-			}
 
 			/*
 			 * Recycle the buffer if buffer is pre-allocated,
@@ -1152,12 +1150,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 
 	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
 
-	/* Packet is queued, take a usage ref to exit M3 if necessary
-	 * for host->device buffer, balanced put is done on buffer completion
-	 * for device->host buffer, balanced put is after ringing the DB
-	 */
-	pm_runtime_get(mhi_cntrl->cntrl_dev);
-
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
 
@@ -1167,11 +1159,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE) {
-		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-		pm_runtime_put(mhi_cntrl->cntrl_dev);
-	}
-
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
 	return ret;
@@ -1377,7 +1364,6 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1408,8 +1394,6 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1592,12 +1576,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 	while (tre_ring->rp != tre_ring->wp) {
 		struct mhi_buf_info *buf_info = buf_ring->rp;
 
-		if (mhi_chan->dir == DMA_TO_DEVICE) {
+		if (mhi_chan->dir == DMA_TO_DEVICE)
 			atomic_dec(&mhi_cntrl->pending_pkts);
-			/* Release the reference got from mhi_queue() */
-			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-			pm_runtime_put(mhi_cntrl->cntrl_dev);
-		}
 
 		if (!buf_info->pre_mapped)
 			mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index b4ef115189b505c3450ff0949ad2d09f3ed53386..fd690e8af693109ed8c55248db0ea153f9e69423 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		ret = -EIO;
+		read_unlock_bh(&mhi_cntrl->pm_lock);
 		goto error_mission_mode;
 	}
 
@@ -459,11 +460,9 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 	 */
 	mhi_create_devices(mhi_cntrl);
 
-	read_lock_bh(&mhi_cntrl->pm_lock);
 
 error_mission_mode:
-	mhi_cntrl->wake_put(mhi_cntrl, false);
-	read_unlock_bh(&mhi_cntrl->pm_lock);
+	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
 }
@@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 		read_unlock_bh(&mhi_cntrl->pm_lock);
 		return -EIO;
 	}
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
+	read_lock_bh(&mhi_cntrl->pm_lock);
 	mhi_cntrl->wake_get(mhi_cntrl, true);
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 
 	ret = wait_event_timeout(mhi_cntrl->state_event,
@@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
-		read_lock_bh(&mhi_cntrl->pm_lock);
-		mhi_cntrl->wake_put(mhi_cntrl, false);
-		read_unlock_bh(&mhi_cntrl->pm_lock);
+		mhi_device_put(mhi_cntrl->mhi_dev);
 		return -EIO;
 	}
 
@@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device *mhi_dev)
 
 	mhi_dev->dev_wake--;
 	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
 
 	mhi_cntrl->wake_put(mhi_cntrl, false);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
+	pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
 }
 EXPORT_SYMBOL_GPL(mhi_device_put);
 

-- 
2.34.1

