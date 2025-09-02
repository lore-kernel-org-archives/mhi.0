Received: from mail1.bemta40.messagelabs.com (mail1.bemta40.messagelabs.com [67.219.247.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DA311592
	for <mhi@lists.linux.dev>; Tue,  2 Sep 2025 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.247.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832219; cv=fail; b=G1vfZ8y3I4avtxlhlopucXguFZe+CqkfIqkS1FVduOvqAk++RCWnI/fWKNxeAb/Sayig66moxD4QbjlI3566XOLcjMSmJyzJoQzqZsNs70+7MfekqyneSU3Cl11LpXNsgYvLTMjnmpCLSRe2HOUGcJpiZopFycUnwGZ9T7PA0iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832219; c=relaxed/simple;
	bh=UrzNuERjNIN4VPLLFJ1Sb7BMYWKze3yX1DMxfL7E1oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Um3Nqz870mhfntI4YKJbsc5QHYOZqEwl24yRiei+i6s9sY10yS28E7FRYRMn7P/PsfSnnoe5sNWhVPPbY/IyM0BTiaKsTg+3X3Q3uJVgIa7N8pODBd331+/s7hAUc0l/0mjtKJD0eZT39plPwdrJP38NEXYP+mv71juUFDl4WoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=E+sVSw2F; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=r8zUZGk8 reason="signature verification failed"; arc=fail smtp.client-ip=67.219.247.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="E+sVSw2F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="r8zUZGk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1756832216; i=@semtech.com;
	bh=L1QUH3q5oKS00cIH4fmjxCiSFjCCQX/LfLnYyvCrInw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=E+sVSw2FyS9Y5Dqku577ve8fPh1XLxNim5XpjD+t2h+Ryfv64rT+Pb4BtGH+EgIVW
	 lVWcS+ClaDkmX0Vw4vIClmFvTKyFf/F/OVMVI8ITBKQQWTqF0Fs70TcOALiXZZQWCD
	 f/rSEeuvvhXSc7O5bYO1tkDBB0uv+QjzB1yEcx1whK49N/xwbo3xLrrxXU/n7u4kuY
	 UyoFGk5WZUBDz3XHXNhYOh7A9PD83rH1RgGQPsuqN3fT8DGu2rK9SPTAT52sUpWT9+
	 szVke/2kJhWSplgYubZ4FokIc1kuc6n5iy64nc3roAkJqaFFmt62svur/e7yPGaHwo
	 H3AJEkpTeAXag==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRWlGSWpSXmKPExsWikf05Ufe64vY
  Mgz9tJha9H1eyOTB6vNg8kzGAMYo1My8pvyKBNWPDpqOsBZ95Kv5vOsvSwPiFq4uRi4NRYBmz
  xLFXZ9khnMWsEhe2/2OBcKYxSZw81MkM4rAIbGeWeHl9ASOIIyQwn0ni9dOHTF2MnEDOaiaJ+
  6cSQBISAkcZJS59nsgCUXWWUeJW8392COcWo8SHE3uZIZxJjBLTF5xjBelnE1CUaP1ymgkkIS
  JwiVHi+LulYIOZBbQkfj6+yQhiCwsESnT+3cAGYrMIqEpcWbQTrJlXwFTi0eSXYHEJAXmJxTu
  WM0PEBSVOznzCAjFHXqJ562xmiGNlJVZM6IWqD5Z4fOgrO4QtKXHt5gUoW1bi6Nk5LBC2o8Sr
  xiZWiDkSEgdfvGCGiPtKfPk5B2qOnMSp3nNMMDfs3HgbqjdE4t/nt1DxO/wSvW1GkEB6xijx/
  OFJRoiEjET75QWsExg1ZiG5exaSu2ch2b2AkXkVo2lxalFZapGuoYFeUlFmekZJbmJmjl5ilW
  6SXmmxbmpicYmhXnpygV5qcbFecWVuck6KXl5qySZGYDLh+hAxZQfj4xPN+ocYJTmYlER5Ja5
  syxDiS8pPqcxILM6ILyrNSS0+xCjDwaEkwWsrtz1DSLAoNT21Ii0zB5jYYNISHDxKIrxMR4Ba
  eYsLEnOLM9MhUqcYdTm+Hzy5l1mIJS8/L1VKnJdJAWiGAEhRRmke3AhYkr3EKCslzMvIwMAgx
  FOQWpSbWYIq/4pRnINRSZj3McgUnsy8ErhNr4COYAI6YuH7zSBHlCQipKQamPo7Z+i6S9uUq7
  acuOvxxYf/6plXXqXHaiJ4gtcmm/zvZfwrWm+ktVTKTjmx6DvHutL8dYduFTDdO7bQa+v1fYG
  /by5pMuNbck5+f87nKtPJ7sw+TzNVT+Q9O3ZDRVI8xmJmp0bv2kOVaY4vHygsZp6TedhGV3N7
  3JUNnmHzZtQwpM+J8X4yc8YfxmAPxoWvopJ3zvxeGixu0tohelVxW9KLlX9nlu3N8bnM29IXq
  Mr1bfsbKx+mRyd5Y/zfcYcHdKYJKq23XF144C5f/HzWX1aHzEyn/XaLLeXYonUtYerKRS8Sep
  oU+H7yp7DkWTW86wsTOH7mtcvRvL2L0muNHsyvC5n+NCuxdeG01ddPKrEUZyQaajEXFScCADN
  Znw0tBAAA
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-5.tower-929.messagelabs.com!1756832215!118528!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 637 invoked from network); 2 Sep 2025 16:56:55 -0000
Received: from mail-dm6nam12on2097.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) (40.107.243.97)
  by server-5.tower-929.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Sep 2025 16:56:55 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2fyifztH4uMVC2WP0QfxqgL2PfliYjijuToDjbOptWx+GMdjVO0fH1QbM9aa8jbvjYUObeIX1GqEwcD4xIfEqnXf2Cwibl9+buOM95ZalyJFLKJI5OtR9c0nrSfRBUm19LevJTRhHxgGsY8wiw3IeLJzTjCl+E9nXAMz0Gs3fwDUkgJGF/zk9AD5euRpv5x4bIlMcEnUlrWF9LD8f7L6fsbRLTlfB2CqMBxoFZa+lRmUrSSf2QJbBKgRA1/GZ5hkua6vsdNy9Wa6vZY+MIOaizaQ1nbKODSTF+lNxnwb6gbkkynlxGckckaQAPbqYuVsfCyFyKgTLYkmv9UPcTEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAIwUHMkEY4dp7YAVO/829FOMZlx+2CU9KcYXh2MonM=;
 b=JQC5InJtTgj8/JS4f9xr7UElj7pWf85pPwyTctTa3zNjoB2KlZ5pdPJmZzfnzRZOPJyTZUia//VaJX+bGspJO//cryO6q+pQbvB1NoaUmfg3bZ1yUK6bqDViNqOr549L7J+/qc13S/HA8ZWkXRVmixVyD62xRXyNA+rm/lhPLt7r0MTNqqsG5DtxlZ5o88hI59wuEAEe44BxDgSfBjjvd1BcNXIee6EL2yR0ST6VQ7keJd2BJyqfJOyj0BQ/tRjywGp6L3sdfIWPPHZ6Zi8EqQMZq+0StlRS5ID9dtF6G1GESIhBa/1IsHBWnU0NdqmnacD47oyMfsYXLMCo9mlUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAIwUHMkEY4dp7YAVO/829FOMZlx+2CU9KcYXh2MonM=;
 b=r8zUZGk8ZO64PsX1hf4AVtAa5DmXHs5Ix6LC7vAINqbnuifswZPL+FPXsTjbcMGtsJMxO9FDIAZIUaITpFX1WUFs8GmtiHwZ6hH2AhYYQYP9c/3dQI8D5hHUvyI82Hm1bzTCU/xMoOK7VaauUBdKiu1ZwOkSJLx2YHT4TscYcxY=
