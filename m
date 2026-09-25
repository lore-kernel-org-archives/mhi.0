Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07BA39659A
	for <mhi@lists.linux.dev>; Fri, 25 Sep 2026 04:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311085; cv=none; b=PwynPGwgVaGwQ8h4TC8GPwjU9dTnETX2/hsNGBAcdG/gAFRRJFCejbVVyuSyJG4Lu16aI9LvYSW+IJrOqF7VkQv5Xr6wzqgaa6qzPXhRVXS/zQtL3Mbku38u5xLKxoV1crDrFn5I/rhCgzxXbxO+5ZyYQuCLVYI7MDri3wBf1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311085; c=relaxed/simple;
	bh=Rm+eFKsHzqQH480oOqSih7J/Ux6X2xfrtti/R3C8/Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jTCjc69O9PfgU01BSXy0iSMGbtQZuBb2KsZyJdBXlWINchJEOub6guBm//flLe7nnqjbkPK9NSciLzaJdaadpkGm7wMJerhklSTvozbF5I1jToZ2TPIsIubdHBg582cot/aw1gdjKfY7zVSj6LUReFBCpfdJhkI8IBZABPvLqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBinP6cQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkqDzL0Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBinP6cQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkqDzL0Z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YRpX3736777
	for <mhi@lists.linux.dev>; Fri, 25 Sep 2026 04:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L+QdfKIcld+95910MTqUEY
	7FvSFas88X0wQustiaYac=; b=NBinP6cQWRJOSArbd2wxsXGLdpdu1MnB/mqNIi
	hlkcf0rb7gX1uqb52IwcL6fUFDTZcGy2QNHCfTnQc2kBp0OD94j1aV1YN9R6o+/C
	S6gN61wfcSyyHFixE3CbSD47xUnCBThbtNM8LzGH9PVnCPwVLp4Jchv0Cf5JA4rx
	3gDgyr9Yhuu1ft/QhQR/8ZTrKahj535FQzyFkQQAHLeOjVwTss32wMrO84hmQFOg
	c9KvjGvtWbJe11eol2hoqIgW1rWcc6cmSHJ6ry7smEjMz/A/kWnrk10OMjfqFfMq
	pSJlnSyvhLyfnaR/IZMuE+bGATQ4gdVhooPSN7pz/P8DTUmQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e2p56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 25 Sep 2026 04:37:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso728100eec.0
        for <mhi@lists.linux.dev>; Thu, 24 Sep 2026 21:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790311077; x=1790915877; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L+QdfKIcld+95910MTqUEY7FvSFas88X0wQustiaYac=;
        b=YkqDzL0ZeVue/GiRr8bcRr1RP1mROlHVj9xWFiebj5JP3faygB/B/fyLxZ/h3cL9BR
         qmpyVTEGgINyLy6wNhqnsx/6ZZyMvH/rCIWyD0MRhOqN5GSl2miRUz6k9OLetuxEmU8Y
         9AHzIa/yU9n0BG+wZ7o6Cu6z6oo10QHU+lhaJYSuE107aY1gU59JOjSPGinRx2egDAjX
         wUb6bL6YhJ6Fh+9sX4XERd6hIHw1gZYMhz4yhYPV4qtpyUj/bF1Jrwemb/SdGyxlOxoE
         9O2ioBkWoyvEYsFCqvdMuHHan5TjHmI6HH2AIhhQTfLWFJwCPVrSzhd6qBdFfFDeaE5T
         RohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311077; x=1790915877;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L+QdfKIcld+95910MTqUEY7FvSFas88X0wQustiaYac=;
        b=QhhD2843d5bd24R0FyxjvyC0E6OwLeUyS/n9oac7IeLUbqGKL+x1pFHJDIFEWBM28f
         SS4Ca26CQfBZnP7pAbJDa+6fvetipqgTt0gKv9Ef6Om6ajVfHI0L0MOX2HlDA7k7DdlA
         UWKhX4okntddw2X4pQ8FgIBbGXd0tTIMz7uEary7Jv0P2WmU3zyKMuze36u4LnmyEnA5
         tOi7Zrjcc/81DDUrN9L12uXk34YtC17ytqswKtYAgyCb9bRCVvkI2H4KBVy6lFcl93tX
         1c1WlRn8NyZYeEuPrLJfsn526VJmUkgBl3ciK/B7c49+EFRdQMWvSu8EBF5CPMRfLnBs
         bVFQ==
X-Gm-Message-State: AFuF++mblHiF3xGSLpuQ6eiqfHiv0wyv3mpCbJ9Vv/JIehaBnLjwNYDH
	3xWsfUO7dR7bSUwd7ycaIebW1YepiIJmLtCov46IhBRLl5zrGRX11mLqMEO/FFu4mdLGkefkSgj
	psgHLvx61EMefAREFs/V3DPMAl5RmFsXxV80dr1NZluHYUx+QPa6EGQmxgJWciao=
