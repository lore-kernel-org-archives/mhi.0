Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0ED37104D
	for <mhi@lists.linux.dev>; Tue, 28 Apr 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366794; cv=fail; b=mDmUeiBl23ADZ2RonSK5ZKJQpyD574BQMwrrhW22s238QXplqTpRcy0WZri/jg11fcOCjpveddRV4YD4tmVJilc9zyvtuVnLEAo3FuPVH0rdQ+M5K5tJ0NRm3kE+XlUzhKg468mQXADQT4bP69tZP4hGuq3HfW02/Ps8clhDZAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366794; c=relaxed/simple;
	bh=eePsXkUHcmpIEfovj10+4hFNOXUvYOYytUzcxzqzRTA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ssW7q49HyRWwVhKoVC9mmGxgRVIm/14Xf/uvVQ/q79FPpO/bJhyaeEYKJViVua7e3FPe9LQAl0HyTYO5RyS/A8H5x+jrSA4pm006Rrl0iLKy8YOpcm0Fuv6NJFXb7dP+ZhM6vDNm0uF9mPPZxonFxfGqC0Sj3WDlyu4IIEv9EIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=35/2agYR; arc=fail smtp.client-ip=52.101.62.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="35/2agYR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDnFtlBJbbet/eClkUetaBV1qJ6ahcZB4elDQ1fAHG6cr5ZrXr0xPJyO6NhX+GXkTJ5IlLmatwdN+nR9/gpYBFGpq3qGZtVFLHfzjOVThSc+NTpS7BJpM3GknUXWK20Zk4nbeFr3947J20Uqd0U/9s0IoX/NM1V6TM2hoHPs6yI7qfBPoLUAcFN7F12QVHgRmXppSvflwjxMgeEvpuT+gGJVkLXTjeCRCN+6Qi6tCpZLT5LO3WjiKcBK5VlY1HSJorAaUFSTFFDy00BD7WnoUX/Rtp4rY6epdVvxSMiyWMr0/8rN8vV33pnbaUKPDRVs8FnyjUPNCceGHWOY1uC5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eePsXkUHcmpIEfovj10+4hFNOXUvYOYytUzcxzqzRTA=;
 b=JbevkVE0FDSbyaAu550D9MxTJwotdBknqj728ssGjK4cpgaHllatFu+LaxauWlsXm+6CTlbAzbZz8V6X8es+S7NTOnOw2tTRCw4FSFXtSSiWwnxwIV+qqzcuYO3mIClVuR+PFbURXPkqu1WzZd7lSolAEQqrC/xub1EtTIcD/tM4oumFpviTuy1FpbEwjeehNVheoxc2DI2DSrHtmOE+hVFQks1fqjGmUQTXPa6Jkt7rqg1gkZ4WzeOWc5nxM07RW0K7kTLmLOPjeyAewcKG0V/luNL5cyN43GeAKHEwUT/GXyKQjtN12zQbVh8TWpBASxHaClsKTYX0Ckj+wEgxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eePsXkUHcmpIEfovj10+4hFNOXUvYOYytUzcxzqzRTA=;
 b=35/2agYRdVROEUvKa7ZGcIxUanUzUCtBf9FufbAbB338ogAbdDGoeqHZyCuIGCCIQQtZX49rsKc8C299l7i57luILYzkKNwavLNhnI9DBX2azs133ILu0KVBALf7oc9/DbO13fPk/Xa9IijqgeiBwSc/KwXNRW4WMKd8yuo0HMPwcFejaP7KZlFDitIpjdrZWN8NrTk5S6tz3bbDwhb1pVLUXeEpbNZfDqJMJtdyDqsetLeur8Aq5WXXJfEgoqyix8KIsL5xINzkh2pY2qPuvK2AcQ99cBfsDbLndCFOz+RI/o+mx33e+1PWn8umBVnp5w+E69VKSHmgwyoQSvQ2tA==
Received: from IA0PR11MB7257.namprd11.prod.outlook.com (2603:10b6:208:43e::21)
 by DSVPR11MB9717.namprd11.prod.outlook.com (2603:10b6:8:34c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 08:59:49 +0000
Received: from IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::1951:f84c:a8d2:b97c]) by IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::1951:f84c:a8d2:b97c%7]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 08:59:49 +0000
From: <Ludovic.Desroches@microchip.com>
To: <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <Nicolas.Ferre@microchip.com>,
	<Cyrille.Pitchen@microchip.com>
