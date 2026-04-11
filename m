Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0727336894
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895138; cv=none; b=qGHW7FViq20nLSWvLn9GIamnnff8UulAp9o7oW1ib3a9lyRRw+5RGhH/UR2cOgXY8lOYGjYk9uuv7sd4H43dsOLGL/bKCvYXfhRdhslFSQSHiKsOmzJPVR8OuUYBtT5+inZdGTrpFG3/qXmZHsnpqlj9ESz29VaElp8SuIvfLGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895138; c=relaxed/simple;
	bh=3a8TUl1dQ0S0h3oatpyxG08CdJQRPxzQh5LyNap7d2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qwEqU+NXj4ihSlMdSOLazbm1IF5OO1R1sbW+mrNU/Pw1oLstqhHF/6jJb6P2H76djS3K6pKPLRX2RqVkTMwxuyILsZQS2HTuSyc4dc/6yj5nquL5HVevPQ6FHAGtJts+Catwj1TLc+osz2CTuR9vPr3jvhBLAywlo1siLuMZNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8MA1lbQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7C6P5BX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8MA1lbQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7C6P5BX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43RTw621313
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MlsORWSzS43C2/u9+s1RQMidjzjxy+7KRr8E80PaZNs=; b=A8MA1lbQZjJU5VwA
	B/Pp8H9YrVbQ5fp0jtEoYgsJZrqu01HhEGSN5A34cda0s6+kwvEY5vzvl6U0I4Tn
	S4H+9Nj0QZ3485Em9X54FazmM8rX2ESeNJZFkDEu0Wo5LJdbvLActL5LL8WG7JXz
	J0Wky4fGJBdD1BXrVOwQydF5IgqAxYljQOur0YtSoNhWbkTt0WCOzNt32RTV1FoX
	Xgw+SW7O1lbJwuuq6Su85QKkOzhUrU7+vHVGyd3ieqYqdYsSsDNkaw2YIRjZ9fhT
	cI/joAIK0cNC3uwDy720kEpODvO7dl4mpQRf5+ckWuMBJOIQOkGuRBFZhQqiFtun
	UKngPg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrc3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso3062211a12.2
        for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895135; x=1776499935; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlsORWSzS43C2/u9+s1RQMidjzjxy+7KRr8E80PaZNs=;
        b=M7C6P5BXumN7KA8N9SCBCqIwGHef+n4d3x8E7SQCFNcTrbTqGhRw1mowhpxq81ypFj
         ws4olc8sRw5TQnV/rv6dSzdXE2c4UATLq0Hj36PqUzvAapKCj+0rwr/0i58CXYuNqPRg
         kaWHMZaCvBUm5W7ZfCUXpojRtFZSN49lD2HOEORXwVT1GmsoLH+YJ8E08RddB155CSmz
         AbHAPalkyzDqQj+XDLTJ+ZlUCVIu0osvHMUababSsX9P6JOuKEJrwXUeRuV0DVi0nMJx
         pzUh5joIytZEvUGZbRIGeFuEjJgD0PLkuOEOlWAyAEANnTUd6ooamXFnIGSPW54BJ6VR
         Tv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895135; x=1776499935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MlsORWSzS43C2/u9+s1RQMidjzjxy+7KRr8E80PaZNs=;
        b=eNIbxDvZmytfrh0Gd55BXiliVuL46jMj6lIQoSuRnatn2lB1SyQ+6vlD30Ft/1ZpCJ
         oWM7/ivoV7ZY3ua7rz3piqkhPDeazE9Gn3gFg2SO0x3HNdrHMS0a5H5jOzHOdTySzbcY
         Mc6yxgjsWFKRf5KZnzESqm0OzVHGCNmKteR6rgjwQ1uCdi2pjwenVKswvN8ODwTiknEQ
         +WI3vAu7+eILawKYJ+HscRVfmter2A/u+qk+tk5thXahoyxuf0zBryZvvidj6yS0qe8+
         I1JhEF/d1la8TnBIm9OORRi88XeZEZWP/MM3QwAUixoXEQHjkbpoQm3prShrm3i5Gwpu
         AN3w==
X-Gm-Message-State: AOJu0Yx6ojlTZ3sWm9uJd1TE9hT1D9nz51OSRhYzi2rEjigh2GG5Wzlp
	e//BJ8IUfsv1iGSTU7zz1ONnp7V10z+qK2/J9QVkDidQdDTWqfAXehU26293AQJmdJRgbpf1FU6
	WaAvjWSX3gOE0dCfEPdlBwitzeos1x65dyLd4Wl/a9HI8hrZPmeikuHo=
