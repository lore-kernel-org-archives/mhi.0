Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188B17B50A
	for <mhi@lists.linux.dev>; Wed, 28 May 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455197; cv=fail; b=aN7E5gIYoDi5Pvw+J/+Y1YMM+uCBsY6L6OPOxgPCy45sBtKPGfdtmQeYJvFEVaRjsFdjsQ+VjlMDaKFzJOCBscM3qlOnHp8B4pDo6pI50v7KG3VBs+0cFvp+zAjCjfinjl9IztSxDMImbEbkvHmT+tFDuAjJLN7LGBOlw62RXcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455197; c=relaxed/simple;
	bh=cdfwOby0l3/9746vq3GHpu0O+eJeMlwBMYIPSd5sspw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ftgdz1+AhKf/yylR3/Gs90fX+G8vWJrMovX76mFFNWvdlDGosp8oH9dxF3v6xWp9kyhRHS3DkTj6lrFH3KVGGVs2GjbNaEnH01ZV0fdeb9EaHAhfTT2UuecNc02diVbPqAqSmL+Bf00hyxHcXx9Ci2WGH8tbPS2lnY/cEKePmhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=lRDXEpp7; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=BdopeI+h reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="lRDXEpp7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="BdopeI+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1748455194; i=@semtech.com;
	bh=NiWm2qQOyJMNR7Xp+qeVrOO8SyuhU/0vuFW4UpU6r2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=lRDXEpp7RsSH4gko+A3ZRK0I3O8ldMc0/UKvdcPU3q8bp8+c8BBWds0nUJA06Baz3
	 OMZN1ounPvtbRWIWahST+LNjBy6jHSjR86EJXG3/rMKG4Y7ecol/XUqLmYiddq1DiL
	 fOfr6mIC9q3ZFQfjYA4H4IwV6FlX5dcRhr8R/JoexddoObuE5TBL3R1daR8WZQb/7N
	 oHv7ZgIR9QLCV1ZaJ0CENyuDVzSxbcf0MjU5WxNR5vDsLKXp8Ca5oETS8/ufSYEHVf
	 hEXUR3C1qMhsJ+EzbFDsnCATxkFxv6WZWybov6VojWwSMduGiSmtVYy9xg8USld2gv
	 2zeopIA2VikYw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRWlGSWpSXmKPExsWikR1XrSvlb55
  h8H2loEXvx5VsDoweLzbPZAxgjGLNzEvKr0hgzXhxYDJLwSruilN/lrM0MD7n7GLk4mAUWMYs
  8WrCBzYIZzGrxOfFX5ggnGlMEicPdTKDOCwC25klpnffYAdxhASWMkmsfHqIGcJZwySx8203m
  CMhcJRR4tLniSwQmbOMErea/0P13GaUuP7/EmMXIyeQM5lR4ujhShCbTUBRovXLabCVIgL9TB
  KdE6eCFTELaEn8fHwTzBYWKJHYuns3mM0ioCrxqPsA0FQODl4BU4lDq5xAwhIC8hKLdyxnBrF
  5BQQlTs58wgIxRl6ieetsZoi9shIrJvSyQdQHS8w5/QPKlpS4dvMCO4QtK3H07BwWCNtZ4tzR
  XUwQcyQkDr54wQwR95VYu/MRVI2cxKnec0wwN+zceBsqHi3xcuJCFkiwdApIPOg4xAThvGOUW
  DHvIdQkGYn2ywtYJzBqzEJy+Cwkh89CsnwBI/MqRovi1KKy1CJdI0u9pKLM9IyS3MTMHL3EKt
  1EvdJi3eTUvJKixBxDvfTkAr3U4mK94src5JwUvbzUkk2MwJTC9aEiYwfj3inN+ocYJTmYlER
  5Wf+aZQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4K31Mc8QEixKTU+tSMvMAaY3mLQEB4+SCK+O
  EFCat7ggMbc4Mx0idYpRl+P7wZN7mYVY8vLzUqXEec/6AhUJgBRllObBjYCl2kuMslLCvIwMD
  AxCPAWpRbmZJajyrxjFORiVhHk1/ICm8GTmlcBtegV0BBPQEeIRpiBHlCQipKQamOyrmze+37
  eazUAkxqji1YXGSJMvRarRVzQkNN7Eei0VPr3DYQp7Y/+tonqhY75THTRntE3ear1j/uQsdud
  Du/hrmQLl5sY3zAxdffzNrWn+cbsnXpn/Pu1j0kzxutfC5X+l2vd99j1Tbs+3QOzK8z71K/un
  W6+NVDpyVLh/wnJrzrwbpRuO+Qu5bNG4LvX6npSO83OBKvk75avtbsQ6m3rMmXi8SLuS0/xlx
  74vgT0Hdy1Wm/j//JVMnXcSGVNneF2cfnT3bDW/7+8Skr7sXRCf0rUuWeVyzqWfM13mezy8Er
  IxcmvLbbEzVY2bXeXO7ri3NM+KVSui9OKD62ar3x5lvDRHwiHuxOLUdrO9YZOUWIozEg21mIu
  KEwFUgi2/MAQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-18.tower-904.messagelabs.com!1748455193!182508!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 9985 invoked from network); 28 May 2025 17:59:54 -0000
