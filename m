Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2933CE88
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549865; cv=none; b=ka4jp/qd1HpW+mturuH/9UcV28UQqj2zHKnDtQsUgSvou1OOmSimdj1VHuGMvjHti6bCZIxN6TkE3VmXuCFuUk46j0EdldFPsdbVSrwbNktZIyWyv2RWhI/dJ8lbZPqW0WF+5s7KqCIVNqMnGFolfx5tUi5idMB5t88ZVf8foOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549865; c=relaxed/simple;
	bh=aLW1fNaqRIGekF37yZApHqwtjyCn3DxX8pd2hsHpK5s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FBtZ/LFntkJxMF0KvekRVGifjiPP7Bq6x+yQqdRuCIKCJhI071aMPJ6Y9Nf5ExLQ1snjZDJ+1/0729dMR8TTbgytSiOvTPaVx1+ZcZ5ItPtPnGTCiPHRN4DvEyKntVlL0O2GcqqVJKnX/03Snh4Gr8VXVYFncO7eTowhxgSLqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=n2I92/gK; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="n2I92/gK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Mr
	wR+Ad5Fj26DL5Ubo709J1vkzhUIdBWLGe+WfKWy30=; b=n2I92/gKjmCYY7CQTr
	B1+rE5za7uGo7XjQhw/DXJ+itH8+cJ2MjHc66hXtjK3oFJr2fES0DHIj8nIZm4cw
	y4V+A4TmisLWKSElPA5CUIphdDjyk+P6SKM1b+t/PF4ys75sD3HohJHowWEkmEnm
	rD9ptJSQLEXnV6yAxt80qdfvY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHOlVooh1pwNIrEg--.51100S2;
	Wed, 19 Nov 2025 18:56:42 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v3 0/2] *** Add support for Foxconn T99W760 ***
Date: Wed, 19 Nov 2025 18:56:13 +0800
Message-Id: <20251119105615.48295-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCHOlVooh1pwNIrEg--.51100S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRQdbUUUUUU
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibhELZGkdoY8SBgAAse

*** This series add support for Foxconn 5G modem T99W760 ***

Updates:
  v3: Fix the 2 patches not in one thread issue
  v2: Add net and MHI mantainer together

Slark Xiao (2):
  bus: mhi: host: pci_generic: Add Foxconn T99W760 modem
  net: wwan: mhi: Add network support for Foxconn T99W760

 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 drivers/net/wwan/mhi_wwan_mbim.c   |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.25.1

