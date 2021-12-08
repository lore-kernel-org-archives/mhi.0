Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7902C9E
	for <mhi@lists.linux.dev>; Wed,  8 Dec 2021 08:57:44 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 133so1473406pgc.12
        for <mhi@lists.linux.dev>; Wed, 08 Dec 2021 00:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me9WYpu3noGP7R3Uc2V4qejvmKsuzQtp6WBHkL6JJ34=;
        b=a0P8vxp5qFAHEnKHmOGMQT6yYKt1f1YL0XbmxNtTF+S1sW523ENTwTLz4BgOnOyhna
         VeB1NKquPAcV4H/+yj9n0k90GyAYRgJWdWwxzUyno1sqpgJQrlxJmuxXUbVtJBvpYw71
         nEScK1bIAM7crMIJQRvRdhmUxvfNNS/cZzyHGEatuaG+sbDhw6ozH1UMv0m2Hy7C3LnV
         u6nH1nH9KB/9hhdg1h6oqkZ18n5iaNHiz4Zc5FxAMYvYmSZhwkUmOX5TecD8wMwb6pTD
         dPf9cf57dsBwutxmr5G3X/8GUsTzhVUuwxNKSSMfMSS0yF41SFLNcG3IUPbpTG4rgakR
         ba2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Me9WYpu3noGP7R3Uc2V4qejvmKsuzQtp6WBHkL6JJ34=;
        b=BHCRNhl9+IKDcrSI9Nr6rbp6P64hQq9USjBS4i24eaFeZrKifbQU7UW2PMFkAxd257
         6dZ0CPgMi3e9GbXjNbz/f54FZ7fX2NycTuwWG6TPn7HSA804TZok5qoYnlHpG9PuAF7P
         oPjqftdNF0aWjVhcsdH93e36rhV741RSSRZe3ondaaq2hs2JUDFy5i9sf5r9h3DxSQmk
         m/3Z7mjvvFgqf/wnvIM7Jz7NNejDGmIyYOtyCf6KCAX6pygjjo4H29tjCsshS9lnY+RQ
         ZUr1NJdA3L0tni6KcAypnLqYSfG2yn64OiJW2XiNyPeEy0VwRvXqSnVQuBR89fbylDnN
         NTsw==
X-Gm-Message-State: AOAM530GN7Con861NTcszZg2WGJxWNxnEEPrj4yCFXmXSGuJI+OZsZxv
	iHDwl1MGRxmUIAwwIRIUWkKI
X-Google-Smtp-Source: ABdhPJzVkFfiD7oa8U3/B1Kv9DliwmeX3DMinwAptexT8/Vy4Y1y05AK4GkZo3aV3yxvCEC0A05hzw==
X-Received: by 2002:a62:82c1:0:b0:4ae:db0e:bae1 with SMTP id w184-20020a6282c1000000b004aedb0ebae1mr4473369pfd.47.1638953864414;
        Wed, 08 Dec 2021 00:57:44 -0800 (PST)
Received: from localhost.localdomain ([117.202.189.59])
        by smtp.gmail.com with ESMTPSA id oa17sm2055470pjb.37.2021.12.08.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 00:57:43 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	kvalo@codeaurora.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/1] MHI fix for v5.16 - Take 2
Date: Wed,  8 Dec 2021 14:27:34 +0530
Message-Id: <20211208085735.196394-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here is the final MHI fix for the v5.16 cycle. Kalle reported a regression with
ath11k stack due to 020d3b26c07a, and that's been affecting multiple WLAN
products like QCA6390 and WCN6855. The regression doesn't let the device to
resume from suspend and that has been due to a firmware bug. The device goes
to a bad MHI state during suspend and that can be seen in the MHI state during
resume. But that doesn't seem to affect the functionality of the device as it
continues to work fine if we allow it to resume.

Ideally, this should be fixed in the firmware but as like most of the products
out in market, getting a firmware fix for this issue not doable. So we have to
workaround for it in the MHI stack by allowing it to resume irrespective of the
MHI state.

Since the fix patch also touches ath11k stack, Kalle has given his Ack so that
the patch can be taken via mhi/char-misc tree.

Thanks,
Mani

Loic Poulain (1):
  bus: mhi: core: Add support for forced PM resume

 drivers/bus/mhi/core/pm.c             | 10 +++++++---
 drivers/bus/mhi/pci_generic.c         |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
 include/linux/mhi.h                   |  3 ++-
 4 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.25.1

