Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5142669A
	for <mhi@lists.linux.dev>; Wed,  1 Jul 2026 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902284; cv=none; b=SEwjH0d09VvDCnsfe9Ab8Uyen80qQ2GEn7IGw0J0kCBXLNGMo/VM2mWxBJzkVi3ewnMMMaqyUZstNJyOBAE6ppCBjxmKKG+hf9re11SY1c4GJRKPPsYZB/MaNJfoHvDvcl/jkh/nZzzPg5APYgMACMGSPWRO2+n5vWJbNLrg1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902284; c=relaxed/simple;
	bh=28E7Vcxz/zL/tJvNl4R7cGAC0IOtuHloTBJjNXp+ts8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJ8p85exVxxcTIt/SeC3KmiBpwYREAaSC4HrZ5Hl+tsj3FOu6MMp/N+iZO+36ha1OSg5UN2IiqvidI0myX4jKqLznq+6Spb7qgg+zjBFkhweOtgv0/Pz4gbcWjO06RV3+ukZIIYaE/2xbpTSSA6rH4G67gcpkqCiS+2iAwg1O0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXVD0JD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wei4hbSc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXVD0JD3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wei4hbSc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8nPY683610
	for <mhi@lists.linux.dev>; Wed, 1 Jul 2026 10:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=; b=TXVD0JD3jHYJKhQZ
	g9/Nu8xk/yuVi8rFC7mNHpMcGpoSynlN/Y5bLuBhhAyw3WvVma8DTC4rfghMYO5z
	icSf7PmJdqU3YLaE9GdY9Tfz0T+h7yBojg6kQ6dF6Ijpw8lPwzwu7q8QpGiOD/+H
	ytPLsf++/BIov429xy/yz343NDP5YEHOl8oUYtMRM9KE0OizU0VBPIlCxthZlaxz
	eyE5RR5Zi76TUyQje0ySq1daiZWt6J7/ijav8Dfha+ScOF8vcPWqCwXySeirH47e
	2gjaxT3KfWzRRuv3UySS34woKzOkEuPHGX7tTNG156aCRXpKdMo1/rZ2Go0X9E92
	mfdQ9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqks78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 10:38:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fec599568so667771a91.2
        for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902282; x=1783507082; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=;
        b=Wei4hbScSWSRXDaSddptp7RFcXIL2yzE8GaazoIFsRva/r1MgSp1LOvetsrdmyvMbp
         tLMwl62LMZzF5ThDgMl9b+XGUbBqQuLAXJavnIrshnypb1aQPzMdzIWLXG60vbVA8M4V
         08pw+js/TeJ/lmL37k5w3u6WIjLLB6Rp2qF2eCWCcbzlU+p7HDbtmai9ZZS8xH+FMbCX
         x/VriOn7Jw5H4nl7EUOUPUzy+1gDUQ5/4mib2Qf84J5C80jRhJ/G8jOH2nM5R0Tz3TZ/
         qGQCFEU3H5Qxfb9illhzjoypZfJjfL8/95uitK+AWb3w729ANUREgdWKkVz+EPL5qs+9
         7L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902282; x=1783507082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=;
        b=g68mjl24R/nc14oP8rlBGF9kS15bYaPcJWlRd1Dfc931IVEU6GnFJPLLkAFBpOOOiH
         VOixMApjlGWqG8heOBuSs4xAa8lbP1T7qSXkGL7m98ov697WgIRdgH2viv7fDcqAjZP0
         SFAYc3nuwdzyjl5l+K6d+65OaAk/Hn9e7cSf2/Q/LVyFc8N1GyYO7FY2IJTxhyt/hYzk
         p9hjnoCX6N8cRQdModIEnpDXQzwbdJnzjW6xZujTZWKKrvUO/4D8JUKbFjdkSfcA7Cwp
         0DI9Ecl2EzwuALs19rcT9lW3mxaDmktMfoj45PxP3mvzpi4jU4Z+VgRyHmBnBkiexC/M
         E6gQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1VkCeGu1xZEFvheR6ksGEa8GLFxLESoHyyyMhT5g7nEPUen+whVXQEBbyg2up5sck0G4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCVnhrhqb9yZM1z5O2F3LnGUz0sV6QfX7yCSauak603Y0zMIUH
	d1wp029eyv44LHhBJsei5SWkRIZ7/vEk7W4vpdXaWAc7jOs6n+XoA9CXmc1HpQIK35sek70vhRj
	csZaUZ4hFFGRrY1e2Apgxun7p8+ZcSSjju2VJvwZdwBrgzo5MVsd3jgg=
