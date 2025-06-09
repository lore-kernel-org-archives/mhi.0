Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D925C6F5
	for <mhi@lists.linux.dev>; Mon,  9 Jun 2025 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466359; cv=none; b=suf1fKBS/Wl0/ceoi67DYkZsxHy3jGT65u4sR9XM77bckXkddL6lKiIMNCHngdWeenpNJkujF6bdYC7GJa4Sd2AHsAVomaRu7LPT+QiiK3eSTRVNqT/MK0g9oWGfwjVIi/a43+ocrkmvvCLTLavZYciryeDy3pfMnzy9oKDz+rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466359; c=relaxed/simple;
	bh=ozgpq2xmvi4UJqJjNIVDkHjQo77lQtGFPl31rvLet4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JW5dENSfY9xgM5Ud+mUHDE+qhyRVOxZpvMq3kPxn8bdNF4w5VnRTkt2AehuZKa93fd2jQFdd7bwUKniME4BKFEXTXyUDjlGSWnf2ucE5S+NVhdV1VOybi+Zf4y9DYdasDiEWIG1iyMKBsKCslCJ/57XOZyjr6nw1RiyD2jk82mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdVfk1RH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdVfk1RH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598PqBv002514
	for <mhi@lists.linux.dev>; Mon, 9 Jun 2025 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rf3T1+3GASlWJzZ0bWsqvC6Cu4nVbS7t3i233bUQno4=; b=QdVfk1RHP9aFEftv
	jffgvjF6vy41GBr7vtN3G8DmLCPOlFlFUA/D9ctuL3rFx+++2QK6He3h3xq0QEPq
	uiCmC4p26jBkB5ff3eP876Rd6X2dc1af3pNYR2OEdNGTjK56v17lnw5GwDbitwzI
	qZDQyKDjgiqFvMdK2O+1F3Eo9SIkRFSJUGzbnXJ61JDK5BnXfvQKsqphxFLyT1gO
	d6uj1vUfvkug3wvw2RLRPy8T8R8fovwQTcrGEIfn35ft1PNrmu8ehIo2q0CjO86j
	VU/vSoth44dMy7SWgvRLaCm6BdPkfPJJgAfJ4GgPlBIHZKCLNoMEHL1X+y/FksI1
	9ItvDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t8g4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 09 Jun 2025 10:52:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so2944741a12.2
        for <mhi@lists.linux.dev>; Mon, 09 Jun 2025 03:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466356; x=1750071156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf3T1+3GASlWJzZ0bWsqvC6Cu4nVbS7t3i233bUQno4=;
        b=wEptTntceDWf0hyqWajW6BmHBfPxI3GQ5l93u02dVjQm2ITZUMeIMJFOJmJUXffCxN
         1cIoNsazg10s5yQzLIOzra0cFeteRU1hEwZ3bze1h8shga72kh+NIeJy5wtN/flGieK7
         HQD3lvteUYCIHUNRbfeqsg5t3OmiWJJt1Bh1csNMT1PzulbG5aIqtU5AE4I8hPzkxpXX
         vdty5CuH1cp3QcwGlKCTOQ5hBIqCLqyNEq6X4P7kdqZAYmJeTSKkXzAKR4ngIGuVu459
         I30ladD0MyduBKkh+u/Ruo1UL8U7NPHpetVN6KZc4F1xYSgvi6/wRGZYSHfFPxk/BJuk
         NqGA==
X-Forwarded-Encrypted: i=1; AJvYcCWDLr2EssoyiOW04ZyJK5alFKrw18T7rQrzgc0beT1+8dL03CH3TpUhfwGqBR+bjjXOIxo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWcbeh2iMaSaqeqMz4NllFTEwJp51hbrmrltI87ri9bYLE7jaS
	/le7ZgpuwNdF1rRX+9GrHpIlQcxvEuGnmpsB/vju+7Fa429iW0MdCU4ggBo27NM4kSvpPFWr9KF
	c/CjjHi1qs+ii3hCc4sgKCDZRRzftShCxmRGCpgF3BG1r0BYXzZD4Mc4=
