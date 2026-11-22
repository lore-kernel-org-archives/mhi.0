Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316248;
	b=YlGOlPB2Ve7znyJRFKNze91yrvOatFOSf0vnqo/ZzICfUBzVOhZTYS9Q6qPlR0tF4nXu
	 0p8Noops6nZ6bnCGXyYMTXEsXxaOUpdefZKsiDrCntZCJeimjEhU3rq3YPnmCBXKLZd/M
	 XMJQVuj/o8teBK3xmqt5lcbKMzl5stHQt8MRpd6YcGgllnKM8BEVjUjS+va3QEgl3yFfH
	 89G0cHNE+FCdXlRaDaUSFjBEnJKwe6f6Y25JmQA/0Y8DfEM642MHm5KA/tys0aEZtJ/Ya
	 gWAZws20ZUWVi78ZlIKuoYe7y2qK45SGx5VryAFB1o9BGLBDOMULcr9oaou+/FvjKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
	b=b1fUGz3Ar+6NIevKmbjGY+cTGN4x3TMAGgTI39fAaJWKjlpf2RtslO+sEctSbLLt/JyE
	 +8CoG/ybhNW+4eHTBgVF7YWIIfDqlECyElcoaUhrifZWnIALsu1Y1R0J8otliZuGcp39+
	 vFaeGrLINQsLzXeQ60btPrY8qeQd3H7ounuMXGvAH6ynWcq009TRlx3EcjR7M0qk4NUvM
	 G9lG495nPLBZhQXsyKVjuic6yRqoZPkRZNlqz6V+AHyHQuXyX3xfixArUm8IM09RRY9U7
	 ffG4DM5e4W3+J39tkj9VYP7YDuCNmffmzLZJjqBEAbpzvK0DBC8kh9/ysLNcAY4QfKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6b0b8HD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iMlAz5r5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB4606A32C
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADB4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6b0b8HD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iMlAz5r5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07xH62905614
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=; b=M6b0b8HD2sPhLeBY
	jXuvp/a/qLxkQ7r5of+7u2ADjaAfbj2b4xwIWqrZ3WpqxtYRwIqQpZuEgBKfcTqf
	uSm5ixUGONwINRwBWAlMJXiXN2BYbwnXLu8+ULDJiejyBkmT8Op2IS7IjD6wBL6/
	oosyd57rRVkf9FUpZSWsfP87yoMQRd8/lPA8hTQau5RLob7TvJ3wjb0ATmrES4gO
	x5eUYBeVST8xAphouK3defcfQts34woq5TEuws+WIC7ri7+fisjY0cUcPGEG2BcJ
	ePpQW9siruXVVnkOW3a4a/21haYCET1Q9SlrsoF/LDvddxOf8ImD7TaEw+NNRiYc
	0Zeblw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fau2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2518205eec.0
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316247; x=1795921047; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
        b=iMlAz5r5ZVLEuWTrsK0f+1b3CfIsENZiftLLLH5dF9FDW6fFMBENVJbLW5ZplmDBDz
         LCAijO71xP5n+W5cPltgIgUO/eal/x0knjoMWJLYZoatvcMraJOAHRE04/Kr2r3meJxx
         t1Rqsh3AW+GZJFvN2fvOgxKsS16gldzU7EU+Ot6JyWbRgVmq1DWqAR3mpi8NvLKMyTHZ
         wLh/hBiv3VL+73Di5vNuUT0rI9YTjgWrh3Qv1m5oaG++gVNu3UdKYzAmBVbBLodwVnRe
         CWRxLVQ2tTHd1SDsWlHJy4oLAg5CIlYGI9MAbLF2+e+pIRbly2sZcGzBQIdOUV91VnWx
         qDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316247; x=1795921047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUnnvu0xCaV3U5iYbpyqDcnVkGmFWOVxP0+69AyZGoo=;
        b=iI+iB8wcTgjMeqX8IWhHsL0mJ2Q5kvk/15IqpyAPhJDnQMqo0CVE1SmsBygc/fQzjU
         WXeu2U3w3wDpppWI+GJRVWI/ohWGJ5RjpOcImRzv9nFl9BgkSOxvlY5jliYTGC84ohjE
         To4j2k2vzWxiMcz3wbuyecKGKbclqjobCHfN1VdmQNmS0DNtcMIc0vw8Hxwm5ww6fnMv
         HDWn89Xel2qhlpucx1DtLSy7CIiKPnbQ24G+xHTznWQCCAVSs3JZmtZbljX0Cg2782DZ
         l9hPDMvKOkqx0oZwKpweGFSBGHM7BHIEMdjk7Owyy+r+26mTEmxl2jPn6vBN3fbTLOJb
         LsgQ==
X-Gm-Message-State: APuU4Z+1V3Y77vSxG9YbuVdGAXMfK6Vrf6S0+t7uns/IOGz2JaPL5aUv
	rb3TGtDFwa3DA7uNSTVpVKqWke4y6dlG8Abw0pfEa2SSWOe7rmz9lUaAu6r9g0dfpyl/Mk2hp8I
	Ec5/XEwUc8PPTzeWcmOgY/SQkvFa3WW33l+TKzf92eY+cty8nTR9sSEY=
