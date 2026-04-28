Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56C175A72
	for <mhi@lists.linux.dev>; Tue, 28 Apr 2026 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357933; cv=fail; b=Bbv5DfVy05ZCZe6aNMVwjvshtGB13DxMjC3lzWp/7PoUIom7mH/Iq2cl/3qWqL4AfGzLZa6wJve3tJ0h1ihi4RDaLDGsvtvH+OL37Hev94GhT9xkJN4O51V/3nFcIVAuXgdagE3kERL1hh38/pBVjmmw3tkvN7OvdufFBaO9HdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357933; c=relaxed/simple;
	bh=/oxqxI0jYf9qzRvZGdAkd3EcBZXmb2RucOLYZ5ppn8I=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qvYmdQUkhYJQD4bWl0OAqo0fnUSEDOGS/FwmUky8q/jgL37TnA4amyA1iSHt4ERQhAdI/DeUDqkin2HKLGCrRH6SndlUTC7bjV8zbXht5sAgt8HP9f4IsKzUV1ubddCcQIJIl3/7BfcBmhcChJOS5YXLrcG7j6O//tbKQ2WbkCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=7ewAY4p1; arc=fail smtp.client-ip=52.101.61.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="7ewAY4p1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcinxANPKBHTWMD81azlcnF7BXb4j65SV+iw9syccMzmnb56NglHhx4o+xl63BP9iHXzyMG/6ZOPKesgPcvpp51cNIp7oNHwSFhpHfSSODZ3RvaY1NaspgXnQmk2Q6cvIm3iYCqPPyfNwSlzsAFxDkqCVq7qnABkN2VougPLizuJxQYLzz6XEmT0B585rT+BOT+y05USBWDQIzLVoieIf+3SKHKsTKhxxBcPbk7DXk5Z/OqlOlbwW1qyoGXQpxgn/3dwLuAFHJExIaADeIo2cQUy76ynJPnfcdvtvdIBq8b8Z4fAFF6qPw3jTIuDfx+DxyMUiGCzChPD7OtduJNrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oxqxI0jYf9qzRvZGdAkd3EcBZXmb2RucOLYZ5ppn8I=;
 b=Pi7+ySMs9Ir+LDzdhJyZCFd3JdAEA+S1ki6SDXR1eZVF5MDCrVX5sn9BCv6eb5w3A7xdcyVa9cp21eRCZkU89cSvA8GQvjDnmdRCOhbQaH6XsRIHEI/i2M0SlF7RiDZnkWlBdmQhEICpisf6N7JoH+g1B3KyVkaTVEy8Jda7FcPSDndfOlYRhyrXvFkdBRLgmtk3pbwWHB1rHkFgyPdv1ljcG4Vc80BrvnSCCsPFXel4E1hFxYLWYNMGhMMLSPWy/BBKJHFgL3Mn0stwtlL5Olc3KVZiY+SNGtdQuqh6Z6Exswm7t3DBxpHvLqEqPyH6qhHmgYNS6LOPwYRA80IsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oxqxI0jYf9qzRvZGdAkd3EcBZXmb2RucOLYZ5ppn8I=;
 b=7ewAY4p1sb+xc/7XueqXuV2WUcV58ZdwMBFRLLJSxZuz/gx0IZqwNOE1QXqUniQnTvJ89FdwbMdkFgHdbFtKshLqx47KfB1PlHy/Sy3OR31eWBywmnuvt9bSVxln6g1UpZ3tfvcJci4+RBuAtJrJjd1aWC8v4Pj9L1xpIwv2MkhwaaAufiEZsAMhxHmoSII+0NPNnOciEB2LN2zixakouoyFxvNMzefnZlTPqSdnsx8KIggLMv5qm/BYBZE1R8TMSbhvnqU0YaOexd6yZRxoyUuXWZPTA7SxmAX8enoRnu8YiYWoKHDr0q+IRkF0GjhyKh1ZlXkwwY5qZgoj4AjPoA==
