Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BAD1C07
	for <mhi@lists.linux.dev>; Tue, 21 Feb 2023 10:16:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31L4nAhC002765;
	Tue, 21 Feb 2023 10:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=qdbXu/6GSiYehzlR/tNVrIZ+hGSIO6ZKXmP6HjimlZA=;
 b=JC0EIYZS822uY0Re7HrTcgXX1TxSV7sqivTqskuoAPANYMCXlA94+u5xL7m8uKQGqGt8
 CqRxIRC7Sva2io8MgLKTHaX0H4JyAuxkAXVS/J8Qhcbj1/9VyLnqyS1rPDDl3MWqKIVU
 syPaTdd090FWPCIcsHbGyj3pnXQniRnVgO0K35+WxmDWqsZJZ6BQhyqEK+7J9jI6OGO5
 RfTX2fnAPXzz2cFIJ0MDlwjxwZYbCi9uto67evNOqmNcsU7r8DYmeV8iVDLMFGXXHeYj
 lk5x49mUejv2xdc40yVAWuo9yuD5U6irtugL293DRAKIRX7dONYK16yAWK7OXFdUiJXP QQ== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nvprgrrag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 10:15:38 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 31LAFX4S032311;
	Tue, 21 Feb 2023 10:15:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3ntqrkdvcj-1;
	Tue, 21 Feb 2023 10:15:33 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31LAFXet032306;
	Tue, 21 Feb 2023 10:15:33 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-vpernami-hyd.qualcomm.com [10.213.107.240])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 31LAFWpQ032305;
	Tue, 21 Feb 2023 10:15:33 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 2370923)
	id 2ADE5144; Tue, 21 Feb 2023 15:45:32 +0530 (+0530)
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
To: mhi@lists.linux.dev
Cc: quic_qianyu@quicinc.com, manivannan.sadhasivam@linaro.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Paul Davey <paul.davey@alliedtelesis.co.nz>,
        linux-arm-msm@vger.kernel.org (open list:MHI BUS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V1] bus: mhi: host: Avoid ringing EV DB if there is no elements to process
Date: Tue, 21 Feb 2023 15:45:26 +0530
Message-Id: <1676974528-963-1-git-send-email-quic_vpernami@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _BVtSdKrkcnAKnkM2mcngA9V1xbI7XFz
X-Proofpoint-ORIG-GUID: _BVtSdKrkcnAKnkM2mcngA9V1xbI7XFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_06,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=473 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210087
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

Avoid ringing Event DB if there is no elements to process.
As mhi_poll function can be called by mhi client drivers
which will call process_event, which will ring DB even if
there no ring elements to process.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index df0fbfe..8bf8394 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1031,7 +1031,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 		count++;
 	}
 	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
+
+	/* Ring EV DB only if there is any pending element to process */
+	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
 		mhi_ring_er_db(mhi_event);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 
-- 
2.7.4

