Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A5D2BF3DB
	for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168788; cv=none; b=VyFboN93Xy3rEJ3cPxMYeL3iNJmThWtHjO8iNoklxRBrsYXhsTg+LK4OWpmuhSqe4TbhG1ZG+RcuL8/fX0+2A13JVpj2GObsouchrABZDyXzqs1K63WeeZjWg1/Jnhj4SQUTVMLmjrO4SzQSU7jFXscIBrAQBpZ1t6NDCSVdkMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168788; c=relaxed/simple;
	bh=t7gay3eiWOPDY0JXpqFO72lJbz0dWJRavau/NMQ3H6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hnAn7HufHvDlvsG2FZxb0J055Qw/1OBYwRKi5SNSX5JVyvr/aIB3e7b81ivdIB4wrqBwObSQPGMwbCZT8gb0lUDqUeKdcyPrgvx8fbX7tK66Zb1j1zCff72aeIxm+KJR4oXC1HxH9qtiASeTezI1aLnkuRUKO3tp7L3DM2vnpIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAPWVJWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJJig9j/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAPWVJWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJJig9j/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5I0YY3705183
	for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 11:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAjh8StLopmEfidnduSQuc
	PIbLKeTcswSu2bpKkM0ms=; b=FAPWVJWNiBtBBjs5P/pmbmsUSdnyufstXou1P9
	+V0sqJqTz1INNBr+ZV8u7v9+eZttct5zRt7yBc+fGrPXjsHDPnYsrOCMwwT0Mwm3
	S8DYkBoEanabZxSy3o4b8d5CLlIjMHDG4RyHW2ldsTqdnXnVkaj+ezYw9Vs2nc5o
	Fp6G8m5SMG1ED65PxEb9pP5JJiW5i62D9S2WSXpT73r3mAychboigDJkORdh7tei
	jLq53wx5IN2ZYQVzrqYMYMXd95Oly/neKeHa1WQ8clTCqB/38gFjEJEGin/FmbJr
	f71mcTXnnLot0byIwgU4PBYfdUndWwlFsSkq9yO9yW5w3zgQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buuaytsxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 11:46:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f47c0e60so40479555ad.3
        for <mhi@lists.linux.dev>; Fri, 23 Jan 2026 03:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769168786; x=1769773586; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAjh8StLopmEfidnduSQucPIbLKeTcswSu2bpKkM0ms=;
        b=aJJig9j/1RPbEBtvkAG6JPi+YrH1Gmw7elv2bUP43zjse6alpxV7A6Iqbid2ZG7mrX
         R7jPMPcBWEDqtjUuSc+F1zV8KVVbP6UPaSlzyOjMgs53FNfwMDUVUZ369VILYTiqaqcM
         4f3lX1hwVHR7fPORPQxrV162+Ga/rkA8rrMLQpOxUcY5wVZJHBc3jiqwQqvzlOBMu8pg
         t61wBm0/SCh/gnHJb4kW/9mhuq1zlJ+ZpTQUT+BX2Qavm7Y5Dm889LwynCmW46S2E7XM
         LnHcOmiWXj4gmhg+Ul5aG7ZhyRSLc4WOxeDSVzsUUii6QHxbokPVMWjNJL0NqTOnvJHR
         jzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769168786; x=1769773586;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAjh8StLopmEfidnduSQucPIbLKeTcswSu2bpKkM0ms=;
        b=nsVrmkUh980hLJNc1+C9zukbuFSZtoVIoBo47vYiKnY3t4aPKvlqi10VfOmz6IvaUz
         xUCJoUr6Jq7L2hizldsW0ulc4Ug1i9jaZiNgCtctWwhJt11Q6TFLVrlH4lnoBT8qvOK9
         RvszkU1X2uJNqNPSQbq7D5M90nLj9Rf4dwVs1qH9gEARK5oeFGqHQ/OfH/07cidhBoDl
         6o6RfNW1708jh7hjExY5PFt1C/KQcI+DjFMN82LxBpadNuYerQnCwwbpKc9uzCsNoJ+0
         2r9uQTfogC0OKeukXuYm/+okA7v/rF/caJkrxeWm0FN/cKM4PLLuHRC/pG7CExe8I7wc
         8TCg==
X-Gm-Message-State: AOJu0Yy909bLYQ1tzu0zmRaY3Ti3gRTORyg8r4NLjbXwbVjG0xfVGM74
	H8fPF1GIjJVea06uGdeWy8HQK1LSVQ9RxXFD9qLxSM7ugcJB292mGPob+75aoV4uisMv9cwUTKU
	vgvKJxK0wrFDkmyxduFe9WkD41cri9esLbk8/Kz2owCXay47lnJc6NvdlqtULFtY=
