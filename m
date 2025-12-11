Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8576D2571DE
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440895; cv=none; b=ZwQcWAyhhPNKD1vrDUr9rAMiIgnDLpuovcTtxuTUa2xfjR5j2c4sfZJGmPoocLCcXKlHBOtSujzaHZAkuYxQ17xeHGaaweGIUcZJRLeCX25C+MFB+uxYwEDAxY3xNrxkyOLdGCPhUiZ1NOBlkQRRSV64SBazCqCCNAvqB3BXS0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440895; c=relaxed/simple;
	bh=GqfZdjbwpNzNGRV3mhFb3wWXJrvsykaJ5+F9liByRQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlolV/Ifiti2/30CG9G0cb+rfeFEyIMde6nw14McMQ1sDkRD8ogkCSMdM7wNsdiMZIdbvDwpxA4ktEkV0db46x5JmQCorKrfOi6PIixLUEKDJCrJL+l4jM2OU2mlvIXhoicjMa22Y9zqkhb2iheech4KvwlGFYtceyBMcavL6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQ0Y4RTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvKFxYwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQ0Y4RTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvKFxYwo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPnP53736367
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYdwtSJsLajlgT8w9wckrh9edcTWvrsOaCQa9xUTBWY=; b=hQ0Y4RTgNCINKhYb
	y/koxeQJA8oaeA1cJiBxVu8HmBhHxtt/pzTCpddOCcF2UR4Y0se0ryu9bmdGd/NR
	N1mrg7BFtyKhmGu3gpDzwRv78jVOqyNkclETu2pk3EgZBLx4Mt6KGabT+eo3GS83
	FLvEOOy0JFuK5F2jrdVW8Kp/WAonhaLK3I1y4wRSwWST6GvQn+WNdOT0o91KLuo7
	iBbXaRc6afFYNKgFNjO3A8I2cAwHVvhWFkpmyWvcZt6ftM5mbqJxtRkbd0eD69nT
	uV+hEvKS7xH8Dy3dGxlQeFI49A8QLt7IU25CfMi+357cdD8EvAPJ9jRgk6mj60WH
	4YOo4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0pspkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:14:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e9b2608dso144938085a.3
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 00:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440893; x=1766045693; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYdwtSJsLajlgT8w9wckrh9edcTWvrsOaCQa9xUTBWY=;
        b=WvKFxYwolazkQ95wbQWIJ/Ty3mpx8YRKCuQoWERSNRZp6ci7etXY8aLs74QxOBY7Oa
         CnaQ8qisxpHtf5nnhNEwl3bFbifxPYNW7n4dwxKUDwkchEW/xRDOZEmd0VMMpP3z3nCK
         TUUEVrfZ7o3kfJaXEqzWcYx+LWlspOa7lXvQFDC+sDtZPNd0fnu5QTIhPJObHwrg8YZI
         92zLQQp1kKiJRaX7HjMi9qnSchhPpouS9qt26XXD2nWXSQorOX0PjXiF9mfCYCQwVo1v
         EmWZRBvU+k4Tj5J/Q4XqnEr1FidVwFJAWwpLUrgeaUPRWSqduKZ3dKIUaFu2kitxDbuj
         BaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440893; x=1766045693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hYdwtSJsLajlgT8w9wckrh9edcTWvrsOaCQa9xUTBWY=;
        b=YmBeAEIGZyIVKFvZErDjZV/ACvagY2xVJjF/+ORmOzGvM88iTwy6LumopGwyGVk+kV
         3xENfjyVWXdNKNSuyhVsAOb51kbiF9FR8r2eXAHa+DK/XYup2FX3Ic3iw0thaI78dHeW
         gB+MG08cJsWgL8FLFDlK+pcNf9lzmFsCXAJWQXCzSfAKNjdIh1ctM3UFehggGNjtq3HY
         D0q87121umo2s+YZuhumH8UxmeXCIP6ecR3gG4rOC7gA1DrpQ7NWfjmbgOnRoHvPFKO2
         4alGbCw5CJfcr4Vkb46ZPW+lLPGH5Not1oo9r1Up97D8+u0IPpE4fCCIYFGoBOmdxrIG
         q5Kw==
X-Gm-Message-State: AOJu0YzKQMbxip3UjG6VTlqVStAakUqgTdpA+Z0W3xeVwZzz5Av4HMSI
	z8WpPxhfMttjZzkqUCBZK0vIEUAGZ+XNegoTOUuAPh1uVWLHPuBJC8Ylyvcv2I3sdWyH63tWsqh
	ydUoChdGCqenAphiLrsAvE8YGjU0NSbKx21fIvgmSNa5dGpC2fZMJOSc=
