Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0FF2CA4
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 08:13:37 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y7so18891248plp.0
        for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 00:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxZwgNBumLHqXO+2gnKFYa6p15JpU/b4UvoM1L0jYYQ=;
        b=jEMZloFE35t3CKK9Q1XULRGALD0dQREkLaOh7FGrNslUiLggkSo+jnOg3w9HuvbcrZ
         1AHTAwrUGRie+jK3GXWuyBb3P8wSk3rTI4CatI0Lb8ttohSHCE/mtHW5NfQgbJSctVuO
         J1Jvv8Eo8oST1ffnNxcGaoWEciXBWRHhAvRB1pyV/QzhSn+sgXlKqBLQ3SrZT5vnzDPw
         uzE4rZEBFWmk2O17DwJH7QAIOdtVRDkGaO2EJq2TTQ48WHLawG/rjCi+wDdlVXcZgZBF
         LatkyxHKOx7YFGfa8PYIlu+CZHimVvZ/ica+0bDLG5Bg1VNUg9aR9Nfqszfeion8uuMX
         clOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxZwgNBumLHqXO+2gnKFYa6p15JpU/b4UvoM1L0jYYQ=;
        b=gOARnErfeACdUctzjpLk3l2E37golNrWeZQC31GhqmjGpv2CpSal2Nnc4QkJeYDhaj
         01Txz2wFE1q3sxXuty+Zd9at4nriTdFa9xMBXxnTVodzSRBFRAgKAQSVYcmAhYOinj1u
         mpWG0ta54WbfxWdz5RKAHm1FlLSqHTHOZXv0cGHQV1srcwJ3l/131104kbfM1rLjiVVq
         XxCKdSGYSTPfLMj//xNWC/jvV7VxRv4bKNh7thl2qrJZK3itGuRy0n27hVHhgGYsbhwG
         wzctGkvbWlURGhWBToJv4x1RXmvFr09bmpyxssOP4+1HTjK7Has7nnuRSglpbvDwPNih
         QvkA==
X-Gm-Message-State: AOAM533ocjC+9F4b4onA9VjmSNG/3F4M0F8Kl2lGf/pNYJ6O582bhtqT
	hm59TKKhDNC0xjZffRcWtjwZ
X-Google-Smtp-Source: ABdhPJxMap+dqOqwRpoo82JM7xEAD+1B483j3epvQBrDNW6ieQt84qKgjC3fi4v5xAP5aNs9Md3huA==
X-Received: by 2002:a17:90b:1e04:: with SMTP id pg4mr4654111pjb.38.1639642416629;
        Thu, 16 Dec 2021 00:13:36 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:13:36 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	thomas.perrot@bootlin.com,
	aleksander@aleksander.es,
	slark_xiao@163.com,
	christophe.jaillet@wanadoo.fr,
	keescook@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/10] bus: mhi: core: Use correctly sized arguments for bit field
Date: Thu, 16 Dec 2021 13:42:26 +0530
Message-Id: <20211216081227.237749-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
References: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kees Cook <keescook@chromium.org>

The find.h APIs are designed to be used only on unsigned long arguments.
This can technically result in a over-read, but it is harmless in this
case. Regardless, fix it to avoid the warning seen under -Warray-bounds,
which we'd like to enable globally:

In file included from ./include/linux/bitmap.h:9,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/cpumask.h:5,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/processor.h:22,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:60,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:55,
                 from ./include/linux/wait.h:9,
                 from ./include/linux/wait_bit.h:8,
                 from ./include/linux/fs.h:6,
                 from ./include/linux/debugfs.h:15,
                 from drivers/bus/mhi/core/init.c:7:
drivers/bus/mhi/core/init.c: In function 'to_mhi_pm_state_str':
./include/linux/find.h:187:37: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'enum mhi_pm_state[1]' [-Warray-bounds]
  187 |                 unsigned long val = *addr & GENMASK(size - 1, 0);
      |                                     ^~~~~
drivers/bus/mhi/core/init.c:80:51: note: while referencing 'state'
   80 | const char *to_mhi_pm_state_str(enum mhi_pm_state state)
      |                                 ~~~~~~~~~~~~~~~~~~^~~~~

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/20211215232446.2069794-1-keescook@chromium.org
[mani: changed the variable name "bits" to "pm_state"]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f1ec34417592..046f407dc5d6 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -79,7 +79,8 @@ static const char * const mhi_pm_state_str[] = {
 
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
-	int index = find_last_bit((unsigned long *)&state, 32);
+	unsigned long pm_state = state;
+	int index = find_last_bit(&pm_state, 32);
 
 	if (index >= ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
-- 
2.25.1

