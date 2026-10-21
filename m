Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550467;
	b=iVNgejAEGP4gNF8N2OGyCyU/7vB9ts0l8dRML6/xcjUJmS7VMR9BuY1thJrQyW/kq56V
	 4BoWFnqkFClVrQbJnsL0eGd2MSr/46Bg1o5/RcMUdN4hpHZy/aPlU4wawDxIChKr/iTpn
	 mlAcj8H28qygVLb2fCcvoStcl/Kqx1SCSymBhBcN9pZghclzFEq7nlx0eAwWoToE9dQua
	 B+5AboluilTjN8Z437/iu+4vgsh30MvUgVe8YAFJj2Gdz9Cp86266wxqQVL8ppMR2uCqT
	 cn5QB9QTubCyNOb9yQ3HdzyW2qtcS2RwX/xFLHSVnPExLlnG70cd30sVxpC6DnGjRXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550467;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=3FWIccO4+PqefYbmq8748pKuyoRonWMFOwYeYh13ZZs=;
	b=WgLhqz9UN6bcw3BxNaXRKj7l5/wznLBGSl6VXiRlnwOSHMlLHjZVL2HmHJf2Fv0UE+NI
	 vUGRRvOOEKNCMsX7YmhpBJN/1QMeEur9HNdyst6WHs83KUkPM8g2fRZGGXi+5CtcheOQ5
	 MY+USLfCaFznC43KTA0OLzvAMEshbe01NBL3668C+qby0BmOCv55Zqhnm37jJrQ8b4fYj
	 R+9lkxeC11xDdYhiArkQj7m6I+f55akLa3FjPt5PARLzRjVxWg+SAJrF7dgAyc8WGt3+P
	 OX94b0Mxzknr/1THxg6S1VFytvJT1ZXlj2UQXb3qo8swZUQQyYbb0pzOScFUndecMJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EjZXGZtM;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E6606A31B
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 02:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EjZXGZtM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3F
	WIccO4+PqefYbmq8748pKuyoRonWMFOwYeYh13ZZs=; b=EjZXGZtMWmRTIUXZya
	bmqH2aHRWwYadT7FKh2WyQ5H+ErPrsOLLFQaBrkmM//syXwKNLU1R3cOZZH2CnFu
	BBsKCJqSR0yO78CyW8cQFEa/5PFU0IuWRYUBoJY5fc3mXWHa6WyG44pG6UZCdk9I
	cVGxROXFM9z+pLRTHnmzCoQ70=
Received: from jbd-ThinkPad-X1-Carbon-Gen-14 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P78oJthqvUvuBg--.49322S2;
	Wed, 21 Oct 2026 10:40:42 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com
Cc: loic.poulain@oss.qualcomm.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2] bus: mhi: host: pci_generic: Update the default autosuspend_delay_ms as 5000ms
Date: Wed, 21 Oct 2026 10:40:38 +0800
Message-ID: <20261021024038.17127-1-slark_xiao@163.com>
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
X-CM-TRANSID:_____wD3P78oJthqvUvuBg--.49322S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr48tF4fXrW7XF1xur48WFg_yoW8CrW5pa
	yF9ay5tr1rXr4jk3Wktw1DXry5W3y5GrW7KryDCw4F93s5tw1kKryvqryFgF10krZ3ZFsx
	JF1jqay5Wr1UAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piYFAJUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC5wpkyGrYJiqkIAAA37

For some MHI devices in some specific scenario, the default value
of autosuspend_delay_ms may not enough to handle last wake event.
This may lead to some unexpected problems.

Refer to the Qualcomm's Windows settings and we checked this with
Quaclomm over case, Qualcomm recommend us to set this as 5000ms.
Qualcomm also suggests us to update this for all MHI devices.
Since this setting has affected some existed kernel versions, it's
better to be applied to stable version.

Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: define a autosuspend delay timeout and explain the reason
---
 drivers/bus/mhi/host/pci_generic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a384cca4..1f52542794d7 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -21,6 +21,9 @@
 
 #define MHI_POST_RESET_DELAY_MS 2000
 
+/* Add define of  initial autosuspend_delay_ms to accommodate a potential 'late wake-event' issue */
+#define MHI_AUTOSUSPEND_DELAY_MS 5000
+
 #define HEALTH_CHECK_PERIOD (HZ * 2)
 
 /* PCI VID definitions */
@@ -1483,7 +1486,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
 	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
-		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+		pm_runtime_set_autosuspend_delay(&pdev->dev, MHI_AUTOSUSPEND_DELAY_MS);
 		pm_runtime_use_autosuspend(&pdev->dev);
 		pm_runtime_mark_last_busy(&pdev->dev);
 		pm_runtime_put_noidle(&pdev->dev);
-- 
2.53.0

