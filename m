Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBBC259C93
	for <mhi@lists.linux.dev>; Mon,  9 Jun 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466330; cv=none; b=FzrVuu73bQQYo5bb6h6ZiYNfTabycuq2iy6j6XpwT9JULlu07z8Z2OdVMW0Tvo++KQoiYCA/pd2lifTWr6LEn+Wr/CqYgAHXiL8RWrgRKYuijt3ibsHtCKqdPyLaadfRnM4RToPCX1n8touF1bO3ssSLYDIqxWeQ3FwiCW0qzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466330; c=relaxed/simple;
	bh=Oy5xhLR0GTbxXIyGSehq2C1m7jHsrRB+NLo3OFoCcpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgiUBFsB4XhJjG46oIIW6qRaE+SMlLUT7NHWgo6kAH3W90baT8OCV4CtzdoEF32UqSBzy4TO1cKgMZw9Q68bQmTT4qelWQUfljB/PsVoOQEktzukut0yNZb3/aKJF3IZ4xbBJJwe1CLdSS3DG0VSfZ8AHpn3aap2UmH/hi9/XyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpKYz8vo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpKYz8vo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599nAYO021751
	for <mhi@lists.linux.dev>; Mon, 9 Jun 2025 10:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tq24Wrli2Qp9Evrio+qi8qkO57cIWgh+60vTcG6QRNc=; b=MpKYz8voCd14SNZk
	b3H4gwBUmyxfECn4zVOKUdcz3fDqCrVXIeT/2zxj7AtaYAR8A9SRcO8dl01gxUWD
	Pv+jPXtvPEF0pyxMQF3ZRX6e3tRuMBAwdrOsbo7FW2qyhwoCTEq0wfTs+zlYwdla
	fyzHDyhtojphon9hHzFgpIbw3wy1P0lrt01F2Qb6JtKdYkIglJgW53B6s58FMcsn
	4EWuhMpKT9csLJeUe3vUyaKcGNUuD+v6ZAfvqKOeTzyF/YjnlcmcsvW1JvC2/mAQ
	CF7Ozxj2TBIxbtWWVPPk3hS3lTXmzMciAJK/oD/AZf2gQSqXsAo+nHjvBqehcN5h
	LzAlAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9nwqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 09 Jun 2025 10:52:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e7550f7bso40698095ad.3
        for <mhi@lists.linux.dev>; Mon, 09 Jun 2025 03:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466327; x=1750071127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tq24Wrli2Qp9Evrio+qi8qkO57cIWgh+60vTcG6QRNc=;
        b=vELmyUnsue/Cfa5YkMPxpSEkyu0+qMD+aNgm3GI0rWvcjZXPLHk3uRIxDksPpYlib6
         ID2BCPpfaAFUQm/U8Uwk9SqV61/jcQSDCzqFj4rm34ZKUM6pgUBGHlavU1P+s8kk0Otg
         ZRUzm/EMg3Dt/okQFBV9upIomQm/5o3tjHm3s0Wp8gqIXIKZMHtHrhoZrBQ65SvZXYqc
         W6XfoumRKideF+ek8syXLpLrmxeX29GaTEgNgDexnPC+85cVujaE6pgPoneYx62mttZ2
         W4ZsaZ5Vjxfhj2xIcWSIDvDltZ3Zp9bCVSrnp7csTwdkNPyrq4YEve4N5kgZaYBaakId
         Dk2A==
X-Forwarded-Encrypted: i=1; AJvYcCU4OMV+nrf3ogdXYyUEgrKAbGt3c4+UVJCTxkZcDp28WDYQVSlPUTGKcQVtLxhawPlRS2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzlDFkWPofwOVE0YVkMstlckYcdICLkjiOihaXfxBHUoMB7Ge2
	n6QZCkpkMyUR087Uz0J8TIVjN/k7dkjcordTuvn4HXxA9gGq8sBoEb/Mon2ZeFfm0JZbqZuTi3F
	U08LLbcpt8JFTBZdHa98E2mamRLZ28thAKB2Cjqrs+6k7xiV8b0YVpo8=
