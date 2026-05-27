Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645233B9933
	for <mhi@lists.linux.dev>; Wed, 27 May 2026 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870557; cv=none; b=PHyEjL2hZmgIPNDclSz3oeED2bkFDk+d4tHZ8jqLpzcJ+flOF1JksUHi4LYS6h1uu9gYPxJ868hQ9Z/GMQYK3801c2xnKF1TD7/L3+lfCxlUM2pBscyU8unFViDiiCgdlK5sWy1+mtkwbnTKW4iwJTwpWdZOmEVvr8cjxJHIVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870557; c=relaxed/simple;
	bh=s2dHnQrX1Qj06Q6FCqMLi7hroiEr7twEhXoF91HPPJ4=;
	h=Date:From:To:Subject:Content-Type:MIME-Version:Message-ID; b=dVkgb/CDk1+SE3orQXrvbakfuL5S3nD2zOBYBhGTvHvfg72XszLHcGQXyMiqbA2l06lKhLI22GMBGgUHsn6L/rseSytNPm8VvozZmSWeYr/Y/2UjW2F1WmMXUV8gDliKc1mKhMGlr5xWRzRTW++e35Xk4QMf1VWwM22/oqpHQiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oxMtWQVx; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oxMtWQVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=s2dHnQrX1Qj06Q6FCqMLi7hroiEr7twEhXoF91HPPJ4=; b=o
	xMtWQVxrv4eWxrFImS7MXgW+k4HpFiOiDtH3/tdF6t/+KYX4oPjmAmElataeZg9S
	6CgIB6L4+EUKc3zVhJyehrjZvN0zXKftabn2PKfgrKMI2kJeW8fKVXvpk6OIeowT
	KGGBFoSQdFjXfPhQRlfaT7aCFSfPBxqLh3q+OlipxY=
Received: from slark_xiao$163.com (
 [2408:8459:3820:54d3:3923:4a69:dfa3:22ab] ) by ajax-webmail-wmsvr-40-108
 (Coremail) ; Wed, 27 May 2026 16:28:57 +0800 (CST)
