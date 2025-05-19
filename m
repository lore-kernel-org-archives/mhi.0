Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B77272E5B
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647785; cv=none; b=lLgrQYhSrZucFwHg+l7JjN78TDqocAdB6e0bFhyBNU0pqBDW/BstXvnBPUkAoKLxYVVHSiHzh5zokWnfsqBtMpRqviGVTd2CmIRr/VSWPLHYoPUrGoul/isRzbJRHAKuQ3DIMG9ugwAK6RAg50ave60YF6XAN6BwRKIjZLzkg5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647785; c=relaxed/simple;
	bh=SUc6IJO3BpbO4Jf4TpYtqCzshGFkITnNomre9y5viZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaj7e7eAHOWLsfZAEhEKLKF/epJVTzz5LMJ2tOhE1u/IUl+TCSyzCrEIcto1SLiNdl8rGir1R1IJQBT2Q35zHgszN/9BhV19bUx2nI474fRpYyfFrGmb0zZhXy8hM6BkAvoiIafnqgD3OOgdd/SN+H11iRbQ5iLkjSPkUn/A/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNLRL+va; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNLRL+va"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OQkr006080
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ry0Vuqi3xhbwKzg/mP3dYU2BH+BshVjYacj/KzyHCA=; b=NNLRL+vaMQCh5Rp4
	S4L9FjCbGkZXhfazz5BYzNoYPzgIbw7np9qm33KNLiqf73K6ODM4N3KJU8D2iNcK
	tuHNBenNXkqJhVXINbV388GFCovjOgaQrY9vdO9PpugZ55sqFb0KXj4Ezk3ZvOWB
	UbSAX1BqNdvsu9OxALCWbiW1b2KpzlLsdXLJfH3OCWT8ipvdYt60usf57oVG52ao
	6WztyJa4KSwOdoESHXhcmtHw4ZMOW3S4bt4mSJdhcJB3jAC0pPoJLFsXQZUCx/cs
	qRunL12i2Pj20RM+ZogH+NwVd5UGNFALRKNrgB+V7yEAzXbExRLkGUpbF7y1UG4t
	C5NWGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgm9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74292762324so3150219b3a.0
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 02:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647782; x=1748252582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ry0Vuqi3xhbwKzg/mP3dYU2BH+BshVjYacj/KzyHCA=;
        b=U9kY356kOjmWPiEAWoGqoMPCbjG70uvP6pESlMnZ4/9HkYNdVWO9rMTalNOktWW7GD
         mHJRoCzVsvPPmv0+Erk2s0FnyuDFrlPfjftnP5lbuxvKKtSsRHQb73CO7wFXnazJ0GHN
         GyoVLTjYpKPW8dMrxKklidvnx73HYrtLPOd73rm+DHYIJT/XBGYGRvEeUNEH/JZIeiFS
         3PBXIeLauPy2IJ7k58wkyP4VIGZ4FxsTOXI8AeQkjQjZktz29+uj/2PCguNjFrY5WekH
         GiqVPBAcaSrYkRJ7HbX4NQkpYH5Cfws+Of+Ix4TMG5HetbGoUyRb2ITlv1fWq37ayTO4
         EkcA==
X-Forwarded-Encrypted: i=1; AJvYcCVeNrpP+W5i2ewTqvU1+r9+8owdkg+5qMzC+bXt28YYJsAprFBP7c6VQN+Xn0Sux+/Fhos=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjTQHYIqLaqkb+HiImYxDxmMkckUcoMSacY3Ijkj3JOasAed2t
	EPGS73KnYssEWKidzOnYUlAIs7DQwZnmMv9SCUyShWcSpImJ5bIjT6tvBi1CBGmS1Xal46b3B0A
	3NvDPcSAQiL5qEwNxZ4UsAd/X4DZKUGXmnEmxruu7F914Xpi1QV+EiPc=
