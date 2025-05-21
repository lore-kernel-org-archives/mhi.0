Received: from mail1.bemta40.messagelabs.com (mail1.bemta40.messagelabs.com [67.219.247.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793223DEB6
	for <mhi@lists.linux.dev>; Wed, 21 May 2025 23:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.219.247.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747871222; cv=fail; b=fufgEI5j2fDDAE4nmIB7jk1GiBdLlJe6mQbFe6cA3QknZZCGgqylPb852BwCDcsyo468It7sVJhUJAHwNCGuovQ/o4w3ZB9SeUdWmj5mbAPPpxfyVEbZGp1E2wdV8xSZL2dP0ZAIM7xn0BsMPoN3jRwc3ocQj4SkGl3c76C+SYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747871222; c=relaxed/simple;
	bh=cdfwOby0l3/9746vq3GHpu0O+eJeMlwBMYIPSd5sspw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X10veYFjI1ar1gRmsZ72MaWBiZLvNz+CMg4XSoy9EmKvZmxm3sxkKIvIrkjnQ7+hw1BrxezxsGZ+zxB8HN8myj9t2EPPPDtNGqPvgcuO1qAUlCy+lDfM4pEW4Wdr1o7aOfMDMY8WwCn7eg5OAX7Xb8PopOymDnvMnbhwqMvSp60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com; spf=pass smtp.mailfrom=semtech.com; dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b=g+cmq/tS; dkim=fail (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b=EM7x2RkT reason="signature verification failed"; arc=fail smtp.client-ip=67.219.247.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=semtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=semtech.com header.i=@semtech.com header.b="g+cmq/tS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=SemtechCorp.onmicrosoft.com header.i=@SemtechCorp.onmicrosoft.com header.b="EM7x2RkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semtech.com; s=k1;
	t=1747871219; i=@semtech.com;
	bh=NiWm2qQOyJMNR7Xp+qeVrOO8SyuhU/0vuFW4UpU6r2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=g+cmq/tSGeRE1ubMY4fmp4hxvgqT1kJFSwui7wIW+UV5FX1yqPT1vnZHNQIEHyqnO
	 SsW2n3PhR5cWCzHpxClW9U/nGstwOMQKlPyBv+OscuJ2t8R5tWCcZfI8KYnsvoD68Z
	 aIbCM5QCGe8COKPYDAnjegNa22h8Q3G0BpF5vIghdsgae7nn/bTzGWQtFigZRxRhnh
	 ocFQui1+4QXUhHfGUf9IeboncsXDJ/7DeRJ3H01opIloO3rOP1aZuhOPXeomlHb896
	 FJ+vBLA1jmJLVGNbRrId9xg+Xca9QH8t1cbPpLISVU49F+ugJ3WEU+uKR+We5W98TD
	 Q1qr4AYcgy73w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjk+JIrShJLcpLzFFi42LJ0DfX0v2Uqpd
  h8G+unkXvx5VsDoweLzbPZAxgjGLNzEvKr0hgzXhxYDJLwSruilN/lrM0MD7n7GLk5GAUWMYs
  cWZZWBcjF5C9mFXizv0prBDONCaJk4c6mUEcFoHtzBLHvlxiA3GEBOYySfy7eo4RpF9IYAWTx
  PUvJiAJCYGjjBKXPk9kgag6yyhxq/k/O4Rzm1Fi+5dfjBDOZEaJT5+vs4H0swkoSrR+Oc0Ekh
  ABmXV+znEWkASzgJbEz8c3wZYIC5RIbN29G8xmEVCV6NjwlQnE5hUwl/jx7yyYLSEgL7F4x3J
  miLigxMmZT6DmyEs0b53NDHGsrMSKCb1sEPXBEsd/bGaGsCUlrt28wA5hy0ocPTuHBcJ2lLhw
  r4MNYo6ExMEXL6DqfSWe9e9jhLDlJE71noO7YefG21C90RI3FrxhhwRMp4DE6emfGCGcd4wSU
  64fhrpCRqL98gLWCYwas5AcPgvJ4bOQLF/AyLyK0bQ4tagstUjX0FgvqSgzPaMkNzEzRy+xSj
  dJr7RYNzWxuMRQLz25QC+1uFivuDI3OSdFLy+1ZBMjMJlwfYg4vYPx6oRm/UOMkhxMSqK8kxL
  0MoT4kvJTKjMSizPii0pzUosPMcpwcChJ8DolAeUEi1LTUyvSMnOAiQ0mLcHBoyTCy2QNlOYt
  LkjMLc5Mh0idYlSUEufdCNInAJLIKM2Da4Ml00uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVh
  HnXpABN4cnMK4Gb/gpoMRPQ4u48XZDFJYkIKakGpkUTOb/6Xbt68wxfl8vh9ad36B07lclyW8
  1a81xv36/MtMjEn6rW4Td9jfRMHogus3yUuFjo2qbgJ/rbKqcY/F68oe/O/TDLXIEX/SWn8h2
  41rRN3vUo2X2d8Od1/P8PqUaJO6Ue/6zzf3no80PvPmyd+bX1wx/70xfcPiS6Ss0/vNP0SI/v
  qhdyF+XalH/5vRGL4vv1yzrsLfv7N0L1M5bHTre5kd/hZHUqeUr84Re7NDWeVb/XTbqwP7Ow+
  UnJhcvT7k+f+ftemnWHe6Wk7Kp3MWuPrFw+u9/0SXC6pLPHAsaTe/Z5ynppeTKubPQPanrHWB
  iiLHf3t7pF6/6NNcX7rjUVKn8+uOH3wp0nyvWUWIozEg21mIuKEwGy+PGhIQQAAA==
X-Env-Sender: zxue@semtech.com
X-Msg-Ref: server-9.tower-929.messagelabs.com!1747871217!2492261!1
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received:
X-StarScan-Version: 9.117.2; banners=semtech.com,-,-
X-VirusChecked: Checked
Received: (qmail 1137 invoked from network); 21 May 2025 23:46:58 -0000
Received: from mail-mw2nam10lp2042.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) (104.47.55.42)
  by server-9.tower-929.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 May 2025 23:46:58 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVQinGn5nAgr0hfW3/d3T+jpJkXGBFIrQjnBnT2rFNcMtzq34nMWDQw79tFkpHM/h3jVs8mCZRDymTtFG+nQORyNYdWCIOMsRSM99x4jC6x8Dlf/9AkJq4wRKxSF6O9RgG4kGXLMwUL2KhpNr2U+4qNqSUovnLNfkxp7+jRKo1izHKXYAvn3VBJpNaGQsbUfUPWaK9QKiySb1eeqIcTA4Tt9djqIzIOsI8d5bJoWAzbYAOuMdJPWbTdktPfeP72VwZ5Oq01QPwLgcTSb8BxYPAepIECd0pq+1nbGiZzLEavxPg7W37laAxzBABl18UQV4qko/a038PLrjwZDZzNC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=bUUgEYMs8swWsOC9FXDmxP1f4AQxYJikv6EIAoWR/v5AM/EX5SVOeT2atxfaz9xpqQZ9jUasPBLV2tUwWPQliNxrdaltXQg27OHYwvLz8G0pmARo9AR/j5D9byL+uNHusofhjg2FtOIKdkFjo9shAlgTbBPiUflOmsg3hRzQQdM+sN/mcvyoP54H20Y/oZ5OZZiEdjhUjol3le8xa/DWNg5ryUrjWHgFuPBQ2czCgcclae1MOXl3Gmb7/gNPiAkRT8Y4vy7dNIjjzE2WibPgHo9lhrIy/+2ttDQc/yJrN0QqNmynnYGB2M7cbTcQkf4Sdllo7UIFDMos2xGonRu4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 38.104.251.66) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=semtech.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=semtech.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SemtechCorp.onmicrosoft.com; s=selector1-SemtechCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgfXmplSujZqKAN+4qyFq4IDDhrFttOHqvoQ4is65oI=;
 b=EM7x2RkTAFdNOCziebkanGYiukbCKjxXp0J9ijwFwEtqih+uP86g+UIv7HsxAYuFJGgYjOwIWgz2aQCREMXj3mT+zJ/W7zd6B037hhs9BAZjSjqmrEJHXKh/DJ4Q1SPtz8oa5CghRYiMIbScsifOdCOhdPri+k4dax1KLZpHB6w=
Received: from DM6PR07CA0080.namprd07.prod.outlook.com (2603:10b6:5:337::13)
 by DS0PR20MB5785.namprd20.prod.outlook.com (2603:10b6:8:142::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 23:46:52 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::56) by DM6PR07CA0080.outlook.office365.com
 (2603:10b6:5:337::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 23:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 38.104.251.66)
 smtp.mailfrom=semtech.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=semtech.com;
Received-SPF: Pass (protection.outlook.com: domain of semtech.com designates
 38.104.251.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=38.104.251.66; helo=CA07RELAY1.semtech.com; pr=C
Received: from CA07RELAY1.semtech.com (38.104.251.66) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server id 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025
 23:46:52 +0000
Received: from ca08gitmail.local ([10.23.50.249]) by CA07RELAY1.semtech.com with Microsoft SMTPSVC(10.0.20348.1);
	 Wed, 21 May 2025 19:46:51 -0400
From: Adam Xue <zxue@semtech.com>
To: manivannan.sadhasivam@linaro.org,
	slark_xiao@163.com,
	johan+linaro@kernel.org,
	quic_vpernami@quicinc.com,
	tglx@linutronix.de,
	fabio.porcedda@gmail.com,
	quic_msarkar@quicinc.com,
	mank.wang@netprisma.us,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zxue@semtech.com,
	imocanu@semtech.com
Subject: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.
Date: Wed, 21 May 2025 16:46:40 -0700
Message-ID: <20250521234640.3056893-1-zxue@semtech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 May 2025 23:46:51.0619 (UTC) FILETIME=[A00F9B30:01DBCAAA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|DS0PR20MB5785:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ccb1f37-3637-486f-3d55-08dd98c1c2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dMR6E4fxQ4fhZvuCLKtEwTL4XY3yf5kzyKeYZVNlVG3xW8FPEwEqFvVfIr/b?=
 =?us-ascii?Q?RVOHTM/XrC7GXmNQnI+oVCBHWrOoIPEsVH2tv95HQwCxQp9GLCES2BUYGmV9?=
 =?us-ascii?Q?GWTQNFd/wZ9gB65+iNNey3RBoyDLZjrAEN4FNjw1ZnuOUz9/9kdf8C5O/bQU?=
 =?us-ascii?Q?jom40JBsUYxGMvH6S9DE+cDvw0mH89DKiUh3RdB8fLa9x8B41I4+3cpH8Nwo?=
 =?us-ascii?Q?E3U4Ls05TW3HMn2cHims4lgLn4bf+bdAycYjE9Jv84tt9oZZUBntlkO2oM/S?=
 =?us-ascii?Q?2ARVQ2SgbYJ4EwbiI1wm8CQfSryDEj6JcoZLz0DlskkRxTb2BeIJ5Ybzp3/R?=
 =?us-ascii?Q?0+VBylw77nYc+zDKZDMFGI9pJ+cZcN1H/gA+UKAzSnG7JlYzqRoMvHviih2+?=
 =?us-ascii?Q?5ObgHSy68ii+r1Y9ZgkUmWkbTb3YXi7KX/JlbR8XnB5oTRilGca3fWjSrFYX?=
 =?us-ascii?Q?dnOwe7aBI7+zQSSpvf3n20sHO9+JW4wK27B6DwjCcvV4CZ7IHrD1Ry7PwdGC?=
 =?us-ascii?Q?2qBlKivkfavYrPtfSqGSilA6seqdLv4nQF+u3YpGGj13qH34kOJDr5V/8oTn?=
 =?us-ascii?Q?LVM3sWPAE1FFN7wczsJk1DjZGokA6snfLp6RPNKTvVYXwY7SjBCj2SQRZYeJ?=
 =?us-ascii?Q?m3eej0e9dZbUBZnjKT7V5jlb7NaUI5S8K+mJphIlnNRPhKGuMkvOsEJN+xsv?=
 =?us-ascii?Q?ZEyK7eXp/BaEnl2q9kWE6WHSI1P6FryBWroZADG9N/ebUazlo9bNfajItFBF?=
 =?us-ascii?Q?fWUrn7LZfvUWdYWBCmXYc3M46GKLtrR7Koc8Ro3QrxUoAK+Vp8I4eF+14Ynq?=
 =?us-ascii?Q?zUZkztjFz17534klh3fDXsUYmObSEC6JrnY/jh1RSQXFdAINiiJOWN8h6qq+?=
 =?us-ascii?Q?mQh5nMzHvcEsG01ojSb39T9I4oqGs9SllYxW5TUNAHTdNDI2cZTRKZudnpxo?=
 =?us-ascii?Q?fgjJjc9/G2v8PmxAvAXAWjPROjcOVxp+8wC7HvMJenMBAJADOl1Tz1VF9uNT?=
 =?us-ascii?Q?Wnfy6o5pKERIQm0nQ9q0g3i7viXZRQvAhE6iAWGXBTx2dC2gf6vfuyZFmP7X?=
 =?us-ascii?Q?dVOE1JLgbOpHHfFmQLglU4gg8BRXumfsdjBzYVrGNZdoNSDUTLfBs/79qPKd?=
 =?us-ascii?Q?PHycHcMkOHLzcxhrWklDf6mXtRfwoMbkhlyxKio2jRRrRYW97TEbqJY9Z9hC?=
 =?us-ascii?Q?Stlt3wBPeDr+bSWrAQ9OKXq66SYtco4reP8tELhtimv7LlCNAgR27vOwpDca?=
 =?us-ascii?Q?syl/V7RpBWxe6km/gEToJh7Yy3uZougi1n7wOgGgkrZEooAUhlLYQDMPAPQF?=
 =?us-ascii?Q?lKuoue+f/fsY6HeZC3zkW5MUGzWT2dab0qVmBOgMVSU8MBHdkFKYbZZt8hK5?=
 =?us-ascii?Q?aL15NlQtwyhuwDbN6Oc/fVe+O6qyMpIp4yiltiMX1EW7nsZfINnjtcEEIsr5?=
 =?us-ascii?Q?Kw41dWbwCE5cBXzFADEHm/aISHx2RJqT0EILT5h8X4AXkpvbbyHUjpCxuQ2P?=
 =?us-ascii?Q?I1aUX7rNaOk9l7LYpJsGnlwZcL7pghTCXsC5Aoy0jnYrrQqaWp8Zx4YbIQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:38.104.251.66;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CA07RELAY1.semtech.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: semtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 23:46:52.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccb1f37-3637-486f-3d55-08dd98c1c2dc
X-MS-Exchange-CrossTenant-Id: b105310d-dc1a-4d6e-bf0d-b11c10c47b0f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b105310d-dc1a-4d6e-bf0d-b11c10c47b0f;Ip=[38.104.251.66];Helo=[CA07RELAY1.semtech.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5785

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
