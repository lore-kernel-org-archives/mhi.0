Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918DB46BC
	for <mhi@lists.linux.dev>; Fri, 19 Aug 2022 18:47:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JFesiv030119;
	Fri, 19 Aug 2022 18:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=tPxjgTnm3xmc4d65cwmOBIkIKOFlnv2fDaqylG+eJdE=;
 b=C8FNP6h2JOPuobCGpssUFdPjQdg9xlgO9AO2YiSBbOdUq0pVCKjjsbOSjp0pDyI3xmid
 cFncjmOcjTef6OQ3XmDpKTqulIwAh9a9WzTRzkzoBH6ZeenfFHSATDBvgZtUet/aTDtS
 V5pIu+kkVQ3f6sIQYS1vOgkrd1dvE1K+HPqQ2XFPoFr0ebb72IlDirZzrYcK/CBrwt4+
 Swys8gcx9td9d86uHmIq5mlnpXY8orSYgr8PSWFyW91fGxi4eUNCSd1T83ci/dXUow2M
 6O0X8o0+da1qrdWXCYZGOEegqVq0dbjCPqFar1OiSeJjWCtE/oz7ZCcPWpC0/3T7zkD2 Kw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j29w99ba1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 18:47:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JIgqFH010510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 18:42:52 GMT
Received: from quicinc.com (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 19 Aug
 2022 11:42:52 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar
	<quic_hemantk@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH] mhi: make mhi_controller_config::event_cfg const
Date: Fri, 19 Aug 2022 11:42:45 -0700
Message-ID: <20220819184245.28035-1-quic_jjohnson@quicinc.com>
X-Mailer: git-send-email 2.37.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iVivuTwh6sdyscwE7g8Vnf4HmRpYhP-N
X-Proofpoint-ORIG-GUID: iVivuTwh6sdyscwE7g8Vnf4HmRpYhP-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_10,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=944 phishscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190069

Currently the event_cfg pointer in struct mhi_controller_config is not
defined as a const pointer. This prevents clients from registering a
read-only configuration unless they use a typecast. Since the
event_cfg should not be modified once registered, add the const
qualifier to event_cfg. This is aligned with the definition of ch_cfg.
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a5441ad33c74..ada2f18af4d6 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -281,7 +281,7 @@ struct mhi_controller_config {
 	u32 num_channels;
 	const struct mhi_channel_config *ch_cfg;
 	u32 num_events;
-	struct mhi_event_config *event_cfg;
+	const struct mhi_event_config *event_cfg;
 	bool use_bounce_buf;
 	bool m2_no_db;
 };
-- 
2.37.0

