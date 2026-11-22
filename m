Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316193;
	b=0qDeyMH/p3OmZLR94Bt1DOdupb5brGecNAUT/Lf6SERndUO6vT2XOr+/Fl/Vc1ntAAR9
	 CdlZOGnA2Kz4kVruZYdUkeSbZqJfpzpPv2nsD5+9ZAwkbbsp65vN2r3ma66jyj0ILRA1k
	 F++rlTDmY2fQBBrcoSwuGxyw7biwF1A/WcvHWM5U0rA3PXxwz9/YCnKXUYKpOJisX/T95
	 qTVlHKqAcmegFrjSqGc/ISx40pqeDp0fc3QnjXR3Zc7xOG0D+lXCDvba5Mnx1CnlvCYqX
	 toGb2k8Ils2MSXXkScGzVffK1Dpm2PFVb8DQWdmQAyxHjhZ733F9zqT1ech8CsFMgWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R3tSSWYPQrETVDjfSFXNDw1wYtJcf93mV9ZliLI0xY4=;
	b=UTfjRjXe+GjLnUxMSVgtmGumDuHRWTxQYXSy6+ZjisXELC9bgWPFcIevsn4MJWMukUcH
	 p8mw4zrmzJ012qz9EeWtuLDcUhaIBgSy6igKVGWLJSBq8mQQZxHK6Z/LlngNXQ1TJxXq/
	 Rv77UyGtYqpQ/83D/60Wn21jFNhANK2Y4iKxj0usl7+aYnYZDmJ5gdw68qU9CJLpQVuwt
	 FVeIcc28wXQlooXzkaYXwH9LoxJuUgVnh2syJbml04pkpXDqbH0kEor1GjNa/JJ8F74hJ
	 tZJwbJ6ginGxcFTiHp6FgiR+L0rADysvpfqA16EvOizwjMFFKKprLE3AzQSM+POuAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XGilMkxt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vop3coup;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C42606A320
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C42606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XGilMkxt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vop3coup
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08Z1e2174285
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R3tSSWYPQrETVDjfSFXNDw
	1wYtJcf93mV9ZliLI0xY4=; b=XGilMkxtU5MPR2MdQvH5iyCExm2UtSoU4z1J54
	+lTV8+vUGMTIWNOPN1Sm0MzWa1hzHm2j9w9O9GjMgu9dCt3iNPS4mijr7Y3IfT9V
	Q30REE4LuUUbit1Xg8xL0k7aTTkeKKgpyXZGwAVJDYjis9Q+SAD8HxCl8NDwzUBS
	RRdyhZc/rgOUJPMaI95vsOL/AqtaVww0SA/E6pL09mPOlruOPOiam2CoHQpKNuWM
	+ONevSO6lLvqatKZS+skhek/f1LU2aGYa5NStgX/DWn5aSrTqTX7ATagS4OIT6PK
	VOiVTSDOWhNmYq1t9qvuzNINgSbam/IecjKt8COxVWEcOWWg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rtq27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so3450636eec.1
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316192; x=1795920992; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R3tSSWYPQrETVDjfSFXNDw1wYtJcf93mV9ZliLI0xY4=;
        b=Vop3coupHKvF/SOa5UtDzpPK4mYqtEsNTkCFnLrWDgrqfVHAfn3DOPg/wPSWiCSZHv
         65Xo3BUPbp+9RLTay/La0wzlFM+tD8VkmLu4bvL7ubgo9UWhEnCR9WbFIjQC8aGP/tT1
         Lf62uI63oADe/Astrs+/XLQuKAj+ti1okRuWPDem5M5YvSJBKM5pUrIfN4KV0dsWgt1r
         SbeFmp631sEiKxO4S/HWJN3OKQtos5U3G+Na3WBJlhA3qb7cPQhu5Wo+bePb9WRfjekG
         5i8R2WKflTy8+oO+vvDxeItCjkUN/zK/bzm+IWnj4MAvc1KAFXHBUng6UaYvi326PWFV
         8fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316192; x=1795920992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R3tSSWYPQrETVDjfSFXNDw1wYtJcf93mV9ZliLI0xY4=;
        b=hi6Vs3a/s9IUj10Jusxv4MiSw/78+nzI1TuuyAgngnrgQxqkpBKZtVLIuEORmctjlY
         LRfoK/WhLohGsK8mU/XKA0GrMV97pnWvxkXe5bNpym5Oylb/DPn60DkTew7SbeCkfeZ7
         fDuDAu8j0d5SgQh4v7uGYO7enCM12kwRTtLmrb9Vas1kHKtgy8pes1RtcLUhF/IfTxqs
         47sXmHyAjhpF5xGfQq8+znmDYIuydPFgFdbIYSjDZHvwKcOJNNi47oXrzlRGgd2BkONq
         wmqWsd+TAxn6wkRNHQ7tSQ9y3FTKzkNW4W5dYIM4miH2K6bB7f0DEnYwIFjwkxbJ9sNK
         i74A==
