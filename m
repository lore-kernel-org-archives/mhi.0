Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5A359A8C
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148194; cv=none; b=S7PXZlWMPgf/yQc9ErQjCHKSvsR1jLT532TuEsnT9GxUAtXoNzCsSJQCnifO6hjBrVyPHP5wIaJbAKvEipoS6aWZ1oZiNSg4ny8iaSs6QeyDTpxbDRzltPzasmiFAwz5YKkNplZp9432YMB7qkyO4ZO1c8rqnaX7nTQ6kIvd38s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148194; c=relaxed/simple;
	bh=foKTLroabGy6b8CCElXPQmQli339GG53tjCPvr4Ej10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rVIxExeH+7kK1v20+JNb5+YPRYvGlkJcj6DvkayywMWuWla10Bf7V+BOq4+YnxwXcWYP2Xq5DSLONgyt2Zjl0Z3Br4HLcYbqVNuFH/vjlpFW4G8ny/5Lb6nbJEVtp1OR6LY2fOZaV05DwzZaF/be3mbT2kM6RnjF4wlBv35+3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLzgBBzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQlcTxxw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLzgBBzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQlcTxxw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCSJV280804
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzNjB9Rkj+GRqUidlRL9ZEObQoAw7hf0ixCn2dgcEqw=; b=WLzgBBzbQ2WzF4T5
	ALUuzdEmjZM8rN0iepJI28pMQW+Y/GCtrRMjpD96RjTWZUd//dRDnogErOESZdkJ
	UlsmSTspuJS4o0DeMIO7OHjuPT8Jd+Ymu7s0YdEC01bTY6hzjOCuI/BX5eU2knNw
	NjHPiQFlcOmzZ3cHmJ0gB2Sf/ONK5xJFAK8Jr7QzrHDeN0GTF0ybwgCF/UKTKeoN
	geddZVzCIVxJSIHVg1zCXlY90xGyilGrfyxvkrf3UAgMj9yDxbNZLLhA2uH/rur7
	CM+WWyRTh4DORIWhOyth6Ty36+Cu7XIzssZBee4Q13B/voEwZxMh80cr+pb9KqDp
	T5bCIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vhb3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f37744f01so2552751b3a.3
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 23:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148191; x=1776752991; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzNjB9Rkj+GRqUidlRL9ZEObQoAw7hf0ixCn2dgcEqw=;
        b=ZQlcTxxwBCkqOslXkAB6dpDziz3YsT1yA4gwdfSuqo1YjvEZYassehkEQK/kUrgVN7
         AGO26om3Y7UltSRgML6Ba+U4JfOHD4qCgm9HIiyeN2HI9p/qBK2O+zldeGACue8YKnrB
         Ej18PjBURYo1vksU0z+IIAtLWcqMDRsiWlfGprGmKow68qEWapTmhxrHk9x95XXMeCFp
         5/crjW0bCwEJ9DZ0HQ2BCphIXLPzQRGt6MNVAefXfHTMcq2rbUYCqvhGwrq4mybQbo8e
         QH9RIcZz8G0hS2fflUQicM5hwfdxwbSzCUGduQc7Tu53Bw5QBhaCUUo/OJKVgM7SaVb9
         +IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148191; x=1776752991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gzNjB9Rkj+GRqUidlRL9ZEObQoAw7hf0ixCn2dgcEqw=;
        b=po6l+3VmBVHuDPNCovfsZEpJkgKZNBWMCSUlp15ob+g3QT7KiFZtWjgvwW3IaskRea
         1wZp/a0m+UVnh3S+r+necxNbTddgeUeGq0TJjTmMTq+J4tmWGtEOOTyGWjNbjvMi7b+0
         lGlyW1PCucAa5KqXnBtyb8NHlnpBSMsvATidXsHj2zFHCrdisfpS1VJA/MMNcJ5t+/GR
         yxxMv70JwBmGfdVZe7nxKOW8TzaTcw29LwUrqNAfND0invdWrM/lIkYf9KW/heADmLt1
         2UsVRQdZ6Djrc0lfTQaY/2W9H0PdVNH4MNEwHH+l90y4Y42f6J6EwhCjaySAEYZIAPvF
         MRvg==
X-Gm-Message-State: AOJu0Yzhi2Red7K+0pn6+X7ATxviPaZIlCbOJEBsMiK4MqvFYtU/7gAS
	m2nogVeGpLMsZR34XkltjWAo9O6qll3qGm/MMQwy4DtvGdbWMC4pwYAOldDInsdin+9Ni+tWnKu
	FLgIYneb9BKJSJ/ouo1dcRF30aX4QDhdVr/dQe5u+hQ4ZYZtsZ0OOE54=