Subject: Re: [QUESTION] Public availability of the MHI specification
Thread-Topic: [QUESTION] Public availability of the MHI specification
Thread-Index: AQHc1ti9uIEu7Sb6wUW57SNjhwURqrX0H+wAgAANIgA=
Date: Tue, 28 Apr 2026 08:59:49 +0000
Message-ID: <cbbf24a2-7d7f-4caf-a445-ee83c40ee1a3@microchip.com>
References: <013437b9-e12f-488b-838e-5144026458b2@microchip.com>
 <lxx5zfhequqedinh5vlmqmfucaeo3ltp5yypn4dhlw2mkw4roc@digcn3fue7ph>
In-Reply-To: <lxx5zfhequqedinh5vlmqmfucaeo3ltp5yypn4dhlw2mkw4roc@digcn3fue7ph>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7257:EE_|DSVPR11MB9717:EE_
x-ms-office365-filtering-correlation-id: d87fc5e0-0a6f-4f78-930d-08dea50480e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 WFxaU6sknCg5bodfHVM5CJw5ZMVhz3e/1qNIKAPPdFDuhBIbx6EgBf53QUvInL9wve7lYufO7VD9DGh3Fa5Wpe0VQiVTPyEVuKA5zVu1Xb04z95yGN8yBnop2GHwnZsc9Ez/ebTybEfMDdleG6uYHnTPrGDy8WayCW8OD7cpeVv2EEo0LTe0JF2EBQxRQm6fIjxmGVMVhL4CXUCh7Hwku4ePBUKL7LE8lw/V6xzThPGo0GH+B22bDQzXxUHy4oVfSIg3654A3soJX03RMefuFI6dLfwCQiLDtoNlFkjJFCp2fV7DJ/gI2rOHjjDbnSVeXY9WSqvuRYpUBH13Zt+UpUWhXVj56aDibdJXPRvtzRsvQIIclxmaCGzL7slPfw8OcfhSaI/JOTjCiIEq/xeZEX7mcM39hgiIvyMVCyLYNvHasFkfNpJ0jMXnYozms/JgvnLVT5dA0Bgj7MDheczuMe6l7DCEvkac7XTUZ4RQyeLJA7w0LOIIy9INKNCX6PuKGI8y+pfXKca4iSnSmGX871YJD5PdnUMBYqNXgm0iTdJ/59KqC7eb6zSuL80wA4IEax/3JXD+xvMFuW0sUFQGlPBTG6ISGkmCpTCa3w5ud1quGcepRTcDQf5qQvrSXzMVjSMTvKnH5AaG7M/5HB7p3QgnDjSYt3+kim6e6/VUM3Kesv6Ni5qgQx80L7gkaVe9QsSLEWgO55k7KCUmovtDhKFxDT+3prWaqwA1se4ipzfhSNj8dQzFQeMTZyeeiimz5k0xW5v8tbmZtdkyIhK4it5Mgdq1T5Ql6e+X/hldHWs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amtVOStwZU9memVmc1dJVnVKVjlKcU9CTHFNOEE5dGJhT1VHb1ZzcXk2T2g5?=
 =?utf-8?B?N2h4TWZOV2UwRWZFc2w0K0tBNENSbzJZU1JxdDg3dmxIY29ndEdZc2VUVDRG?=
 =?utf-8?B?S1h4Mmp4c0U5SGQ1clZ6RjdKZ2JSVGFFTlNta1lreVpUekRwMDBYZjRGTUdG?=
 =?utf-8?B?Vlc4SWxKNUhyLy91UGRUNHYzTWpoMU5lM3NoU3BIM20rN08xcE9MV05GYWI3?=
 =?utf-8?B?TTNDQitQVlpEOXBYOC82WWhaa2dDOUpGV3hTT0ZtZUNUOUxGcndOeVZlNDlM?=
 =?utf-8?B?VldMcWRHaHdiNjYrOEZuaTluOUNnLyt5SjZZRWt3cEdpUHRCekF3eHpIM0pD?=
 =?utf-8?B?V0t3ZktPNEZBYkREaDVsckxMUm56NXI2Ym5paGtwYmlxQ0VCbk01NWNHMmRi?=
 =?utf-8?B?aTNxYkYva2dzSmZtRUdtL2dybW1BNEtvaUlhOU9vNTNmVFJHUUlZamZKdEc1?=
 =?utf-8?B?eWxQOGVSUyt3OCtleHI1NTExc3U3enB5UC9keSs0SUtwNEs5Mkt4ZGswSHRE?=
 =?utf-8?B?WXFteEFZdW5rTUM2V1N5YmRIaklxT2JDamFubTU4TDhTL2hBQnhkU0ZuR2dn?=
 =?utf-8?B?bk1xT1hLZkdZQ1BSUFgxZGo4TkhWQWJGdFRyVWJFeDhvNWgrNGlObVdxaHdp?=
 =?utf-8?B?Smkzcmk0QVViU292OFVmQmVGNGV5RWFHZlZ6Z0d5RStNUkhSb1IwZGhUNkpK?=
 =?utf-8?B?blh4Nit0OHh4ME1Tam9iWGwrTVpsSU1hMmRYMTlaYnV0UnpNbDdGdFdyakFj?=
 =?utf-8?B?YWxTN2hCdVlmVS9RNlRtUzloTFVIZktPT0g0VHE1L3VqUDJYY2E1blljQWhH?=
 =?utf-8?B?dkIvRzBMQlp0L0F4V2hIcUNwVTB6bUtHdFFqei85SkNvTTEyOUlKMk9uVHkr?=
 =?utf-8?B?K0hzSTNyUVovK2puQ21VNzRTejBVbnpFSzM0eE5KQlZZaXVzUE5qcUlCb3lG?=
 =?utf-8?B?dEVuKyt1UWROR2JGOXVscm13MW1lQnRmWGxWRGh2eHJRMk1mVXJSM0ZObERp?=
 =?utf-8?B?azIvQVJuMXh5ZXVQWHhLbFo2TFFrWmFxSm96UVZOVnJxSmd0WUZNNFZuazZN?=
 =?utf-8?B?TThhcGZKYkNjSXI3dWowVDhnZWlBd1hKeHNHZzZHVEg2bGIxalRNcnU0cmlE?=
 =?utf-8?B?ZGR4RUdVRjgzRm5kbzAzZDhDbWVTWGpIdk9hZEFqbWpqVkRlRUtITUdqUTZ2?=
 =?utf-8?B?Y1dYc1R2dFFudG5YUTFqaHlkQUdKQ1hOalYvTlo0dEVmRnEwdXEvVU1MdHFI?=
 =?utf-8?B?dktOaXVqSXMvVmxKN1pHTVlhc1BMV2c4OUJyRThQMVV1OEViNFF4MkV1WWZp?=
 =?utf-8?B?bk9Sa3FHajBGZXQ4RWk5RUQ3Ui9aRXhQaE5vS3BrQjdzdjFDaSt0QTJnREVi?=
 =?utf-8?B?MjBHWVFQck5PMEhxa0hUL2txM3FFdnRFOGg1UFB6REVRZU10by9yV0IzZ3J6?=
 =?utf-8?B?Yy9FMkNoQWdHMCtucmZTbnRRc3VaaUh1QkFyOEJ3V2ZnVHRCTmJVVmlEZ3lS?=
 =?utf-8?B?a1d2aGhFRGNPZ3RXNnEvcTNPVEN1OEJzQnBLdC9zOFlETnZ2aER1WEdtUkVv?=
 =?utf-8?B?enZXSEhpUUMvQ2hzQlY2TkVjVXJ6T3NLWWFXOVFkUUZ2N0cwVTZnZzNFdWJF?=
 =?utf-8?B?eXBKUTYwQlpWdDVQQ3YwVkFVRkZHY3lVVlhXcXg4N3crdWZjQ3JudldkaDdH?=
 =?utf-8?B?TWhRU2dsR1EwNDllODNDZ1hwL2dEbXRWVXVxYmw5Y25EaUJrdldiaGI0bUFO?=
 =?utf-8?B?bHk4QmxKR0I5eVpCSnNwL1kxa0JqbGFuSFBtclhHTHBqbjI3ckg1dHVIYzdS?=
 =?utf-8?B?TXR0Wmg3Y21qbHJmM1U4SUlQR0Q3aWRpclgvV0lMUzJiTWpJVEpIUXIrNUY1?=
 =?utf-8?B?cHFaSkR6SjdRMVQwOExXWjE3czZvZWtCR2hOZ0F6KzhSOVRSWUsyckdhMVNS?=
 =?utf-8?B?Wm1BUWFCeU90TVhING1oQ3JOS3k1MnRpVnM0b05Eam1vOXF3TGJxcDFYU0g0?=
 =?utf-8?B?NldPV2cxVE10MHE4MHNSQzBNdW9oUWc0UzJWczQxU1ZDRklRUXRVNUw5OWV1?=
 =?utf-8?B?UjRaMS9sWTltaDFkS04wSFMxVzNNelJabklOQmR5YkJUNUYvQzR5Y2VGbGFT?=
 =?utf-8?B?UGxUV2tFNlorZEswQUF3aWZlSHpqZk5xV2t6YmZlNStGanFHaUE1eWlZZTBD?=
 =?utf-8?B?R1psdGw2dnVkcXdlOTdndGgzdTlnd01zM3R4OFZZMSt6TktSQVJhdGpKS0xr?=
 =?utf-8?B?RzlIdUpYQUs1TkU1T2pXWU9sb2hoZFgyTHZRYU5OTDF5djlhTE1ZKzg4QUQ4?=
 =?utf-8?B?VWdBMEJZbTRGQ0l0Tk1jTWMxT3M1bEVlbXZoTlA3cU9uYmhabjErRFJnOXhS?=
 =?utf-8?Q?ybUTCKqR7mHMGUR4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8081659D0351B44EA72A128D801B7820@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d87fc5e0-0a6f-4f78-930d-08dea50480e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 08:59:49.4137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FrgbCQl4V91WWVkD+L8KS3yWNaStR5cavM0eBgAdJgTTqQ2XJdUvv5fgZC/e6uQMJ6uUlO5uim5AKStErmmDdtQpU6Rn+gwpxGc4B1CHhqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9717