Received: from IA0PR11MB7257.namprd11.prod.outlook.com (2603:10b6:208:43e::21)
 by DS3PR11MB9624.namprd11.prod.outlook.com (2603:10b6:8:38d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 06:32:09 +0000
Received: from IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::1951:f84c:a8d2:b97c]) by IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::1951:f84c:a8d2:b97c%7]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 06:32:08 +0000
From: <Ludovic.Desroches@microchip.com>
To: <mhi@lists.linux.dev>, <manivannan.sadhasivam@linaro.org>
CC: <Nicolas.Ferre@microchip.com>, <Cyrille.Pitchen@microchip.com>
Subject: [QUESTION] Public availability of the MHI specification
Thread-Topic: [QUESTION] Public availability of the MHI specification
Thread-Index: AQHc1ti9cig0B98WHEWrZgdvnqR8SQ==
Date: Tue, 28 Apr 2026 06:32:08 +0000
Message-ID: <013437b9-e12f-488b-838e-5144026458b2@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7257:EE_|DS3PR11MB9624:EE_
x-ms-office365-filtering-correlation-id: ae6b5665-2bcb-49b4-b2eb-08dea4efdf9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Ao29LjDji4ifm1qpR+UiCnvo2lt/g3tYnhJJzmtpV+bv3LY5cfyV6DhlNBy/kloCe59uY8aCqtko22/4/J9RyKva/KISvCA1v5+qLHU3ms4JYuCsFPsPbtcM6K0qG9uQVaM4XME7NTPcFDlqaOdhfAuzIj12cgxv8VlrEbLAGpFqjquYSngbKup+rnblHTKbrX3o6FetIcQGGk7H0HgieM/ch8tSOele0EsqC20sGS0zdIcRIr0zPZXONl5oPnEmGNp33LF/XM5AKLP60pHRZ0yoJv0SXvVzULvrTeZR2Fa0T6MFqJ5AQUThyMMpvYrh27NYBvHeTjiKnQjkqCLV/U+sCz/798VY0ttjj3CWwscrD1PpffeT+0q/dD5u+Nr5T9ICBPwGPXeIjx8Qdr6a+rQm88hbiZqkKCOz/Gpu4aVCUhn9HXQNlFVpKnOuxVb7NG7Zc6Uj5e9ZG71E1sJ6RL51enmbBgHrx47VLgifeLfnzmlTcK+iog0Ipe0DnfYGgqYSoD0OACFNxCQgM+5gK/mi3HChcC/ZTxVbk3FzVGVD9fs4bSdkan6umUkhas7HolCdYF+lmbfSVNGBeKANsZc0YRxH0Pw2RUrUJP/7rX8ndlNOX2gZKYp6t3u5/amB/dtZc7SFcyw73bVUhW1qejw7XahbGqfXjAHQoA+Azg8iy5nApARFguiBzne6wbTSix768KFsyDj+pLnaXXqDiAvKImq46OHG/0/ko/FgrtLPapGWlIGODMH/wbfbwI3PknweCf4I5oTYDvgKuLZ8XA6aBwiwk8jUwb9BKyMP0R8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjE3WkFXbGRwYklKZ3I1S0hUS051d0Joak5UTXFhTHEwL1BqbXQwUmdyMGNV?=
 =?utf-8?B?MENqcEk2Y3JTeklSelpVSG1yUjEzN2pBTDQwUEhuWlY4N0pxek1MOXBZaVlO?=
 =?utf-8?B?bk1JYkhTa002dkZ3YSt2VytncG5NL1kySjJBZEdaQVJpekFkUmI2b2ZXWGJh?=
 =?utf-8?B?Sitxc1lBaVpOcThNcUd5MzRPOGZZQnpHN3QwTmhRRnF4VDdUT0w2L1BoSGFL?=
 =?utf-8?B?ZkY3d2tYU3JlMHR3VVJuUWZXa0E2TDEzSVJrN1JuUENpdmM4aStwRk1EV0Fm?=
 =?utf-8?B?REs2aVMzbWxtS0ZNZWRncEhyTmF0ZjIxSC84MTNoY0Q4M3puOU43WDFNZzls?=
 =?utf-8?B?UHYwdEVTWDR3eEpqUFREcVlvSlJtMTAzVDA2V1pSZFlFZGxETnIzRUZDWi85?=
 =?utf-8?B?QnVIMUtGZ2ZBUDFJR21wdk9NdXo4bFdtSTdnUkdGVDd6S3BDNlduZDZmS1dV?=
 =?utf-8?B?S0plL3pEaXFHQUlNNU1FZFBlNTZIb000d3Y0d2l6bVZ3WlJXTXpuOXd0QmpL?=
 =?utf-8?B?aWpxSThwWlJ0SER4K2ZIRE0rMXlpYlgzSEpwcG1UdEZJK2QvSEtIYW9QWGtG?=
 =?utf-8?B?WUorU2R2cGdMaFBtRnlLYnJpM2xRWmFic3ZDZjh4blZEZjljUUFKVE1Tc3RN?=
 =?utf-8?B?c3drM0htdEIzdzFYSnZNaVVuUk1wa0hkWTZWZGJiaW0rZWRoRENGQi8ranE3?=
 =?utf-8?B?Nnpld3pXYS9WTzVUK1Yvd0RCSUJGSmpQQnp0YlVlblRqU2dkS2M4MWxxdDRP?=
 =?utf-8?B?NTdGME5VanBvdHlPa3hpd25SRW5JcElBR1VZZVZZbXFTdkkzOU9pUk5CcGc4?=
 =?utf-8?B?UlZGQTBYNkVVQkd1QkZJOWIxcDFuQkVlb1B6WDgzN01WS25IZUpNNnZhK1RZ?=
 =?utf-8?B?b0wzRENVRE5mR082eEQ2cU52Z09oeTBQdDNJT1lIRGJSUUtTUjZXZktoR0Qv?=
 =?utf-8?B?RDVlQ2lScU0vWFcwUEpqd2o3QmNZVkEvKzh2Q1BabW12dVM5TlZobVdTS3c3?=
 =?utf-8?B?d2ZIaVg0OGRyVHExaVFtL1k0TUlEY3hzaE5GU1g0eGRJek8wZHQ0WDVlR0pm?=
 =?utf-8?B?Z0t1czA5VEE5cHpPd3VtYnpqSmI4WU9LVWlIcytlM3pQTWllVXJhWVZyaVRF?=
 =?utf-8?B?TzlsK2x1ZXZ2SWl5ODQ3akdGemo2VGV3ait0WU04SmpraEpPN3FsOUVTY3Zw?=
 =?utf-8?B?bE5FeG5OM1QrYmJNZTFkaFB2QysyZXNPQ0NZVnpZbEhJUFBEQTVJY21VRFAw?=
 =?utf-8?B?MEVSYmpCYWlGaFdORGs5ekhOcktpb2FuY1FETmhrQXNQRCtWZlkxN0xNbUJx?=
 =?utf-8?B?V01LNGt3RkFJWmdRdi9aUXh6RUl5K0pwWFZMeTdoNUJONFJDUEU2Mk96R2Q5?=
 =?utf-8?B?MkFCb1VyTXhLR2ZZZDFIdThjOG1nVVRXZU5nRXJad2lpL3ZlclI1YVFzSStl?=
 =?utf-8?B?V3h1QnZGS3pTU2QrdjlJMS9CTW12ZjNCUG5qUkM1a1l2RGpSaWV0MDFZZjFm?=
 =?utf-8?B?ZE1rV1JpZ2Vkd0pOZ3FBcm5adnkxQW9JNXhhbGkvNmpndkpJb0lZOGFNcmpj?=
 =?utf-8?B?WmJpWEdvRTVEN2FRZTFaTXFUVStnT2oyK0NzdjV2N2NLUk5DcWc5aG44d3pW?=
 =?utf-8?B?bENuNGhJUTFITU5pYkllVFRBVHlQalFKU0VqK1ZFczNrTjBSKzFOd2lFR3FL?=
 =?utf-8?B?b28vdVpmVzhPMlUvWTVvS01PdWJ2REhOVzRoRGI5cGVnWlRONDNEOWJURWNV?=
 =?utf-8?B?eG9YSjNEd0FtZG5KTzAyS1BCRUtycFkyTStQNm1KOVB2RjhGeFc2VmxFWEkw?=
 =?utf-8?B?b2ZwbTNXak5GaDRGQlhlU2xNOFYzZndWVXk3M1BSOE5ybElMSkVPMnc0UWl2?=
 =?utf-8?B?MkJHamdUejNPRkEvTFcweWJzOGMvU3o4L1BCMzhpU3NWMDFsVlZuZVlxNlRO?=
 =?utf-8?B?bURUU1Zpd3FLdjFwa0ZrTmhhZnIrWlpvNElveVNtcWJzSHJBQzVkeENLYkFh?=
 =?utf-8?B?ZHhoRWRMRURpQ2M0YllyQ2p4OHAyQlhVL3U1WkJ4eXhreldQNEg5cUgvVTU1?=
 =?utf-8?B?NWlpdnJFMWV1Q1hGMk5ZeGd4TEx0anFjOG5YQW5kK1dYTXIwUGR4YW0zZDdW?=
 =?utf-8?B?OEppNmQ1aERWZFdwNktJRTRIaTd4elFSLzdId1NjMGVPYm5hb3J1TU84dkht?=
 =?utf-8?B?K2RiaEc4azNUcFFKci9jTndLR0dSSnZLSUR1YmRsb0FCdG9aN2hNNldhS0hn?=
 =?utf-8?B?VUVESlJKS05CQ2crNXl2b0hvYVZIeEVmS1g3K3NES25vQVI4WnFwNVUzSUc4?=
 =?utf-8?B?dkFMRGI4djcrb0lYbHFZSjRxS1NYMHN5UG9LTzBPeGdxTUU4TXlPOE5iblF4?=
 =?utf-8?Q?4X9Amf85r1v8zgNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE771A29A5AFF3439BE0DDA8F403F56A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6b5665-2bcb-49b4-b2eb-08dea4efdf9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 06:32:08.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEU2jqTUosoXdzOWS6z4aK/y5piYze5djOUNAUwJceaMR3QRrMaku7Lv514JCIGuKC5gTYVoZDKgd4C2NimPXTBukMSOqnc3iJLfOC31BUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9624

