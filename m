Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115A1D63C2
	for <mhi@lists.linux.dev>; Thu,  4 Sep 2025 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757007815; cv=fail; b=ZuTP028c2cfOFxObQ/94wkmVMDJb/9uoGSRDGDYmyQusnvE1Rw7iempUK69AiOc2p+N2g7hlv5YbmkCU6UQmkdW0q4R+6EhCEqBks27n2kdMNid44lhy83+fYit8pUnqm+cM61xBbJW3ih/35dR99aLgyoRmUFVdutd4P+H7ct0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757007815; c=relaxed/simple;
	bh=lIriZ1Kidl92kQAKYsHaZXENkgobFTq9gMobzMhrNNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ah9GAOFUHRFdU8a16XfU8OBByuRa5WDsXeFyVWehSKTecKACLKIjz6CFecQ8wCKrLFYQGEdSAx6nYUIrmvLSlmpHhL4KuJwXmg7ZV8UpRNpUtgF6GtZXDIG1k9x/VLp/VdTpUu4BInzebVJ5RLdHqOdkX2fDVqZEsEtaSZvY+UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=kYbNV2M0; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=fdr99s9O reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="kYbNV2M0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="fdr99s9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1757007813; i=@semtech.com;
	bh=y60seZusasOldV5mK6mCQCPNcFmAKgpcljtCgut8a/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=kYbNV2M0dGsWrB8A6HqMtfRGcw3CVl9UJvFx0cY6SYV6WKevdgMcfNtxTO4NDQY0R
	 M1j+s7B2X4V70+7VV9qLyyf+IkFLPPWdwrFvmLpsL6oa68OIoylY0Hf3aKhauvaEl6
	 +/rwuxCHBCw1EYw1l6hvJX8QpA0fh3BVRuERFSw6ozRHn6IbUGxl8dckXgzo87vbHf
	 3Il05kV8/q07JBXEBT35uazE2nXe1pHfSaut0qsigxkjQFQnfHIekfsLzneAZsYBBX
	 9FjZb5j0Esi1AFsUeXmY/nZ5VuyfQoHBGUciCzNbxq/73+2B/gW8prcgDbNBphKWmr
	 /ioIvavLjZX5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRWlGSWpSXmKPExsWikf0mRffI+Z0
  ZBtdvalj0flzJ5sDo8WLzTMYAxijWzLyk/IoE1ozL7dvZCrZxV8yav4q1gfEKZxcjFwejwDJm
  iab5p5khnMWsEncWzWeCcKYxSZw81AmWYRHYzixxuGcmmCMkMI9JovPMdjYIZxWTxLGp11hBH
  AmBo4wSlz5PZIHInGWUuNX8nx3Cuc0osW31UlYIZxKjxN7uA4xdjJwcbAKKEq1fTjOB2CICXx
  klFl9NArGZBbQkfj6+CVYjLOAo8WLDEiCbA+gUVYmeq2EgYV4BU4nNC+awg9gSAvISi3csZ4a
  IC0qcnPmEBWKMvETz1tlgcSEBWYkVE3rZIOqDJVom7mGCsCUlrt28ADVHVuLo2TksELajRPfy
  acwQcyQkDr54wQwR95X4cGwqVK+cxKnec0wwN+zceBuqN0Ri2ssGJkiw3OGXON+4F8p5xihxo
  eM+K0SVjET75QWsExg1ZiE5fBaSw2chWb6AkXkVo3lxalFZapGuhV5SUWZ6RkluYmaOXmKVbq
  JeabFucmpeSVFijqFeenKBXmpxsV5xZW5yTopeXmrJJkZgQuH6UGmyg/H+iWb9Q4ySHExKory
  VB3ZmCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgfX0KKCdYlJqeWpGWmQNMbjBpCQ4eJRHeE/VA
  ad7igsTc4sx0iNQpRl2O7wdP7mUWYsnLz0uVEufVOAdUJABSlFGaBzcClmgvMcpKCfMyMjAwC
  PEUpBblZpagyr9iFOdgVBLm5QKZwpOZVwK36RXQEUxAR7g82Q5yREkiQkqqgWnaZumAPw+vMH
  9Tkz1874G+lta7lKB3Ky8GTZBKaz1ZYpm18oBq/N4rNay3DR6f4i2+e3H3Ba+6yMWn2QK7Lvl
  ozDwV/Ut4ptYUrSKlN3oT1dOkFJg2Nt8zLV+73s9qZZeE/d894p/EYpv+2uiVfS1492Bvuena
  HybTjgvt4V25/0Xo3xN91rUla3xNaryeXf1t+3RPpSabxMMvvofexr3Ka/Uw3uoqMsM+jXdbn
  ciD871lXR76Kd0Cx7T414eeaN+h2xiy6cT2U3mfH5wP+HTo6es475cdT6ucQ7ct1RS+t2Kzo/
  3yT2Zf+Cd+4rBlDubatkZu6Q7dsPoHGg6vevOkY8qu1ri3TFHd46jkME2JpTgj0VCLuag4EQD
  RDK52LwQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-22.tower-904.messagelabs.com!1757007812!138866!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 17463 invoked from network); 4 Sep 2025 17:43:32 -0000
