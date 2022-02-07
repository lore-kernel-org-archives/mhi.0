Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2159.outbound.protection.outlook.com [40.92.62.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE862F25
	for <mhi@lists.linux.dev>; Mon,  7 Feb 2022 09:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJlqrIIvNy0JsJOQZ5yqSyeXPEYty3dKJBRNtq28KapKEFXSpuG3P0Tbpb0RO7jffvqHDj0Dgfqs/c3F/exvyx0Qkop5IYdg7L/EYoSyDAA5oEpe2vfdg8Vw42Pmwnj+wUxtIkPfulYykHoy6foShRGxbAxOJCOqCahG3MHs/aM+CR9BNJrQOTW6OcO0J3KFEzVBkCYatyaujsIpjFRHT2PwmkZT2m7oHPd5IJdjItkPTwxvxXpG3LYb5X3CMqanJmCnpdxtvgm4IRzlysV5yr+G5mASmxlaM3AmPZDJvYsC77lt363AzEUvj4PEL2aDZ5uw0M24jfWbXUQowBGnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWXZzJJ7LdKxnWrZ5xt0fuHsLQ8Z8+ipn+wk2yGoDNA=;
 b=GmgPygWNHvyUsH/feoblEvZ6l25absODizuh272e4cw+9sdw6i8Z7mnowW38OHeKtGhortSuSehabwUzKLMYUjlEsn5nHE2+eVM6R7zIM5lXQe3C/JyRNSe4p7GouDEhIsEJnalDvgIYX4ZR20hankM2JpnLUsnWgdIoUkau2qvniNZJcX9Tp14zT5ugssdJGh/tZrI27m7zQxOst5E5JMss6ggCbWkEhIrROIOUrNisTlUwRzxRdRI5VHwidUNdu0bSD9V3C8lr4V7YwN4ft3G9DE5Tceje+LuflIbsSJnR0bjvbrGVm01vCykkpqO6Y4mlONyEosOX9cQpnvApWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWXZzJJ7LdKxnWrZ5xt0fuHsLQ8Z8+ipn+wk2yGoDNA=;
 b=as/+TGl+8vVNlsTCdwHcpqwlPNuGnin3M2lSHJ8QP3dz3mcIbF6L3f7+BScwEDh2ecjrAgFkZTGpI7nHz/A7hjrTupehcEY9FS9tMllxsdVVtI9WaQ4eKLE+j0wIaXnpDWMXmrvefSSwpng15EUBanrY0urSsT/HHZjCs/tsDZaXQH4mLyEj/oOktHHO3uUYK0avPCh/cRsF3Uw8YTPrW0xFZAfVtx0pBjHh2DZiXeBclg7IUd+8w47Nn68nJuE6aVGb670suaQzMDVbkCwNuQ1s+yviP2mymwMpoeJmB/Ks9Y3sPdIKyBO/Rrw4JSG+wibSUjbV888DQzcpHeBDzQ==
Received: from MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:113::14)
 by ME3P282MB2273.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 09:45:11 +0000
