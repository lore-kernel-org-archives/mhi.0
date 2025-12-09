Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B4B3203BC
	for <mhi@lists.linux.dev>; Tue,  9 Dec 2025 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765279556; cv=none; b=DESsAqOegN8hRkNdjiI8nLAP1GqtJMfVAkPy0d0l6x+kMbzniiC+Rol0ofFIoUTmh1ZfuMwOzsFKfg7VrDfFnd30P/LN6YiGusAeoO3KEfNYGEdFVGOaSrXA0EUloN096vD14iBFHCYOovn5yb9clpGcPPdzfRrVmbEBvFZQmqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765279556; c=relaxed/simple;
	bh=2FGJCYKsjYntIjZN8gihGQCd+HkaPjPNeoGWcukaLFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGqpl6SBuHYGmU2XObdWh4M7rkmIyskhfFrrOZUW72LVNpBum4Vi5Nsx4piojO+o9u/v0oxkKki1S+NdNRFBq/knON3a6qf73rkk3OljiGGGMwj6H+b4TzdIZs/SD/CJWMYtqYQsehxZrii73fvLFT4HyuFI7jyblWPVpcL0kqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvt1EQaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtB6TULz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvt1EQaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtB6TULz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99lefK3348664
	for <mhi@lists.linux.dev>; Tue, 9 Dec 2025 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvDD45RhBoypTIEIU6+VZMz01WBs5CFpnRzADYt4gVU=; b=mvt1EQaQB8iSlCuK
	Vgxf5dXS9KtZ8/cyTZvKM6Bajm1ejXNc6QrYpzSSNuyLke3cM/xCsEXkmKIqcny3
	tqafJK7xXWPn0cEDrU5WrIA3eWvTSpreGjwrRnODpILxnumxeXrH1nG2yzUiVc4x
	bdvnc3M4A/dswrnL+HgpoRyXy9kLAQikUo9xsn/jUo9A8KFDE6+vrHEikxVgOzu+
	Z1fqRFZajkARg34PR3GDAvaiA2/6086mUiCcXpCxxblVUzBvSbRIpHb1nloDM1yi
	OdCXRspfg1/kuS1MPEMDc+h8r3QDAw2IykWpJaNqTbkIUuyR6CRbSr+QTURhMDS5
	wdJBRg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axherg979-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 09 Dec 2025 11:25:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso10168120a91.0
        for <mhi@lists.linux.dev>; Tue, 09 Dec 2025 03:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765279553; x=1765884353; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvDD45RhBoypTIEIU6+VZMz01WBs5CFpnRzADYt4gVU=;
        b=VtB6TULzpE0gMFrhHC9WY4WLc/7PBS2+CVeOEgjlImbQv+iz/xodnGyU8lPiV5hve3
         n2YJxzHlYZTxH0nYY+NDNVsrNzscR9JUwfg3XrVZ26rs5aIcO5swCTcBtXWlwI3AFNrO
         a2ZoH1vupFhRBlvqQ6HvR/nCJeDs6kQbTCkNGUILNyjwlX9bq2qr1Nmxn8PXpc82ak0v
         bv2P5pabLP6bfVjg2BOpl2i+yTUY7+DxvQWCPoORmnE8nyu8SKrHVMhWC4mTwtw4Adnb
         0lv8HcUjKQNPEQ7j0w8n4VyGyIpHZDbbns2ViSj9SewM3jbH0k+PF92SwONUAtHMCEXZ
         z8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765279553; x=1765884353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvDD45RhBoypTIEIU6+VZMz01WBs5CFpnRzADYt4gVU=;
        b=aZPsfrIkJce4zZnjuHAQyv1Oqtdsyj9wEesC5uy2U7+J85xbyx9MJf4wGDBa8MS+mj
         2vYk56hIEbKbtEpsa1yT8q3CA4NpHw0Ksmk43DxZ1fmZ3aXkQyL74HDA9X493RDgNvZK
         Mxi0vSm6dIxCshzZnA3gU6VL/3jEAstKsnV+XgXfQQogcyswIdsF3EbpE2ZbYnlM5kEr
         SnqxduZBYH91FgPDQ2966gflf+guciaEZ9JtJeqpJLuTfkjTOBZYZoXEOwDT5J+tkmp9
         cMNWMSyyYGQAiEocTXbn6/R3hwpBBrebhL+pABHJPUeOyQYDUNvlfApDF0mYQYL2syeG
         bK/g==
X-Forwarded-Encrypted: i=1; AJvYcCXMr+MPSPWu8MoRpfxOy/fHViTeb2PoxtCnmWA5BTeR1dl9S4td96a6cImNw3FN39krjWI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaA7dqwBVgzca7SewR8BDAAbZ/NMZM1QoRNfzmHXg93wLm7gnC
	uHSulHYnNOjSSYR8YJmkwLQjr4AdCAWFjo/qblrrdpSH9NEj+QEBy5pwNvSpBTd3T5ZjzYx+4DV
	XsJaiP3yiytER3CEeKQYw+/yyJCtuR0BamsLOJQnKuRLfPKX8U0qIjIA=
