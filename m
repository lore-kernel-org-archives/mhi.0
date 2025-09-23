Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F8B30F93E
	for <mhi@lists.linux.dev>; Tue, 23 Sep 2025 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758609471; cv=none; b=P8REW2i6UfwFgmBoPSMwCcUa+jXALsWbvFRqOilobFCCok28K4HjAeCdnPIPZISJfJPVfK7XBPMf5AxwNrZKdSACevdNhy9MgtbOt+Oqetq2dcVN8uSLZ3FTl8CY30XXVA7wqdEo4GjoBRM21RjE3QcyNsg0VfEiMDe/7dVyS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758609471; c=relaxed/simple;
	bh=WsHsNEAaP1Ay90d3OaeZ9mfZsT/9dRhawMd+cuJPOiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WLoZoDE/7eYgieDP1DTOxtKkgyI+2DSzEyFDc91O77yoVN0bDC2AdmQ2L7sC665SLBqzNe3uI6SsGSMtTORPOYoFemotg8E9FORMDJzLipmbMJqJbvnMUF1Z2mAHOPoM+Qyiug9zXQMc7cZKuc1potLlT1qwN6CXV7E9lmUE4/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC039+jU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC039+jU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N6Zjql014328
	for <mhi@lists.linux.dev>; Tue, 23 Sep 2025 06:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9KX9WsCydJ4lMlqnCaggZS
	+sexUTsyHGZuNpnbcsMe8=; b=eC039+jULoPR7+BI9oB4VOnm/MaLjmcglCYdFQ
	qTG0vOVa4Dzt2TiitcJgQUAkVENCvQAaOnkWDLo23ngTfc7lllicJ5udJpPHPEfh
	oXuOuhV54q84PbHdjXfjaGqyuVAbr0nDbzcp7xYHaoE4QcGaABMSdx8137FEsgiM
	4+tnPD5cD8tnIh6ZdoTaRsP+ErRO1p6ctJY4M8kPPYJ+1JbVSjh75fxlXgMIeys9
	lq+kWwKQW+/rirgkm93NK78SDMO57uvjO+/mEbSx9MKxDRugJ0rUVV5bJl+idzlr
	8ApwWuja9xLy40v+MUO+iqu9wmqaXU/t5T6ta6oyofIXPtog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyb7ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 23 Sep 2025 06:37:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581ce13aso92777785ad.2
        for <mhi@lists.linux.dev>; Mon, 22 Sep 2025 23:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758609468; x=1759214268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KX9WsCydJ4lMlqnCaggZS+sexUTsyHGZuNpnbcsMe8=;
        b=g5yhLZjvHCLLjR5/7xgCx8vGghRVx9ZRYK821sjgukHLugoT67yoqgyMIhtBjd4j9d
         L58CpRSLjJK2VbaM0srwgaYizctVHFvsztiwIIckC7L58bercVAFYbZJaK1lVhnDHMoe
         QqkwizGxqmSvMR75f9H4nEJck7Y3V4pGa46YzMi4S6sJkg/Enr4067PJkZvuJqx2udao
         dHJcoNOrKi9nQM3XsF8A+AkUtvhmGXEtaF8gObwh9pxBYj/sclWl1rAJUGUGA16FO4j7
         yvk7vtUBFlRwD6tshnHwL1jfEBjbFRrCT7pt71Afe82GGKeFtwtIsdYWqN2c4Ul8c/kR
         ojSg==
X-Forwarded-Encrypted: i=1; AJvYcCUe5WKwNfe9zvaaB7lo4s4AqvyUYiJPj0fvpL5/sg2vXaJzIaGyR1E2zfiEr6a1WwSKCxA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCT6jh82aLstnxRlNiZYVKNvKvOJ36APg6r0+VN2tlQY7yRe5t
	ekRK+1Jha32Htdx7oHQ7qDejewd7LIvyRaJqjg5rteuREvKoma6tg80Gsd82AwRwZ78qOh5lDlp
	mVR6Mwk0ufAJBYjQ6afPCvS4j+OOO+q34Pp0sCFDeIToFOfkuXJpSiXjye1QnJ4M=
