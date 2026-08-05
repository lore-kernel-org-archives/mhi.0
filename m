Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DF3DFC92
	for <mhi@lists.linux.dev>; Wed,  5 Aug 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938243; cv=fail; b=uLMR8BRrRJShPoLza3P6QbRiTBqQkyFKMYlv8vV+wUEq+gdLaUwdOlFZ9lkgWuURn5lgVL0uWE6A5ZivYTv1/PdKag80FETIhUesji/fOsTzSeyyLufbnRIOiYWttpRcMXWzME0lu/+nDwW7E7uw/8dAvSm795ta7G1BBdbWUsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938243; c=relaxed/simple;
	bh=q3SBnjmhYWICBoqJmwVEfYtU75lizLcLSHGhUaDA7y8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pieqoiHugCOIng4eZycKYGKFHqkA/hKURw6YWZBCYnmQQmYK2UQ60SXsFbm3XQTJtSrDjaiWiBTJ8bJrOJu63ru2rcbxmWxH6Ms1JPahPKHelmuvpXVa6OGDA47/oqeC23rC9JG4eTkhAaXte73FVP6W4yf0A4olQs6MVQAAr54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=fzaimKY6; arc=fail smtp.client-ip=40.93.198.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="fzaimKY6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu+69jMO/FAekgEmyceFclBR4YM2h9zVj+A3/ROvXztlH9y2HAouQ/ES/z3WSkTkE9uhUYLQM5qjcTXQIwA4Iw2SgQdNKVdN80rv6BJXpJb5EaDJDQy1CqiUIsQaWC/ifZ0wWiRNXx0Hokx6Ibz+yhNJIldvtcvzeJbsoc0P4L0wLAzHfj1AjUQVitOAhZpM+OI39qA8CU4BfBvaTZ3Fse9C5jIbaIgPblohEOvftUxsF4BL612HJSUSUqHRzvmVHZSdydazAOYmXwenB8RmmI59l97L3SQwtzPB/Kd/7aIFX6sgg/U1NOyEU9h2wUti31Y1VPQSfbXpUJcSODbc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeGEMk4F5OlbJqKIy6bPTuLKuwPpKD5aYlgYh9Horvk=;
 b=twqPnyoBwyHZBlMv9GlEdx1Z9MFom2sc9bB6BfYBfwefBdEAaArrBUpazlVZWLQnPtvvV1QrAFhDpX53viETUukBW6EzuWKeFg26n04Gk3yQ6RQ91r1VrMA268abo6UoOZHMhZjGvl9XbSkSQ54Ubk4NJOduTRXkYPeVsj0qtMd28zsg7f3Gl9IVMENUTEwoVq8/DWFUMrofVI5O6lwuvbbwc6dSeRm8CtZAL5A/nXATz+eemrJWV5li/ZHmtLQqkPHhvHRsH9cn2qfnOHITGMbV8ZsB48VhhTKVGFksPMhJbUmb9hTlSdBUb/clxT8xKIRv1/hunYU9gzqwDHFoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeGEMk4F5OlbJqKIy6bPTuLKuwPpKD5aYlgYh9Horvk=;
 b=fzaimKY67g28Mfb/nIrkoW0+FCvET0v8hPNaG6pqBobV3QVU4od5yv4zldynuXtajZvPxbP2/WUM5GfLdogh6B8J2gcgzSPi6sC4HtXg0i7EymhTkzhXeP81/xfiu9dGNeY/oFv3xqxdn0dT36f+VR3JemfVedN5CBv1lO50h3dIDMhBWuIPtOmEs1qq+IDiJyqJusCr6dKRV2OK2nznKAw/LGl8+izCL3sa7ZQyEVNVmxovMuEZ7Lpl7T3uauKSV1hv2XVCHW5Ogtygj4fbtmRNEChuERNEp3y3oLsajClKw6dPuMvkGnMru8sStlFa0LhuuLzlYZ31Lr9oP6HBmA==