Received: from mail-mw2nam10on2123.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) (40.107.94.123)
  by server-18.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 May 2025 17:59:54 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbOo2fdSWqT3I53b7S7IUHj/equDUsnzxvs9aegxmz2rZgodTjQZfx6eJSEJhLyCZJOT3uvxWHO9tzi46lPYhREqtnTSSXZb53haMefKLcZzBICN7EQGcg9jY1hGOnJVFwRjEYYeVwB1a+hTn5lKDvbIH05M1fjVcSVVhKg1YC9UUJEDNIWkpQOh15r7k0dXgXGa8Ofj2oJiy8QWuVnae4IOpgRXJdlsLcMOUmR5xodmc62h4nzLe+WLHAAgw0HdOZ4K3I8Ry/CAuf2uw5DQBRicCH/PEKMMANY3nzvn8fl5aR5SE7Z780DHL82LgYwlPqcEThTQKo2MElkr9yEY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=OXYStTveWMMFLlE7QmrklzEW4lHUJS0LgiRU3zC0JmAHCM1aoV4LfvmJn0aPBXTaUyG9kUG1QaRXBdDQN8citOsLwcT9/iPs/TLWGskF55es5BM3zmpf5yupCE9F9fp/xS+RM+AM9qqRRQmeIYYvuN7r6NZeQ9Uc4DzTYcTKSteuePhTZBRjk9+qsxrkRb115eZt/gdoB9HTs7sCy20Up+Oe+UEXqU0SmI9VJ7qBpmKFullrATIdU3YRNMMSf1ctBICZluZIL2Nr+ADczlfU6qJbatDqEw5VxS/8W6EsZxnrd9jvGEeuUL8urOLhp+737Q2a/tVcUwl96/OCdKaXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=BdopeI+h6XH858UP4vaSGwPEPvElxif8BOpDM1IcczVFYMCGYK6djTzRsfKRnjvolNbFFP/7g8o8KzGXiwsX36p+TfMFaIGlNPH+5sI9nNyjIa7R0r7GbR7VAaWynOXdhWkZdBipP3wLu+/Jdw83SBhJ7NSV/d8H/RpWntyeEtw=
