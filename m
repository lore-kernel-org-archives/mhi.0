Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45B52A6EE
	for <mhi@lists.linux.dev>; Tue,  6 Jun 2023 12:31:33 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-53fdae76f3aso5514510a12.0
        for <mhi@lists.linux.dev>; Tue, 06 Jun 2023 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686054693; x=1688646693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiKvZSsDZj7fd26SGwfQBoXfS34tAdkyr70ERjpK1aY=;
        b=vCh2+X1hf0TIIqnpm/AYIkJaz2jT0HvZyY8bUB2wjkMlUlr67HtNsjAYxwsEYkOZyF
         XIKe8KpscCayq2BtwbDRSUyFEdCS9VpWkl9TFax2IjiA4Xos7Ta5bpj8bLVjYyY2adrI
         mcH0oCzttY2usSGHLG/a/QaOhO/+h+tXZW2fD167DVcqAKd6UORhX9O7p6MpHSQc316i
         zn/pzSjzsM1FQImlU4vIWgknepTFraqPz6u0xlEFtz4kpWzLgEYsvrtaHRKtxlDKyW0Z
         Kp0ZZVzkQtHUOSU2ztASWNFj+BM2oEa5ZaZpH2s3vesViYmVVSqovyPLxgkLfZQbDhTj
         Bmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054693; x=1688646693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiKvZSsDZj7fd26SGwfQBoXfS34tAdkyr70ERjpK1aY=;
        b=aLAAlJWzTp7oRUSiDsNq759t/uD8HVMH02AXXZtHAwvjrcdcxTTDrTGL4y/MfFLTri
         KUEwYMMC9VVnnVAiXqE2oyknfUjTbt+Wp+ja9duFf05ztloa4KiT3CKPm8ObFmK61jwN
         C7YdCBYfDpLK7I3dIz/6JpyFhhxYO6b5vv+1PPIKxVMIo75SFvVZCV00Ax01A+cOPN1c
         g72gstVcRWcMcQmUgp2bQ6KOShSmFWB/SVVQxvGttkn0ZDr/R6jzW4YssKOXzTErJSQv
         mIA1t9HAIKTjj/qj+U1TulXDmfo17MfFJ8OQaqYPLms2Ma0G6V7QSHQSyoD/Cdw7hroT
         1bCw==
X-Gm-Message-State: AC+VfDzvvOxqz/SuZHYhSxs+DH8kvtQSIlK0J7vsFsMje/cPclqGP+vq
	ZKYNPOOtvcXwYJCf+Z+ozrXX
X-Google-Smtp-Source: ACHHUZ6q7kMWkvKwEjp12H3nPIO/0rtM06chnPUoE9/svFCtghq4ilDRKHYlyeO3lDycmF/ZYtA12w==
X-Received: by 2002:a17:902:d48f:b0:1ae:8892:7d27 with SMTP id c15-20020a170902d48f00b001ae88927d27mr2399759plg.42.1686054693195;
        Tue, 06 Jun 2023 05:31:33 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.178])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902c74500b001ae59169f05sm8446431plq.182.2023.06.06.05.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:31:32 -0700 (PDT)
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
Subject: [PATCH 2/3] MAINTAINERS: Add entry for MHI networking drivers under MHI bus
Date: Tue,  6 Jun 2023 18:01:18 +0530
Message-Id: <20230606123119.57499-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
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

