Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E457A
	for <mhi@lists.linux.dev>; Mon,  4 Apr 2022 06:41:56 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id n8so367926plh.1
        for <mhi@lists.linux.dev>; Sun, 03 Apr 2022 23:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H3W01VymVDs0COr3eR7ZYNGagSlCtWPeaS90Ia+pCnQ=;
        b=HmEsVfgq0A+7eOcB4BnudSM7EvSYxXpV7awtlzzAS/97TEqDO4nNv0HepfTATpopCz
         dq1bSwgpNc3qhSPWhHq+6hyf3tV8MhCTF78n7WY/VDrRUx38rBcRaXMwSIe6hkiuqnP2
         JFUnwQrcoG1VUUKZBNCn0TzuA/ssNfym6bM36RTObsjR42VGiBHolgZbBy/FpCanenu+
         XlI7Lh27mkx0moVPP4QfN8CMukMmhxdKm3yytkz9wKEsxr8nejdLAy35lMNMSM0D5CsA
         Sa5YnbABfEVK57peEKUX9NDSJvwEYQBC6D/kpyDQqb4neYN0SUdxnYSoWvzYe/3Qic5V
         zpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H3W01VymVDs0COr3eR7ZYNGagSlCtWPeaS90Ia+pCnQ=;
        b=RvpuQMFcujNXRsSslV43JNkgSbyNOiAFXUB1auILfp98hD4PDRDk3Vjn/5M88RthC8
         2JHttPgh+6bo9cDRVDABelZO2J/3XvZbKEW95+AEwRo/6/VpfE/JOjlBqjK5FYgZ45v2
         d9nIKfJSMDqDnha8rzutMohdi3UwHyPZt3WRA1Anvj6Uruw5BKasXWGdGeRwkkqu2kYp
         mZofqs9h/QJWrC4WYFXIIo1V+9qRIKoQ/NaVeZyaytd0IuGxzbH+Ho/ceqKImzzfM66N
         bi42Pz8bvhhsDbMD5/m9WvcZ68FJx5dVhykI5TGnOO0uoaC5BAbxkeRIdaDNHOf7yje9
         kTYg==
X-Gm-Message-State: AOAM5315vQ27sF193U60iIqhGaW8kXr+0eb2NkaN6tAg4MsRH7GKA4HU
	lf4DM8r510vGDiSyQhpq11yzUKxUiWk4
X-Google-Smtp-Source: ABdhPJxn6ub5ARRtRWc9EBKVEVPL2IlboiXysb8PEsNqUNtyfewDC/cWlFq219J0f/+ZB3ZkxuiX3A==
X-Received: by 2002:a17:90a:8c2:b0:1ca:a4a3:6833 with SMTP id 2-20020a17090a08c200b001caa4a36833mr2954493pjn.161.1649054515977;
        Sun, 03 Apr 2022 23:41:55 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.184])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004f1111c66afsm11637442pfl.148.2022.04.03.23.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 23:41:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: Add missing poweroff() PM callback
Date: Mon,  4 Apr 2022 12:11:49 +0530
Message-Id: <20220404064149.59634-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During hibernation process, once thaw() stage completes, the MHI endpoint
devices will be in M0 state post recovery. After that, the devices will be
powered down so that the system can enter the target sleep state. During
this stage, the PCI core will put the devices in D3hot. But this transition
is allowed by the MHI spec. The devices can only enter D3hot when it is in
M3 state.

So for fixing this issue, let's add the poweroff() callback that will get
executed before putting the system in target sleep state during
hibernation. This callback will put the device in M3 state and that would
allow it to receive the D3hot afterwards.

Cc: stable@vger.kernel.org
Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
Reported-by: Hemant Kumar <quic_hemantk@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9527b7d63840..b1c0a8887496 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1085,6 +1085,7 @@ static const struct dev_pm_ops mhi_pci_pm_ops = {
 	.resume = mhi_pci_resume,
 	.freeze = mhi_pci_freeze,
 	.thaw = mhi_pci_restore,
+	.poweroff = mhi_pci_suspend,
 	.restore = mhi_pci_restore,
 #endif
 };
-- 
2.25.1