X-Gm-Gg: AZuq6aK7DnIZ+CZbN+NSxOAyK0BrCC1qMOahxf6qNKh5HriYnQft8S/OO+tc42aBWJa
	I2dD888WYhupEn3trFZARbJ7nlA1O5lSgmwlGAN60o+oQFRiy1upthZVzazgBBxTLdDqggf2d8F
	lAulAH2MkmOo2H1TWK4kfr425bAZviP4lTFtINTbYu5QFj6Dvn0FIIuI0dmwOafu595iHPWuoMc
	66HW27uFbwpWrpBh/pnliNceDoQSqkVQ39N7X6WKf+F+kJu0YpCdfawPjzAydEzthuj7dwbVEWX
	8sSu6ignF6WSdkRowXkr5dpuZxNTkQh2RnTAKygjQ/FuxzrYW9qfbfULvuKIMheiY7GRZFQvKvA
	oelzeS6lfkseFjN7N1CM04oBQ5zmj+SmNQ7hiJ01r/NM1
X-Received: by 2002:a17:903:1aa3:b0:2a7:b646:54d0 with SMTP id d9443c01a7336-2a7fe733e05mr26436855ad.41.1769168785716;
        Fri, 23 Jan 2026 03:46:25 -0800 (PST)
X-Received: by 2002:a17:903:1aa3:b0:2a7:b646:54d0 with SMTP id d9443c01a7336-2a7fe733e05mr26436615ad.41.1769168785213;
        Fri, 23 Jan 2026 03:46:25 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97a81sm18199205ad.47.2026.01.23.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 03:46:24 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:16:17 +0530
Subject: [PATCH] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIhfc2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3dyMzPjilApjU11L82RL00RTU8vEFEsloPqCotS0zAqwWdGxtbU
 ACOiMU1sAAAA=
X-Change-ID: 20260123-mhi_sdx35-97c95a559ad9
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769168783; l=1947;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=t7gay3eiWOPDY0JXpqFO72lJbz0dWJRavau/NMQ3H6M=;
 b=fdeBLN2Bkg8AjzqaqmCvKZPGUq31YlWgcvvQQWgmC7NGYPymQ5qWUv+pGm3Jgy7hZPGX0CZhv
 P1iT25/cK6yBkmASAo455Aol6sIIGdMgFXx25FzDXXTIEfvBIzUyS/x
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GP4F0+NK c=1 sm=1 tr=0 ts=69735f92 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mrqgHFdOJtx8rHRLnM2ov2tUSjhoY_87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5NSBTYWx0ZWRfXzxV6dvE6+bGU
 Vflojhn8GphDQAgEfpJUkclPUUtKPmH6VCbxly/qIQFU45F6bESC83kwhgDJzeV7RjRNsZO3dsT
 7GzpACTm5MFGIPMvHUHXHGk5T9kGAdtJ3cB5yFAG3ARUpLqA2RNlxAFeTw4xh59GQoA/YzD2I1x
 hRRDckzysXSYXLOm837V9CZHJk9mmbPlpjE7F3ILwZDAebsJ+9qqfOj1Pjy0JCnagqIUBBI5hN4
 2tHQSihbX0uJMDK54A2c35E64CLViv5GXOp93BX/HTTZyWXZdjhm0bTj4wcgtv5Bb+ziTxR6Dni
 z3x8oLOjuv7RV6d5FDQ5dePOFt/W5YSaMtV+vgT95k4zHEz1I/s6QrJbIxazlnzscB0GUHeeDO0
 ELN6ijpbY19zczJPKmOpkxJceto48XvzZShT2vcZ4SOL07/XEZoPbx+e9+YBcgVVGMdZ6x9n5xJ
 cAm0MzeSg+WYqAt16bA==
X-Proofpoint-GUID: mrqgHFdOJtx8rHRLnM2ov2tUSjhoY_87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230095

Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
transition to ready during power up, so use modem_qcom_v2_mhiv_config
configurations.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
            Subsystem: Qualcomm Device 011a

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index e3bc737313a2f0658bc9b9c4f7d85258aec2474c..138ab21d9685f234f1de39668a9821cc449b74b1 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -423,6 +423,16 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_qcom_sdx35_info = {
+	.name = "qcom-sdx35m",
+	.config = &modem_qcom_v2_mhiv_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+	.edl_trigger = true,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
 	.name = "qcom-sdx24",
 	.edl = "qcom/prog_firehose_sdx24.mbn",
@@ -925,6 +935,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx35_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),

---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-mhi_sdx35-97c95a559ad9

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