Received: from SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18)
 by SA5PPF14728E2CA.namprd20.prod.outlook.com (2603:10b6:80f:fc04::988) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 28 May
 2025 17:59:51 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::f2) by SN7PR04CA0073.outlook.office365.com
 (2603:10b6:806:121::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 28 May 2025 17:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server id 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025
 17:59:50 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Wed, 28 May 2025 13:59:50 -0400
From: Adam Xue <zxue@semtech.com>
To: manivannan.sadhasivam@linaro.org,
	slark_xiao@163.com,
	johan+linaro@kernel.org,
	quic_vpernami@quicinc.com,
	tglx@linutronix.de,
	fabio.porcedda@gmail.com,
	quic_msarkar@quicinc.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.
Date: Wed, 28 May 2025 10:59:43 -0700
Message-ID: <20250528175943.12739-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 May 2025 17:59:50.0142 (UTC) FILETIME=[4E6299E0:01DBCFFA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SA5PPF14728E2CA:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f9250af0-b40d-4da7-1fae-08dd9e117125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VaTEmLvfMdnrhA92RG0t//FpIfsMHtsDBZ1mU3fHe6+Gv1UCjlgoMr3XQ3Zp?=
 =?us-ascii?Q?u2xVRjBN4L65RawRalRrsGDtCtVBu6NrzLwHVn/SBBRpTtdUsVtBlLpguViU?=
 =?us-ascii?Q?kiCtetQcR4k+6zN8FRibUrTS15KN7xMqrn9BTXufaZfSqcTvL6a4f5E7Anhm?=
 =?us-ascii?Q?Bu5rYBHxCDoVlkI0rwpKI55WtkKPQ5nVA/OPNtU10uqmU5k4EW+a5QcjZDrI?=
 =?us-ascii?Q?bUycu/o1NQgxSHcXA9XYVjVeqQYerNuH1lRDchtNAPPUhFHajCP8Yokuh3Dq?=
 =?us-ascii?Q?kIP9vmOe+gg447d6tsfxDEHkChitkz9UiSyoRGCQbhCx5cBX9kir3iF9sANJ?=
 =?us-ascii?Q?Vjtq738SZOvIHjP1cU+an8+yHwleGBDGrAJjmN01ZfI0j6xPp835Uo51ujS+?=
 =?us-ascii?Q?FQJPIpz+kdE2u/N9WXLPU2/FR8JlB0RF+QAFQNSwv7JQVVeSAIuD77hpI4Zx?=
 =?us-ascii?Q?GqPI2bf5MaANxUD/SO7J6g8KGWIL6bPO3+Hxyr7Bpb7xLYOaFHDWGFMYF8Sd?=
 =?us-ascii?Q?iu5xFAEzO2vsBa8yHEjJDp4p3jjc+hai6+S8wYEzecAPSCRpWfZ/7sAF8euO?=
 =?us-ascii?Q?x9z/TitPfKZwks0jERQu3T8ONdHOkN18zZ3iZv4WL4nIPLkcNzUkcaPNy7zr?=
 =?us-ascii?Q?o9NC3RueXj24x7lw0akfC2KW5viFPLvKSogGcyH0bSdXngsZBncm7qGTbAiM?=
 =?us-ascii?Q?TECBQ3FW2TpsDKabcRdfOob3lLDjONSG+/U6bYgJGhyQCYMbWR4SpAQwoZr8?=
 =?us-ascii?Q?9Trb7U+Y49NXlqKa/Ds9hOedLXV6YB0MtF8D970tHwiUOdSlDfX7hOEz4bzD?=
 =?us-ascii?Q?VsiMRKKVwDgzSVf1392v/7hqfDzt/1kYC4RQvzs14anIpFElo0HNdxxY2YF5?=
 =?us-ascii?Q?VEP6iqFTuDrAefXTPsMEX5iL7DzIqJJ7hYXTXykXG1mvw6389eupiMqm7eIi?=
 =?us-ascii?Q?DlMYpHJVCIKNPcThCYZPc5jwxPdc9X1i5R0yg7Lr3cEHseS5FmvKfn0H6AmN?=
 =?us-ascii?Q?MtNMVdjLJ7nYmuoL2yXPa6iBsigppRSBZBJc8C0AFHm6Ka86syEgrc+maJdi?=
 =?us-ascii?Q?TXfH8pQnT5IW99cx9okLa/LKaqsCZ6w90N4WdtFPRIdqhudbJK9ilccuSSrU?=
 =?us-ascii?Q?nhaSi5xa4P2yLsy409pb8pg694zMgYTA7KZzhCLKpoNJLybfe5mWYgBmszyI?=
 =?us-ascii?Q?hah0AXDWh1LBXZG4ePMe9+LX7MxXSqDgM/1KdP9dNq3rSI+9KbQJB8zlxabc?=
 =?us-ascii?Q?peuxCCb9P8NehlwAt99mqI6nbf7cla3pWyZC3ZfD+1Mc+hlkbCWFZ6YS3uez?=
 =?us-ascii?Q?8hIMNdjuWL77iKw0E5z+bTPBShcr1qag3iP0ceV0R4l3lfEIV0X9hxs/dmxl?=
 =?us-ascii?Q?eL5STT1wfco953TRdz0JtYAovfmMEZoLWh1uz4OzCsELI60bARgw+XutuUdm?=
 =?us-ascii?Q?W2JFpqtfaeZHjMyFhgMBC0GJhJBKIho8pQNyRm4F0c3q1tQlWsd7e++HW7Kg?=
 =?us-ascii?Q?5uz2ei3E6iO4qvymGs4wLau3YKeBblUtWXd/XAp+vYSIPZd903rySgkp5Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:59:50.5453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9250af0-b40d-4da7-1fae-08dd9e117125
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF14728E2CA

Add MHI controller config for EM929x. It uses the same configuration
as EM919x. Also set the MRU to 32768 to improve downlink throughput.

02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
	Subsystem: Device 18d7:0301

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/pci_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 03aa88795209..9bf8e7991745 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -695,6 +695,7 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.config = &modem_sierra_em919x_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.mru_default = 32768,
 	.sideband_wake = false,
 };
 
@@ -813,6 +814,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
+	/* EM929x (sdx65), use the same configuration as EM919x */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
+		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
 	/* Telit FN980 hardware revision v1 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
-- 
2.45.2


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.
