Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C97F62F
	for <mhi@lists.linux.dev>; Wed, 10 May 2023 06:04:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A5L3uO020961;
	Wed, 10 May 2023 06:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=8R/ZiSa25searnd3hQfxzgFzSZNeg7uDAvgVDMXzUjo=;
 b=aNEp0/VXjsEtvxQqwFEtwIxDxmuLBk1wp+FHH6TGCHxmUs+8vM9WhHZVfulaT+mi148v
 vmtfjy06RlI+JL7tLbap3fXJhThlNB20LN8eAK2+pmE2Xks5JZkd5gV089GT4eB7TcB4
 rBELP1bstdkQTUcLBdDfeU07mRY4vSpThrNAyKlaUYv9zHI+OfrnnouKOOaguM+xbRo5
 whJ+2yIBW1z9sFPVb68ZQ1+D+UU67PRnxz7TbrxUz1b1vLXzJCrJIgAyqN3UB7oUc52s
 gvI2G9OxnCjvVsmik5pQDDCwloS5jYQw+ekuDxiU6s6Y0mIrTR4nY/PQGgzdsQVhDg2k CQ== 
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfsxj986d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 06:04:41 +0000
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34A64cVK003710;
	Wed, 10 May 2023 06:04:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTP id 3qdfyktmgv-1;
	Wed, 10 May 2023 06:04:38 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A64clq003705;
	Wed, 10 May 2023 06:04:38 GMT
Received: from cbsp-sh-gv.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTP id 34A64cTT003704;
	Wed, 10 May 2023 06:04:38 +0000
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 4098150)
	id 3C077450B; Wed, 10 May 2023 14:04:37 +0800 (CST)
From: Qiang Yu <quic_qianyu@quicinc.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_mrana@quicinc.com, Qiang Yu <quic_qianyu@quicinc.com>
Subject: [PATCH] bus: mhi: host: Skip MHI reset if device is in RDDM
Date: Wed, 10 May 2023 14:04:35 +0800
Message-Id: <1683698675-33315-1-git-send-email-quic_qianyu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y_8XSJLNd3p4gaLfaVLZyj_fn65C3EI1
X-Proofpoint-GUID: y_8XSJLNd3p4gaLfaVLZyj_fn65C3EI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_03,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100047
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

In RDDM EE, device can not process MHI reset
issued by host. In case of MHI power off, host
is issuing MHI reset and polls for it to get
cleared until it times out. Since this timeout
can not be avoided in case of RDDM, skip the
MHI reset in this scenarios.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
---
 drivers/bus/mhi/host/pm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 0834590..8a4362d 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -470,6 +470,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 
 	/* Trigger MHI RESET so that the device will not access host memory */
 	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
+		/* Skip MHI RESET if in RDDM state */
+		if (mhi_cntrl->rddm_image && mhi_get_exec_env(mhi_cntrl) == MHI_EE_RDDM)
+			goto skip_mhi_reset;
+
 		dev_dbg(dev, "Triggering MHI Reset in device\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 
@@ -495,6 +499,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 		}
 	}
 
+skip_mhi_reset:
 	dev_dbg(dev,
 		 "Waiting for all pending event ring processing to complete\n");
 	mhi_event = mhi_cntrl->mhi_event;
-- 
2.7.4