X-Gm-Gg: AYBFou0btnRikeWWS1rEcS74ZeNFUkdDfAJgJS9hVGtiLwKbi1J+N6pKhvJFqFdYYQO
	Q4Ya0lv5MB24wmd8Pst+7d0FWRHrho+kx9tJ+QRiQfIMnWiq5n6j/x07pC7lHv77CczElSG0fLt
	sBkzcuqPa+80ObDM1PbRem7MVIHGtyV6rT1J0+h3Q4nWWI/aIzwaIm9q3eps5rxBmaIT5Cdd1eE
	yOmiu2wrvnf7q3+xTsO/R8canmcvZrFknZrTJoEbHj/QIAVy/Zl+cS4ViEAi+WOBGVqUhx9XGnl
	bksT/JUP5JO6LxzAwrSZaM/d52cA2xvhoXkTQCSm4YvV+/+OOF2TLO+P/3UNiy/fMEXEnjKSEAH
	XbygOjzw0vNfk9mAi16H0sAdVFZPnPyw8Ug==
X-Received: by 2002:a05:7300:c01a:20b0:333:f481:2252 with SMTP id 5a478bee46e88-34001221c93mr3927595eec.34.1790311077290;
        Thu, 24 Sep 2026 21:37:57 -0700 (PDT)
X-Received: by 2002:a05:7300:c01a:20b0:333:f481:2252 with SMTP id 5a478bee46e88-34001221c93mr3927565eec.34.1790311076453;
        Thu, 24 Sep 2026 21:37:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm3053938eec.5.2026.09.24.21.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:37:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:07:43 +0530
Subject: [PATCH] bus: mhi: host: pci_generic: Add DUN channel configuration
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-mhi_dun-v1-1-65bc07ec8a59@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJb6tWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNT3dyMzPiU0jzdxKQkUwOTtFRzC9M0JaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAEhoTIdrAAAA
X-Change-ID: 20260925-mhi_dun-abb504fe785f
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790311073; l=1392;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Rm+eFKsHzqQH480oOqSih7J/Ux6X2xfrtti/R3C8/Yw=;
 b=w0zN+WLCdr5Qo5GVQBWAjdbhwyHAEYTRamkNoE6C6h3k4nqgDL2xqFtAJNbDRQAJceAeVqk6J
 i3QPP3hqFc3AxwjUWgLhfQAh2tex0OH8et81LJuOPC+7jHpIdMiOITF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxOCBTYWx0ZWRfX7tOp4rzM2MUy
 aXQM5aV00xcoLVQp+Oo0wW1bD3IcZXtIGg2LWbaQvf/R/VCHb3BVmPgK2Pe3e8d1F/uMPBppZpO
 nrPqh2Zl44E6RAwKIp6CzxUlw/sVBcFtv6LwcfdZfbnU9QXpNM3KcqxK+ZWC1v++AmrGsep5qlR
 j8TLFIP7XTqsHnWxPqVVdaZKBv5nxDiH2mrEe4gogdzPv+Lo/F/9q+Ye4oSEldavi6gGrLWFK0S
 oPPZdRtW4nA1Mz70IhNhos3AyRpwrNdDxKRAEHCANkaUprQOVbUXBiHqIzZ+V/mDwqLuwbQaPG2
 9aoaIkOdDmyYSJomUUKGSSCZ38BROc5M8aFNhP7quw+bQ/6rSopQNgFt//D1t/6yyyYhsLQfaLZ
 qH1Ocm42tuviQIP6GVLEqQAX6aDlhCpUUFmm3MFtgJuRNvm2uefPYHQoYFelE+sD8kKOP+4PzS2
 vjia8nRNw5pFJrS4Buw==
X-Proofpoint-GUID: FRM2bk82tdsLwDuS8V4sPxoOmrxBW0_4
X-Proofpoint-ORIG-GUID: FRM2bk82tdsLwDuS8V4sPxoOmrxBW0_4
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab5faa6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxOCBTYWx0ZWRfX0zSmI4svMlUl
 aQtoFor7u9m2NWagEqfWcFQfdGkbW+rD4BXtRvZ1F2AHNXSR4EHhkj3KbqvfiO8KNf3bth89wv7
 n/JwsRodggwQMs4XbvHJfvw7iB8YotQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250018

Add the DUN uplink (ch32) and downlink (ch33) channel definitions to
the Qualcomm modem MHI channel configuration table.
 
These channels are used for transporting AT commands over MHI.
Defining them allows the MHI core to create the corresponding DUN MHI
devices and enables userspace access to the modem AT interface through
the associated client driver.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c23b4d..cb4e921d9029 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -322,6 +322,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 64, 2),

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-mhi_dun-abb504fe785f

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

