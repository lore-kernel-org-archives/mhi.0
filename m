Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464222C9C
	for <mhi@lists.linux.dev>; Mon, 17 Jan 2022 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zGy/c
	+rMZ+YP77HHohIlehh2vF9jVqV2GGfASZ90qrc=; b=Y0hhUnkIIbKqhF/cQjIIY
	YN+dfq3qrYZexbFVW4K0xXFknnyeGhfjfERPLo/L38MmskdBcXsc+/UkNnaqrCnT
	L02nBzU4eKD+1pcVbPajfixjQd2c4VKu2JIdzFgfMzCe8BC6a/xa7lAjKN39IORG
	G3XXYqC3Es2nEMDrYSB9/k=
Received: from localhost.localdomain (unknown [112.97.49.17])
	by smtp5 (Coremail) with SMTP id HdxpCgAXT6DzJeVh5THMAQ--.604S2;
	Mon, 17 Jan 2022 16:16:53 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org,
	hemantk@codeaurora.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH net v2] For default mechanism, product would use default MRU 3500 if they didn't define it. But for Foxconn SDX55, there is a known issue which MRU 3500 would lead to data connection lost. So we align it with Qualcomm default MRU settings.
Date: Mon, 17 Jan 2022 16:16:44 +0800
Message-Id: <20220117081644.21121-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HdxpCgAXT6DzJeVh5THMAQ--.604S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw18tr4xGF1kWw4fCFy5twb_yoWxtrg_Cr
	ZxGF97Gws8WryDGw1vqan5JrWrKa4rWr1kAF1Iqrn8J342vwnxXwnYqr18JFnIgF45CF9r
	J3s5Zr1rAw4YgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbasj7UUUUU==
X-Originating-IP: [112.97.49.17]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQCLZFrPfDWNuwABsx

Fixes: 5c2c85315948 ("bus: mhi: pci-generic: configurable network interface MRU")
Signed-off-by: Slark Xiao <slark_xiao@163.com>

---
v2: Add Fixes tag
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

