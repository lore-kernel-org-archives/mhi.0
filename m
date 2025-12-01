Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9430DD18
	for <mhi@lists.linux.dev>; Mon,  1 Dec 2025 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593017; cv=none; b=DnwhqoWi0EsOJNl4kPWUEiFtlUGw+psTX4UKIpLlZDxxcWX1LJOK8Lf+/mZTgK0K++yvkOw49xwKMfjosvWVZ9JMPaeN+sOvMuW1zu6cLHZgber3fvw27ronDXzeYXB8y6hwVDExCmZQzq9qwDQALO6fX2XHkxI9Mn6al0m2d+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593017; c=relaxed/simple;
	bh=O1bfb49f81nWjSwl16Z6OQyKyPquLUwL1wCzDbmKlZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nUS2E65y/OLdWCBCRckK9h6gFXsc9cbUYu+KE5GO3yamNNaVdzPaXdcvoUXn+XAt6H2z82xPNbhvB3343+G3Enpg0FP3Thg7nGtJkO/PEELwtQZqByWN82hjn/Rwd32kqngx1Mcyr3qDEVcvNRkRFLezgwlQv53Xqj96bMP8Agk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmGcLuQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzayjjRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmGcLuQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzayjjRj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18geVi3433322
	for <mhi@lists.linux.dev>; Mon, 1 Dec 2025 12:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=; b=jmGcLuQjx1kSOQH8
	znVK1DJ4FY7Ci3owB8HJ6D2/pr8V281Yz1rCRbBrV2Wwk8ACe/Dc0ecc1XTa/yfQ
	qym6y+ByyrSi6k26VkLVYCp5FiHut7QKKR/Gi8xqmnubfwpuX86qUuoaZbhrS6t+
	+qmG6VfiIMvR8cFDX2EN6GSLIut0wO105sE12uxhad+lQKSRQABpBYPb4ZFa0GlT
	C4tFosIk3SsU7ljWUXllkYcKmvpSUd6CXq476tsEg2z0hsY2IjTSYmalJD+VllcX
	EpExd0XSH8AJzeKCvRP07ilxzjB7XGfYlwxcJXvTVLApdMUx2hXnrlDp0fazZyuP
	LCSW0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re0nk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 12:43:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso7587430a91.1
        for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 04:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593013; x=1765197813; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=;
        b=hzayjjRjkbxAWHZLDw+W/PuC7FgXmM3jpxsJEUfV7TJrK0k5+IQRiIdCi+3eKFnRtS
         K2BLR5pYoyh9pC1mQBDVe+s8sprA0qNn09n0ipwdwm5m/+FzDzypadsvykeCamQq4c9O
         tMxIcwRHpoPw7S56JUOUXR9azdmjqsKQhCYmHZ/3Oi0+qSLuDWVbcmSWOiJqpHorL8wH
         IQAApojEYfMrajqNg4cpyUYhEopFnl6kb8MGK1KaDRpenBj176SeVrRHV5mtiR7gGY4C
         IcJdTyQB6Ryoh6oaDUU1Cwn60S4gu7jOd8WdEM+c42tJPW5WpGqpcSStFv1m9zsnRPRM
         Ga0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593013; x=1765197813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=;
        b=V4qnevSkJT4558qGqhqMvh+9yBFUw92gFd9dPkoQVJPuEdX1wJo4LOb5emiUcJjgiA
         HkKWdiJjxHgRgOX4OoW/43ceROmiV7S/W+iHX0rr2FFEzzxT7pZfPV0cBWnCT2OPDVOJ
         eEEaTaIU1ALP8IGNyRs+ojTYUGAtB0kaSlhw/ycrM65IpKu2uYju+2VgLUQz2EP07WE/
         Ba6thgtpAClGwa/wbhtgjZuXdUiQUj4CflsZHr3TUqt+2eDqqfjrSz2Et7na6Bc6Ct8J
         i/pv8NHTKj49VTrZlASAMn9xEMU/b0gSHb9ILq8UpdfLC42OpCWENm/vur9Z8IiirTfA
         qOFA==
X-Gm-Message-State: AOJu0YzKowWHZK715dMQ1C296vy1MHJimDC/E7m/Jyk1nxiblW1cfVA+
	gJE55Eit+xQW2K4SCRyozJGpyczGO+UMMf03zCZZEuOezTcSxNFmeVp+BZa66EM1eb0jk9pj7ON
	ywX8MLF/FRYMVq6INcAUny1k0CFx42or8oB6HGoFo3JKtH7Zo1lHM47Q=