Received: from LV2PR08MB11057.namprd08.prod.outlook.com (2603:10b6:408:351::9)
 by PH0PR08MB6551.namprd08.prod.outlook.com (2603:10b6:510:31::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 13:57:16 +0000
Received: from LV2PR08MB11057.namprd08.prod.outlook.com
 ([fe80::de3c:c87f:bb39:e706]) by LV2PR08MB11057.namprd08.prod.outlook.com
 ([fe80::de3c:c87f:bb39:e706%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 13:57:16 +0000
From: "Alexandra Lu (Nokia)" <alexandra.lu@nokia.com>
To: ": Manivannan Sadhasivam" <mani@kernel.org>
CC: "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vivek
 Pernamitta <quic_vpernami@quicinc.com>, Krishna Chaitanya Chundru
	<krishna.chundru@oss.qualcomm.com>
Subject: RE: [BUG] bus: mhi: host: pci_generic: runtime PM usage count leaked
 on
Thread-Topic: [BUG] bus: mhi: host: pci_generic: runtime PM usage count leaked
 on
Thread-Index: Ad0k1MjqLuUIyG4HQ+GAvYVcT0CCUQADNlRQ
Date: Wed, 5 Aug 2026 13:57:15 +0000
Message-ID:
 <LV2PR08MB11057B554648B1B262EAE4ADE88D32@LV2PR08MB11057.namprd08.prod.outlook.com>
References:
 <DS4PR08MB110616F286C62E19C2C94314188D32@DS4PR08MB11061.namprd08.prod.outlook.com>
In-Reply-To:
 <DS4PR08MB110616F286C62E19C2C94314188D32@DS4PR08MB11061.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR08MB11057:EE_|PH0PR08MB6551:EE_
x-ms-office365-filtering-correlation-id: 8380721a-466b-4dc1-b236-08def2f97533
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|5023799004|38070700021|9063799003|6133799003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 0Mgs7Swav2lrykPk7zF7cGPtu+4WhimaHfxgFBWGmkSo6MO/r8w+4Idtvd0/NZju6CDv4eOBCAyoScaRwDIg326slysUE6TijvMIklZU66vJhDGSJ/oKInqI7kCjl/7VstyKqSszWgPR1OFzp8UGmbx6th2sUTgxZhCRDh8Ccsq9f4l4XSAV0doOUVidZWJM6vzLO6/E2w8ydyHCAHCoP5G6qiLjEw4I8Hw3/gZ5iYJJky69INwjRxHkGCe73DdWqTfPbFI3RtcCtaeJpF4921qbL5nF349uFcys6ygg46WBN+nIPhGI1Fl+XC44km+A/5lD8jNSCUurewvb1S5exvF3bq9D3cznFoXD2427miwpBoSllc5IRw3V1ols+Gm+gy1Ab1jcyWwGaHaUBXUxZ0LQtvogOqK0Cl7eR/SJUwkfOKBhIIdIcPZJP7RGNI66FBkBfDmevwdq/5QlLco54Nu2ZBIUYK7SwxT/2QBN+cwP8HisocQRzu7pI+V32DZoXBZzN2DRNw8DnLW9F7R3EnPecQmY3fM34y8npuxFlXkDCxxiuiw6O3FJMo7M3vRW9Oz+CDKEV+Tzj6E6X0CgIuf5L3CTzNCIlxEq/ZfQqItv/vAgVKw5/FVvHK6PSw03vh47s1x1UbEKiqJBFRaaJ8VNwHPFlOA58LQgxMZAGty/4jQzk00bFZsVHRCc1+pde9g23dVucYA1Hvhg3DrpHg3extG4z9/T6a9k2RAlAVA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR08MB11057.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(5023799004)(38070700021)(9063799003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cwz+CVzSfIkH8ZJ5pvBmPzJB848aWCT1LPydPcwVt/vI7Nmu4dOf4ok9tp?=
 =?iso-8859-1?Q?p8A5Jd7/+4xv3PZ0Vb5wofOhp5ES/2z24znyf7SoagKJlZSt8JyKKulNyt?=
 =?iso-8859-1?Q?o2rX9AkPNEBBoIyLf4JQYl5x33Q42Bdd8Lk1jK1nJcVUUIGjCwLnAtKqjA?=
 =?iso-8859-1?Q?Bs492J7B1YZ2vkRSBURJV7NcQtFTX8uLVVjQSVf2Cq2Tniiol77dtfEnS6?=
 =?iso-8859-1?Q?Mot0cMtwZYXvT2Z+Ry81TbiU2GHeMONNobO40bZb5yu6Pwy1zCmORG5VVg?=
 =?iso-8859-1?Q?0VnfhOQsIS1GgJN3BHhnr/Szz67YnnHlpJecX/aICwG+zAW39xP8gS2pgX?=
 =?iso-8859-1?Q?EU+q6EF1Kih9HKaJ/cZcaURxtBJpwAk4UU1JCS1B+L9BN+WZ0Pci53TTQF?=
 =?iso-8859-1?Q?sBVqvOLB2y4prZzl3dthRAZiCZiFvg6EVLr9Yc05vCOWFjIIUwAAOT8Lmr?=
 =?iso-8859-1?Q?fJJ6aVgsBNcH+32O4T8uV8aNZOXmXd1zQYlRW+vop9agvCSGMkryCo5zuq?=
 =?iso-8859-1?Q?ZGLsIwbFRkJcLxYHQy5iaPZTOb43HDpFZuMEsi7TMt16y/eqOKxanZ1F3L?=
 =?iso-8859-1?Q?XIB6wtKLVdDuNNraEW85WgbtYzHyVQR3Azqs7jDK90D8nEpEcWS4wtsbb6?=
 =?iso-8859-1?Q?uEhWZZTRsuKpZMPGFCxKSwNk84aCRtjbcJAxzc407qer1BJB25Ac8vJFou?=
 =?iso-8859-1?Q?9QjxYwPMwu+LD+zoVrf6KVC3MR1ZW+Zo+yhxtbqShIuMkv2o8sQ3WzsjZR?=
 =?iso-8859-1?Q?Lz1bm4WGHwjSn/keZH4U5zntaccL9z4lsOSGniveZIFWUrxP3ZSdmncql5?=
 =?iso-8859-1?Q?m+ukFkRYt5XmotuNeuqYfFW4kDs2nnybjzoQjlO16uaJRdX7u/Lu6BL7Mb?=
 =?iso-8859-1?Q?BxE4XLB7cJKH9ltGALc3AhSlGkVd3FqRnK4iXY+QkDRQA2v5QQYN/pcWWF?=
 =?iso-8859-1?Q?wb1Gy5gi7Y9VpkqViX4MI/n5C2UG5eWoGxI0HPpOX7n9ecZyPRn4+wplLE?=
 =?iso-8859-1?Q?YPoAhSu+PyqZQ/5QeVsvLQfJ8+LsAt8vjGBeR8EWbO4zSVIlNimKlKw8kP?=
 =?iso-8859-1?Q?RB9Al5R61JRJqVGeKqwhJgc8jAilxmf0AiFzAWAP+2RMHmjzeVxoPOsLIM?=
 =?iso-8859-1?Q?teSUA+Tow7Jshpxra5iMq+7Jvenz1cVjjmDBBL5Ylag4HTqvZJomnF2zhX?=
 =?iso-8859-1?Q?fyl3mg3ZJuZ1Qb858aWJC6CFoBeHdlfWwYUDQSYTHpYS1AaW5wbWgPsuR0?=
 =?iso-8859-1?Q?LcuCw0bR+KFGdBisxUMfp/CBW2UGDG10USiVtwZZxD/dVIjcRGUUJ+7/rX?=
 =?iso-8859-1?Q?Gi/0mTiS296EGQD+5DXQdXxbd6qc1S4lv5m+VteVhX0HEPWhFUBZRxn9RU?=
 =?iso-8859-1?Q?IEsyht1PYoxVeyavKDrIwriPDoH6FIx15zpcoaET9Uo/fwjKsEFXkLz8Lt?=
 =?iso-8859-1?Q?F36+VZHJDv3O+dpzPke6UcgEF1c3RhafAw3APyJ46ik9eZ3oIS4EHJdZ/W?=
 =?iso-8859-1?Q?uurbr8PIZriNNbtWpiMV0wEKobPl93/2836bU7w6GGLl671tACeowYKqCB?=
 =?iso-8859-1?Q?BMVF0EeowYhbr2d+XGP6+RkBgNU8oJNgrVwdH0+cpfDSFP1VqSSt/2TTla?=
 =?iso-8859-1?Q?bmXlQpbq+OYgC1u5E2w8bnBXvZxwXLrZqNdPBeeBDwysSTSHl6WOCl1r85?=
 =?iso-8859-1?Q?mREz3+UOzdnthhKEapRRS/fhNQ5c6TPPBBCYBcOYxT/qdKRwyIEDSIwEKB?=
 =?iso-8859-1?Q?hwsoDm9mXVcTxDaWqcHvZE9WKjuCXLBGLKhbF1qSxH5ZtD9XCR1DSHLhWK?=
 =?iso-8859-1?Q?YfakjFKjdw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR08MB11057.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8380721a-466b-4dc1-b236-08def2f97533
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 13:57:15.9720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WncX6tuuwzSCHcByAIUh2HgOXK3HU6odBLtholpe2OGgnFLYTjEzUaLFrX2VNlCQi7y5oxZ32TnSmg2c5h22tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB6551

Resend in plain text as previous email in HTML format was rejected by the l=
ist servers.


Hi Mani,

The following was discovered by AI while I was working PCIe device managed =
by Linux kernel. There appears to be an unbalanced runtime PM reference in =
pci_generic.c
affecting devices that set .no_m3. It checked against v7.1 and it is still =
present there.

mhi_pci_probe() only releases the reference taken by local_pci_probe() when=
 both PME from D3hot and M3 are supported:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Allow runtime suspend only if=
 both PME from D3Hot and M3 are supported */
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (pci_pme_capable(pdev, PCI_D3=
hot) && !(info->no_m3)) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 pm_runtime_use_autosuspend(&pdev->dev);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 pm_runtime_mark_last_busy(&pdev->dev);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 pm_runtime_put_noidle(&pdev->dev);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }

but mhi_pci_remove() re-takes that reference based on PME capability alone:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* balancing probe put_noidle */
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (pci_pme_capable(pdev, PCI_D3=
hot))
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 pm_runtime_get_noresume(&pdev->dev);

Commit 0494cf9793b7 ("bus: mhi: host: pci_generic: Disable runtime PM for Q=
DU100") added the !(info->no_m3) term to the probe-side condition but left =
the removal-side condition unchanged, so the two no longer mirror each othe=
r. For a device that is PME capable and sets .no_m3, probe never performs t=
he put that this get is documented to balance, and one usage count is leake=
d per bind/unbind cycle. Tracing it through, with the baseline of count=3D1=
 / runtime_auto=3Dfalse that pci_pm_init() establishes via pm_runtime_forbi=
d():

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 M3=
 supported=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0 no_m3
=A0 bind:=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 core get_sync=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 2
      =A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0 probe put_noidle=A0=A0=A0=A0=
=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (skipped) 2
=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mission-mode allow=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0 auto=3Dtrue=A0=A0=A0 =A01 auto=3Dtrue
=A0 unbind: =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 core get_sync=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2
=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =A0remove forbid=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2 auto=3Dfalse=A0=A0 3 auto=3Dfalse
=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 remove get_noresume=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A03=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4
=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =A0core put_noidle=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A02=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3
=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 core put_sync=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A01=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2
=A0 final=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 =A01 (baseline)=A0=A0=A0 2 (baseline + 1)

It derived this after f227b246307e ("bus: mhi: host: pci_generic: Add pm_ru=
ntime_forbid() in remove callback"), since that commit also touches runtime=
 PM balance in mhi_pci_remove(). It correctly balances the pm_runtime_allow=
() performed on the Mission Mode transition, but that is a separate pair fr=
om the put_noidle/get_noresume pair above, so the leak survives it unchange=
d. The only in-tree device setting .no_m3 today is qcom-qdu100, so whether =
this is currently observable in the field depends on that part advertising =
PME from D3hot. If it does not, the leak is latent rather than active. Eith=
er way the two conditions are intended to mirror each other and no longer d=
o, and the practical impact has likely gone unnoticed because the PCI core =
forces unbound devices to D0 regardless of their runtime PM state. Reproduc=
ing on a .no_m3 device is just repeated bind/unbind:

=A0 for i in $(seq 5); do
=A0=A0=A0=A0=A0 echo $BDF > /sys/bus/pci/drivers/mhi-pci-generic/unbind
=A0=A0=A0=A0=A0 echo $BDF > /sys/bus/pci/drivers/mhi-pci-generic/bind
=A0 done


Fixes: 0494cf9793b7 ("bus: mhi: host: pci_generic: Disable runtime PM for Q=
DU100")
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1080,6 +1080,7 @@ struct mhi_pci_device {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct work_struct recovery_work;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct timer_list health_check_time=
r;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long status;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bool no_m3;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bool reset_on_remove;
};

@@ -1390,6 +1391,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mhi_cntrl->mru =3D info->mru_defaul=
t;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mhi_cntrl->name =3D info->name;

+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mhi_pdev->no_m3 =3D info->no_m3;
+
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (pdev->is_physfn)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mhi_pdev->reset_on_remove =3D info->reset_on_remove;

@@ -1478,7 +1481,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* balancing probe put_noidle */
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (pci_pme_capable(pdev, PCI_D3hot))
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (pci_pme_capable(pdev, PCI_D3hot) && =
!mhi_pdev->no_m3)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 pm_runtime_get_noresume(&pdev->dev);

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (mhi_pdev->reset_on_remove)

Note that no_m3 is cached unconditionally rather than under "if (pdev->is_p=
hysfn)" as reset_on_remove is, because the probe-side condition applies to =
virtual functions too; gating the cache on is_physfn would leave the same a=
symmetry in place for VFs.

Thanks,
Alexandra

