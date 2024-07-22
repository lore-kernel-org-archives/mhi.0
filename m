Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3071396
	for <mhi@lists.linux.dev>; Mon, 22 Jul 2024 03:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721617331; cv=none; b=r5CVoU37uKQY1bYGKGDBMrlqSLYt8LsSCKExxWZqsECiGsucAYuCJXdZudO007TlPX2YNQxgOxFhOMFfPBWrMSaNwuAXbfA2ySPWNLrjv57SKXumsIl1eOY1XtEZiX2fDNpENMtnmNJFWuK5PSNGlF9ue8N83PjM5mU32TmNx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721617331; c=relaxed/simple;
	bh=l7F+dpSD4dbZtLYmb27wWbA5qebFU29F4mGUIe/IExg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=vAAqkUiXe6VfQyaKXlqpzO8zqIUnMZCr+5WdxflZV/zVi4lSpz6wHMq1ty8R3S74lnTz5/A9d0F7G2txpABPj8HrPVUT7T6WrGimFgf6/8Yk56Iqv40cy4ri/b///MKg6prfVJhEW+0YklQC3phbVf7fTHdF8KyZ/Kq9qna3z7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=K1HTBFiL reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="K1HTBFiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=GP2OEqZm4Ci6i8zcmMBnOJl9qPgANUg50yvdcw4qpW0=; b=K
	1HTBFiLgAmjYi9bFMArLE2YDHmA4o/RIQtUWNzUfo5gtVt3ctDMC8A36DAGHr2lk
	4wQZZma0NuVcThk6sDnwqOEFNpq+GGK2BMlwhMBGHwYpHqZfGXSVNE0PS/BWFq12
	UJ0e9RTsOr00pelasORdl0JQ0faWwzApPVjvBiUbiI=
Received: from slark_xiao$163.com ( [223.104.68.157] ) by
 ajax-webmail-wmsvr-40-149 (Coremail) ; Mon, 22 Jul 2024 11:01:21 +0800
 (CST)
Date: Mon, 22 Jul 2024 11:01:21 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "manivannan.sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: "Johannes Fischer" <johannes.fischer@verificationpartners.com>, 
	"Steven Edwards" <steven.edwards@verificationpartners.com>, 
	mhi <mhi@lists.linux.dev>
Subject: Re:Re: Re: Linux Kernel 6.6.36 and upstream mhi repo latest:
 Interface definition of sierra_em919x
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240721083522.GK1908@thinkpad>
References: <AS2PR03MB90043BBFBCA2E14D2EB62E84E5A62@AS2PR03MB9004.eurprd03.prod.outlook.com>
 <20240712161303.GC3571@thinkpad>
 <716a2414.bcfae.190a7cf2247.Coremail.slark_xiao@163.com>
 <AS2PR03MB90046596AFF0AF0F78D4C125E5A72@AS2PR03MB9004.eurprd03.prod.outlook.com>
 <1ba76a65.4185.190b47cf475.Coremail.slark_xiao@163.com>
 <20240721083522.GK1908@thinkpad>
