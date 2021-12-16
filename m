Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A22CA4
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 08:13:42 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id k64so22977917pfd.11
        for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 00:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Abkw9MpZJDVgj/07ebB528CKEEcNXbkOFZr/WZxAfZQ=;
        b=UhBopMewwWO/L2FDJKLSvlmHuz1ZR1y1w2l9SJoi0yacgw97RM7gkzKmpTYhmbcYhz
         Vrcapj9393TYBWEzS5XX7eq1vUdI0ilGxjVQv0KGQiQejvJRHmSFv4o7BNU0WfL7I9wc
         4ORu+giosQYPeFT+46L0bJMy9XPezcs9DofjgiA/IkEZ5N+UJMNaORun6+Yq0HKSC5kj
         VpM4Z6VPYRyh6cFw9jSs1C1ejL1IOBp/ooleacSPsRxIn4bUdESkparVVAnzAiYCvXTw
         rwu3OvfUiKhC375gr/bWVrXZjtql2CUobPeH2GbqJOT0X7Q3E6eXCymUfre4xIqzsC3K
         b+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Abkw9MpZJDVgj/07ebB528CKEEcNXbkOFZr/WZxAfZQ=;
        b=PMdmKjDt9Z67iAmSAZYfQZXi+b/Lil+hi4cBqKLfy2dKVFR9Hutaoo2T3AH2Vqc80+
         Ca2D/2vUyq5Egt2wKD5lpXs46NbCwOz9RV/yGjLTFaLSzG2w4RmOgLF1DOMHKwJXyKYP
         nXyeSkrkk2pf8Re6qdPhRRMw9i2OOmnQRtz73AcoE76+oQgkU37uo1gCyaX/IMG5SjfF
         aPKeered2mktMGC7hawWCsXYhBBymq+2JV2mSEbLh4ZQo/e7lqvgAHl+O1LrmAikdG6w
         XDl7imVufzmhFx8EOxmEOf8MwGFOHUJMaJQsdYcYBfPzeiaTwL84xrlnRDQV+M9KiQc0
         KvaA==
X-Gm-Message-State: AOAM531BKTmhtetbtvcPA1ibmE1RL+lrEs12Q4s92pW05WfX4dcXjHcK
	mTlmdAnjmp9iftuaUXhnx0t8
X-Google-Smtp-Source: ABdhPJwux8mhduJxxxQTYn1hOULcyk0X2qXUvMCSXSzIK9j3ATjyNco6/rIJOpfoQ54yuZbBMAcauw==
X-Received: by 2002:a05:6a00:15c7:b0:49f:f48b:f96e with SMTP id o7-20020a056a0015c700b0049ff48bf96emr12888994pfu.65.1639642422021;
        Thu, 16 Dec 2021 00:13:42 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:13:41 -0800 (PST)
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
Subject: [PATCH 10/10] bus: mhi: pci_generic: Introduce Sierra EM919X support
Date: Thu, 16 Dec 2021 13:42:27 +0530
Message-Id: <20211216081227.237749-11-manivannan.sadhasivam@linaro.org>
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

From: Thomas Perrot <thomas.perrot@bootlin.com>

Add support for EM919X modems, this modem series is based on SDX55
qcom chip.

It is mandatory to use the same ring for control+data and diag events.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Tested-by: Aleksander Morgado <aleksander@aleksander.es>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/20211123081541.648426-1-thomas.perrot@bootlin.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 9ef41354237c..29607f7bc8da 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -403,7 +403,50 @@ static const struct mhi_pci_dev_info mhi_mv31_info = {
 	.dma_data_width = 32,
 };
 
+static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 256, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 128, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 128, 0),
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 512, 1),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
+};
+
+static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
+	/* first ring is control+data and DIAG ring */
+	MHI_EVENT_CONFIG_CTRL(0, 2048),
+	/* Hardware channels request dedicated hardware event rings */
+	MHI_EVENT_CONFIG_HW_DATA(1, 2048, 100),
+	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
+};
+
+static const struct mhi_controller_config modem_sierra_em919x_config = {
+	.max_channels = 128,
+	.timeout_ms = 24000,
+	.num_channels = ARRAY_SIZE(mhi_sierra_em919x_channels),
+	.ch_cfg = mhi_sierra_em919x_channels,
+	.num_events = ARRAY_SIZE(modem_sierra_em919x_mhi_events),
+	.event_cfg = modem_sierra_em919x_mhi_events,
+};
+
+static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
+	.name = "sierra-em919x",
+	.config = &modem_sierra_em919x_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+};
+
 static const struct pci_device_id mhi_pci_id_table[] = {
+	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
+		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-- 
2.25.1

