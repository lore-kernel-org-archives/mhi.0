Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A539C62F
	for <mhi@lists.linux.dev>; Wed,  3 Jun 2026 19:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516309; cv=none; b=KYYg4TcmI/whjcA/aeRct+1P4sBFFNbRE8Raw8oIQM15EI93zBuetG/lNxKxbRdbNXzmF8MSRZKlDm3no6IUSsE1E2lyZa3Xm8FGEwnCT6lopZn7loLBaAtmZ0NEGrJ6JkAY9VDiB+fAxMqfT/6HVSmakbM5SY9f0F20Mcn0aK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516309; c=relaxed/simple;
	bh=5W58dWElK4RYZ2metX2RlynazzBJ7iHoC8xRzPeYPR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dd3ei48oLyzhcfbTYqSYuxolVi/TRd742Mpj2tZXIsjOUg2IVyG6AHeIkPdpw6s5YEGmNU6W2ojksInUYAIdodhcmmA51C8MtNFVCJn8aZ/m4stHx6EQpzQxeej/tQX07NMrF9l/Eh7mnQIxYh0TBN98JSg85wineHINx/Hk2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QedMynoZ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QedMynoZ"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9158c621ebbso139198885a.2
        for <mhi@lists.linux.dev>; Wed, 03 Jun 2026 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780516307; x=1781121107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A82BTWIRj1ifSpCdTDnYpFe45FXXSmxFaqAlvQSXlrU=;
        b=QedMynoZl3rzJCi4/jvobMJhzoj3p6QeP15Pf+zV9mDMdwt32j2bW1uJYmp0Gmx/ju
         gtyV1v6FYKG4wA5CKJGEOSBnAvE6BOqriJmBat4o54UhbTiw01zoB5agNtPPafd/qSpv
         3nuVObRlC/jwukZrUfwzOMVo+TJ6Syc0MP+ghIFUjIp1hOs2D2kdkpYzGaxZKGtRi7lQ
         Jck/xoiOnWONnT4hmzvoypcj+3ZMNt7YRN7scsO2lNLxgZLpHDOvj3X+uRdaaHvQYkBC
         FBMlAw1bkkSixP/i7UGfE48q+9h1SDV7AgMJGqvM3FnkhaJFE0VPRd0zq3jMYAxlvA8o
         Ymdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516307; x=1781121107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A82BTWIRj1ifSpCdTDnYpFe45FXXSmxFaqAlvQSXlrU=;
        b=XyTVySFBsFcbbHj8frs3c+P8gcve/rmg7VNL5O5LQk0fM1UL9uAMCBZpqr/LkkJlJJ
         KOafVVxf5yF5k2zS9HkKr/HEAOOqlCf++WNnWm0oEqLyMRROwD2ptdqzA9oiBfN4Fs2p
         74/CkHWp/2+n3llCGKO6bt8QC108NJt5yiy7+qnVgyrsWWxd8z6fcEsdOFGL4QUSVy6C
         CubMhvS49HaRKLQqjGEdGxSMXAkrqbGi4WSkmHti4qHRLnSC/tGg5DENTUZ70+vS01Od
         Lv1P3u17IR2yWRWDRwD0mjm/XfjALvJMaIueCkFgZZaqztS5NJY1B1tfNJa4JvzDMw66
         VF7w==
X-Forwarded-Encrypted: i=1; AFNElJ+Ev/AgDA9+wz1r+IBm74Ixjtufw+27nQS3uV453sq2DWocge/QLHam+OMU5Tbo/CE9f2E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3sH04PKDrpSi99qWJKu4mqap04SjeorgKVbZccDiEU1G/G4uY
	7vx0Q/oCkdCK0vWHrjUjR+xYLDwgm+U84MaNiAW0BYO/kHkNDtKORWGg
X-Gm-Gg: Acq92OFCmBekm9XpxT6SrN6bxft6w2Zb7lFyv4ZR3LNMLos+SpNMIylMEnRHbw0XMMg
	oKQDbL3dr2DWGdigUIh+1D0CkO8R9GQiGFrfUk7vpn4+Haf8aQSAHzk75F6M2KZuf3iPDBbbbxq
	32dmglfEXVnCubdNbRZ4c67fNDgpY+UU6F5Z0CwlqJcErnSyZ+kqvVWIizxxDPvkdfo3bRrM+50
	YwiIdULczPb/9Wo0ukicYdIBnCd17wQ5h8YxX3WzF9Fwx9ZLUqDUntcvqa2KHoAezLkjn0jls8l
	TraPcKCLIQ0YnEJ6OOO1CsHUaUxGS6wWr7wmkm4+JaRofo9QUAc3JOSyRlwB0ejnIU141YH3m+7
	Sm8o1G6y+Ylp70OO0+pxGbbTLBH3VZbWmddjUUwKlT6ZVvolV4elK6tJ6j+MTCydEFH9DYxlREE
	V3ZneyNxPwBm4vKXP5RyrIBgXmPucOX/NT1jPWjj+ku8hZo+9z3Jc=
X-Received: by 2002:a05:620a:17aa:b0:915:98e9:2c1 with SMTP id af79cd13be357-91598e90562mr334917385a.32.1780516307468;
        Wed, 03 Jun 2026 12:51:47 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a2359ecsm337901685a.14.2026.06.03.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 12:51:46 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	=?UTF-8?q?Adrian=20Barna=C5=9B?= <abarnas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] bus: mhi: ep: Fix device refcount leak on create failure
Date: Wed,  3 Jun 2026 15:51:42 -0400
Message-ID: <20260603195142.2189386-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_ep_create_device() takes one device reference for the UL channel and
another for the DL channel after allocating the transfer device. These
references are normally released by mhi_ep_destroy_device() before the
device itself is removed.

If dev_set_name() or device_add() fails, the error path currently drops
only one reference. The remaining channel references keep the device
from being released and leave the channels associated with a device that
was never registered.

Route both failures through a common unwind path that drops the DL
channel reference, the UL channel reference, and the initial reference
from device_initialize().

Fixes: 297c77a0f273 ("bus: mhi: ep: Add support for creating and destroying MHI EP devices")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/bus/mhi/ep/main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 0277e1ab1198..34d3662eb091 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1338,15 +1338,19 @@ static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
 	ret = dev_set_name(&mhi_dev->dev, "%s_%s",
 		     dev_name(&mhi_cntrl->mhi_dev->dev),
 		     mhi_dev->name);
-	if (ret) {
-		put_device(&mhi_dev->dev);
-		return ret;
-	}
+	if (ret)
+		goto err_put_channels;
 
 	ret = device_add(&mhi_dev->dev);
 	if (ret)
-		put_device(&mhi_dev->dev);
+		goto err_put_channels;
+
+	return 0;
 
+err_put_channels:
+	put_device(&mhi_dev->dev); /* DL channel reference */
+	put_device(&mhi_dev->dev); /* UL channel reference */
+	put_device(&mhi_dev->dev); /* device_initialize() reference */
 	return ret;
 }
 
-- 
2.43.0