X-Gm-Gg: AY/fxX6OMiFY57wqoGtWgZwsXu0f9FBnBpnuMAzGodmvT/XrMz8nbY5xNbc/Huhl3AK
	x8FNJma27ZW185sn0nnLtvxP06Ah9kwb0omtAxXWz2xDSje5UgTPScWEYK0b4yMpp8kVrV7jpkJ
	WgCbxVi3yNDqG+vnYmztV9QSo3Di4wP4nY2H7E/ZoU4XgErLfmgeE/gyTlBJ5tosJQqXbmKts/L
	GEvHYOrb60szTg8A/VEiYagIrij7nvC6n2XHWdHNX+S7KBaP4lm4SOs+0LYF31lLd0HXCb7DuRg
	SZvC3+YGBDAopekVbra5yGNh/f06iCVUlQ+MGCIppIefwmU1yWJq7FRQDQxjV5ahYugdu8M9HZU
	tRv2+DzQ4v35+xVNlhRzPzuisuwYb6ybC7g==
X-Received: by 2002:a05:6a00:1391:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7f22f236e84mr4701381b3a.37.1765440465385;
        Thu, 11 Dec 2025 00:07:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiTPe9eNOqsIwtPu44NeulbOOyB5EgtrGuYKIDWhYFxKIFac9QywQXMIgc0bG//C3XgZqGOw==
X-Received: by 2002:a05:6a00:1391:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7f22f236e84mr4701353b3a.37.1765440464875;
        Thu, 11 Dec 2025 00:07:44 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:44 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:33 +0530
Subject: [PATCH 01/11] bus: mhi: host: Add support to read MHI capabilities
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-1-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-ORIG-GUID: Rb6KGBoMiNM8s5eQtHNqWaE1DM32STzh
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a7d7d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8H38-GfiV2s7wLOohYcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA2MCBTYWx0ZWRfXxjuxPUiXo8vR
 6Lk3rP4rf+zXnQSjxF3KmPmf+oBgzYT9sk7XcaukiSHfANwXE8RA5WftNDLmBiAc3+AmseBW7mX
 vGK4gz9eDTbrxRxED1qrx1M/CbH5tnFVWePOoB9v+wUlRocAyR7ju8hGp4O3CXJz2/Qt+96nWrB
 00xaYQZpZVycxyHQ3FqJ5TtNx0KHTE2Izq+koaJkBZ6OJ0niQjx6i4BydEqHcgSH6myU9WqMi6s
 8u7t6IILGjEZBPJD6cysYgV9LVd7PsmMuM4a5dkPNQHFAgrRFMCE63zdBfpvcRkaFh0/6ekkCoW
 vhYvS99moMeRsSPXDiHneQtk5K1rjBuW7VBlm6VGa2R/kFEnOEOaj/NFObgv+dtVeLyvb1hKo9N
 OLZOZ4AbSfSM4bD5Yn8/AlW99uqf+Q==
X-Proofpoint-GUID: Rb6KGBoMiNM8s5eQtHNqWaE1DM32STzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110060

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
located after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    | 13 +++++++++++++
 drivers/bus/mhi/host/init.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95..58f27c6ba63e 100644
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
@@ -204,6 +208,15 @@
 #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
 							       MHI_PKT_TYPE_COALESCING))
 
+enum mhi_capability_type {
+	MHI_CAP_ID_INTX = 0x1,
+	MHI_CAP_ID_TIME_SYNC = 0x2,
+	MHI_CAP_ID_BW_SCALE = 0x3,
+	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
+	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
+	MHI_CAP_ID_MAX,
+};
+
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
 	MHI_PKT_TYPE_NOOP_CMD = 0x1,
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd1900..4c092490c9fd 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -466,6 +466,38 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
+{
+	u32 val, cur_cap, next_offset;
+	int ret;
+
+	/* Get the first supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, offset);
+	if (ret)
+		return ret;
+
+	do {
+		if (*offset >= mhi_cntrl->reg_len)
+			return -ENXIO;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
+		if (ret)
+			return ret;
+
+		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
+		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap >= MHI_CAP_ID_MAX)
+			return -ENXIO;
+
+		if (cur_cap == capability)
+			return 0;
+
+		*offset = next_offset;
+	} while (next_offset);
+
+	return -ENXIO;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1

