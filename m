Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533621ACB5
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 15:24:37 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b1806264e9so39188945ad.0
        for <mhi@lists.linux.dev>; Wed, 07 Jun 2023 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686151476; x=1688743476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=skpFX1nvdUsEf5JIjZnFK8alGwuwceGPnoOmzX+YgHU=;
        b=cDpNvxi9FBzqVAGVY796eJbBguJemD7B5gglGpbBlKjzEMrpCL8MLun/S+UbE1FAwg
         0YfaMZK6remIZFPeAF3wh2IOQ1HYY9lv4OCzQVXJoC4iGSrBnn4BWJ8kxrwxGyDJ/u0H
         XQi7nhIzZCeg9BiWQ04ZY3uIg5t9gvyLELfidoRbPA0vWKPeGsjZiSOmaPJkSLtttqJ+
         mJu51mCuAUc/+WOI4r3nFx+nTAMYV9Y5moUC1TEel+fz+7nMm5Zplio2Z57Km3PSjFsg
         clvxdq4YKE92/QvDrPpQWDs4HRZvFrbJRol6Rz+0+RgZXGvqWXz+F2KLBeM+VBB+DfCC
         VeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686151476; x=1688743476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skpFX1nvdUsEf5JIjZnFK8alGwuwceGPnoOmzX+YgHU=;
        b=U4kkN0UikI+ob3vVoBNPYeIYRRsv65ymUC10gTHT9WzCIPo58A3s9JdvvkBn80mGv6
         mRHAg56WhJq6Q4DAJqDDm4j9WrA8Ow4KF04WpGXKnlN1N5NsHMA6nZoBK0XN7v8c6L3o
         TuBrIJKjTTWpMI1pqduQlY3jIQ6MhZazidNbuOYN3CNgB4UUTd9zJZXYJPaNBs+p90d9
         yU9OOsIkBTBfq8tJ/GDv+XxYM5c87W/LN5yL8YZ86reUQftVwKcFGQraCpA0xttTPWyH
         JdbQCi+CnCYLPwBTfceJuu3ZvdmTrRFqE1hBcKrPeky0I58e46y6pgcpAVMmKjscdqHV
         EGVA==
X-Gm-Message-State: AC+VfDyrMSBZLAXXdAuavM3nd7CZ7jCHMNsPg7Uu7KZsyUgIJdIu8NwY
	QVOTnH9DRkL2vU0HoWwY9eE1
X-Google-Smtp-Source: ACHHUZ5zf5rAv1fKEXmFsQebOWqchgQba8hRDIpdEbSVGrI6EbcLNT1CTOXSId6xmx2MKgLO+9fWMw==
X-Received: by 2002:a17:902:db0e:b0:1ad:fc06:d7c0 with SMTP id m14-20020a170902db0e00b001adfc06d7c0mr2856601plx.1.1686151476521;
        Wed, 07 Jun 2023 08:24:36 -0700 (PDT)
Received: from localhost.localdomain ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902788500b001aaf536b1e3sm10590958pll.123.2023.06.07.08.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:24:36 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add MHI Endpoint network driver
Date: Wed,  7 Jun 2023 20:54:25 +0530
Message-Id: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
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

Changes in v2:

* Fixed kfree(skb) with kfree_skb(skb)
* Reworded the Kconfig text slightly
* Dropped the MTU increase patch as it turned out only few devices support 32K
  MTU

Manivannan Sadhasivam (2):
  net: Add MHI Endpoint network driver
  MAINTAINERS: Add entry for MHI networking drivers under MHI bus

 MAINTAINERS              |   1 +
 drivers/net/Kconfig      |   9 ++
 drivers/net/Makefile     |   1 +
 drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 342 insertions(+)
 create mode 100644 drivers/net/mhi_ep_net.c


base-commit: e7214663e023be5e518e8d0d8f2dca6848731652
-- 
2.25.1

