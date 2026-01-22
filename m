Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB993BFE4F
	for <mhi@lists.linux.dev>; Thu, 22 Jan 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072038; cv=none; b=pfJajGuZsBlpQZSdkYEusAsozvjE6OzbWXZ303uWKRnwNMgoJCGFuaMda01K5biR9orfKCJAiXEKUCic0geo6+eFuuZ4x32DF1w7+FulTCSSUg3UGxzEhzTBIabzn0nFSKECvd73jED/XYloxPq0w4uQFU2emO6a07/9UyaCdHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072038; c=relaxed/simple;
	bh=fEYCB1OmXJHFLfozOgMIdwRQktFqsVtb3nHoMKfmXLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LHfPZf10TZeJxnFi1Bcu2ZKdsgTNJ+LeP2EUU6/CGogA1H80ggyOmmbaJNSIDEDqTNMqQWbZ2Pg9K9H9VLqrT0WLhxqckTCm2MbAOSID89V5epBxbFdt2dKwjXebCSOxCmOuGuvWpsXhZJwLnaqbwtQHqVG7smnZ5NN/r7XdKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxKj32V0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9zrAPk1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxKj32V0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9zrAPk1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M02hnR3463169
	for <mhi@lists.linux.dev>; Thu, 22 Jan 2026 08:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=92J8WnSaQyl7D9plb8idv8
	AXwTqatCyT3Ld0iG7JRRo=; b=fxKj32V0jHc4S9sy+tFsyCXGiG9ssv56htCPpE
	GJTBTJROdDKx9lzXW3bDzagPxOq0yvhvkPuAqoOWzXwYW7FnjTCKB6bz/yacbqZ0
	9QLvNQi/+anmsBJg4B3kbupHCH9v2pWy7XWYWmlaCxmIAG0jpNweT4iWWid0hL4H
	0L8ytUNVu3xdVpDqIbcyU0QVpD6XwahG4k6HuTz5bTSZyu7H/sVmqYTJNRaSPaLg
	4uOsIb+xfj0mzlVKtGPxt1T5qeyeL+WFCG9eWM5PZI5A6qBG9TbZSkIqtBEzd15h
	fOUL/VYEIvFJSaM/h/hvhwy6Q2OA6QUpjptErSr0IarTDWtA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu06535g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 22 Jan 2026 08:53:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339e20b66so1026327c88.0
        for <mhi@lists.linux.dev>; Thu, 22 Jan 2026 00:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769072035; x=1769676835; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=92J8WnSaQyl7D9plb8idv8AXwTqatCyT3Ld0iG7JRRo=;
        b=T9zrAPk1RnAiks5eK/SYocq2huzFHUnSJvmBzTzcIqC2NaqpGknubar1+LjYgCKu+q
         3FBNyKB7FU+A95cFtvf4ZrLT7yvgLvMTEEa8FTas902b9bFkhYTpOJUGP65BlsYBPcKa
         itO69YZLUtNpe+s63RBGmJqiuPqfsUZN5hySCn3cH13bTXWBEGY8R8KUIaw5k1m/BPOQ
         O8q1batJSVnq6r2LnWgs8ehMYtajpbm3q6xs6yNWD6U7Og/T+P6au1WS35GvmIR7dMLA
         gB/3jJYE9l/ZJcEe3CRPpgApPSjmtIjEz4KtRtGOm6c6PkhCfSNjSgJ9B759ldmyP6Y1
         GmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072035; x=1769676835;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92J8WnSaQyl7D9plb8idv8AXwTqatCyT3Ld0iG7JRRo=;
        b=aHAlOEuwFq28Y6/UGvv9IpDxSmNKQEosomPCQYkhFPOJozes7jQaXGCOT1iLUV8ENH
         1DNRA6wVQ3mWj7jC0CSXJLCNKjf/jAzVzwC51ERubsGI+HsLNzLXnfZwr0COmMOtQ593
         n8wpoS7YEpdp9cgSVWJmy+tJ6by4ZQ8tC+o1D1Lk3Wu5XGAcfFQOQZL05BPqc/t98RmM
         H++DCl1Rt6Gruuem9c6Ml/sIDyD1Xp+teoDDHhypr1uDjEDGJusevriIBAfEROUQ3NrA
         iKcsd95IFAlxnwnkUiKhRSRIW5D3epxpYLfaag53PWEXYDZsoyURnU2gYJDvuvBzuwyx
         lGIw==
X-Gm-Message-State: AOJu0YwABj+Zk5Rz/YposzRDNBTojxh9a+4UzbQKm9izYCedeHvENVgx
	IhCs6yUaFZn5E/OJJxzNFY9cu45PmFfGjbMb1SuhKQnwIgr/Hg5Lk8s312ysYJNHpKl22GURu6u
	AzmfVanKsMiFz3msrVXmBPvuctmAz+7sjw7mrVPxoYF4gAsw8EMo0CoM=
X-Gm-Gg: AZuq6aKgLLtFOw3GlFcbRFIDApm/q/fIC8unCmjgy52HxQbE9Wc+JynZB645AVZRXa/
	a6Pls+CqxDBlYMAPhRLeWFlaYPnbJTdzpBYOM5ELGwl06X2J+BPJUQ3rJJRB6euQdIP8HyA3om8
	0hFkHcz51MlA2xaLLc8IomROhwNwBJDxhUV37Q62bpogcwUpNt8rQoakFEAJGCSfGIjB7z1rjhY
	3kT3zR69Gfg1ebxqvoZ4VXrWm5hRbppH6Kon28nteplLSvBhMQvcB5MrcfcVudHw0FS2cIIXSgf
	cPeNpxos8WEsVAxwF5q2qrLO2LKKkdpQ7nGl1i5fbTvJD3u/4fKEUeWDOo6Q1ftBBYcrMWx/oUI
	vgUpiVRoaxJKB9ATbU3KqU+J6KnnZmBlzTrVsPdpmdtxbTYVb970FHg58
