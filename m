Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3234C140
	for <mhi@lists.linux.dev>; Tue,  7 Jul 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450268; cv=none; b=R1yDdDGsrlGgYWAIH2R717u6GhkGV9tQrWqJdz7M6/JSkxG1QlA1EuAGiiTYa89JbtIfvRIFWpmyDqq+wSLWA0bDyOZovF5qAyYE0czmAmoW929xjRS78CBMqJSW1cEDpHjMExeDcvC89ppVq3gG1WpLxnlNXgo1ijk0rUT3D6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450268; c=relaxed/simple;
	bh=Nw6innSIqpxVWTQoJU1GVIm1ikahkK7AGp/6PZZsT5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AD4yFX/rzotpvrln6tjQcmRjS0ATf5yR/vF4EBUpl/2tw5C6iquLjvX+7p6LjCk/onh9evjaDwpgcamOqI6m2fpLuhnroGA6ZK0Rm1LhP2IRZ8Reig7ViJEpPBuq43BTnCDuc5k4qMmIVQe2eC0ImX99SPDOyIk3ML6sBpGleRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP8esbUJ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP8esbUJ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51bf2479349so30576411cf.2
        for <mhi@lists.linux.dev>; Tue, 07 Jul 2026 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783450265; x=1784055065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTSr9YvA6zvfbdCXk8bx0rwgDXQY6cKDFEPWMlli5ik=;
        b=WP8esbUJjfZGL5Y5y2xuSPpZ5m5Z1CYG4+0sRADfhOP4PjtGfM/QegiLEgFxB7sMCO
         mZceTPgi1zjr894DiFlE/Ze7vsIVpUBdos4ki2G55np6qm9cBIx5e502rlf24ocrB2FT
         FxHHyup3sw2/41psCoNJG5EGVI7Cr14wRDUiG+1odELrd/YdGMtBac5qZ16gd3mLJDJ4
         3fPbhIp3UddPwa1cDVOoG2F9DsL5QJMVqifE013bChAL2uNtHbyoqGDHP4uS/3DOP1Ib
         OKP5ze3VHiGsZJwYibHcRHs4MixbJDWFuL5MMSx95Gg64ZkmtkZNuU3Z5DeGvGoUEbWW
         aENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783450265; x=1784055065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTSr9YvA6zvfbdCXk8bx0rwgDXQY6cKDFEPWMlli5ik=;
        b=aXGzsuWAv4MzF2azdRtQSMujSeEqxBrsBzLDgqx7PlBUSbVHghYATEmGSKXfVzHecx
         fGHi22ptySHJ2qJO0rPbkRtKa7KWQF31iUcvzXs0YSsY7OydmANM2bZC914W0uZjm0Kk
         Vrpvc0WL+4iXTti5Xq2upC6mQWN19S/Id6agH6RVBfp3BXD9L6y+YYAqsFhB+mCZQW6v
         nKLDjrG5xsiV9tGAAq9Xubs3Y62EQ/KXhrcNd2hZLcq7dSkOCAmuUnomp0t2Pg8roJnK
         8EiV5HkQGuK/baFheKjSuIFkVbdSMUnceT2u71Tse8ydCAuax8qh/EpDevtNfPk02oCw
         mUcg==
X-Forwarded-Encrypted: i=1; AHgh+RoT0bt5Adq/tyCOeN2gxYlO8D93YjT+kczHnzQDC9tx5HbSBdIbytjtUaMeRSZ8cTScAUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzoo62PEFmjJ3e6TEuQdj2PLToNJH5qJq/Rv1kRGK0aOem3ttDH
	RP7uxgGcUjJ2ZaKafC7WqGjXHY4ds+uo+vgONm/I9xOMpLvPUx8lrxqi
X-Gm-Gg: AfdE7ckGR5N+LEqOFxwFF6+6zUxqO0UJ/hJRi4NMiT4wYYjhtYiav7MEQvmnvrVYP5u
	bSvS60DlLGFt6+BdVNl89QCiQnWcvF4DV0YTnvFhpijTo0u+bwK45B5b8DBOPNViQKmzn5Go6Ji
	lK1XNuNSKK6DRxTLxj/zjACv/OhnGtw64dBQFKItVJwYUHbdyf9Ze3ShXTeUdJgPypwQppaiVB5
	KWk/oxE/rvCheN1neE/IJTHUk3t18fVBPZEEyASW1XkFS9GYvit04tX2Y0eH7PUrPBEmMRMpPXD
	CJ55Ug9acwkb9TI+Nm7ZFpAizYOKxXSbiM+N7eXePfDT2op3tT2+4HA5P3mS1EJ9ckEBVKPBc4p
	wloS8ym8x1ZVUXt+aEgV4RrmslP4aDGJ0ddtDhI7WPt/lty52xi1zNX95pqQH9VfcPmDioIQK2q
	KpazSvZi12DPno1yPLF886lhyjM4lpqQ+PPZlt4a/t3TTqYjvz9oAuRpQwd6zmsRuOC32sjMHDV
	Pi8gzoT4HW2sQE=
X-Received: by 2002:a05:622a:2443:b0:517:8069:8b07 with SMTP id d75a77b69052e-51c74801deemr70992621cf.29.1783450264903;
        Tue, 07 Jul 2026 11:51:04 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471813c8dsm165950936d6.25.2026.07.07.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:51:04 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Adam Xue <zxue@semtech.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] bus: mhi: host: Fix controller cleanup on EDL sysfs failure
Date: Tue,  7 Jul 2026 14:51:00 -0400
Message-ID: <20260707185100.424891-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_register_controller() adds the controller device before creating the
optional trigger_edl sysfs file. If sysfs_create_file() fails, the error
path only drops the device reference and leaves the device registered.

Add a post-device_add() error path that calls device_del() before
put_device(), matching the normal unregister path.

Fixes: 17553ba8e19d ("bus: mhi: host: Add sysfs entry to force device to enter EDL")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/bus/mhi/host/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 12dcb1a2753c..fd3050889412 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1029,7 +1029,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	if (mhi_cntrl->edl_trigger) {
 		ret = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_trigger_edl.attr);
 		if (ret)
-			goto err_release_dev;
+			goto err_del_dev;
 	}
 
 	mhi_cntrl->mhi_dev = mhi_dev;
@@ -1038,6 +1038,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	return 0;
 
+err_del_dev:
+	device_del(&mhi_dev->dev);
 err_release_dev:
 	put_device(&mhi_dev->dev);
 error_setup_irq:
-- 
2.43.0