X-Gm-Gg: ASbGnctzErRVu9gGhDqzZW3pSjDpgB29xAl8GVsjYiTKR5l73p4hhqwIw3k0mZohhsP
	gppTatrsaWzqG+r0L9ku0ykHk5NosBmlOro22n90k3OpxfjJTLabvGt5aJhb3HhFfIQ03yTq2kS
	b+i3TTO8SObt4yvLZpFVCWoz6HGbkvi1b5/GygtKqSaN/0XWULwTkvlEi+c1esUfLh1XqRdeKWf
	E2WLBU9L4ZCeycwfaP4BMf9BAwqqBe3jELJb77Uy/pdjUEzP54uhpJLOTDhSshvMGSpNVQqUO4z
	dyKIYOr30VnxXXVR2XKHQLDLEKCiYFTapJOHpza1GYCgGfo=
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr18212034b3a.16.1747647781875;
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq4VZJ8jXy0RcqfiaIsLUELp4ZDyQyOCKyt5bCa/MS6rMWomKrNG+4/gCurYKLyPIbNJT57Q==
X-Received: by 2002:a05:6a00:3694:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-742a98a31f4mr18211990b3a.16.1747647781467;
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:18 +0530
Subject: [PATCH v3 05/11] PCI: qcom: Extract core logic from
 qcom_pcie_icc_opp_update()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-5-3acd4a17bbb5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=3243;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SUc6IJO3BpbO4Jf4TpYtqCzshGFkITnNomre9y5viZE=;
 b=0FFqE/2BevOy7/2o0ZDzBTf5YqeAZmEQiA/aA9YnA+gjWks8X8VUxmpvDojUvsuvCAOUWiO5v
 kQRgurHaE6cDCUERnJhf+yxdVV6kYWaaRgoJ9AJFDNrEf0l85bzJbwx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: tzbdLGJQ1L8sgRElrvjzna8MDlSAkLqx
X-Proofpoint-ORIG-GUID: tzbdLGJQ1L8sgRElrvjzna8MDlSAkLqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX77vdO2mXx9Tj
 ZBKOC6tIS1DZ+9q9mVTLdKOJ2kPnJFx+t66iaCAOvD85bA7Nh4Nd+hvx8LhrpmSsEn2+zOCmtLV
 SJyOQ0skaoD6sXjJgieiK0UR4x//8zprcsB9kNP8pB8syUnC+OXvtFZb43isVc5Pw4DJAmKSBaY
 oFjzwBbH2t6xIQONXz93IHKZinQ/+ne0ur3plLWesKRRmbhlmbENlF2QHrGYQTxOIYJBzUa7eC9
 AVCB6lYaRATtCrQOVGvK83m4ANJSnWQNLNQ4mEW8yoHDicoSyduKtmJ0gt6cwlJls8izF9dI+jW
 Z2Yv0PkbC4oFLBNkgRemXzZz+8BuNaIz+Ghdz1CpEMf5I/IeLzhVgOVO4ZhS6HsyPiEh8dfZy+1
 y6CRADePCYBivqUvLG5KtWQ3qQm9SmFJ/yFyINuGHGjLTtlS3XM7kQC0R0S97+GGDdeZpq54
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682afd26 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190091

Extract core logic from qcom_pcie_icc_opp_update() into
qcom_pcie_set_icc_opp() to use in other parts of the code to avoid
duplications.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 61 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index dc98ae63362db0422384b1879a2b9a7dc564d091..bd984cde8d3bd688b2ac32566b0e9cdbc70905c0 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1294,6 +1294,40 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
+{
+	struct dw_pcie *pci = pcie->pci;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	int ret = 0, freq_mbps;
+
+	if (pcie->icc_mem) {
+		ret = icc_set_bw(pcie->icc_mem, 0,
+				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
+		if (ret) {
+			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+				ret);
+		}
+	} else if (pcie->use_pm_opp) {
+		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
+		if (freq_mbps < 0)
+			return -EINVAL;
+
+		freq_kbps = freq_mbps * KILO;
+		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
+						 true);
+		if (!IS_ERR(opp)) {
+			ret = dev_pm_opp_set_opp(pci->dev, opp);
+			if (ret)
+				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
+					freq_kbps * width, ret);
+			dev_pm_opp_put(opp);
+		}
+	}
+
+	return ret;
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
@@ -1478,9 +1512,6 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
 	u32 offset, status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
-	unsigned long freq_kbps;
-	struct dev_pm_opp *opp;
-	int ret, freq_mbps;
 
 	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
@@ -1492,29 +1523,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
 
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0,
-				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
-		if (ret) {
-			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-		}
-	} else if (pcie->use_pm_opp) {
-		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
-		if (freq_mbps < 0)
-			return;
-
-		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
-						 true);
-		if (!IS_ERR(opp)) {
-			ret = dev_pm_opp_set_opp(pci->dev, opp);
-			if (ret)
-				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
-					freq_kbps * width, ret);
-			dev_pm_opp_put(opp);
-		}
-	}
+	qcom_pcie_set_icc_opp(pcie, speed, width);
 }
 
 static int qcom_pcie_link_transition_count(struct seq_file *s, void *data)

-- 
2.34.1

