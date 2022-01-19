Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6044F173
	for <mhi@lists.linux.dev>; Wed, 19 Jan 2022 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Ggh+j
	BUxPZigS6LulYn3qU9duz7ejB5F3vOjxnkFcnM=; b=XG+fovDDxuMf+QBe22rXp
	enUNaRD5RQH6ET9DfO1BINiHo86WoM1gJ/iLvgqMh4Tl3PeZbbMZNjHwclLdV8cB
	PMnqWu+5KJrWBxXTCT7tZ+ZxHmWfeFjdAQdl83gskpvp51BtTdDiC059pLaBJ4iC
	ikx6m7gKePYsd2cvX+u9pg=
Received: from localhost.localdomain (unknown [112.97.57.111])
	by smtp2 (Coremail) with SMTP id GtxpCgDXTrP_4+dh2FkEAw--.8202S2;
	Wed, 19 Jan 2022 18:12:17 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	hemantk@codeaurora.org,
	jarvis.w.jiang@gmail.com,
	loic.poulain@linaro.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH net v3] bus: mhi: Add mru_default for Foxconn SDX55
Date: Wed, 19 Jan 2022 18:12:13 +0800
Message-Id: <20220119101213.5008-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GtxpCgDXTrP_4+dh2FkEAw--.8202S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw4xuw1rAFyxtF4xZFyfXrb_yoWDJFb_Cr
	ZIgF4xuws8WrZ5Gwn2qan5Z3yrK3W7ZF1kZF10qrn8J34aqw1qqwn5trZ5AFn0gFW5AF9r
	J34rWr1rAw1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjSoGtUUUUU==
X-Originating-IP: [112.97.57.111]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwKNZFc7Vmlq1gAAsD

For default mechanism, product would use default MRU 3500 if
they didn't define it. But for Foxconn SDX55, there is a known
issue which MRU 3500 would lead to data connection lost.
So we align it with Qualcomm default MRU settings.

Fixes: aac426562f56 ("bus: mhi: pci_generic: Introduce Foxconn T99W175 support")
Signed-off-by: Slark Xiao <slark_xiao@163.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/bus/mhi/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 3a258a677df8..74e8fc342cfd 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -366,6 +366,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
+	.mru_default = 32768,
 	.sideband_wake = false,
 };
 
-- 
2.25.1