X-Gm-Gg: AfdE7clP8+qlQEivsJbjIDOt9/+8TaG/FQp979vPOu4U0Mv6JjTWM3CIW9FDB79a2cZ
	2Ec2WV30PaVYRjEqybrz2hw7gx1ToJ4CEsOK61HaryjmXN/uRy++pOlblH8WV+D3XCziFKFiu1Y
	RSliqb4JLNwoNa2TpY/7AiDURdtcEVZzorTxsWsnTf9cCz64DVw2RMoQFAIX6Ehamz62XkRsJIL
	0LozPuRdBZ/WlMVRVDYPUC8PjoX7n/bqvkB3GT9kJKtvrFdJN5MqqlA0hdL9iZIv+2HhanO8psd
	Q/jF646tuJH4ziIz4jk+1Jg8vL9ZsR3QLSIIV2nz7g3OwHx5Q+/f5xxstYMheSTL8DzhFGMkdKG
	L3yGM+7rjJ0BL3z986vd6gDX74YYJ9N4vKxS+m8L0
X-Received: by 2002:a17:90b:4c48:b0:37f:db06:228f with SMTP id 98e67ed59e1d1-380aa0be8b5mr939770a91.14.1782902281855;
        Wed, 01 Jul 2026 03:38:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4c48:b0:37f:db06:228f with SMTP id 98e67ed59e1d1-380aa0be8b5mr939747a91.14.1782902281259;
        Wed, 01 Jul 2026 03:38:01 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:00 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:37 +0530
Subject: [PATCH v6 3/7] bus: mhi: Centralize Sahara firmware image table
 selection at probe time
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-3-3a78362c4741@oss.qualcomm.com>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=8668;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=28E7Vcxz/zL/tJvNl4R7cGAC0IOtuHloTBJjNXp+ts8=;
 b=1qMdaCPQ4PGOsJEaVVsiUbSxsJ9ylr9cTCn+mHNvl8Ocw5dtHEpZsYOLJj8jWgSq+ozAfks2V
 zA9lMFc2dTODC8NOkSOg1E1m7JFFvsRRNlEX1nqktSB/rvBLMyWRmD2
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: OADtnHZSosbV--rHP1SO1GM6CigPo_R-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX6rH0vNB7P0Hf
 MRYglcWaQBGIg1UmBckPOQqYypUmdns2fJjyFVP8Y3wc3jtCIeOwimAb059plhh1eGhYDaC6O7q
 RQILn5tCmNgf/QWsvOAPH9gUf4a7Ls7YPlgaVTbBkJMBKeHdD2qdlNQO1s25tiUMbuvvPNXFdnS
 ffffdBeusn4/sp44BJLdVDUTm1hqQn3zHfZ4GqpbNkHnm49Zf0s0b4QzOZpVNC9qvEKiNWEOpW1
 EAFv07vEHzFyGReeiICNHqirVrt2JU16BSst/cfAzDIY4I/5gdaSibpFKSQFEGyeMCgyeSc2w4l
 RCKXdreSPmuHKi4Ib9/8npMuXPJC3GwelQ6izYzEFjU9Fkfah1qyivqAZxWrHCvCZX/sbkclmHV
 OXgjGhy4s8ridHal3hTuPGM4qv56aYj1OFQyPkiMVqT70YOa2zjQnY7nAyqromLBtm99FSEUwnK
 8Q3peNNvGbgwHD8bxIw==
X-Proofpoint-GUID: OADtnHZSosbV--rHP1SO1GM6CigPo_R-
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44ee0a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FaWmrOfgj8M-bvBoqZ0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX6M7BDKRzbTfZ
 cYfZ6sIkFh7YoOPuBVjpTu8bwtmqYpvPlJcOcXK34JISAYWmzgGbAgi46T4sL84PIfO41wPdaaq
 ZTMteMU9Rxiw5L7/flbsomm0x+g3Rrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010111

