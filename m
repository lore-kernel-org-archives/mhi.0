Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093034;
	b=Q5xA1DI5ZnnyZ5gbIn/RqODHXLGqDVXiqAtAzESEa4oaoBIsiTVGjQQGJ0vudffwA/tZ
	 9gPLDIgu1CyrZ4mS8A8fmm3LU6751GlOXq4tnnKQ9jY+s9KQd4CrxQaAp/uI6VtBjvp5x
	 6NJJp7JlVMhRgEr7c7iG30uQDLbOHHuSHA65uZosHoPcWDrAiIxWRKyp07yvklW/3glHI
	 MIuMu7ARS+zUkqSRzt7yJnDFPlM/QjAqhgJ5fX8UdARB0ApeD06Pm/iscckYVle7kiLLn
	 BzrYYV2IRaMpzfMgxEaARoCO2BdQd9Vn7ClR3GDOAASTLq0L6v+N4tx+q7WWP4zNPcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
	b=p9C6UHjgFBxKCYyD9LkLxsUZtwuiYW2DNZAnEng90wbRMFSqxuOoICP5Yi24IMdB5lkj
	 +MTLuZR1W2tGfgkub85h8R9RjzzL6U5GZaX1Ju+J/ztWDJviy8MWi+mC0jW3aSzlr4xOi
	 CvGfVlgxcedWD6Y+j9qIPtlWBNeZZU7OLSfa2CvpFWihpRI2+BvplUTVGVNDV7hHxVtEZ
	 JwasBliMYpkdfRHtO7T4uEOZ2dQh7bc6HSpfjCO6ahR7kGijzpakQUqtOKXzkOPTEsHTT
	 rrp3tUtiVeOP5xDZ+EbecQk4mTrVhqAJk/LTyDLIs6f9p3OwaZyAQUDELDNPJKMl+xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZUg/ifDO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D355D606A326
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D355D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUg/ifDO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJCZa3s2327239
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=; b=ZRGivuQ1oWWQGCRi
	sCfEA/ppJkCsTOqCJL+s41gZI1kLSsJDxN9jfB8tC2tt3E+l2SBcZbDTRAQ2Nt5v
	ZOPtBlcVekwMteKFgFVUK/aHwbfkqAqOWSJq7J7uXF4eNAEaU6HXNM4pwrmBb46y
	o3lc1NqC2KrfxfSB5wILQ2xVlMZGwgnlzlphznYFAUi35fDj1icARv5quHfbj2cK
	Z8H8HbTsxJGGs6NVR8Evjyrb8lijApNynaAkgQxY4lkm2/R0B63ZOeg8wwXdfSnW
	0RqbJ2GYL2qrvF35pLsEyIjKx4Jf4CyUgfYNZO9JBSsjkQDHVrBFjAfDBk2EBOWs
	yfC7Gg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9krv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2699496eec.1
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 04:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093032; x=1795697832; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=ZUg/ifDOxTaa7U0IMj7rg8f/qmHoOETElkCuv3guGu5Xq5p02lzTLlSjcZeKitzAvG
         1r0iKSSgjLlmAxK2cTy7ej9xMf2x7trmAxyOvk2EWnqr8XV6P1goWfuomt/4G2FfyJ9W
         Fb/l8COK0ERrgx3o73kJLPjT+JzxRP6L7WF5+Sc3vH1I8OVKVQY13tALTXfEeJyhO1GS
         MaEld/3vvba/oHMYZuqQwU94+QmPyTguMmch2FInSqLb1mXN34Ug/id7UYxqTsRlyrOc
         2/7T6ZwYZkVd9R7RTijIzjZ7RIQI1VL4eB+KWGhoQWVtx9VXrD8SPfAO2vz6dYA+TtDy
         07vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093032; x=1795697832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=ErxZ5yE3k/lsCfKrdZm1hFiK8APbMEp9ClW+q1SriUvsy68Ipg9bX7TgN+Pb/pXGJB
         vZH487A1rYhoS41gcW4Sx9mXBO4aZtiAeiunHzqaEeGeXAd5dPsTxRhVauPXdSgTTUBO
         JGwZR2t3oQs6hkCDIzdTWTMCktWnkyyykLg88tOr5xb+2MFKIHgWgRoFvHLNoW0Evkyn
         WprP4yoFzjk50JVWIHX+Ed8PWVHr0BpBn5XSWHjuvhfPf2Y+42Esr/dIt/56jaDxLiV0
         BwYPwt6qAVixwkq+bENrD7Unk91IWWCYu/Xkgq/41fqHR+tDEcBCE0Hfs9tFdxHdG4IQ
         1dfw==
