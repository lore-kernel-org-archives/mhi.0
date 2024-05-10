Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485CD2F5
	for <mhi@lists.linux.dev>; Fri, 10 May 2024 00:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715302503; cv=none; b=sMOyOrUQF2mf+jOVJ2GNZflpu9sJFHLMFkOndalV+GwCu1CjuAo0lJhP4gLhuz1C0NlNtzxT4/srTSROKpQJtkV3bL8QZBGpJ0LZdISx1OFvkEBbfA/qWBigfdNAg+o6S8WIavMnXXJBfBggA1TTvNYvVLKgqXRekL5HGFSXad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715302503; c=relaxed/simple;
	bh=GRVSGVYwR5joY8F7eRtMT4D+7hl9XGVUXnNUCmZg838=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V+H/PXNIJ6ahhrB/i9o6c/inx4Ra556UkaKSaV719Y5CfKIgcrLL4hCpHMRCflUUQQry7NUeU933eqP0TkQycaBTmdKh/hAFQJeqI0i45h3O3umLzxhqgloJkU11ry1DFspCUiAuoQXIHwTmCDEt7KWMKRTpSUfXCrApII/rvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=SrFr53h/; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="SrFr53h/"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 187E62C0132;
	Fri, 10 May 2024 12:54:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1715302490;
	bh=GRVSGVYwR5joY8F7eRtMT4D+7hl9XGVUXnNUCmZg838=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SrFr53h/I6mPCw2i1q03/yfVaHEgkxL3m7jE0jK4IpYlRQGjUJilJR1xav141r5Po
	 b5A5KJ/ZnUARNZTvY0kwAbbxeXQo6QOP72kX/HY2S26syoUL/mVQ762atG+9BzSN4F
	 qlCLPCdmo8jDF5vAxkL/2rlg67UTPRS8TP7F4EsWMlHBxJmZxBkmTVynoG59ymQLAz
	 3AI9UxuwU3neUO4qA/Tl7Fd3jnOpUAb8RwAEgQQ4uloxXf+zy6qP6i35xLHfW50m2X
	 4a4/rwWEaQzthCjYoO1wT5Nzx5xHy8SZlhFnMzJWdqShH6jRuEJ8FlZfFMnO8wvbBu
	 Trx2eOnlfuA4A==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B663d70590000>; Fri, 10 May 2024 12:54:49 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 May 2024 12:54:49 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Fri, 10 May 2024 12:54:49 +1200
From: Paul Davey <Paul.Davey@alliedtelesis.co.nz>
To: "faecknitz@hotsplots.de" <faecknitz@hotsplots.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
CC: "mhi@lists.linux.dev" <mhi@lists.linux.dev>
Subject: Re: MHI MMIO endian issue
Thread-Topic: MHI MMIO endian issue
Thread-Index: AQHam5SN8jGvmtki/EW3mpTNYdjPYbGO6P2A
Date: Fri, 10 May 2024 00:54:49 +0000
Message-ID: <641289b189a8e85244f2e6d338aa0f376f4a7da2.camel@alliedtelesis.co.nz>
References: <ZjFjEe0-tJ6un10J@dev2> <20240501065504.GA1979@thinkpad>
In-Reply-To: <20240501065504.GA1979@thinkpad>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FDE10AF98DFA147A5DB34F82246A1C5@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=MfrPuI/f c=1 sm=1 tr=0 ts=663d7059 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=TpHVaj0NuXgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=2B1QhGGsJJc7WSE29eAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0

T24gV2VkLCAyMDI0LTA1LTAxIGF0IDEyOjI1ICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
d3JvdGU6DQo+IA0KPiBZb3UgYXJlIG5vdCB0aGUgZmlyc3Qgb25lIHRvIHRyeSBNSEkgb24gYSBi
aWcgZW5kaWFuIG1hY2hpbmUuIFBhdWwNCj4gZGlkIHRoYXQgYQ0KPiB3aGlsZSBhZ28gYW5kIGZp
eGVkIHNvbWUgaXNzdWVzIHcuci50IGVuZGlhbmVzcyBbMV0uIEJ1dCBJJ20NCj4gd29uZGVyaW5n
IGhvdyBQYXVsDQo+IGRpZG4ndCBoaXQgdGhlIGlzc3VlIHRoYXQgeW91IGFyZSBzZWVpbmcuDQo+
IA0KSSBzdXNwZWN0IHRoZSByZWFzb24gSSBkaWQgbm90IHNlZSB0aGlzIGlzIHRoYXQgdGhlIHBs
YXRmb3JtIEkgd2FzDQp1c2luZyB0aGUgTUhJIHN0YWNrIG9uIGhhcyBzb21lIHN1cHBvcnQgZm9y
IGhhcmR3YXJlIGVuZGlhbmVzcw0KdHJhbnNsYXRpb24gaW4gUENJZSBCQVJzIHdoaWNoIHdhcyBs
aWtlbHkgbWFza2luZyB0aGUgZGlmZmVyZW5jZSBmb3INCnRoZSBNTUlPIHJlZ2lzdGVycyBidXQg
ZGlkIG5vdCBkbyBhbnl0aGluZyBhYm91dCB0aGUgaG9zdCBSQU0gYWNjZXNzZXMNCmZyb20gdGhl
IE1ISSBtb2RlbS4NCg0KSSBhbSBub3Qgc3VyZSBob3cgcHJldmFsZW50IHRoYXQgc29ydCBvZiBm
ZWF0dXJlIGlzIG9yIGhvdyBpdCBpcyBiZXN0DQp0byBkZWFsIHdpdGggTU1JTyBhY2Nlc3MgaWYg
aXQgbWF5IGJlIGVuYWJsZWQsIGRvZXMgdGhpcyBjb21lIHVwIHdpdGgNCmFueSBvdGhlciBQQ0ll
IGRldmljZXM/ICBTb21lIG9mIHRoZSBhdGhlcm9zIGV0aGVybmV0IE5JQyBkcml2ZXJzIChhdA0K
bGVhc3QgYXRsMWUgYW5kIGF0bDFjKSBhcHBlYXIgdG8gdHJhbnNsYXRlIGRtYSBidWZmZXIgYWRk
cmVzc2VzIGFuZA0KbGVuZ3RocyB0byBsaXR0bGUgZW5kaWFuIGluIGRlc2NyaXB0b3JzIGJ1dCBu
b3Qgb3RoZXIgZmllbGRzIGluIHRob3NlDQpkZXNjcmlwdG9ycyBhbmQgbm90IGFueSBNTUlPIHJl
Z2lzdGVyIGFjY2Vzc2VzLg0KPiANCj4gWzFdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL21o
aS8yMDIyMDIxMjE4MjExNy40OTQzOC0zLW1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3Jn
Lw0KPiANCj4gDQoNClRoYW5rcywNClBhdWwNCg==
