Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316200;
	b=BXBbtGAb8Am2aRh5yhLQr8ZUguA04Nl7ExmrL5qU9IxOLpgEsExZ2BvH3mD0LMWu3Naa
	 jPYBXMszVqztBG3SiaD9ktyx69LMYZE2yTwru63ezppsmlOl7OPMDEd71XQeqB4N8JHcd
	 2JKOqawrIqPZUGDQyoEWsSg2lX+WZb28wPmiTVXfO0+haHLSe/SdNVj0yAaf/huz3Xcpo
	 Wk7ASPEQy/+Zpe4S3+ynLAbskI4aqQ5QFbxGk/S60t4xZgi30VdHDjdxkdoCf+42XH0rs
	 1tfIHmV/XoK4U07czUfaLOlNyDUmRGwb2qGkjW9RWFMhKHyapkcy69eciwR3EwmmpFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
	b=f64BZ6bYqSkbyxtIGxK6iBLxdGuwUmnf+zkywJn256nRfLqdgsGdln2fik2k7aKryd6u
	 m5Dv8Fd7YJo3PIztruycZ4Syj7UBIqE0rnBtIJGdrKigG+mbpH3fPoAc7F9cQAmBUtNPG
	 zkWnEurFAskEi45HtKKSX3K9JumNNn/UTgzZucCEYArjrxTc3KCKl/p+5LWeW4yT6mLef
	 EXHS1UGcrg1QvOrfHNDIg78OiRhSeg1QadUXAKMgVwirX8OPE9cIi+SE7RanGXX/yDfdd
	 k6k10sHFXWUXbBMmDfrh8uusaSx9FQZsdELZw5LmRi/aZKHVFtmpyHWt/j50l/l0zPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQSI7j+K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bzM1HX8o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B582606A32A
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B582606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RQSI7j+K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bzM1HX8o
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07reb1941209
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=; b=RQSI7j+K5A8pmUvd
	UuJgvxgYgSLpodMd+K0ODeH3uJVk5686TTba1lHpmBjptUjPztoYxHh/rK58ULIK
	iAx21OezOkFDDMGqbL5XO/zkRy+RHF3bcOl81DWKbMlYbyy2VzYIBFKEKky6AewB
	c7D3PJbKx6Kq1piJ3THI0H8NTdXHu1AeUPBRxMSwKlkQZ5r/xriANaSj6iEE/2Ih
	1SpDdKJLHBhzP2ctCnPGMOOSgE/rocbd6qi+X3SufSgNLJBqOenijFVVICMt1Y37
	sZ7yPLZ+AxGEGqQ48yMUfzyzaLlXkqudPk6Ahxv88jIAc4SNMQB3AyUmA6qH91PR
	AVfNyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h32hux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sun, 22 Nov 2026 02:56:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38131260a5dso6017947eec.0
        for <mhi@lists.linux.dev>; Sat, 21 Nov 2026 18:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316198; x=1795920998; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
        b=bzM1HX8oO702zZigy1hPCmRtg8ec3tGTMQ/+RAfYPLpDwvKfFaTRDSAY7WegVsqvty
         XY3wS/aMjbHaeFEUA+wiLk/r5tu1ua6Gz4jSU+ttx3RvEgQrCrFz9oQ40DuJtFAMoNi0
         n1UMi33dPpVxQRIhkVljmnTw85lE+MaiNPYHbMSfxyE2HagaeEmjSnfjd2L3Ir6aTPq4
         2Va0mGLtoB/Kx4sKxXx8BYODXqEfut86kK3Hwj9g7bDCL1AXkswkR5eDHhaAdiuWE8I8
         uCUp5HWBJtUIBniDDqYhQ4EmIGCRAWuDGvPDbWrvpkkMt7roKkrJN3uYGuzpXOYlIkxp
         pNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316198; x=1795920998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcqIKO45VLpChEWwEL7R1Lp2+6hXNgtElEHhQVWbBZQ=;
        b=z1xJZoIo2TyocttmzJpb7vN9ULcUJzZp7TuSsVq37Gi1aa3iuUsKgDD9cDCFUPmF38
         lDgCCZJS2Fg4TWM41n7zgsPtNPrJaRikZEd3F0GNLVyA94NJ9LAYqLuPrsZZcWIvQLPf
         hSzuXaBL0DxR7b+o6PWSzntIYSJJDPA1ZSq2SqjfH7YMB9J5TcbVfn6BUpRbOAS6wJf8
         AmyKtVNHW4Tc6pGHmJMxYAYRowA4rPN4qrTKtI0cMjqO7hKokuckYNIqUHH/hYAL9G5c
         TSueJ06KwL+uuGKLLrbWgZiVrZ8LN/rwq8Yj7YEc1a9EvLIIvqiVOYU+D9SVfa1QLoPw
         G4Zg==
X-Gm-Message-State: APuU4Z8fWXtBS+/aUF7ANHhOin5CDOddw1027r1qP+qq64fk5WQtYc/0
	qA+jACjrhVQ6DqzrowQG6aWUMEc2L9NdMMa06yXeebWnW58VGHnKvs6bx4Czs7aY2UvVhMWlEDu
	gvg0mhoZPxIND0HmQdhaIWCOT13sWnvsGrZqbKLE23GwjmXhtnk/azlc=
