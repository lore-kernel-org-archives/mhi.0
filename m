Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316228;
	b=ABDM0fRePKTvZRxI7xmA9PFqnDlbO87hdZcligVImU7kXGWO7WjJrdYKmYtbiZ2yxnkg
	 e7NCo+iqFy7HscY8bnSKjb+CQ0HxeE/XWwxu7kU0rnRdQRFKt9D/32/xdK7NuuX6x4Tr/
	 yU+aqJ+83cIRt2c+9cn3jaQGn7avAZ4bRM9LR+oJv740hH0LaxwBGI7JpbQxXiIw1uU8f
	 4YyY+k2I1UWkQd6R5V+cVt7+Wf4uDuxv5MbhPF16vQXNPEBGv79kmTHpWSKHrSEeUQUDY
	 KAu2KnlMnZIZabbRoQtfiUBcx5YuJ6nmgCiYDgIZLwBIX5xOgRxleyiJ8dyPavDb9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
	b=xHfE2HozJLMRUDH1J4Oi0icrZl+yjD+2GzipsrDFYCdY++Ex3Q3fEgfdNMA3/v8UQJyI
	 nlqJBTlziKO70x/ly2+vRvGCUe3zI/7k8RgHjVLxphIkqOP32idoT+cBWCg8s+LGcTTjV
	 Yaaf7rs5GFEmzSNSMEu0A07yuBenXoQmTXLBcbOHfV5p5kajPl6O1ZWKXXBOQ5zdiGh8r
	 ZFmqODdXDqtE+RxDjvU/5pkx2UXchN7CG8hpFXLYOGlbbhsYhphtzpBKbD87clkJ+jJfm
	 +QiCH9XBIMY+i1iq0e2FKmBWPSdXoj+mIo0rA6ijifNlFHEUCUeZtvvqtLwHMcUpL3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYdFd5bs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AfsSMAE4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C92606A32C
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYdFd5bs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AfsSMAE4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08JPu1942354
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=; b=NYdFd5bseRzfCXzt
	d8aJg5vz4MYycLsLY6gJcUjcBbyln2NaS/SgvQPXbQialcB55FHjww2sBKAq8qia
	h6aDB9U+2/CtlVUTvFN/JRYgumvbLqkT90+rz/fxgMTgJDQQtk/twHMy7/ZEnMCI
	evtaU8xv69mJDERv0vsAW0ARveftu4lfJ45+IK9sOOQbWJv+Hqd2ez8FmLg0txCX
	R1kytBO2gZVh8iUOLTb2/2fliVmwqjRz5me772JxUQpkq257V4nwjrO31erueNVA
	IgTJy5ZM7g+5F5GOl9qso8DQyNxq5qOCoMgcH0+zgbs+ysVYmdQoVCnR5s4Kr+YH
	kviskQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h32hww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so3451128eec.1
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316226; x=1795921026; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
        b=AfsSMAE4xFlHINgEPmxWuIPLDqJWN7IQazbZSTtFPZcd6fP+vurGDOf1fSTpjOaL/K
         pWdO5s17y8qQqxCIkeBNPlZ7ZzVSKsAE+z3olCjmjmoQlPa6lOMn6wnXobKA5m/VFAbu
         +LZPg0RCoQF1CVnMfYWxFe1Ahl2UVWehfiQyf3N07AjqoqHTQpOWp9oZ+q1mSfhoLClZ
         S8fKthdos9dp4erje1tcD59lqQ6OmsLOnjMHjlfFiHSsrwejkv0oT5Cwcd0U1SRjCks9
         acAeWXY/4H9ztZRgfQWuM3jNHoK6M/4hUlBE8XtoaCac2nXpmaj1ot3mbciB4Gic5VUq
         K+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316226; x=1795921026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcCSKiEVp1onOIUz37SBkeUiaPNCLwE5jiEgCzuAmSA=;
        b=GykIKhIMSy+pUeUUhQF5xiReSZBUfZPAiEx7GB6lLSke+1AbDrU1AYs8xmV34XpQKv
         kCR+oMk7IkweOFjfxN5THGAVvYr5GCZBlhsWeGqL1i4PHNDzFSowQhUsgEJtSrPpI+pm
         Yp9mJU4E8+7vFQ2qOBzP+9iPqrtxmFm2vs27eQgYigWJ7xjg6O+ObPMzIcBf0DEjt8is
         vvIB1KstBIC9xhi4wfWurpdxUHfi7Mv5EuJmQmGGenRWJ0EUVcGh/eCLxd7YVxJnknbY
         mCSq94Ir7ix6oOmI9cl7da/blTlB9XNglROCE/h0PNkwQ3+wznC3Q4oAsvadS0a6l8HD
         //jQ==
