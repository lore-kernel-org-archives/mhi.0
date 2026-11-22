Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316215;
	b=bJLbfO+G6cC3C+pQz79BlcJ8OJRb4ewXPS8v75HPXsxsl3E30UW1vX74EamwiRhbZJ9T
	 v/F9XMu+xJJcOrqpIz1CmU4gQt9IPIeoK8B5Pwmx+a9JgaSjw/Ol/UIbif8mrkoirxsEt
	 F4jpVYf6FfF09vrfMDtvmcP7abNiiXtF3NRp8exI60Qs0I///xC1T1s98b4q0M/CXQFH4
	 Fv3CwCYy4OR4tjLGPwDK7pko1oKzdeHoL3bcWHKlxBXCKlyDKa9ck6wXmyngL5LZDvJAe
	 cnDvBLmXPY1vaDe82cdJHWb9xdNtmt6/3mjVRACJQMttHdx0QKEK1mesGWwooeCw16Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=;
	b=MuDPWFh0/JrtWdy1EFuL965dmVHqwzMF+x5yK3NjaR4ZLKQoQukV1yWWT/UWO4s8BPLZ
	 4kTc1CHwevAA0/2jVQaPBjibem1OHHXjKhJG2UaFMvm+icATiURRr1haNdqrmb3M6dfHA
	 y0Rm8I5Hj0PO3VCfTC5mphEl+3wVpTf1HpoHi9IqsSlbdMO2NnlZnbL3C0VWM52vZGHJt
	 tka1WLTvuFDTZm8maL2ChfeIvX1ivLL4eVFN3ed45ji5C2qGF+1gsBJqa3aNpTrasRH9Z
	 iBkr4TYa3hP5kVOp1+L4pt2Gwmlvqrn/jU/aNromIer6Ef0uu6h9KSNDTIm0NKpbFjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqWur2w8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVwqj4Pe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763DA606A32A
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hqWur2w8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVwqj4Pe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07pTx2173018
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=; b=hqWur2w8W55NOte0
	25+pYAciUDWJ6ENxlF9RXINK4LY/WDrdolJH+Gf7l0EpY2OB+vvE4kH9G8WRejTp
	MKeNetcdLc65tshrOleXckPJbR95hqM8UtaQ22Wp3dCHPnwSUEKAH72qEPERq/lG
	0WPiM4EVzMxsBpvIpTGv5wUABviXAIzloOwdlQKs9xDuiyrTwzbSUyy/KedHYFFZ
	FnfltOlw7BEgQ03SBlkWiGCa604MP78dPZxWAEJ1j9AkbxUs4CSyHPfxzws7ccYd
	fDQXRW6mRmAnCtX8oRHL5jVeh8AxPVV90rYb3/KlFOLS3iE9sn1S1BzfI+piiZqK
	iZipBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rtq3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3056417eec.1
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316213; x=1795921013; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=;
        b=gVwqj4PecjAFfxyrvXr38N9/cK1GiQdQEtGuSxLQO6wY81JPn/TPT6ZBJ3ZcXEqkPs
         DUYTJ7z0M01LaivUWSn4VY9TdA2mOJJyFQNArfy29yx2R6OU/mmv1DVtTujW58+w/bWv
         jD2GRc5eawIzZEZWE5CjLXoro75ErO/EwUFnYDKAUcYBgLNminPZqYAozmBmbd+BRbLX
         U9vQyvlGxcgUNP8zEm6FAsaFwJ0fHhRP4IRehdV8vOnIbO2ekej3aHFos4LtuzQ9pMrL
         Ti56+VRAgsEqxPiZLAznI+RfIvlAVvIavJdC3a++3Iqc5fLXpKL7KDqBnv3R837nBKcf
         1VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316213; x=1795921013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNOKzPAn7+pXWluGC2/bHKGOVozO2Ky26vVL4ckdzBo=;
        b=b6IiEPsbyARXrCD2iRe5v5Q4bg9UAwz31WGnf4J5jMH9GCUdNEIk3bJ79+6GPX+Iuj
         pKD4fcSmlNYS055OMJAg7WMw2kRv403gb7PUKB0mnFCiAuN4/JRWAyu94IPe8iX57LQw
         gZhZ1OTy2PLwzySp4EgrcZRfF6LI82CjMBmlZR23WNJ1YoZawnklpfPex6tdpJiL0uCS
         RBRBw6Yi4qWqvVeYm0o3/aHTzM3u+zFzIrgwMDC8TlswXuh/+04nAriTBhqoQdnxyxOI
         pHG9+Ep+KXFq+wd6PKZ2PB5LsBhr1WcH+da3ttTqSNtV4cq28DfsKz/95ZzPs3tMvZNM
         OnrQ==
X-Gm-Message-State: APuU4Z9lrUfQ4B+xBhoWTU1ZBfCKiwVzVsKKX5Lnl0gSHS+kr+tcva0r
	TRhKyS9otfSR0OQgoQrbEoA2ulkLMQbAL0IDPA8u372JY2zPIDxJDp3fkYm/04ww5ig3tz7Uxs5
	lR0UxS/LAX9OO+T+oUFlCyM1TzBnSRgCO0xuPTGfQqir1lLLOBT6H/mw=
