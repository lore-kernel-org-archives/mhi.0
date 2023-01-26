Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416381FAC
	for <mhi@lists.linux.dev>; Thu, 26 Jan 2023 09:29:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q10so1111887wrm.4
        for <mhi@lists.linux.dev>; Thu, 26 Jan 2023 01:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TMGf0x6Yj1FSsXabSbdX1Eb3jJ9xtPHTfrzgF7BXbM=;
        b=Z/LwmRDVP2Z01bmql6t+8rD5RN+E4ElNyGI+HN7i1RsXrokHBqZDly19xfnLfZuyK9
         WeHLimaxuQnpirzi6fsRffYTgPhfeXeVobZN4pxh8slmzePsLin85mhjgTEVnXMYb3eD
         d+7innz7fd+KKCCYqlxUId0YRmBbBA2wWvVT/4DwksnhpsiS0jw7etJ4akdgnyOyV3S/
         va+dnKtYWMYoZoqG3+bnW7Ke6FU1H7WwUzza3MwzVh5eP9ilmsnCZCu52v0/yeTr3yeB
         OQO3ilbuh4m5kUGai2/7I8kS7k3W/eo+E7fqQA0AgbfpOeTIZifPIKbBJyXLcXbVrwNM
         F2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TMGf0x6Yj1FSsXabSbdX1Eb3jJ9xtPHTfrzgF7BXbM=;
        b=ni6m1GGTmkQy62VyQEPIs0PzWdjUpVxzrndriVmNDzC9BXzn36mIXn1DFwY7wR2aRq
         Gf8i0UMC1+eOJM2b5wSW4CxC7LJ22Ou2fNX4FdlZjj2FyaS265ta3AXFeYeFXrJpqGqZ
         o2HGeA0kQpXmm/2/fRLktxJMvbmhQlVwiaQh1VIPGkrTyUzjTjlkOG1DTyy/YWF1E+P9
         gVdMCc+TQ2fDgB6AzwOBbqieK9wg09Yq6dAa5fh8f5DBLDUA7l20wX3klVPUK6gyJI4F
         9Mq5huwGRFTuka8JcjAEdRuSwOAQL+GdaX0XRswBVme949fuQCdl7r/o8ysw+RK14YjX
         7JBw==
X-Gm-Message-State: AO0yUKW7mPUKOD2Q+cGFwCB3hEIba/B6c2PuspUjYfYv6Vd76i4FFb3z
	UKoPlAQer/movjf95LJs2eU=
X-Google-Smtp-Source: AK7set8YapJdyyMzZYPyaW5m8mk0iBf7Sf+RNWhXX9zD2B3BOK4diZmPVtm63Vv6D3DY8DFjyPYg0Q==
X-Received: by 2002:a5d:6e05:0:b0:2bf:b92b:8a8a with SMTP id h5-20020a5d6e05000000b002bfb92b8a8amr4837241wrz.7.1674725353522;
        Thu, 26 Jan 2023 01:29:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t4-20020a05600001c400b002bdcce37d31sm873136wrx.99.2023.01.26.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 01:29:13 -0800 (PST)
Date: Thu, 26 Jan 2023 12:29:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Alex Elder <elder@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Fix off by one in  mhi_ep_process_cmd_ring()
Message-ID: <Y9JH5sudiZWvbODv@kili>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The > comparison should be changed to >= to prevent an out of bounds
access into the mhi_cntrl->mhi_chan[] array.  The mhi_cntrl->mhi_chan[]
array is allocated in mhi_ep_chan_init() and has mhi_cntrl->max_chan
elements.

Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index bcaaba97ef63..be2d56e7f392 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -125,7 +125,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 	ch_id = MHI_TRE_GET_CMD_CHID(el);
 
 	/* Check if the channel is supported by the controller */
-	if ((ch_id > mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
+	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
 		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
 		return -ENODEV;
 	}
-- 
2.35.1

