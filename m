Received: from mail1.bemta44.messagelabs.com (mail1.bemta44.messagelabs.com [67.219.246.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8E30BBBC
	for <mhi@lists.linux.dev>; Thu,  4 Sep 2025 18:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.246.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010875; cv=fail; b=BEQ9CVZG/UfavDsEvVIVqFHyQq4Mewu3Q0EiBGomcd7gU/K6uNjcVwr6aDWTartGk/cZjJI2+72zh9hbGEcNsCxiDqvXZ5VZ9Qxm8D+axrIBp97oRrHnWMeh6LgBZ8fxFZWYG9v2bCmybNfLgVm6EoCSKxc83ujn3CqakFLAT14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010875; c=relaxed/simple;
	bh=kBK8JAdNmfjvSLCukPePCzra9sJwEVFr2sUoTIJijhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KcRGzECtYCan35KznA4OT4+7f5sppJ8enFaRAOP2W6u8dxcZp4J+Hmf/tQGA+R+ixP84KcY8otPB/nNZ//ddoaTuhhK6ftxvUH8EJAQxlzHsv3gFrgoYmNsxlWhfcsnwJvLIXs8RiMdtuW6lhGowaHwwQdTqpBBrrOjn6RUVO+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=bVPRj8bX; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=V3biNrwq reason="signature verification failed"; arc=fail smtp.client-ip=67.219.246.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="bVPRj8bX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="V3biNrwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1757010872; i=@semtech.com;
	bh=I6cL2ZW9XoE/7oFqh6bytqeqNvjH3UizOHZ16q7jlI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=bVPRj8bXMzZSjshXcFcdNEyhIcIJSpZAwukEOc0NPDCm8hKtzZO4HE23k6H16WFp0
	 gztZiMESsttSG+LYmL3MAmjbf5m+r3v5e/Og8AdQYwuJxt3PR2MfPLTaStaXGtKDcl
	 MvsKp66sUkinH+D4H2emZBmufm36g757ht15oAGacBIuItYfk+ya3VN3WiDDXen8eO
	 r9xedShXHYRpEhTgX1P4cyI7hxf+0yqgKpnm1HmtYOv2oHU6usofM8gZw5+P/MGS0i
	 Qm+O365aC3H2wPoAEjdKR8qlMz65BOvETzihsi7+IKkSOq2OYplAr9pOz3SB4ioh+e
	 hBLq3xM7bkw0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRWlGSWpSXmKPExsWikZ1Wrrvj9s4
  MgxdPeSx6P65kc2D0eLF5JmMAYxRrZl5SfkUCa8aF5dNZC3ZzV8zs3sjUwHiFs4uRk4NRYBmz
  xIaDCl2MXED2YlaJZ4/3s0A405gkTh7qZAapYhHYzizxcW4wiC0kMIdJ4vflQgh7JZPE4y8+I
  A0SAkcZJS59ngjWLSRwllHiVvN/dgjnNqNE46qjUJlJjBLrWheygvSzCShKtH45zQRiiwh8ZZ
  RYfDUJxGYW0JL4+fgmYxcjB4ewgJPEswesEGeoSsxoPA5WzitgKnFp9SM2EFtCQF5i8Y7lzBB
  xQYmTM5+wQIyRl2jeOpsZ4lRZiRUTeqHqgyWevLrBDmFLSly7eQHKlpU4enYOC4TtKNH1+AMj
  xBwJiYMvXjBDxH0l3k6bADVHTuJU7zkmmBt2brwN1RsicfdSP1T8Dr/E95OakCB6xijR+nYvV
  LOMRPvlBawTGDVmIbl7FpK7ZyHZvYCReRWjRXFqUVlqka6RgV5SUWZ6RkluYmaOXmKVbqJeab
  FucmpeSVFijqFeenKBXmpxsV5xZW5yTopeXmrJJkZgIuH6ULFxB+P0k836hxglOZiURHn9Lu/
  MEOJLyk+pzEgszogvKs1JLT7EKMPBoSTBG3wLKCdYlJqeWpGWmQNMajBpCQ4eJRHeE/VAad7i
  gsTc4sx0iNQpRl2O7wdP7mUWYsnLz0uVEuc1BZkhAFKUUZoHNwKWYC8xykoJ8zIyMDAI8RSkF
  uVmlqDKv2IU52BUEua1BZnCk5lXArfpFdARTEBHuDzZDnJESSJCSqqBSXjb3r9VG4ttJ56fEX
  YyW+O2mZ5MZEL/xr/mWWEyuWc2/pOOzzhXbaahLCN2Y0U117Tn7d/P3zg/36WZ58Sddb6La/0
  0jDfeb2TZzFmxUIj9kvse93KHffVRPqce/JQv0puwJ7lil+Lh5imXHU5V7OX7laJ1xbd1WY+T
  fte8pzdvM6/VzPvHK1FhK8ppeO8e677DcudufzDMObLPacL/Ga3h75vf/M3LnxTcz8B0YuNkY
  /6kNdHMeatqzq11MPl3KWnbJdPeoMB58zdsb/pqvEtmk23hzDT3mckbMn/cndodxxZ1ehXfit
  cdtR9OrXmjwat0rvvvwW8HI7JiFu35LH/ArFB1UuMnhq0bQ84uXKjEUpyRaKjFXFScCAAovBR
  2KwQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-14.tower-904.messagelabs.com!1757010871!142321!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 20685 invoked from network); 4 Sep 2025 18:34:32 -0000
Received: from mail-dm6nam04on2119.outbound.protection.outlook.com (HELO NAM04-DM6-obe.outbound.protection.outlook.com) (40.107.102.119)
  by server-14.tower-904.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Sep 2025 18:34:32 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYHl9qBp70Yz/bAD9+eJI4sqWwwlz0HyjkgVtzHbGY6DVkW6zbgJWZ1Ze4UwVgSzG9hbNl6mMxtVX9JcP/GwKFLTw3MsWEjGKSjOqaMv+wxbrnEZmFT9P7Uc/jY9FHWuilbZclVMZXbmQFq9WiCwGNmwJ0Yrskkry2+b+dtNzUWOnDJwaG8A2+jVquvumOnO6LBegSShnfE67WaUQIims+yoOhbOrClVA5c8f4xSsRBGVBMS3s6IP2jbBbQ8KQPTzIqWjdqfKj/AJC4p4hLgW+1A+5Ye18zVXPwu+PtTDYhTzM51CEnF6dZDNgIDeU5ivySc0yZ1qrrXQAWzfJvAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ev3hD5W9iP48E3BhyzAuPsHn9YMXf9Gque5GKaX5Cg=;
 b=ycRMftXjFNSu5RQCrK8U/fhl+OpePSbAXfaOokPbvsh8S5K6V7UomA9lEdYdf+S7NvWYVrFlPMKaz1/RQW5QadQK2ZZjdyrhq27aCDhsmCi13Q7tUys/A+uy1qeV8pgUhWZ5UMhF0CQB7UvG3jgAajBuXURHED5IF92ELnqnUD+C4qBAztzLw1GY+j6bd8oMUhbQJ8ML/ntcrRoJfJ7VbtNICplaDqKpPYYttarP8iLpZhnYe76Mnqyq649i3M8UZOAdmfpZXzl2aaLsOPTAaqfHf+C6TvikQOsRqaSzaUoLXZqjBHmvlDiVS7jLvuKNiPp6JDr42iMItKtdYvROlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ev3hD5W9iP48E3BhyzAuPsHn9YMXf9Gque5GKaX5Cg=;
 b=V3biNrwqRM5WOo3cik8Tu/MmLXl4+eNdJ4/RtWxvb1kUhhhOK5spIq5rmZOdI1zi+VxxoJRBuxPnYvZIy0FewgS/jMIm9tn4M+MrXQgAuzW7DXmQpTRtA65yPirbSG3Ujq7W+2uiB0jhs629FVendPTqzLYZoBKt94aQMXirIvo=
Received: from CY5PR17CA0016.namprd17.prod.outlook.com (2603:10b6:930:17::15)
 by DM4PR20MB5750.namprd20.prod.outlook.com (2603:10b6:8:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Thu, 4 Sep
 2025 18:34:27 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:17:cafe::22) by CY5PR17CA0016.outlook.office365.com
 (2603:10b6:930:17::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 18:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 18:34:25
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 4 Sep 2025 14:34:25 -0400
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
Subject: [PATCH v3] Fix potential kernel panic by calling dev_err 
Date: Thu,  4 Sep 2025 11:34:05 -0700
Message-ID: <20250904183405.32986-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Sep 2025 18:34:25.0336 (UTC) FILETIME=[8A315380:01DC1DCA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|DM4PR20MB5750:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6e366ae-7ce0-43c9-ecc5-08ddebe1ad03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yawhsybezNRKZQURu6qggs6Bw27LRUNTLtkNq/z+27S2Og9Qozus/lciI6pW?=
 =?us-ascii?Q?LwGqb2nclpO8NB0VgYQTrZDJMgovX2OaGn3o2G7+DPDbgGijPdHq40uR8Jub?=
 =?us-ascii?Q?3M7zTerPZYZo7rI+oB/h4ApBRbDAICEcHhEWdjYDYaWUHvj35Nsl5TJKA9mU?=
 =?us-ascii?Q?D6cFXZp7uiEd7H02wLXgxeI9n6fcsBCQacp0aHDUq1ADUNRZw9O7Ga8tzW0Y?=
 =?us-ascii?Q?v4xNCwsDVnBa+egRp+tLS4PjfFl+ddfLCQYGauAEcvBkkWP68RgmRCSNQ+e0?=
 =?us-ascii?Q?Dmwh9uj9D0dPAvf08BZrkh5KABKG/30U62kad2nsL9eNWtqgmMxCTA+LwLR7?=
 =?us-ascii?Q?tjWHPwIut99H8LTJlUadNXaKwQQCGTmHsve+94tUQz7iTjBSLV4EUkCVuOsJ?=
 =?us-ascii?Q?5yo4ZmQ+P4EnYW2goYDjoMIwycbuwcKW7rQxfbRtpZj5W17B63vhaL8GMl24?=
 =?us-ascii?Q?yoQt2jgt7LbFva4grO3AMomSobsjEaQwAbpbxW2wItP4sEFfFJJ7u/NeYHzv?=
 =?us-ascii?Q?OxliqgDIzhnzQguK8kxyKY3QhPVQ0i2dbDmyAv3bqDXk654YMjKYiBs5WgNS?=
 =?us-ascii?Q?mkfRctHhBaKmx20X2wjCZ9nzohxmYEwYZxsDL+OaLwb/7myu2jKH0hu31C5W?=
 =?us-ascii?Q?SOeSZ8TwOI69p9ZsTR7LRz101T8GQiOm2Lh6OcWzZb5iuMVSGZsYfsF9QLGZ?=
 =?us-ascii?Q?TGlS4H8RgsfzVx2TMF+VM6S83WfYSPpt5ErJSAcVLZPUVYq/i0uZrc+YB6Bm?=
 =?us-ascii?Q?Apqv/9P9OZ6QI8aMNDlABT8ZPnBxZTuhg5+7D5iaFd4YolprZ9QdOPH+Ful9?=
 =?us-ascii?Q?/UL6CTE3yh5YswiK4wCxfgdzuXiFAJHZIUjrffhjmyL+GwVOyhBXsOdIf/7G?=
 =?us-ascii?Q?51IYB03zA0hFJqIxvSePC4uoOccpdhzuzS3fyDuyjAIjeptaY3f10n0Wwh4x?=
 =?us-ascii?Q?/XzJwH1SidOYSjeNNspuF/AUL337IWe+XlJsWWkivmRoQ0GqzLzcMzYwFAXM?=
 =?us-ascii?Q?tmyKZ8jPCAaZECTwiZKavcMjMF94B/7SMO3OoiMPRQCv/K7mjNQsDo0JUVL8?=
 =?us-ascii?Q?MO2R1WrlKM6SWpY03DTPfAbZ39Fo781k1bNRLgWz9E5v6Xd49K1ieQZod/29?=
 =?us-ascii?Q?RK8whcU9E2b5tSiY3CdofYZ4OgvMKig0QdOC8Vi3/e/GDPeE+CBfXST82qgf?=
 =?us-ascii?Q?05h9W6ZnaJrz7S+4X1HPXrD31LGwnLsQWxv+7k5R+TGMFn+BSYVUPAhfEtsa?=
 =?us-ascii?Q?Cdt0ok8jKo1T5OrvOoKVfPqCGYCNbU/WVMW6ASAbevhJrBO3AaX7wMdbZrpn?=
 =?us-ascii?Q?rsOwFer4IYs33ujDed0LWpFs/91s2TNUPODwx8ehB5ec8J0StDKhAx6ZlFAO?=
 =?us-ascii?Q?qlWvraw2pfNIWZibAbaY3/Ac8P6vZGDWP6s6T+ZCmR4XO3zvmxDFlg9wUSlx?=
 =?us-ascii?Q?3F57MyhwDJuwf1g7CnziTczc51b+11SHayDVe+3Jnsa6GqPMb4rTHT8iVZ5v?=
 =?us-ascii?Q?9QEGYHQdkginePUqgHkOr6ZYJM9qMG1XOYxW?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 18:34:25.8555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e366ae-7ce0-43c9-ecc5-08ddebe1ad03
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5750

In mhi_init_irq_setup, the device pointer used for dev_err was not initialized.
 Use the pointer from mhi_cntrl instead.

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/init.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 7f72aab38ce9..099be8dd1900 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -194,7 +194,6 @@ static void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
@@ -221,7 +220,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 			continue;
 
 		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
-			dev_err(dev, "irq %d not available for event ring\n",
+			dev_err(mhi_cntrl->cntrl_dev, "irq %d not available for event ring\n",
 				mhi_event->irq);
 			ret = -EINVAL;
 			goto error_request;
@@ -232,7 +231,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
-			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
+			dev_err(mhi_cntrl->cntrl_dev, "Error requesting irq:%d for ev:%d\n",
 				mhi_cntrl->irq[mhi_event->irq], i);
 			goto error_request;
 		}
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.
