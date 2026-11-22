Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316261;
	b=kTmEBT706a8yZiUBtsAKZHtnME6ZYbo3figaVstM0a9G5f/oZ4svbJN1swLgwedkPRFd
	 tuq68IZ0oGZTcYqKQ/7q898Hn5aohoWIlbIneEZk2IhjQu9yijH6kkxhcGbMgeN/82syk
	 p6GOmtFVt4E4VKYlLiu1ou4yrZ0CAInc1uUPtKRRU15YtQaSjOkzIVDaPqRUBKX51FWZ5
	 pdzElnt0jjupDOF1X1GFM+TtWurjVR4e8TCznSMyIPFPJl2KK7mHbjBBzLuTtI4pZrGoM
	 QLBvjXyawW/wGotosvshuBS73sMmALkR0GUJIeQfcnlGUhrKy7znt2YyKBkEx/ARIkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=;
	b=x6Oajeopef0E5v+tFwAINniygC3zpkhZWx0+KRRPnIJzAhpNLZN8ruRwaJ2yiw00DsTf
	 nYBKk7x5gMoHwmY4ZRtc4LSJWOtKLdU7LVvGwSgijKY+PpckHmz/9+As4AMEWNOwvqHlu
	 5Lcmp+EnBahmfGWenOua3g8baYxVMugpcCK2slSdT2rFeaKBDzGx/Q0Bw5Wmgee6xdkEM
	 Sii3uj15/HJpDxmtO7+wjmUy6L3137Xt7++qzEYwRC4pTxmrKdlvOTmouoPIzS3/FIOMm
	 Z1ofZkwygtHf1tpsjMQqQUrZwBgEKhNa1Z89K7rfyIIqSp+PVUDT82BRkHdkGPCLiRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GE/At4Qo";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i/7eGoKY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58867606A320
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58867606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GE/At4Qo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i/7eGoKY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07tp8270184
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=; b=GE/At4Qo7h5pN6b2
	Hq4t5NqVmxcIzG+rKO5E6zYPYTDTO9abWEdyi0wTiDR8NvZ3oxDK93zPan384Yem
	LkAEI9M5o4OnlaBx9lpi61C2fzX0BASMgCj3w+3Xo4jYZkwTYXNEtPz08uXJHPgp
	3G03OPZlA//wZx52V9ex0v0dwDJ4i+UMrpCMiMTfItsAKKEOrcuNfU/2K1mtBA96
	9i/MXRNgPaheSVzOgUrxoyebhWbDluBr51j5JhPKkkt+uF9xn2lS9nijnfL8r7Gh
	ucYWZmAX66MuX5KoPZd19NhRRkpMx0Uy40Fm3E75a7v2GHmX62t3JZkbDlhbfYL9
	Oq7TXQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk2cmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so2841310eec.1
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316260; x=1795921060; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=;
        b=i/7eGoKYowhj3o6yF4i/0PrTmpF3Bvw7rwJkMvPBNYSTHMNiIHM44akSUNK9VtlR5G
         dtP12GOWmYedKD5RgULmyYR0fZelnGWNz3AWml5HeubTnnAlhvOKvr6ZlTLIUbRNPFxl
         BRrOalpfW1nYsOjrC+pUKu6IynGUuXAutKdBcetP3bM22PHbNNT0ByZ3Gq0B43pefbN6
         5FL6+Umj9mAwtbxjYoCGVK0r6FOaBGLL1AszWY72P8b/oeP5fg2/Vw3fvNKbB4Dzu3RO
         x2M5U90uXUkqHoBZ9uaXSJQiKTApr3jiialthcDL0lY1qAKLDAoMb6q+35PrIJDQ05Ny
         +AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316260; x=1795921060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajZ9+9KtJUTTKAdnFhbIdGT0gBjexH1+YfCI9PsJIPc=;
        b=UARRHF+adpGnwFjNiLm+HZXwMU9MtVNJ1Vx7fOzO6DdJ2VCOrbSB3tKbp0rOmjNy6Y
         Us73D5pGaAw9I2yebKAXR5kt1n38EgBqxvghp79GCfA4DjOGBH5sclrDgmPp18PUTAx4
         zGYDLn7jjH782Lp4A0+i6iekBVdZP9qnFTx+FShEax20GodbVTZLMhPVA6IpcfKS+PVF
         DUCZJ/VqRVE+hGo/2JiXQzDgijmLfNMbZGE5zNHfNqdxZHa6QnKZolu4ei2l3TkJFUGZ
         MotcWYpZHn2ROYsHwG1Rr9z+PznlrjM5z/5Lfw54gaJnZSU9L4HGzyq091aM2hNG+IjG
         PArw==
X-Gm-Message-State: APuU4Z9KyIzyPfgvPIh56rI7A0UMXqgwst3YglGRkQKTbfir+MaCqmZY
	jVK3o8E/ftGESqGru+j9/efzO4ILu1X7lqR2f9zxKc624rLLlvu7yj9CUNxTmZwIV44U4zxL3Js
	iThvRsilnS/bTXLoHECJLQR0ma7e9ZusHZMNZN7KQKJoFVx3UwG8Xgt0=