Received: from SJ0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:33a::17)
 by SJ0PR20MB5325.namprd20.prod.outlook.com (2603:10b6:a03:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.25; Tue, 2 Sep
 2025 16:56:51 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::8c) by SJ0PR03CA0012.outlook.office365.com
 (2603:10b6:a03:33a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Tue,
 2 Sep 2025 16:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 16:56:50
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Tue, 2 Sep 2025 12:56:49 -0400
From: Adam Xue <zxue@semtech.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	quic_yabdulra@quicinc.com,
	chentao@kylinos.cn,
	quic_mattleun@quicinc.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v1] bus: mhi: host: Fix potential kernel panic by calling dev_err
Date: Tue,  2 Sep 2025 09:56:35 -0700
Message-ID: <20250902165635.18951-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 Sep 2025 16:56:50.0055 (UTC) FILETIME=[9358D970:01DC1C2A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SJ0PR20MB5325:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 58dfea74-acd2-46e7-03c1-08ddea41b631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ly+aBW4luxbmqtPUo5WsHP7DbN/kIikuVvmvDDqsMV5XDDGayRL/eEuDLD1W?=
 =?us-ascii?Q?T+3KTDalm1TNNT7Kq/9RZNY+R13rLG0S1xm4mEoUFXPkBtBhnF7L5tvEKnu1?=
 =?us-ascii?Q?CRD7vJ+h61Zxp2y3MtbC73va40pkoscFcaDETAC+udVFnT0Ut1GX0lCOrkqz?=
 =?us-ascii?Q?HRYskskUGL/tHxaEZOI0vO5vDpQnHriUNvnVRJGuzyOxMBgirpMx06pF9pl5?=
 =?us-ascii?Q?bI863vIYHc9PrmDtilet0BJBn5zljFYwz1LAZ4sIRR8aim8GA6R05q1WGlLL?=
 =?us-ascii?Q?JW3QM66GRaO/gR2e5G/I6sXtJjeTkEs1JxRdftvK8dU6ZzSsrxbuK6bjsHhd?=
 =?us-ascii?Q?0q71I0Y6t2dh+UvUIUIQmHPeCYL9EdakEr1Tad+KVe5MS2+hEgjWEkgDEfOJ?=
 =?us-ascii?Q?RMQKTJo3nC4NAOYqF8OxaOKfuiJIHZc/d2sKmgwczN9fH4CAtFutFRci1fY1?=
 =?us-ascii?Q?DYwUx260/hJVH4rz9bmp8fhQol90KMElrm3H7Mq/RI4uAxG5WJv8PeqBeKZx?=
 =?us-ascii?Q?W2VGxfHObQjJU1vNXK9ND0dd5l9WXDMJ0hCqpTJkkptH+rzIEsUXPm8F5IS0?=
 =?us-ascii?Q?FoSsJPdS0HdAFRUKp9NlmdUHM6nEZszuE9qRih36cq8wkCXiXVzXejXCNDfa?=
 =?us-ascii?Q?aGHvd1UP6HLw3Ef5dW5supAbR3lqODlA2wpo2iH0q5phdjGXXwQR/KBBDsKu?=
 =?us-ascii?Q?79UU/sESksjOzrgHkzWCsQyM8p3dFomaVasxy2LbnbWVNa5vjTPl8XrpqwCn?=
 =?us-ascii?Q?OsF1EKKAyjMLWrHeGskIWiJ052+3mKVFhSNC2Z4Uvh8MJuSl1OIUBtmSNcJv?=
 =?us-ascii?Q?oMS4qmaTmQd4wgZ+aqI6Zk5P2NTNRdLeFsde++hBfrXAkUetb6H5pjRlonTJ?=
 =?us-ascii?Q?bdFXU0U3ud9VgXaADmgsFpHGsb/w7UJw0zeAqg3Ln1/yfeCi8fBHkUj4nkWd?=
 =?us-ascii?Q?GX2RPkPU/A9zAzxrV4mjSGyXw5QCw8Qga2KbNGU1irsnJYi18ZB67r+3SHoe?=
 =?us-ascii?Q?Dy6TvxPz2O1PQJV18XFjjJkYlkzsmvH4gPYWEFEmN/31C3MBFJqAJynM3Fb0?=
 =?us-ascii?Q?qqn3wIwRyfIKGOUzOk1S9+PkJ6AtVHg4GsGd3PeN/ujvp2udkGSEPbKUhN5z?=
 =?us-ascii?Q?cilQ+B+1bS9Q8EQGRAokqc48yVVyergCgVP+1j1IcyRgHGNRuusJONjZFzzL?=
 =?us-ascii?Q?34t9Vr1u4tjyPkaYFYoKlWpzANlGa9KwlVf1p0qOOvyPp1l7c8G7osJzmHRn?=
 =?us-ascii?Q?Gq7dS0Z4Gv3jVs3/pfU4FMKwZD5w0qjPi4BWgvnCIBs6EXazNl8XBdOqXRTn?=
 =?us-ascii?Q?Hg6I9qhP2rev1ZcvdgvyuIwIClWXpBana+xUdH7uSUSyHnp8fqUQvHMhSqSx?=
 =?us-ascii?Q?lwEgIBCQpJwns6KwAHju9pV/Tdvdm2I2d8Y30A2FRrUltAKvRDtw4PD8sZy5?=
 =?us-ascii?Q?L64MKGaeOs8xCut7Dq0egKxRYUcgM6vTtjyPkXTRBlAJSdo76dxWq8qQHS17?=
 =?us-ascii?Q?Jju5Rm0CC/pVs+bLcoyybx2ZnORwjiyK164I?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:56:50.5688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58dfea74-acd2-46e7-03c1-08ddea41b631
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR20MB5325

In mhi_init_irq_setup, the device pointer used for dev_err
was not initialized. Use the pointer from pci_dev instead.

Signed-off-by: Adam Xue <zxue@semtech.com>
---
 drivers/bus/mhi/host/init.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 13e7a55f54ff..93eddf302a49 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
+#include <linux/pci.h>
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
@@ -194,7 +195,7 @@ void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
@@ -221,7 +222,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 			continue;
 
 		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
-			dev_err(dev, "irq %d not available for event ring\n",
+			dev_err(&pdev->dev, "irq %d not available for event ring\n",
 				mhi_event->irq);
 			ret = -EINVAL;
 			goto error_request;
@@ -232,7 +233,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
-			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
+			dev_err(&pdev->dev, "Error requesting irq:%d for ev:%d\n",
 				mhi_cntrl->irq[mhi_event->irq], i);
 			goto error_request;
 		}
-- 
2.43.0


To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.