X-Gm-Gg: ASbGncsoUrIZBSfpwt8Vz8n9ANVZCbstyJA+77l5iY0Y8r6zUmMK5O1+KE/I91xhuT6
	yGn6/D/+v0DBmJqSni5jO2TzJ0jD3fB197t5M2juORB6sztKSlhitRVy7Zupg6GY3YHpO5smlVB
	xl25lhdLvBFqKkqBVpBthxrKnbv3Jmq65qlJ5g5uPAZ8MmnDwiTQ4V+0uu+CcY1MZoudVeuGA//
	0eGZtPqqBqZNZY/329AvN/OZBhxR7xbrhDWmc9h6MfhOQCHlNZL9071u8aMI7MAHJ8BA2fJ9/66
	fEFiWSI5s7z1PCFghXalmgD40Q3wNDsMGhqtZulY9McjbbEr7M4tBzol0GYY4Mxsjg==
X-Received: by 2002:a17:903:32c6:b0:24c:da3b:7379 with SMTP id d9443c01a7336-27cc34505e5mr21122855ad.16.1758609468095;
        Mon, 22 Sep 2025 23:37:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz25vtE1I8hZ6E5ev7b4T6BoE48G4Gniu63qvSpIxnPLRSRiiC6ei2Cl7HZdmTtNqdtx1i/w==
X-Received: by 2002:a17:903:32c6:b0:24c:da3b:7379 with SMTP id d9443c01a7336-27cc34505e5mr21122515ad.16.1758609467594;
        Mon, 22 Sep 2025 23:37:47 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551905bb4csm10792840a12.29.2025.09.22.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 23:37:47 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] bus: mhi: Add loopback driver for host & ep
Date: Tue, 23 Sep 2025 12:07:40 +0530
Message-Id: <20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRA0mgC/22M0Q6CIBhGX8VxHQ4QTLvqPZprBD/JEjEoV3O+e
 2jrotXNt51vO2dCEYKFiHbZhAKMNlrfJ6CbDKlW9mfAVidGjDBBalLgzvvhJNXl6FqLNYAQxhD
 NS4aSMgQw9rHmDk3i1sabD8+1PtLl/YT4d2ikmOCSa6UqXhlaiL2PMb/eZae8c3maJf92Kfvjq
 hLqKpkg5fbXbeZ5fgGgdcQJ6wAAAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758609464; l=1041;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=WsHsNEAaP1Ay90d3OaeZ9mfZsT/9dRhawMd+cuJPOiU=;
 b=T9EK5VAaQCj9LSIix1tOa2RAG5rWYnoEeCLwkoNiF1O+0Zrp2D0vSyNPq7mmLoYnJqjvwY3M/
 CrlDtI97n00BuL+ymdOMgyN3yVS16SdJ8LVALwOCvrlWJ9x0a2BjtcC
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d2403d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Kxh_h3bSnmR7gis_oVoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: A44dgWsrClrluENKHVPQClwPbvdEGBFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX/JPZiDYU0FMy
 aKj9OQtLN/BdGwihp9QAsnkomFmKCNwswG7bAC+5hzsIaepU9UWcdYCgNRUTFcxx1RVEIbiIDot
 DlJ1U3ctaSpskMcNPCA+KadWfhF4ilsgzk1uu4ucQ+sYcY1GMkJyCEsAOE0nrH3WFPSjwrGLWit
 l5MRP8YpZEIKaOXMz2tLuAOCoqdgapZTaCOFg/03inLrf6z9klcdIUZrNi07czdwWu1IGjIyBnw
 zPcNSKb5WkxB3nhQXM0tB9AIYtu2rTjyPl4wIykSf8asVEoHZPbfUt0xQE611ZOiOUP0e8W3RuI
 q11oJ9Wu7dqgUjA48+7kXAjv+w+5hEDHO6XjQUOq9Ub3c3EICFI0hfSx0Bwy3TgTb/mikppIUiW
 XMvc3wVA
X-Proofpoint-ORIG-GUID: A44dgWsrClrluENKHVPQClwPbvdEGBFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

This series add MHI loopback drivers to enable comprehensive testing and
validation of MHI data path functionality between host controllers and
endpoint devices. The drivers support configurable transfer sizes, TRE
chaining, and provide real-time status reporting for thorough testing.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (2):
      bus: mhi: host: Add loopback driver with sysfs interface
      bus: mhi: ep: Add loopback driver for data path testing

 drivers/bus/mhi/ep/Kconfig           |   8 +
 drivers/bus/mhi/ep/Makefile          |   1 +
 drivers/bus/mhi/ep/mhi_ep_loopback.c | 132 +++++++++++++
 drivers/bus/mhi/host/Kconfig         |   7 +
 drivers/bus/mhi/host/Makefile        |   1 +
 drivers/bus/mhi/host/mhi_loopback.c  | 348 +++++++++++++++++++++++++++++++++++
 6 files changed, 497 insertions(+)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

