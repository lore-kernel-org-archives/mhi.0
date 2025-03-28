Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3212AEED
	for <mhi@lists.linux.dev>; Fri, 28 Mar 2025 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743179742; cv=none; b=hfco+u1MYodeJJ1P+sNafFyxF2pAOk8jkWTZwOpJoIdkDygjKLodJAiDlOACKGqs/EdW9nzFVnbUUY8IEcXjdq8MnewGuQ4pnxK3s6M8m/FQZt6VSoHkGUg2rt29LAIedKZEU/cN5Vt7EgSWV/+Jcu1QeelqO8eOn0mja0PAOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743179742; c=relaxed/simple;
	bh=HRjsSgTq5W/9KDRw6tCiSSZcem1vOE2VhOdBd3nbUTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SOp7gg8B/JXUC4UJgEMKgozYQpQ5Scv7Aljyiud4bAnUbtcCdMmzx8KluX/PM0Lc4sFceaYhHcH6E4QoTCsyuobN/p2MZCMU1vHyo0+a3BpjfChMbJLDwwPhWJvzz8tgddmp+q2osQS309027kMSs0YVGKT4joCo1r8XvOkSO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7HP4n/h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7HP4n/h"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SE2Wmi010915
	for <mhi@lists.linux.dev>; Fri, 28 Mar 2025 16:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f5uBqZqHWsZAkyJQgUXt65TcEJ15BS2eWtk
	mBtYGP/8=; b=h7HP4n/hMWuxMd+Diht2lZfkTMVTowvhUc9o6oDI7q3nH9zTRpy
	I/Hcyp0hjY6z4AHGr/PoVBMIeYbB7T+azisk7BWKBo5cvKQsvDREAYHo+XV3YbrF
	kkoXgDkz7Nf4x87YZq5wlnLZKMSF50cwECyS/7omtB9wO7L+zmOpwhavZERDfVOR
	WlwrvQjL5bFU6YCL+pHn7bK0GQo5b74FLDCkO4z+jL9tacKtgw/lmv5zvqmV6QxP
	4nW4pls9/FDU2e2CVRGgVOC3AO0ctzUqnJaPRQmDmYAQ+pU3FwNyl3EbuqbYs5I9
	yeeArib1p6cR09CWnz3Xx8YdVIJN8SoNNxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqnbxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 28 Mar 2025 16:35:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2241e7e3addso39086935ad.1
        for <mhi@lists.linux.dev>; Fri, 28 Mar 2025 09:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743179731; x=1743784531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5uBqZqHWsZAkyJQgUXt65TcEJ15BS2eWtkmBtYGP/8=;
        b=Bmiesn4XdyRY9uAssl21KFxol6FAft7x5eHJqwvsyDsogStPTOGYEO9Vcdht0fDwQi
         VoV8OiSl7WpW7G22ALQ0SV0SpbhUlImdjdeGTpI3p/ridXtvJ3FJXYSZiBGhcZ+v2Woe
         T1U6+QhlDSddE+lL02kF8W4ROqa6Lq1CV/xTll3ENijXJSxOd1WjqenUJ9mp6Tk1bn5g
         WWFk+nwawWDgvIqCPBD5mBXnGDTlJLWS9HcTv1I3la5Jil8BdFJl/dd0LQ4gTkznMSu9
         heWImMijsfIUlJtD9xFtDh3aNML3ODreTgGkNE6qTF+nrVtFfhgdsVMaO6bvpCRx1S15
         5Qig==
X-Gm-Message-State: AOJu0Yx5j3Y57FX88CHXRmuV+ofxMLXflI3bcAo9cixOfMl32GpgjIRk
	3/D2iFAFuj5KFnXWvgwds2pIcmcZ2NkNXPsiwl6gYBE1MVlnoPbcWMUsDWkq40bf3hn77UTx5MC
	/yMkylCxA94290XNzCUGg3dUN9B/M84lDtwl7Ce9sYeDCBmVLc/E=
X-Gm-Gg: ASbGncvpMKNbGPxkfTTgQtmowyi/R/2xg82P6xvWVoazse/G5w9GrAgGiZFlEF1mmbL
	k66ElnsD2RV7VP0zzBv/mkNclmixP9sMOqRpLMFAOHQxUFtmDT8qCuSCxT/e3sQS5SrCsRaPLJB
	2N2ET+bTV51WiDKb0jNh2MkBYGJ8TMmbNw8QBUQ+aGd7uijkDVYgW1MImT2mPTFHPPGgsbsbw9m
	koLxkeXlJdV2gINrvUYOtAieQah2OCSCb0XZfRTbSId3PZBjib+8ulVmQBLTfvYDxbNsETlaVDm
	5xAMYHinW4paB89bB6Zhh/m/NGAVcYwA5Heg7RbNeraafUizTXOfcKXkgLo2HjTu
X-Received: by 2002:a17:903:32c6:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-228048778b5mr120223355ad.21.1743179730935;
        Fri, 28 Mar 2025 09:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsadb1ZkmyuGZ6xkHYTmklTe/SlrpLu7GSX8XMOMFtakAIkec6H9aZWbz98gqp3YvO8l2gnw==
X-Received: by 2002:a17:903:32c6:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-228048778b5mr120222915ad.21.1743179730359;
        Fri, 28 Mar 2025 09:35:30 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dee06sm20276215ad.179.2025.03.28.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 09:35:29 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH v3] bus: mhi: host: Address conflict between power_up and syserr
Date: Fri, 28 Mar 2025 10:35:26 -0600
Message-Id: <20250328163526.3365497-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZJWct643UKCyN0Pxp2kQWgQBQ4jEj8DD
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e6cfdb cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-JrBQj99mACPpmNC3zgA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZJWct643UKCyN0Pxp2kQWgQBQ4jEj8DD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280115

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

It is unknown when this issue was introduced. It was first observed with
commit bce3f770684c ("bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state") but
that commit does not appear to introduce the issue per code inspection.
This issue is suspected to trace back to the introduction of MHI, but the
relevant code paths have drastically changed since then. Therefore, do
not identify a specific commit in a Fixes tag as confidence is low that
such a commit would be correctly identified.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
---

v3:
-Fix the moved comment due to misunderstanding the initial feedback

v2:
-Move comment to reset_device condition
-Rename cur_statemachine_state to cur_state
-Amend commit text to explain the lack of a Fixes:

 drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 11c0e751f223..e567a356f136 100644
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
 	if (MHI_REG_ACCESS_VALID(prev_state)) {
+		/*
+		 * If the device is in PBL or SBL, it will only respond to
+		 * RESET if the device is in SYSERR state.  SYSERR might
+		 * already be cleared at this point.
+		 */
+		enum mhi_state cur_state = mhi_get_mhi_state(mhi_cntrl);
+		enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
+
+		if (cur_state == MHI_STATE_SYS_ERR)
+			reset_device = true;
+		else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
+			reset_device = true;
+	}
+
+	/* Trigger MHI RESET so that the device will not access host memory */
+	if (reset_device) {
 		u32 in_reset = -1;
 		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
 
-- 
2.34.1

