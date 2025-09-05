Received: from mail1.bemta28.messagelabs.com (mail1.bemta28.messagelabs.com [67.219.250.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537A730B537
	for <mhi@lists.linux.dev>; Fri,  5 Sep 2025 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.250.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094113; cv=fail; b=H1hD+bBzcgSRdeYcn13NG6C50NFjhmx3UNbPI00TDKMaWye2CWlFfsJb6Z7UXIKsFNXglZIJ/tlW8WRqMuhr3Z87JAC4zhWkBGLjue5o1ayrrGuCVfS5rY4phDJrzpLdjIYLNBQgQPK9HPP2rVPKCjgs1+imXzMlePL+wjZ1p5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094113; c=relaxed/simple;
	bh=10qMxWAZkRFK2IXMTLy5ZusFOzY0jcJG4PAVGxGC3N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qML9mvF7VxXh6rLdAnOyPWRqkbWkXqY7Ip2IxhuG01bdP6+8bFhJxYUijcHMoUSiMhLWFf4d5/d014ysYyg9G3bzQokpPmvQQT59/V7DbNVePZOeHz3l0O1pXeByzO45YHkJQ+/I0FARdvgyFRkVf3YGQRpmVZgqdtY8irxastU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=aXKigQa5; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=RM34MyKt reason="signature verification failed"; arc=fail smtp.client-ip=67.219.250.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="aXKigQa5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="RM34MyKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1757094110; i=@semtech.com;
	bh=nEYuVdIZ/vv9J+5z4hknlhDd4x7jIbUpM3BDAjb7Pbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=aXKigQa5hqG8rUBzdLD7VsJWPG+LTMXMtlTCXdaGSAz/TKhGjNvyhsJpoDzXXE10/
	 BL/Y6BnvTDyyfNfJ9UEe1GMKAykUG7nuDTf0uWy+TzeKrFXbgoT0+COvs8UdQivUD2
	 ZtpvEiHaJVkpmyiSSUGesey55fIEDnf+gy3zTXnc3KzIkc622VZkpBhOotElojo6qk
	 WffiMhTEmA3kwXYCQRX/miuGNtdhozEP5I4a2cSS2Hv9UntSxySA3bTp2fy10G2wzg
	 LjA06A3ZV3vXRyE2Vf6boe8FFieLGqApHFSnYSbNKuhSi+NsDxDgyuX1pKvrafxQqn
	 eJ0SJVvboma4g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRWlGSWpSXmKPExsWikX0lXfeuwu4
  MgzkdJha9H1eyOTB6vNg8kzGAMYo1My8pvyKBNWPDwr/sBbu4K2Z2b2RqYLzC2cXIycEosIxZ
  YuNkrS5GLiB7MavEnSkXWSCcaUwSJw91MoM4LALbmSU6l9wEywgJzGGS2D5nBROEs5JJ4t33d
  lYQR0LgKKPEpc8TocrOMkrcav7PDuHcYpTY/PEaK4QziVFiyupjrCAHsAkoSrR+Oc0EYosIfG
  WUWHw1qYuRg4NZwFli969gkLCwQJDEzkuvGUFsFgFVia2/fjKD2LwCphI7W6aDxSUE5CUW71g
  OFReUODnzCQuIzQwUb946GywuJCArsWJCLxtEfbDE8obvULakxLWbF9ghbFmJo2fnsEDYjhJ3
  PhxjgpgjIXHwxQtmkNMkBHwl3t7kgyiRkzjVe44J5oSdG29DtYZIHNg/Exoqd/gl3s27xALhP
  GOUeNFyEupoGYn2ywtYJzBqzEJy9ywkd89CsnsBI/MqRpPi1KKy1CJdQ72kosz0jJLcxMwcvc
  Qq3US90mLd8tTiEkO99OQCvdTiYr3iytzknBS9vNSSTYzANML1wUJrB+OE4836hxglOZiURHn
  1hXdnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLg9ZQBygkWpaanVqRl5gBTGkxagoNHSYT3+8Jd
  GUK8xQWJucWZ6RCpU4y6HN8PntzLLMSSl5+XKiXO+x5khgBIUUZpHtwIWHq9xCgrJczLyMDAI
  MRTkFqUm1mCKv+KUZyDUUmY94c80BSezLwSuE2vgI5gAjrC5cl2kCNKEhFSUg1M9etmvpcLYJ
  8z1z4ySIaLMVj2jZf8WSMhFtF8jwL5ZOVv5i98TJrNWtc85vQSnmti+X9Rc6TrBdYXhvH2MbM
  1NnD/PxsT2/FTfZrVOfWlnu6StscF6ifLqrwPN3e5uVnYu7o4QuHYpchD134vLWFbysfYXsP/
  bJeMp3dy4e7KKlFBlaUxvBxJNeUrvDaF7Jl5ZOr2lqQHJasa9yfvuWM3a7HAtovz1h2Oabg6Q
  +F77dalk/5c/vjfNXhzXKz/4ZRNi3/8nMEsvTPNVkFf/INK+8yQ/sSezaoBJX7PMg6u3a2Q8z
  Po/sXMIJHvH15Lht+7GLS8WpJFLTt66jdpsXTL5RGz4gTnpNfd+7/sVJASS3FGoqEWc1FxIgC
  fFSwHKgQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-2.tower-945.messagelabs.com!1757094109!36134!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.118.3; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 24509 invoked from network); 5 Sep 2025 17:41:49 -0000
Received: from mail-bn1nam02on2103.outbound.protection.outlook.com (HELO NAM02-BN1-obe.outbound.protection.outlook.com) (40.107.212.103)
  by server-2.tower-945.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Sep 2025 17:41:49 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POaygwSYS9hZjgH4JgqERa37EMczCuLrj+lMEXyDSNMhJSa6SjYwdRXIFnOpp+X1hxAwk6yEFM8w45Kj1Yev4ydO6qpYr3abBsPS0ZeuEZbMfzDCu0IwyGESD8BgTrdDYNQdo+SLPAjeASHQa8b9gdlZVVADnlY/Y41KjNYnNcFesRPMzN1pyQd4wowa/2T/BIKcARiGPTleF3kVwfqjt0EPedosQxYB131GQEQwDc27dVY05B7PLHHeqyHKZSdgcBcYDewckxIVKRLwn07iBx+yOPAe1OcH1vJi9OZkj1H+A5YTCU8rP1lJYhL/RzUQ1eerjde8Q5YQwLZCze+bHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCUAHh2MpfVVRwyc9QjfXW7hQa3IQzxYzqid+uLMOiM=;
 b=bwQxzHqrkRI86qkUfgCfVKoOeM6SRW9vy9uKLd8dtWJAaPoQjhkUQ5iUdvkatPSC5ysmYHHnS8OXDSdWYU3rCYp4OIGmwZ9FCfJIgF8xSYxzxxc1o+2/ZwLRQp5P+h51UMd4xwch2xmft82KeFDnMcjKiyzFcdmD8aHUhCZrHgu8aByxj9jg+6zcKGPj99KNWNMejeOgIYmj4/N2Wq8DBSb89Fegsw4shR94i9403hlbWv2CS8zEZhqcQZSyUyWWAza/7a2wS2H/fKA2VhQRTX+nejqtv9in6j/Jx73GSLlJk247gu4U4pmzAP21AWVv1S+NCIkrQIT9VrB2Jf67FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCUAHh2MpfVVRwyc9QjfXW7hQa3IQzxYzqid+uLMOiM=;
 b=RM34MyKtPDUGiK9J3aAm7c+W/N3u1GVACiRbx3vwwIjDl972+cRK6dFCX8pWtFCr+EmhGavc3qP4HDUYTd802uk+WnaI50NN98Alcb6zeCGUBE4cwBG0hyVNfW3qOHvEDb5LdO2SacKn5HYEjnrDfZYCymV9xxx1Ev52wsHQ7zA=
Received: from MW4PR04CA0138.namprd04.prod.outlook.com (2603:10b6:303:84::23)
 by DS7PR20MB4807.namprd20.prod.outlook.com (2603:10b6:8:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 17:41:46 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::48) by MW4PR04CA0138.outlook.office365.com
 (2603:10b6:303:84::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.21 via Frontend Transport; Fri,
 5 Sep 2025 17:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server id 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 17:41:44
 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 5 Sep 2025 13:41:43 -0400
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
Cc: stable@vger.kernel.org,
	zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v4] bus: mhi: host: Fix potential kernel panic by calling dev_err 
Date: Fri,  5 Sep 2025 10:41:18 -0700
Message-ID: <20250905174118.38512-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Sep 2025 17:41:43.0758 (UTC) FILETIME=[58288EE0:01DC1E8C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|DS7PR20MB4807:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2da773a8-f981-4155-968b-08ddeca37afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ulOdOIPyYMfBOs9DYVl39OrzJeKSBZkDhN5+OycVn+S46M0GgesQjJkeuWFt?=
 =?us-ascii?Q?Tr8nKBZpYqafE6EjlisSO5Y285RHfuCCu3bK/u27MXLi8LjBA2zAHjKtOTVn?=
 =?us-ascii?Q?hKIhHDY0sKBfb3oko4/qadiQOazDnRzm74RNtvpQr7fNkeRZqR+zkwoPav+N?=
 =?us-ascii?Q?5kucFuM9AMg6AGqQTPQ1jJ9O5MDUBZ7KCmk30f/niyFm8QHlQS+YXy/Jtq5y?=
 =?us-ascii?Q?WkR1kizcRQcN05grTL0Pxy94tu8PfOQMJ9t+n2nxI+9IHcqaoVLR2n76F61u?=
 =?us-ascii?Q?7vdnTqq7AKED+ePhEnn4RDu7A1fSKzONlgmoHjur/fRSsQsgZU/TrZGIX/yk?=
 =?us-ascii?Q?yFkujpYZ16beiOTL6eBHnQUO+c/tgGrlqhIYlU/KbGPQ/8gJt8BF7jYUDNQO?=
 =?us-ascii?Q?C/xrIBUcDzZlOfTU5qhIZdQ0Op7IDvA77OANzkTIJoLua9CiNugCJvD82Qlr?=
 =?us-ascii?Q?djQ/wNUiGvG838RQDxFuQvLG+VsfIqxg/z1M4Yt/kFSHRGZgBvJ8vMucOvNg?=
 =?us-ascii?Q?W7vjyVKBnkToKXIcp7b9p922AUhBpeRstB6GFclINK7RWEI0Hi4hEIeNa0Uw?=
 =?us-ascii?Q?jnEFubsawd4sLSsCZagU04PB54J6aYZtTVi8rRvMvC/az08pJl4vAO9aRF9o?=
 =?us-ascii?Q?qnxMrAp4OTLf68LI72f8CSlVEBp7M99fyj6rLMbqqx3YhZi6rXao+O9NQKlg?=
 =?us-ascii?Q?bDQMiiUTUS9rX81am04dR8PN0zZRzkO0E8Dexah/EHAN/ljTPCh4/TJMBpDE?=
 =?us-ascii?Q?m2C7RyDbta4uT6FcNk5jPIThJ6NM/TBeAVVHsSVo56rR1EkT1jSXjqzoPjH8?=
 =?us-ascii?Q?WnfCMIKsPWD7IVceppBtd0f8iXZqgHWJOZfRGw+ETymw3OQ/UpjAzZZB70FN?=
 =?us-ascii?Q?bTPA2YplzuFsSsgZ4/+q7CQnJEpzOHOMo1Tf5xlZ5WTkECekbpFurJAceKc9?=
 =?us-ascii?Q?+O8fQchbWclAzGXcL/hnJVbSrLR0qNPwg1lnh+CsFveSFOe2vbTTcW1kb1Ka?=
 =?us-ascii?Q?JkQr5O/OnV8ljkqOcnncAz9d4PTvJNU1VG6poJIhvSaG72SR7yo/cJ4E4ow5?=
 =?us-ascii?Q?vxs4YGxF4jLwKOzfCTo/qGJHam8Zs72C12T/CSok5muF3kusCgR6hBQAqW0g?=
 =?us-ascii?Q?JxB2aRgmUXLgE1fdS31vXCsYgn4Pvfl50SAcgiINH26zL9ruoLGDpp3CjJDX?=
 =?us-ascii?Q?dHBC7hTHCm2oViI2/vp9b6rIK90rkbyJ8c2RLr5AXLQMoZYomaUKWHuk3afx?=
 =?us-ascii?Q?ysAhMmRGZnBi1P76tDEr/cxGKEw77iQ7qF4VES1zBJ0Ip3PRs4O4zi6gCu2z?=
 =?us-ascii?Q?jy/pLhfwdqrREpHSadHTXGj4+dq/L+TJrEFaqhYoRJOvvquyEMxdAkeCqJKp?=
 =?us-ascii?Q?nN/TPBTOmQu/OUZF3JpLvi1BlOtKGiTprL+QpdG1rQa02ZYYpBRW8BdtLP5Q?=
 =?us-ascii?Q?reMArD+wT9k6PUdS9MgSq82RjSUHXuTAVeDWc+THJq5o62CFEpG35ESihZXg?=
 =?us-ascii?Q?OImd9zGbrIzzVTGiALLCNSe4vpZFY2v6Gffj?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:41:44.1768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da773a8-f981-4155-968b-08ddeca37afb
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB4807

In mhi_init_irq_setup, the device pointer used for dev_err
was not initialized. Use the pointer from mhi_cntrl instead.

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
