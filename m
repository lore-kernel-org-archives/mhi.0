Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075DEDC
	for <mhi@lists.linux.dev>; Mon,  6 Nov 2023 03:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nkDViSWw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A61u2VA028023;
	Mon, 6 Nov 2023 03:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=OKCw/t7nq8IWz86AirlkzK8qrvqNo3WXJr+ctjpke+8=;
 b=nkDViSWwZKbSH985yDSYTmI2qehm2O5LGHICXhv1k+h7HWh5zvIWW1TvPLfxyYb/teqp
 flyDccDVsouIU5BLYZGPKLCwF3/ZIp2gqHWfLeRivJfXAJr+n21yghkZUGEsY6dNUmwv
 kIRMhK+n8lkLnp53m/+N/2zMJswHMGmsK3VlV3W85Vvs2pd70YvaCkkYSr05yHyQUk3J
 wAKA2xpVMWFdISdk0ojCWNprAeM0sbvn6laI4mocRrv8WohmkClHxrZplwQwE1ROrzlR
 lj78qBI4nKktsLtYghF6ExOBEakWU6Y5woesUEMuv4IN2RfXuBa3FAnj9WeZSW41Epst KQ== 
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5euytwbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 03:42:58 +0000
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3A63gt5M027817;
	Mon, 6 Nov 2023 03:42:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 3u5f1m0tt1-1;
	Mon, 06 Nov 2023 03:42:55 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A63gsid027812;
	Mon, 6 Nov 2023 03:42:55 GMT
Received: from cbsp-sh-gv.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 3A63gsR1027811;
	Mon, 06 Nov 2023 03:42:54 +0000
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 4098150)
	id B35AF5438; Mon,  6 Nov 2023 11:42:53 +0800 (CST)
From: Qiang Yu <quic_qianyu@quicinc.com>
To: mani@kernel.org, quic_jhugo@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_mrana@quicinc.com, Qiang Yu <quic_qianyu@quicinc.com>
Subject: [PATCH 0/2] Add SDX75 support and its dependency
Date: Mon,  6 Nov 2023 11:42:50 +0800
Message-Id: <1699242172-79472-1-git-send-email-quic_qianyu@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _uxDejwdqeg7rJswcsai-CMBHDgQNH-b
X-Proofpoint-ORIG-GUID: _uxDejwdqeg7rJswcsai-CMBHDgQNH-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-05_21,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=515
 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060029
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

This series add new configuration for SDX75 and new parameter
ready_timeout_ms for waiting ready state. 

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

