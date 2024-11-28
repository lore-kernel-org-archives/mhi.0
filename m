Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7933A2CAB
	for <mhi@lists.linux.dev>; Thu, 28 Nov 2024 03:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732764925; cv=none; b=aSR7GCprAMWq7gEJ8ON/N1c4U03Gn2yMksb1BE+eBr3zSQV2LgJXIxqJ91oM+6yZyT+cb8DcB2RkYyrPlcpgxqL6QNqHoHfFsAtCneS7eMZsbAM/zaw3+IomzUNf/chd3zoejMIIGpFtIgkHST5VnKZ9Xgg1RShy+FkL5FxTLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732764925; c=relaxed/simple;
	bh=w9elRYUtctAdmjPbj09png96Qo5wFN4kbt1k7Sm9Fnw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JijmNtDE6V5pwqMw7MO6SWNW0gn9idXLSvBt04ilYaa5bggEeDtXVp7iyvElcPDJcT3i8W7MIsDXVjFara8ZNYNIm95n4J+vXUAFU4a7bSrkbDBQoLLHZ3dtXY6384lb1BPUKtRiOyc/7l4DtTGihv4xMow96I8demMD9Hq26Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=jk07Waab reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="jk07Waab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=rWyvgW05lNtBCWHP5N2k8Oakz86ti4uueRcaao7uk1s=; b=j
	k07Waab9k/+QP3dCny9QeyXAuA3rJAApWkY2RSeRxc7OZhaSWkJcjJG00+tgdYL6
	U01lj7chFDhuGLTCbC/091KfXiQLfh8VJ/0LdlVjVEqsVNAyUSosqWduuRZSffIT
	5+KE/Xmql1vUPUpWJCOWYgkI6qenM0Hjg4vYEJnCw0=
Received: from slark_xiao$163.com ( [2409:895a:3853:ac0e:c761:ecf:59fb:f52]
 ) by ajax-webmail-wmsvr-40-111 (Coremail) ; Thu, 28 Nov 2024 11:19:59 +0800
 (CST)
Date: Thu, 28 Nov 2024 11:19:59 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Sergey Ryazanov" <ryazanov.s.a@gmail.com>
Cc: "Loic Poulain" <loic.poulain@linaro.org>, 
	"Qiang Yu" <quic_qianyu@quicinc.com>, mhi <mhi@lists.linux.dev>, 
	"Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Subject: Re:Re: How to add RTS support for wwan0at0 port
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <ebd60134-6ba0-453f-bf9a-b215373160c0@gmail.com>
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com>
 <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
 <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com>
 <8d005972-6a56-42f0-ba9a-444a8df5d925@gmail.com>
 <1d37efa8.4475.19347b9b39b.Coremail.slark_xiao@163.com>
 <F987F2EE-E2C2-46D7-BBD5-A7632C4C2CA3@gmail.com>
 <CAMZdPi8oprfHfFuLmNO1NW9ZUNP9nzhoqEaVd-cMGM06jhbxiA@mail.gmail.com>
 <ebd60134-6ba0-453f-bf9a-b215373160c0@gmail.com>