X-Gm-Gg: AZFdTZfMnhax1LU764V4WeIMfbnoOtDu4to60IEbIw+BQtsvruME4WPbcT5VLAPWLZP
	ZSIsjkbc3/UqQunyUtbFV9spTYljCAYnRrTxX6rmb0JqFVTMa0JQE5xQLeUL2NjL0+96xUKkO/v
	wdwxsKKVtTw17kXVgaCFJXX4AgX/VtbPau4ya2LGv5lOgrzy1PjRoGPGzkd5H6OaoSkIYBwCIxx
	dJdLOves5nzmp2Y9hN4QuokZE5r/Bxpe6/Yr35rE7n6Ynujzp+WxUcG/32uZSZ0YY4tgLwlXCg/
	9bzH77Rf0YLoBE8wWwglrCXzum95dxOtMRnThn7/ZZa9X/JO+uAKqxI1V0SH9HPtdOQRhV/CEsr
	8XTBAXai9u4wuAF7umOh0Dsc1TqfOjFFr4VJqIf58FAUYOnsk2H6RWxMGGyzOMdnukNRdpa+8Gx
	1zl5YJAy84
X-Received: by 2002:a05:7300:e9ce:10b0:385:2564:c509 with SMTP id 5a478bee46e88-385700541a6mr9071421eec.24.1795316212989;
        Sat, 21 Nov 2026 18:56:52 -0800 (PST)
X-Received: by 2002:a05:7300:e9ce:10b0:385:2564:c509 with SMTP id 5a478bee46e88-385700541a6mr9071403eec.24.1795316212484;
        Sat, 21 Nov 2026 18:56:52 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:52 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:16 +0530
Subject: [PATCH 03/11] PCI: epf-mhi: Add MSI-X support
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
Message-Id: <20261122-nord_ep-v1-3-6d8839ffa9aa@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Anvita T <anvita.t@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=5864;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=7QjmuTlVRoKXrIZssiDHzu7/1X+z/zLg7WzPuVHICII=;
 b=A+SSmX+nlmQiS0zohEwoQRgbuhdqSdqltmeiJRJ4cuV6hvQdHXPdssILPJFHnDIKWCA7pMPvW
 lmYm2D9QhSWB0lAbIJnkZ+p401ZCAT36i2ymGTzuXi+p2JBNrfdJLcM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX0I8ISmCKW4nf
 evfez8xJ9GrrMS+/YKrqfDsEDweeu9MdI4HF69xkYhefFBOH6uR3XDw1pHOXmCMTX5p45uS/txJ
 MLNz5Lw0tURcxzBqsarVevw3QuH7ncg=
X-Proofpoint-GUID: qsYDc0c1xgAR445elGCy_DTmxZM2q1zL
X-Proofpoint-ORIG-GUID: qsYDc0c1xgAR445elGCy_DTmxZM2q1zL
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b0259f5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aWPhZf5PStJQkATrKZ4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX0JoNws7gdBnq
 1gZ4qK9nM2WVsAMSYPJydXllXoPbTsL+34D3FOPfEfV91DWj8GuJBvpqQphagAwwyfQbNDSH1RI
 6oGbFeOMIn+ChrqWjw23gHmWFFzDsn4rfKAghGI/m/5/VsIgLpWsvLWMoMcq1O73M6cNyhE8nqU
 7bzqXTgZEBN2sxR9IoI6KBeKNYWUvFU0/yJzpv0H2y+ZKOGXxAxAPL7HIiFnO34zByegGlLqCNv
 1V8oqf13qIFGL9xSqaE/9fF1LlgmFZQQP4s7YvxSJeiEwCSTPI6bWL5153EnBuv3M89IqX4iTHV
 xSdoxGKfAB5FXU3jHOw6FTk9izTGoqHQ7YUsUGXBGP7ejBN32NMf7f6WeMV4nQbr9Q6q3ihmxh7
 s0Z+O00mKAhdi9G82gX3RDSvTaBgPL+KXWK3sTt9mIkXbqRKnLzG23tDxMSuxeSwOQfGt4TgQCE
 bVgkqmqRjAzO1EZNtmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

From: Anvita T <anvita.t@oss.qualcomm.com>

Allow the MHI endpoint function to signal interrupts using MSI-X when the
endpoint controller supports it. On controllers whose epc_features
advertise msix_capable, set up a dedicated MSI-X BAR (BAR_0) from a
"msix" memory region supplied by the platform and program the MSI-X
configuration.

The "msix" resource is optional and only looked up during bind; it is
required only when the controller reports MSI-X capability. At interrupt
time, select PCI_IRQ_MSIX over PCI_IRQ_MSI based on whether MSI-X has
been enabled by the host.

Fetch epc_features earlier in epc_init() so the MSI-X capability can be
checked before setting up the BARs.