Date: Wed, 27 May 2026 16:28:57 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Concern about commit bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2cC/Scv00o4SGQYOkcnUsag+42XsC4vPUi1YJec+MEiATVxiEnYGNTJ2b7ztCjMjG0sCWbYh9x89RHfI14pVP3S8toRicgsU1VWn1Mrg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <19ff4298.70b5.19e688d15e8.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bCgvCgD3X4VJqxZq+wisAA--.8003W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCwAkdgWoWq0mGagAA3n
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgTWFuaSwKSSBnb3QgYSBwcm9ibGVtIHJlY2VudGx5IGFib3V0IHRoZSBoZWFsdGhfY2hlY2sg
ZnVuY3Rpb24uIEl0J3MgZGlzYWJsZWQgaW4gbXkgVGhpbmtwYWQgWDEgR2VuMTQuCkFmdGVyIGNo
ZWNraW5nLCB0aGlzIGZlYXR1cmUgd2FzIGRpc2JhbGVkIGJlY2F1c2UgdGhlIGNvbW1pdCBidXM6
IG1oaTogaG9zdDogcGNpX2dlbmVyaWM6IFJlYWQgU1VCU1lTVEVNX1ZFTkRPUl9JRCBmb3IgVkYn
cyB0byBjaGVjayBzdGF0dXMuCgpUaGlzIGNvbW1pdCBvbmx5IGFsbG93cyB0aGUgZGV2aWNlIHRo
YXQgdGhlIHZhbHVlICJwZGV2LT5pc19waHlzZm4iIGlzIHRydWUgdG8gZW5hYmxlIGhlYWx0aCBj
aGVjay4KQnV0IEkgZG9uJ3Qga25vdyB3aHkgbXkgUEMgYW5kIFdXQU4gZGV2aWNlIHdvdWxkIGdl
dCBhIGZhbHNlIHJlc3VsdC4gVGVzdCByZXN1bHQgYXMgYmVsb3c6CgpbwqAgwqAgMy45MjAxMDFd
IG1oaS1wY2ktZ2VuZXJpYyAwMDAwOjA4OjAwLjA6IE1ISSBQQ0kgZGV2aWNlIGZvdW5kOiBmb3hj
b25uLXQ5OXc2OTYKW8KgIMKgIDMuOTIwMTEzXSBtaGktcGNpLWdlbmVyaWMgMDAwMDowODowMC4w
OiAjI2RlYnVnIyMgbWhpX2NudHJsX2NvbmZpZyBpcyBhc3NpZ24KW8KgIMKgIDMuOTIwMTE0XSBt
aGktcGNpLWdlbmVyaWMgMDAwMDowODowMC4wOiAjI2RlYnVnIyMgbWhpX3BjaV9jbGFpbSAuLgpb
wqAgwqAgMy45MjAxMjddIG1oaS1wY2ktZ2VuZXJpYyAwMDAwOjA4OjAwLjA6IGVuYWJsaW5nIGRl
dmljZSAoMDAwMCAtPiAwMDAyKQpbwqAgwqAgMy45MjAxNzldIG1oaS1wY2ktZ2VuZXJpYyAwMDAw
OjA4OjAwLjA6ICMjZGVidWcjIyBtaGlfcGNpX2dldF9pcnFzIC4uClvCoCDCoCAzLjkzMDIyM10g
bWhpLXBjaS1nZW5lcmljIDAwMDA6MDg6MDAuMDogIyNkZWJ1ZyMjIG1oaV9yZWdpc3Rlcl9jb250
cm9sbGVyIC4uClvCoCDCoCAzLjkzNTI2OF0gbWhpLXBjaS1nZW5lcmljIDAwMDA6MDg6MDAuMDog
IyNkZWJ1ZyMjIG1oaV9wcmVwYXJlX2Zvcl9wb3dlcl91cCAuLgpbwqAgwqAgMy45MzUzNzNdIG1o
aS1wY2ktZ2VuZXJpYyAwMDAwOjA4OjAwLjA6ICMjZGVidWcjIyBtaGlfc3luY19wb3dlcl91cCAu
LgpbwqAgwqAgMy45MzUzNzVdIG1oaSBtaGkwOiBSZXF1ZXN0ZWQgdG8gcG93ZXIgT04KW8KgIMKg
IDMuOTM1Mzg4XSBtaGkgbWhpMDogUG93ZXIgb24gc2V0dXAgc3VjY2VzcwpbwqAgwqAgMy45NzEz
NDJdIG1oaS1wY2ktZ2VuZXJpYyAwMDAwOjA4OjAwLjA6IHBkZXYtPmlzX3BoeXNmbiBpcyAwClvC
oCDCoCAzLjk3MTM0Nl0gbWhpLXBjaS1nZW5lcmljIDAwMDA6MDg6MDAuMDogcGRldi0+aXNfdmly
dGZuIGlzIDAKCkZvciBteSBzaXR1YXRpb24sIGJvdGjCoHBkZXYtPmlzX3ZpcnRmbiBhbmTCoHBk
ZXYtPmlzX3BoeXNmbiBhcmUgZmFsc2UuCkFuZCBJIGFsc28gY2hlY2tlZCB0aGUgcmVxdWlyZW1l
bnQgZm9ywqBwZGV2LT5pc19waHlzZiwgc2VlbXMgaXQgd2lsbCBvbmx5IGJlIDEgaWYgdGhlIGRl
dmljZSBoYXMgU1ItSU9WIGNhcGJpbGl0eSBhbmQgdGhlIGZ1bmN0aW9uIGlzIHJlY29nbml6ZWQg
YXMgYSBQRi4gSWYgeW91ciBkZXZpY2UgaXMganVzdAphIHJlZ3VsYXIgUENJZSBmdW5jdGlvbiBv
ciB0aGUga2VybmVsIGRvZXMgbm90IHJlY29nbml6ZSB0aGUgU1ItSU9WIGNhcGFiaWxpdHksIGl0
IHdpbGwgYmUgMC4KClNvIGZvciBtaGlfcGNpX2dlbmVyaWMgc2lkZSwgSSBzdWdnZXN0IHRoYXQg
d2Ugc2hvdWxkIG1vZGlmeSBpdCBieSB1c2luZyAiIXBkZXYtPmlzX3ZpcnRmbiIgaW5zdGVhZCBv
ZiAicGRldi0+aXNfcGh5c2ZuIi4KClRoYW5rcw==