Received: from mail-bn8nam11on2100.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) (40.107.236.100)
  by server-22.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Sep 2025 17:43:32 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSOiUFrmnvpHyLk0MAencv+krkqQgjaV4EMMESRTj5zUtKpr54XVJZv/DDM+L2C/si5BDVlmzFqAaBQWsiSwmk3W1EIA+WlfMdu6nFMaDslCwhvxTYaoC3GKjP4HjeiVLE+VoIu47pJeuTkcmCBvszkJIfGcSW6flThUkKtjiq/2EwcqGdG9d5n+TrLIymTsvbFWbvMd1ie/StCJFF2KVm1JveK5XoWxunkQdniKnh8m5nExJHM0Qbnf20CFJ4pyd0vPiermn5fRPVxQIWWfluT963YrPgWs9ah1TjfcnndszE7ccZII191QfE9v2lRcshZlUrSyLdhE/LNij9MIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWBZcHmfWBRFE6d0dtrAdDCMMaL0CU3bgrw3k/qekwY=;
 b=XWXNh4UcnvYmjiQeiHqcTaKWqsHwWnlfykEXPVf0VjVHvnfV1TraZw7axnIZ3OmUrfk6PaGJfQPAIodELEFCeCL+TctVXXZL8/wWWW4hY07w/T/8+r3COABhYmniYN7bf+zPS/LBwXSHnsCTk/pWifaYgRli3Ch039uQ5CR+RILbGNLqzZKPqWL1xRFLlfJ9ZxlN/C2/KuNDiZtQHnE+RHo/H4Z8AwGDQuGdOEoj5K937WVyh/6CHbPEkZv/q8e1AgLhGUd5G3G6OwGPhYib/ROoFCteNCXBC7xNXVF/9expJmGmxz50SfaIKJjAIU1aqBIcDZTbzGPOOv2mYA/azA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWBZcHmfWBRFE6d0dtrAdDCMMaL0CU3bgrw3k/qekwY=;
 b=fdr99s9OU8nby9U0C2NK5x9EuMNZMFqJ/ezUl5ecMWiX1X81EtxtTy2mbcPPocFsjTAfXT6lxXsZR37RoYSuA+YD/JNgiS9altnYrqEeS1dfBp9QwynNTH50JXbfymOwMDpktFegW2NFb9/2J7QFMTldGasf3s56gqjDKGCvuLw=
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by BY1PR20MB7287.namprd20.prod.outlook.com (2603:10b6:a03:4aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 17:43:30 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::a5) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Thu,
 4 Sep 2025 17:43:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 17:43:29
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 4 Sep 2025 13:43:28 -0400
From: Adam Xue <zxue@semtech.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	quic_yabdulra@quicinc.com,
	chentao@kylinos.cn,
	quic_mattleun@quicinc.com,
	krishna.chundru@oss.qualcomm.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v2] Fix potential kernel panic by calling dev_err
