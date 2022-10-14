Received: from m13101.mail.163.com (m13101.mail.163.com [220.181.13.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30643137D
	for <mhi@lists.linux.dev>; Fri, 14 Oct 2022 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=GHNB8
	fhoywVrYStAj6hlXCqO1yyEPKylMU+xzL2A96M=; b=B1yitjRxIt8MVVYp47cmc
	3+X8vJduvZAL9I7NRbgOEIk6d7ih/qrdXdJI8wdVxy+PSu9EvNxZQ+AwEAtqRuR7
	4L19/bgq9wpF4zDud/Oa/+lZ1G1RZPCwgMHLgLHUssh+/AMhIg1Ry0IiRCTMQ8bS
	K5WSQ5dCqWUBS9FBo24lk0=
Received: from slark_xiao$163.com ( [112.97.57.71] ) by
 ajax-webmail-wmsvr101 (Coremail) ; Fri, 14 Oct 2022 19:17:42 +0800 (CST)
X-Originating-IP: [112.97.57.71]
Date: Fri, 14 Oct 2022 19:17:42 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Loic Poulain" <loic.poulain@linaro.org>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>, 
	"quic_hemantk@quicinc.com" <quic_hemantk@quicinc.com>, 
	mhi@lists.linux.dev
Subject: Re:Re: Does MHI driver support DMA remapping?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <CAMZdPi_9t-8qHQep87+sfVrWVUJ3-xo0TFY+q4gxFRr18fmMNA@mail.gmail.com>
References: <7ac21c73.2acb.183cf5fff45.Coremail.slark_xiao@163.com>
 <CAMZdPi_9t-8qHQep87+sfVrWVUJ3-xo0TFY+q4gxFRr18fmMNA@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <4595249f.7c2e.183d636dafc.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZcGowABHGwRWRUljjDKCAA--.23541W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiJR+aZGAJqfGbhwABso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKCgoKCgoKCgoKCgoKCkF0IDIwMjItMTAtMTMgMTU6MDc6MjEsICJMb2ljIFBvdWxhaW4iIDxs
b2ljLnBvdWxhaW5AbGluYXJvLm9yZz4gd3JvdGU6Cj5IaSBTbGFyaywKPgo+T24gVGh1LCAxMyBP
Y3QgMjAyMiBhdCAwNToyNSwgU2xhcmsgWGlhbyA8c2xhcmtfeGlhb0AxNjMuY29tPiB3cm90ZToK
Pj4KPj4gSGksCj4+ICAgSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhlIERNQSBmZWF0dXJlIG9u
IG91ciBNSEkgZHJpdmVyLiBEb2VzIE1ISSBzdXBwb3J0IERNQSByZW1hcHBpbmcgZmVhdHVyZT8K
Pj4gICBUaGlzIGlzIHRoZSByZWZlcmVuY2UgZGVzY3JpcHRpb24gZnJvbSBXaW5kb3dzIE9TOgo+
Pgo+PiBUbyBlbnN1cmUgY29tcGF0aWJpbGl0eSB3aXRoIEtlcm5lbCBETUEgUHJvdGVjdGlvbiBh
bmQgRE1BR3VhcmQgUG9saWN5LCBQQ0llIGRldmljZSBkcml2ZXJzIGNhbiBvcHQgaW50byBEaXJl
Y3QgTWVtb3J5IEFjY2VzcyAoRE1BKSByZW1hcHBpbmcuCj4+Cj4+IERNQSByZW1hcHBpbmcgZm9y
IGRldmljZSBkcml2ZXJzIHByb3RlY3RzIGFnYWluc3QgbWVtb3J5IGNvcnJ1cHRpb24gYW5kIG1h
bGljaW91cyBETUEgYXR0YWNrcywgYW5kIHByb3ZpZGVzIGEgaGlnaGVyIGxldmVsIG9mIGNvbXBh
dGliaWxpdHkgZm9yIGRldmljZXMuIEFsc28sIGRldmljZXMgd2l0aCBETUEgcmVtYXBwaW5nLWNv
bXBhdGlibGUgZHJpdmVycyBjYW4gc3RhcnQgYW5kIHBlcmZvcm0gRE1BIHJlZ2FyZGxlc3Mgb2Yg
bG9jayBzY3JlZW4gc3RhdHVzLgo+Cj5JIGFzc3VtZSB0aGlzIGlzIGFsbCBhYm91dCBJT01NVT8g
dGhlbiBBRkFJSyBpdCBzaG91bGQgYmUgc3VwcG9ydGVkIGJ5Cj50aGUgZHJpdmVyLCBub3QgYmVj
YXVzZSB0aGUgZHJpdmVyIGRvZXMgYW55dGhpbmcgc3BlY2lhbCB0byBoYW5kbGUgaXQsCj5idXQg
YmVjYXVzZSBpdCB1c2VzIHRoZSBzdGFuZGFyZCBkbWEgaGVscGVycy4gU28gaWYgdGhlcmUgaXMg
YW4gSU9NTVUKPmluIGJldHdlZW4sIGluZGljYXRlZCBpbiBlLmcuIGRldmljZXRyZWUgb3IgQUNQ
SSwgdGhlIGRpZmZlcmVudCBkZXZpY2UKPklPVkEgc3BhY2VzIHdpbGwgYmUgbWFuYWdlZC9pc29s
YXRlZCBhdXRvbWF0aWNhbGx5IHZpYSB0aGUgSU9NTVUKPmxheWVyL2RyaXZlci4KPgo+UmVnYXJk
cywKPkxvaWMKCkhpIExvaWMsCiAgVGhhbmtzIGZvciB5b3VyIGdyZWF0IGV4cGxhbmF0aW9uLgog
ICBBbmQgSSBoYXZlIG9uZSBtb3JlIGNvbmNlcm4sIHVudGlsIG5vdywgd2Ugc3RpbGwgZG9uJ3Qg
a25vdyBob3cgdG8gdXNlIHRoZSBkaWFnIHBvcnQgInd3YW4wcWNkbTAiLgogICBJdCBkb2Vzbid0
IGxpa2UgUXVhbGNvbW0gdHJhZGl0aW9uYWwgVVNCIGRpYWcgcG9ydCB0aGF0IHdlIGNhbiB1c2Ug
UVhETSAodGhvdWdoIHRoaXMgaXMgYSBub24tb3BlbiB0b29sIGFuZCBzZWVtcyBvbmx5IGFjY2Vw
dCBVU0IgZGlhZyBwb3J0KSBvciBzb21lIG90aGVyIHNlcmlhbCB0b29sIHRvIGNvbGxlY3QgZGVi
dWcgbG9nLgogICBJcyB0aGVyZSBhbnkgbWV0aG9kIHRvIGNvbGxlY3QgZGVidWcgbG9nIGJhc2Vk
IG9uIHRoaXMgcG9ydD8KClRoYW5rcyE=
