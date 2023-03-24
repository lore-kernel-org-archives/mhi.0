Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57821747E
	for <mhi@lists.linux.dev>; Fri, 24 Mar 2023 16:21:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32OAtU2U008954;
	Fri, 24 Mar 2023 16:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=62411DgiQ6BYTtFpH48q8SohORS7yQm8ihCcu6OUL38=;
 b=SHF4XLh+yC1TGdrOxj3IxrhEa94Fx5K5Z+yAsZIZQ74z0Ff7hEAn5NHeYKeJgeqLC4xl
 nJcN1O1KMeWcqd+uJZeJmjzse5hUl1oXekfjiUK6/Ob9OA11BixTNhojnY3BFyZ+Txt+
 bweXmkZvLj0b0maY+xDhC7pTpFvFBhE5whEmtMWxxtvu6XK658JE0jm4+b23bb9qjU8Z
 WSqYBMN/DPOEYONr9NEcwtnpkCpX3eIQh81QBVmVkrGP+2Pcyicb2EiKINNP3eApEa4A
 sCkC4df80MFbWk7yqE0AYHrt5plF6k5uKswreMh/fpt2Nqla69M6rZ792MBLxJeLdhJu +Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgy60afdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 16:21:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32OGLFIT008915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 16:21:15 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 24 Mar 2023 09:21:14 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] bus: mhi: host: Use ERANGE for BHIOFF/BHIEOFF range check
Date: Fri, 24 Mar 2023 10:21:00 -0600
Message-ID: <1679674860-28229-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ryibDYFNTvaTkqI5MFVfqrgV-j5um5nH
X-Proofpoint-GUID: ryibDYFNTvaTkqI5MFVfqrgV-j5um5nH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=951 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303240130

If the BHIOFF or BHIEOFF range checks fail, they return EINVAL.  ERANGE
is a better error code since it implies an out of range condition.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---

This feels more like a style change than fixing a bug, so I'm being
conservative and intentionally not listing a fixes tag.

 drivers/bus/mhi/host/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index b46a082..f72fcb6 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1112,7 +1112,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 	if (bhi_off >= mhi_cntrl->reg_len) {
 		dev_err(dev, "BHI offset: 0x%x is out of range: 0x%zx\n",
 			bhi_off, mhi_cntrl->reg_len);
-		ret = -EINVAL;
+		ret = -ERANGE;
 		goto error_reg_offset;
 	}
 	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
@@ -1129,7 +1129,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 			dev_err(dev,
 				"BHIe offset: 0x%x is out of range: 0x%zx\n",
 				bhie_off, mhi_cntrl->reg_len);
-			ret = -EINVAL;
+			ret = -ERANGE;
 			goto error_reg_offset;
 		}
 		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
-- 
2.7.4

