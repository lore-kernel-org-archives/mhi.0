Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D283BD638
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448823; cv=none; b=TqPvFydauxo7FI6Iz+EbvO87Jb/YykHT2e3bxsvJ8WRexiDhHVtYK/T/yXKlkxKmq/2f6ShFgdshw1OpiJ2cMgQQt+jmqaVLCG8PNdOzrLV1qya8h0XPVxEaNoVzNowQaLj7GUC38I3WpoMGMT5xNXdiC5XBAo+fo9zREPisLyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448823; c=relaxed/simple;
	bh=cyhLKmoFQnNcEba8TMrb9ar6DwIiwUmEwtd9zdMt+7c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=VhVgsjlBoohSvCUD/uXkxOICrhUo42DxwroY1msgfVHk/ol4ukD+ka0fdkaSfpowo6tS4P1XaNs02fEmjchtekDxrOYtqkwaEXzrIR9dkWs6k00Qa8+Xxq0554OIM4blvhxZjjVVfNVwgKE3bxfH72DBX/+UGBLXrYYWvcGpYxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AjB9skkX; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AjB9skkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=cyhLKmoFQnNcEba8TMrb9ar6DwIiwUmEwtd9zdMt+7c=; b=A
	jB9skkXfGqnNQxju0UenIGtnm2JboNEqZBQbx7t8i/LlD/DBDeVaEp9bqMNyLoQf
	h8HLl/yzjO6O79l3hGmq6dT3gXNfxhpNcQNC8J4o+6z8b0cdpxIFns5kDXS/BE9o
	UOvJ+hkpRm1bkPTA0Jb0RHLZhP6a4P/OiJX8irNo2g=
Received: from slark_xiao$163.com ( [2409:895b:3802:ef4d:5c90:718e:af0:b2d0]
 ) by ajax-webmail-wmsvr-40-102 (Coremail) ; Thu, 8 Oct 2026 16:40:09 +0800
 (CST)
Date: Thu, 8 Oct 2026 16:40:09 +0800 (CST)
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
In-Reply-To: <nsaa4cchprkgqka7uc4ccr5wq7v6uhue5dpsvquwxyk4ndr57t@i56bkvwpclpo>
References: <20260919095506.9570-1-slark_xiao@163.com>
 <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
 <1bec2fd7.99f3.1a0c8ea4db6.Coremail.slark_xiao@163.com>
 <2b0d3e13-96fa-437a-9de9-4a61911fe232@oss.qualcomm.com>
 <nsaa4cchprkgqka7uc4ccr5wq7v6uhue5dpsvquwxyk4ndr57t@i56bkvwpclpo>
