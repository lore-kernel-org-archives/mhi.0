Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF02C82
	for <mhi@lists.linux.dev>; Sat, 16 Oct 2021 06:57:53 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id q5so10638036pgr.7
        for <mhi@lists.linux.dev>; Fri, 15 Oct 2021 23:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo4Wqb6VoTR0Zqbgv4qNbxaNAKZMu5PTucXP4Fkz5Xw=;
        b=wiCWwrstEMOa3ky455f7bzsx96QVi6p+Sxiq2WJJp4DnqG0sYM7q3/ZFz5/2nOXRAY
         139PNuKWpqNrkk0kie2xsWImiszGYp+QSWgwLINbWdbrNAczDd5gQ6bstpMC2pp5Axzd
         kJFTBTWY/fn6r96zFMeyJhyUR/BZLMOF2HDvul24hE5T9UBXhGfcD/v1imYT0wGAjh5v
         M/i8GyPZ1cNGSj2toAHidia8W2yfsFylHGNsrdwq35E5qNNTatFB05hVQLpakTGS+hRT
         I7Ll5fqPGvheWbsHIqB18wltDjdjis2WFj6oNHy31/hWG358e+aE96JifGJ++EIflkON
         KItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo4Wqb6VoTR0Zqbgv4qNbxaNAKZMu5PTucXP4Fkz5Xw=;
        b=e7JAo0aZ3hREWV+IeYByeyeavSRFrZmtz1nhAuETOmnznHDAY3EAW4xcP4+D7NcO3Y
         8QMmeq20xKZEsvUr43WFIgFBYd9zXP7FVR9PpVxk6cA1O6L5XSVKE/Ud5iY9BuhQ9alC
         OoGmOIEYd9ZDpQudE6VNrTflW9buQaf96gS/bPXgqWwUZLYnxpVRTMWjK/5gfpviFpO0
         0Kv9zelDlGYGYOSFTisjHlZmJriehh9Zu5osn4L7VGyvOrhShNZNFWHee9DlUL3SlBLb
         x9J7R1QrgTcSEVJmlRDcV/6765OnoWJMd0gyu6MYSbq/keNsh2siW7OqQOi8KioErF69
         lqfA==
X-Gm-Message-State: AOAM531brR1Z5z43ma7MISP1stfWPN8Azj4FeDOelvra54aOGQtgJP8M
	88dELrGEGYREL4w3hNgUHAxC
X-Google-Smtp-Source: ABdhPJwF6CIMG/7f/lK6ddQqBMRLsEU5RdJkeWvzgnlwhyyqyrgkvog5VeZ1p2Of/iKPVLAex10l5g==
X-Received: by 2002:a05:6a00:1354:b0:44c:eb65:8570 with SMTP id k20-20020a056a00135400b0044ceb658570mr16208917pfu.34.1634367472448;
        Fri, 15 Oct 2021 23:57:52 -0700 (PDT)
Received: from localhost.localdomain ([117.202.185.237])
        by smtp.gmail.com with ESMTPSA id a17sm7024253pfd.54.2021.10.15.23.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:57:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	wangqing@vivo.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] MHI patches for v5.16
Date: Sat, 16 Oct 2021 12:27:31 +0530
Message-Id: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here is the small series of MHI patches for v5.16 with summary below:

1. MHI got a dedicated mailing list in subspace server. Hence, updated the
MAINTAINERS entry adding it as the primary list.

2. A leftover patch from 5.15 PR that adds a dedicated flag to the MHI client
transfer APIs for inbound buffer allocation by the MHI stack. This is required
for some downlink channels like QRTR that depends on pre-allocated buffers.
Since the patch modifies the MHI client drivers under "net/", Ack has been
collected from the netdev maintainer.

3. Fixed up the coccicheck warning by using sysfs_emit instead of snprintf.

Please consider merging!

Thanks,
Mani

Loic Poulain (1):
  bus: mhi: Add inbound buffers allocation flag

Manivannan Sadhasivam (1):
  MAINTAINERS: Update the entry for MHI bus

Qing Wang (1):
  bus: mhi: replace snprintf in show functions with sysfs_emit

 MAINTAINERS                      | 3 ++-
 drivers/bus/mhi/core/init.c      | 2 +-
 drivers/bus/mhi/core/internal.h  | 2 +-
 drivers/bus/mhi/core/main.c      | 9 ++++++---
 drivers/net/mhi_net.c            | 2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c | 2 +-
 include/linux/mhi.h              | 7 ++++++-
 net/qrtr/mhi.c                   | 2 +-
 8 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.25.1