X-Gm-Gg: ASbGncuQjg+68w5cypT6TYZMEKHQa1msEzTPw/nCnJaETgjcv3BzrbLfLBHJkCSkafw
	EVTbinQr0sOhNF/BXpVWPYIVOBgrBC4hSx7V9s6AfLsIas8oo6AcZpfUxBu+AczsHa6hVaBOGT4
	pOf4M6kayVYmkuZ+jgLmGIVzchX9WkEXO62Jvj2wmiHgzSh+9twcwTYYVD26ZiUctZvv3Nxp+gP
	xoCiBekqR8QIchAoAE9hl2sYc1CgPWNyNXsRx6KkABPUv0Nli1HbIqHpKC2ebuwXUew9kqs91UX
	jlrcLPT3Hef5IIsJCDpGkL5egPH5qbhAmpmrGA8cZ/e71yWCYNlOvhMdFNdhj5VV8WWuOys5WCr
	tvFWxELVV8H5uUh8aMouHHFrSX5jJLjBvtPCy1ZLTHiEk
X-Received: by 2002:a17:90b:57cf:b0:340:5c27:a096 with SMTP id 98e67ed59e1d1-34733e55262mr35347988a91.6.1764593013359;
        Mon, 01 Dec 2025 04:43:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElgDjDJHW2YDf+PAwc9iRI3ntCUsGwfUffpxrfbB3ePkiBM/khpNTD20UCrGFmP3x4X6p7TA==
X-Received: by 2002:a17:90b:57cf:b0:340:5c27:a096 with SMTP id 98e67ed59e1d1-34733e55262mr35347954a91.6.1764593012680;
        Mon, 01 Dec 2025 04:43:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:17 +0530
Subject: [PATCH 1/4] bus: mhi: Replace controller runtime_get/put callbacks
 with direct PM runtime APIs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-1-fab94399ca75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=4834;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=O1bfb49f81nWjSwl16Z6OQyKyPquLUwL1wCzDbmKlZQ=;
 b=yLM+3VZeO3i0vzTYNib15uacoRstISgcmAjNZBsE2uImwB5USfI0sbF6aT/yYbSsn9pqrY/4E
 WgFlDNvcU6+DI+bVnaoIPTkVXI/EG9ShgxobuhrFdniiGsg71jFlRYz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: z9V2dIW0UqGerPS2hXYkl4MWR51F65hw
X-Proofpoint-ORIG-GUID: z9V2dIW0UqGerPS2hXYkl4MWR51F65hw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX6T6lA3S/6sZM
 2b1iEZPAkrpAYRbrJ20YUMolfR7CCc4bC9uhP+h4Q8kPpRJe8qNC7U5FV5X/eR3E2ezHAGXSXYo
 +hXcm2F9x2IJQb6wftBytPldSR6QhhTV2htjLdYYBirSA8HUQ1ERw0ufR/y+7pm/tXQLDFhMC2u
 LFcjDH5i5Xy9/Yxzdm1gmxSlN6iYkATFFWI2KtcG9yYCHc/aJoPnRT0XjCwrtnslcxIlV0w/WmF
 qM2us4VJdF2kTDeRcsPXOrgQHALxOiMDT8cY5t9GSwhZU3qg+m4zaJy1tf5JzHDcyXhLsG5iPnO
 ih3nEk+g/RhrCE/BDwoyuKDnZkktL9qm/bGIGf5GFl8kOySAMmipD8HMuQXkFC9iva1Z4mMveCp
 DUSC+66acaJRz53TKBrA/Wg+WsmrPQ==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692d8d76 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-vyvwYMTLgQEoxk1dJgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103

Replace usage of runtime_get() and runtime_put() function pointers in
the MHI core with direct calls to the pm_runtime APIs. As the controller
drivers were not doing more than calling the PM runtime APIs in these
callbacks.

This refactoring simplifies the runtime PM handling and removes the need
for drivers to provide no-op or duplicate implementations of these ops.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     |  1 -
 drivers/bus/mhi/host/internal.h |  7 +++++--
 drivers/bus/mhi/host/main.c     | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd190078af4ca12cd7a1de739572feca9d..5b22808fd543f9febcaa9ea623101d2d5d05b040 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -938,7 +938,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	int ret, i;
 
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
-	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
 	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
 	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7937bb1f742ca8033c17a01f5cffbf103330f51f..61e03298e898e6dd02d2a977cddc4c87b21e3a6c 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,6 +7,8 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
+#include <linux/pm_runtime.h>
+
 #include "../common.h"
 
 extern const struct bus_type mhi_bus_type;
@@ -353,8 +355,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
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
index 8615512743199a59a58c3756d9cc3407079cee7e..7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1 100644
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
 
 			/*
@@ -1155,7 +1156,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	 * for host->device buffer, balanced put is done on buffer completion
 	 * for device->host buffer, balanced put is after ringing the DB
 	 */
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1166,8 +1167,10 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE)
-		mhi_cntrl->runtime_put(mhi_cntrl);
+	if (dir == DMA_FROM_DEVICE) {
+		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+		pm_runtime_put(mhi_cntrl->cntrl_dev);
+	}
 
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1374,7 +1377,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1405,7 +1408,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1591,7 +1595,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
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

