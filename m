Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316241;
	b=xzt1HOz6FUr1DqDv1G0V3OnZYdf5z9yj1gXRpqH5UgFzG/o2yd9D32LL2M87CLrbDghz
	 IGv29so+ps5sQN0/+bpQVIsYpWyzY7X5eliqWiO899iDYfw+cWoizuFTQBJqXAVMnkQNU
	 IsvsUHd+a1aIY77gZPMlMPm4GQlSW3f3a732yiogD5YCmNm8HuRuug0SZDfQFp1ufRVv9
	 0HZS7FuAn/HbeVULjYgNgcSoqnJeMG6mihB2yGIslKpIIGJwr7RKjqBApVygkXbNtk0s6
	 3r4/tzcLePPqiHqwbe7nNCE0vbf+Hz416/1v3TdSjTrkCUuccZDGsCRlBa7r0eW78Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
	b=HBzN8WMtxuFKkXCcT/ESnd5nU9F6ccSZ8bP9zzX1PIEutPdI4UCbL3g/sUCrV1S+vEr2
	 tk+0kOXpVcxrxM3i88dJtUKJ6rWNAZeQwIqyenU4t6RmMZgvMy8+UtmUlKOI9LBxkfkzU
	 6KBCx1t5pwNY4k4ygbPzqNNBIMl1QLHEuJEUQdSup1h878CjCO+djIliP9rrtsMo7J+q0
	 Lsqh/k0e6adU82bmIJgkIxhE1uppBpPz1r9BznyDaIw86mTvRJyoR9LjqhLAUfrlo95lK
	 v/op2+KON7CKaidSjgK414w35u/r2O4bVwzwv4ANlxsFPgmtHzOibqPvmHxI5LpCYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BT39TlH3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GXd/ZBO9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822C606A320
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6822C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BT39TlH3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXd/ZBO9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM0AWk52911162
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=; b=BT39TlH3EBk/ld49
	JlixeU1hA0cxiL2kEiY6fmbgKiIyJJB1u8jLSkwOTiFoOVAVkipG31qadW6sB6qv
	vj5esXrGlHynubmJj/UNOn1dOX856oSo4fPOp2uUZd2jpPknF/2vKoFF8kYBtrd7
	JTapXEd+CIhdUzrfb7DBUFnpfyfBYzRwgLwmwAEtExxpVu3s33wqAvVH5Ky+fbym
	gkxsizMBeAgx+CKUjSzORpDDuPueOF7aJQnUkAHDHwAq11zZFZX3V26CrMF5a3m/
	AU7DJ1jlD16OTURtTS0czTaEbdz+TkPT/UJkp5PkweAQF69ir5jqstzTjaBvPUYq
	C2nS5g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fau23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3684789eec.1
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316240; x=1795921040; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
        b=GXd/ZBO9scBMyOFNjbk164HsF5scUCcuq8ZnjIY8TpuVAVp2cAMY802o9RXLxsREi6
         nKXbAyQlQwIXFTHcTLowekhsN4cNrrOuDM/XIGJJmBcpIA+f4KcJ4oH7TYeDQwoKdlEh
         f6gdkSCbMp6zEEsqP06q/QEttnTnhoh5ukENJRbGlqvHad12YVPusWLpWBYvdQm7D4op
         /w+XUqjQKSz7z9lVsE/6Tzq3zj+ixKTS6+Nhf0E5QSBlWpa8eySFA5tN3UYl3XXk5nCj
         qgL0d/ziujBoGeMu054BvqMh3J3vUyfDn0gKhZXR+IAxm6kAKfOlxKZ1FWWAGgQB351m
         wStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316240; x=1795921040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
        b=G5OwpzISHt/bhFs7qpJzN97bdEnUt74CXifprrZxfbKD3kLRTvTXxpXYHA5BVQI+mn
         r/fiGkMZvyvH09eXVTaBZ1FbXvorH8rhLSSwPhsK7Zqb97puIMbrI2bK2KkxD986uSLK
         Le3HmrvaN67i/B2tXxjEN67SIyt4j2VnE16eD/+4pyWGNOprzFlMRQUG1Ma6pKGZzDDi
         nY9d7KApO29s9ItfOnt7pPqtWZpidafaymfAPRfw5Tcxl1bmLC8/nHLlFXfGEvR6zMAn
         fcgN4F4vYF6TfV/3FKEWWagQAez+58K5nxllB7Znk5VrKzh39Y/nm1vkZ3wDUo7kHmnd
         m8oA==
X-Gm-Message-State: APuU4Z8XF5bUVKCiExRHcfpDSoZ8P7eZSs5s8ObqEBR9PKKTz0dJ1BAT
	slnOILQuo4G+4xsboFrK3i+Dm2CgFwzGJczaErcqNcTTtBCeAZhszsCFNkdNqe8dgjRnlMyqx50
	HY6xLbX+MsktsuF2IS77revpgKadbSaEecdaiWEEkmWIC+cwSzMt059w=
