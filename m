Received: from m1323.mail.163.com (m1323.mail.163.com [220.181.13.23])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D08B7F
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=9cght
	XGQQk9Yt267vvrz9hrm+iRwuABo78gGmpmvyeU=; b=UHYAmAYuFxxofx6l6v5Jo
	pnBbdgegLSOlUtL5weLO21IHIt8sJH8VNBQE8hnWPpoHs/zGHtRSpbnVUwbAmb7g
	cwCXUpf8U04f1FqE1g81+Qft9T7jfy4iFEBaH/Z5YFtGnH2x8TgSRLPb98YoCmML
	iCXzp4MJPs/ZOcOo3Znfxs=
Received: from slark_xiao$163.com ( [112.97.52.114] ) by
 ajax-webmail-wmsvr23 (Coremail) ; Mon, 7 Nov 2022 17:30:56 +0800 (CST)
X-Originating-IP: [112.97.52.114]
Date: Mon, 7 Nov 2022 17:30:56 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: mani@kernel.org, loic.poulain@linaro.org, dnlplm@gmail.com, 
	yonglin.tan@outlook.com, fabio.porcedda@gmail.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2] bus: mhi: host: pci_generic: Add macro for some
 VIDs
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <Y2jJpT5//xBUOQMq@kroah.com>
References: <20221107084826.8888-1-slark_xiao@163.com>
 <Y2jJpT5//xBUOQMq@kroah.com>
X-NTES-SC: AL_QuydBfSavEwu4CiaZ+lS8T5326h2JYDkxZVQuvkNWussghrW5goaREZpIkPY/uFibj+4/omKqfsZqcElJYXG
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <28f1e702.28d7.184516dbbbb.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:F8GowACX4GlQ0GhjdHJBAA--.9183W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiGR2yZFyPfQkjmQABsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKCgoKCgoKCgoKCgoKCkF0IDIwMjItMTEtMDcgMTc6MDI6MjksICJHcmVnIEtIIiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+T24gTW9uLCBOb3YgMDcsIDIwMjIgYXQgMDQ6
NDg6MjZQTSArMDgwMCwgU2xhcmsgWGlhbyB3cm90ZToKPj4gVG8gbWFrZSBjb2RlIG5lYXQgYW5k
IGZvciBjb252ZW5pZW5jZSBwdXJwb3NlLCB1c2UgbWFjcm8gZm9yCj4+IHNvbWUgVklEcy4gVGhl
c2UgbWFjcm9zIGFyZSBzdXBwb3NlZCB0byBiZSBhZGRlZCB0byBwY2lfaWRzLmguCj4KPk5vLCB0
aGV5IGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgYWRkZWQgdGhlcmUgYXQgYWxsLgo+Cj5BbmQgdGhl
eSBhcmUgbm90IGEgIm1hY3JvIiwgaXQgaXMgYSAiI2RlZmluZSIuCj4KPj4gQnV0IHVudGlsIHRo
ZSBtYWNyb3MgYXJlIHVzZWQgaW4gbXVsdGlwbGUgcGxhY2VzLCBpdCBpcyBub3QKPj4gcmVjb21t
ZW5kZWQuIFNvIGFkZGluZyBpdCBsb2NhbGx5IGZvciBub3cuCj4KPkFnYWluLCB0aGVzZSBhcmUg
bm90IG1hY3Jvcwo+Cj50aGFua3MsCj4KPmdyZWcgay1oCgpIaSBHcmVnLApUaGFua3MgZm9yIHlv
dXIgY29tbWVudC4KSW4gbXkgb3BpbmlvbiwgTUFDUk8gYWxtb3N0IHNhbWUgYXMgYSAnI2RlZmlu
ZScuICBNYXkgSSBrbm93IGhvdyBkbyAKeW91IGNhbGwgc3VjaCBkZWZpbml0aW9uPwoKQW5kIGNv
dWxkIHlvdSBnaXZlIHlvdXIgY29tbWVudHMgaW4gcHJldmlvdXMgcGF0Y2gsIG5vdCB0aGUgJ2Zp
bmFsJyBvbmU/CkluIGFub3RoZXIgcGNpX2lkcyBwYXRjaCwgeW91IGJyZWFrIGl0IGluIHYzIGFu
ZCBicmVhayBpdCBoZXJlIGFnYWluIGluIHYyLgpIb25lc3RseSwgIGl0J3MgcG9zaXRpdmUgZm9y
IHdob2xlIHByb2plY3QuIEJ1dCBpdCdzIG5lZ2F0aXZlICBmb3IgY29udHJpYnV0b3IgCmFuZCBt
YWludGFpbmVyLiAKCkZpbmFsbHksIGl0J3Mgd2VsY29tZSB0byBwb2ludCBvdXQgdGhlIGVycm9y
LiA=
