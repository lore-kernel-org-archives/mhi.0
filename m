Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33B1C07
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:17:16 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso16497184pjh.1
        for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUcPSGeQSyCQV+5RFes2Or9gqPhDpOlebNcO/R3D1CU=;
        b=kxfWZabu89t81jk2jvL8stxvjeLflrKxQXz2ozJNyxkF5MYc4q4n2AIrv2IZaCUAJb
         iG0kmZN/VOiV6NmWKK8U/5pPqr7DK5Q5ESWVUeZ6h5BC7yeyFPPqcCbx4qJw9Vewgr8Q
         +L0CXOnS4eOgzGrsfKTaLmdnrm2M+mk1P0aXnnjGyDqI3ipOi8p3hy9L+w5sd0y9FYDB
         +hW9cJaPTImgM40r7cE1AE4Ssgcjv6RXGfXGcjU7hzaI+1s2yxnOYAbxqbUGtUx5guNW
         /ZlhGlTJmUvKPSmRHiSRLJ02aE/cHWv6I1iMHRodAjyXAROugL+4F/APK9T9Dw//c0zS
         /CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUcPSGeQSyCQV+5RFes2Or9gqPhDpOlebNcO/R3D1CU=;
        b=24k4BrGT5nBA5yzhd5Ol03Xts5gFw7VJJC+cqgPNtknfSEHdbYH/4lk2EDDawQbb4c
         xZWYKfNueWjIOtaNGHJpFtESz2OqGs81aVHSlPfed9PX19yLV86tQFWhbQ8A1Mn+XwUJ
         kuZpPlaWiKp4tJGIX8Z0vXeXbIrEkNVtSPXrszv+nhMxQf2vJRbaqOfRq/j9MkldCdPN
         Tk22x2za+PQ4w0AbuDfRuM2/Neae9K0WhrDFQyFhNO4P9wayxGocde+67pfUu4xwDfAa
         33ENtV71G4u093XjMg7n9y5xUN06FDI9qBujP0MlB91O2IgYZXBE3AdI5vIAeyamM62m
         6pRw==
X-Gm-Message-State: AFqh2krGHx4Jcw7kHhmDLflF5rNmb1PP/Uu1lqgpJBs8Y/CSRXjfhja/
	q7dZclWMNRNLcso2QMI8bAIjk1GBkLvwHUE=
X-Google-Smtp-Source: AMrXdXtfcTlGv4bntW66iorHD9IAD2wtLmAxADop8o1iYxMOg8y49yKk51bJjKOVc0X02LM15lWJig==
X-Received: by 2002:a17:902:704a:b0:191:7d3:7fdd with SMTP id h10-20020a170902704a00b0019107d37fddmr42210555plt.60.1672244235781;
        Wed, 28 Dec 2022 08:17:15 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/6] MHI EP fixes and improvements
Date: Wed, 28 Dec 2022 21:46:58 +0530
Message-Id: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several issues on the MHI EP stack and also improves
the suspend and resume functionality.

Thanks,
Mani

Manivannan Sadhasivam (6):
  bus: mhi: ep: Power up/down MHI stack during MHI RESET
  bus: mhi: ep: Check if the channel is supported by the controller
  bus: mhi: ep: Only send -ENOTCONN status if client driver is available
  bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD
    cmd
  bus: mhi: ep: Move chan->lock to the start of processing queued ch
    ring
  bus: mhi: ep: Save channel state locally during suspend and resume

 drivers/bus/mhi/ep/main.c | 79 +++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 37 deletions(-)

-- 
2.25.1

