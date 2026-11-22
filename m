Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316208;
	b=qHBDt6Yxcy/yqgsOvpFommt1r7uZWRsmJpo6gKkkNIU09jLWX402LkbLBxl/kEgd4VmG
	 nAsglVo8PuxUd0QuqtUgebqiwCvd8976B8367nSW0Qx1CULH+BSFvbkhOneqlypiCVugs
	 X0mPWtk0+9t/wcByZlX9yZpo+qWbc2zH3xizmMg4Qwi7Lo8Dhq8pF3ZnFPzV7SWMCMGgx
	 E2Mt+G/Rwfx8dL0V7Y9KaH1qY7vDLBJZGNA6EnADnDSBHWCzpV5qmEFUjkRYxr+CLdZKc
	 x9RD1VJ+fyj6su/JvyZpGci64S6SFVTzQkMEsogn3iVv3kZcuDfhq9NyC7G/ZseAl7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=;
	b=Q6W9xll7QeG0Eeq9mkqxSAqjXivTVq5+6itf2QfihTZx6WRrtoElss6rOs66pYaZuier
	 Xo48Dl5DRFSxfczyEWcxpgzJRhI4qk9f9+pzPYtZqd3UlT2zj0HAwCOq1O9+vy9+bI3cH
	 xwnhqZZXqsqBPqtzqBnWYgmXvA+63FCvOH0wfV8QtUha482V7JEPG5bvye5RoEDqvCOUk
	 yUAnS3pVM2ax1NzNcrLHB3QLKopl3+4SJF3eSMyR8HSZFB2ifnM4TnXgxOTh9MqvMQKw8
	 AR2FyT2jEcVHGCiOBTyFr041nG+1SJ9cFwTEnkdQYafFnZdye5Z5yLlW3V6rcvu/+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAQ3Ynh9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g+i+kQox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D44606A320
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D44606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QAQ3Ynh9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g+i+kQox
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM08XqP012577
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=; b=QAQ3Ynh9suMLRRUw
	6CDW4cxFy91GGPGeuB7l3KRUkrtuW+FaEc2t5yxjo++y8DamGXFCVVb+C3htk1gx
	KM45X34DvG9ejTgP7KcKYBumpnUPiGvH+6Xa6FdQpsMmsGkACnCoYgIUEJ7i1NFr
	Bo/EvNmKyOGWTP/14K3tO7OBOoHti+bKhHHoHFjviW70xZzFE10NyYqJAWbaCMH5
	GRMOggSCd6AXnwx0F00Nd5kHWscFTZA7xSPDDTvmo02l3u6CZhULB8MnmSjnhWg2
	SMCqSf4VH66SrFDwB0C8zESSCSHmyid4LoEgWM9Ee9iZNs4lzN2kHzJK/n7aI+z+
	LqaCtA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nntwky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so5772244eec.1
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316206; x=1795921006; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=;
        b=g+i+kQox1IpxrBI8M7Q98+KfK4mQF2UHSM1FEj6J2jObnJeWb+zOr50IDAyEsCKrQU
         1LybXon5hUeC49S3/MpSfoUFn0MWv89pcARuQ50qA1XZdZRD7PxelnB+nZ7jtjB9N5Zm
         SrO1J6w7+toCyBKerZjvpLJpt+lxNWkDmZm/4xnXgi1it7SBIv9wAx3GEwKI6tqod7Rb
         vH181tluyAe54uMybHlbVolaFg/ZpG+wgLWSFNcOd+XzRta7A72It7tmQWNbr+lx6Kkb
         JDToRv9ytZNN42qWzBlMGJmwAm3sFtyCfFytoppncEvfo2fjzdxtT6MqcoSl0SKm8OM0
         DVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316206; x=1795921006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1clNjBa8Zrj0xBBvYuEZ7pZMKBdACxhX6qQy1sXV/YA=;
        b=PkL1k3NOhGlYCLNIltsH0e9a4NcCB56oonNVKn+yD8zVbSSXfPaIXGpBBaZQoaNq1J
         pKOGhh8w+2JBKoUqtloM86+0e+fwm92+LvRdcdDZs/eTHKLQhWrTgKoJHWP+fCzHe0H4
         1l/QQFuApP1NtEg0FStZra1qp6/GiaogCHpIo1tI8ne5OnhrbBW2kU6SWWGPk2Oo9N/s
         HEL9gYqrewlIRU3Qv6X3iUorDKCk6HCGMpYJOsmF87MkbP4Vj4AZ2yUB3mBqXH8gYsQH
         3r2Qinu0fTXhRqyZ0nY+nlI2Fx01yBmKkrgolOUA+2/ayfdL3c9tp6Q4CPEnlDbRxyQU
         5LEw==
X-Gm-Message-State: APuU4Z9UyLrgyQbRoFNc2FWr9n8bDzwasB6VZ1UHk4EvNrtDgqp9ohIm
	eO+pSBLE2scFKci0DFFNZVMp2b08I1A5M0LkrkSuCFTNNGPsQ0zXM09fUfMYxcWyVZY5eepDEqQ
	HQ9uYf5WPMU0bXqqjhDpp3oWJ5aRuuQmwfhJTQpoHQcVj72R7hNr4HsM=