X-Gm-Gg: AZFdTZcBrhyAOLx7k5DbMhESQJ1qUA0ykg+CFaMjCBf+Zu57ddzsCfHIzQmQeJbVtiX
	Bl4X5vw0D7Fd9bT8NDg8mP3k/Xt7j7lYACaVMO6RjjCMtJrsA69SGO4Zxq5eAr4Z4r0ORLo1cUs
	Pbb7HGEb0SnSpnRkKDdrjalOca/etu9vLNvg9nr1rR4O5NmhDLaegrV6kRC3kN1eA3nSwgypkjW
	C7BMDXLsvXyThXaL31YUx00ZuzDTNaRZldEIVzGrT9Zn+OmrX2n/3tNLKvSDL9cZkWSrFrE58vo
	vRcTk5GxVF8akZiE7GnLbGiQs8dz9zcQrKhkfphSKLDXWMv+k1YwicO3Wr5KeMjEWwvpnxpeW/g
	VXa9k+1Nk0puYyM18IK3tcSVWJmaH3QR2gT5tzyrj9t4nrKnde53qKaGN/bl5r6s3Z4rmZ0kFkK
	cBGeH5boDH
X-Received: by 2002:a05:7022:f51b:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b5568af41amr5927485c88.23.1795316260013;
        Sat, 21 Nov 2026 18:57:40 -0800 (PST)
X-Received: by 2002:a05:7022:f51b:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b5568af41amr5927456c88.23.1795316259479;
        Sat, 21 Nov 2026 18:57:39 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:39 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:23 +0530
Subject: [PATCH 10/11] bus: mhi: host: pci_generic: Add support for
 Qualcomm Nord
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
Message-Id: <20261122-nord_ep-v1-10-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=1704;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mxFfCYSZbkYPAAgKqdymawNDYArxhGIJNHckvlEpvaU=;
 b=oUzExgrBWSn/PJZCJ0tHQmMjmfUaXiqNmMvt8aljTqHa33vZFBIIrcxrI8RsDB0GGv7RBkKtN
 E000wZ2y4yTBS2JziFrJBs47LDsZIqxbgtl9PQ4SPSizSQ9a5ESRSGJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: d1qh5o02XGpRGIHG8L6WjXwuS1jD1Zj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX2E0w1vg1VFjg
 st4s1sWaazxZNvylQQlfPFQMwchyySSenppK51CLj7Okdd4iF0HZIb5nIHa+00L969viIy4WRIr
 1SA3juyQGG4eJmW+/MKshFYEB2HpKJKSSw6gsk+oA1Vs1twVTMW4444Jx/8KYuDFO6qSp5UEJ0y
 Yq2Ujlf5vBTkVmc9Yk3RNu8NSahsn9H1lyozYuH39IUv1BBn7QkmvNY7iUJ+V0UklF9fQyUsfoT
 jGPGA3KRfRZmmIEk7V7A5JcyD8koBXBNfGAQFqEuhGLNLpRdmTx+LHUVXotqXakD3HD1dRaNshW
 AEBLOWC5six+aKfPRuqHrXaowyvGk2aVp2YRkO+6IQzl1Zi49lrUNzSkwSXkmwgdmWvND0Hp8Rd
 DTLgYEam1jm/nU42XfpiSltCmccXuLy2BEqU+WKb6BI8C3rdWRioCfQvIGOZ3bYoy6WVxmNpDA3
 Dh+ddPBglZLsuCfwr6g==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b025a24 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX0fVN9rhNenfW
 6VB9DTivGw4+E82BOo1ybXbIROKSxrIwsQyOkmb6yIe4Um3ppe+uDHr6T+rO8FoL/F0Xdz5mue3
 4YQn5Z/IgiSt2t8az1mB7qEvMg767bM=
X-Proofpoint-GUID: d1qh5o02XGpRGIHG8L6WjXwuS1jD1Zj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Add an MHI PCI device entry for the Qualcomm Nord endpoint (device ID
0x0120), so a Linux host can enumerate and drive it over MHI. Nord
exposes the same software IP channel configuration as sa8775p, so reuse
its controller config.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index ca9ef4aaa014..65201ec8dc76 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -383,6 +383,17 @@ static const struct mhi_pci_dev_info mhi_qcom_sa8775p_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_qcom_nord_info = {
+	.name = "qcom-nord",
+	.edl_trigger = false,
+	.config = &mhi_qcom_sa8775p_config,
+	/* The endpoint places the MHI registers in BAR 1 */
+	.bar_num = 1,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_sdx75_info = {
 	.name = "qcom-sdx75m",
 	.fw = "qcom/sdx75m/xbl.elf",
@@ -966,6 +977,8 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sa8775p_info },
+	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0120),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_nord_info },
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },

-- 
2.34.1