X-Gm-Gg: AeBDies9qp3OIbwJO+3xpYLXiSexyYxjxl2YZufeXV/fSCgzvErJRjzcgxg4Rt8dlX8
	jZClK0AAD9dQMLIvNmh1TNeWnQO0UI++Bq0T9oC3CRsmQnok5UupkH8ibhvDNVkyZzdp//tG3sH
	nEge23FexzlSs0bWuvMjk69o0fjLRFuv6pb/Snf9m+cxhOIsJJ3UzFZS1wEm3s0QZptu0XYT7QN
	SgTKj5cS2qrF8kTaUtflGAoMSa/qeT9R6uEjLrjuFGbyU75iRIH12eVvT3ZRY0DUNSxAKU7Wk9m
	mSIbeepoSwkVx+GVY66n1+620b3nWnOD6af3E2xuaRT8JtXn12eP7JTR0Ye95VAOf1JEhYyaCNr
	D/OIO1WqsC05xQLiFgO5HdOWIG7dlWxQERbE478rRpvEAt62SH+lTU3wpjw==
X-Received: by 2002:a05:6a00:4197:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82f0c2c9dbdmr16870819b3a.43.1776148190882;
        Mon, 13 Apr 2026 23:29:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4197:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82f0c2c9dbdmr16870786b3a.43.1776148190247;
        Mon, 13 Apr 2026 23:29:50 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d40bsm12964090b3a.58.2026.04.13.23.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:29:49 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:59:40 +0530
Subject: [PATCH v2 1/2] bus: mhi: ep: Fix potential deadlock in
 mhi_ep_reset_worker()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-reset_worker_deadlock-v2-1-42fd682b45db@oss.qualcomm.com>
References: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
In-Reply-To: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776148182; l=1704;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=foKTLroabGy6b8CCElXPQmQli339GG53tjCPvr4Ej10=;
 b=r0sWw9l9IluRseJbGPqzo1H6NqPgrwBXZF6/Q14lBlbqLvSkLzvcLWp4qvhLlw+PsGP6ho1Ym
 zuTEQTxPbNsCKEOVOawJc9mzw42JDjiBp/s6zJ+3zgVKP8q6zBmpc3j
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: 6JjUwak7-bA564ZISaGsRC3zlfh15u7u
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69dddee0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bDPEW0BwyBpd79SF-D0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6JjUwak7-bA564ZISaGsRC3zlfh15u7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX2J64nEWFH8ec
 3ORlGcAtLxGq7XHuEg9Y/QEFZxnlCSfSCI90OBh6imvmaPkwuLelIU/24YuQSmDz+eL+teucnVc
 zVEIzCKsdVXega5m+CfAOVqGc4zR7EAh/W6G2f5ogEv+PVslVmL4D+ljLivmPERdbIJqvH2zFac
 X/H57KozeUYZ7FmBiJ1H17RBF07QcO1Cy6vkrtHNxdAlDc/A1zsp3dp3J35qZdF3nOy67Y9S2mq
 nqC9ia4JCHk6v7dkJa9CtZ0WMtuWwgtjaFwSlnQsgcq54R48R/HC1qmyv1K09HmoWihzz9cfXXo
 GVL6xIGfCUmPedC8/lkFkqvPKcaTuVQ4KSwIuF0x2flLP9dkQMS7utxprJcYX5Ae4BwF/SnmKHJ
 TGPWalPFG5nq3s1tfBB2PZzDzIP1D4C6kDVgyR9WKmybEamF5oyB/Qz6/dIfetwYGQBy9q1rlh3
 s/ut2qyNMPKWY7SijvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140058

There is a potential deadlock scenario in mhi_ep_reset_worker() where
the state_lock mutex is acquired twice in the same call chain:

mhi_ep_reset_worker()
  mutex_lock(&mhi_cntrl->state_lock)
    mhi_ep_power_up()
      mhi_ep_set_ready_state()
        mutex_lock(&mhi_cntrl->state_lock)  <- Deadlock

Fix this by releasing the state_lock before calling mhi_ep_power_up().
The lock is only needed to protect current MHI state read operation. The
lock can be safely released before proceeding with the power up sequence.

Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdea24e9291959ae0a92487c1b9698dc8164d2f1..4bb007d1933315e5b0b40d235248d5373548d3f4 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1087,11 +1087,12 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 
 	mhi_ep_power_down(mhi_cntrl);
 
-	mutex_lock(&mhi_cntrl->state_lock);
-
 	/* Reset MMIO to signal host that the MHI_RESET is completed in endpoint */
 	mhi_ep_mmio_reset(mhi_cntrl);
+
+	mutex_lock(&mhi_cntrl->state_lock);
 	cur_state = mhi_cntrl->mhi_state;
+	mutex_unlock(&mhi_cntrl->state_lock);
 
 	/*
 	 * Only proceed further if the reset is due to SYS_ERR. The host will
@@ -1100,8 +1101,6 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	 */
 	if (cur_state == MHI_STATE_SYS_ERR)
 		mhi_ep_power_up(mhi_cntrl);
-
-	mutex_unlock(&mhi_cntrl->state_lock);
 }
 
 /*

-- 
2.34.1