The Sahara driver currently selects firmware image tables using scattered,
device specific conditionals in the probe path. This makes the logic harder
to follow, harder to extend for new devices, and spreads device knowledge
across multiple code paths.

Refactor firmware image table selection into a single, explicit probe time
mechanism by introducing a controller provided firmware mapping table that
captures device matching, Sahara image tables, firmware folder names, and
streaming behaviour in one place.

This centralizes device specific decisions in the controller driver,
simplifies the Sahara probe logic, and removes ad-hoc conditionals while
preserving existing behavior for all supported AIC devices. This is in
preparation for adding QDU100 support.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c          | 61 ++++++++++++++++++++++++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c | 60 +++++----------------------
 include/linux/mhi.h                          | 17 ++++++++
 3 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 4d787f77ce419fcd2b250f9cabaec9c26f2da8dc..1f9ef871421b976c35cfad59aed715da96c1813b 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -20,6 +20,62 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
 module_param(mhi_timeout_ms, uint, 0600);
 MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 
+static const char * const aic100_image_table[] = {
+	[1]  = "qcom/aic100/fw1.bin",
+	[2]  = "qcom/aic100/fw2.bin",
+	[4]  = "qcom/aic100/fw4.bin",
+	[5]  = "qcom/aic100/fw5.bin",
+	[6]  = "qcom/aic100/fw6.bin",
+	[8]  = "qcom/aic100/fw8.bin",
+	[9]  = "qcom/aic100/fw9.bin",
+	[10] = "qcom/aic100/fw10.bin",
+};
+
+static const char * const aic200_image_table[] = {
+	[5]  = "qcom/aic200/uefi.elf",
+	[12] = "qcom/aic200/aic200-nsp.bin",
+	[23] = "qcom/aic200/aop.mbn",
+	[32] = "qcom/aic200/tz.mbn",
+	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
+	[39] = "qcom/aic200/aic200_abl.elf",
+	[40] = "qcom/aic200/apdp.mbn",
+	[41] = "qcom/aic200/devcfg.mbn",
+	[42] = "qcom/aic200/sec.elf",
+	[43] = "qcom/aic200/aic200-hlos.elf",
+	[49] = "qcom/aic200/shrm.elf",
+	[50] = "qcom/aic200/cpucp.elf",
+	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
+	[57] = "qcom/aic200/cpucp_dtbs.elf",
+	[62] = "qcom/aic200/uefi_dtbs.elf",
+	[63] = "qcom/aic200/xbl_ac_config.mbn",
+	[64] = "qcom/aic200/tz_ac_config.mbn",
+	[65] = "qcom/aic200/hyp_ac_config.mbn",
+	[66] = "qcom/aic200/pdp.elf",
+	[67] = "qcom/aic200/pdp_cdb.elf",
+	[68] = "qcom/aic200/sdi.mbn",
+	[69] = "qcom/aic200/dcd.mbn",
+	[73] = "qcom/aic200/gearvm.mbn",
+	[74] = "qcom/aic200/sti.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
+	[78] = "qcom/aic200/pvs.bin",
+};
+
+static const struct mhi_sahara_fw_table aic100_sahara_fw = {
+	.image_table = aic100_image_table,
+	.table_size = ARRAY_SIZE(aic100_image_table),
+	.fw_folder = "aic100",
+	.non_streaming = true,
+};
+
+static const struct mhi_sahara_fw_table aic200_sahara_fw = {
+	.image_table = aic200_image_table,
+	.table_size = ARRAY_SIZE(aic200_image_table),
+	.fw_folder = "aic200",
+	.non_streaming = false,
+};
+
 static const char *fw_image_paths[FAMILY_MAX] = {
 	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
 	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
@@ -871,6 +927,11 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 		mhi_cntrl->name = "AIC100";
 	}
 
+	if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC100"))
+		mhi_cntrl->sahara_fw = &aic100_sahara_fw;
+	else if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC200"))
+		mhi_cntrl->sahara_fw = &aic200_sahara_fw;
+
 	/* use latest configured timeout */
 	mhi_config.timeout_ms = mhi_timeout_ms;
 	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 858dc5bc39c1ad42922cabef3b1abcd43bc4f0f4..e339c67e236af271645ca81cc517efd9eead87e4 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -179,48 +179,7 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