Received: from MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 ([fe80::51c0:ef6a:8be3:7a07]) by MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 ([fe80::51c0:ef6a:8be3:7a07%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 09:45:11 +0000
From: Yonglin Tan <yonglin.tan@outlook.com>
To: mani@kernel.org,
	hemantk@codeaurora.org,
	mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonglin Tan <yonglin.tan@outlook.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: pci_generic: Add mru_default for Quectel EM1xx series
Date: Mon,  7 Feb 2022 17:44:31 +0800
Message-ID:
 <MEYP282MB2374F375D13A226509BB7013FD2C9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-TMN: [ccD2bgNuCB2H9VJk25JdfHbOBMZtbILE]
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:113::14)
X-Microsoft-Original-Message-ID:
 <1644227071-1729-1-git-send-email-yonglin.tan@outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d03fd99c-be5b-4f91-cd81-08d9ea1e8873
X-MS-Exchange-SLBlob-MailProps:
	CaK+F7me6Cl9XSIgQoX/+4HUmdXaTcMQ2RTC8/l3MkvsQIf/6mNO0T+YmMtyvlb2UVjqFtSpU8KsPjF/vPfJ5r0Zl3v1BBnf8hSZpRWELwzNeIdw12fR9NMAzjxxWekAiRWuiAw/TBtVFo95mzWrhmNJ8+9YawAeCRboa/e1uhlvHk9N18i3i21M5FlS0tR8iniOohrChn4lxCgRJbzpoTcBO17GJdBLNWa4bVDf3bSq0abo3HSxfVotYDsbQ0OSF4ue/W6+Rls5I1TeGq2iCZW00DR6bqArlZzouXW2IsNF/G/ewTNQXWwlJxsxz6W1iCqFLffbebiR4j8oLkwVMkGplI+NTj6H92ksMS7rjj72B1eud3wzxzjhJ+QbdWagKcFg9kPEiF/91ErsNaFfKbSX02R/fUerKNLBfiOReODUIh55RCluJK1BM2tfyh3qeLPuaEpImKE+f18skhRvVXV84Ua3UuU1n119z0xp0sqf8fQ/qDi9p5/hFaGetXZXnjVttXsmra+z18Lf56XKJCN0KU2spIhButEnxmHIpFmBdiCDVhTxfulu/LpMsFNMy+1optme8Qunrir4zkrJLvOGOXssAdoVXGHL8IfvmNwuegl1pJlY6YmCwx/+hV/omh+tuCfOBHkalYVKl9D5mKKpda6YKtv0XemHlP9MJnMMsn+5keSc9crbxp50FcoufvCGSk7ENp5uSsChp6CfhxNqYZapooFofBCKsdMHlwD/brKuuRlOCA==
X-MS-TrafficTypeDiagnostic: ME3P282MB2273:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qxL9hRUIGJd42B8BXzZnqTcusMgvWwE0b7FkfDPZS/3Xd7JDwWuAE6OoOfxl1tbTtwYFNEzifvm9mYBYwQ3+CYr0RPWRgbJvB+l/Cvsy8NfrS2mFhIQpej11UdFkMecwfWXuu+/JcSUnuYtm8fGlr8rX6zSnMUjHDGcOfr78ydEmEc8Vmgw+6XIwlxlcQuOWctbnhD4miX4K1p2YguEVUubJkOYp6TZUJ1vzpdz1l/Vlu58E6FASjiS622dricmMXNe5v2MmJFzIYS4rbNf5m7jtWBCcne8gJ7fCsy2SFsXP4dYeVXCNuqSfWC9OYZBbERKrlAfDFuEUuJUiugWQsQ5XZwEfHXS5oiSeBgsaSK8KGl1sXb7Hw/9LW3g3FAcUBz0i+ncnRA0iU0SrQ+Ihtnm7o+WfzJeYU5bj4B0QVXviidLCDUUVVx4WlpxG1+EJjUqzxoLhNGddjiYP1PCNiMsfcuvET/cynnQBYh+1XRPFCFI0adNmOE4Tjcxw7A5M7blR3L5g0i3EnVriMcXRc+cKTFNXZd6qN6RteVUjzETKxos/AArmWxKE97wDyJYcBoPhgQcqv+7t2wWWHdSVxg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4/YZU47RiycN/s+exgwszwq8RrvDTOtx593GYAL6bR2qRPP6w7x4Svuq6E7Q?=
 =?us-ascii?Q?jWJk5KXOmCTclkLO02wTW53/lQ4HiYl541uTwW1QLHyA3+4iNJFiTAWmId3E?=
 =?us-ascii?Q?TmWRrnci6YcXLg9ifd4GgZj56iT9NpbVTxOkakRDuynRv1w2ggRsxQRicKda?=
 =?us-ascii?Q?RAUA4vJTA+oiDB7XpuncJalv6RojbfDbIRyF/QPbQwW3ifDBOZqNXvxkN94/?=
 =?us-ascii?Q?7YtZLrmgU6CQ1oqmzVOHc398RiK9Il9rRwmxELQcir55KOsEX7hCngKn3GiQ?=
 =?us-ascii?Q?GxA/6LThpGXJ5fqut+nQ3d+chD0VLklwTZ5+mAj/ncFr13hZYJ+Nl9s6j0wO?=
 =?us-ascii?Q?GW2E2VvRY+8nNZ0bxrwjSzQWQcJ+jQT0h5rIFQqU0PPobk3j0+WgaIIiqEvi?=
 =?us-ascii?Q?zdU6v2E3WdMM6hMlYVylKDhWbgTR4Cn9x1SWKA0bVcBN2VNFA7uxjGiwNuHU?=
 =?us-ascii?Q?PevLSutW95XddCSKpeYTR/3B8p5QYyzoP8LXjuo/Ht2Hrvk/Av1BczWudQsY?=
 =?us-ascii?Q?m2V8uU1F4KbQCxdCKp6WweGrW6VpSRwMCOWFEbyk5s6UdzGrmWIQbxLRjFa+?=
 =?us-ascii?Q?Bog3InAEep9uwdGeIhYW9MxQ+aeAiw/1Z/t+OH5oEqh/8EDe3CTw3vYySYPC?=
 =?us-ascii?Q?cZRkrWg0G0YCnyGAkLpuybfQrijkKgyAEp5+L8G3EcBJZjKldED/UUA0fYeB?=
 =?us-ascii?Q?XpCvQBiitcj6FS6Jhp7u0iYy4ctjTDyJeSxpz45eioXyNqRxPPxe0dXTHdPX?=
 =?us-ascii?Q?8ZYUTUOBq3+FRIxNrBNBO4wOgnWLxENkASvU0QW5GI/fc9mkq4m4+S++mTSe?=
 =?us-ascii?Q?bWpTYLgm1fdngMgy7r6qWM7NpsYJQszCV6pM+NcDnSYemZFqVisQINWysdnI?=
 =?us-ascii?Q?dnJbq4KdUFuPHT2fM1p45x3Ja0QtsrIRs+9oq4kwG2/2hDb3Qy6BohVZlBhz?=
 =?us-ascii?Q?m51+SxG4KdIq/M5gi26tgA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03fd99c-be5b-4f91-cd81-08d9ea1e8873
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 09:45:11.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB2273

For default mechanism, the driver uses default MRU 3500 if mru_default
is not initialized. The Qualcomm configured the MRU size to 32768 in the
WWAN device FW. So, we align the driver setting with Qualcomm FW setting.

Fixes: ac4bf60bbaa0
Cc: stable@vger.kernel.org
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b79895810c52..9527b7d63840 100644
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

