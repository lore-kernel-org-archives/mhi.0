Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4632ED43
	for <mhi@lists.linux.dev>; Thu,  6 Nov 2025 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762435705; cv=none; b=R7T5Jsn4MNyTHEGbwrEkRYLhA/Q5VA9G4HqzRDJxpbj8AZFrY3SJEJjcqZtxrlShbXDbfzm3ucsGMlTpGQPIub4M/qBWraEks+MouBKMzHGT8RH0G4bjakNtnVkzcoAcyp31M/sK7FelH1Un46yQSIjuI/+y6z3MD/+wvtqrpfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762435705; c=relaxed/simple;
	bh=zjb9tpmbXfB/zklirS7RztViyh1HAgilJ5TNU5aP/JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIKvoa3sQ21B06FosQvTkJbB7QyCAJfREndOS9JtBY1auH1RhDfHwr9ApSDKFcu1Ygdsaa6orWI8BApFq4S9JY/cPrgDELdjeiQehbesWEEp15VL8JZvPiTP5mC+zkACR8Cpdz+4I2ffZ7onzRazT+ed1rkcsdG/odwYCtqSguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgbWwG+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdd0Y3aB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgbWwG+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdd0Y3aB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6BiubE4018569
	for <mhi@lists.linux.dev>; Thu, 6 Nov 2025 13:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4MSsmd3UWwkH5Io/0Bwy/y3Xm2O074wB4lMW6nBkuw=; b=CgbWwG+lkimCUuzt
	yO2usdpa4wIMKEj+NbEqxovX/CZJJ6FNvGHNQSmZ4CFAiBwmUS/8VJ/+CIm/tr4C
	F4Cd58ZQSH2K2mD6jav8y81GcdMG84Hg8kKC9b5sv91ZJsQS/rAUKjnNLOUexrrg
	OANdEh1fyBPu90mGqw9beCGYraZ4zZyKufiFjgVmxa979SpzevNhvslhhNTEdovT
	n91gumtACJ+mCXqHXodm3l++4+qL8jrsgQ36OHnwbss+bxsSnXzSx6cf+E+J19Yg
	kfnRgtHRKDHm7cmkaGlYx0O5KAMAoMpXIqtAdNgUmva8jgr8UiGOC6THG0qtNEZQ
	7fUdMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u2ur84y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 13:28:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295b713530cso13416505ad.1
        for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 05:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762435702; x=1763040502; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4MSsmd3UWwkH5Io/0Bwy/y3Xm2O074wB4lMW6nBkuw=;
        b=gdd0Y3aBq+dlaAXrJTmKzWbj6Hkh1iXy2+QscO1F3kbmu1hL8VcJ0k1nHOJar6N/wg
         9+byJf2VeHggtejWN2gCiJgw9V56L7oaWl4hYh418qS/mkCE2+D0jGAtd98qvlXxEE77
         gaz34BWwOx0FEmbbhVvSk33UeEQpV4Po1GFuXy1X85VomGliSYW9wbendtz37ubb5EKM
         jt3GzH5tpE8J8y1AYF/RElepJCTnXJVWJ5hNBAO5ohUMMp8/pZyjH5622+Bj9GJLYQvc
         eVScdv+pFsWljna67j2bnsP85KPPU1iWVWwZ84Hg/sQQPBZEt9aZOKwbBklgQxiJMGTl
         GTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762435702; x=1763040502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4MSsmd3UWwkH5Io/0Bwy/y3Xm2O074wB4lMW6nBkuw=;
        b=ImDcz9cSBKWh9qYjUlf5TwvcIlwbiPC1IpOiE+0rv7DqFG+1lEm1nsE/iT3+6kX/Hc
         ySMYXxjjetSqif28rVPCWLfZoV1zli6S7tHqJf9mvHtqifPknBAFkfXgv4xbqWhbHls9
         Un9Z+Iz3+jIxp7s8CgDyBr/GA+L4SXWtvWbWzcAuKihSsyi8UCeihXqcNY3taOkhMDnn
         Tafbn/ItYReA1DlIGryC4JtOJpkDeW8Pz1FBEmzSHa6i/u+sRPAJ1q4GSJdROStR79ey
         nVTkex4lr0JeX8D30v6iHZTLBeM9vijLy47YTmGTzcEwnxjUVUfQp4hJgbuNaWO+m0i/
         Z0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUECkqAGEw9A6Is+UyFfKUyeAcz9U/cR64XMnSLhVfMST+oXAsj4adRAe04c1tzwoTRXok=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3YiXbaqhOU7VMPt1I03zL8W3Yary6Ap7twwrTIXGwE4j3hzVl
	t1USxaHJKW52HzeZBjjg55SkFgPxa/p3oW1WZn/nDbZY03Y8oRw3Q6cO5KhMEuWIdQdI8HntI3j
	cM1vv80o6WR/6s+Mlrr2GH/yQKC5bf9I/GKOVTupN2EIaXWA90e3gDek=