X-Gm-Gg: AZFdTZdknTeSYp3XLlQr7tx1TkBI60Hk0Eoe0F+ZzP7bpvPQ5BtLwESJHp6lH7uRrcw
	BvmrCS95jxSXA+AFDqJjg3MmUgf5ANKsbZ1lTF1Wne/w//w/2BT0aSppW+zwuRFa4L3oFZiXpJt
	x1uo4CXyaU/g5zHOYFBX0Itw16kF/tubrealz1eV3+x4m0xeL7RYkXNg9pmot0blGFqb72aPoJZ
	gsri8Xgpw6VUqLuSa2mdYh1oK9g8MbrbncNsjPJeWnmADF4ji/PWumDJ0DMjoGQ0yg44tVeuEkc
	00SdUUC0lc8wcj4pIJngCO+ijyjJZB1wV2FX5NaFy0ZAkDo5MhcUTdo/fz4IDHzySvsiR2DrLsJ
	cHiag6nQPYbsdt/RXZLavDQln+BFO2aLjj+hUPXfEaHvaq0Zcpk15Aox9djwWXtKZiZysjMkEoo
	8/A7+Q6n/7
X-Received: by 2002:a05:7300:d788:b0:386:83e2:a8 with SMTP id 5a478bee46e88-38683e2019bmr6001417eec.40.1795316197936;
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
X-Received: by 2002:a05:7300:d788:b0:386:83e2:a8 with SMTP id 5a478bee46e88-38683e2019bmr6001400eec.40.1795316197534;
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:56:37 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:14 +0530
Subject: [PATCH 01/11] PCI: epf-mhi: Pass the actual number of MSI vectors
 to pci_epc_set_msi()
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
Message-Id: <20261122-nord_ep-v1-1-6d8839ffa9aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316183; l=1340;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6lmFv0LMj1kepMVfDNDhSTwXYq+rLdkqa0JXEDLBBAw=;
 b=tnhk8AOWx876pmrvroA7ZDRtfUiwnAUBPSnRNygL6UV6R/OUsYeZ7zAh7AZIjO3nYJCs9xbPf
 pQ7msA7ylnuBQdZX9/LqbRBB4npuNlgQ/QymPj1mWjJOZcAVYnUpaxl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b0259e6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-BGyM8POLA_osPWRVsoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: YF-xktVd1MojZwQoLswrafJzPA1wukrb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX3Q9X+/X2FJwi
 dJgrjsOlOpSQ412P9jApvKF+Tr+IOVAhJjoXzfh2dL/isqZ/FYRhqmsBvJbFR+98jEXaKUl/0V8
 Jf8T4RTP6H/hNyfOOZW+RKxUy8+Pp7Fb6OSgA6NP6SiHu3E2TqhZXLkrv/v27JLZdTlbA+KwdQ/
 cKcfEUqqOWXnIObpg+u8VbJt+8uDHG11rLIaDqZ8pgsSaFBY+GmL5tT8ixFETXUHZMNsuz7Ph63
 hbgVGXzI2+nBsu9Q6z6H1fFplSXNbWYJtJFzgqJlt2Ab1MPCpCFfltBKZYmor4e5oiJN26WYubY
 2kF9qo2RJH6yrnRoVgzzJbYBIocmXOZdgBE7n95RpLAluF0jIsn3ruo/OJye75J9k7hYDrMvTAs
 oF/wQ3ko5uQGzF921w1zoqhAn+4+aGKDHOlWGKvhMAjqSgVkIj7ifEsvVXJfwVQMl2yHOKg5qUc
 ygB7OfBnLvwblq23SRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX1w26d9mn3VWC
 2SpgsSUnJ1XKtKGAY8qlttdM7Q7dCKlrzFxqTsYr2xvC15dEWc6MPvUuWxR0/xzT+Yt8gdyj7Tj
 yfUP3it6jDD/S3dcdYHrVn4Yqk4BHh8=
X-Proofpoint-GUID: YF-xktVd1MojZwQoLswrafJzPA1wukrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220011

Since commit f62da6e7270c ("PCI: endpoint: Align pci_epc_set_msi(),
pci_epc_ops::set_msi() nr_irqs encoding"), pci_epc_set_msi() takes the
number of MSI interrupts directly; the controller driver encodes it into
the Multiple Message Capable field.

The MHI function driver still passes order_base_2(info->msi_count), which
is now encoded a second time: for msi_count = 32 the controller advertises
only 8 MSI vectors instead of 32.

Pass info->msi_count directly.

Fixes: f62da6e7270c ("PCI: endpoint: Align pci_epc_set_msi(), pci_epc_ops::set_msi() nr_irqs encoding")
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index a633e47edf2f..52cfffcfd5ca 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -730,7 +730,7 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	}
 
 	ret = pci_epc_set_msi(epc, epf->func_no, epf->vfunc_no,
-			      order_base_2(info->msi_count));
+			      info->msi_count);
 	if (ret) {
 		dev_err(dev, "Failed to set MSI configuration: %d\n", ret);
 		return ret;

-- 
2.34.1

