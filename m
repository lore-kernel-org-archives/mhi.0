Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172238E5EF
	for <mhi@lists.linux.dev>; Tue,  3 Feb 2026 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101714; cv=none; b=ucpHu6ziLj2hTpMUojABStM1cTWj1QhoemSeZduTWMw4iiHzm0CksGZ34bMf0XQwmiIJjhaOcGQN6Z0EG//Xt1zZHIKov5PSriF2+vMX2ukGrup8WlRlnGp0czBJHVOXWLbyqU8bf6kXsJJ12jko411mN5czdaYOKqTbjoIXMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101714; c=relaxed/simple;
	bh=xUFQC0oKUZhMbN1EUEq9J4r8gaEYrW4edfzPoB2NIy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlMy7sgzbvZEABjWlPMvF8lbQTECahLz4036yZwCT/FOcvKyGy74Zhkj1b4emntcEUAP+w1h089nGmyf3M2IORMNFxfCrtn7fdITRDGPFGrdTDWkCTprIoZbVB7HUE6nzKyt4wOtS9u9ZvqzfIxdKIXn5jotDLAPoM0oBUb36vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWcpLdPS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYygll9n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWcpLdPS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYygll9n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136R6Ix3916032
	for <mhi@lists.linux.dev>; Tue, 3 Feb 2026 06:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4F/hnH+TubDEnoHXK3j6joX/LfhUU7/6hZeKGHC2m3E=; b=NWcpLdPS9fM4Ycz7
	YF3EkmOX0kPL8DXwcSJgL4yTn2qoCNZeV9LaZwHSilRrE09rj2k+ICM0WDAGjbKb
	fUGEcMxJxgSc8hD/IjOSemjhiAjPBGchQQYJNisfpFWeAKrqiXjCVt+whp0K6Yjk
	uJ9Qmx5v0OmlHCWFiSMaUdud5TNNfo6kZz+wTQRDk+wkvpGbbBYGhOBAXwgkcQN4
	FcfMInye8L9+6q6F7ZgQbS4Vpbey5WBXH89+KmSDHjtugdJ1YiQd87U31DsCgyy3
	JWgJEOjD9bMTkYB05AbHHp/Y7meLp+HykT8NfOu7IH5ABhhoZcvW3J+YRRvCGami
	U1M4lQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmka2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 03 Feb 2026 06:55:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so4905551a91.0
        for <mhi@lists.linux.dev>; Mon, 02 Feb 2026 22:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770101711; x=1770706511; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4F/hnH+TubDEnoHXK3j6joX/LfhUU7/6hZeKGHC2m3E=;
        b=MYygll9n+N50FSqvsq+XnC34vb2ii1q+KbU4/zvOhKkq/Av6FKQizhMoJGBO0G/Vzy
         zLM4x9avkVefCFTzJg+J8hgfP52t9HaiZIjYNSmw9fFciwVxNwJjdYgCtIZIy2Rzt6H0
         p30eLlaJP/aPEuPtFThew3G5Xr8qYFxuTjLBDuGJTxpAFc5pBpzODFjj6843jPd1VYD0
         XMkpD49Kk0ougLfnvpzNo2DXGL3aApZYE6p2eZVX9/Z4+rGRdKDSQXT+tyReOQtw6bQQ
         hBx/i+L4DxF9dFDEeXKXm1p9Plx0qUVeghp5bFr3nwpxGbiC84G4rz586ypxZZv5CODI
         sLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101711; x=1770706511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4F/hnH+TubDEnoHXK3j6joX/LfhUU7/6hZeKGHC2m3E=;
        b=R0Kv0u9UNtLzuyCGSj1DCRYis8ywcDIcDbhr95U4645HKJx0OOARQE9znWPrHEvfJW
         T3p8KEBHqThLYsNR47AO3WCc2vqrkUodJt4vJjtpGsyYDaGnFDwUCvOJoxHu5oE/repz
         P07A71oZtyCq4uf4sbToaoWkTQw63fKGBrwhyvONCeSnGKPKwIssF8ozT+3R5cHNcATT
         YRkU10hjG+jK1IXaD6b5smeI+mHLJGvR0uyMJKkdq0/B/G/Apc7gTaRKKoQd0+IpNUPj
         4ELEhOnEkiCYVoY0tQCmW0VHIX/BqSZH3mOV0VnrpN0d5DHgFx4IOYhmKWPCprvfCRWv
         VkXQ==
X-Gm-Message-State: AOJu0Yy3sSZS4Szels3Vi1Qn3kMmIh4JYaJBdhiWbpj7NCpwoByx56qI
	Hthp8f2t2b33HjKON9uy+5RCdlEwu0B6l2t2eiMf97834JQkvIH0wZil1JOg2pVo3J+3JDth1S5
	Gknex+SW7TqBDp2tSJHIin1v8zEefC2SLpier8FjN1kXfOfhXBRjoSSM=
