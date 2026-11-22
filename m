Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316221;
	b=zgKGbj3VFhBj0EOlzGYHbrl8CVDaN3RsW+dHcjP+GbULRcuEBPtkKWC/z0VjlEUFS9+J
	 kmIXDd0cZdyeo4bZfuGNU+lJtcIr/649sAmHf4CBfgi/oYp2ex3pamimcCuog2TQXgBpb
	 OMjIAqJ3q39o72ilufMv8eFHYfVN9XDJMlfm3v0EqlUVQA5V2TzwutKOWth0LpWLQBaDN
	 8/4FgVeLV0Qm0lPg3JrV4C31Hl9ZMSN+3E1dkdH2mATTYzpAjEF0RHSRSmmeh6AmdQjVJ
	 pk67J1ulkq6Uqb4QQ2K8NlY/zQKXNfGa70f/qftJR+OiwNRoEIlzwAfGp9313aNRByQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
	b=laiMrHH+uuY/8y8pUE9HEFjc8vQPXWbonLtZE4ui2K2WQCMKbO38JaXzqLpsj/TtFZPW
	 n77zbi3ajgHACZZF4TfqS6jrYZdnxi5d+TkRcYM56dK6qwF3ywJW3u/pCZKLGOsWkBoH4
	 aBk3S6kX5x8u1usbevKOFRPZ/AGPyV8VuAdH4V7skQlByKuwnLOo50dmGxjc+FFmSn6sn
	 PKd9D7VtlgLLHNyfS/NqrpTBSKJWu+23oM57iBpCV+OBo1+azxAqH6dGSp5RTqr+pRHCe
	 jPac+61tXWx4LYFtKvC6261vmMnA5zPVX5otMu9DrQQPW1UulEV3fRwbas4aV3eRXag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K71w6Paw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X5rQXx7M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F6606A320
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1F6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K71w6Paw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X5rQXx7M
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM09OrB273562
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=; b=K71w6PawdporSph0
	dnKuzUY4F29USvSCrf86yHj625sjEf14XoUba8J3V2lF1Jio/iZSLyE4RW2A5yUf
	PxRYAEkNM+mz2tiZ63EvyUC9At1Pl0PT6iJonVfQNJro4WxQ7Q6Hehu7XaoJA0HF
	tvr/AvbScps78NkPhtQsg6JKhuq1wXzVf0tp8pFadlU49zsFyEISoEqjNWyM/cqe
	p4IgsWcbjHjx9VlA3cajuYFZsoYMyktl96jPYtgvdgXqanrwyftNhOM90NqejHjs
	eBAJEXT5l05FJH5Fh8uQKUF0COBCkWxyDsUtkBJeGOiMypg7DCaTeCDt5zriihmI
	kalV0A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk2cj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:57:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3056485eec.1
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316220; x=1795921020; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
        b=X5rQXx7MSMubtrUhgpMJsOUjw28Ahu4VDiAtToe2VUW2HMdlYEpoxhllow6bnzYGOS
         pt+Y6y1UpOtvvw3YtfS4dIrB9a1MFJFkJzVrNkmwconL2Tu+F4JZV2iaIBnN/Y8IImj7
         j96flvK1aW/DdpMs0HzMvbUoGhLC+bkM5ERRczUjyo0qftKU5VbvMQ6nc3Qr0YETOnsS
         Qr0D6VKa7eQj+XqW5oSahpgX/ullZbbvv6FrCTy646GPXLOWfxwjGywDF87Jrwnecrk2
         6h32aFe1PPdk7NSrDo+YYPyzgLUukESFo4f8CL4yvYvEc44hANgDgzGPjqPNTo9cBFoQ
         Q1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316220; x=1795921020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpNdZRCvOUqczt/I6p/62SfdiYMe0geYQBIESrCqGvM=;
        b=RH+PqH7yE+GspCh/qZFJ5a1kkVgwj4pntzpzNsLMxc3meSpxMe3K7Xu3tkNQE2g5UV
         Hdi6vP67tWKnJSzBnvTc0LfuLW7Mm9/aqndtdLxQ+S1pMssZ5aVmRps0hA89Z9//sUq+
         VjJv4Pl0GLFQcxnw+t95q5zU5uFHZt6X5aaJKZOJMqS8km3vMcviP33iu6KVhU1KnmQN
         dk7yLJT26CZRicxMh6mOf7+dJAXVagWcPh780RB2BdNVZL0mxtT+mZIT5Oig7R3y+EbR
         BTlsPe7MJfVKJY5VuFLCEi56IxypL4/u9k7SDvEgrHYjcsBxlAuTwH1g6YTnur+1Eq1S
         EMKw==
