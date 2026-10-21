Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580094;
	b=C5NJi28Iu/YM6FyzILZCj2M2hMwcPFfHKrjFPkov28T4r5zHLKAK3L9QbZpLb1z9O3Jj
	 JOLZSunCO04VMxZrUPOK3qaQSSIsw7OWUXbFIT3kHR62nXF6fsXa11xI1vk3QyE1gd4PO
	 na8JIJdg7r97z5mVzXoQGMOQkBFDONcLC95mIEWuxenhXbW6pTjla9GaKzeTFX1aZZd8r
	 13DmzcBLCljJycacETBzaSwEcHtCjBD8dwVkijLWigbkQmJ428vpCo9tv+FY7qGOQpZjr
	 0WaLfyz0a5IubyARf03VKRy9NGBwblKmEfzTOamTDHrq7f10xhJQBJYADOLObpYYWeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580094;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=hylB7Q5s6aIIrh9STmuiAIGnIKZCFLhCVkXWbPnn+4U=;
	b=d+MQ4KHXaNKOixpw4ZLQHUUXXii7uHZivmE3lWu01KeQE18mAB0b7L5CURrDui/sORn1
	 GfFThGd/U9kVJoId00kRMRyVL4EaTg0d+knQD0KMtfjE9QozVXLIH9rt/fy9DfLA68G29
	 l/0gHuK/ceDAofaY5XgYSh+I02qHj9QjM7d3nFzziS8fuYZurl+NvAuYYQV1BctC6bdeH
	 ZkX50zGtqzN+VsYjqXTNiY5DQQzL0DU29gt5/pQzfn5izlhK1msYdWK7+pu6zZx+u6Ycx
	 9uA+tP3ww8S4yDvr7FhktGPQQa4rFisddixL4RCmVpSa2L3GHWPpCQKiK9qqw1nZWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WnGUsFZ4;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E820A606A319
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 10:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E820A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WnGUsFZ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hy
	lB7Q5s6aIIrh9STmuiAIGnIKZCFLhCVkXWbPnn+4U=; b=WnGUsFZ4arwK11llxk
	5yF+HvDN9+CBevVjvvjcIRyH6HmpPzKBSBEzQCTX8peAm4WkP1Z+mlZrAZEorNWB
	UyxM/ryUuLSr2i+NB+LH3AChMfq9mBzcRWhrA6n54QKeXJz90hnYncgm3ChJWJRb
	zqc8siQ4z9Iv23dO5HE5Swklc=
Received: from jbd-ThinkPad-X1-Carbon-Gen-14 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDX_wPwmdhqxCoxBw--.10772S2;
	Wed, 21 Oct 2026 18:54:41 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	jeff.hugo@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com
Cc: loic.poulain@oss.qualcomm.com,
	val@packett.cool,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v3] bus: mhi: host: pci_generic: Update the default autosuspend_delay_ms as 5000ms
Date: Wed, 21 Oct 2026 18:54:34 +0800
Message-ID: <20261021105434.29897-1-slark_xiao@163.com>
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
X-CM-TRANSID:_____wDX_wPwmdhqxCoxBw--.10772S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF47Xry3AF1xKr1xZr4UXFb_yoW8uF4DpF
	WF9a1Fqr1rJrWUK3Wkt34kXFy5W3y3GrWjyrykCa4Fk3s5t3sYgryvqFy5ta4qkrZ3Za9x
	Aa1jq3y5Xr1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_YFCUUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbC5xFz12rYmfEaPgAA3s

For some MHI devices in some specific scenarios, the default value
of autosuspend_delay_ms may not be enough to handle the last wake
event, potentially leading to device timeout or link drop issues.
This can lead to a runtime resume failure and a subsequent system
error:

  [ 8749.089545] mhi mhi0: Resuming from non M3 state (SYS ERROR)
  [ 8749.089573] mhi-pci-generic 0000:73:00.0: failed to resume device: -22
  [ 8749.090218] mhi-pci-generic 0000:73:00.0: device recovery started
  ...
  [ 8752.940324] mhi-pci-generic 0000:73:00.0: reset failed

Following Qualcomm's recommended settings from Windows and their
suggestion during case discussions, update the default autosuspend
delay to 5000ms for MHI devices.

Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v3: update the commit message and the comment of the define
v2: define a autosuspend delay timeout and explain the reason
---
 drivers/bus/mhi/host/pci_generic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a384cca4..17d51964b55f 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -21,6 +21,9 @@
 
 #define MHI_POST_RESET_DELAY_MS 2000
 
+/* Timeout to accommodate a potential 'late wake-event' issue */
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

