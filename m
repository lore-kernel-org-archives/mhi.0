Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2150.outbound.protection.outlook.com [40.92.62.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B112F28
	for <mhi@lists.linux.dev>; Wed,  9 Feb 2022 13:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH99x3hA7U9ETIZ3MCSI+KJBMhEwsArCD8Pcxpji9u9fuValdX6VcNE2z4wr4g35jtPWYaz5/5nZhq6C7n7psxqxffSrN8TZyK9bV+s4dYFLsxelgiBC0YkXLlyUpK7DHJGJnxsPzJoe/R5xqxlFoBLU3d45NpELGTz0KhXRq/ltisbf6hy7CpiyRgAqhtMVqsObb2/Z8diHzjEQB2ZPNK096wisAIAKDcT1BWMKG9Ys9jJch9iztTWenc/jqylDGrhnXlr/e9azIen06zxm/FYOOrKT7X3e/8MWY0++OCeZwOCBBnpXKarHNbyTF3xo522li6IIN86/6X8JvM0wbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVekUweFNXNOB0DZVRYgZHRuApGfXegPd6+ifPMorUE=;
 b=k9cUQjkNN/bECsSoisuz1vhKwkzoSxb1PKVVVoj+4Hei6gIIHhwG5Q4YFYrM8Y1IV0hfSvzJWcEISnHA9blhNeKNxt+dn3EmONcvTg+7eDISt0lqjW6UTT1zeS3C8sEcutAW0+S9sj+Kq1HTPPylnYT51ZEJiIFcwhGcazkaRTGuc3mVjBSbEV15p6pOA4a5um3HErc11qv3mu2mGd4wxsPhlf1CkA10P9iYI4vexipz9BR2czKUWd4o3ELKHzWR2I3Akut9wrfrY9ITJL3TOhMTwdKTgM4Ny0aWorOFMYi9W9MYVo5Ij6mMe2Zfe9WwSade/cbMXQ/WfTpS53wfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVekUweFNXNOB0DZVRYgZHRuApGfXegPd6+ifPMorUE=;
 b=sHNiREAu68+7pvYpjp9oXc2CAZdc6MvO/6b80dNbb9h4MGIs+xGi4OxCUiHc9OUIZkxz7qK0cKkH5VxhhLjgK318gcIMNRBYn0ktck5NmBfgdoh/Q+0wbA4bvVYwSk4U/eL30zZxGpVZq9x3gFWm8Lh3WFNasJQ0NLVDbeT1JvPu8L+g8JqiUq8K+WNIUXcgRxHUiW8cDqP3RiBfx93x6ERqgPk39adpyLT210R2ks16hRrxjbhQ9FprTPLkhKdU5NzMAGETYznonWipLijnUOdb3i801hfsel/gjgXJ/sCy4Zt6Dt0OjrpitKdO7glKSEi1gXfXk7/4AsqFFdfE9g==
Received: from MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:113::14)
 by MEYP282MB1718.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 13:58:52 +0000
Received: from MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 ([fe80::51c0:ef6a:8be3:7a07]) by MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 ([fe80::51c0:ef6a:8be3:7a07%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 13:58:52 +0000
From: Yonglin Tan <yonglin.tan@outlook.com>
To: mani@kernel.org,
	hemantk@codeaurora.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonglin Tan <yonglin.tan@outlook.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: pci_generic: Add mru_default for Quectel EM1xx series
Date: Wed,  9 Feb 2022 21:57:52 +0800
Message-ID:
 <MEYP282MB2374EE345DADDB591AFDA6AFFD2E9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-TMN: [U3rIjHdscUO2OLiFnz5ayU7u4CWdl1G6]
X-ClientProxiedBy: HK0PR01CA0065.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::29) To MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:113::14)
X-Microsoft-Original-Message-ID:
 <1644415072-6318-1-git-send-email-yonglin.tan@outlook.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba2550cf-49a9-47ec-d484-08d9ebd44db8
X-MS-Exchange-SLBlob-MailProps:
	zswcL9HXbeUFaq5qz5DBNywLkgfnRPC4C2/rPSxT1EtbPEB0Rj2Q6FhcXNXl7pBn4SkUGXIcqSNwlD7zZFWRs4hsNBqImgQWxXTGuq1AwxCFQrbFlbF6e/9SHL3lDVA8L9afPydn0cM+yu8swwfmo45LW8MGP4SGo4bcErT9rbMbv7g4OB7AK05KtCkRwgsjeCyLWfTKxBVIHU2wZhsep4r/3EXPCPE+t9DE9Y8XzD1Q212m4a5lZbOe1PpL6jAuoBxSqDUUZZXxRtjojMO0A/+8BFD7bMYiPOPTEN3YWGd3EgWcyxSV9nikiZHneuzYEEHcytYo6oIBnOZMVHKukSra0e5K8y2m20hhQ8r/R09oAc1KyCpOWvK1UsLhXPyAQ5IB4EpGZJc9ykj2e37MIwXabts3V7v76O5kSee1WqPK/HorB7LgswvOtPMD9601bnxfWjjGsZJgj2OHZiJPyKEXRNffnWpAR4vRNumdgmQ/WMY13zjNQzqQhGE6KZR/ryues2fHsAuprdKgLr5Kq5u2r2VjklxLyH1Bv7yPi0uqjf9tw3L5DzsGsuH+d4DZvPuVHI4f6gLTj/VUX12oSR7cmVQ2w8evqSwe9Gy+yiP0bauSt4eSEvZFDKxpYzf9/Rx6/KvImhz0Idq6k6fCZ0vY96vuyM83tu14g9tpmxQXQmptxoFprOb1sir8lWNTD3xN2o2b6hvv24rzBGUnBVlZfQEWojAB4dzwb21wEyytKRyDG8LAG3urNxFCUdxc