Signed-off-by: Anvita T <anvita.t@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 54 +++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 52cfffcfd5ca..a8765beffe06 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -148,6 +148,7 @@ struct pci_epf_mhi {
 	struct mutex lock;
 	void __iomem *mmio;
 	resource_size_t mmio_phys;
+	resource_size_t msix_phys;
 	struct dma_chan *dma_chan_tx;
 	struct dma_chan *dma_chan_rx;
 	struct workqueue_struct *dma_wq;
@@ -155,6 +156,7 @@ struct pci_epf_mhi {
 	struct list_head dma_list;
 	spinlock_t list_lock;
 	u32 mmio_size;
+	u32 msix_size;
 	int irq;
 };
 
@@ -230,12 +232,16 @@ static void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
 	struct pci_epf_mhi *epf_mhi = to_epf_mhi(mhi_cntrl);
 	struct pci_epf *epf = epf_mhi->epf;
 	struct pci_epc *epc = epf->epc;
+	unsigned int type = PCI_IRQ_MSI;
+
+	if (pci_epc_get_msix(epc, epf->func_no, epf->vfunc_no) > 0)
+		type = PCI_IRQ_MSIX;
 
 	/*
 	 * MHI supplies 0 based MSI vectors but the API expects the vector
 	 * number to start from 1, so we need to increment the vector by 1.
 	 */
-	pci_epc_raise_irq(epc, epf->func_no, epf->vfunc_no, PCI_IRQ_MSI,
+	pci_epc_raise_irq(epc, epf->func_no, epf->vfunc_no, type,
 			  vector + 1);
 }
 
@@ -714,11 +720,40 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
 	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
+	struct pci_epf_bar *msix_bar = &epf->bar[BAR_0];
 	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
 	struct pci_epc *epc = epf->epc;
 	struct device *dev = &epf->dev;
 	int ret;
 
+	epf_mhi->epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
+	if (!epf_mhi->epc_features)
+		return -ENODATA;
+
+	if (epf_mhi->epc_features->msix_capable) {
+		if (!epf_mhi->msix_phys) {
+			dev_err(dev, "MSI-X BAR address not configured in DT\n");
+			return -EINVAL;
+		}
+
+		msix_bar->phys_addr = epf_mhi->msix_phys;
+		msix_bar->size = epf_mhi->msix_size;
+		msix_bar->barno = BAR_0;
+		msix_bar->flags = info->epf_flags;
+		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, msix_bar);
+		if (ret) {
+			dev_err(dev, "Failed to set MSI-X BAR: %d\n", ret);
+			return ret;
+		}
+
+		ret = pci_epc_set_msix(epc, epf->func_no, epf->vfunc_no,
+				       info->msi_count, BAR_0, 0);
+		if (ret) {
+			dev_err(dev, "Failed to set MSI-X configuration: %d\n", ret);
+			return ret;
+		}
+	}
+
 	epf_bar->phys_addr = epf_mhi->mmio_phys;
 	epf_bar->size = epf_mhi->mmio_size;
 	epf_bar->barno = info->bar_num;
@@ -743,10 +778,6 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 		return ret;
 	}
 
-	epf_mhi->epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
-	if (!epf_mhi->epc_features)
-		return -ENODATA;
-
 	if (info->flags & MHI_EPF_USE_DMA) {
 		ret = pci_epf_mhi_dma_init(epf_mhi);
 		if (ret) {
@@ -763,6 +794,7 @@ static void pci_epf_mhi_epc_deinit(struct pci_epf *epf)
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
 	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
 	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
+	struct pci_epf_bar *msix_bar = &epf->bar[BAR_0];
 	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
 	struct pci_epc *epc = epf->epc;
 
@@ -773,6 +805,8 @@ static void pci_epf_mhi_epc_deinit(struct pci_epf *epf)
 		mhi_ep_unregister_controller(mhi_cntrl);
 	}
 
+	if (epf_mhi->epc_features && epf_mhi->epc_features->msix_capable)
+		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, msix_bar);
 	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
 }
 
@@ -880,6 +914,13 @@ static int pci_epf_mhi_bind(struct pci_epf *epf)
 	if (!epf_mhi->mmio)
 		return -ENOMEM;
 
+	/* MSI-X BAR address is optional; only present on EPCs that support MSI-X */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "msix");
+	if (res) {
+		epf_mhi->msix_phys = res->start;
+		epf_mhi->msix_size = resource_size(res);
+	}
+
 	ret = platform_get_irq_byname(pdev, "doorbell");
 	if (ret < 0) {
 		iounmap(epf_mhi->mmio);
@@ -896,6 +937,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
 	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
 	struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
+	struct pci_epf_bar *msix_bar = &epf->bar[BAR_0];
 	struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
 	struct pci_epc *epc = epf->epc;
 
@@ -912,6 +954,8 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
 	}
 
 	iounmap(epf_mhi->mmio);
+	if (epf_mhi->epc_features && epf_mhi->epc_features->msix_capable)
+		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, msix_bar);
 	pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
 }
 

-- 
2.34.1