Date: Thu,  4 Sep 2025 10:42:57 -0700
Message-ID: <20250904174257.32371-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Sep 2025 17:43:28.0791 (UTC) FILETIME=[6C599270:01DC1DC3]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|BY1PR20MB7287:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 77924d07-834c-4b6a-64a7-08ddebda8f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wVHjbPYgmnrQeCgWdvR1JV7y8h3yWW3GpPNNFyasvE1rPeBQWybA6agMbXIl?=
 =?us-ascii?Q?qo77AnmeOKelbVCp3OVFJ8+gojaa/JVTFpCx5Wi+ae6wDDyRwVX5AdS/I2u9?=
 =?us-ascii?Q?AoDyPpal9cBUDRKjnh8CN4Q5aF3SFlZ69ECJctHDjgSKYHHuKAewCqRgHTUY?=
 =?us-ascii?Q?8k2u6OEqqvNxXt4CyCqZ8AXTDdCCmtvcqnlwqR+U2Wuw6mWv1dXV8xKkC5bC?=
 =?us-ascii?Q?+U+NIlqlms96wdfS5Ie11B+rwpQJOLgQP0sSzpK+uK/g0BzYNiaoDKbN+PkK?=
 =?us-ascii?Q?+z3VBW//gjaU87TcfGYTYIvqej7o7cQ3S2LbYuvDDrFg3bMsctx6MfPpUKPi?=
 =?us-ascii?Q?8pSZqLsB57gybbusnNhD3wHZiCvb6lGffPATUtTsd+om13zmlAmGi7R+ykKc?=
 =?us-ascii?Q?BeMg6OhkQGjk+peFnnRAqC7z3VoZcHP1qMiTTL9ZXEGwhLkSBK0EqeuYB9/t?=
 =?us-ascii?Q?MTzRYjMkgihxwKa3y1BtqWwiIDiNRBikLnd6R8GroSXBLcqLsnfbedhcm9Io?=
 =?us-ascii?Q?6NHoDCx/SInrpbv9kHM9jOxaNC4Ej4M7xjxpWs/m5bA92Eq9k+D3c7etNXsS?=
 =?us-ascii?Q?jzOURU00YvdG2pD/MTYwMTg2gBW+3sKz/yXlzdp3oI4/+PAjbUbWqn/vYx0j?=
 =?us-ascii?Q?gRzX8J0+ZKMybeYFyeMfQfVtftU629o/yKkGrN48B5ZjpSx54cRVLjvFEXfw?=
 =?us-ascii?Q?vL/Wiy8T+5JJ9WYkYvFd9FS2cwSjupaSzm8kcwLiL74ZGBTHOIZH+gnSV/Ne?=
 =?us-ascii?Q?03tyaGQFPYEQUhCaXxogwBXBWo1jdBNCqgIq2Nu5+Sy9eh4I18p0zT6aLlQ8?=
 =?us-ascii?Q?H5EITqVZJnwZ97ByQgRpfLLGO/EPpc/PJ6M18JyvLTdX69ZAI+GRzKcHNsss?=
 =?us-ascii?Q?R3vPrHw6ZxOBU80lbybHZLOALBs4mNTEOaGcK2Ma+4YmNhacBhdWYJM+qVeq?=
 =?us-ascii?Q?m7UW2UcU/VEuQAEXLIeyxW+5ZwVGJCdtK5xBy4ff01+RTQv8EjdnvyIiNnX+?=
 =?us-ascii?Q?m4bTHi4bBf5Hj5aCx0M7mW3fnX/orO8lw05KwHOtZNf25YGjs+7joQuRUwEK?=
 =?us-ascii?Q?hcZiI7HdxMeXWYtw0U8dcza2iMgncVwRLQUcRvs0IVr4YuBEegOkuPGJhD6z?=
 =?us-ascii?Q?1m4tsPgWAZMYvQetx/qMatbpkO8H1k10D+5mp4ovDCUsuEJcAdiFYlvB+59+?=
 =?us-ascii?Q?w4qK9n2wes27qIMp7MOYV+mUsUE/21UIkajDvYsH440uQ1fdVGYz0IYNsjqC?=
 =?us-ascii?Q?P8fh5ikRz58zunUgN1bCvWzkUBiRpj3RWmuRV8yBgdKgFNbFTchQdoVN/XLx?=
 =?us-ascii?Q?zc/2JXaA8Fbujg4kZj0AZW/ry6Ia2uTnEmftWMqxuAn7eGuZt+IcdjbNhX6J?=
 =?us-ascii?Q?vr5Ino9pqRBPRgGBRFGLhq1Tm5C5Ibkp6rBkB6RkDPqLy9dxVMYWOAMp7o02?=
 =?us-ascii?Q?SgCkWTj+XY0lP1W2V3lVu9jaUd2t09lBEm8yeVURdbYCiQFtf8ZuJl88CG6u?=
 =?us-ascii?Q?Qntd5s7fhGKjqR4DLdOU9ojePYs+/kKNiJdO?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:43:29.3681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77924d07-834c-4b6a-64a7-08ddebda8f91
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR20MB7287

In mhi_init_irq_setup, the device pointer used for dev_err
was not initialized. Use the pointer from mhi_cntrl instead.

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/init.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 93eddf302a49..987dfde4b7e7 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -195,7 +195,6 @@ void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
-	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
@@ -222,7 +221,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 			continue;
 
 		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
-			dev_err(&pdev->dev, "irq %d not available for event ring\n",
+			dev_err(mhi_cntrl->cntrl_dev, "irq %d not available for event ring\n",
 				mhi_event->irq);
 			ret = -EINVAL;
 			goto error_request;
@@ -233,7 +232,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
-			dev_err(&pdev->dev, "Error requesting irq:%d for ev:%d\n",
+			dev_err(mhi_cntrl->cntrl_dev, "Error requesting irq:%d for ev:%d\n",
 				mhi_cntrl->irq[mhi_event->irq], i);
 			goto error_request;
 		}
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.
