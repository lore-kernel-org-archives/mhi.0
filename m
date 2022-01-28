Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2188.outbound.protection.outlook.com [40.92.62.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349152CA5
	for <mhi@lists.linux.dev>; Fri, 28 Jan 2022 05:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnLzENsRib9hIU1xj6+Nsn1Qr8d+qsf6oPZjL5DUVztTNFSk790z4CAr7RAfLA/W0EK+DPfRYX6pQE10NyjWeRr8yaehc2pPkWv4oYnidf41a8rZUhL6NJBHCp7XjhRt11oEGO4A4HjHORlJgZKkEv7JTRxvlAkghAN2hkWG3tKVrDtxcQ3iR4hBMJsSOVltLc3mxgxpQAPhE6oS+J1Fo7wsflIEQRBN8vjZmUYFz2q2RHisNWMJQRMEuSS1huF3jBNmO6XFZVHOFZVszPBYYzxpqzNV1a9u/WgXFcRd93Wi7Q+aK8hL/jio5FqvmEB0L25f+ayLn/mseBA5zVnPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOGBfrk081YctoUhRgxQOrd9imCscQ1F5lpiWPG4DZ4=;
 b=ex8I3r/saJ2q5C5i2w4ynqiOHQCQE7QsC3Z2Dz4tnJWYEEAnyA224qy6AYL5oOR+oVVa/htJAi4h2YGVsNsuCH/1iTgFiU/9slXLahnLQbA1aBR3B/eqHL0d0E8wjWmd4aNFpumHjV2kQPwAxwC9iW3GPKLl0AE5SwNekgqktn1EvYH2HLG6Es6wtVnOmMQSF6fwHUw1Sjj1q4D408+bFVZn6vwzIYW1To+l4mYV3yPtS3o3SNk1r95xjIAVdi2TqGsL1MTHQ2rew+N4KMwF34UXwQxTA7iVVp0nOvcjddeqmt/rxFzDJ4ZYqU3uhiKqxsx9KwEqfxDiDZ/GUuOmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOGBfrk081YctoUhRgxQOrd9imCscQ1F5lpiWPG4DZ4=;
 b=A5fok0PK0zjAIY/Npm9G1HvEXOc5mjYRXduNN8HpWeLxZX/cgAkb2olj9HClc4kX4etbO328Oc7p9vNI6iJWyaDGZoTQ/d9hlGUnzcfYobTmJlRNfGKZwxd+IRTCw8alclCWWUY78FZnm894+iYqc4dz2xdSJzHZCXfIBr322Wq6TlFrCGxx/GssQyot4IWiEbnfBEsY8kmsjwUqiZt5ubKcfw/LlgK3NurTiNKRDp0Up2PCCySW+nQWCZh2/Sr4Xqt0YM/WmMqMl/4F+Fihi7zCRCrLOD8h6yJ5hvXCTkKA+vD+VvnVZfqGufWrzxBmc7pr0ulNk3FAoNIqQd9HnA==
Received: from MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:113::14)
 by ME3P282MB1524.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 05:28:23 +0000
Received: from MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 ([fe80::51c0:ef6a:8be3:7a07]) by MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 ([fe80::51c0:ef6a:8be3:7a07%6]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 05:28:23 +0000
From: Yonglin Tan <yonglin.tan@outlook.com>
To: mani@kernel.org,
	hemantk@codeaurora.org,
	mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonglin Tan <yonglin.tan@outlook.com>
Subject: [PATCH] bus: mhi: Add mru_default for Quectel EM1xx series modules.
Date: Fri, 28 Jan 2022 13:24:04 +0800
Message-ID:
 <MEYP282MB2374C10BC162393B39D78294FD229@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-TMN: [vrudS4VVv72KItB/mfr9H+6jsghlsGmR]
X-ClientProxiedBy: HK2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:202:16::15) To MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:113::14)
X-Microsoft-Original-Message-ID:
 <1643347444-23151-1-git-send-email-yonglin.tan@outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b5e08f3-59cc-4848-d73a-08d9e21f009f
