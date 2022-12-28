Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E37B1C07
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:17:32 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ge16so12970509pjb.5
        for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbuT81cTqrWb06I08YNk/QYGpUnIYQwfiUqfqhuTPAs=;
        b=JwkluDZyi7Hbk8sR9WvMw++RLfzCX9DprsV3tjkhS2dzv1yi7hfwIIdDLn2zDn+WMU
         zXSx2D7xPxtwGEPFtzUYkN7s+Z2rUHQGfnEckae/t0WEY9i9Cens7510/Q4frn+bq0Y4
         R4qgF86gnbPdO0DZQD0FODtGrIwqZzwXERjL3YpRvaLQEMHDtYBGMWkEigYpLp3Pqf7M
         Ffap7EyGYsRbUb08/5RNkuPLE8UKKZN/qnC66e00Hrtx+ElVMdBQaWfukcJqMczec70i
         S45NoYIx8YZCIx6JUzPTBO9Sa1PjT5kB9FOnLI2LTd8HSUkWv5wQAgmy3yxVZZDN28z6
         3+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbuT81cTqrWb06I08YNk/QYGpUnIYQwfiUqfqhuTPAs=;
        b=X+wK/YrKHo8SRMpdrSwd1mD3gyPtTfqDAVBVogOTTxn2+1WPjos4LZEJgLvRbnPG3D
         p08MzOeZtNikJAXZgmREPp0zWA4Gnmf6B7J96PwNOC+47riM46mPdDxRLwrBRylnalVg
         1/isU6LkHwNN+NBNi/41X6tYr5KDqEphw1IrIAJKhDd3DAxXxpsnmq9npaNppl4X/A48
         +/TKkOFNXR6Re1C4MlvKh7JPPLXp7nNKGxzDFoTyr8F9ACpDY4M+GgPlx6x0Ng67fvuL
         L6h+3xbaAWbPSCRzfQs/XkigJ/SgPeKZzmH45tRd2Pr9Ynt8FsV+kh3UIb4gw4Mg9cgW
         GS/g==
X-Gm-Message-State: AFqh2krYwd0kV27YUKo5snFaF4mzMWkP9yz5SLtet937rb+wsrL2R7N0
	EQCXirOrjakayB6Dvu7A7QwKtG6FCI18cA0=
X-Google-Smtp-Source: AMrXdXtGHOufEjAivRbcDgryAR6ZPswcvzR2crozMrc0bWmqfHtGbGBTW/roNQvygYIcdxVZ6G728g==
X-Received: by 2002:a17:902:be16:b0:188:f0eb:ce10 with SMTP id r22-20020a170902be1600b00188f0ebce10mr30387826pls.65.1672244251263;
        Wed, 28 Dec 2022 08:17:31 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/6] bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD cmd
Date: Wed, 28 Dec 2022 21:47:02 +0530
Message-Id: <20221228161704.255268-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
References: <20221228161704.255268-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug log incorrectly mentions that STOP command is received instead of
RESET command. Fix that.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 7d68b00bdbcf..0bce6610ebf1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -226,7 +226,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 		mutex_unlock(&mhi_chan->lock);
 		break;
 	case MHI_PKT_TYPE_RESET_CHAN_CMD:
-		dev_dbg(dev, "Received STOP command for channel (%u)\n", ch_id);
+		dev_dbg(dev, "Received RESET command for channel (%u)\n", ch_id);
 		if (!ch_ring->started) {
 			dev_err(dev, "Channel (%u) not opened\n", ch_id);
 			return -ENODEV;
-- 
2.25.1