-};
-
-static const char * const aic100_image_table[] = {
-	[1]  = "qcom/aic100/fw1.bin",
-	[2]  = "qcom/aic100/fw2.bin",
-	[4]  = "qcom/aic100/fw4.bin",
-	[5]  = "qcom/aic100/fw5.bin",
-	[6]  = "qcom/aic100/fw6.bin",
-	[8]  = "qcom/aic100/fw8.bin",
-	[9]  = "qcom/aic100/fw9.bin",
-	[10] = "qcom/aic100/fw10.bin",
-};
-
-static const char * const aic200_image_table[] = {
-	[5]  = "qcom/aic200/uefi.elf",
-	[12] = "qcom/aic200/aic200-nsp.bin",
-	[23] = "qcom/aic200/aop.mbn",
-	[32] = "qcom/aic200/tz.mbn",
-	[33] = "qcom/aic200/hypvm.mbn",
-	[38] = "qcom/aic200/xbl_config.elf",
-	[39] = "qcom/aic200/aic200_abl.elf",
-	[40] = "qcom/aic200/apdp.mbn",
-	[41] = "qcom/aic200/devcfg.mbn",
-	[42] = "qcom/aic200/sec.elf",
-	[43] = "qcom/aic200/aic200-hlos.elf",
-	[49] = "qcom/aic200/shrm.elf",
-	[50] = "qcom/aic200/cpucp.elf",
-	[51] = "qcom/aic200/aop_devcfg.mbn",
-	[54] = "qcom/aic200/qupv3fw.elf",
-	[57] = "qcom/aic200/cpucp_dtbs.elf",
-	[62] = "qcom/aic200/uefi_dtbs.elf",
-	[63] = "qcom/aic200/xbl_ac_config.mbn",
-	[64] = "qcom/aic200/tz_ac_config.mbn",
-	[65] = "qcom/aic200/hyp_ac_config.mbn",
-	[66] = "qcom/aic200/pdp.elf",
-	[67] = "qcom/aic200/pdp_cdb.elf",
-	[68] = "qcom/aic200/sdi.mbn",
-	[69] = "qcom/aic200/dcd.mbn",
-	[73] = "qcom/aic200/gearvm.mbn",
-	[74] = "qcom/aic200/sti.bin",
-	[76] = "qcom/aic200/tz_qti_config.mbn",
-	[78] = "qcom/aic200/pvs.bin",
+	const char			*fw_folder;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -796,6 +755,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct mhi_sahara_fw_table *sahara_fw;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -808,14 +768,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	sahara_fw = mhi_dev->mhi_cntrl->sahara_fw;
+	if (!sahara_fw || !sahara_fw->image_table || !sahara_fw->table_size)
+		return -ENODEV;
+
+	context->image_table = sahara_fw->image_table;
+	context->table_size = sahara_fw->table_size;
+	context->non_streaming = sahara_fw->non_streaming;
+	context->fw_folder = sahara_fw->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 88ccb3e14f481d6b85c2a314eb74ba960c2d4c81..060dafffac67c5c920adc1562a61a7233e8d583f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -234,6 +234,21 @@ struct mhi_channel_config {
 	bool wake_capable;
 };
 
+/**
+ * struct mhi_sahara_fw_table - Controller provided sahara firmware mapping
+ * @image_table: Sparse array indexed by Sahara image ID
+ * @table_size: Size of @image_table
+ * @fw_folder: Firmware folder name.
+ * @non_streaming: Streaming feature support (optional)
+ *
+ */
+struct mhi_sahara_fw_table {
+	const char *const *image_table;
+	u32 table_size;
+	const char *fw_folder;
+	bool non_streaming;
+};
+
 /**
  * struct mhi_event_config - Event ring configuration structure for controller
  * @num_elements: The number of elements that can be queued to this ring
@@ -360,6 +375,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @sahara_fw: Sahara firmware mapping
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -445,6 +461,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	const struct mhi_sahara_fw_table *sahara_fw;
 };
 
 /**

-- 
2.34.1

