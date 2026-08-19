Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3593A9D84
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146005; cv=none; b=AyztCNz/JzgqFglhIH51XaYEgupEHq6l+JDK0FkfmS+PM7lv14j8VQoYW/096V9BGUtb4mlMKh5tOSPZBCe3WDglwzEP70CUWp7H7wko9SBz1qjcE84x4KJASDksXjU7uuTuK6JqBLhb7M5LYcb2iIDByCtzuPxSn7mx1PoACk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146005; c=relaxed/simple;
	bh=gzbJaxCxPVY8JnK4ZtjTaXSHrAoIPOQmaGGP+IIpy80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDgWmHfl9a49eToeovID9f7vopR6jfz9JaAQkkpww0wKPCOLZbzdEknaEjKhIuVEJzCfIik9z5vxc5OO6ClDqvKxGdql/g/9rSkQPDSpCzI1M5mXIHYdGdkjKe4HV1hWh+pRtXdKvb1VupHxAgG89u4rdC2nD6l9DdVCdzeTRdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/wHwrFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOs1bdBJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/wHwrFY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOs1bdBJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0PiZ372613
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=; b=e/wHwrFYq42rNYiU
	I1hvIeC9ytkAoW6qxsQOgpdSbzt3axbxn9xFlUl+SLna8EukIwer79oGUe/+VIQx
	MP+zC6DOWjvWBw2UavA/HQokpKD3SF9vYuIlUjSeCm51sMW3rA2W64cam7BSWulb
	Zl7BgdaHw6OBlKUb6Ok7RzFfD93cUHxpVH0m1YU7N0BYAcmwXfbht2r0F+4SI9jI
	2/WMIqqQG6itQ+xW+47XGUJ8OquEjrw/+8EYCckbQRJWSDEiviaVOiYRv8r9+jTp
	AOFLh2COC5GxMP/L/vWytpDb9kdYFc3oRQHVPumz/u1PqKIjVvbLmzmItZXi2AcH
	1Wpsbg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbdur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 13:26:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1540025a91.3
        for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145996; x=1787750796; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=;
        b=dOs1bdBJvVCjvUDlVULZ3YuxqNiVYw6FDOCwaKfN9ax/T2UsTBazd5kbPHgUSWQ6+n
         1iBSYLzRxVms6LgNbrtI7Yh/9kQm2mxaZEoXR7qI8sKBLsUgJccqMX2HIlJiG4iIwTx2
         d4bNJbrsAa7/O2Lv8QDkVn1EiA3Gu9h7+Tb1atC15e94F3SvwTTEP6lvHeZjOK63sY+7
         nHkdD3MNZs7DjK5LMhC1jlUaYh/GN4OGAKzaghbXu6gknvJzx/+25Bvs5YxD8L1Jc7Eo
         z5vUIx0M6iADaEdt/zdyb4DndIj2X2DgtS6smgYGgXnXGi51qKq+qS6OxsbrdF2XKtqT
         eHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145996; x=1787750796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=;
        b=d0Lfc6NxwjbnuVMmUu8OyuvYfQBRucJGWkE1CceRoiPBigKRE712D6c1+U0IHr/JBU
         LbpU59/J1jxqSVUR6iGIUR3k5m/c7m/W2G6b1OomRDhaSt8Ob4d5Gi/EA4weLYBWs1Lw
         HJkF8iIBFdg052AiwKOcJIW99RMOW3e8AYWVQSNGYrLRVkYN6x/P3494jR5noxWC5Zlk
         GIg6N1Uj+j6x09teRotcwnTw4AvFpgLm/zSQFwsIaAkJbs7atblUbJ39a3PTuW5Sc7f9
         L/TYN3GAbYMLMWAfyuRQ3lozMHNfF6PpZlaOKE0HeZ42Zob28RxWebld4FO80N6ET6zy
         K1UA==