X-Gm-Message-State: APuU4Z9R/qWG8m4UWLV31cONDihli2cML42ZNreukqZGG0xVgeNTRb+2
	ITi4N5Dh61g18Ztu7B4D/goTRHjdG58YSc/tpx+qM8IU0oCgcu5TFpcxwGM+guRLaD+A5Mws6dy
	aU94N034eKfuudGU0mffuKsaK8Ms/nMIr091RKLHCI47QxPqOaoi6zoo=
X-Gm-Gg: AZFdTZcQdkjwOjJczw5jovBgEOBj8Hg9aGL9f8qVc1KQVidDs7kNnhTfsadg4C8wDj5
	4a+9nza0/johKRMsP5bbLK1y7VtXnykwiOzO54+27pGI0HmnTb1ZG3KhsFaZmSC617Z2AKBgHUt
	UL8FSAsYhtTLmAtQ6EKwiU7gSa4WcYFAZfpMZnJ0FrPdHHBTtHn4uICEzgBkfh15lC2EEbfqTKG
	HNLZCPa4Hamh6yscHnxC7crDdRa+tK6lOAbxi66KKNWSHqxTFWPsvZsz+OpQQT1xtcaxCLLxm8P
	qBHnhCRrKSMxo0FHFILcIi+8hW9N3AsGPH9KznIGE59qb1urZ4PxczK4vqQ8p/0b/tPnG+HKA0H
	KHAY/CSwIY+IVzpYi/ff64A1a5PduPLa33fqbcWf0/gRGYuU328DPE0RraScrMW9Zjg3GJMwChS
	3kJguKoNHd
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr10087773eec.31.1795316219698;
        Sat, 21 Nov 2026 18:56:59 -0800 (PST)
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr10087748eec.31.1795316219213;
        Sat, 21 Nov 2026 18:56:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:58 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:17 +0530
Subject: [PATCH 04/11] PCI: dwc: Preserve glue-provided eDMA HDMA channel
 separation
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
Message-Id: <20261122-nord_ep-v1-4-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=1310;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rD9zOfPOcAYlNN684/JsuvviV/gb5ok1TJTsrxdDyck=;
 b=/lOwFB1qjP7iTr8eSfhVpDz71Nc9Af2j4lHx6UdjaMj/dm9tVfScEt2jnKrs8S68TXY5KV5yF
 KEyzdXp8En6Dfq8cCoXNyUl6qyeeiGruxZavENr+qcudrrjvKu9e4aG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Kdqk5Q_88OUG_SdUpKyCP3yFoA0Ap7WO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX/NWS2Gjx5zTX
 5pV/QfepFSUEwbR+GQ0ehN2oNDzPqiQoanBY/LvIcafMF7P26km3/jhUYIk/WC1q7cZQO07p2xx
 J+M79VOOsEE1YZmEFhzY6kUtVr3zbGa0QIf6rvP1dCjGze2QxS8FzCathEzpWBXt2ugHrf3GFaE
 k5vjMq8zCHqQBRefEsRVorZ9v2tkSusRNJN7wjPilR285kbkj9ZMCTdwc+o4iBJKZGLT/sapraF
 QwhrArvuj5LlKdH+ikmuj9nN8b4iXiC7ou3LfXUjG+Fp58ooK5NRIJXMMTojjNJjjYZQx3pp2W3
 nk1idMEeOfo8S11WAwF01o2Yh+ervG2QVbNh1BNLp5CiohslogvCiAGogS7o3crV147z8XvDYUd
 DTneUQOg6gPR+DWMt5if0qCfNaNSWZgzHAvR7dHTnZxvzMLaOTS79I5QfKj2bt7vgUXxKKoPSIb
 l2bZpTGPI6c9WsO1WzQ==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b0259fc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX6lZGR9QHDXWU
 RUbjW2WV24KXytLwdkZreDsmrESPvXvVsiVWV5CPbBjP65QNo9QKfKZerYWHqGZT6yjyoTXlByV
 9jd5bGJe3HAGCu1gznmg3P4a1b0UXIM=
X-Proofpoint-GUID: Kdqk5Q_88OUG_SdUpKyCP3yFoA0Ap7WO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

dw_pcie_edma_init_data() unconditionally programs the HDMA channel
register space size (ch_space_sz) to 256 bytes. Some controllers space
their per-channel HDMA register blocks further apart, and a glue driver
knows the correct separation for its hardware.

Only apply the 256-byte default when the glue driver has not already set
ch_space_sz, so a glue-provided value is preserved. No functional change
for existing drivers, which do not set it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 12f102f48d5d..d55d4213be33 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -1041,7 +1041,10 @@ static void dw_pcie_edma_init_data(struct dw_pcie *pci)
 		pci->edma.ops = &dw_pcie_edma_ops;
 
 	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
-	pci->edma.ch_space_sz = 256;
+
+	/* Default unless a glue driver programmed a different separation */
+	if (!pci->edma.ch_space_sz)
+		pci->edma.ch_space_sz = 256;
 }
 
 static int dw_pcie_edma_find_mf(struct dw_pcie *pci)

-- 
2.34.1