X-Received: by 2002:a05:7022:4188:b0:11a:37a7:3d2f with SMTP id a92af1059eb24-1244b36d5a6mr15735727c88.37.1769072034892;
        Thu, 22 Jan 2026 00:53:54 -0800 (PST)
X-Received: by 2002:a05:7022:4188:b0:11a:37a7:3d2f with SMTP id a92af1059eb24-1244b36d5a6mr15735708c88.37.1769072034216;
        Thu, 22 Jan 2026 00:53:54 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70d4324f5sm7179524eec.8.2026.01.22.00.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:53:53 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 00:53:48 -0800
Subject: [PATCH] bus: mhi: host: pci_generic: Switch to async power up to
 avoid boot delays
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJvlcWkC/3WNwQrCMBBEf6Xs2ZRsxFY99T+klKSuZsE2NavBU
 vrvxt69DLyBebOAUGQSOBcLREosHMYMuCug93a8k+JrZjDaVBpxrwbPnZV57LspBkfK1k4fq9p
 VZAjyaop0489mvLSZPcsrxHk7SPhr/7sSKlQ1kdEHxJM12ASR8vm2jz4MQ5kD2nVdv14InUC1A
 AAA
X-Change-ID: 20260113-mhi_async_probe-a7b0867b6e2e
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769072033; l=2282;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=fEYCB1OmXJHFLfozOgMIdwRQktFqsVtb3nHoMKfmXLU=;
 b=ENKcEED5vkiC3LwXWL73TKl+JtTGvCONhel7LnBjoD4Nq6W7Vi+QqT6nhLJPI3HdNwB16gX7R
 9RNxoMqtNTJAAJ91L37yZj3ONjydrqxY5n4HDuwjp6CuXsdILwrSSPI
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971e5a3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yFp2A1wA7JFfkWW7:21 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dy2jf5g7Jfd3xFo1z28A:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: rlKQA_R4WUZ5f0fSYgPr3ePCIk4prk5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA1OSBTYWx0ZWRfX0hTcfqNnCcUL
 +iOuzxgv+kv4iEVAFs1RmA1ApfQ8u8YHKFZ9mrMkkRfKg6fSVO5Si2nQB06sl4AaJovJfRVlFXy
 pVvk9Ntf1E8YYK2b5HnoM9cn/mIBDmFWlEUheDINQtQwnwUHhYqArH7EIjITc/+cNtOWnCF0OvQ
 HhdottbQbrTVEJWwitxp+kIhVny++fuM5wBFocfdOGhoM0ufjrYPImNohgz+KGvpSiwvxkbSwQY
 x7Wyrh4RluEZfye2wh+zkZZqJAVLb/QVb1o4KaWeA8IW69CYCA+vFd8tPtc65KM0frJPFb50uWy
 Ft67JWUJn4QfbsoOtWOcZBZkIVWIzQZtH0j020hIciEhl9nrDY+sBz6tJ40zujRM4kh2ZRNVtXf
 itbkRzHk3MJlUcEYXbCFwF4aE7wUW5+dD7E8dfCOoGiMVwVeFjxzjyzX5MBml52253NBUlFsc7q
 x5wcVRn4iJU85EOCGSw==
X-Proofpoint-GUID: rlKQA_R4WUZ5f0fSYgPr3ePCIk4prk5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220059

Some modem devices can take significant time (up to 20 secs for sdx75) to
enter mission mode during initialization. Currently, mhi_sync_power_up()
waits for this entire process to complete, blocking other driver probes
and delaying system boot.

Switch to mhi_async_power_up() so probe can return immediately while MHI
initialization continues in the background. This eliminates lengthy boot
delays and allows other drivers to probe in parallel, improving overall
system boot performance.

Add pm_runtime_forbid() in remove path to prevent device suspend during
driver reinstallation. This issue is specific to async power up: with
sync power up, pm_runtime_put_noidle() is called after mission mode is
reached because mhi_sync_power_up() waits for mission mode event. With
async power up, pm_runtime_put_noidle() is called immediately while power
up process continues in background, which can cause the device to
suspend and mhi init fail if pm_runtime_allow() from a previous probe
is still active.

Fixes: 5571519009d0 ("bus: mhi: host: pci_generic: Add SDX75 based modem support")
Cc: stable@vger.kernel.org
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0884a384b77fc3f56fa62a12351933132ffc9293..fc0952e46ae5e4854c7165ed60b850729843d458 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1393,7 +1393,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_unregister;
 	}
 
-	err = mhi_sync_power_up(mhi_cntrl);
+	err = mhi_async_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
 		goto err_unprepare;
@@ -1447,6 +1447,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		mhi_soc_reset(mhi_cntrl);
 
 	mhi_unregister_controller(mhi_cntrl);
+	pm_runtime_forbid(&pdev->dev);
 }
 
 static void mhi_pci_shutdown(struct pci_dev *pdev)

---
base-commit: 91a0b0dce350766675961892ba4431363c4e29f7
change-id: 20260113-mhi_async_probe-a7b0867b6e2e

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>

