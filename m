Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3A277CAD
	for <mhi@lists.linux.dev>; Fri,  7 Aug 2026 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113270; cv=fail; b=cVAL7m3mjUDPzFGA7Z6rFSA0RZM59H8VTSkEMxwkuEgdpTrxmmr8yjLZ7eBGxEbiYLe9bzRtJZud4GpmUvTHfqBlOzYCLnzg/p37omjUs2zHcZ1xG2tYbPpi9vPyZnx2loV/0N6bbNNQHM8cXNRSk63uQ7CIlcV8FgBCwEOptWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113270; c=relaxed/simple;
	bh=fjsuz66GDm0vKg2rFYjQfCt/J4ewBZp35uY+Bwa91qU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a7huCm4dMdJ6rnW/HJdohvKvjJLA0culHy1ANUZrtR7pNDEbpTLciK+jPoR2HiSCOUI4DwDJya1gksl+pwzpgNC3lIWuT9LvwyAjWyf1TjrOFGnP7afMvTZ9DpcK8AsmQ9HmN5k2L2TQXdMoy2ko1vctGdDnUb7K5CfS7WQLRtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=s5CRJDTy; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="s5CRJDTy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAANkiNIWhKneUHlHi93aFj/j8NmtoqD80pdQDR+490LpJe+PhlACux8YRS65meaD1UAwVvYGX55JhvzRafoCFzG7bR2alWsm+T3o7oKgSa4TsuPjjLFgA1tYxRBvzTjhAqgAxTKUOqjT9h70Yq/3y69WS7/Wgh0s15yHNzirVBItGkMgx9j+9MMMxlXJ55FKQ67jrKlwE+g6MvZtT0c8DWjYkPcTAi99+wErE2LFK2w4zjrt4IAQTlFBUQKGK9wl09JIzWNieMeABMCAy2b3fLsmWMsKb/r69zmzprx9RC0a3Rp+1o4zun5JMnaMAp7ucoiXjk1xPIAPilkSzVugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NdHWzGdI3CYj/Un5JTePSOYk4RaH4zmfpaOD0ECx7c=;
 b=a8w7tLcf5uuxJy8o+3Hu4ovXZYQ0KNKxnnWEH8fF/REwom0jOZ/1l5PiRDEeI0kA44oLLZ4wo0cXOcijc83tExgVMVKireoWIyhktJnh/FHkAOTMlPnj5ai61JEMOaX+4h3WMHYkwUdWCixslBmcotoers7Iy6XbhlENmHcw19V2Nhrr2LMM/2rd+vPkETCk0IP5lrrZgB5TVuifWbbiC90dziHrachzSMGCy8LUe9WTHY84cg0nu8Z0PGtnb4tKGvcpkHBx39UMzwpHSrhk0dQL6z3QRKAeuK8qkvWYGlAZYGz/yJIseBs9rYilgi3Nw+Ep9ulXM6nkxO9wLxfLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NdHWzGdI3CYj/Un5JTePSOYk4RaH4zmfpaOD0ECx7c=;
 b=s5CRJDTyEKmfrZCvpZO3xFeZp55Eg0oomjsOygyBpQwYumvj7foIJCFWBGcIL7l7g2jAnV498iZfjMTNC1tRkda+w6Zyvm6tSfvlU1VhzBw8JI3+KZzpFAjuHUC3uhkyCafhYJraytmYRw/5JjIdBjzmoefIPDEtMxk1ozKDjlYb+yRfg37xI18KsjXBLgD/YxuA9qTmkfJLyAXPRnW7gL+CQwVk71nyRnYJJZLN1xkurLSCGxv6tlaU7fxoU4M+IriC0g0T/Q3oqqv4VXi+NjhsvkWD98xjw0038mCZAHKe3M9lHVRfD+1YLCjh0sivPii0WDq4JZZfZYKMCk2XQw==
