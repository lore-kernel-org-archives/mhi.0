Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7B27A907
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 03:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119811; cv=none; b=SOhcNiM7qCvddt9wi6TZUtu+45xx3R1Wf1ZKCcbEECPTYl/ZOppq8E+Z3pmIaUR6O95C0vm7cZ2hvh9EbRHKVGlM16/gRmHbrxaOJtIbVduSH1ADUQ3J2APok56vceoh6gzPwRCNFYOmj6NOtUFAw41gsgXVgkSiw0gjAR/nGVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119811; c=relaxed/simple;
	bh=zo/8fZ8YUb8HdVmiLECNZ1HxadSLSUU2Sd/FMDYGWZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WncXNnQbNq8iBjkeNKzzwA1AtASlqVJa8ePKyJicwtziHwZUH3ZTZy0b8TeM4hAnymAy2VwRnOf5cl734IYAWk0TgtszHCMknZMe8Dt8masVYd23cv+D7Q8n0WHhCSESS1gnvO7UqCdWaMm9zwdCVBPVcSFKtlRVmYbpkZo6kE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YgQMSyMM; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YgQMSyMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yt
	48yg41mZP+7By2lPNPF2WGa0fxb7xQs+Ysyz2ekig=; b=YgQMSyMMokdlnbH31n
	Ynq8d2rWH9KcUNi2OO8LO+tC3pZIFVYgXVT1qG5jsfHjA5iC9z3bquLTzqE/8omA
	CHz92CfJcx2fyCEuQ4utOkDEp4JhQOo0XcBcBKDkuDn3yMebM1YyfQTeoKV89HLL
	axBlp2+ZDFfqCSbv/ZPUv1XZQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnfybzk9FqNkeeAQ--.46746S2;
	Fri, 16 Oct 2026 11:03:17 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 0/2] bus: mhi: host: pci_generic: Customizing autosuspend_delay_ms for MHI device
Date: Fri, 16 Oct 2026 11:03:02 +0800
Message-Id: <20261016030304.13677-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnfybzk9FqNkeeAQ--.46746S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrCFWUXF4kXF4rXF4ktFyUAwb_yoWxXFb_u3
	sakF93K3yUXFn8tasrtF15Cry5Krs7WrnFvF48tF9rXw1Dtr4DZ3ZavrWDtr93WFZ0yF9r
	Cwn8CryrArnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRE-eO3UUUUU==
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC5xUxlWrRk-WRXgAA3E

For some devices in some specific scenario, it may need more time to
process last wake event to avoid a new suspend event. The default
2000ms may not be enough.

To meet this requirement without affecting the settings of other
products that should remain unchanged, I have added this seriries
to achieve it.

Updates:
  v2: Add update for DW5934e

Slark Xiao (2):
  bus: mhi: host: pci_generic: Add autosuspend_delay customized support
  bus: mhi: host: pci_generic: Update DW5934e autosuspend_delay as
    5000ms

 drivers/bus/mhi/host/pci_generic.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.25.1