X-Gm-Gg: AZuq6aLoP1lGiUx2DTma8brTbhLcYHStKlbNrjGUQLjZjlgLX83CZcvsSNwbfrzW9ZB
	iIjdF/FXkQ82nmyIKpaVmEhdrxkliBFOGn9ivYN35NU++QAOH1JVfkcLlkm5N+UVNSJMVqO7Jo5
	s2EzCgFOYFI+EW1L7vi8pvjq09yGeq7Da3rI3nqp/booho69qB0OuEMFnoJ1v9vR07fjVMUBrbw
	If3vx+lNNhIth756I+ORPHgt8inALM9KVNtqOVDz9tb3M/KNZ/ueFX5MSc9Yl0oaxOhM32hzw1X
	UoRoEjLZkGt6EJYMyCnNZF3KbsHUt/uelkTvMmxAODlTbV4CBj6jTRvIDUbIm3K2/QxlJjQdqu+
	YEhK0vb2YK4KjTF05Jnyjuo55pYiNTxMYwOE=
X-Received: by 2002:a17:90b:4a4f:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-3543b32c8d7mr12527520a91.14.1770101710613;
        Mon, 02 Feb 2026 22:55:10 -0800 (PST)
X-Received: by 2002:a17:90b:4a4f:b0:340:c060:4d44 with SMTP id 98e67ed59e1d1-3543b32c8d7mr12527507a91.14.1770101710056;
        Mon, 02 Feb 2026 22:55:10 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b1036e6sm837924a91.11.2026.02.02.22.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:55:09 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 12:25:01 +0530
Subject: [PATCH 1/2] bus: mhi: ep: Fix potential deadlock in
 mhi_ep_reset_worker()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-reset_worker_deadlock-v1-1-7ed889b5bf19@oss.qualcomm.com>
References: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
In-Reply-To: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770101702; l=1569;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=xUFQC0oKUZhMbN1EUEq9J4r8gaEYrW4edfzPoB2NIy0=;
 b=kiC3cPCpVYFsvTLCpb7ic2ubQnDeFKHXWXJxB1QeBVT2ghA6iJT2umRb+WNFx6knSyTIT/U8/
 XSHESAFBW8BCmMsa+pUWIK1hy5nSPom2II1jZJaVDtVI3Z4DJFYji3E
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=69819bcf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bDPEW0BwyBpd79SF-D0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: _1BBVrAytjZ7z8NAvsSALZzU_Co5H_V4
X-Proofpoint-ORIG-GUID: _1BBVrAytjZ7z8NAvsSALZzU_Co5H_V4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MyBTYWx0ZWRfXztP2qHPG9wxK
 blzzFLMLZT71RoqTIccTfKZrzgrEoru55fvYv056JfVDEzSrNJQRS1958MmEojc7B/A03NyOOKb
 AFnVK+gowFEX6SRvpdvjGb1JK5Fj+8+4j+XnRO2+RYF9+2AhWM3aZQs5xqCw4tPFuLvcMS2+O8n
 sm5LoJDH2ksuYnaGCEH3gJCOwkb0r6hy6hCYJiPjQXBT5IYnSzCAxDPNZphavUSs5uBUT6fPEau
 0pYyMabrCLEf9ad9xsHx4twPbnRSIPRQlAS79m+iRvJtPbKqSzMrhGlOICzxpBH+cCu75gBhELG
 2poZ0BjPLl/rfHBf1kF5jxp0uXTEV+/bl6DKJkYoYiwkozBpBJsQQAxgXXXHi/tC8vrFolK2gCD
 3ojCI+/l+nJ1pcM4fz24T3IVuZ3WRCJEc51HlQtjHy1d1kxuwQ0hxMAPwV/eRphys/DcGK7OJon
 xfwUOzBxNJIFKOedIng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030053

There is a potential deadlock scenario in mhi_ep_reset_worker() where
the state_lock mutex is acquired twice in the same call chain:

mhi_ep_reset_worker()
  mutex_lock(&mhi_cntrl->state_lock)
    mhi_ep_power_up()
      mhi_ep_set_ready_state()
        mutex_lock(&mhi_cntrl->state_lock)  <- Deadlock

Fix this by releasing the state_lock before calling mhi_ep_power_up().
The lock is only needed to protect current MHI state read operation. The
lock can be safely released before proceeding with the power up sequence.

Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdea24e9291959ae0a92487c1b9698dc8164d2f1..73597de373ef7e0c428bcbc126d63a9a97f95144 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1093,6 +1093,7 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	mhi_ep_mmio_reset(mhi_cntrl);
 	cur_state = mhi_cntrl->mhi_state;
 
+	mutex_unlock(&mhi_cntrl->state_lock);
 	/*
 	 * Only proceed further if the reset is due to SYS_ERR. The host will
 	 * issue reset during shutdown also and we don't need to do re-init in
@@ -1100,8 +1101,6 @@ static void mhi_ep_reset_worker(struct work_struct *work)
 	 */
 	if (cur_state == MHI_STATE_SYS_ERR)
 		mhi_ep_power_up(mhi_cntrl);
-
-	mutex_unlock(&mhi_cntrl->state_lock);
 }
 
 /*

-- 
2.34.1