X-Gm-Gg: AeBDiesIBc9HWFl9fz+xrBz9buRG5W4NgurA8AZEjgc1OU9OoB7irTaI2/GP4pS7Na9
	r4Btshls0rA3gJTDNS7NueTDwXWGA+WItvvz5Stob2rZY0vqjqWNMdfDXM1R7nwQt7Un6roP7tk
	RCuCVCRY8tfUb7g7wf4MdzmhrxxBKcJp3AGO516DmvdEbbO9JrRhYz7CuKPE6xbhsLlGwFP7CV3
	K9aWMEqJ7R83/4UrFFPJi2ZsL8K5/5uO4FU355ScNMH18cZ6COKPaAsheZYqgskiD7mtvuAjfhX
	mbJCj5Tt03rP/XEnGHgtLb+8dUr6vU1NQXHF3fwj7INAJFZr2LSwDzzUZQinPQC+pmjIgpj5m0U
	1J0pLE2Tf+CceKUML8rtKBHeo+vlzhxuQwBzRLaWIZS2eVf4OT2efc4Do
X-Received: by 2002:a05:6a00:1c97:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-82f0c2e66cdmr6952770b3a.47.1775895134774;
        Sat, 11 Apr 2026 01:12:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c97:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-82f0c2e66cdmr6952749b3a.47.1775895134250;
        Sat, 11 Apr 2026 01:12:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:01 +0530
Subject: [PATCH v2 1/6] bus: mhi: host: Add support to read MHI
 capabilities
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-1-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=3194;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gnNbZhbZEhvqLJecAEOrjJ12J5oG7SczP2aDECvLgc0=;
 b=Qgo7AFj5IL2iftDW+lMYx6bXx1SomzUp+kkF5WTuOS4YTqFAtWOWrcD0ZbkbfUrloFSLJ7vcm
 c6ogPo5KK35BK7qKQ+z0u+25rGN01ZMHvY+2fu/ZrPSP33UzOb8NBFp
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: UJF-m1YenXirC9aGIluSC5cdfWqe1E8H
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da025f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CnzCB1l8zP_khqs2e6IA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: UJF-m1YenXirC9aGIluSC5cdfWqe1E8H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfXy3xKGg9+/5g4
 uu/DyGfVnlW/KGzljGyx5Gac9aR+llM+S5L3TRfjNMU1mq1aACutuxolcfeAsgHYqhGUJDzxykM
 s8AFs3r7B6ylu+A4kWxDaW220e58MvDGBfVBv3TYGQXUkaC10bXOMXpbFrQORD8GFKD4kyXB2X9
 QoSlAqGh3XrfJsiostpM3EI7AhVOg/3FLTYlPGdDU/+rvE4StVT7q6msy7YxU96vcrWwrD7Ebl3
 e/r38l1Nc/xGuiXOsI3iNqphFfXR/TErta+WlVyzc8z7+cu2U4zrjjbjXkBDV17BMwA5omh3ZXE
 LRGIpE5k+0s3FW0UMGPUJDCqH+5ZhV6kUM11pnUkxltyXD/lx4wFfe+AK7myVcnxZifkel6QY+N
 bwL0FYM8oJGFM7Uffw2E+t87l3x8R1mMLG9kgsxccs+UVPqPvRTjZWYk1mTiFNduooQNdujUElD
 0Lt0Xjgrynwd/ZT5xqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110062

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
located after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    | 11 +++++++++++
 drivers/bus/mhi/host/init.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95a5573a2ec776ca712e11a1ed0b52..4c316f3d5a68beb01f15cf575b03747096fdcf2c 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -16,6 +16,7 @@
 #define MHICFG				0x10
 #define CHDBOFF				0x18
 #define ERDBOFF				0x20
+#define MISCOFF				0x24
 #define BHIOFF				0x28
 #define BHIEOFF				0x2c
 #define DEBUGOFF			0x30
@@ -113,6 +114,9 @@
 #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
 #define MHISTATUS_SYSERR_MASK		BIT(2)
 #define MHISTATUS_READY_MASK		BIT(0)
+#define MISC_CAP_MASK			GENMASK(31, 0)
+#define CAP_CAPID_MASK			GENMASK(31, 24)
+#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
 /* Command Ring Element macros */
 /* No operation command */
@@ -204,6 +208,13 @@
 #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
 							       MHI_PKT_TYPE_COALESCING))
 
+#define MHI_CAP_ID_INTX			0x1
+#define MHI_CAP_ID_TIME_SYNC		0x2
+#define MHI_CAP_ID_BW_SCALE		0x3
+#define MHI_CAP_ID_TSC_TIME_SYNC	0x4
+#define MHI_CAP_ID_MAX_TRB_LEN		0x5
+#define MHI_CAP_ID_MAX			0x6
+
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
 	MHI_PKT_TYPE_NOOP_CMD = 0x1,
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 0a728ca2c494836b0e0ce4c3f4aea41794c0868b..c2162aa04e810e45ccfbedd20aaa62f892420d31 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -466,6 +466,38 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
+{
+	u32 val, cur_cap, next_offset, cur_offset;
+	int ret;
+
+	/* Get the first supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, &cur_offset);
+	if (ret)
+		return 0;
+
+	do {
+		if (cur_offset >= mhi_cntrl->reg_len)
+			return 0;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, cur_offset, &val);
+		if (ret)
+			return 0;
+
+		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
+		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap >= MHI_CAP_ID_MAX)
+			return 0;
+
+		if (cur_cap == capability)
+			return cur_offset;
+
+		cur_offset = next_offset;
+	} while (next_offset);
+
+	return 0;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1

