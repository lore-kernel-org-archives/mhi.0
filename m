Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E76463B6A
	for <mhi@lists.linux.dev>; Thu, 15 Oct 2026 06:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044855; cv=none; b=dq9Nd3MhAjc2AYa4rgqj5DxDXg3JWZoM8/lzIYf6yKHL4ykyhP63cHM0JAkiE3WHAK5lG53l43BhetYLh+kv3abb8aih33zRcS+42tqNS9vUxqvuPyPcbN4qWNA7zNap3ywKGXM/JUdf/y9Swx697ua7zv17AIcQxmB9RwjNpZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044855; c=relaxed/simple;
	bh=A707wls31/eBkNhp2G0sxNimnvn4r7S/1WK2jh4NHoA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ouVSEFc9muXHcXNso5M1Y+droElP1lvjDPspDfN7EGQGn5E3FMXCUD8JN6JFrr9VsS8HO8yWD9zaWb0IDbZsag//90GjppmMa8mEttLx9cV3mQl3nqe0H3V7KvCjB4KnGHH1jXJZS2MxvRGut0G17Cifp5YTAEa6em1g7xdX/1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RGmiTV6f; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RGmiTV6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=A707wls31/eBkNhp2G0sxNimnvn4r7S/1WK2jh4NHoA=; b=R
	GmiTV6fTs45cmDkjTvf+IHC4L1K4HrynpgKlqmvoRNHsr8D4HLv5045FZBjBWo8M
	XPAcucwOGyb4htYufaAMSmkW2rGhrH+ouLkuy8KE4E1AoEznXhq8eFtiMdNsI/sL
	BbF1X7GdfzDIryg9KRgl8f2KkwetjkHNBlQXmLXoy0=
Received: from slark_xiao$163.com (
 [2408:8459:3c60:813e:6c63:98bf:da07:5564] ) by ajax-webmail-wmsvr-40-113
 (Coremail) ; Thu, 15 Oct 2026 14:13:52 +0800 (CST)
Date: Thu, 15 Oct 2026 14:13:52 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>
Cc: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>,
	jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay
 customized support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <astaLolGh8XkPNms@debian>
References: <20260919095506.9570-1-slark_xiao@163.com>
 <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
 <1bec2fd7.99f3.1a0c8ea4db6.Coremail.slark_xiao@163.com>
 <2b0d3e13-96fa-437a-9de9-4a61911fe232@oss.qualcomm.com>
 <nsaa4cchprkgqka7uc4ccr5wq7v6uhue5dpsvquwxyk4ndr57t@i56bkvwpclpo>
 <5506abc6.8919.1a11aab7e81.Coremail.slark_xiao@163.com>
 <astaLolGh8XkPNms@debian>
