Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264051C51
	for <mhi@lists.linux.dev>; Fri, 19 Jan 2024 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705669253; cv=none; b=LUxozDJFT6LIHv7WHUX43NgZ2Dn2O5ckwCPPka+bQHFGlN0wpitWed2ArBsp7Ap7jmkCpi3Ko6STl4RDqCN4W7keIJ3F3Utc77NPRx7JUUnrNK4q3KpkGv5vwNtfpkRnCKrm2wsN9JgDIHiHNdUOUOAr7H2nC1gaMfmJD+8qHUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705669253; c=relaxed/simple;
	bh=ySSyqcQxdsW+4zvFqSstzsLI4j2exxYuuKilwTiZSNE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EIlC+owiRyJ+UoJ/m7QeohLn8LM3tlF1cf8DPjQdLflXaeL9ZqYf/r/Aydo+CvkRB/upyp+vw0sTsntMX5f/GP/p9pp5sjTBaMn0QTu6ZEq2mVzWfItarLDGiU9JVR1RoNBMuD2m6ANuL69DRbYao5Mhb+PpTOujxiDULNOoZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QdSBS0C/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QdSBS0C/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J9e1fF027461;
	Fri, 19 Jan 2024 13:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	qcppdkim1; bh=HOkC9Qsk1CN9mhUJ8LZjR3ZNzVxEp6Ds+kHJyE0E5fM=; b=Qd
	SBS0C/6b0zsbsAUqlJqQHI6wUQQMbVhuRCms2pIK+M97389OTKrbAoISIgM5iEW1
	cx784TSvFQKDlogFixWU+d8FZ9c+0m67ZVqpzUsuBxLXU6PAGWS8NOtnGanwfYW3
	Xb+toVo5dRMi3kg2huZ/A0F5CbLnMz+ZGNDhevAGbPm4YmTrTsOKZmhqthyH9Y59
	vkl8+Eq6pLWX53RBkveE9aUYvwgYECIYErJA3vGkBMuH37IGLExtOJ7JzruqRR0Y
	OmBUma1y0WsJUE9h0lLpOrcfqC3aT7zQOpXRVOoE10qWV0JD5UO+xiy4ml1mI1yh
	GsrNKLUspvZufF1aU/IA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vqpkvgbky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jan 2024 13:00:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 40JD0Z19023753;
	Fri, 19 Jan 2024 13:00:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3vkkkmtgr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 19 Jan 2024 13:00:35 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40JD0WkT023724;
	Fri, 19 Jan 2024 13:00:34 GMT
Received: from hu-sgudaval-hyd.qualcomm.com (hu-msarkar-hyd.qualcomm.com [10.213.111.194])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 40JD0Y2q023744;
	Fri, 19 Jan 2024 13:00:34 +0000
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3891782)
	id C9210273A; Fri, 19 Jan 2024 18:30:33 +0530 (+0530)
From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
To: vkoul@kernel.org, jingoohan1@gmail.com, conor+dt@kernel.org,
        konrad.dybcio@linaro.org, manivannan.sadhasivam@linaro.org,
        robh+dt@kernel.org
Cc: quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
        quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
        dmitry.baryshkov@linaro.org, quic_krichai@quicinc.com,
        quic_vbadigan@quicinc.com, quic_parass@quicinc.com,
        quic_schintav@quicinc.com, quic_shijjose@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: [PATCH v1 1/6] dmaengine: dw-edma: Pass 'struct dw_edma_chip' to irq_vector()
Date: Fri, 19 Jan 2024 18:30:17 +0530
Message-Id: <1705669223-5655-2-git-send-email-quic_msarkar@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com>
References: <1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WlzlZGLYn8B3rU-ATzMvi9l1ccD_fOIz
X-Proofpoint-ORIG-GUID: WlzlZGLYn8B3rU-ATzMvi9l1ccD_fOIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_07,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=863 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401190066
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