X-Gm-Message-State: APuU4Z/p4EEFsK3rCCmTMYo9lnfuB7H60WA58htBVtGeQ/O8Z8baekSk
	q95ADucoDtb0lNKrwM/RtmW/gOun+/HQ9n+hDh4wEz6WUp7b7yMdxGfwdnLfjnInToIg0b2Z/EU
	4kzk+HcTzQBaK+O4YU5+NgfKZTz2H9lVyerqIBMUJqEhM4JbUtURbK4g=
X-Gm-Gg: AZFdTZdy1sxN1oqsInD+EFfIPYbWyDf40xBN/2WKptfoHeLA8wkTvrP3raFa+X+SLZR
	wmbpssxyImKdhqeK5g2mNNLCq7VxGgiy32P4QUc2TqzlJ6EbZBdO/w4nZ5DCyKjJ12CkpdxLYNb
	Y5Pn76J8/EjdE3TDLZgiOUisfgsrmwES3UFIJ/MNv5uWIaZzHYzFa6YFplCoah8PNYxjfzm7vTW
	hJGMgJ7eKdsGmfeCjhM8Hrlg6LlwoBb/y7SbirXkgg6OTPg71ebbOH9ov3mFQfzyoSJAKij/mkN
	iY2NDUsZEMt0JuS+LSl2CMjLT3PFvX/Bdu/WMdvx8BkJF3BJtokar+s+Hwr2h05/TKMfBblgM+l
	tRDQE55SrzrvQ4AIcKb8tK0F7DzJ9FUSZcUeVOY1CFTRNLp8zg1Zv7m6xq5Fv6LHt2bhTC81WOg
	tAcO047G+x
X-Received: by 2002:a05:693c:62db:b0:386:a7e6:79c5 with SMTP id 5a478bee46e88-386a7e68253mr696567eec.12.1795316191695;
        Sat, 21 Nov 2026 18:56:31 -0800 (PST)
X-Received: by 2002:a05:693c:62db:b0:386:a7e6:79c5 with SMTP id 5a478bee46e88-386a7e68253mr696514eec.12.1795316190850;
        Sat, 21 Nov 2026 18:56:30 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:30 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 00/11] PCI: qcom-ep: Add Nord PCIe Endpoint controller
 support
Date: Sun, 22 Nov 2026 08:26:13 +0530
Message-Id: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAM1ZAmsC/yXMQQqAIBCF4avErBPURVZXiYjUsaaFhVYE0t2zW
 n7wv5cgYiCM0BYJAp4UafUZoizAzKOfkJHNBsllJbhUzK/BDrgxV2FtlW6M4ApyvQV0dH1PXf8
 7HnpBs79zuO8HGfC76msAAAA=
X-Change-ID: 20261027-nord_ep-f6e8d7b9c107
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=3900;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=II104LFoYUY5bCZ8dL7uJ2flJ9MTEs2ATqgjrm8Rkco=;
 b=Ntg7aOOnLDOr1w8i2c53tVY/kOb0lH6r/CYyPBiWkneCkTr/bxCvNhbKpjfNZoLJIvOXy1+8+
 Njf0+TGjGSaAZ4mMQbKmueG1j92os4RS3EA/8VCY+R3lSnJ76GNuoQh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXy9s+BAutUSrV
 9bt6OZNI15y69y9EbADjgwnpz80q9O4syEJu4XJLyxlaO7qmUKu2Vqbl5/7sgGF4v+mRd3ce84I
 huwELmKCFbtMxqnzPtTaPtRtck2PhW8=
X-Proofpoint-GUID: ceH4qelkJdtBaD51FXcxteQA2JtvH240
X-Proofpoint-ORIG-GUID: ceH4qelkJdtBaD51FXcxteQA2JtvH240
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b0259e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Isxxj8DTuwmncN1cjOwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfXz6H57rFbxSCP
 lWPjKSokt0KSemBA6yQePCqSgvNTkLdrmFMHiqqNrykox0LGAn0T7z3bq0C6qxFLOTxFb5e3gOj
 ou8S0objD1UGQIJFmUrRifkKi/9OFsNYU0HnlN3hnWdfU5VhEFV9r0APqQyg6fGyx2iPvAjVHKw
 gmQGAajAzo7diRSWSF69w4DG/mGtWP6Rye4xUM3GMd+1atCnv8xQd86g6AHsKYJqqwAXzHG7M66
 syQDzTsGjGxlVgpgIW2kLao3cKqAx0ODQOReeNOKuZa5Oi+v17hw8JVUxT5rYFatuxsQSjol/77
 u+BHhd+uQtTePQQpa+T9LrVtp9brt5lZd1AqJrfto1ggrkzfmhGw3bXHiWW2lD58rJcFosGd6Ji
 QrWvtwrO1dDXPwUhBWKxQTcAKH/c5PgtAEwZ4g1cQtp2iKlGzWEvsIkvxGW9CuofIz5+88dFf2d
 MkoM6opijYjxSuXDcUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

