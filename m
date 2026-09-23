Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C208314A98
	for <mhi@lists.linux.dev>; Wed, 23 Sep 2026 23:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207677; cv=none; b=rHGJR33c2L8J8XPCNddlJnpPIi2jTaGKS2Z+AI43IKmJ/Vo5Bx4vFIOPbhDdsaSDRrF+uXXfyTYbvMzKSXfaJD3qie28Zshue6Pcf6tfLxSIyiS7O2n6egk1WD99mrq5grt1DsfWJJzNl715ic3WSyB3nf7vB52xHpDs5gPkDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207677; c=relaxed/simple;
	bh=xSwgtNXTlPhev8I96YN0byX+CJhMkcrtEIVhpD2ZkgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uc+ciENF/rZqOeZCASqtPTgLF0vH1NRHK3/XG5SrLwnalorKreJkj+XipAjko5LOioglzu3LbMuS7/Z1OmZZyxTpkAetbOM8IEPMO60bTWsw9yIdnYyHn1SkYYMTqICdQvBsp49wwjyS3BowmepdO28qeqzs4yBwnbKidqsqLMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7Gsdh1d; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7Gsdh1d"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76c9df1so14559721cf.3
        for <mhi@lists.linux.dev>; Wed, 23 Sep 2026 16:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790207673; x=1790812473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YWsyN2G9LWwioqrNVsniXHUK5Ay6GmJ3BIrxT0YNvA=;
        b=Z7Gsdh1dzyFpsqL8r4etSDn8ZZpHmsVsGtZVtf6XszotewuLOt78yWJAKQQ7dPYCvx
         cdYVr6E0/XnFYrwCjIT+8jI/kCi+XSGbstAnWdLIcE6heJS+MopIiM5m1RbSo+zVlvi7
         dAsW30SSL1P9+9XGl1yLH7YZ+JUJP3oCohMSVAVkAcRueS7SdSJzedTeLE/r56/3bCrc
         VNBGqW5Rpg9FTNFTbtmFv8McnfVCXdsoUQNR64Zj5kgJiaCd5k6ABRWl/mvzGzvInuow
         bf9eW1fIKqoJiJLRRgEHuNVBm1Av8o436b/7f7DoUDqyYQSQe+cJ/WL+SEivNk6Xu76n
         t/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207673; x=1790812473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YWsyN2G9LWwioqrNVsniXHUK5Ay6GmJ3BIrxT0YNvA=;
        b=aUtMR8cNiE/DiN7CeEv8KgU3fU2CKJDALOCG3uU6xXXm0j5FwyJttH12P9YKun7ZXe
         3NgbOT99IbfjLMUgB3QoZ2dNiv3t17tspZlLJpxJTxmMVRUUJFA41j1QEnFrJE3HjYtU
         tjEMddKPiwf3o5QpG+e93HYJ5WRhaPNkZ4mIp/0jOGPbhezocTWXjyq6t2fF5lD6bDqN
         2/Lkj2dHUJcVqFF2hm3DRLed48Bw5hdBP+c9pMBMlQ8GAsDgn0hLYkdM+7x4qtN6LCk0
         oTUqt/KqNOEVYIFLTmZ3oQgAwAqbjazLcxgRqPrtXajOpLhOh5txvTd3HGj0C8KZHTY3
         Pjpw==
X-Forwarded-Encrypted: i=1; AKwUvBwMCiw2zsN2IwUCHYPWmE7eJpfe/5J5hcyFHLM4J9nVgE4dP5Eqb/YcXBmJqqldFgHNf8M=@lists.linux.dev
X-Gm-Message-State: AFuF++kfr078nPyT4EWSyr1gqz211f0yKATz4Stk/JxCW/pqD16RKVY7
	Yv9VkreoVxnFueom89JgDc7tyvi1S3ccL7YXqxkJfDHjlLx6Fr/Sgnso
X-Gm-Gg: AYBFou3BDT2MY3FicEB9btbwu8VmIp5Yd32LADCwankGbz5FaQLSvXcJdPfWHrAa4PO
	haAAVJNJw8Rrzcjert3WWrPi8IznY5ZadGWTl6/AIlDTdn0RLMooLGvxs/0D/oVrIfljsgNHEhQ
	ZS/FeYGfv6lCJVqV5ppbDfDrAbS7x3TDXXNNoSWURffS2TUrBred0zdvAXs7jdikNq78Gy7B4hH
	b5WuSquQ2jFTI0RpAP6N5VgAt+bU/LGz0/kb0wkf9dt7pr4jdVAOmNPNMmeVq0LC24VCjIKq6IR
	mldTRuch/R7hzSrnc900VYNIfqERWAy1h1MbAYq8eLJ3xDTQ+6OFiOuEwlMjiWDKojOZUDi4LY3
	F9OhBAaqUgGiBstKr5TSP1jiDf64Mb5skQ/mfQmoMaMc7kW2UmX1nwsDbh5YBPg9fwUTNNCz1GY
	0ZzfoIzymi5wmuXIjvQdaXOIlgrErRJny8rALx9o/ARvYavr7ZAWQC06v4ZySzhTtecVSkw7hvH
	ny5JZTVeBnpa9HOd/l/xBc=
X-Received: by 2002:a05:622a:1b24:b0:532:ca19:afc1 with SMTP id d75a77b69052e-532fb640a29mr12355801cf.29.1790207673650;
        Wed, 23 Sep 2026 16:54:33 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9142183c40asm281206d6.4.2026.09.23.16.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:54:33 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: mhi: ep: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Wed, 23 Sep 2026 19:54:21 -0400
Message-ID: <20260923235430.703236-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_ep_register_controller() sets IRQ_NOAUTOEN on the doorbell IRQ
descriptor before request_irq(), and the flag is never cleared on the
error paths or in mhi_ep_unregister_controller(), so it stays on the
descriptor after the IRQ is freed.

Pass IRQF_NO_AUTOEN to request_irq() instead. It keeps the IRQ disabled
until mhi_ep_power_up() enables it, without leaving state behind on the
descriptor.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 and arm64 defconfig + CONFIG_MHI_BUS_EP=m, W=1).

 drivers/bus/mhi/ep/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index db7ee6547eef..da498570113a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1534,8 +1534,8 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mhi_cntrl->index = ret;
 
-	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
-	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,
+	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq,
+			  IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			  "doorbell_irq", mhi_cntrl);
 	if (ret) {
 		dev_err(mhi_cntrl->cntrl_dev, "Failed to request Doorbell IRQ\n");

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

