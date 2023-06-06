Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF622A9E7
	for <mhi@lists.linux.dev>; Tue,  6 Jun 2023 12:31:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b0424c5137so52381115ad.1
        for <mhi@lists.linux.dev>; Tue, 06 Jun 2023 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686054686; x=1688646686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnSMPv17DxTIc0EApfFv62sMiPCzQPBGurL8DNcMIjg=;
        b=ED5wHJmn8ZLA4iS49IErYUL2x+RV79G+ND9qTHeNJbgfhZx7HbbumKO2Om+e9nia4V
         yLaa3ju2IQyNwjbRagoYWRS8/l4YVdjaaw6ihstAhHGdELxqy6r+TLRL2ywnhZciz3KV
         GnAEUMWUEEL21U3AJweaap5Ejp07h7T8TlbdcFl6CRQX7Wm+mscilpdpQLlPOBqMlPo2
         MriRTlfdFH7X8ZHh1SrhCrNNIG5XlOO7DgaBK4BKLkHnI6MIfD5pNEhzYAvNO3ANhGE6
         DtvXj5S0QGMn1naH/1ZH9yW9pz5Ug+gFXZ/hzfvymwHBZWUwoCGvIUxnaDAe+7MtLYqL
         JSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054686; x=1688646686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnSMPv17DxTIc0EApfFv62sMiPCzQPBGurL8DNcMIjg=;
        b=WHebNAUziaak7/ooEyCDx/9Y2NR9E4j5AcY1qsF8r+Q/H4dYoTV5m5z1XNOLarZxz7
         lwTX2sT1JV/g+cR8Jlpn0X7TurCrRPY/atzNOWGWeiQYMPL6RpNVd0Cmw9EQ4VTKJmLt
         MADT5fs391CW2fIXzKBTNZLcEE5FUC9UAVyKHN1SnkNA+nsWasbzBDGDsyQ2VUKSPqJh
         fLzVxCQhuEnTqDckZmyx4aazh6Q0dNelZwyPiVY6hDGLCdF9bNAYhGYUQe3n30Zk3Vj8
         dgUTjcudDuW5eC67yH2of7aFunZnNINI9xkqgwXAxmwlLwJIHSo/AaYoHUNHWegx5X/9
         s0lA==
X-Gm-Message-State: AC+VfDwSXNE+SaFionvZRWxZBWTvju2JkQ+VZPW2v86eCxEKJai34MJP
	RM7/TvziGDqBRsdOjCv3ilbH
X-Google-Smtp-Source: ACHHUZ5LRdxhkL8Kk+RGl8CqeDCwiNOHqL0Cxwey/pXI4lj1u2B/gUi3CJwfcNE/jc4Z0yeasnVUKw==
X-Received: by 2002:a17:903:22c3:b0:1b0:3df1:c293 with SMTP id y3-20020a17090322c300b001b03df1c293mr2206016plg.45.1686054686649;
        Tue, 06 Jun 2023 05:31:26 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.178])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902c74500b001ae59169f05sm8446431plq.182.2023.06.06.05.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:31:26 -0700 (PDT)
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
Subject: [PATCH 0/3] Add MHI Endpoint network driver
Date: Tue,  6 Jun 2023 18:01:16 +0530
Message-Id: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds a network driver for the Modem Host Interface (MHI) endpoint
devices that provides network interfaces to the PCIe based Qualcomm endpoint
devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
devices to establish IP communication with the host machines (x86, ARM64) over
MHI bus.

On the host side, the existing mhi_net driver provides the network connectivity
to the host.

- Mani

Manivannan Sadhasivam (3):
  net: Add MHI Endpoint network driver
  MAINTAINERS: Add entry for MHI networking drivers under MHI bus
  net: mhi: Increase the default MTU from 16K to 32K

 MAINTAINERS              |   1 +
 drivers/net/Kconfig      |   9 ++
 drivers/net/Makefile     |   1 +
 drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
 drivers/net/mhi_net.c    |   2 +-
 5 files changed, 343 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/mhi_ep_net.c


base-commit: ae91f7e436f8b631c47e244b892ecac62a4d9430
-- 
2.25.1

