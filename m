Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC48017D3
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 10:41:52 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id k1so3540194pll.4
        for <mhi@lists.linux.dev>; Mon, 02 May 2022 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6Rnw46tJ5c8TR1VH8c4HYYn4D03M2nHnAjzUXe5flU=;
        b=Pjh9MgqoFCWgam7pbQq637Hxn3x2ZC0hKooYXRjuuTbn5yQ7/kxKf8F24mJbZ3q/HM
         ukCCI6nYrzsGtJ5Ix6j6vsOKgG16OAzrD7H19+FAbI+D/wCakEuhDUaVLRB0c/ipLCpB
         M+qADP0jKkXABJzJhfldb5yS8XY7toT4iHKCUTdZhqXkJYPXUNls9NC9mLo+Xw8DGkV9
         z2sdCnW9v8kPNMa9EKnJQR+4JVZo11Fho3Lxqaei20V69OUFL3OhuoMMqNwePJ5cpqV4
         RUPfWfkI/V2Pyl+SJcR5Arhqdsg7R8AONJV4N4qr3TLak40Rl4NkxaHLehZ1K2bZcLG8
         wqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6Rnw46tJ5c8TR1VH8c4HYYn4D03M2nHnAjzUXe5flU=;
        b=5kXoGotJAyMtQJXUVGo3Lo7nC49vG4Cw0nocqOFnc0dA0BJhZHHW4NsRCF79DEGOtc
         KVaiY6IUZYtRWS/+zPoBI6s9wg9o3U6ILpuwaPqHRwGT8Wz49A98O3CgRdEVqZMRjPhV
         4Mbvx/h7CMYSqhaFEdoX2qgSBoCV6iqdAxnXIdx6YT4l14bxgM5GBKbPnpn5sD27Qm7G
         7iug9cwWQmNr42uyRmhQpkbpfsQXwTEKGLXndRZgYLTqxTvkUORf7aI0ReTSkj0uebl1
         g3wCZhOXCMnpbqod/Xmf2mkwckkhxI1BiK9JN0ufnXIXIxMAFknXTb4to3naR8R4rkfm
         NQ1A==
X-Gm-Message-State: AOAM533EJQv85h2HfNsCjM3iBqwrACA7JaXz4MlL7crMW8TfLWVd0Oef
	7E7FjdCN53rgho9VG+5clxfIzfte5gqP
X-Google-Smtp-Source: ABdhPJwAs8+H3r7smNJ+ixQ2yCIe61zHgAhL1t7EBRsXyLhMAbzuX4wAz4gQxsVHn/Tux9b0w9j4Dg==
X-Received: by 2002:a17:902:8d8e:b0:159:4f6:c4aa with SMTP id v14-20020a1709028d8e00b0015904f6c4aamr11199720plo.115.1651488111837;
        Mon, 02 May 2022 03:41:51 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:41:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] MHI host cleanups
Date: Mon,  2 May 2022 16:11:39 +0530
Message-Id: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series has few cleanups to the MHI host stack. Apart from the cleanups,
patch (5/5) removes the redundant dma_wmb() from mhi_ring_chan_db() function.
I've provided the reasoning in the commit message, if my understanding is wrong
please let me know.

Thanks,
Mani

Manivannan Sadhasivam (5):
  bus: mhi: host: Rename process_db callback to ring_db
  bus: mhi: host: Rename mhi_db_brstmode() and mhi_db_brstmode_disable()
  bus: mhi: host: Use {READ/WITE}_ONCE macros for db_mode and db_val
  bus: mhi: host: Rename parse_{rsc/xfer}_event to
    process{rsc/xfer}_event
  bus: mhi: host: Remove redundant dma_wmb() before ctx wp update

 drivers/bus/mhi/host/init.c     | 12 +++++------
 drivers/bus/mhi/host/internal.h |  6 +++---
 drivers/bus/mhi/host/main.c     | 37 ++++++++++++++++-----------------
 3 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.25.1