The Qualcomm Nord platform has four PCIe controllers (A/B/C/D) that can
operate either as root complex or as endpoint. The root-complex support
was added earlier; this series enables endpoint mode on top of it.

Bringing up endpoint mode touches several subsystems, so the series is
arranged as a set of generic, independently-useful changes followed by
the Nord-specific enablement:

Generic (useful to any platform, can be reviewed/applied on their own):
- PCI: epf-mhi: Pass the actual number of MSI vectors to pci_epc_set_msi()
     Fix a pre-existing double-encoding of the MSI count; a prerequisite
     for the MSI-X patch below to request the correct vector count.
- PCI: qcom-ep: Add MSI-X support
     Advertise an MSI-X-capable epc_features variant and route
     PCI_IRQ_MSIX in ->raise_irq(). No change for existing SoCs.
- PCI: dwc: Preserve glue-provided eDMA HDMA channel separation
     dw_pcie_edma_init_data() hardcoded the HDMA channel register
     separation (ch_space_sz) to 256 bytes, overwriting anything a glue
     driver programmed. Only apply the default when it is unset, so a
     glue driver can describe hardware that spaces the per-channel
     register blocks further apart. Builds on the recently merged
     Channel Separation support.
- PCI: epf-mhi: Add MSI-X support
     Let the MHI endpoint function raise MSI-X when the controller
     supports it, using a dedicated MSI-X BAR from an optional "msix"
     region. Falls back to MSI otherwise.
- phy: qcom: qmp-pcie: Add PCIe endpoint mode support
     Add a .set_mode() hook and an optional per-config EP-mode table
     delta, applied as a second pass over the PLL/TXRXZ/PCS blocks when
     the PHY is put into endpoint mode before power-on.

Nord-specific enablement:
  - dt-bindings: PCI: qcom-ep: Add Nord PCIe Endpoint
  - PCI: qcom-ep: Add Nord PCIe Endpoint controller support
    (HDMA, NO_SNOOP override, MHI RAM parity-check disable, MSI-X, and
     the 4K HDMA channel separation via edma.ch_space_sz)
  - PCI: epf-mhi: Add Nord endpoint support
  - bus: mhi: host: pci_generic: Add support for Qualcomm Nord
    (lets a Linux host enumerate and drive the Nord endpoint over MHI)
  - phy: qcom: qmp-pcie: Add Nord endpoint mode init sequences
  - arm64: dts: qcom: nord: Add PCIe endpoint nodes (disabled by default)

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Anvita T (2):
      PCI: qcom-ep: Add MSI-X support
      PCI: epf-mhi: Add MSI-X support

Krishna Chaitanya Chundru (9):
      PCI: epf-mhi: Pass the actual number of MSI vectors to pci_epc_set_msi()
      PCI: dwc: Preserve glue-provided eDMA HDMA channel separation
      phy: qcom: qmp-pcie: Add PCIe endpoint mode support
      phy: qcom: qmp-pcie: Add Nord endpoint mode init sequences
      dt-bindings: PCI: qcom-ep: Add Nord PCIe Endpoint
      PCI: qcom-ep: Add Nord PCIe Endpoint controller support
      PCI: epf-mhi: Add Nord endpoint support
      bus: mhi: host: pci_generic: Add support for Qualcomm Nord
      arm64: dts: qcom: nord: Add PCIe endpoint nodes

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      |  38 ++-
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 369 +++++++++++++++++++++
 drivers/bus/mhi/host/pci_generic.c                 |  13 +
 drivers/pci/controller/dwc/pcie-designware.c       |   5 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  33 ++
 drivers/pci/endpoint/functions/pci-epf-mhi.c       |  74 ++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 123 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |   7 +
 8 files changed, 654 insertions(+), 8 deletions(-)
---
base-commit: f3ad6a695e245798f9a5bb34f2c7616880bac3d6
change-id: 20261027-nord_ep-f6e8d7b9c107

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