X-Gm-Gg: ASbGnct2c1ZWmLg+pb7LZPUIyp6NESCk8GrCb8m/gRttqPXjT5TY0q8/9Z5+XKS+r3y
	fFiyQhi94fJjaUpH8+KV1v9M4TjKh+ZBphysp3P/eZKrFeEPafJwvsm/dilvODacXUE1yVnLoVY
	5j0AdEJUawNpE865eSto+GKdEgm6+tGq9zwuZaItPnmSK+5tznb7+DNhzmDzngYXYarxoeHWhgK
	85ttyNDWPMWo5RjCHFRBZIFIXdZQAaoqRFC0sqnnQFKv7T3NfO7455MZfNfJV6uHJBdMiJgnc3y
	PE4a/Io7wtP2v8giJEyNRCy+6FxqXDqUkWY1oewunfbSE6HcN+Xxkh0X4A==
X-Received: by 2002:a17:902:e892:b0:234:1163:ff99 with SMTP id d9443c01a7336-23601dbda63mr188272055ad.43.1749466355785;
        Mon, 09 Jun 2025 03:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfOtxSShcIPHOq4ERfbAdlOhJ+1CY8bWvhhbD6i4sNfbzlFHhLFu/fy1Gvh29SHVHghOb2zg==
X-Received: by 2002:a17:902:e892:b0:234:1163:ff99 with SMTP id d9443c01a7336-23601dbda63mr188271785ad.43.1749466355402;
        Mon, 09 Jun 2025 03:52:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:31 +0530
Subject: [PATCH v4 10/11] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-10-3faa8fe92b05@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1624;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ozgpq2xmvi4UJqJjNIVDkHjQo77lQtGFPl31rvLet4w=;
 b=yaLOh4FX5gPQeN9e5bGsAkcMXFcxKgY8uVvM1nj/u8Ux7O6Q0xBWEZ19LjFKr1TFtB3aF2ufv
 5EL3YOyrIgoD5l4/FTIM/xHGeEl1CjT+2Ytmco4OKC5eUZzGNbxgip+
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: vuCRaXGVsmmLz1UWDFi6mIpVN8TcaMO-
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6846bcf5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: vuCRaXGVsmmLz1UWDFi6mIpVN8TcaMO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX6czrRZuGH6da
 PpL9aESoYu4J5p1c5pgyZ0F58MCLhRX8enKChnx/fQZCMUeOuQpJiRl0DSOYuxJEeKJT6wvtBul
 BzksFPY8yAkIhvG8a2plepBYatYpcnlFD3UUtvBvA3no1gVhmgiFUFPXkqwUlD2kMmhqPao5Atg
 BwnceZL9x+8Mq3S2qZeIp3KWpLydgqZVyoA27sIHbScE5FXzBGPFTrVEuOqqAWXgFL05Z7XNs58
 jMYIGuYBk5XbXmHcFgln1U/QaH2d69bAje116u9lEqMpel+EF0xo10JnTOgvGLocKeEAFk1i6NL
 IxLXAHMHTZhofC+1qxz/dYYZD8ZycxPqk3VtVGN45ajWbTSQLRAtv+Ii112GUha7dDgijz4hWx/
 Qtr796IyBomMkfi3mc0PyBbXuCL8u3oZOpQi4MAEtwaFqfHeMDSbY6uaNwncUJet5U+lr9lG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 12 ++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..8950e88826e27accfe699e31fba8f4077c26296f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6018,6 +6018,18 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert lnkctl2 speed to pci_bus_speed
+ * @speed: LNKCAP2 SLS value
+ *
+ * Return: pci_bus_speed
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index cb703443290a013c8372333fc8d547d190d9f3b4..900f2aad5caf664eb89babca82e1921b1ca2fe5f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1654,6 +1654,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1

