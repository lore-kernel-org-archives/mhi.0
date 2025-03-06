Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC8925D200
	for <mhi@lists.linux.dev>; Thu,  6 Mar 2025 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282372; cv=none; b=PA1dkt3hph3Mo/D0SCRBSng3pEyxN4IfF+Atz5hH2ul38cH3FLEE31vmhN/30YOBb8xrsVqbstDCnF0c/2/ZTy3VfMc8da9d8eFkP1a17+Nzva02Ox0CCwfzrIC1IgtKZeJWjp+BEDrDZ4FXrqItmTubssevsElMGveZqwX/Iqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282372; c=relaxed/simple;
	bh=TQmmxt3BhKz1ClzdmQVOgnjvBkiCkUoEKUecGH8iwj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=juB1ZtaNMZQzoF/q9ffd92CECYmnfYYjcbcbh7fDDN3UkvpVUjbguwauUlEU7/H07eqsfw/He1KNwCzZuQq/p9KfDmeRIZjlCMXke4ypVRJYNrIEBLvRgAbodVnbXFUYXafh1DJW6Jx11JLQ1nwbCHciQS9h5EcYxAUHCNlEGZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9PGGPxN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9PGGPxN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526GXFDv028476
	for <mhi@lists.linux.dev>; Thu, 6 Mar 2025 17:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e8eLbo4qIXQo6XAKHfD0GQUAXjTBeExeHTq
	iZHi7ib4=; b=W9PGGPxN1dVElcnWMTWmM4TvUK79qJVwYZWgTFvHiwOgsXun6hp
	bg1/2qlAaZd5VpJyt93Z9R816+fv3pOgj3u1iXo4eW5IIyCw/VCTyObQJBY+GsXS
	rxM7VoyLHZl6slTPMIXCJUuehxUFans+2hsY/y5RIlFjBS3FnUaQrmqnRQw+wygL
	ePoFqU3vnksMi4+IgWA99kQ+GKqbx89fP6YacHaa6hQPziD/YSl2Oyx+R5BBbcEW
	t12Zsezj16mKBsaxOPLMgZnelYq46rYTIEx4XZmBs2eesSmzaPq+dqUpLodajoK1
	IuCYZ2mxXBJIltJLVclPqrhkqMahihpviVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rphr7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 06 Mar 2025 17:32:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff6167e9ccso2638815a91.1
        for <mhi@lists.linux.dev>; Thu, 06 Mar 2025 09:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282350; x=1741887150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8eLbo4qIXQo6XAKHfD0GQUAXjTBeExeHTqiZHi7ib4=;
        b=gPMxMk6xSo0RbPNZUq1xMxgIUEreIQcHa7q3tUkW3RDwQZhjdcuyHB9blDw/6fDfiS
         F7/ZFtR2lT5Kozg538+bOwJLJh0F4FSinYg2Ik1NXpbLxd8ECa0m6srPot3jk5/i3PDs
         avwQCz/0pvXnl0zM4nQhvU36lLA9cRXKgZYO+lE0ADSKiOa85Vo+bPu38fqiEnMejaiZ
         /yzegIqQx+60k+OhSNqadABF75Sne30n139n2mDtV1VlvsG0dEvQjfTAf7/2d/PUhh32
         csskXLFzI6Ao/kds7M2VeIsQzBvJB+RKJnsofa5uQ+MKWKoy5eCJG3jvuzy9tCGKMGWa
         gR2g==
X-Gm-Message-State: AOJu0YyD8DX39kakiLoOi2Ct3lq6A6MpmwfnKmwhUYnTGHa7HVtB0LIL
	ZMQFOCXHE3JoKQ/AurUQ16HsvVlmKBpLbZqr0mfzVNnADwm9TdhxMwH6+J0j8Pfjg1JEY/xTgJC
	KRyIsz8OVuO7fzYS6aB/QiUfZcsUj7tD0qPb0WRFHchhmjOoLRv0=
