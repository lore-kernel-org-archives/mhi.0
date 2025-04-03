Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A4019F130
	for <mhi@lists.linux.dev>; Thu,  3 Apr 2025 06:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660467; cv=none; b=jPdSGN/LwGu9qrD0VEq0fMzyRZuXt5meY8u50zW12b7H8xilkayrtuUBzET6Qrhxtc1NvJWMw6yu5953qwGgrvjVVtj1sPMHhQZRP2ftbhsgMn+yI0c5s+C96vqpD1KYISKETkWGZ8uw+wMqMuVRjtRvN/yBNCSav0nfS/ah01E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660467; c=relaxed/simple;
	bh=UaqEPq4Aw3Lr8n55jWdD3t2K1Z0dsA4uvBw6+UzEU9g=;
	h=Date:From:To:Subject:Content-Type:MIME-Version:Message-ID; b=Yvyz1w9CdKBWwcQe4iWedvHU4kxM73U7CgWbScVWwM+W+h7a8xY5WUOAkQYGcze6WsQkCVuvAoyJMFbC0YQsyZIWdzscBIv3UJxZROXqCyJub2y5PZC+7W0xFBJCsoq9tT/4h7Mxv24iA8KvityCmmIJhpD2OBQdT2et5/jqwWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=M0r3FzWF reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="M0r3FzWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=gbdsYUJbiI9vEsybs1dgYv3forlB8g3++Js4ds4lRk4=; b=M
	0r3FzWFUQo4rgrymweg1UecwAmExT6AWt6zzTZQetxRdWjh5+MhAYFVpliN/GDFE
	sXVe+L8kkD/Ny8MAPt1fRhh1npCZnd9xMZN4p5vvuceq78z1eL1aPBv2v9Wd7t38
	RryNhDMxYvRoDOWTle3d/I70tRnY4sgRB8Z1AtvHk4=
Received: from slark_xiao$163.com (
 [2409:895b:3801:134c:d2c5:2a5d:def4:f1d1] ) by ajax-webmail-wmsvr-40-105
 (Coremail) ; Thu, 3 Apr 2025 14:06:52 +0800 (CST)
Date: Thu, 3 Apr 2025 14:06:52 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Sergey Ryazanov" <ryazanov.s.a@gmail.com>,
	"Muhammad Nuzaihan" <zaihan@unrealasia.net>,
	"Loic Poulain" <loic.poulain@linaro.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"Qiang Yu" <quic_qianyu@quicinc.com>,
	"johan@kernel.org" <johan@kernel.org>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: GNSS support for Qualcomm PCIe modem device
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2fAfqdv0wq5CWYYOkfmkkXg+c4XsW5vfwu1IVRPJp+jC/p9BgjT1lTPlXpzfCDIjyinQiHawJ14OtEf7tpfrg7zP6z4J9E+S77c4+YI9ZByA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aSgvCgD3uZB9Je5nBZiNAA--.11464W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibhAkZGfuIWgcRgANsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpIFNlcmdleSwgTXVoYW1tYWQsClRoaXMgaXMgU2xhcmsuIFdlIGhhdmUgYSBkaXNjdXNzaW9u
IGFib3V0IHRoZSBmZWF0dXJlIG9mIEdOU1MvTk1FQSBvdmVyIFFDIFBDSWUgbW9kZW3CoApkZXZp
Y2Ugc2luY2UgMjAyNC8xMi5NYXkgSSBrbm93IGlmIHdlIGhhdmUgYW55IHByb2dyZXNzIG9uIHRo
aXMgZmVhdHVyZT8gCgpJdCdzIHJlYWxseSBhIGNvbW1vbiByZXF1aXJlbWVudCBmb3IgbW9kZW0g
ZGV2aWNlIHNpbmNlIHdlIGhhdmUgcmVjZWl2ZWQgc29tZSBjb21wbGFpbnQKZnJvbSBvdXIgY3Vz
dG9tZXIuIFBsZWFzZSBoZWxwIHByb3ZpZGUgeW91ciBhZHZpY2UuCgoKVGhhbmsgeW91IGluIGFk
dmFuY2UhCgo=