X-Gm-Gg: ASbGnctvxpp8U5QrCRXRhZPSTcNq+6a7S6V1Ep65u3THMLnDiGtYiI06sR+kNc/f8jM
	7J7sZX4Ue67QReKCtjGwhUknTt2sqXmNGnXx5inXKmBAwNTg+l2xacadl4fCk1b0XJZK4Oe/UaC
	zJJIiYlEc6WzI3Ua4n9i96bLXuom7K/j9uQN6lmAi+LEZbHIGpmgmy58/TYx2tRB/+DLtq3IcxW
	IX1TWKUl0EvqSKTNJpN0K6vrLbsgG8YsYvgxZtxxc0uQ7dTLDUZQ/wBeSpnoVxGN80RufMa0D5d
	QnSGr8wt7C3R66xFJl0YZGbRW+ptSJPFv/jZ78dyXdrWxyC6es3xNvjEbClr0AJYzrT9l37FwYB
	rLoQPHYItdwZxdGTvE2OxcsoGeQ==
X-Received: by 2002:a17:902:ce87:b0:295:2cab:dbb3 with SMTP id d9443c01a7336-2962ad1c7bdmr105067685ad.14.1762435702177;
        Thu, 06 Nov 2025 05:28:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT5xsfSTNuLc2nSZ4GpEr15dF4h6yovVj03qisQkMdnwH+JmRVy14dCEtnLrebh9HAmRH9Fg==
X-Received: by 2002:a17:902:ce87:b0:295:2cab:dbb3 with SMTP id d9443c01a7336-2962ad1c7bdmr105067215ad.14.1762435701636;
        Thu, 06 Nov 2025 05:28:21 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1669sm28770225ad.94.2025.11.06.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:28:21 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Date: Thu, 06 Nov 2025 18:58:09 +0530
Subject: [PATCH v5 2/3] net: mhi: Add MHI IP_SW1, ETH0 and ETH1 interface
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-vdev_next-20251106_eth-v5-2-bbc0f7ff3a68@quicinc.com>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762435691; l=996;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=pw3zU7ths4bkk53rm3/2/S8r8KYgg2qmgAalSQREZkg=;
 b=j4Wjuyma4giiSZEJnpIwxg7ydkKHXwm4RvCJNR0SHdD+vHYyWCuTcRlnFSVClsTKpOYiBxsnK
 XvxtcxdW4+eBvLvKtrB/+5j1Br0HQXaRbPup4RwA6iQFoDs1EaYPVgE
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=Wv4m8Nfv c=1 sm=1 tr=0 ts=690ca277 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0xxiP8YIG85xZ0q-sMoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwNyBTYWx0ZWRfXy7j2bOQgfDgR
 u92vwa4VXJcUXToSb9CFwMOQVSfq7iKmglUtmsDUVRwp59bvNYAGGG7vQsOLV3lsuK+0FQV7y6u
 V4NGrnPcpJ6nsip8L5dHMQLm8Eepv+/gmWC24gS23Yrr5/cpoD3UGnBOzNlk340lLnspn72SH05
 r/1MQXopd8NzsFtK0XQhZGmPYECJWCCnVIDxD558bnzsWuzq6r0uSmdLvkxTFma4zdpq85C6PII
 KBSG6KBfrb1ezqovqaWJurV0QGM4/Lgl6wryJHsqcJvU+V+MxhxRRMM4GizSqEZjKOqQBqy9vya
 nDafK91veyXABZ1LWFoi0Anc0eKCTaZu0LbrS3oBr1ucAXPCrNAyEb2HjtB4i4vB1xCwQkhO7oD
 kFEgtTj8+iIZ/8QiTfF5FEOB3004Vg==
X-Proofpoint-GUID: 2o4tkJOv-ln0Kmj4IONrxWDyUXJ83nsx
X-Proofpoint-ORIG-GUID: 2o4tkJOv-ln0Kmj4IONrxWDyUXJ83nsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060107

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add IP_SW1, ETH0 and ETH1 network interfaces are required
for M-plane, Nefconf and S-plane component.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index aeb2d67aeb238e520dbd2a83b35602a7e5144fa2..7fca7b1ec7b8250fca5b99ba6d1be470fed87995 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -449,6 +449,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
 	{ .chan = "IP_HW0", .driver_data = (kernel_ulong_t)&mhi_hwip0 },
 	/* Software data PATH (to modem CPU) */
 	{ .chan = "IP_SW0", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_SW1", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_ETH0", .driver_data = (kernel_ulong_t)&mhi_eth0 },
+	{ .chan = "IP_ETH1", .driver_data = (kernel_ulong_t)&mhi_eth0 },
 	{}
 };
 MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);

-- 
2.34.1