X-MS-TrafficTypeDiagnostic: MEYP282MB1718:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BwspswXMagUAG7/GQHfxuc6r9MU5ctdM7v+KH6+Or22e1EW6fAx9CfvAJxIPx54VJNDrzuPHJttO2cn8qRA4pU88pq1lSj6ntd3UXEVfxKf6h4DzSdDWsINCVOihm4G4zdxL70rZSWVGFum9wiZpvrxc11WHLQyv7uIvUNRZ0JuM0uutuhoP3jPQ1QWDAsKVgCxYB5WTtf3afzLqDgnzbTjb849yj1d5Z1YQ1DjUs1Yjp8vmuivZu1bdxbLv3yTpNj8108F6PGe5ydg7BmBcnZcBdb08SQs7wB9NSYC7WgAAQugXc6wMHSmSoPYxRrhzhWHKp9kD+6kFYnTF68d+jbBoQGYP/rgcVZbtHSOhUfWR7SKvmt8SMeJUopVtPOUO74KfH8wKXmBd+5yPB23wdn8dzfTpxG/YxzpSB94OlNxR4fPtZ8A5SxkcYBzzahhVTY6xWdB6Rwp3kuwuM7i9Sm2SC2RWUiMxa1J5T7VwTpwU9lhkZgbrNmSRPMKhWOi7GipnHikHWZuT2SfjANq4j3jGBJ8+mq7JColx9AyHWYAs29kCE1LCUS+jLjS7y7n+EJuWW7sN4e5RBhLZFLfLIQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jhBCS3qeqidH3FMDf3zYEncOyd15wV62r237Y3+IxdfVjSU+3tcgpSbdDYA9?=
 =?us-ascii?Q?/BLZfWe5ksQFn00p+5wfixh3VRLUmwlNi68UTKK7aLBWodatwvcH4/G4di+H?=
 =?us-ascii?Q?mvY9tKECBKvZyV9Y7uu8KxdwZzmKNZVK5C8ssmf4AbI/P3z937o+MgF3akYJ?=
 =?us-ascii?Q?SF67z/iPNhWdfskB5ZDRv5fIhxMqJAnuDpTl7nJCy43pVTL4ZcUso13mbz7l?=
 =?us-ascii?Q?AlCTLAlYOwt6mgJDRSjtP3f4AgLOAMraJ+U7rkeGJWzkZ8xY32oOiPSO7Mpt?=
 =?us-ascii?Q?H5uwBtJUNB6vjFuD3onwUxnfhzGhCEJ9yBPoJ1pr7/Kz9laCziwj2YHCZnF7?=
 =?us-ascii?Q?DgiwLAtlHS6tkGvhYJLjWjRU2ENYabqPGdN8mGX5R+lm2LRyYAFQt3Q0/L94?=
 =?us-ascii?Q?EKSaOCia0kM9o/ywC1UQTaLT7Z01zPG7HK5loo2NcLDlS7ioMS5bCzqRiQB7?=
 =?us-ascii?Q?JqyiBiCoJNk6pqBE61PZ2XN+1ueqGtz837hYgDz6xqDqSN51x0XbYDKReV6M?=
 =?us-ascii?Q?/A0qeg6+9f3lcKg904V19ACF1Nzc6facOZufmuHJqbkQ0uUlNFlBHJIUEzcl?=
 =?us-ascii?Q?ME6Gs8uue1U5vdSbBOnl7xcnJkKgRjHZpxrmhTjz/RLOtqhGyIJywAF9b73T?=
 =?us-ascii?Q?ND6q7/R4iIUvjlso67PxEil59ejMvXJP8VE9McMiOYQb3+5YPjuF6uK8OOpr?=
 =?us-ascii?Q?5wHxTveqfn0AkZDh454i7aljTh+DG1keiifwJJfdHlBkYdiVg8VNwJ7r8hwd?=
 =?us-ascii?Q?xS5tH1SjjPK9Y/BesqXV2MNy0hNxaav8wsVq3u1PsitIhpD+YjMosmzrElJ0?=
 =?us-ascii?Q?M77AaDoslfWzkkwkl+t8cg138v8Ih2v17fp+8TrYpBiFaO5GWp6u3KYBi+IK?=
 =?us-ascii?Q?0F2VdFI2oBay6sGAiVNJ3rqzLCvU5KpmiUHYTMT9s+0yK/gk58pwmYbdIVSy?=
 =?us-ascii?Q?Fn70VSQYzX58gXM4N4VR1w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2550cf-49a9-47ec-d484-08d9ebd44db8
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:58:52.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB1718

For default mechanism, the driver uses default MRU 3500 if mru_default
is not initialized. The Qualcomm configured the MRU size to 32768 in the
WWAN device FW. So, we align the driver setting with Qualcomm FW setting.

Fixes: ac4bf60bbaa0 ("bus: mhi: pci_generic: Introduce quectel EM1XXGR-L support")
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