eDMA client drivers defining the irq_vector() callback need to access the
members of dw_edma_chip structure. So let's pass that pointer instead.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
---
 drivers/dma/dw-edma/dw-edma-core.c           | 11 +++++------
 drivers/dma/dw-edma/dw-edma-pcie.c           |  4 ++--
 drivers/pci/controller/dwc/pcie-designware.c |  4 ++--
 include/linux/dma/edma.h                     |  3 ++-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 6823624..7fe1c19 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -849,7 +849,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 
 	if (chip->nr_irqs == 1) {
 		/* Common IRQ shared among all channels */
-		irq = chip->ops->irq_vector(dev, 0);
+		irq = chip->ops->irq_vector(chip, 0);
 		err = request_irq(irq, dw_edma_interrupt_common,
 				  IRQF_SHARED, dw->name, &dw->irq[0]);
 		if (err) {
@@ -874,7 +874,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 		dw_edma_add_irq_mask(&rd_mask, *rd_alloc, dw->rd_ch_cnt);
 
 		for (i = 0; i < (*wr_alloc + *rd_alloc); i++) {
-			irq = chip->ops->irq_vector(dev, i);
+			irq = chip->ops->irq_vector(chip, i);
 			err = request_irq(irq,
 					  i < *wr_alloc ?
 						dw_edma_interrupt_write :
@@ -895,7 +895,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 
 err_irq_free:
 	for  (i--; i >= 0; i--) {
-		irq = chip->ops->irq_vector(dev, i);
+		irq = chip->ops->irq_vector(chip, i);
 		free_irq(irq, &dw->irq[i]);
 	}
 
@@ -975,7 +975,7 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 
 err_irq_free:
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
-		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
+		free_irq(chip->ops->irq_vector(chip, i), &dw->irq[i]);
 
 	return err;
 }
@@ -984,7 +984,6 @@ EXPORT_SYMBOL_GPL(dw_edma_probe);
 int dw_edma_remove(struct dw_edma_chip *chip)
 {
 	struct dw_edma_chan *chan, *_chan;
-	struct device *dev = chip->dev;
 	struct dw_edma *dw = chip->dw;
 	int i;
 
@@ -997,7 +996,7 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 
 	/* Free irqs */
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
-		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
+		free_irq(chip->ops->irq_vector(chip, i), &dw->irq[i]);
 
 	/* Deregister eDMA device */
 	dma_async_device_unregister(&dw->dma);
diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 1c60437..2b13725 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -90,9 +90,9 @@ static const struct dw_edma_pcie_data snps_edda_data = {
 	.rd_ch_cnt			= 2,
 };
 
-static int dw_edma_pcie_irq_vector(struct device *dev, unsigned int nr)
+static int dw_edma_pcie_irq_vector(struct dw_edma_chip *chip, unsigned int nr)
 {
-	return pci_irq_vector(to_pci_dev(dev), nr);
+	return pci_irq_vector(to_pci_dev(chip->dev), nr);
 }
 
 static u64 dw_edma_pcie_address(struct device *dev, phys_addr_t cpu_addr)
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 250cf7f..eca047a 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -858,9 +858,9 @@ static u32 dw_pcie_readl_dma(struct dw_pcie *pci, u32 reg)
 	return val;
 }
 
-static int dw_pcie_edma_irq_vector(struct device *dev, unsigned int nr)
+static int dw_pcie_edma_irq_vector(struct dw_edma_chip *edma, unsigned int nr)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	struct platform_device *pdev = to_platform_device(edma->dev);
 	char name[6];
 	int ret;
 
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 3080747..7197a58 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -16,6 +16,7 @@
 #define EDMA_MAX_RD_CH                                  8
 
 struct dw_edma;
+struct dw_edma_chip;
 
 struct dw_edma_region {
 	u64		paddr;
@@ -41,7 +42,7 @@ struct dw_edma_region {
  *			automatically.
  */
 struct dw_edma_plat_ops {
-	int (*irq_vector)(struct device *dev, unsigned int nr);
+	int (*irq_vector)(struct dw_edma_chip *chip, unsigned int nr);
 	u64 (*pci_address)(struct device *dev, phys_addr_t cpu_addr);
 };
 
-- 
2.7.4

