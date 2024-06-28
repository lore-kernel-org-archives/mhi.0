Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9B613F43A
	for <mhi@lists.linux.dev>; Fri, 28 Jun 2024 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560224; cv=none; b=BMT5nfazzmmYZfT/pf2dQqkXELUKj1VmIikDCEBWe3B6yjiVrN8LDW2t8KtVi7pfuNFilH4e5r7JGqejYV7YxVwmV8JyE1OfKxPKBz3WK9uKBjFetvxqCsTfomjKWVyaHVW24AO5Y+b9El1nsEINW1F6suMGpJc65GUvKP4xk0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560224; c=relaxed/simple;
	bh=M5uXdjRtlvtzH6mdxQAz6HkPBOUMp1T9Lc8HTXB/nW4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e+Yui7ARh8K9LkieQeQN0JR394ZgqpGlKy/ikRvDLAX1UE1/DlCM4NDMytHKXJ0JKSywJnJVnQ8EX9x3rNE80XUMH8EnFy/vFMZkbGUz+dtP1BM9TsGHqEf6oPFt6eCswzthZwPc3dONi3jzQM7j4OQ7PKxYS1zpvC23fw/FwJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kQam4WnW; arc=none smtp.client-ip=45.254.50.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kQam4WnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YWxaJ
	rajJaFRSG0iQHRmjSZbVIZSCWAFGQbHbwsY/O4=; b=kQam4WnWqWj6nf6q0JfBr
	IHUO/26FQSlIaPkmWw/EOVsEFj8gFFEHgY6pLZq9LVhB+p7kxmWVWUA3C6ng3s9U
	y0l1nD8XqMcDIM2dJJIzt6mjoPXpXeeTFG7mfl+UrWSMV+aOj/4RVlHWyAIAUXp9
	IPfpgjw1+xEgaIDVRRLIHI=
Received: from localhost.localdomain (unknown [112.97.61.84])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3v2z8Z35mQ+hEAw--.4754S2;
	Fri, 28 Jun 2024 15:36:29 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	quic_jhugo@quicinc.com
Cc: netdev@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v3 2/3] bus: mhi: host: Add name for mhi_controller
Date: Fri, 28 Jun 2024 15:36:26 +0800
Message-Id: <20240628073626.1447288-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v2z8Z35mQ+hEAw--.4754S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DWFWrXr4fXwb_yoW8Aw1fpF
	sYgrW3Ar1fWrWjkryqk34kZry5Xw4DGFy2kr47W342yr9xt34qvFWqga4FqasF9rWqyF13
	tF1rZayUWw1DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pig4S5UUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiRwEMZGV4KAvBUQAAsA

 For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
 This would lead to device can't ping outside successfully.
 Also MBIM side would report "bad packet session (112)".
 In oder to fix this issue, we decide to use the modem name
to do a match in client driver side. Then client driver could
set a corresponding mux_id value for this modem product.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 include/linux/mhi.h                | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 1fb1c2f2fe12..14a11880bcea 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1086,6 +1086,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
+	mhi_cntrl->name = info->name;
 
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b573f15762f8..86aa4f52842c 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -361,6 +361,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @name: name of the modem
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -445,6 +446,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	const char *name;
 };
 
 /**
-- 
2.25.1

