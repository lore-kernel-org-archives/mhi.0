Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0912749CE
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647796; cv=none; b=tUzOF4Tgiv9wVjICCuP28adB+NOrn1r/3V8npI4zO6lGmunq5KybdvdOgWV0ot2j/jQbXlVwH6OZRcdQZFpzBCV1CavpK5RThBmQ4rLUCMJ36TStptqWVHaorSA4FHdCNWqgRndJDG41h4pRKrU6b5p3e4cSi5rm5rLB8BAMdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647796; c=relaxed/simple;
	bh=f9VnQFlVHGmxW7j7gZlIxCd8zqeMRXWr1VeR8egwigY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tch2eEm6/pprIepzB9q0Y2TKpItmXl+aidQJAMTXiMlnSx0Z4Uw0yb9azicmz/YwmNJkcTPt1bcVwrYe6UI4PtKGo+/DsiN51HI0nXKGK3uryHg4taw475jPyLHNv7d3PWDfO6NacltDR1TsPRrBsKnDqd+PGUBUhsIdVcgjDM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBbUYamN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBbUYamN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6P5SE007910
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	007HujZERMxrHzIjqypoNUr3p/UZblbrCkLIdes8l3o=; b=JBbUYamNM38KwTPw
	r5XpHHv0iGfIQvDD01T1azNRyfzAGyNaw8ym8Mz1hYs3velk5YZmKNFz5Qut1u5t
	8VexHveJsDty+tyJht3pu2JQAtK2yXi2pMDD5IbTihiFeczqnb//j96Zzqg7QlY+
	ROSr1pAw3nmwZqCln5iyu5KSMmosZPO2/5xYMyw43iTjKHxpjmSqEXdJ1SNVUBj9
	LRxjHbHyPfTVbagpfTZ361SdkVQZ3VVKVcjb82jj5nGznKnZhcZaLZz3lQJ3ijcF
	9AHKwlHr6v2+DMbbm4O95fHlRS3U2IS7GsDN+K1fQkkmdic7Wzr1HqosfBi52ugd
	lpLkqw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgmak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7375e2642b4so3100044b3a.2
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 02:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647793; x=1748252593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=007HujZERMxrHzIjqypoNUr3p/UZblbrCkLIdes8l3o=;
        b=M1ktDQ/HaOVTzZRMBrzI0Kho5YOTU6LYNzTlu+RCAxTVP1PsB14gqIuuMB8AbdjZ2J
         G7/pNIpeGYbo19bLW0XDagK1J5j7a9+O6sax4KZrVHP4xNHiEZ7+30MtWzdOzerKqPy8
         SaCmzPAD+3gQd8X/rxzCDZMD3ZPFP73YyNc0+UdTdHm0VZTtS/3AQPM9LBC/2pSvCme0
         LduCx8PONlf6SkguWr7zqNSeHxehPUii0SczBufB2U8L6ud9kabXadOblL3jZxHfwOR2
         ad2e8Bfeqbem3GBxDdY1tjST57AJyQtXJAYAoQsBN4ublWfyWVlcr7D6Qy7zIr15UnHi
         G4cg==
X-Forwarded-Encrypted: i=1; AJvYcCVAbISfsxyjqiDfyyIcCvCvIF4ZEjh+m5aZ8OMcBhdKV/TNaaE+lpYQr0ycKpEGTJZ36J8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJrvAGbwPKMouajIQlhEDMZN8TU9uCYsG90jEAorU0PaHMOeaa
	YeEwqL6XbYNOiHsKDk08hSWrhcxSHqx5AbKkM/DdL5OydqJWaQgNRAJ793r7Q9cb9VC54O9E0Aa
	KaqjO6E/tKSnige0ebTPBGRGUDtqap6CB/emM6CwESdMImO3RS+P4n2Y=
X-Gm-Gg: ASbGnctm8Q4jume+/vtWg3Wll1CjGZnXk0LIxJFCdWsnLxV+awqvLoOgaTk1u1rMf9n
	5dxJpjWcmEcC9SBWDxLJQuCq8Lwp1lV4/XeM6vdUfzCDx9Va/RugimIr3gqtHcewrqGilE/OwgZ
	VhZzxL0devGCSeTbock0raHN9wgQLOLlyAFtk1flMh2qadJICt6Za78kkg63xy8t95vdm+5HeiE
	CBLdMJkVcasoGWB+x6bbWmTYFluo678n83ht6VAxx78dUwJTOVEgW9iv0s+/ZLGRe+nPk8jETTN
	nYI/r428LCdfFDcSnOD/ZKICz6e0KGQGKuYxJr4HJUsOkGo=
X-Received: by 2002:a05:6a00:369a:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-742a97c3f42mr20730965b3a.8.1747647793068;
        Mon, 19 May 2025 02:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXhkNUVJCPclqbk5uDEmRPDPDeQKruoNfbCs6qpmkg+bZyNb04iAyNCcxFGV8speQfO5QzZw==
X-Received: by 2002:a05:6a00:369a:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-742a97c3f42mr20730936b3a.8.1747647792699;
        Mon, 19 May 2025 02:43:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:20 +0530
Subject: [PATCH v3 07/11] bus: mhi: host: Add support to read MHI
 capabilities
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-7-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=2595;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zi7OTwmsvLq70tK/0cIBpFG23okfTeoXtRDRXjvsdhE=;
 b=TEAaS8SSMWUIFf9mqCpc4zHTzUXmCfxf8I/joGMUwXRWTbVXz/vK2FNeuqyqI6SiNvuSXkkXp
 jQARkBD4I/pCrfr0Zd/fEB6jA65pNHcqeK6lNpVJNg/6SNg0YM9raLX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: jvU0mvsPVwxe-pfE2CPVjlHn1ZXFjdlr
X-Proofpoint-ORIG-GUID: jvU0mvsPVwxe-pfE2CPVjlHn1ZXFjdlr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX2MoYusbkqk1Y
 1c/oe9RpU3xr5AOhO8v8/m5Ve7Kqv+F+0j/3OvjjVHoFDJLeAkVWeTBHYYJwbR7lvN9kcYgsk9z
 83EOL9f1oRRuKVTdT6vHRcUMmlxaoWrstMeXPesrQOhWmebuw2ICzf6G4HEU0LeMqtlK4GysKEQ
 J+JCRUyytTldtnLABWjjcMD2d1xrp/h6KjibM/J1KPXDrKdpc3itC0skjEhBTC2fYtn9LJdohKV
 VO32qB3OHDqMaM+dUi513OhNMb9JcBaL9w636WhsBBGETZlO3sX06uUV74tYgzNmdROjITPNubz
 2uWmfmZsazDSul5t13Sr5eyt8xHkp192xIQx3SQ+tBtlk2xth2Ko3eOu2gOm9gyRmQyV4CDDFdP
 o7N5a3386aUp4JGLf+rdDhqHSDmc6KENwpuBrfC/k5kpKYpNyXCLEuh9dX7kXwuTSJAmQXVM
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682afd31 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190091

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
located after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    |  4 ++++
 drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95a5573a2ec776ca712e11a1ed0b52..eedac801b80021e44f7c65d33cd50760e06c02f2 100644
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
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..a7137a040bdce1c58c98fe9c2340aae4cc4387d1 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
+{
+	u32 val, cur_cap, next_offset;
+	int ret;
+
+	/* Get the 1st supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
+				 MISC_CAP_MASK, offset);
+	if (ret)
+		return ret;
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

