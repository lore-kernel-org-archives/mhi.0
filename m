Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA03C18646
	for <mhi@lists.linux.dev>; Mon,  6 Nov 2023 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOfj7Lsp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6CH7k4009941;
	Mon, 6 Nov 2023 12:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=C3xkQi5q/kEQqhxxlucjmT4L0pKf6dt9+vEbs473S3M=;
 b=DOfj7LspQdvNrDEypdQ8v0xRLvBxvH5XdQZE6FF6cH2ACPYPMso8x3cDQf5evvyyC6Ee
 14SKjVAN/OtadRdF4SLOpMw9iS8Ekrki8GjkkNRUPizBpgBAaTnnD1CJSZWhlq2CBBIL
 Db5c7EItrHa8CVqekkQIzBkHLsqs5CaPEeW43wxknIigrAT0oNLqDKB58JLPYCP3n74o
 MX5fmW1x4K1XAh99owqUGLcm+FxmxcDWAGj6UJY3f5dLUOpga79A73d4u1dk+7MnCqTi
 5mYGMmlOaa0yKgCrJKTqj2BgI0DpSunVreVn+70Kl5LgC2sNi6e2tIbibFeeXF5Jk+h6 fg== 
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5ernm54u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 12:46:32 +0000
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3A6CkTNo027835;
	Mon, 6 Nov 2023 12:46:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 3u5f1m2j4a-1;
	Mon, 06 Nov 2023 12:46:29 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A6CkTxi027825;
	Mon, 6 Nov 2023 12:46:29 GMT
Received: from cbsp-sh-gv.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 3A6CkTa3027823;
	Mon, 06 Nov 2023 12:46:29 +0000
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 4098150)
	id 1B8835338; Mon,  6 Nov 2023 20:46:28 +0800 (CST)
From: Qiang Yu <qianyu@qti.qualcomm.com>
To: mani@kernel.org, quic_jhugo@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_mrana@quicinc.com, Qiang Yu <qianyu@qti.qualcomm.com>
Subject: [PATCH v2 0/2] bus: mhi: host: Add SDX75 support and its dependency
Date: Mon,  6 Nov 2023 20:46:24 +0800
Message-Id: <1699274786-73881-1-git-send-email-qianyu@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nEHGBbJieunuJUwmPxIEMVAu46-Z4vxA
X-Proofpoint-GUID: nEHGBbJieunuJUwmPxIEMVAu46-Z4vxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_11,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=694 malwarescore=0 spamscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311060103
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

This series add new configuration for SDX75 and new parameter
ready_timeout_ms for waiting ready state. 

v1->v2: Start with "bus: mhi: host:" for the cover letter subjects

Qiang Yu (2):
  bus: mhi: host: Add a separate timeout parameter for waiting ready
  bus: mhi: host: pci_generic: Add SDX75 based modem support

 drivers/bus/mhi/host/init.c        |  1 +
 drivers/bus/mhi/host/internal.h    |  2 +-
 drivers/bus/mhi/host/main.c        |  5 +++--
 drivers/bus/mhi/host/pci_generic.c | 22 ++++++++++++++++++++++
 drivers/bus/mhi/host/pm.c          | 24 +++++++++++++++++-------
 include/linux/mhi.h                |  4 ++++
 6 files changed, 48 insertions(+), 10 deletions(-)

-- 
2.7.4

