Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762DB57333
	for <mhi@lists.linux.dev>; Thu, 18 Jul 2024 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283262; cv=none; b=R64DAsanbt67ZKX8yn0XMmaDb3ABI/iy1K7yX1TWoZWCliQX/63rpWz6Q5MnvfW2R7mq8ILbJNXLVXmjK7J9MUCOPGuYNKLOmj9xPhLc7kMFIPDAyiJZeru9P/mMxcvoNr66uAjpxGUvtxFsTeJTVHgPzhDgg0gJ8ImiKBEGM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283262; c=relaxed/simple;
	bh=PxP4Uty+G5Qu4rnvdSniaZ8YsylKqaV4x/XmAhiw9KQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQNA7NnlsAm7pmjRq7Db6OF8Ag+QpHHQ3SOAo6XsnXgnxfmB9lVHthM7kNUn9CLwrByRqFLm4cTBh07kALVlLpL12ShRZ4Aj9fwGxmKG9JU22mpyshJBLmnG6d7UVJ1oh+FuWC8RLs2R19WC3I6NceOvoXtT9vE226Q54Cnbk/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iZt29kif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iZt29kif"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HHxut0030475;
	Thu, 18 Jul 2024 06:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/QtxFm1L6dyyGFyHWvZ6PQa4HQ9Lf9sjO77NVcHS3A=; b=iZt29kifNjExsLnH
	NEuzX8wsPt+8zPjfCUmXjL5XK/poGYHWrw2HM/vVQAygOlKhv4KZBYShFbHYA7Gf
	ednki4SMFWYWRKU4t8iBs7B6zq/6LAKjczZYKrw7FnGU8Ws/KP2+fP8GLNSPVBWG
	m7KwbJyNBcgYkhogMATzbZ9YSftKReqIV0C3uz6dwCXm2eAUExadDBwDxU06UF/S
	ndR9KIq40Ml3B7GI8fqf3JjpbalY4Bc3e+gg40bBp/4aVQzrAo/Tc5wzDdKtxjJ9
	z/qjF/5DBfBrb0/F2gSL2q1dDx8gdfH6B22q+t8rq6JJ2dOuuWdSSYWcL6vcK5Tk
	GKuUvA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpmhp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6EI98024722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:18 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:14:16 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH 6/6] bus: mhi: change IRQ_HANDLED to IRQ_NONE in mhi_irq_handler
Date: Thu, 18 Jul 2024 11:43:44 +0530
Message-ID: <20240718061344.575653-7-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3qlNfFwTwjOFWYOBiSUZcSvbhv7h4w5D
X-Proofpoint-GUID: 3qlNfFwTwjOFWYOBiSUZcSvbhv7h4w5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=747 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180040

From: Karthick Shanmugham <quic_kartshan@quicinc.com>

When mhi_irq_handler is a shared interrupt handler. It is the shared
interrupt handlers responsibility to identify its own interrupt and exit
quickly if it is not. If there is no pending event in the event ring
handled, exit the interrupt context returning IRQ_NONE denoting the
interrupt either doesn't belong to this event ring or not handled.

Signed-off-by: Karthick Shanmugham <quic_kartshan@quicinc.com>
Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/bus/mhi/host/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index de804a701b85..f87eb0c2b01a 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -462,7 +462,7 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
 
 	/* Only proceed if event ring has pending events */
 	if (ev_ring->rp == dev_rp)
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 
 	/* For client managed event ring, notify pending data */
 	if (mhi_event->cl_manage) {
-- 
2.34.1