X-Forwarded-Encrypted: i=1; AHgh+Rpoz266OhcKjJ4UD/akylv6nQdtChx8R1D+9jE2SpWAoFxJtf/qZLBAbIfIpEs1xrJr9fA=@lists.linux.dev
X-Gm-Message-State: AFuF++mVZRoIHuMNJLl1d6xGX+ExfS4OaE76eOKfcqwh4YCCz6Cgb7v3
	OoKQf4/Z/lgIhValHrDNTrPBnLDjLXzRAxzAKjlcGxb/cSS9JvoMUIB6Mj911ZktZfjBIjpxPSl
	25gdrEixMLRQ3PbNlDHoIMnXHNWKwQfktdPyVuTsiO5vpjChNoqi8Mac=
X-Gm-Gg: AR+sD12XlXLRghhW3JSBffZl5vhQPBgW/jjiI2WRkzi/Lkv/AO0U8ZhrSQD1gmtPS5f
	bWoO+7rYduiEpDg1AiUpv5KkFtIKhvtwWMnib9Inf2Fl0knfGdOcvOBvsmmaxreEm99rOj2LDaG
	GE7dFtC5GQNeqpD6cjkh2ZWpoQA0QoBJBa6YBvV7A5nB5Z2E2RYkwrWLei1TOUE1WnLY/GTKDUj
	CrPuD++oTIOi8Ycqy8lriPfO+jV8oVPeK2yEOb3+F4eZvIpSa5MbXVZUba4MrNXqjqaFzHc2+KA
	BUlpr6vRg5MpvwSMVVCuLYBnbvXYf6oHo/FFCxEsOB0fqjisYd5HU8HaPSnEmJ5erc77g4FMda6
	Ox0xaNdGozT9O079fVdiVxcLpWnxsbqSu/wc=
X-Received: by 2002:a17:90b:2792:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39581212156mr9783592a91.10.1787145995947;
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2792:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39581212156mr9783480a91.10.1787145995520;
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:54 +0530
Subject: [PATCH v5 3/6] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-3-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=1763;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gzbJaxCxPVY8JnK4ZtjTaXSHrAoIPOQmaGGP+IIpy80=;
 b=loA59unnBaRnNZxvG/WUrecr0BJunX0WpPSWWcivrQvZy9B0XTfHfNyaXVEQX9wEluKQnYWPM
 L8B/TkvKplZDph1FExIucdFvjt33wTNOLQlKQDL/w7YzJYt5HKKSivy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: fW3FITwKkXCtzrkdV_N-uEE8zrCdea9H
X-Proofpoint-ORIG-GUID: fW3FITwKkXCtzrkdV_N-uEE8zrCdea9H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX836TCTPQaWou
 sUCNxB4Gd3ZkVXgGbI3ejEi4l7qnMw+EOhAGlfIXYu4S6a8+0qLkJcjPml6vjK+NoCYTO62TjOb
 +J3wXADdTrHXa/VfACQIZ6QBY2dj+r/eEVdBT+5ejYIcaLICt5vhDWw4gX0A7QlmwNEw7Blkf20
 3VEoyGg5kcT5QjclhjADbmCEXWTW1wu43unSA1V+wMXQWEZ1y4mBlkPOqri8SeNDCUrOjweO6Jz
 O7Qdgk57Vn3n8V0OlXONya5Zcv0Jw2ILvCgZF2hbnAE2xwPvosJtPPMawsxBuB9LRxyFCFyloo7
 SKKEjIDXfMimmgWNAN/pM906Gq9LiwvFVGmpzTgm/oLg7P5+JqnP517MH+RwDZTNlBLBxp8ZInG
 6HWohRU14s/4LDJWwHviOn7N+EPrUsA2FSsKNsIIc8hUPDyWlBTK+SibzC5h22XgUxh9JSoMLXM
 zeaend12jU9SISYwnQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXxxwbeiQTE5rX
 59Kgw2O6uddxGe5ZmBGKOW/jHMWu3yN4wwyqqn/mbsaeULtmkxJnHwsSngdvvYBubZQR0bLB+md
 OkjXl/yin/ChhKOUMsWVYldeFM8cuZM=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85af0d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 77b17b13ee61..cda7d210ddbf 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5939,6 +5939,21 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for Gen1-Gen5)
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
index d1f2d382189d..244c145af04f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1727,6 +1727,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1