X-Gm-Gg: ASbGncvHXr53JaP5xqQxJqGKTXm+wtZtW/2r4YvW0Q5hVfBei6DwfBmOxE+Ksky4CFQ
	womP4TyjllCkUQQLsQsnZTBwZQxdhPzvlZcVM2ZBM7k2EO3W2ad/QlFR0f/kwotqjRSUF4q1CK6
	TrbmCY3mF1UPq28sxzwVTt8rX2uQ5zWNlAKeuHhx0iw2z5OKfznqg9PY1+w0pZuhdjBSGt2TN/U
	QPLkwwSA9cr7CS8k3CiIOm1v5hIVRniXITNx0N59YTWpybuf/M7QGaeO1VKXUZn2H/+24cfdQeL
	9GcB8JwqA+rOV5BzAs70bPa5/C9mu5A897EpTzXXam5qvD1VeF0TUhyzEiVuaAZR
X-Received: by 2002:a05:6a20:4387:b0:1f0:e8f0:3a7b with SMTP id adf61e73a8af0-1f544c6037amr585398637.29.1741282349875;
        Thu, 06 Mar 2025 09:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzLszYvVhadrUE/9Ua13XLerozHpfmwjVxleGEkFUULcpMGA5M165cwJazMI9UkeZsuNJezA==
X-Received: by 2002:a05:6a20:4387:b0:1f0:e8f0:3a7b with SMTP id adf61e73a8af0-1f544c6037amr585351637.29.1741282349494;
        Thu, 06 Mar 2025 09:32:29 -0800 (PST)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af28109a4b4sm1507546a12.32.2025.03.06.09.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:32:29 -0800 (PST)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] bus: mhi: host: Address conflict between power_up and syserr
Date: Thu,  6 Mar 2025 10:32:26 -0700
Message-Id: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c9dc41 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LMpmeOApDP6YMBtz5LkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UIJ0_NLrFYPETgF4IRKRCIo8eXBMAAN8
X-Proofpoint-GUID: UIJ0_NLrFYPETgF4IRKRCIo8eXBMAAN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060134

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

mhi_async_power_up() enables IRQs, at which point we can receive a syserr
notification from the device.  The syserr notification queues a work item
that cannot execute until the pm_mutex is released.

If we receive a syserr notification at the right time during
mhi_async_power_up(), we will fail to initialize the device.

The syserr work item will be pending.  If mhi_async_power_up() detects the
syserr, it will handle it.  If the device is in PBL, then the PBL state
transition event will be queued, resulting in a work item after the
pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
the syserr work item can run.  It will blindly attempt to reset the MHI
state machine, which is the recovery action for syserr.  PBL/SBL are not
interrupt driven and will ignore the MHI Reset unless syserr is actively
advertised.  This will cause the syserr work item to timeout waiting for
Reset to be cleared, and will leave the host state in syserr processing.
The PBL transition work item will then run, and immediately fail because
syserr processing is not a valid state for PBL transition.

This leaves the device uninitialized.

This issue has a fairly unique signature in the kernel log:

[  909.803598] mhi mhi3: Requested to power ON
[  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
[  909.803945] mhi mhi3: Power on setup success
[  911.808444] mhi mhi3: Device failed to exit MHI Reset state
[  911.808448] mhi mhi3: Device MHI is not in valid state

We cannot remove the syserr handling from mhi_async_power_up() because the
device may be in the syserr state, but we missed the notification as the
irq was fired before irqs were enabled.  We also can't queue the syserr
work item from mhi_async_power_up() if syserr is detected because that may
result in a duplicate work item, and cause the same issue since the
duplicate item will blindly issue MHI Reset even if syserr is no longer
active.

Instead, add a check in the syserr work item to make sure that the device
is in the syserr state if the device is in the PBL or SBL EEs.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 11c0e751f223..3dff0f932726 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	struct mhi_cmd *mhi_cmd;
 	struct mhi_event_ctxt *er_ctxt;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	bool reset_device = false;
 	int ret, i;
 
 	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
@@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	/* Wake up threads waiting for state transition */
 	wake_up_all(&mhi_cntrl->state_event);
 
-	/* Trigger MHI RESET so that the device will not access host memory */
+	/*
+	 * Trigger MHI RESET so that the device will not access host memory.
+	 * If the device is in PBL or SBL, it will only respond to RESET if
+	 * the device is in SYSERR state.  SYSERR might already be cleared
+	 * at this point.
+	 */
 	if (MHI_REG_ACCESS_VALID(prev_state)) {
+		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);
+		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
+
+		if (cur_statemachine_state == MHI_STATE_SYS_ERR)
+			reset_device = true;
+		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
+			reset_device = true;
+	}
+
+	if (reset_device) {
 		u32 in_reset = -1;
 		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
 
-- 
2.34.1