X-Gm-Gg: AZFdTZeehaC4Jhu4B0MeHZwppJrq4cS0gkPX5haziejsjStU4xr4mpyheq2bkg1dOU8
	okWGbCNqEp6PMtuTHa9kABt5hLHuwgxCNDtaWUh9DNaaEpKWXixglQAmHxotdOBQuYrrOeRw+NZ
	RUJ7WHcUBYkBsU4qlJVDFbC7ZpSe3Gp6zYyuXzgo+HfDGWgQnydfX6GFmM4J6zl7vmsprG5/B6o
	t79b1ez2deHry17jgHmtKyo2HT9SovjsXrRaOnqVamKGVipcef19l8n/SgLuoJ/47wcjnT7fH5H
	SZqwpaWV0unWRINnFpnssYAIVPVAbaWhg56ZDRGUE06884CumY9bNdBhG2ZYnLqVyM5YjCxavwA
	+kK9WYtYCzQJ7+uK/sqAq5BtiAC/rzaxpE2yaccfsss6gq9cxJvza9X3XOCMLMn5D1KRwNgCtEX
	P6iAPtND/s
X-Received: by 2002:a05:7300:50e9:b0:386:9a77:b390 with SMTP id 5a478bee46e88-3869a77c55bmr4571692eec.12.1795316205963;
        Sat, 21 Nov 2026 18:56:45 -0800 (PST)
X-Received: by 2002:a05:7300:50e9:b0:386:9a77:b390 with SMTP id 5a478bee46e88-3869a77c55bmr4571671eec.12.1795316205494;
        Sat, 21 Nov 2026 18:56:45 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:15 +0530
Subject: [PATCH 02/11] PCI: qcom-ep: Add MSI-X support
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
Message-Id: <20261122-nord_ep-v1-2-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=2569;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mps0dQPLSI1oXXnodqvs4lyheOQWjr7tO9t5zayQPrc=;
 b=MWK9vdASLE0qflk/gtdRDSZdWQXZFXtbdL9B1Q8QY3V+hGuk3FWi/Rrs489ZWn45aX7b+aoCW
 L19aKtF4695AxOdfTdqcsrkRHJ5v3R8Rts4pFIJ8JWUFHK+SGyTZEKU
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX6lgCzsQLOs9V
 gSSP3RiemR7s2HjJx9tNLUDS5vSqumxYNc1zXOYwX9xoVJXNSyguNog+cpQNeUoQwgwxZ4NAB0y
 iRX92tIoKB6KMVZUvXj3+Cd9Y8YAo6Nff6MwIFKdYRhs+t8yOQ85zSc+sUgutN3BqRJdqXlLwh/
 f8rehXz80UIIlIsV6rQHVXjJQWbxyCQjwS2Iz4wUYhxYzwBNz1I9Jy4ORWT6tcDG8rGnBbI8lgO
 ITxWftvflb/aDfcHQOCMt/tH7SL699ddg6eq93mHqAV6HMu//rD8aMvn30/j8os0NL69Wt5iVV9
 meUP2uxO3YezvFCrtFImS9MAecYYPsPAB/nzJzVkhOoZ3iXFrXLli7s0jky6Crs5Rz79N7Rf+gB
 3++AtbBBBuQV8sfmRMaLrAyBbwZn2E+xExw7WCvMcMBMIg7XIr/D5yN9tnk48Y8GZWFIzN7hm31
 v94lJ+M7CIa3tggE+ZQ==
X-Proofpoint-ORIG-GUID: Whe-QPQEfSFa-NV_nIyd16ZcrpVWNLaf
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b0259ef cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EKRowzD1bsybSWocKwUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX+f9ZV1ZaYIeL
 h6/Agogq0EpB/jCyDVdGrAgsFlfRePcGn9Q60I6dR6qbI5ixpZZ90NCY95srGF0WepKEY/HK5JH
 bcwohTm5LFCQr15HCg8kgctaLO83E9U=
X-Proofpoint-GUID: Whe-QPQEfSFa-NV_nIyd16ZcrpVWNLaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

From: Anvita T <anvita.t@oss.qualcomm.com>

The controller can signal interrupts using MSI-X in addition to MSI.
Add an epc_features variant that advertises msix_capable and select it
from ->get_features() for SoC configs that set the new msix_capable
flag. Route PCI_IRQ_MSIX requests in ->raise_irq() to
dw_pcie_ep_raise_msix_irq_doorbell().

No functional change for existing SoCs, which leave msix_capable unset.

Signed-off-by: Anvita T <anvita.t@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2d7ddf8d173f..c794a2207df2 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -170,12 +170,14 @@ enum qcom_pcie_ep_link_status {
  * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache snooping
  * @disable_mhi_ram_parity_check: Disable MHI RAM data parity error check
  * @firmware_managed: Set if the controller is firmware managed
+ * @msix_capable: Set if the controller supports MSI-X
  */
 struct qcom_pcie_ep_cfg {
 	bool hdma_support;
 	bool override_no_snoop;
 	bool disable_mhi_ram_parity_check;
 	bool firmware_managed;
+	bool msix_capable;
 };
 
 /**
@@ -806,6 +808,8 @@ static int qcom_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 		return dw_pcie_ep_raise_intx_irq(ep, func_no);
 	case PCI_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
+	case PCI_IRQ_MSIX:
+		return dw_pcie_ep_raise_msix_irq_doorbell(ep, func_no, interrupt_num);
 	default:
 		dev_err(pci->dev, "Unknown IRQ type\n");
 		return -EINVAL;
@@ -852,9 +856,25 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.bar[BAR_2] = { .only_64bit = true, },
 };
 
+static const struct pci_epc_features qcom_pcie_epc_features_msix = {
+	DWC_EPC_COMMON_FEATURES,
+	.linkup_notifier = true,
+	.msi_capable = true,
+	.msix_capable = true,
+	.align = SZ_4K,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_2] = { .only_64bit = true, },
+};
+
 static const struct pci_epc_features *
 qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 {
+	struct dw_pcie *pci = to_dw_pcie_from_ep(pci_ep);
+	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
+
+	if (pcie_ep->cfg && pcie_ep->cfg->msix_capable)
+		return &qcom_pcie_epc_features_msix;
+
 	return &qcom_pcie_epc_features;
 }
 

-- 
2.34.1