X-MS-TrafficTypeDiagnostic: ME3P282MB1524:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qgYRrc58o1utPr1bhjcUcyCdAtETQ0KzpOqhf02UO16MdU7g+PXcAsCksGo8FPR/Wr11R2hwNb8quOFJIZiRaPWCNtnIDupXivn+bHiit5xc3scWHGtofjdiJLOERUNGiV37AMcvO54/tM2ftE5S1BJhnEq07x+xK/X/0lTJrpBpgLcHo0K3SDn090VWJ03lBjPkTzFjwjXnyyMZLMbJZCUjezZUmNDtQVqq1xzYgKIFlG4h/p4zkQOhnGClavFzphP3qudlJAR5kVosp/8WdmIsOXKdamQIIc8nA32jrC06WrssrJ5qMmV/FHeEsHjE4V8D6boqUEaHQxaqfqkHoQyW6G+blg+IXiYGnrHkAhAHBWU8EsqWkdD2tWVhH8P6bxGfjfGyTrlGF2Wn/bKWZIqmIi3CZDu6Dq7CpIdiVgQsXs4zxhewQfCTd6imbslKNkDDEr6MUmEkeYs3sXYvK34hrrBPKYYW5ZsqRsKAhrhuhmkhwvS+EJ+unorH2WiEAMBZIQ+VrKWatIjynkuB3TBFhUj+YonZEEPbirBgxDG8BgAkUEOe9kVwC614Wou/
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B94h7dhIIXw4GbpT7v2qyrxURvwoRPrhYR4SqDYdBdbjrCsufPPKz4nM+G3z?=
 =?us-ascii?Q?SdN6CDD1/DSqwqqXMV3DfwzmmcXKq3A7wyuotFMXk2umLWysYUCx6Cnm3Fen?=
 =?us-ascii?Q?3ko3S1jkvh1XI47oaEy1DgjxkfEwLUZfEEFnQCVlebn/R1w3K6bAPvt8GkMd?=
 =?us-ascii?Q?wcdVu8HjINFqO6iasZRnxbZ/u+k0p7wUoP9TPmJzWk3J04cpWlj4Eb8TzaCA?=
 =?us-ascii?Q?PunYd7/WbPvRHtpnnwasmPRan7V0PmrpQ8sbVM3BNdO8b7Px0m2GmK3gtU2K?=
 =?us-ascii?Q?zH8dm/2akx+MpkO87p1qRLKvTFlF+tjy9Zdn4eoxVaLkI7EZo8Wt/LPNWaqM?=
 =?us-ascii?Q?n72C3TJM7HhKak5FfsdrCWm78D772yXEqVVF9jduOZJFKzPI8cXIpHiQP7IP?=
 =?us-ascii?Q?3wqhjRznU3g4R2DeB4kvkvEfLFbdcf434m6vJEr988gsocZgf86nN7kU8eAb?=
 =?us-ascii?Q?Wn/gc11PATpIpce0W1ZzkZ+2FogEMz8oXl5YFnqW+SCGVDHk5R3qx0OsuwDY?=
 =?us-ascii?Q?8Q6or/9RrX7i6bxxVrao3lHFC5fF8Q2A1A/gP6AXM9K7MsvS42sDncFJ0zIO?=
 =?us-ascii?Q?A6JaB29W8LvVHNIL1I9qXOSPyl5h72XzlQKcMDeQH80oGM/Da3SpRryeQzpW?=
 =?us-ascii?Q?x8beZFB1I4Abmsh2I/NeKPksaHWpvK0+zFo61sCE1QEftAAoKBmoY9Sb5Edh?=
 =?us-ascii?Q?L53++vM271yunI1CtvTfEKaDbNhE/5wCwnvJSlU7wBnmEXAGRlTvOcbYCuql?=
 =?us-ascii?Q?6u4xGgeeb1J+UVTcSrAY3IHHgT1aY4B71LzttOKuI7xVzGs0FkvGpV2Z8YFn?=
 =?us-ascii?Q?o2NMkQTUa3AY8a868zAhISptElEpL5p/N/NGc42ln2fl+kFLdWH/mUbG6NKJ?=
 =?us-ascii?Q?4SBc4E2dORH7WViZm5EOmNkjxEy7CXAmWn5LjHcDYJ01gL697Lwz/8u985QY?=
 =?us-ascii?Q?D8OHxVRD822iSA44pin56Q=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5e08f3-59cc-4848-d73a-08d9e21f009f
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 05:28:23.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB1524

For default mechanism, the driver uses default MRU 3500 if mru_default
is not initialized. The Qualcomm configured the MRU size to 32768 in the
WWAN device FW. So, we align the driver setting with Qualcomm FW setting.

Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b798958..9527b7d 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -327,6 +327,7 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.config = &modem_quectel_em1xx_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.mru_default = 32768,
 	.sideband_wake = true,
 };
 
-- 
2.7.4

