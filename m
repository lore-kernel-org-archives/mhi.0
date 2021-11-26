Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF6C68
	for <mhi@lists.linux.dev>; Fri, 26 Nov 2021 10:50:15 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id m24so6428747pls.10
        for <mhi@lists.linux.dev>; Fri, 26 Nov 2021 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYO6p8Ym3f2IeVVBn3iVr/FscUdiGm+cfP8ZhmD9kTA=;
        b=TyeOJQCkZ4i872PO6edTvTypMVE4mJ3hI70Wq8sVdT2+CiRgXEGZWCkjfwQPVEoO4T
         EHu47NvnI/1/G6uZZDkUQbEFJzdL7na/NZEOfJ/pUwQrgTZua/gKOhWTSULaXs6OuLfK
         YXfEUXy4RJ+da1+7NG2yCSMs9vgNO8yEsIUyu/OJRydsc5yEtR9OboTuMTwO/G6rV712
         k+gqUkjM1okV35PL8wLQ39hbcVm9vvUElQFmx2jL2nKrlZLUOf0TkPhMM1e+cxNiK+gh
         Z3F4IY2tsyxIEC5mTtexzewzcxnTklp5FU0M51lckDYSZYBF9tk4+fDa/YN4nfPn8DcQ
         Y6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYO6p8Ym3f2IeVVBn3iVr/FscUdiGm+cfP8ZhmD9kTA=;
        b=DhYlHYH3RxcUdy6EI4DINPCVbz5NVLbzBJMhIfYmJslzcemBBEs/xJU55HzijhwmLg
         du4FDO1jdtHjMUDyh4uBPm+/6kH36mWC8M/fy28CmgvLOEb4VW71qad6PhxfasKpzf9/
         JsIWHLGQh2v6cGLa9Asg6AT0eGHhjCk3VfY8fsJzUy/JzV3ZvDwvXjiFLAuLndPDmjmm
         2s7dXLqpKY5pqasgn+31/U+n36jB+EgjI6KX4d65EnR2ihOYX0wn4NpjfBnxkYZTFfSH
         5CLu0uQD5s8KaWsHXASasD1eG8yWXj9AFBX5cIzYEYvwMwPBbkjsNOQfkWfNhrk3RAT7
         msfg==
X-Gm-Message-State: AOAM530d28eCONb4g3j5ygTz/4x5AoGtvk5w59AngUve9BuQdNGIDn2p
	x04vV7B7ZVurhV2TTzjxIfJRFCqOEBPq
X-Google-Smtp-Source: ABdhPJxLfqswKQnt0W5ILuWZXp5OFhCazDu8Z1JO8uPVhvpQcq8kMmias595kKwl5/xR+psE29/GlA==
X-Received: by 2002:a17:90b:1e49:: with SMTP id pi9mr14607601pjb.220.1637923815369;
        Fri, 26 Nov 2021 02:50:15 -0800 (PST)
Received: from localhost.localdomain ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id 95sm5277452pjo.2.2021.11.26.02.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 02:50:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	slark_xiao@163.com,
	linux-arm-msm@vger.kernel.org,
	hemantk@codeaurora.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/1] MHI fixes for v5.16
Date: Fri, 26 Nov 2021 16:19:50 +0530
Message-Id: <20211126104951.35685-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here is a single MHI fix patch for 5.16 release. This patch fixes reset issue
with Foxconn T99W175 modems due to very short recovery time in pci_generic MHI
controller driver.

Please consider applying!

Thanks,
Mani

Slark Xiao (1):
  bus: mhi: pci_generic: Fix device recovery failed issue

 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1