Received: from DU2PR04CA0257.eurprd04.prod.outlook.com (2603:10a6:10:28e::22)
 by PA4PR07MB9608.eurprd07.prod.outlook.com (2603:10a6:102:271::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.12; Fri, 7 Aug
 2026 14:34:21 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::59) by DU2PR04CA0257.outlook.office365.com
 (2603:10a6:10:28e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 14:34:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.6.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.6.100; helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 7 Aug 2026 14:34:21 +0000
Received: from snnrelay2 (snnrelay2.ion.nokia.net [100.126.60.16])
	by fr711usmtp2.zeu.alcatel-lucent.com (Postfix) with ESMTPS id 7EDF5680010;
	Fri,  7 Aug 2026 17:34:20 +0300 (EEST)
Received: from kanalexanlu.ott.ipn.nokia.net (snnrelay [100.126.60.15])
	by snnrelay2 (Postfix) with ESMTP id 8700D2A01AF;
	Fri,  7 Aug 2026 07:34:18 -0700 (PDT)
From: Alexandra Lu <alexandra.lu@nokia.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandra Lu <alexandra.lu@nokia.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Fix runtime PM imbalance for no_m3 devices
Date: Fri,  7 Aug 2026 14:33:53 +0000
Message-ID: <20260807143353.1932381-1-alexandra.lu@nokia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|PA4PR07MB9608:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ec2fe7f-81c2-4c2a-d6b3-08def490f861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|11063799006|5023799004|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	s01pZnYRJaacHe/HhaYoLMrY4lavEdTBdZi9xqeTAAPl8Q8r3E6EHadi4sVFIzNdzFhw/bpR07tOgnXCsf1qLvzyJnGTWM1jktkHVkokWXx/CUueSO++phPc23jgrR1iRUxFTVwR5IAbe3cLn1FqNYkHFr6QRCTE76JEpkpljlV4NOmPwKYg43N48ygkJEgqiO0yFl31sYNG2AT1t7zGylcHoFfwINEMq9uATVHK0pwn7qpJt/+u6XK52V/yE/2HW/037KFOYEY/7eM7xwY1LHUfENBUh9BbFUIpi8WnLP1hlYJL6RR3JJN9BQuWGmppI0n6WAEBaePNWWYPomstGrzYD2FhP5dmBwBM7wHsBH+ENHrG+79o8LAju1GmGD73jDR9ia1/omJgkHFQDoHZObHiz5qMZthOM5txsa4IiZ8Ws5u+nP8pN0qTRtrJrd+4a5uYqvCYd1RnwKA+UzgeIHfAmwAgTHyotqQZrS/FhnH55RosrvCR3YpQVZOMi788M9hI6UYxH6VzxnWOEJ0CdogLtwrj0FyNyQZwXR6h38Henlmc5q8LtF2NrNO2kVax1AmgZpVP565QuKCqpUCngkNdtR0U1h0QrhvGk4Dt2nmJL95BZEhqOophXEaB8CYtUwrvEO8h9aFB++jOMhlQSJpdWP0GU+/lTxPv2KBC+TKXHWwTJM9dZWGty66d7y4iF1fBjPD25ifs/wQ4VlJ0xA==
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(11063799006)(5023799004)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GO7EuJhFr2ePnaBDa7jNjs+TUaDqdyadcITdhLnkAKufllpe/eQSkY4IR0ksSQfZGwuR6v+x1/Gp1DARJMQAnTo/modCF6CAEbXFURLY7DFzHgIxf61NF+vc29to9pctlw2rlIt85tBWdjT015TMbauYpmNgt8e3fhxkuZ9/nBonO7r6Eb//hFTbXjIiql/+6vuAVkcnFzZxw3CLGyfgoMjSH3WABv8TZTMEZw5f0f+42Km4Eh+1M0Qp8jcTm33+sJ7QPF0FBjCNwMR331F6FOKe8pJy6NWXbPerOWCI2dyYjBmhasLchLE6Wqs+Ccz1xhzye6hsTbVtnSNr07ZGfA+zODInzHtnlAteHj+16LRGqiTlfrUBjomaahNQy18FmkB5n7eueck3b8hVS1xNfftV45l3xFcqKlPeEI8Wi98/rY7j4HYlI3We0TS0gfYq
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 14:34:21.1757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec2fe7f-81c2-4c2a-d6b3-08def490f861
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB9608

mhi_pci_probe() drops the runtime PM reference taken by local_pci_probe()
only when the device supports both PME from D3hot and M3, but
mhi_pci_remove() re-takes it based on PME capability alone, without
checking no_m3.

For a device that is PME capable and has no_m3 set, probe therefore never
drops the reference while remove takes an extra one, leaving the runtime
PM usage count one higher after every bind/unbind cycle.  That is benign
for the device being removed, since the PCI core resumes it to D0 on
unbind regardless, but the struct device outlives the binding, so the
count accumulates across repeated cycles and can end up preventing
runtime suspend altogether.

Cache no_m3 in the driver's private data, as is already done for
reset_on_remove, and gate the removal side on it as well.  Unlike
reset_on_remove it is cached for virtual functions too, because the probe
side gate tests info->no_m3 for physical and virtual functions alike.

QDU100 is currently the only device that sets no_m3.

Fixes: 0494cf9793b7 ("bus: mhi: host: pci_generic: Disable runtime PM for QDU100")
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Alexandra Lu <alexandra.lu@nokia.com>
---
 drivers/bus/mhi/host/pci_generic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c23b4d..eda00a2e242c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1097,6 +1097,7 @@ struct mhi_pci_device {
 	struct work_struct recovery_work;
 	struct timer_list health_check_timer;
 	unsigned long status;
+	bool no_m3;
 	bool reset_on_remove;
 };
 
@@ -1409,6 +1410,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
+	mhi_pdev->no_m3 = info->no_m3;
+
 	if (!pdev->is_virtfn)
 		mhi_pdev->reset_on_remove = info->reset_on_remove;
 
@@ -1497,7 +1500,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	}
 
 	/* balancing probe put_noidle */
-	if (pci_pme_capable(pdev, PCI_D3hot))
+	if (pci_pme_capable(pdev, PCI_D3hot) && !mhi_pdev->no_m3)
 		pm_runtime_get_noresume(&pdev->dev);
 
 	if (mhi_pdev->reset_on_remove)
-- 
2.43.0

