Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254563C8194
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444091; cv=none; b=az/qLueuBQell3NumrM3e1Ov7dQSICrX4WCMhLaTmjuquxBjLPY7cwrs+k+dFh0orV5N46IJX3k4A6urdfIK1O1j1hEQhcyy4LVeKBUDiG9urC9SnVCKRgPR+njRF3/CF1FDoVDtQvqDcCORDc4EzrKIRRPokkRkmlC1tQ+2NVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444091; c=relaxed/simple;
	bh=BhFCU11Vli0eY4peRB1YT42TDHVLDyHFog9G3pGgq0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeHoa+M388euJrqGvKE+4uNc27cjnIN7SCbKM2qCr40HHmwIn/kklsaIXuidGDvXftJXFnAwq3ynpAUqDFc6cCWBmhDTlp4M0i48Ddn50a+FnvMU+i2BefoqgPdoBUGgyR1uYFcwStKSMD2gbU6SHWL57RyGvFTyWTazE8v/DAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgzlyxGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmpItQX5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgzlyxGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmpItQX5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9p1qg312901
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=; b=RgzlyxGB94tPSA5n
	VmceMUIf6T/pLYNQQdcpkxCalmE7Lg26vv2WwJqGcuj4W7nHxcjpcLM1mBh+iXE+
	72/xMMGiPCSy7eXlSFdyXhFM5lU2AVcEYijhJ3Pvwg8nESKOBXpZmVgkT4GMycdv
	ic8HSEjmbIz0XqwzDPbrZirpSCFDLRtUNlBVker1EaBUd4nnlU7n8EjkQSNIJLS4
	8Z+eaVoJpuyr42ZlyZia5YePGd9O5XuqnE9GP7ajY929j37pU30rk4XZMrBPB8KH
	5TmBdinMtcQfwbL69AJe9yj5FeSUdPjKDOny2ntiBeYmvcT8iiep0pyxYhJKlwvw
	VQ3lWg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea88338um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8510f91ce8so1227559a12.2
        for <mhi@lists.linux.dev>; Fri, 22 May 2026 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444088; x=1780048888; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=;
        b=gmpItQX5QkzLLJwteYdqpWwdxywyzlS8ue+0teL+2DfHBdPk8hz2EWdbINfp+EvVUe
         HCltJxHD77uLNGb2zC6DGk57/Dhj2xVUUja137ph0ceEgdLFmzXVA0z/HJSk9ZIgTD/k
         Aq9StyMbx5Zwvj8TXpmt9awLHAYefvlunJq4B0ftULhmUaIieYWdnktiV/2CLqCSsspc
         OL/OXr4/pIGJzUchrVAXbWNihSoVe8w1eJe/dqdoEjiH82lUSdx0Snc+iM+xHZfYnucX
         UpjrCHb2Z3iKbsH34Uhz9ur9COKG4Q2B1E/stkQIGJddExa7/X8L76CdN4lf33K/LbVF
         xTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444088; x=1780048888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+6QIFUay/hg2xkAFLiW+meafenw/9VGhbxcOU+YUEk=;
        b=s5I6eeqj0FERObBbw9389ev4jpCTeZSqfpxchTP9iKX0bFPSr3VfhkZeGdPOlySXl+
         c0tyU/mNa7QgwWBeUyH2ojXekt2H4b260APQDtlAOPl0S/HvZDm7DgEBIQThXjI+PNe4
         eXPjYxMrJSMWOAKtUYch+wHqBw6Zk4l6V4DZ3U63GyKZBUSGC7Dnrmw/SoJd4naIwHPd
         jt2uDj60SDzvJRCBt0EolJ+yX+EpI289IojwJR73Rbxh1RzZ47jkP91UN0PnSi4TICtq
         SwqMN7VC0abKHtbv1/ZOqKGzzDDjLQ4uNmDb1ZNTHd+ry7boARYIDv0ky5ke2UnHiF0n
         ewkw==