X-NTES-SC: AL_Qu2ZA/qauEoj5yiYY+kfmk8Sg+84W8K3v/0v1YVQOpF8jCLrxxAEb2JeEVz5ws6gExyVgAWKVxJi8c50cLtEQ4gEH7U0wfU/dMHoFksTrvYvOA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <2b293510.32ca.190d862f313.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3HyqBy51mz2MvAA--.51664W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQUkZGV4IvEbKQABsN
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNC0wNy0yMSAxNjozNToyMiwgIm1hbml2YW5uYW4uc2FkaGFzaXZhbSIgPG1hbml2YW5u
YW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPiB3cm90ZToKPk9uIE1vbiwgSnVsIDE1LCAyMDI0IGF0
IDExOjQzOjI2QU0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IAo+PiBBdCAyMDI0LTA3LTEz
IDE3OjQxOjI3LCAiSm9oYW5uZXMgRmlzY2hlciIgPGpvaGFubmVzLmZpc2NoZXJAdmVyaWZpY2F0
aW9ucGFydG5lcnMuY29tPiB3cm90ZToKPj4gPkhpIGFsbCwKPj4gPkBTdGFyaywKPj4gPmZpcnN0
LCBJIGFjY2VwdCB0aGF0IGNoYW5nZXMgbWF5IGhhdmUgc2lkZSBpbXBhY3Qgb24gb3RoZXIgbW9k
ZW1zLgo+PiA+UGxlYXNlIGhhdmUgaW4gbWluZCB0aGF0IEkgZmxhc2hlZCBTV0lYNTVDXzAzLjE0
LjEwLjA0IGFuZCB0aGUgcmVzcGVjdGl2ZSBnZW5lcmljIG52dSBhIGZldyBkYXlzIGFnbywgc28g
SSBhc3N1bWUgdG8gYmUgcXVpdGUgY2xvc2UgdG8gZGVmYXVsdCBjb25maWcuCj4+ID4KPj4gPlVz
aW5nICB0aGUgc2llcnJhX2VtOTE5eCBjb25maWcgd2l0aCBJUCBsaW5rcyBjaGFuZ2VkIHRvIE1C
SU0gaW4ga2VybmVsIEkgY2FuIGVzdGFibGlzaCBkYXRhIHRyYWZmaWM7IEkgZG8gbm90IHNlZSBh
IGNvbXBvbmVudCBjb252ZXJ0aW5nIHRoZSBNQklNIHN0cmVhbSB0byBSTW5ldCBpbiBMaW51eCBr
ZXJuZWwgKD8pLiBJIHdvbmRlciB3aGV0aGVyIHRoZXJlIGlzIHBvc2l0aXZlICBjb25maXJtYXRp
b24gYWJvdXQgYSBFTTkxOXggd29ya2luZyBpbiBQQ0llIG1vZGUgd2l0aCB0aGUgY3VycmVudCBr
ZXJuZWwgY29uZmlnLCBpbiB3aGljaCBtb2RlPyAoV2UgZGlkIG5vdCBoYXZlIHRyb3VibGUgdXNp
bmcgdGhlIEVNOTE5eCBpbiBVU0IgbW9kZS4pCj4+ID4KPj4gPkFib3V0IEdQSU8gaGFuZGxpbmcs
IGFzIHNhaWQgdGhlcmUgaXMgbm9uZSBmb3IgZm9yIEZ1bGxfQ2FyZF9Qb3dlcl9vZmYjICg2LCAx
MGsgcHVsbC11cCB0byAzVjMpIGFuZCBSRVNFVCMgKDY3LCBqdXN0IGEgQz0xMDBuRiB0byBHTkQp
IG9uIHRoZSBCUEktUjQuIAo+PiA+V2UgIGhhdmUgbm90IHZhbGlkYXRlZCB0aGUgdGltaW5nIGlu
IEJQSS1SNCB3aXRoIDYuNi4zNiBvciBjdXJyZW50IGtlcm5lbCB2ZXJzdXMgdGhlIHRpbWluZyBk
aWFncmFtIGF0ICJBaXJQcmltZSBFTTkxOVgvRU03NjkwIFByb2R1Y3QgVGVjaG5pY2FsIFNwZWNp
ZmljYXRpb24iLiBBcyB5b3Ugc2FpZCB0aGVyZSBtYXkgYmUgYSBjb3JuZXIgY2FzZSB0aGF0IHdl
IGVuZCB1cCAKPj4gPndpdGggdGhlIEZveGNvbm4gY29uZmlnIGR1ZSB0byB0aW1pbmcgYXQgQlBJ
LVI0IHBvd2VyIHVwIHRpbWVzLgo+PiA+Cj4+ID5JIGdldCBmcm9tIHlvdXIgc3RhdGVtZW50LCB0
aGF0IHRoZSB2YWxpZCBjb25maWcgc2hvdWxkIGJlIHNpZXJyYV9lbTkxOXgsIHRoYW5rcyBmb3Ig
dGhpcyBjbGFyaWZpY2F0aW9uLgo+PiA+Cj4+IAo+PiBZZWFoLCBJIGp1c3QgY2hlY2tlZCB0aGlz
IGlzc3VlIGFnYWluLiBXZSBtZXQgdGhpcyBpc3N1ZSBpbiBvdXIgQVJNICBwbGF0Zm9ybS4KPj4g
RGV2aWNlIGJvb3QgdXAgc2hhbGwgdGhyb3VnaCBQQkwtPlNCTC0+S2VybmVsIGJvb3QgdXAuIEFu
ZCB0aGVyZSBhcmUgMiBkaWZmZXJlbnQgUENJZSBzZXR0aW5ncyBiZXR3ZWVuIFBCTCBhbmQga2Vy
bmVsIHNpZGUuCj4+IFdoZW4gaG9zdCBtaGkgZHJpdmVyIHByb2JlZCwgeW91ciBkZXZpY2UgbWF5
IHN0aWxsIGluIFBCTCAgc3RhZ2Ugb3IgU0JMIHN0YWdlKHRoZSBQQ0llIEVQIGluIGRldmljZSBz
aWRlIGlzIG5vdCByZWFkeSksIHRoZW4geW91IHdpbGwgZ2V0IGEgImZveGNvbm4tY29uZmlnIiBz
aW5jZSB5b3VyIFBCTCBJRCBtYXRjaCB3aXRoIHRoYXQgb25lLgo+PiBTb2x1dGlvbiBzaGFsbCBo
YXZlIHRoZXNlOgo+PiAxLiBVcGRhdGUgZmlybXdhcmUgc2lkZSB0byBrZWVwIElEIHNhbWUgYmV0
d2VlbiBQQkwgYW5kIGtlcm5lbCBjb25maWcuCj4KPkhhdmluZyAyIFBDSWUgSURzIGZvciBhIHNp
bmdsZSBkZXZpY2UgZG9lc24ndCBzb3VuZCByaWdodC4gSWYgaXQgaXMgZml4ZWQgaW4KPnN1Y2Nl
c3NpdmUgZmlybXdhcmUgcmVsZWFzZXMgdGhlbiBmaW5lLCBvdGhlcndpc2UgcGxlYXNlIGZpeCBp
dCBmb3IgYWxsLgo+Cj4tIE1hbmkKPgo+LS0gCj7grq7grqPgrr/grrXgrqPgr43grqPgrqngr40g
4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCkZvciBmb3JtYWwgcmVsZWFzZSwgd2Ugd2lsbCB3cml0
ZSBQQ0lFIElEIGludG8gZnVzZSB0byBrZWVwIFBCTCBQQ0llIElEIHNhbWUgYXMgS2VybmVsIHNp
ZGUuClRoaXMgaXNzdWUgbm9ybWFsbHkgY291bGQgYmUgZm91bmQgaW4gdGVzdCBtb2R1bGUgb25s
eS4KTWF5YmUgU2llcnJhIFdpcmVsZXNzIGRpZG4ndCBub3RpY2UgdGhpcyBpc3N1ZSggb3Igbm8g
ZnVzZSBtZWNoYW5pc20gYXBwbGllZCkuCgpUaGFua3Mh
