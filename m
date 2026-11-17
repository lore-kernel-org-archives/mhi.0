Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906832;
	b=mMeEiXcd1K2gk2QkuIT+G91BozrsXl2/kS+LYBLjqSn70sC23E7l4lX4IwwedLNsXsVI
	 OOuawDqT+NPPmwUuLq+lU4GSHaZJDKD5jqHGnkdYuYhnMHqQc1TVFeRX3XLSNCkwaH5lv
	 NGfoHDSZMPUFGwJrpxeAsHj5E/vIhH+c12978GyjUjNs/I84iDgZQLqEuHEezreY6uRoX
	 GeWThgKSPJHHHQ7g9/U6kkJnPpdb3FGkeOtYFao9tHvoXDvDu2a2ZQucGDOmucBYU0VTS
	 z6koqoS27QaSiQeAvjdCc8KzkgF/G0gCQ26CRECaMva6Hn+/ZoIu455o8IxYx3eobmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906832;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=pZ5s6RoGkC1ZyNr/O6eROnVnYOQpUVLD9YWFjmstH7U=;
	b=3c2D5ItaC2fdnzlhhboVw3eztPfodCkjtm9v4nun5N+wddQy41SJoW+IyDZ5xnXWmYRa
	 oprmJO+H8vPE72R0RLryQCAHJhfhGi16ODzVYgSQ4zXRyBUeZgedDWC0kPXJP/e6FKrFD
	 iCHp0u3IuPgD4pyX0enaM66PkPP/F4cqJmIgfnYidjSvE4I8vLFxE5tZBfqNSjDXC6GRd
	 wTC/TmQvTnjA1JfeciTrFRF18bz9FBQzbE2meHbSLcpud4O1tbiXlYUQUnjtgI7Y2klU/
	 V6V7Wv6vbNkouAF600jU7J5MOD5RBX4xUTVEHLHNxHS99eGjjS/atRZNHYxJNI6+09w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Vr4AegD5;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CD606A31C
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 09:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Vr4AegD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pZ
	5s6RoGkC1ZyNr/O6eROnVnYOQpUVLD9YWFjmstH7U=; b=Vr4AegD52umo1lC73M
	8VzOnaRO5aWJ03q1y0BpxZGGgTo7QaJpntmmAoFrnr74KR7DfMPkuI/RV6u6ZEDo
	SgD0VIZf2nQkaofydyXrlyJe6HsYvyQLRlrmf77ivl9V+M+jeL5YHzkvsASHuzz8
	qDjqMY00rjB/JTbjGWpLTbuII=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAX9iK1GvxqVX_fIA--.31468S2;
	Tue, 17 Nov 2026 17:13:26 +0800 (CST)
From: Wanquan Zhong <zwq2226404116@163.com>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Wanquan Zhong <zwq2226404116@163.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v7 0/2] add Rolling Wireless RW135R-GL and RW151 MHI support
Date: Tue, 17 Nov 2026 17:13:22 +0800
Message-ID: <cover.1794905977.git.zwq2226404116@163.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX9iK1GvxqVX_fIA--.31468S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryrJF4kXr1fCrW3Ar4fXwb_yoWkArg_uF
	Z7GFyfWrsrZFn7CFWxGF47XrZ5Ka18Xrn0qFyktF9F93sFkr1DWwn5Jr1DJrn5WF4rGF18
	KFyUuw48Ar1YvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRApnDUUUUU==
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0heN5Gr8GrcI4wAA38

v6 was not merged on mhi-next. This v7 series is standalone again on
current mhi-next and includes the full v6 Rolling config plus the RW151
SKU update below.

Patch 1/2: device config and PCI IDs. Patch 2/2: ADB wwan_ctrl (split as
before).

Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>

---
Changes in v7:
- Resubmit standalone series (v6 had no maintainer reply / not merged)
- Add RW151 SP config for 2099:1502: QMI 14/15 instead of MBIM 12/13
- Use 163.com for From and Signed-off-by (same as send-email identity)

Changes in v6:
- Resend as standalone 2-patch series against mhi-next
- Include full RW135R-GL/RW151 config; split ADB to patch 2/2
- Drop no_m3; RW151 MBIM ring 32; SAHARA SBL; NMEA on 60/61; all PCI IDs

v6: https://lore.kernel.org/mhi/cover.1792573876.git.zwq2226404116@163.com/

Wanquan Zhong (2):
  bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151
    support
  net: wwan: mhi_wwan_ctrl: add ADB channel support

 drivers/bus/mhi/host/pci_generic.c | 152 +++++++++++++++++++++++++++++
 drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
 2 files changed, 153 insertions(+)

-- 
2.53.0