X-Gm-Gg: ASbGncsTj0mNxBa/MKf7tIAsvPKCP2LGRlz5XkSLpZgC0Fap3v0JQMHl7JBp8MI1EfV
	rEY6PE+zqZYqcGqYOmMKGwtNCc1DggNnXWzKNGMJjzzqwfoK1PJE0pe7hsYy29+x7y0SK9ob68/
	HKnwtT4EwRhgjY3jegvbTVZnLCHI7MBH134iosZW+MWnUzGLw8cZwwcxWGpv9i5AYYD8QzwQH8B
	3axIesBa3NQyzXcWnFmfmPCL8YsPW677ZcYUmCovXwPYxPuKIxjRqgCK/baq6EbKXPk6PEfnUNq
	xKvE7vPbYRIjOo8wd41o1hHlTuKFLJCrET4Uu8i/y+Wo4BQZa2d70rJ9xMUJG/w9LS9BpqRV2VJ
	+vmJqA0bsRpdEVNy7a9GePKkljY0L2lws1fb6
X-Received: by 2002:a17:90b:3fc4:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-349a2383216mr9377653a91.0.1765279553427;
        Tue, 09 Dec 2025 03:25:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEhiKhxzloVAVDD7SMTU5H/0EbNUFXFZXddfP0ByD6tJ/lpwKv95r6+zJSHLiOW0qNdHwcLw==
X-Received: by 2002:a17:90b:3fc4:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-349a2383216mr9377631a91.0.1765279552988;
        Tue, 09 Dec 2025 03:25:52 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b9178csm2135964a91.12.2025.12.09.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:25:52 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Date: Tue, 09 Dec 2025 16:55:39 +0530
Subject: [PATCH v6 2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-vdev_next-20251208_eth_v6-v6-2-80898204f5d8@quicinc.com>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
In-Reply-To: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765279540; l=1454;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=+nRfEhok8twa4Xlo7PhnBTCR9iY5h7FrwyNjZGBqxEI=;
 b=9KkJ5O9oszdtZjNvDYyCiuz05nlJzO0EMIuX4M6xl275ahq89w8yfAYigRkU5bFVFPGxb2Jb/
 pIPqy2H5WRZATy+BzLnzy1JBysCimexGF5sm1iX4OXiPsqODXejsoz0
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA4MSBTYWx0ZWRfXyQUdCvbu3Fs8
 kuqlkzPxAtcaC9s7P7c70xL0ONeI3qlHNgMT/BDKUYn7POK3nyP1ow7OoU6TxZm8RL0PUBdB0cr
 puo/UNR5kJpzUPv9HeVsVlj0VIgYq4EkJ7Li80vI1G8CwXzhw2BvfP/vKEn/nFyLgS0tu7GPuQz
 MkD/DOYM+9iQtorLtPlauJ8ZogaC05QrX5iOUNDZmu00o6oRgrwAUEhuR1Z9O9VY4CDuBcbe1QX
 oMxs+y2bAk1C6EOsBoqBPlovIztVS1gyrwyhjo06vIoGepJWs6CizEB3iUFr+4khhVBzGV/pZ47
 q1GmjgkHKXsXMzeCqy6iD9U+FP5SpRlWdFnpAMH3hjRDLs0aY2eqQ1EZs2mfvvEI6YdO9CjsUq8
 PgK7zCtpMUQdpt1K2drvnDGpKFO5aw==
X-Proofpoint-ORIG-GUID: 7-8vjaCVws_lW4eIeDfS_WsGVJzt6Ydg
X-Proofpoint-GUID: 7-8vjaCVws_lW4eIeDfS_WsGVJzt6Ydg
X-Authority-Analysis: v=2.4 cv=P7M3RyAu c=1 sm=1 tr=0 ts=69380742 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vo5YzJSDI_NEo2NC7oIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090081

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
S-plane interface for QDU100.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index e3bc737313a2f0658bc9b9c4f7d85258aec2474c..b64b155e4bd70326fed0aa86f32d8502da2f49d0 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -269,6 +269,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
 	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
+	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_UL(50, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_DL(51, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_UL(52, "IP_ETH1", 256, 8),
+	MHI_CHANNEL_CONFIG_DL(53, "IP_ETH1", 256, 8),
+
 };
 
 static struct mhi_event_config mhi_qcom_qdu100_events[] = {
@@ -284,6 +291,7 @@ static struct mhi_event_config mhi_qcom_qdu100_events[] = {
 	MHI_EVENT_CONFIG_SW_DATA(5, 512),
 	MHI_EVENT_CONFIG_SW_DATA(6, 512),
 	MHI_EVENT_CONFIG_SW_DATA(7, 512),
+	MHI_EVENT_CONFIG_SW_DATA(8, 512),
 };
 
 static const struct mhi_controller_config mhi_qcom_qdu100_config = {

-- 
2.34.1