X-NTES-SC: AL_Qu2YAPudvEEi7yafbOkfmk8Sg+84W8K3v/0v1YVQOpF8jDjpxCAvT0Z6AHbz3PqCOgSsuyGuQiVo7MF9RIN+YYssvOFhBfVn5NP5n3UEIw4Igw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <a265655.3b31.19370c85dc3.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bygvCgDnrzFg4Udnsn0xAA--.32881W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRxClZGdH2oCiWwABsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTEtMjIgMDc6MjU6MjUsICJTZXJnZXkgUnlhemFub3YiIDxyeWF6YW5vdi5zLmFA
Z21haWwuY29tPiB3cm90ZToKPk9uIDIxLjExLjIwMjQgMTE6MDEsIExvaWMgUG91bGFpbiB3cm90
ZToKPj4gT24gV2VkLCAyMCBOb3YgMjAyNCBhdCAwODo0OSwgU2VyZ2V5IFJ5YXphbm92IDxyeWF6
YW5vdi5zLmFAZ21haWwuY29tPiB3cm90ZToKPj4gWy4uLl0KPj4gCj4+PiBUaGVyZSB0d28gdHJp
Y2t5IHRvcGljcy4gRmlyc3QsIGEgR1BTIHBvcnQgaXMgbm90IGFuIGFyYml0cmFyeSBzZXJpYWwg
KGNoYXIpIGRldmljZSBmb3IgdGhlIGtlcm5lbC4gSW4gTGludXgsIHRoZXJlIGlzIGEgZGVkaWNh
dGVkIHN1YnN5c3RlbSBmb3IgR1BTL0VNRUEgZGV2aWNlcyBhbmQgdGhlIHBvcnQgc2hvdWxkIGJl
IHJlZ2lzdGVyZWQgd2l0aCBpdC4KPj4+Cj4+PiBTZWNvbmQsIHN0cmljdGx5IHNwZWFraW5nLCBh
IEdQUyBwb3J0IGlzIG5vdCBhIHBhcnQgb2YgV1dBTiBkZXZpY2UuIFllcywgbmF2aWdhdGlvbiBy
ZWNlaXZlciBjYW4gYmUgaW1wbGVtZW50ZWQgYXMgYSBibG9jayBvZiBhIG1vZGVtIGNoaXAuIE9u
IGFub3RoZXIgaGFuZCwgR1BTIHBvcnQgaGF2ZSBub3RoaW5nIGNvbW1vbiB3aXRoIGNlbGx1bGFy
IG5ldHdvcmsuIEl0IGRvZXNuJ3QgcmV2ZWFsIGNvbm5lY3Rpb24gc3RhdHVzLCBhbmQgY2Fubm90
IGJlIHVzZXIgdG8gY29uZmlndXJlIHRoZSBtb2RlbS4KPj4+Cj4+PiBTbywgdGhlIGZpcnN0IGJp
ZyBxdWVzdGlvbiBpczogc2hvdWxkIHdlIGV4cG9ydCBHUFMgcG9ydCB2aWEgdGhlIFdXQU4gc3Vi
c3lzdGVtIG9yIGEgbW9kZW0gZHJpdmVyIHNob3VsZCBkbyBpdCBieSBpdHMgb3duPwo+Pj4KPj4+
IExvaWMsIGRvIHlvdSBoYXZlIGFueSB0aG91Z2h0cz8KPj4gCj4+IE1hbnkgbW9kZW1zIGhhdmUg
KEFzc2lzdGVkKSBHUFMgY2FwYWJpbGl0aWVzLCBhbmQgdGhlIEdQUyBlbmdpbmUgaXMKPj4gdXN1
YWxseSBjb250cm9sbGVkIHZpYSB0aGUgTW9kZW0gY29udHJvbCBpbnRlcmZhY2UgKEFULCBtYmlt
Li4uKS4KPj4gU28gaXQgd291bGQgbWFrZSBzZW5zZSBmb3IgdGhlIEdQUyBpbnRlcmZhY2UgdG8g
c3RheSB1bmRlciBpdHMgV1dBTgo+PiBwYXJlbnQsIGFuZCB0aGUgaW50ZXJmYWNlIHRvIGJlIGEg
V1dBTiBpbnRlcm5hbCBwb3J0ICB0eXBlIChOTUVBICkuCj4KPk91Y2guIE1ha2Ugc2Vuc2UuIEkn
dmUgZm9yZ290IHRoYXQgc29tZSAobW9zdD8pIG1vZGVtcyB1dGlsaXplIGNvbnRyb2wgCj5wb3J0
IHRvIGFjdGl2YXRlIHRoZSBuYXZpZ2F0aW9uIHJlY2VpdmVyLiBUaGFuayB5b3UgZm9yIHJlbWlu
ZGluZy4KPgo+VGhlbiwgdGhlIE5NRUEgcG9ydCBzaG91bGQgYmUgZXhwb3J0ZWQgYXMgYSBjaGls
ZCBvZiBXV0FOIGRldmljZSBmb3Igc3VyZS4KPgo+PiBOb3cuLi4gd2UgY291bGQgZWl0aGVyIGV4
cG9zZSB0aGUgTk1FQSBwb3J0IHRvIHVzZXIgbGlrZSBvdGhlciBjb250cm9sCj4+IHBvcnRzICh3
d2FuIGNkZXYgc29sdXRpb24pLCBvciBoYXZlIGEgc2hpbSBsYXllciB0byB0aGUgR05TUwo+PiBz
dWJzeXN0ZW0uVGhlIGZvcm1lciBzb2x1dGlvbiBpcyBwcm9iYWJseSB0aGUgZWFzaWVzdCwgdGhl
IGxhdHRlcgo+PiBzb2x1dGlvbiB0aGUgbW9zdCBhcHByb3ByaWF0ZS4KPgo+QWxzbyBtYWtlIHNl
bnNlLiBQZXJzb25hbGx5LCBJJ20gdm90aW5nIGZvciBleHBvcnRpbmcgdGhyb3VnaCB0aGUgR05T
UyAKPnN1YnN5c3RlbS4gVGhpcyB3YXkgYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gd2lsbCBiZSBl
YXN5IHRvIGZpbmQgdGhlIAo+cmVjZWl2ZXIuCj4KRG8geW91IG1lYW4gdGhlIEdOU1MgZHJpdmVy
IGluIGRyaXZlci9nbnNzID8KQW5kIHdoYXQncyB0aGUgbmV4dCBwbGFuPyBBbnlib2R5IHdpbGwg
cmVzcG9uc2libGUgZm9yIHRoaXMgcmVxdWlyZW1lbnQ/CgoK