X-NTES-SC: AL_Qu2SAPyfu0Ao5CWQZekdk0gTg+0/WsW4u/4n345Vc/sEggvW8AYGZURjOFv99fulMSO8nhORbil+1s9rXoV9UQjYBWIQWXWg6PUZagsO/A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <6e90be7f.4d64.1a13e32174b.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSgvCgDnz0Qgb9Bq_s9YAA--.20072W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC5wCyF2rQbyAI5AAA3b
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjYtMTAtMTEgMTc6NDY6MjIsICJNYW5pdmFubmFuIFNhZGhhc2l2YW0iIDxtYW5pQGtl
cm5lbC5vcmc+IHdyb3RlOgo+T24gVGh1LCBPY3QgMDgsIDIwMjYgYXQgMDQ6NDA6MDlQTSArMDgw
MCwgU2xhcmsgWGlhbyB3cm90ZToKPj4gCj4+IAo+PiBBdCAyMDI2LTA5LTI2IDE5OjI2OjE1LCAi
TWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaUBrZXJuZWwub3JnPiB3cm90ZToKPj4gPk9uIFdl
ZCwgU2VwIDIzLCAyMDI2IGF0IDA5OjI0OjU1QU0gKzA1MzAsIEtyaXNobmEgQ2hhaXRhbnlhIENo
dW5kcnUgd3JvdGU6Cj4+ID4+IAo+PiA+PiAKPj4gPj4gT24gOS8yMi8yMDI2IDU6MDkgUE0sIFNs
YXJrIFhpYW8gd3JvdGU6Cj4+ID4+ID4gQXQgMjAyNi0wOS0yMiAxMjoxMjozNSwgIktyaXNobmEg
Q2hhaXRhbnlhIENodW5kcnUiIDxrcmlzaG5hLmNodW5kcnVAb3NzLnF1YWxjb21tLmNvbT4gd3Jv
dGU6Cj4+ID4+ID4+Cj4+ID4+ID4+IE9uIDkvMTkvMjAyNiAzOjI1IFBNLCBTbGFyayBYaWFvIHdy
b3RlOgo+PiA+PiA+Pj4gRm9yIHNvbWUgV1dBTiBkZXZpY2UsIGl0IG1heSBnZXQgYSBTWVMgRVJS
T1IgaXNzdWUgd2hlbiByZXN1bWluZwo+PiA+PiA+Pj4gZnJvbSBzdXNwZW5kIHN0YXRlIGZyZXF1
ZW50bHkuIFJlZmVyIHRvIHRoZSBRdWFsY29tbSBXaW5kb3dzCj4+ID4+ID4+PiBkcml2ZXIsIHRo
ZSBkZWZhdWx0IHZhbHVlIG9mIGF1dG9zdXNwZW5kX2RlbGF5X21zIGlzIHNldCBhcyA1MDAwCj4+
ID4+ID4+PiBtcy4gQnV0IGluIExpbnV4IHNpZGUsIGFsbCBXV0FOIGRldmljZSB3ZXJlIHNldCBh
cyAyMDAwbXMuIFdlCj4+ID4+ID4+PiB0cmllZCB0byBzZXQgdGhpcyB2YWx1ZSB0byA1MDAwbXMg
YW5kIHdlIGNhbiBnZXQgYSBwb3NpdGl2ZSB0ZXN0Cj4+ID4+ID4+PiByZXN1bHQuCj4+ID4+ID4+
Pgo+PiA+PiA+Pj4gU28gd2UgYWRkIGEgc3VwcG9ydCB0byBhbGxvdyB2ZW5kb3IgdG8gc2V0IGEg
ZGlmZmVyZW5jZSB2YWx1ZSBmb3IKPj4gPj4gPj4+IHNwZWNpZmljIFdXQU4gZGV2aWNlLgo+PiA+
PiA+PiB5b3UgY2FuIGNoYW5nZSBhdXRvIHN1c3BlbmQgZGVsYXkgZnJvbSBzeXNmcywgcGxlYXNl
IHVzZSB0aGF0IHdheSBpbnN0ZWFkIG9mCj4+ID4+ID4+IGRvaW5nIGluIHRoZSBkcml2ZXIuCj4+
ID4+ID4+Cj4+ID4+ID4+IC0gS3Jpc2huYSBDaGFpdGFueWEuCj4+ID4+ID4gWWVzLCB3ZSBjYW4g
ZG8gdGhpcyBieSBzZXR0aW5nIHRoZSBzeXNmcyBBUEkgLiBIb3dldmVyLCBub3QgYWxsIHVzZXJz
IAo+PiA+PiA+IGFyZSBhd2FyZSBvZiB0aGlzIG1ldGhvZC4gQWRkaXRpb25hbGx5LCB0aGlzIGFw
cHJvYWNoIGlzIG9ubHkKPj4gPj4gPiBlZmZlY3RpdmUgZm9yIGEgc2luZ2xlIGluc3RhbmNlOyBp
dCByZXF1aXJlcyByZWNvbmZpZ3VyYXRpb24gYWZ0ZXIgZWFjaAo+PiA+PiA+IHJlc3RhcnQsIHdo
aWNoIGlzIHF1aXRlIGluY29udmVuaWVudC4KPj4gPj4geW91IGNhbiBoYXZlIHVkZXYgcnVsZSB0
byBzZXQgdGhpcyB3aXRob3V0IGFueSB1c2VyIGludGVydmVudGlvbi4KPj4gPgo+PiA+V2Ugc2hv
dWxkIG5vdCByZWx5IG9uIHVzZXJzcGFjZSB0byBmaXggdGhlIFNZU19FUlJPUi4gVXNlcnNwYWNl
IGtub2Igc2hvdWxkIG9ubHkKPj4gPmJlIGV4ZXJjaXNlZCB0byBjdXN0b21pemUgdGhlIGRlbGF5
IGZvciBwb3dlciBtYW5hZ2VtZW50IHB1cnBvc2VzLCBub3QgdG8gZml4Cj4+ID5maXJtd2FyZSBj
cmFzaC4KPj4gCj4+ID4KPj4gQWdyZWUuIFdlIGFyZSBzdGlsbCB3b3JraW5nIG9uIHRoZSBpc3N1
ZSBkZWJ1ZyBvbiB0aGUgbW9kZW0gc2lkZS4gCj4+IAo+PiA+Rmlyc3Qgd2Ugc2hvdWxkIGtub3cg
d2hldGhlciB0aGUgZGVmYXVsdCBkZWxheSBjYW4gYmUgaW5jcmVhc2VkIHRvIDUwMDBtcyBmb3IK
Pj4gPmFsbCBkZXZpY2VzIG9yIG5vdC4gSWYgdGhhdCBpcyBub3QgZGVzaXJlZCwgdGhlbiB3ZSBj
YW4gZ28gZm9yIEVuZHBvaW50IHNwZWNpZmljCj4+ID5kZWxheS4KPj4gPgo+PiA+LSBNYW5pCj4+
ID4KPj4gRm9yIHJlZmVyZW5jZSwgTVRLIDVHIG1vZGVtIFQ3MDAgaXMgdXNpbmcgNTAwMG1zIGFz
IGRlZmF1bHQgdmFsdWUuIEFuZCBRdWFsY29tbQo+PiBXaW5kb3dzIGRyaXZlcnMgc2lkZSwgdGhl
IGRlZmF1bHQgdmFsdWUgaXMgNTAwMG1zIGFzIHdlbGwuCj4+IEhvd2V2ZXIsIEkgY2Fubm90IGd1
YXJhbnRlZSB0aGF0IGlmIGFsbCBNSEkgZGV2aWNlcyBhcmUgYWRqdXN0ZWQgdG8gNTAwMG1zLCBz
b21lCj4+IHBvd2VyLXNlbnNpdGl2ZSBkZXZpY2VzIHdpbGwgbm90IG9wcG9zZSB0aGlzIGNoYW5n
ZS4gQWRkaXRpb25hbCwgREVMTCBob3BlcyB0aGF0Cj4+IHdlIG9ubHkgbW9kaWZ5IHRoZSBTRFg3
MiBkZXZpY2Ugd2hpbGUga2VlcGluZyB0aGUgMjAwMG1zIHNldHRpbmcgZm9yIHRoZSBTRFg2Mgo+
PiBkZXZpY2VzLCBhcyB0aGVyZSBhcmUgY3VycmVudGx5IG5vIHNpbWlsYXIgaXNzdWVzIHdpdGgg
dGhlIFNEWDYyIHBsYXRmb3JtLgo+PiAKPgo+SSB0aGluayB3ZSBzaG91bGQga25vdyB0aGUgcm9v
dCBjYXVzZSBvZiB0aGUgY3Jhc2ggYmVmb3JlIGFkZGluZyBteSBmaXguIFJpZ2h0Cj5ub3csIHdl
IG9ubHkga25vdyB0aGF0IGl0IGlzIGEgZmlybXdhcmUgY3Jhc2gsIGJ1dCB3ZSBkb24ndCBrbm93
IGlmIHRoZSBjcmFzaCBpcwo+ZHVlIHRvIE1ISSBzdGFjayBvciBQQ0kgYnVzLiBJZiBpdCBpcyB0
aGUgTUhJIHN0YWNrLCB0aGVuIHdlIGNhbiBxdWlyayB0aGUKPmRldmljZSBpbiBwY2lfZ2VuZXJp
YyBkcml2ZXIuIElmIGl0IGlzIGEgUENJIGJ1cyBpc3N1ZSwgdGhlbiB3ZSBuZWVkIHRvIGhhbmRs
ZQo+dGhlIHF1aXJrIGluIHBjaS9xdWlya3MuYy4KPgo+LSBNYW5pCldlIHByb3ZpZGVkIHRoZSBj
cmFzaCBkdW1wcyB0byBRdWFsY29tbSBmb3IgZnVydGhlciBhbmFseXNpcy4gSXNzdWUgc2VlbXMK
Y29tZSBmcm9tIGZpcm13YXJlIHNpZGUuIEZpbmFsbHksIFF1YWxjb21tIHJlY29tbWVuZCB1cyB0
byB1cGRhdGUgdGhpcwphdXRvIHN1c3BlbmQgZGVsYXkgdmFsdWUgdG8gNXMuIE90aGVyd2lzZSB3
ZSBtYXkgZ2V0IGEgdW5leHBlY3RlZCBpc3N1ZQpmb3Igc29tZSBzcGVjaWZpYyBzY2VuYXJpby4K
QW5kIGN1cnJlbnRseSBvdXIgY3VzdG9tZXIgYWdyZWVkIHRoYXQgd2Ugc2V0IHRoaXMgdmFsdWUg
dG8gNXMgZm9yIGFsbCBEVzU5MzRlCnByb2R1Y3RzLiBTbyBJIHdhbnQgdG8gYWRkIHRoaXMgdXBk
YXRlIGJhc2VkIG9uIG91ciByZWFsIHJlcXVpcmVtZW50LgoKVGhhbmtzCgo=