X-Gm-Gg: AZFdTZfOh3xHhY1/5zArokqKtfUL3VRwALoL3le3flFxNLsO30jn4a46/irC8cPwMrd
	uBvIRTr3D9zWpqJwf1BZBGE9o8iXuZoUf7tQu/gDglPGUkxFv3/sesm7w35LFPb6MdsDsjw1OTq
	iXv5fOsGGBcZIiemYtqm4y370T7oc53iizpz5B8XvpPApirTCCbJ+djZes9JKBg8irFG6QbNFlg
	iAxGxCBKl6n9sB+w8n46USDb+fhvF7yc3jXjTWIpiQp6arx5JvsWzOIlRIWTwi1sfxeRnc93gON
	N89l3Rx5dHm0Y+gt9opVLeFZgxKUMLC+akkxLJVBqoBfwFKdWSS8bTuj6U5EyjwQ9o2VQxSZjFW
	COgyUC8hUg0HGbZ0t5lGA+UVQB7mYxB4nshx7S7yAwi8sm0r/z7Kpxr/EORX+TyUXhcLyFame9q
	5YNyfGNsPz
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr8559632eec.40.1795316239877;
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr8559612eec.40.1795316239376;
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:20 +0530
Subject: [PATCH 07/11] dt-bindings: PCI: qcom-ep: Add Nord PCIe Endpoint
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
Message-Id: <20261122-nord_ep-v1-7-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=2668;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JAHLcpWrndJ7vGe/EsN0GzNIf7dKlfRU1FzcikKsx5I=;
 b=kghpNVosYGIELkZVpk17V4n6t4JpVd1dJQKucE28HGajI72vINW5LpLNGFPaZ5JvvIGM+RkW8
 7mmpI8gxDj9CTU/PNuAn3ONGLtnOSFqxRWzq6KRvIPQ+7FGZS/vLPe7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX541UHrApl2Rv
 FLRxKJ+l990aFFf+baF/J8acN/nXqh3tAe0giC8JQEig4U0yDNTZv4NUSNbvhti9YIOXYx37wRd
 OoJOjvYl7p98nTZLp7glD+B31MpNBPhCcUHnEQVf84C5vjmJH7kBOF6yCp1gEVRVAxT8b0vQlnO
 bcmRhtEyT7c7pvsYR7w7FsvEpHUv5ds4pFpvT+F9orAPeCvWJPX3RlbZNVBwRVlw6A24PU7uYFL
 iqTy64BAmxNH9PDWDXhw2xPcwHtG8shpz59t7/Ud5FCRpE8tTU2kV15DTvyaQJiIbJQs1g0QLPA
 nPTgdSCANcI9tBhd6k9v+I9U/1kO1Om7jRniANm+Q/N2L0q4Oa9i2GaCcnmnM0AQH/5XeUEYm2C
 hrAxL4CqyYq8QOz0PuOdVHBW1S3NjQFc84VlNyPbTvfjRX5qmYYeiMkOEzAQKHkKFGqlxa6twFG
 WEeEIo2yrO4+Qt3LrIQ==
X-Proofpoint-ORIG-GUID: CMN0WSdaWhQIh0rPOhDJfIopaME1IUnc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX/+4f7qvFBXKl
 DKZPa03WdYbqZsgJ4OHsGJnKLto2SckTNbmlhBND2qYNZcedLxv7IuIXP/LtqrTIJmvMQWIE8L7
 IWIt7v4omfuWy8xtton+/dLgaMhvuXo=
X-Proofpoint-GUID: CMN0WSdaWhQIh0rPOhDJfIopaME1IUnc
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b025a10 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FC_8z62UfPBbNpSbB3cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Add the qcom,nord-pcie-ep compatible for the PCIe Endpoint controller on
the Qualcomm Nord platform.

Like the other DMA-capable controllers, it has three interrupts, requires
an IOMMU and uses the same five clocks as sa8775p. The instance that
supports MSI-X additionally exposes a dedicated MSI-X BAR as an eighth
"msix" register region, so permit Nord to carry seven or eight reg
entries while leaving the other controllers at seven.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 38 +++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..9a6a7f6f7f62 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,nord-pcie-ep
           - qcom,sa8775p-pcie-ep
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
@@ -31,6 +32,7 @@ properties:
       - description: Memory region used to map remote RC address space
       - description: BAR memory region
       - description: DMA register space
+      - description: MSI-X BAR memory region
 
   reg-names:
     minItems: 6
@@ -42,6 +44,7 @@ properties:
       - const: addr_space
       - const: mmio
       - const: dma
+      - const: msix
 
   clocks:
     minItems: 5
@@ -185,7 +188,39 @@ allOf:
           minItems: 2
           maxItems: 2
         iommus: false
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-pcie-ep
+    then:
+      properties:
+        reg:
+          minItems: 7
+          maxItems: 8
+        reg-names:
+          minItems: 7
+          maxItems: 8
+        interrupts:
+          minItems: 3
+          maxItems: 3
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+      required:
+        - iommus
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,nord-pcie-ep
+                - qcom,sdx55-pcie-ep
+    then:
       properties:
         reg:
           minItems: 7
@@ -263,6 +298,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-pcie-ep
               - qcom,sa8775p-pcie-ep
     then:
       properties:

-- 
2.34.1