X-Gm-Message-State: APuU4Z+B8XOVdMu9L/oCWYC4JaQZgaddfLDwvoVnmjwYg/EKx9LDlIzA
	BVSxSUJxsoZ8jyw3rfdfdnmxKCVLD3OmadpDlC4f1nl4yf+S6OrhDTmuxeDp7sxCFrYykxjXIXX
	yXqjUIfZae+mx3C5cNrTgZlvpeqNA3tPw+CpGkpazjH3UGHlVLcAleV0=
X-Gm-Gg: AZFdTZdJc/mXbsDTI2xJb209FN9/LDInDPGF/ShZTXfChrKk1C5PvZl4MiXWUPjMC17
	3sNGKXGeV0GfwX09iTZDo+NK/HO+yQ9zA2WINx/uZyHgJCxxp2XEgDdeyY7FZZcA7VHztjfnZ1e
	JSi6b6BNqJ3EaKBqRV1JR/qlqYbK/4fVoDMdG++6JXB11YhEzlvjnLmgVIPijv2UVcLx8jomd+W
	ex8vQE5LKriS7rwg3fQCC3/5zM86amjRtS56t0khXJcNz6Mgcefq++S+DOIV8pv+msT6MvMG+VG
	zYYHGBTX+rsBi0tuxKUgY5r4QrMcX2+VFg4Cxf37RjbEwQquIfAI37xyYsk/VIRC2x27u3dybS9
	gxwhoIlg9SS9ziRqDIjCMLHBmwhX1zh5wJzwzXC2mvPI0KC3LkotA9onxQdJT8vyH9F4RrBz6DC
	6RfVTZ8QVJ
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr5272000eec.6.1795316226440;
        Sat, 21 Nov 2026 18:57:06 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr5271971eec.6.1795316225925;
        Sat, 21 Nov 2026 18:57:05 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:05 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:18 +0530
Subject: [PATCH 05/11] phy: qcom: qmp-pcie: Add PCIe endpoint mode support
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-nord_ep-v1-5-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=3245;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9UVXub4tyfQyqAJ5iLairdqM1PlMxztFvo8mRpY4zlY=;
 b=/xrnyvXAlwvkroxvh1fh6Ne6gyQ24oDqJjVsXBGs8mljggskqwHJ8AW9eNpwHn3irT19BeiYT
 lqikiJvdKZZCrCsuPpUawQ1VpjJCazPuc8cDV0m8ITn42MGHDQw3421
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b025a03 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n6AvfDos_TaM4Tq8RocA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1yMs_ZDEft6JGLvzF7zXuWhI3oZVEGwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX8lzz6WmM3uxA
 m6cG4a4BvhBfwOfYiO0WNJHCs2ut2iBzR4m9qQql0x7SRWaKIiHl7m+ip9WXYPkPNlJQOvHyAQJ
 rCWKZ+i3MVy+6X4ZsKNHs9M5ps3xt/yZX8dJaw313UP4bN1e7gOiBB6WCBFb2FlR9AkVEgcVWwu
 NW7doAM9H7Lj6xQRW57g8moEYL3msqBnFbhD7NIDBMJI20IgJCMZ8XlW/pKydwsmm2lH0rdzSEv
 yaLTcsuTVlOW/q80px+2tV91eih7yPTLndXrq1K6Y4jmGjnWghtzms8MuXoO0VCVfJ5o+7kzkNd
 90QlWL6p0Zjs+4KwS3e+RIWOt/wvOLRzaYBvaxx0jA0RXOZY7KEeR3NQ6i8tDzCr+14u/c0Jg6C
 5KO398MgCKKDPHBqMCM4+Xhmmn0B7kxxqXR+wCxEzG6nkzbwN9uBQIbEOYanb++m9Ax92hHV1US
 /ITvzgtFai9aH0a+GwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX+napGLiBFe96
 Cdnn8zsiSCHkDcMSfSlNjCGI0mACKvnIvEM+puAg+EvcPRPPaSwLY8lUki+HNZgiM0HQZ07kox2
 9czYQWozBx9dhBZ5HPnvSPQcfYSUXW0=