X-Forwarded-Encrypted: i=1; AL+hErE66xMmIQuzAFEXIfvNsm99vrPPLZBvgAIPyO+XiJ0TQDoGdgNz+md7KJzf0fGWowkdz6g=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Q72+JxrT7DmNqAACgUBZgCpl6bVoaUz6Q1YMZIiQIWZ536dN3
	ADuZq7+Oed/Bx8LuTy4Qi8jVgfBiNyyJZzz6OgOAtM9aq5JEIYRvo+ih+nbttEgkD0LlhzaFkxs
	c0fW3qnsMx49SG1P8miHf+0DUe/AIkWUUPhuzSTEeCRBm5e2jwVwvxn4=
X-Gm-Gg: AZFdTZfFHhXdBem3CCakgtid8ETmCvnbuidQUQZiDD24xPG5iMIrL6KQn/vQPsDvB6p
	JBTQlOWiw+q7vz8HghAri+iofPXK8fEUlzA85i8poLQXKEz44Xs+/POwwjN9HUxXQxWOKu8xPT3
	6tMtt9J5cpHxu7g7s635y6chNr5JL2BCOAXizk31G2XzYx5cJqoDXuUC5loemX8XlfQUMK4GG+p
	OIBlmVcRGfKeFq3Tft+GzzKREhIX71ENkll0u3s083HOAzhg60joMhHTmSe2Gy22uTysqhGNx6s
	uLm284gpleCzo7J5c3E0rzrXkSPxBdwAo1rn2ksKkG/vkOnmRqITP6ZQfUT4q8yqK5IzTdGJiSK
	w1rn/XhgG56qlrN37nOmTYyQ0I9NCY5BzUmK3aRuoyFt1lHpZS4R+UryJyqn4gAPk/jn83QEUG4
	O0itSk1qRr
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032266eec.13.1795093031601;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032235eec.13.1795093031084;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:10 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:35 +0530
Subject: [PATCH v6 3/7] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
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
Message-Id: <20261119-bwscale-v6-3-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1780;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0zEUl2S9sKA63T0Lpy4WWFHatcVllvfZJQrn5ZSlMz0=;
 b=QiPOhPdWYBohHyIwt2tF1rwyCA1O/3J19GBbfxfpRGsrmthwLR54jYh7vJieyTmuzer/m6ZUK
 +J7M4UBSalZDTdbAAM9bOcqLpdX402IQeObndCBqPYoPYTjrhrq7CX5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: yNCLA6aF7Bhan-EtX27GmZXiA7nVot1a
X-Proofpoint-GUID: yNCLA6aF7Bhan-EtX27GmZXiA7nVot1a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX6xie4sy25Th3
 7UWgF9uvKsdPQ3WVVVOTG3CVgi6iquen7Ep7FwNjMeErLnDglVFr8M36N1ht0tOA35zsO8BUAQT
 3Yz3vGpnMlKlmqcbnnRzeKYdBTlpytc=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afef228 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX5vaQhzbPzbsg
 FSnBp/zG7GfebuVntsb4F2MuK+ckHuIo0llKIFCqvL4NgE8UK8PtIR+YBWmFDu30Msgl1JQQNaw
 xmfSCnEJ5jCRqJ2Mz/qnYHY5g7y31PnG/j2mqlR8fb5YCLVJIdU0Q0uTQJsQg+PfndCr0JOhwWZ
 PHqFmC8X8xUoSet2ayZR1HfLTjbxWfgSm5B9dUL30xAVlu4sl7YXoCOYPNRvXqoWdMBC3eo9Nkp
 bVjtszH/OwrsrKUGNu07OZdwheKWaosKOkxmVC3G0SrQhov/3ajzuCAg5MOhC5HKTh+Lt/chu5R
 fUPEoA2hF0IKXFV5ej82ZWF2MOgN0lhXgUkB1DTD7bMQYHv5yQ8xvJ2ogGXp3kU7ZH52bEQlbLm
 0IhzmdDM/LIdAXeYmUsbm+q+WQl1GSo5XDhOy7Ad1AkM+0IFe/Vr5gz+GBzp8yhr3noNeBRxjBw
 I3fseTbJjUG3mDGcvFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..a89955617bec 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6056,6 +6056,21 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_bandwidth_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for 2.5 GT/s - 32 GT/s)
+ *
+ * Convert the Target Link Speed (TLS) field value from the Link Control 2 register
+ * to the corresponding enum pci_bus_speed.
+ *
+ * Return: pci_bus_speed corresponding to the TLS value
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 352079393edb..d12875c95491 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1739,6 +1739,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1