X-Gm-Gg: AZFdTZcxKSyBmxWQjsXT8ni2nrj1cHQCBa6UR4qiZUPi+gV5P4zDw97BMSt4HcdRj1f
	wBiqVjldqW70fuC7n9/xPCQT4yaOWrHXbhdReUc4kW6AYJ0tK6MC9+jcQoc+bXQYhrsvB/ueGHD
	Kd9qhVWCkXTrv50FffoxfaUNvpB8VG8AwVUJdvaACGFYOIQlzdO/8Ld+PS+Ytln99hDJaZ0X21k
	Airk0wTh7r1CKntyApSVNVQeh0KeUgJfWpa1CG/x10vmCOI3g6qjUhRUCiIxFx04v+Xxwwn4zOq
	6j/PQFMmxejmoFeqwoupaPWjJ8WWqTUGEM4O03pvN4moGULmiOLZmhj7hM71FD9zZrG8pV04nly
	vUo9LBcgpZPQWpth5pHDdq84iT9h4LyC7dZDxmIgatL84l5de9D2+RBU/JaRYlqlsuwy0fUZlWx
	PBvtCHDkY8
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr9002396eec.33.1795316246585;
        Sat, 21 Nov 2026 18:57:26 -0800 (PST)
X-Received: by 2002:a05:7301:a0d:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-38570847a85mr9002360eec.33.1795316246085;
        Sat, 21 Nov 2026 18:57:26 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:25 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:21 +0530
Subject: [PATCH 08/11] PCI: qcom-ep: Add Nord PCIe Endpoint controller
 support
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
Message-Id: <20261122-nord_ep-v1-8-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=2371;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8c0qizR+vJDbUelP4aajkaF2bPuI5eYuJiK1wGZgORg=;
 b=eL5h/o95qzrBD5KJbEm5L9/kOS4P75awELLFLbJl7PPCl/p6djtY0NQoswJCEy282rRHN84Rr
 loGzYvTNdqeDDKu6YWBkPsCtU/wYJPe9jTxYfL8UmXHrmhT875SEVdd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX5cACP7Xjk4hX
 8y/jSVMfqz6lz952zOmnub+wBWiyzIPKf4FA5slzFWEZYvOqCPXKxqrX7uZXC530Xk1D01h4ZRJ
 WXZxPBIMuIrAVOrvD/tyAHfEwpqDyIrZJhLAGQa9CnORPbySdfyHgOt4cfpNJUc2GnQviStnCBI
 wP+ijowphlgQiAPYUXdVBlVBjMN2vl2kv+sY3IlAgmNTYVUpeYxvmHpHtBZBQuh85TSd+QOwwnr
 riybvKvAjydZoVdLu0k0bbP6L0pwXZtyy51x42jNUMnlp5X7DfLKPQlwXzygfsM/SzvUvDLkTGJ
 ubCiuLvd0MZjwj8+x/m/PWJd98wJdyk+UP9ztIEC/rcSkc70O4tiqklrWdvn6Gj68/Ugj6xZmEZ
 WDu/asD0UWYpAUHlbimH/bS2MH7i7svnSZZcSfjOvvV4i4kTeBKZpUSjq4Tr9ctGXCAILFuDw6+
 Dl888pz41M3y6M8cJnw==
X-Proofpoint-ORIG-GUID: DbQp2418Y8cDXbLoVdLzUEVFdlB0TLhf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX7+QxZGSWOAfL
 t++SASLfgTfmIwTSh3J5JQN3+5eIwx0XBmAwCc29/PweViznZskNdqXxektG9HfNPjHPcZk6LrT
 VoXtn10NG9eopGifcmI1f/fA3uyRRTY=
X-Proofpoint-GUID: DbQp2418Y8cDXbLoVdLzUEVFdlB0TLhf
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b025a17 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=v3XsYOnbjY9NYLbxQCcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Add support for the PCIe Endpoint controller found on the Nord platform
via the qcom,nord-pcie-ep compatible. It supports HDMA, overrides the
NO_SNOOP attribute and disables the MHI RAM parity check, and is MSI-X
capable.

The Nord HDMA block spaces its per-channel register blocks 4K apart
instead of the dw-edma 256-byte default, so program edma.ch_space_sz
from the SoC config.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index c794a2207df2..661bd8aac7cc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -171,6 +171,8 @@ enum qcom_pcie_ep_link_status {
  * @disable_mhi_ram_parity_check: Disable MHI RAM data parity error check
  * @firmware_managed: Set if the controller is firmware managed
  * @msix_capable: Set if the controller supports MSI-X
+ * @ch_space_sz: HDMA per-channel register space size in bytes. 0 selects the
+ *               dw-edma default (256).
  */
 struct qcom_pcie_ep_cfg {
 	bool hdma_support;
@@ -178,6 +180,7 @@ struct qcom_pcie_ep_cfg {
 	bool disable_mhi_ram_parity_check;
 	bool firmware_managed;
 	bool msix_capable;
+	u32 ch_space_sz;
 };
 
 /**
@@ -903,6 +906,7 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 		pcie_ep->pci.edma.ll_wr_cnt = 8;
 		pcie_ep->pci.edma.ll_rd_cnt = 8;
 		pcie_ep->pci.edma.mf = EDMA_MF_HDMA_NATIVE;
+		pcie_ep->pci.edma.ch_space_sz = pcie_ep->cfg->ch_space_sz;
 	}
 
 	platform_set_drvdata(pdev, pcie_ep);
@@ -984,7 +988,16 @@ static const struct qcom_pcie_ep_cfg cfg_1_34_0_fw_managed = {
 	.firmware_managed = true,
 };
 
+static const struct qcom_pcie_ep_cfg cfg_nord = {
+	.hdma_support = true,
+	.override_no_snoop = true,
+	.disable_mhi_ram_parity_check = true,
+	.msix_capable = true,
+	.ch_space_sz = SZ_4K,
+};
+
 static const struct of_device_id qcom_pcie_ep_match[] = {
+	{ .compatible = "qcom,nord-pcie-ep", .data = &cfg_nord},
 	{ .compatible = "qcom,sa8255p-pcie-ep", .data = &cfg_1_34_0_fw_managed},
 	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },

-- 
2.34.1