X-Proofpoint-GUID: 1yMs_ZDEft6JGLvzF7zXuWhI3oZVEGwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

The register initialization sequence differs slightly between root
complex and endpoint mode. Add a .set_mode() op that records the
requested PCIe submode, and an optional per-config tbls_ep delta that is
applied as a second qmp_configure() pass over the pll_common/txrxz/pcs
blocks when the PHY was put into endpoint mode before power-on.

Configs that do not provide tbls_ep are unaffected and continue to
program only the root-complex tables.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index ccdb7748a9e1..21cf6adf7d60 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/pcie.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -89,6 +90,7 @@ struct qmp_phy_cfg_tbls {
 struct qmp_phy_cfg {
 	const struct qmp_pcie_offsets *offsets;
 	const struct qmp_phy_cfg_tbls tbls;
+	const struct qmp_phy_cfg_tbls *tbls_ep;
 	const struct qmp_phy_init_tbl * const *pll_tbls;
 	const int *pll_nums;
 	bool port_split;
@@ -121,6 +123,7 @@ struct qmp_pcie {
 	struct reset_control_bulk_data *nocsr_resets;
 	struct regulator_bulk_data *vregs;
 	struct device **pd_devs;
+	bool is_ep;
 };
 
 struct qmp_pcie_multiphy {
@@ -930,6 +933,7 @@ static void qmp_pcie_init_port_registers(struct qmp_pcie *qmp)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	const struct qmp_pcie_offsets *offs = cfg->offsets;
 	const struct qmp_phy_cfg_tbls *tbls = &cfg->tbls;
+	const struct qmp_phy_cfg_tbls *ep_tbls = qmp->is_ep ? cfg->tbls_ep : NULL;
 	int i;
 
 	for (i = 0; i < cfg->num_regs; i++) {
@@ -957,6 +961,15 @@ static void qmp_pcie_init_port_registers(struct qmp_pcie *qmp)
 		qmp_configure(qmp->dev, port + offs->pcs_lanez,
 			      tbls->pcs_lanez, tbls->pcs_lanez_num);
 
+		if (ep_tbls) {
+			qmp_configure(qmp->dev, port + offs->pll,
+				      ep_tbls->pll_common, ep_tbls->pll_common_num);
+			qmp_configure(qmp->dev, port + offs->txrxz,
+				      ep_tbls->txrxz, ep_tbls->txrxz_num);
+			qmp_configure(qmp->dev, port + offs->pcs,
+				      ep_tbls->pcs, ep_tbls->pcs_num);
+		}
+
 		if (cfg->port_split)
 			qmp_configure(qmp->dev, port + offs->txrxz,
 				      tbls->port_split_post_cfg, tbls->port_split_post_cfg_num);
@@ -1179,9 +1192,22 @@ static int qmp_pcie_disable(struct phy *phy)
 	return qmp_pcie_exit(phy);
 }
 
+static int qmp_pcie_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_pcie *qmp = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_PCIE)
+		return -EINVAL;
+
+	qmp->is_ep = (submode == PHY_MODE_PCIE_EP);
+
+	return 0;
+}
+
 static const struct phy_ops qmp_pcie_phy_ops = {
 	.power_on	= qmp_pcie_enable,
 	.power_off	= qmp_pcie_disable,
+	.set_mode	= qmp_pcie_set_mode,
 	.owner		= THIS_MODULE,
 };
 

-- 
2.34.1