T24gNC8yOC8yNiAxMDoxMiwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOg0KPiBIaSwNCj4g
DQo+IE9uIFR1ZSwgQXByIDI4LCAyMDI2IGF0IDA2OjMyOjA4QU0gKzAwMDAsIEx1ZG92aWMuRGVz
cm9jaGVzQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBJIGFtIGxvb2tpbmcg
aW50byB0aGUgTUhJIGJ1cyBzdWJzeXN0ZW0gKGRyaXZlcnMvYnVzL21oaS8pIHRvIGJldHRlcg0K
Pj4gdW5kZXJzdGFuZCB0aGUgcHJvdG9jb2wgYW5kIHRoZSBzZW1hbnRpY3MgYmVoaW5kIHRoZSBN
TUlPIHJlZ2lzdGVyDQo+PiBsYXlvdXQgZGVmaW5lZCBpbiBkcml2ZXJzL2J1cy9taGkvY29tbW9u
LmguIE15IG1vdGl2YXRpb24gaXMgdGhhdCBJDQo+PiB3b3VsZCBsaWtlIHRvIHVzZSBNSEkgdG8g
Y29tbXVuaWNhdGUgd2l0aCBhIFBDSWUgZGV2aWNlIHJhdGhlciB0aGFuDQo+PiByZWludmVudGlu
ZyBhIHNpbWlsYXIgcHJvdG9jb2wgZnJvbSBzY3JhdGNoLg0KPj4NCj4+IFRoZSBpbi10cmVlIGRv
Y3VtZW50YXRpb24gKERvY3VtZW50YXRpb24vbWhpLykgZ2l2ZXMgYSBnb29kDQo+PiBhcmNoaXRl
Y3R1cmFsIG92ZXJ2aWV3LCBhbmQgc2V2ZXJhbCBjb21tZW50cyBpbiB0aGUgY29kZSByZWZlciB0
byB0aGUNCj4+IE1ISSBzcGVjaWZpY2F0aW9uIGJ5IHNlY3Rpb24gbnVtYmVyIChlLmcuIGRyaXZl
cnMvYnVzL21oaS9lcC9tYWluLmM6NTcNCj4+IG1lbnRpb25zICJzZWN0aW9uIDQuMywgSW50ZXJy
dXB0IG1vZGVyYXRpb24iKSBhbmQgYnkgdmVyc2lvbiAoY29tbWl0DQo+PiA0OGY5ODQ5NmIxZGUg
bWVudGlvbnMgIk1ISSBzcGVjIHYxLjIiKS4gSG93ZXZlciwgSSBjb3VsZCBub3QgZmluZCBhDQo+
PiBwb2ludGVyIHRvIHRoZSBzcGVjaWZpY2F0aW9uIGRvY3VtZW50IGl0c2VsZi4NCj4+DQo+PiBD
b3VsZCB5b3UgdGVsbCBtZToNCj4+IDEuIElzIHRoZSBNSEkgc3BlY2lmaWNhdGlvbiBwdWJsaWNs
eSBhdmFpbGFibGU/IElmIHNvLCB3aGVyZSBjYW4gaXQgYmUNCj4+IGRvd25sb2FkZWQgKFF1YWxj
b21tIGRldmVsb3BlciBwb3J0YWwsIGVsc2V3aGVyZSk/DQo+PiAyLiBJcyBNSEkgaW50ZW5kZWQv
c3VpdGFibGUgZm9yIHVzZSB3aXRoIG5vbi1RdWFsY29tbSBkZXZpY2VzLCBvciB3b3VsZA0KPj4g
eW91IHJlY29tbWVuZCBhZ2FpbnN0IGdvaW5nIGRvd24gdGhhdCBwYXRoPw0KPj4NCj4gDQo+IE1I
SSBpcyBhIFF1YWxjb21tJ3MgcHJvcHJpZXRhcnksIHBhdGVudGVkIFsxXSBwcm90b2NvbC4gU28g
eW91IGNhbm5vdCB1c2UgaXQgaW4NCj4gbm9uLVFjb20gcHJvZHVjdHMgd2l0aG91dCBnZXR0aW5n
IHByaW9yIGFwcHJvdmFsIGZyb20gUXVhbGNvbW0uIEFsc28sIHRoZSBzcGVjDQo+IGlzIG5vdCBv
cGVuIGFzIGl0IGlzIG5vdCBtZWFudCB0byBiZSBkZXZlbG9wZWQgb3V0c2lkZSBvZiBRdWFsY29t
bSBwcm9kdWN0cy4NCg0KVW5kZXJzdG9vZC4gSXQgd291bGQgYmUgbmljZSB0byBoYXZlIGEgZ2Vu
ZXJpYyBzb2x1dGlvbiBmb3IgdGhpcyANCnJlY3VycmluZyBjb21tdW5pY2F0aW9uIG5lZWQsIGFz
IHRoZSBkb29yYmVsbCBhbmQgcmluZyBidWZmZXIgbWVjaGFuaXNtIA0KaXMgYSBwYXR0ZXJuIHNo
YXJlZCBieSBtYW55IGRyaXZlcnMsIGVzcGVjaWFsbHkgUENJZSBvbmVzLg0KDQo+IA0KPiBJZiB5
b3UganVzdCB3YW50IGEgcHJvdG9jb2wgdGhhdCB3b3JrcyBvbiB0b3Agb2YgcGh5c2ljYWwgdHJh
bnNwb3J0IGxpa2UgUENJZSBvbg0KPiBhbGwgcGxhdGZvcm1zLCBJJ2Qgc3VnZ2VzdCB1c2luZyBh
biBvcGVuc291cmNlIHRyYW5zcG9ydCBsaWtlIFZpcnRJTy4NCj4gDQoNClRoYW5rcyBmb3IgdGhl
IHBvaW50ZXIg4oCUIG5vdCBzdXJlIGl0IGZpdHMgbXkgbmVlZHMsIEkgd2lsbCBpbnZlc3RpZ2F0
ZSANCmluIG1vcmUgZGV0YWlsLg0KDQpSZWdhcmRzLA0KTHVkb3ZpYw0KDQo+IC0gTWFuaQ0KPiAN
Cj4gWzFdIGh0dHBzOi8vcGF0ZW50cy5nb29nbGUuY29tL3BhdGVudC9VUzIwMTQwMjA3OTkxQTEv
ZW4NCj4gDQo+IC0tDQo+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprg
rr/grrXgrq7gr40NCg0K
