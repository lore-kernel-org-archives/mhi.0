Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B03218B
	for <mhi@lists.linux.dev>; Thu,  8 Feb 2024 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707419502; cv=none; b=PxmdhsX154GObVyYySdoExto5o2e9mRkj734JiSftIa1P4ws4YsESO+6/YPbmrj+X5ktdgHEL5MHRkDkkJFVI4NFFQ3MDxHnk1At+3dzvxL+HdoeGYHDCtxuLa4vGyHMqYz8W6xtKDQl9anqIn9L/VH5V0+CkfLicxxqz9xqB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707419502; c=relaxed/simple;
	bh=aQEy3mSWaDeeTSuY1HAPfZhDAO2ymzOLonZei+6zUg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eXLhCExbVSFmPYyVm/LYBqU+chYt4U+mRw40INcWgu9fVq2i2my3I69hTx6kFdlIPfHLxcplyugsV5LNhT3ZshUXkedywsn7P8BvZHkBoJCmzmTmnRfWrJbFmN0cgkkKoSIgfpBuNnmOZGlXn60oN65pMgHRwd3pTSvk2kL1Uus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=Zd/wgLaS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="Zd/wgLaS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d7881b1843so1178065ad.3
        for <mhi@lists.linux.dev>; Thu, 08 Feb 2024 11:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707419500; x=1708024300;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1PL72wG+pTNKJ8ODm/IPBfg6h6zM4BQGA0MFJHp+QU=;
        b=Q3hzR0xePjjccDrGUqfDgV3vpsJlH8ZpnVxhg1oTAsIQmbSouHHiPo8MvSgC+SlFkm
         MtHKVf+iF+J2R2hkmWfybRw70xX8wMH/FQ6aYKrN8AxG1NysdHxZPQlDHNC0sexlsfsD
         LhHYpggtLYnBoTSSNV60VQLcGRaSlfETDBQBSkHJMqifvbrj+tTeRB/wAUowe7pOUvWz
         SirmtABtNVUqRgeIHK2XpsLfokxEoprZ9zttEm9B9ivDN8XTmBXFpRzEsmUvH36qyGdf
         Vd2x0854OGGAafNYxgcz69SL5mBgGg5GMyrplQfciYej9amGouYXFOYk5D+SmzexYfQ8
         tfbw==
X-Gm-Message-State: AOJu0YyAjzmMsfLcrOyzqXmx/ptMBvhBw/h397+pwFuWwdYVTopmZW+H
	pTSx8K9BPRl+UoczZPugMV9m2YroI27D8B7n/9ETfzFf73hhJMFq
X-Google-Smtp-Source: AGHT+IESTJhHOIx4yxxdx6CBz3zZTjh5s95ewXfAPWbhN3a81Xm8y14s7O/v73CpE2tI4iBR2+1P/A==
X-Received: by 2002:a17:902:d2c6:b0:1d9:3b54:d857 with SMTP id n6-20020a170902d2c600b001d93b54d857mr108412plc.23.1707419500141;
        Thu, 08 Feb 2024 11:11:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWR20PWoX58eCA+IjlkLkegHMpsTBiRz0wymeIrC1g/6A0F9m8J+FIDXObHsKZsW2t3VA15MXktj3YBLWCLfpHsBrFTQyNrjmrtEKHZLHRlWWQmVuAr0uAXaZMT3SWCbAxdwzIBAkK8KDf/QI5Gep/groKElY6P72V6rbfb6ZmgydH+2yK4xok=
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id e16-20020a170902cf5000b001d77a0e1374sm97940plg.151.2024.02.08.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 11:11:35 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707419490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1PL72wG+pTNKJ8ODm/IPBfg6h6zM4BQGA0MFJHp+QU=;
	b=Zd/wgLaShCIdHMzteS1tRduU/IrZqYTzM9XWZrgA4ijliNvFPOJpRzBIS15DzwJAtW95Ky
	g8Mw03c0Hp4gqTUkJwyt34BSzz+zAty8XenUzyMbfgx+4C6oyopnFmUXpSCuDC9vjW71k2
	BJaOCSz9rBcEc/GvewW6bItuJeMW417IS4r+jQwTcj5Q87aD81Lhd8jIFrF6tALJUPxJD+
	/3JGZPGfc9cb9SihcEyK20HNubPrnCIYuDNuZ1nSP6DqYZEnxVOYZpfx8mEYN+wnnNohnp
	A1RslDwEDTxzB9hI1zKiRHSJtbPjO/0HSpQPCJiCebYjj09zGyzN/XtmZ3sVtQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Thu, 08 Feb 2024 16:12:02 -0300