X-NTES-SC: AL_Qu2SA/ift0Ar7yCQZ+kfmk8Sg+84W8K3v/0v1YVQOpF8jCzp/hotVmRkOXTG9OWtLh+WvjeKWxF17vpGdIJbeYwJAaYyRbH69B8rJEexO2df+A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <5506abc6.8919.1a11aab7e81.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZigvCgD3uzHpVsdq2x9UAA--.5142W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC5wlcwGrHVunTFQAA3m
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI2LTA5LTI2IDE5OjI2OjE1LCAiTWFuaXZhbm5hbiBTYWRoYXNpdmFtIiA8bWFuaUBr
ZXJuZWwub3JnPiB3cm90ZToKPk9uIFdlZCwgU2VwIDIzLCAyMDI2IGF0IDA5OjI0OjU1QU0gKzA1
MzAsIEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUgd3JvdGU6Cj4+IAo+PiAKPj4gT24gOS8yMi8y
MDI2IDU6MDkgUE0sIFNsYXJrIFhpYW8gd3JvdGU6Cj4+ID4gQXQgMjAyNi0wOS0yMiAxMjoxMjoz
NSwgIktyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUiIDxrcmlzaG5hLmNodW5kcnVAb3NzLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IE9uIDkvMTkvMjAyNiAzOjI1IFBNLCBTbGFyayBY
aWFvIHdyb3RlOgo+PiA+Pj4gRm9yIHNvbWUgV1dBTiBkZXZpY2UsIGl0IG1heSBnZXQgYSBTWVMg
RVJST1IgaXNzdWUgd2hlbiByZXN1bWluZwo+PiA+Pj4gZnJvbSBzdXNwZW5kIHN0YXRlIGZyZXF1
ZW50bHkuIFJlZmVyIHRvIHRoZSBRdWFsY29tbSBXaW5kb3dzCj4+ID4+PiBkcml2ZXIsIHRoZSBk
ZWZhdWx0IHZhbHVlIG9mIGF1dG9zdXNwZW5kX2RlbGF5X21zIGlzIHNldCBhcyA1MDAwCj4+ID4+
PiBtcy4gQnV0IGluIExpbnV4IHNpZGUsIGFsbCBXV0FOIGRldmljZSB3ZXJlIHNldCBhcyAyMDAw
bXMuIFdlCj4+ID4+PiB0cmllZCB0byBzZXQgdGhpcyB2YWx1ZSB0byA1MDAwbXMgYW5kIHdlIGNh
biBnZXQgYSBwb3NpdGl2ZSB0ZXN0Cj4+ID4+PiByZXN1bHQuCj4+ID4+Pgo+PiA+Pj4gU28gd2Ug
YWRkIGEgc3VwcG9ydCB0byBhbGxvdyB2ZW5kb3IgdG8gc2V0IGEgZGlmZmVyZW5jZSB2YWx1ZSBm
b3IKPj4gPj4+IHNwZWNpZmljIFdXQU4gZGV2aWNlLgo+PiA+PiB5b3UgY2FuIGNoYW5nZSBhdXRv
IHN1c3BlbmQgZGVsYXkgZnJvbSBzeXNmcywgcGxlYXNlIHVzZSB0aGF0IHdheSBpbnN0ZWFkIG9m
Cj4+ID4+IGRvaW5nIGluIHRoZSBkcml2ZXIuCj4+ID4+Cj4+ID4+IC0gS3Jpc2huYSBDaGFpdGFu
eWEuCj4+ID4gWWVzLCB3ZSBjYW4gZG8gdGhpcyBieSBzZXR0aW5nIHRoZSBzeXNmcyBBUEkgLiBI
b3dldmVyLCBub3QgYWxsIHVzZXJzIAo+PiA+IGFyZSBhd2FyZSBvZiB0aGlzIG1ldGhvZC4gQWRk
aXRpb25hbGx5LCB0aGlzIGFwcHJvYWNoIGlzIG9ubHkKPj4gPiBlZmZlY3RpdmUgZm9yIGEgc2lu
Z2xlIGluc3RhbmNlOyBpdCByZXF1aXJlcyByZWNvbmZpZ3VyYXRpb24gYWZ0ZXIgZWFjaAo+PiA+
IHJlc3RhcnQsIHdoaWNoIGlzIHF1aXRlIGluY29udmVuaWVudC4KPj4geW91IGNhbiBoYXZlIHVk
ZXYgcnVsZSB0byBzZXQgdGhpcyB3aXRob3V0IGFueSB1c2VyIGludGVydmVudGlvbi4KPgo+V2Ug
c2hvdWxkIG5vdCByZWx5IG9uIHVzZXJzcGFjZSB0byBmaXggdGhlIFNZU19FUlJPUi4gVXNlcnNw
YWNlIGtub2Igc2hvdWxkIG9ubHkKPmJlIGV4ZXJjaXNlZCB0byBjdXN0b21pemUgdGhlIGRlbGF5
IGZvciBwb3dlciBtYW5hZ2VtZW50IHB1cnBvc2VzLCBub3QgdG8gZml4Cj5maXJtd2FyZSBjcmFz
aC4KCj4KQWdyZWUuIFdlIGFyZSBzdGlsbCB3b3JraW5nIG9uIHRoZSBpc3N1ZSBkZWJ1ZyBvbiB0
aGUgbW9kZW0gc2lkZS4gCgo+Rmlyc3Qgd2Ugc2hvdWxkIGtub3cgd2hldGhlciB0aGUgZGVmYXVs
dCBkZWxheSBjYW4gYmUgaW5jcmVhc2VkIHRvIDUwMDBtcyBmb3IKPmFsbCBkZXZpY2VzIG9yIG5v
dC4gSWYgdGhhdCBpcyBub3QgZGVzaXJlZCwgdGhlbiB3ZSBjYW4gZ28gZm9yIEVuZHBvaW50IHNw
ZWNpZmljCj5kZWxheS4KPgo+LSBNYW5pCj4KRm9yIHJlZmVyZW5jZSwgTVRLIDVHIG1vZGVtIFQ3
MDAgaXMgdXNpbmcgNTAwMG1zIGFzIGRlZmF1bHQgdmFsdWUuIEFuZCBRdWFsY29tbQpXaW5kb3dz
IGRyaXZlcnMgc2lkZSwgdGhlIGRlZmF1bHQgdmFsdWUgaXMgNTAwMG1zIGFzIHdlbGwuCkhvd2V2
ZXIsIEkgY2Fubm90IGd1YXJhbnRlZSB0aGF0IGlmIGFsbCBNSEkgZGV2aWNlcyBhcmUgYWRqdXN0
ZWQgdG8gNTAwMG1zLCBzb21lCnBvd2VyLXNlbnNpdGl2ZSBkZXZpY2VzIHdpbGwgbm90IG9wcG9z
ZSB0aGlzIGNoYW5nZS4gQWRkaXRpb25hbCwgREVMTCBob3BlcyB0aGF0CndlIG9ubHkgbW9kaWZ5
IHRoZSBTRFg3MiBkZXZpY2Ugd2hpbGUga2VlcGluZyB0aGUgMjAwMG1zIHNldHRpbmcgZm9yIHRo
ZSBTRFg2MgpkZXZpY2VzLCBhcyB0aGVyZSBhcmUgY3VycmVudGx5IG5vIHNpbWlsYXIgaXNzdWVz
IHdpdGggdGhlIFNEWDYyIHBsYXRmb3JtLgoKSWYgZW5kcG9pbnQgc3BlY2lmaWMgZGVsYXkgc2V0
dGluZyBpcyBhY2NlcHRhYmxlLCBJIHdpbGwgY29tbWl0IGEgVjIgd2hpY2ggaW5jbHVkZXMKc29t
ZSBzcGVjaWZpYyBjaGFuZ2VzIGZvciBEVzU5MzRlIGRldmljZXMgb25seS4KClRoYW5rcwo+LS0g
Cj7grq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCg==

