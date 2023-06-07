Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D51ACB5
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 15:24:45 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b039168ba0so64840275ad.3
        for <mhi@lists.linux.dev>; Wed, 07 Jun 2023 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686151485; x=1688743485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiKvZSsDZj7fd26SGwfQBoXfS34tAdkyr70ERjpK1aY=;
        b=zqPggBcq11OX1ElgAFqoDAWJRSASVztJb1cWe6OynaqzLe7sBsRT+wAnAtnUAFidvn
         F5l4K5Dhxc8a1NacTr6qRcfwZRlB3SnqlCzOofBuwXZ+wi6fdsWaWEuThesswCSjO61H
         obx5ReKroXUhJEum8G0ogUpHHN3e1IxlHELQwwsdbJOvwjBLvg1weSd3i91QuEDdI/Ha
         OUpTXWz4W60SlYCfvAbA2Wwp/PMWZrzpv2mPZJhOSJ5HkH5982DpU0WeiX/M5sAdYPGR
         gnO3lJfDLFU9t81dUl5qkSnjZN55uKpA0ajcaseMwBZaxbMNvsBt0yi8k2NtboE+mUEp
         nFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686151485; x=1688743485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiKvZSsDZj7fd26SGwfQBoXfS34tAdkyr70ERjpK1aY=;
        b=VoILmvnpE3Vg3e53pHiq49IUZZMuNecVGoJAe5QZehSw0OT7mZswLYn+4ysbhvP/ZH
         2B3EXDgZJR/RRyu4pmmOZCUSvWvTWiMytb9bzliHA2fH0490GDi9Rszj1yMG4AY09xoj
         LMJ1SUfDYYhZaMRDjOSXoaRckyQ9sk9OHpt9LWCJ0CSFJPxxDI8Dw1mbuYmtDzZOTUUy
         UiLzCWRGQr/aug85P3Hz/yYqoAj44EY8bovlWzLt76CUEe0XDYBbABF6UO+qHWdPAsD5
         BAQGOT4lFcnN0R5ejMJKWNFY6NBTQ9hgALzav6glO9TekRbT5mHZYlrLAyL40yLNT/qe
         14ag==
X-Gm-Message-State: AC+VfDzHlgYf5coH+QDtEantMGXL+7p6M4tPTj+KSOIveTFcCzRPIxaK
	bQiHaXH5jcOKn+Ali+N9atob
X-Google-Smtp-Source: ACHHUZ6d4E1TgxI5W1nBECW5opZQlDztc30qRfffvojmV4zVv25wpJL8mcdindlvslgaAnTog4ZAVQ==
X-Received: by 2002:a17:902:da8d:b0:1b2:28ca:d38 with SMTP id j13-20020a170902da8d00b001b228ca0d38mr6687381plx.10.1686151485580;
        Wed, 07 Jun 2023 08:24:45 -0700 (PDT)
Received: from localhost.localdomain ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902788500b001aaf536b1e3sm10590958pll.123.2023.06.07.08.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:24:45 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/2] MAINTAINERS: Add entry for MHI networking drivers under MHI bus
Date: Wed,  7 Jun 2023 20:54:27 +0530
Message-Id: <20230607152427.108607-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The host MHI net driver was not listed earlier. So let's add both host and
endpoint MHI net drivers under MHI bus.

Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 081eb65ef865..14d9e15ae360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13632,6 +13632,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
 F:	Documentation/ABI/stable/sysfs-bus-mhi
 F:	Documentation/mhi/
 F:	drivers/bus/mhi/
+F:	drivers/net/mhi_*
 F:	include/linux/mhi.h
 
 MICROBLAZE ARCHITECTURE
-- 
2.25.1

