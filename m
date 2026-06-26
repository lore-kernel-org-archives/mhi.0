Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EB12C11FA
	for <mhi@lists.linux.dev>; Fri, 26 Jun 2026 03:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782445618; cv=none; b=Bn2y+/hWnCUZd65L/HeR7e8C6XAbMmrIW1VlzH6c3HSF/jihqqpF492hicCoid4EVrjXdDK1+fE9A22IoEPlSxuqPBqMtp7efxsOyZttAbr6WUrpYsQIWbjZ3yO7WFWXACFRRyv/WyLI1QyNEx7FTcq+LYGNv0LZXfZ0hg5psB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782445618; c=relaxed/simple;
	bh=lYBkepImZanyDf9QC4Q9+aF667H5NSCMeYDWP3/hjmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UhMpUOoPuMYgk5Ywmb/h5hKeJOqM0yh62gUaeWIOoIG7CGy0QGgH0Qbwv5HjjGO8vJdnLO1BTKT53zTGm6buIGOumju5G9nqjyh4dqNAzYGJnk4mwp1mwZsIHwXxULv9viA/tqPFlOW6wGq3R+HuzTwnWwwGKB0mTB/3ZkOhl4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CFnr5QJo; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CFnr5QJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=NW
	yoXbgygOpcCi/yIHJZ3pHe5OxPIWQu5ala3dipl4U=; b=CFnr5QJoMawYwLeLpf
	xegXtiDdL8a75Njdn4O+PV2WpHetfJyUcwNCLk1cwtN74AAwqsdwLOmAJqGIExL3
	jduBbK8MF7YCgDQ6yUgEtTmVEs+Vymy5263bamjzRZx4Oix5X9wDT3qgau/I9xUO
	3WPA72s9olOXKU4gOC2FIv0E4=
Received: from jbd-ThinkPad-X1-Carbon-Gen-14 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXT0sb9j1qMFkbGA--.63492S2;
	Fri, 26 Jun 2026 11:46:36 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: pci_generic: Add SAHARA channel support for Foxconn products
Date: Fri, 26 Jun 2026 11:46:33 +0800
Message-ID: <20260626034633.23112-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXT0sb9j1qMFkbGA--.63492S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF45Gr4rtw48Ar45Cr1xZrb_yoW8AryUpF
	1xZ3yUtrn2yryrXay0y34DKF98W3Z7Xas7tr1qkw10qasYyws0yrW0934IqFWYv3yvqF4f
	tFn8JrWfZF1UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRahFnUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCvxyuE2o99hxzrAAA38

Since we have such a requirement for capturing ram dump for PCIe
WWAN devices, we shall enable this channel.
Currently this change shall be applied with QC original uci driver
which was not upstreamed. And I also found someone try to upstream
similar SAHRA uci client. Maybe this would be help for us as well.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 750da3dbb4c6..59d4c82bafbb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -491,6 +491,8 @@ static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
@@ -506,6 +508,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 static const struct mhi_channel_config mhi_foxconn_sdx61_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
-- 
2.53.0