Subject: [PATCH] bus: mhi: ep: make mhi_ep_bus_type const
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-bus_cleanup-mhi-v1-1-ee80f4e71845@marliere.net>
X-B4-Tracking: v=1; b=H4sIAIEnxWUC/x3MQQqAIBBA0avIrBNMC6yrRETaWANloRhBePek5
 Vv8/0LEQBihZy8EvCnS6QvqioHdZr8ip6UYpJCNkEJzk+Jkd5x9uvixEbfOqUWrrjVaQ6mugI6
 e/ziMOX9R+0XNYQAAAA==
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=aQEy3mSWaDeeTSuY1HAPfZhDAO2ymzOLonZei+6zUg4=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlxSeEIdGbnUmuLq4798rs1q+lJxH4G/NRRqSYl
 AS5e/NJF0eJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcUnhAAKCRDJC4p8Y4ZY
 pjnQEACev8uaDbyRtMeSDrbIbSZgXFVgR0+fNGk1dDYWu4HrLblTHwG1I9a+bqqLOaTi35jntZO
 tyyfq1EG1vHHeBi8TtbHbNNi1N8SeHq7Xox/U2UJlUzAWJLerqh3oaI4f+ygV2bGxiBEhbSRR/0
 YMOyIEmCgIoTKpHS9/WiJhgwiywB9wXrvv3w7ZjG0fAL3yLc300ZRfXFDGdjJqoR/NV/aE3uTya
 gm/jEMR/6JzX/W8pVSIQ7f8bLaBamMN6tlSxw7qqYidoaPhnZW1IJ602Rc9i3l21sLf6VwweTEc
 sRkNNvQ9RewZeeKVtDZwEzP5WsScdKt3Q0aBZ1uXbrJWOquq0xXV70sreEQW9SJO6Qr8ufu56Rl
 g/q2Ojcd58B9JiAKB0jow1EHAHnSLzlp0kjxKyANnPvnWnkSVO4ZCA1P6GBOlSeIEYGT8p5WBLE
 joiCWqF1eYgCnXp/Dzt1J+7XuYGM2WcbVFZKXYQxn6f0ewzmfjbvVAP1DhKAj/04E07EbRcIluc
 Uk0xrQpQ489eWGcLSah7rK1YUr/oK/e1fOXRFMekF0ojqy+I9Mj+nMtqS9foySWFEirktLP6m1p
 oxMA5QfHYzWK3FFiBT8nz5TxYthluIx/C4sE4d9DxJTHmFbmBny5RY7lERlQHNoPx9XuVz0d6qR
 ViTUoyBuinOnEqQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

Now that the driver core can properly handle constant struct bus_type,
move the mhi_ep_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/bus/mhi/ep/internal.h | 2 +-
 drivers/bus/mhi/ep/main.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index 577965f95fda..512da7482acc 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -11,7 +11,7 @@
 
 #include "../common.h"
 
-extern struct bus_type mhi_ep_bus_type;
+extern const struct bus_type mhi_ep_bus_type;
 
 #define MHI_REG_OFFSET				0x100
 #define BHI_REG_OFFSET				0x200
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 8d7a4102bdb7..a583038131d3 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1716,7 +1716,7 @@ static int mhi_ep_match(struct device *dev, struct device_driver *drv)
 	return 0;
 };
 
-struct bus_type mhi_ep_bus_type = {
+const struct bus_type mhi_ep_bus_type = {
 	.name = "mhi_ep",
 	.dev_name = "mhi_ep",
 	.match = mhi_ep_match,

---
base-commit: ceeb64f41fe6a1eb9fc56d583983a81f8f3dd058
change-id: 20240208-bus_cleanup-mhi-cff3d8395b88

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