X-Gm-Gg: ASbGncv5pzTNJy0ydt+s/DECh1fnZL+/bbbWqZyuXCcL78zjDX+z3DZE1CoUuy7xllY
	hT0REscul/Ny3C7ehRBi6jsptfLT5iDsk+8z11RwAwktUiSI9k7nO82A13uKICwbQIQRejGS6CQ
	/7xqAjq11Kh9mArQwlYc1JyomaNdpeKOX+vtXdAGgE2UxM+wHMhUWbnP+XgTRUvFpJqVbwAtuPq
	B6XLBvdTcUIgDw15QDoPjP79HuBVy0bdbp3uEn8i/yA+f5HOjBLo3naaDlaze/bXGCZdKS9DDO2
	/bQCmT8VzELsRsuaNcYSV3vhlqhnE2EOZfa7vbflMTi4rs4=
X-Received: by 2002:a17:903:228a:b0:234:986c:66f9 with SMTP id d9443c01a7336-23601d2485dmr182543725ad.22.1749466326743;
        Mon, 09 Jun 2025 03:52:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDh+coUuKtWGJZpFtogDmaKOAu2e7dpBqqLmg6/yIehhTMpFOXeREwgQnJUjxOnFZLxpXf1w==
X-Received: by 2002:a17:903:228a:b0:234:986c:66f9 with SMTP id d9443c01a7336-23601d2485dmr182543445ad.22.1749466326366;
        Mon, 09 Jun 2025 03:52:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:26 +0530
Subject: [PATCH v4 05/11] PCI/ASPM: Return enabled ASPM states as part of
 pcie_aspm_enabled()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-5-3faa8fe92b05@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=2258;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Oy5xhLR0GTbxXIyGSehq2C1m7jHsrRB+NLo3OFoCcpU=;
 b=FsGVVNU4bBpjH/bLJkqhzBlwA7pBTdKA29oGrWjW1VZGoNcZ5tmxRnyiCdmxxfmQ0EcHrbZCt
 jOaYiPUbZ5RBI4TM1CIEZmIONqihPCbrpnBazbboLIEdYWTK8S6/0Zo
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: YnLfk9GC_EJ9_R5RYvCN0onfGhu1m9BP
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846bcd8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wuQQqu7ThqwHlQwkt1oA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: YnLfk9GC_EJ9_R5RYvCN0onfGhu1m9BP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfXwnGOrfQlzTjZ
 bQyz99D/T+YtzkKk0ru11Ahl6FAqx9+TORWt/NQLtR3w/jHtKp3wI9A2ROi2TwJx532hdu/FW5W
 J7cihhUNtW1+CSMZTV6A9midNQIi9ADqJns8anZNph0r3Rc7pr9q2v9Lqbx+m8AKbBmBcRW3jDt
 sbpujHlR86xlipEQzDuDujBBMJYCf1/fVVNTOqEZgyAVw+NgsDR+2I+czNewsxLUdr8wiU9xvOz
 uzQH5ffXvVbIo+U4d54s/8E3xRPQ3LEQ61DiuRFzzpKjE2S1bLsxtaI5qKF3lQBlQlO37sXBnoL
 l/MfW4EAC9vwIlfhKIPtn+/5BotaJvYWYxC4cDpKPD1ylSBthEbp/G4VR7O49Px4Ll7hI8SRpkD
 b42Zv/mTc8H2/zdaGbC7MIINI+eNNtAINgFgtF0PSsq/6bQLdbQdqzDyETswjIn7z1grq9jM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090082

PCIe ASPM states can be also controlled by userspace using exposed sysfs
entries, if drivers wants to disable and enable ASPM at runtime they
need to know enabled states for correctly enabling them back.

So return the enabled aspm states as part of pcie_aspm_enabled().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 4 +++-
 include/linux/pci.h     | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 29fcb0689a918f9cb123691e1680de5a1af2c115..94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1555,8 +1555,10 @@ module_param_call(policy, pcie_aspm_set_policy, pcie_aspm_get_policy,
  * is deallocated only when the last child of the bridge (i.e., @pdev or a
  * sibling) is removed, and the caller should be holding a reference to
  * @pdev, so this should be safe.
+ *
+ * Return: Enabled ASPM states
  */
-bool pcie_aspm_enabled(struct pci_dev *pdev)
+int pcie_aspm_enabled(struct pci_dev *pdev)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1740bab514b0a9a61c027463a1fb154843312a22..cb703443290a013c8372333fc8d547d190d9f3b4 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1848,7 +1848,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state);
 int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
-bool pcie_aspm_enabled(struct pci_dev *pdev);
+int pcie_aspm_enabled(struct pci_dev *pdev);
 #else
 static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
@@ -1860,7 +1860,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
-static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
+static inline int pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
 #endif
 
 #ifdef CONFIG_HOTPLUG_PCI

-- 
2.34.1