SGksDQoNCkkgYW0gbG9va2luZyBpbnRvIHRoZSBNSEkgYnVzIHN1YnN5c3RlbSAoZHJpdmVycy9i
dXMvbWhpLykgdG8gYmV0dGVyIA0KdW5kZXJzdGFuZCB0aGUgcHJvdG9jb2wgYW5kIHRoZSBzZW1h
bnRpY3MgYmVoaW5kIHRoZSBNTUlPIHJlZ2lzdGVyIA0KbGF5b3V0IGRlZmluZWQgaW4gZHJpdmVy
cy9idXMvbWhpL2NvbW1vbi5oLiBNeSBtb3RpdmF0aW9uIGlzIHRoYXQgSSANCndvdWxkIGxpa2Ug
dG8gdXNlIE1ISSB0byBjb21tdW5pY2F0ZSB3aXRoIGEgUENJZSBkZXZpY2UgcmF0aGVyIHRoYW4g
DQpyZWludmVudGluZyBhIHNpbWlsYXIgcHJvdG9jb2wgZnJvbSBzY3JhdGNoLg0KDQpUaGUgaW4t
dHJlZSBkb2N1bWVudGF0aW9uIChEb2N1bWVudGF0aW9uL21oaS8pIGdpdmVzIGEgZ29vZCANCmFy
Y2hpdGVjdHVyYWwgb3ZlcnZpZXcsIGFuZCBzZXZlcmFsIGNvbW1lbnRzIGluIHRoZSBjb2RlIHJl
ZmVyIHRvIHRoZSANCk1ISSBzcGVjaWZpY2F0aW9uIGJ5IHNlY3Rpb24gbnVtYmVyIChlLmcuIGRy
aXZlcnMvYnVzL21oaS9lcC9tYWluLmM6NTcgDQptZW50aW9ucyAic2VjdGlvbiA0LjMsIEludGVy
cnVwdCBtb2RlcmF0aW9uIikgYW5kIGJ5IHZlcnNpb24gKGNvbW1pdCANCjQ4Zjk4NDk2YjFkZSBt
ZW50aW9ucyAiTUhJIHNwZWMgdjEuMiIpLiBIb3dldmVyLCBJIGNvdWxkIG5vdCBmaW5kIGEgDQpw
b2ludGVyIHRvIHRoZSBzcGVjaWZpY2F0aW9uIGRvY3VtZW50IGl0c2VsZi4NCg0KQ291bGQgeW91
IHRlbGwgbWU6DQoxLiBJcyB0aGUgTUhJIHNwZWNpZmljYXRpb24gcHVibGljbHkgYXZhaWxhYmxl
PyBJZiBzbywgd2hlcmUgY2FuIGl0IGJlIA0KZG93bmxvYWRlZCAoUXVhbGNvbW0gZGV2ZWxvcGVy
IHBvcnRhbCwgZWxzZXdoZXJlKT8NCjIuIElzIE1ISSBpbnRlbmRlZC9zdWl0YWJsZSBmb3IgdXNl
IHdpdGggbm9uLVF1YWxjb21tIGRldmljZXMsIG9yIHdvdWxkIA0KeW91IHJlY29tbWVuZCBhZ2Fp
bnN0IGdvaW5nIGRvd24gdGhhdCBwYXRoPw0KDQpUaGFua3MgaW4gYWR2YW5jZSBmb3IgYW55IHBv
aW50ZXIuDQoNClJlZ2FyZHMsDQpMdWRvdmljIERlc3JvY2hlcw0K