X-Gm-Message-State: AOJu0YyxJjzVRbYe7Tjh94pYed8vfQLk5+X2LQj/gkChraZN3n261dBu
	0X7TLjbiOmcFuz95SjsjI7qcMG1GYj0g7hOR4nI9Tg1xUwtXTcLYUWJ/qzqsyVYWlOxLPo4sed5
	FFMVagj2J1YBFRrzEF3Z87LZ5CkHDTjcKG3WIcu+BF6Ruw//+lQxhPXc=
X-Gm-Gg: Acq92OGDuqRtRFQKA/ap0jKoCqhun2WFmUcixP5LFOPwrSx5/fgL818z2I9tMoItC3p
	6u6wigreXK9CocFw5K/3Uz7c+DPBzmyir31JZo0pzGayJUQzCDmKN+Ej0yKSgtE72/0r2v0Wosm
	QI4O6lVyT/YjOAQcEzQY1fEJX7r+hoh/QpT7VzM2jlk/ybdxzuTOv+rDsudLuBJgEH7XpEYINOo
	/1rto1uAah6FBwj3L/HPH5+ncEAQdFdMORtCY86stc54clW0zKTDzmHxFZTuwpopRVpgVe0gfX3
	Zvr8vrJRCHjzior38L+l/+10GAa9RJRTic2+uHgiwP7gtpzBuM2UQ9UlK56oQH7d/EZV8ZeNsYX
	Nd5o7rSVqdMo+TsWyfpqf+zY5yRUXPPe1/3XLk22QPeEIsMK3JCcP4kss
X-Received: by 2002:a05:6a00:438b:b0:82c:9f7e:518c with SMTP id d2e1a72fcca58-8415f32e17amr3015502b3a.25.1779444087961;
        Fri, 22 May 2026 03:01:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:438b:b0:82c:9f7e:518c with SMTP id d2e1a72fcca58-8415f32e17amr3014968b3a.25.1779444082645;
        Fri, 22 May 2026 03:01:22 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:22 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:35 +0530
Subject: [PATCH v2 4/6] net: qrtr: Hold runtime PM during active data path
 operations
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-4-fbebf41a82bb@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=5157;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=BhFCU11Vli0eY4peRB1YT42TDHVLDyHFog9G3pGgq0Q=;
 b=UVBS6HbShn+y5fJQr2GY5SAYIopHLLknf3feWh42YxN8Cfo16vZuvf1XVAOydKz7dA3b3K6eD
 /OQhLOIVtQKBDTOurt56nsyDbIEnzo5jjzEyQsOPqQr9m2m8ymwcde3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX8/bjZRbXLKQN
 CZKIAJk7U/QPU6N4kL3EmaZQTsSNeuR3fzqfARWDD6lsI8ZNuCZaKWQ/LApr+Z91og1zkixxFLV
 1q3GZEnUIy5kGPKCMa4PGM21i9z0ro/uJ5e0+5pzJnUls0uxf48ETCjP6pGQa/rpp46PKQkdHjb
 GXMB6D/I7Pl2rPyVxJB2qrmyA/rlISND/Swce5iX8/S0tUt4+lZ6+pzOutemoeSBBc6p+ydP4wW
 NOf5PDbU9MPOyDVhtXRmKC6Ih8BHnco10A+jT0s6gy0PJcyk8r5Ru/J149YobuBtLUuEwPIQ4l1
 qIr997MH75Tb6U90k5EcSYQYHmYXssdrshECmH5jeZbE3MI+j5wIXiMT5TCG6SqA90+BfnKf6Lf
 OKHT7MJt9D75KV4NnJ2Dko5Wxuu1lj/B+NYiq0cxxoeqlXN3ft3ziT/pbTHaGhpNTX9weJepaxr
 1y07OvXMgJ4IixW7Osw==
X-Proofpoint-GUID: 68-RpeaIQkhq0hJ6DDQuzG20391fslJ1
X-Proofpoint-ORIG-GUID: 68-RpeaIQkhq0hJ6DDQuzG20391fslJ1
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a102979 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mqvsnErzViNTL7-QoTgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099

The QRTR MHI transport driver does not coordinate with runtime PM, which
allows the underlying MHI controller to be runtime-suspended while
transmit, receive, or RX buffer refill operations are in progress. This can
lead to stalled transfers or failed buffer queueing once runtime PM is
enabled in the MHI core.

