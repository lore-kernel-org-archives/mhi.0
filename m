Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346444682F
	for <mhi@lists.linux.dev>; Fri,  4 Sep 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526058; cv=none; b=I0xuZeVvGlofmqEce6HvDiMEOLn/L9pXyl1KaadRrDjm0ZPolwaqZAWW2CvjzdrgIv8jxuMWg+voyeJn3bIGh3PPzEypMB4m5iGbaBNqDrz5GWQq0mIKnsXUIDZ0mRnI8nnjCLcl2Z1j3yHmbxt05g/l0VC9GXcNF+ETb43pvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526058; c=relaxed/simple;
	bh=2dgeFU4dMXanVlsum2W2x7rzNpqIqmTbXZG1r/qGXIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7R29T9hDrZXw/8IiuBtjo8M+SAgnJOEuNi3sAUVLm0zsydB+qezSTH9ulZ83Gs38KT+EZcBef1geHYABW4kTImxKkJcD7RpooGWO5LIleNAkWYCPNBbMn3J55Np8avA9Q5p8plCWHBNEwLY3pjT9OPNTMls20O1oYBTVpY+pt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmfX5Q+i; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmfX5Q+i"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso612125a12.2
        for <mhi@lists.linux.dev>; Fri, 04 Sep 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526057; x=1789130857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5ZNcdofv1xmkEiwkoEej12YoH5SbNFwYgfq+H2c2UI=;
        b=JmfX5Q+iHfPw/GiaeGjjlSnPiy7zB+FwR19UZwEcn+ZGkSDLOLlDAxSpV868Dp9YCu
         ksNQ7FVLSWoMkJzFD+DwCfCefVTpisaTd6Na+VAXafGD1O95hUZT/nnF3dRVYe2LBWuA
         009UcJn1mXGnny3L6Zu2zsihJ0gbS1prg6INTbC5qfGkXrfNRghdKoZej8SrIzbM0GmN
         tssOF76tIDoEHlgLOtR8ajSRGislYO/UhhNiq3r2AdHe8+T72l54jSys2FM6ncpTAOeB
         nxXf0YaBLnOQmmMsReUNP6jiJC763mS2CSuy60BWbmbPIrPneLu3C4X75CUQ8rq21Jho
         g8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526057; x=1789130857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5ZNcdofv1xmkEiwkoEej12YoH5SbNFwYgfq+H2c2UI=;
        b=tKNCu7UZQYcdO3MEln8T0muwMrXxdkLGryCw91rU03g6ilbnHGbLEu3v7F8c7vJ835
         /Mm9Qmg7dyWGCT2DFjxlRcLQQO/Bd8f2sI4IpiOpshk9jNgCHwlABqVhvSHrz+lgQx3M
         HQgeB2cXPgC9b0xAToytOnhr+Tjd18NghbmhM2hh+JfVzOS60+ONmyjFPwy6WIOygOv5
         Lvrf5JeB7wFGoeXlD7jKXJztXDat/pxv7v2hZe0+xDMFGhYvUyER8pD3wqQ9dUx2q3du
         +qG2dVuEwvLGzS2DDDOkLjqnZGVo/smNJboZyHPubdPP59feJdeCPP0efjOqn3y8Eaw+
         Bs8g==
X-Forwarded-Encrypted: i=1; AKwUvByNbSEMrWFoXtqOxgIcegnPNOHiPPxUPLAwPoBQ9ObtxXg31V/dupB54PY64W7kqVPbiJo=@lists.linux.dev
X-Gm-Message-State: AFuF++krKgI1hDFJwhoUA+paNx8JASyKKMlV9907zpHn7wGrUxN8E4oP
	E++9pDMLKMT1Wc6eIOChgbpJav3aaY2+izIBXcVzghvRD77gnsUuCjhgIAzfwlJG5mc=
X-Gm-Gg: AYBFou0tpMYB9Ol6zRFVtkKf7IUi8NnA6jQ9P/2hET7kYMCHyXNMS3XxQlMzMHDFtYP
	iaZgHr3hhnUyq6BLMbHzF5pOHnzlg9I8hl5G2ZxVG+rp0tqYSPOV1S8ys4USnJGFeQQm7XN4lJz
	9a9+yUQeJrNHpZLhrhaMF94JLsqcSq0CFQkPHC47YsTl43G4t2oD9/5wCrRcDfz/aVPaT2jaElz
	JRi9HZpvDpCdKcAntlA5LGdXSK3JiYUwH/B/FUfzJ8d5i83UC2zxeN80sQ4Xv4f+y89s7/sEWcg
	Sz/8bXnut5MWNEQdzogRLJIw/EMIOZEbj4vaXbrimMEaXRXsrO0S+M0LazuYbKJ+YxA/RsDu+ab
	s/kVvUNBzRoZNEkYTEOlQgsNgbhSNHAZQrBFdT8ssUcIVc9sNsjQh+hQIgEqMybm73W7ckreTny
	+0LyKIcJ83cuGpCxpQV45Dg731ON+qIPi4dptlM36YcW1C3pSeCybpClio4DEsjt7azkO+NtqHx
	hxXuYcU/cZuX7U=
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr9681789a91.21.1788526056610;
        Fri, 04 Sep 2026 05:47:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm4553800eec.17.2026.09.04.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:47:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] mhi: fix typo "intented" in comment
Date: Fri,  4 Sep 2026 18:17:30 +0530
Message-ID: <20260904124731.9011-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "intented" to "intended", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 8616bacd8675..65e8a397cc50 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -687,7 +687,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
  * Resume the device irrespective of its MHI state. As per the MHI spec, devices
  * has to be in M3 state during resume. But some devices seem to be in a
  * different MHI state other than M3 but they continue working fine if allowed.
- * This API is intented to be used for such devices.
+ * This API is intended to be used for such devices.
  *
  * Return: 0 if the resume succeeds, a negative error code otherwise
  */
-- 
2.48.1

