Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E5744377
	for <mhi@lists.linux.dev>; Fri,  7 Jun 2024 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755434; cv=none; b=othUVxLoxhKGX/qCq2V5hD5Xyp/PmNU27Q/8wJ6gsYfcG3mvyYgkEzYrFY47PRBtiIhbU38oaAlGB8EWfFBzeaGIfQQCuJtHoUMDxFNq01JFyW3wUCNYKFC7cK4b+ljOMagywvx98LItjsSZGBShDGqMNJOguVccMeI0HnW2kNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755434; c=relaxed/simple;
	bh=wU2n7IwNd0h3CCqPBmH/JBwMsHgLc12EWBJeBCs5wBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CUMhP/Jgz/ploegb05/rU/YdFRmsawY+16kGCqVAclt9dhUzz42yix8NORqkruciBraNshHQ/GMG+SCIfVuAoIeFg2+DsMrj/57MNH0Jnpx95EAu/BHwh00RHl3WYMNIX+HRkTd+OHGDPR6oCxANSZSVVltQOpweZD2P/9qPzYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cfz2DRhW; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cfz2DRhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=i5GTs
	cTNxm+xnUD3yUpAAKyOF+alMJZ6PiwpYI9Q2Qs=; b=cfz2DRhW4zJaIp/27V45m
	KswReqHEzj6LECAePJNDIkn6PXL1F3CM8OyRNuDoOTgti2XqZKN0UQjRKi8kGiGo
	SdOMnNsqoZxg6cPm6VHRoDPjqh+VNxFYDndxIwgHtF7IAjcNp14nGg8CRKNwCxDi
	ApwCovcEXcZIgQZgMyDhAc=
Received: from localhost.localdomain (unknown [112.97.63.251])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3P6Bs2mJmeajOHQ--.6796S2;
	Fri, 07 Jun 2024 18:01:17 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org,
	quic_qianyu@quicinc.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v1 1/2] bus: mhi: host: Import link_id item
Date: Fri,  7 Jun 2024 18:01:14 +0800
Message-Id: <20240607100114.452979-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P6Bs2mJmeajOHQ--.6796S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DAry3tw4fKrg_yoW8AFWxpa
	9Y93y3Cr4fXrWjyr1kC3s7XF15WanrX347KrW7Kw1jy3s0ya4qvFWjga4xtF1ak39IvF4a
	yF1ru3yUWF1qqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRsF4ZUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRw72ZGV4JqajbwAAsK

For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".
So we add a link id default value for SDX72.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 include/linux/mhi.h                | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0b483c7c76a1..1f9de2730766 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
 	unsigned int dma_data_width;
 	unsigned int mru_default;
 	bool sideband_wake;
+	unsigned int link_default;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
 	.dma_data_width = 32,
 	.mru_default = 32768,
 	.sideband_wake = false,
+	.link_default = 112,
 };
 
 static const struct mhi_channel_config mhi_mv3x_channels[] = {
@@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
+	mhi_cntrl->link_id = info->link_default;
 
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b573f15762f8..4da10b99c96e 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -445,6 +445,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	u32 link_id;
 };
 
 /**
-- 
2.25.1