Add runtime PM reference counting around TX, RX, and buffer management
operations to keep the controller active for the duration of each critical
section. Enable runtime PM during probe and take explicit references around
these data path operations.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 net/qrtr/mhi.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 80e341d2f8a4..cba7a5daf7a4 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -6,6 +6,7 @@
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <net/sock.h>
 
@@ -38,11 +39,20 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
 	if (rc == -EINVAL)
 		dev_err(qdev->dev, "invalid ipcrouter packet\n");
 
+	rc = pm_runtime_get(&qdev->mhi_dev->dev);
+	if (rc < 0 && rc != -EINPROGRESS) {
+		dev_err(&mhi_dev->dev, "pm_runtime_get failed %d\n", rc);
+		pm_runtime_put_noidle(&qdev->mhi_dev->dev);
+		return;
+	}
+
 	/* Done with the buffer, now recycle it for future use */
 	rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr,
 			   mhi_dev->mhi_cntrl->buffer_len, MHI_EOT);
 	if (rc)
 		dev_err(&mhi_dev->dev, "Failed to recycle the buffer: %d\n", rc);
+
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 /* From QRTR to MHI */
@@ -54,6 +64,8 @@ static void qcom_mhi_qrtr_ul_callback(struct mhi_device *mhi_dev,
 	if (skb->sk)
 		sock_put(skb->sk);
 	consume_skb(skb);
+
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 /* Send data over MHI */
@@ -69,13 +81,21 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	if (rc)
 		goto free_skb;
 
+	rc = pm_runtime_resume_and_get(&qdev->mhi_dev->dev);
+	if (rc) {
+		dev_err(&qdev->mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", rc);
+		goto free_skb;
+	}
+
 	rc = mhi_queue_skb(qdev->mhi_dev, DMA_TO_DEVICE, skb, skb->len,
 			   MHI_EOT);
 	if (rc)
-		goto free_skb;
+		goto runtime_put;
 
 	return rc;
 
+runtime_put:
+	pm_runtime_put(&qdev->mhi_dev->dev);
 free_skb:
 	if (skb->sk)
 		sock_put(skb->sk);
@@ -90,20 +110,30 @@ static int qcom_mhi_qrtr_queue_dl_buffers(struct mhi_device *mhi_dev)
 	void *buf;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", ret);
+		return ret;
+	}
+
 	free_desc = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
 	while (free_desc--) {
 		buf = devm_kmalloc(&mhi_dev->dev, mhi_dev->mhi_cntrl->buffer_len, GFP_KERNEL);
-		if (!buf)
+		if (!buf) {
+			pm_runtime_put(&mhi_dev->dev);
 			return -ENOMEM;
+		}
 
 		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, mhi_dev->mhi_cntrl->buffer_len,
 				    MHI_EOT);
 		if (ret) {
 			dev_err(&mhi_dev->dev, "Failed to queue buffer: %d\n", ret);
+			pm_runtime_put(&mhi_dev->dev);
 			return ret;
 		}
 	}
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 }
 
@@ -121,12 +151,22 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	rc = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (rc)
+		return rc;
+
+	rc = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", rc);
+		return rc;
+	}
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 
 	/* start channels */
 	rc = mhi_prepare_for_transfer(mhi_dev);
 	if (rc)
-		return rc;
+		goto runtime_put;
 
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
 	if (rc)
@@ -138,12 +178,15 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 
 err_unregister:
 	qrtr_endpoint_unregister(&qdev->ep);
 err_unprepare:
 	mhi_unprepare_from_transfer(mhi_dev);
+runtime_put:
+	pm_runtime_put(&mhi_dev->dev);
 
 	return rc;
 }
@@ -151,10 +194,18 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
 {
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
+	int err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err)
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
 
 	qrtr_endpoint_unregister(&qdev->ep);
 	mhi_unprepare_from_transfer(mhi_dev);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
+
+	if (!err)
+		pm_runtime_put(&mhi_dev->dev);
 }
 
 static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {

-- 
2.34.1

