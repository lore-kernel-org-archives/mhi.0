Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203925C701
	for <mhi@lists.linux.dev>; Mon,  9 Jun 2025 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466354; cv=none; b=la7zALGH1qus31TZF0QW8MoDHLbpHnEk/Htp+ckQD1DvBLp50BnDjRQ4gU6/sE6D+ar699HZVy9j+zgDHCJfhvHwGpAJeygTcxO4agybxQOIa9N6vpWQKUZVTdEo7qdiNnOWFfxcmw0xd3Vb0Y4V70UX3wTyNjfBDP886i3xa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466354; c=relaxed/simple;
	bh=3MJFNTnmCvNNxzu47ggz59THY99XF+Lv2H8IXU9t+XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZ5cpA28nrKhbHVZetbq9wDRA4pyE6+69Gezj5FTRDZ+RHegkpPIsexDfuhrcJTrK75M0SqeiE3YwMKtAAhI9f5FZkhB9NHZ2W8YLx3zJysxvbkOdojHZDYY5e1DhGoTRFaVuH8PuBbHTDQIZAVEd7m4qlAOrb74wfUdIuxDSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQMf5LCt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQMf5LCt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599VVtL015275
	for <mhi@lists.linux.dev>; Mon, 9 Jun 2025 10:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUF8yzByRJf1RQQuiOGLMtV8Nk65na+X12bzWOfrOVE=; b=kQMf5LCtCgY4wnD1
	QxDHGnv2KsCBR2Ov2/TV3t1GnebESF9jap9tux3aahchAUgyKtR4fGVlOPPLF8iW
	8DNchwlqVyXuiJ/1HjQkGm15Al1Upuw51nF3c4RNivHiYOcx5YOhTEi5ELjj6ioc
	US7vAFeUaA5ccDjGdtQdjHxpPZeFZWx8jcLzktqKVF5/69jP61olPPfSNTkSQfZB
	BroEWChvtE+e1cUIz4cARTSogfkioGkXnRNjiD9qobioOkZWs1pTAKu8lJEm6B39
	g6xVGRbtMEZFIXsON69f2XPVTrfARbnDy7s02wma26pnDDkmp3eMkCfwWqOBO/+T
	evR8JA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11wxqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 09 Jun 2025 10:52:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23228c09e14so63005025ad.1
        for <mhi@lists.linux.dev>; Mon, 09 Jun 2025 03:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466350; x=1750071150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUF8yzByRJf1RQQuiOGLMtV8Nk65na+X12bzWOfrOVE=;
        b=TmA1ny7gsEJHswfv5uQIKfjbWvhKN++JaUjBZfWA3301ohObxe/aaE3oa3dPMG8zf9
         eY68RMv1jl5yAStSut3l5OHbNeBq0XpWf8oCfO2+yfn6+ByrcOEDfaJoYpOktIP3cnvR
         2r1r2mh7r1HouuFH1epDBiCR48VBTgjZENOqYQofTHPq17Te05idAiLat/q4VaBxc+ZZ
         lubr8zR9GQBELtsDgCKxkmxyjQP40cC5rHF4obeC8WTg6p79xqCgXzlivfa55L0rtNXZ
         waG5hdbh5KfgYek9pfQdYhYAaiP9eQO3DQmYsBTgOkx4uznqPJtTAqhl26zb7Y284syM
         UZFw==
X-Forwarded-Encrypted: i=1; AJvYcCWzI3SXdO1NK0+CLghUtmqWhq9kcfS8JPq77hme4t1vRFcX8awlO7opoVEmvUtSQyIDx0A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyToCTHDDm9wLe3W4pA7eu4WAMEIr5Zf3M6s1ZbcQ8tbnttUnOL
	xpTTXDKdJ4a5N2H9Y7WVWIhmwy8DmtBhMFiYUKRcMZzbFNdr6xvdFTg9iSV+12w2UetF4l+NzNO
	d6FqdUVt30GJwWbLIhfO4XkVWIQRnzVj5iI9HLnDNEFv/VMxZCFuxKEI=
X-Gm-Gg: ASbGnctvwFQ/STkYv4/KBbpzxWJ5pE47SiC/EkOirihveV1eokXweiCo97/1qJo5iYq
	+lElZqu2VufgzRS+Q6mOkeVgxJFCYmLjw2zuTwMWp+SiHFjclEM7XgEVeSrepSOqcRasfd2Ndqp
	X0rEFi/Ckl7sgF+klaU/3Na9QjdWMP/cj+ksXGTSrpaS8AR6yflhD4EXm7ROL29J5imA7N/jiIx
	L9D86bS6lmD2chuHMr4diGzpC13ZXDiof997c2l5wJspRwn+stfmkAOxnGE5QMcrkvLNX9Lup5j
	WJmRJ73AmHgGRt6IUi4CvjEH1ZvUxwq+neEAxjAgukCE8qc=
X-Received: by 2002:a17:902:d4cb:b0:231:c792:205 with SMTP id d9443c01a7336-23601cef4c6mr188219115ad.4.1749466350031;
        Mon, 09 Jun 2025 03:52:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbCDUCeQUKgzoGTBiAoX5HLibQ9U2gBaucDdLb/rI9EiBZTximeF45g4cVpAaAruBmWLb8Fg==
X-Received: by 2002:a17:902:d4cb:b0:231:c792:205 with SMTP id d9443c01a7336-23601cef4c6mr188218635ad.4.1749466349659;
        Mon, 09 Jun 2025 03:52:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:30 +0530
Subject: [PATCH v4 09/11] PCI: Export pci_set_target_speed()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250609-mhi_bw_up-v4-9-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=790;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3MJFNTnmCvNNxzu47ggz59THY99XF+Lv2H8IXU9t+XE=;
 b=/R2j/FvpgVZbKkZ9tHBBRAwTesasN8RhM+TPye32z0glIhUL4IAq4QqKy/A+LYtuKn0+9WKlU
 lekp4bMiZL0AmW9qZ4+HATjTgAYe2/X/37ni6hGW33aJa4Z1+D8rYN3
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: -BPy4D1mxKf2E0VKNvtaVAhANfuJjkOO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX+TDaA0rajfRV
 QpjXcscv8yfzcyn6u6iFHEXc6NDPGP0RSmMJc9On65zxttwzNC63eKdfGfRctqs3H7Wx7zeMD2o
 LB8M+8kbZooTkHMps+l7fUN6aNCY1AzAQmEtqDgLkp3ODWtn3/cHdP6cxIvU1N5xb7aNw4fs10m
 fTQRvs1fpE07B64vV6SH2CU+v1HtJAsfrWhQhLTfYPyA5tlbAJSTX5e2lBlYEUarbAq9US2bb+5
 q/voTLTylmA7w7WJTFGtrP707WeSIPr5PlCtmayP7Uky0t0QkfNeKH9XKCjkAoB1ShpB/1+1W4Q
 +gmdOU9w+Wv1HRb2QZ2ptZVKUnUORX+7vzjJTKHQhRJXg1O/9Qy4GoqubdoCq97GXmivmPw84PY
 jKgEKuib4ORc77kyDPvMiB35axPPoAqMYNdBU2++kM0vAybko9sTE8sqLSlvkLDtY5cf0pLm
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846bcef cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=5E3R6_0bZ0f_H1kkCjQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -BPy4D1mxKf2E0VKNvtaVAhANfuJjkOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index dafb8d4f1cfba987e1ff08edfc7caba527f0c76b..b388e02c37ab2815b562108b24b9e98811053d62 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -193,6 +193,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1

