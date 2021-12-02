Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4482C82
	for <mhi@lists.linux.dev>; Thu,  2 Dec 2021 11:37:33 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id n85so27613787pfd.10
        for <mhi@lists.linux.dev>; Thu, 02 Dec 2021 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H21OUa75Sn+QpTK/F/M/qnvZo747X4niCGMgpEDxUDA=;
        b=EYcUHStjptlCVAMQRk7zAyogtzw9/aY5nIzVE/9STvT/c0OHxdGd9NqmJsmaJmQxp2
         8VfyJV+p9Kx8dgezp4NKEDmj23l3dSBdFIhmZsCHxgk28+7awbLl07JmCjMxmb7y5hA6
         7deFF03dgQXs58d+irRTaGsp9/N6eKKw/jC1lV7jZ+DWgC2dgUsBGz0UrDr1y/mewF2G
         dxBAJj13rjjvNolhFOO7WZw60/4wJl5L4Ho9hkQ/j4K8ptmfSE9ah9Kw/UugAn7cqbHt
         f0Ct+st9Y9XOanCKQ8TEAU89986S6nvQvTdcxV4TQPkwJja1L6Wj+ZqoQ/m0O52Io7xq
         p13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H21OUa75Sn+QpTK/F/M/qnvZo747X4niCGMgpEDxUDA=;
        b=IkR1wwsZOAZbw97qxTxRMcVWrTsg1i/0klCkLSTT78Dx5kMiweUA5S7OjKl83LIO5O
         klYkrOnaDryklHNYI9Udo6j1YFtzrp/0cHSIz9j6oCSxpURV4/q0u0qjy+uV/Z+ehHl0
         579XDCg/i5z9q4Qq7fz0P70GyQEQljy+5/VFZ3TiD0UvmwsHcAqysQKQQWWuX4B3TEu0
         PnsC8tQZW2wsDSrq8MBiPVeVXpSPZDCywoxFliyhdJR1LERdKJLxGNNcCcK3DlGhq+oQ
         z2ygkHeefDJgqEGXbCS9Cv776pgCrNcXsR61yeev9gu4/20QLL6nlbCGq8H1eXRr8Cmv
         m7nA==
X-Gm-Message-State: AOAM533QnpVQqXlOjvEsRR01orhCIBvEYJoXQ4AP+5q3j5ufGflQViR/
	CmnsPeOyWh0nAz0NnNcMBiLVEKinRHMI
X-Google-Smtp-Source: ABdhPJwGDMNqxXATDFp2XhvgapmPmdtDl8bTVvg0ZhYSw/2f5rApkNt327ZLFq1/aN/vZohG9h008A==
X-Received: by 2002:a05:6a00:b49:b0:49f:c8e0:51ff with SMTP id p9-20020a056a000b4900b0049fc8e051ffmr11735336pfo.36.1638445052403;
        Thu, 02 Dec 2021 03:37:32 -0800 (PST)
Received: from localhost.localdomain ([117.202.184.5])
        by smtp.gmail.com with ESMTPSA id h5sm3602552pfi.46.2021.12.02.03.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:37:31 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	skananth@codeaurora.org,
	vpernami@codeaurora.org,
	vbadigan@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/20] bus: mhi: ep: Add support for creating and destroying MHI EP devices
Date: Thu,  2 Dec 2021 17:05:39 +0530
Message-Id: <20211202113553.238011-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for creating and destroying MHI endpoint devices.
The MHI endpoint devices binds to the MHI endpoint channels and are used
to transfer data between MHI host and endpoint device.

There is a single MHI EP device for each channel pair. The devices will be
created when the corresponding channels has been started by the host and
will be destroyed during MHI EP power down and reset.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 85 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index ce0f99f22058..f0b5f49db95a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -63,6 +63,91 @@ static struct mhi_ep_device *mhi_ep_alloc_device(struct mhi_ep_cntrl *mhi_cntrl)
 	return mhi_dev;
 }
 
+static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
+{
+	struct mhi_ep_device *mhi_dev;
+	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ch_id];
+	int ret;
+
+	mhi_dev = mhi_ep_alloc_device(mhi_cntrl);
+	if (IS_ERR(mhi_dev))
+		return PTR_ERR(mhi_dev);
+
+	mhi_dev->dev_type = MHI_DEVICE_XFER;
+
+	/* Configure primary channel */
+	if (mhi_chan->dir == DMA_TO_DEVICE) {
+		mhi_dev->ul_chan = mhi_chan;
+		mhi_dev->ul_chan_id = mhi_chan->chan;
+	} else {
+		mhi_dev->dl_chan = mhi_chan;
+		mhi_dev->dl_chan_id = mhi_chan->chan;
+	}
+
+	get_device(&mhi_dev->dev);
+	mhi_chan->mhi_dev = mhi_dev;
+
+	/* Configure secondary channel as well */
+	mhi_chan++;
+	if (mhi_chan->dir == DMA_TO_DEVICE) {
+		mhi_dev->ul_chan = mhi_chan;
+		mhi_dev->ul_chan_id = mhi_chan->chan;
+	} else {
+		mhi_dev->dl_chan = mhi_chan;
+		mhi_dev->dl_chan_id = mhi_chan->chan;
+	}
+
+	get_device(&mhi_dev->dev);
+	mhi_chan->mhi_dev = mhi_dev;
+
+	/* Channel name is same for both UL and DL */
+	mhi_dev->name = mhi_chan->name;
+	dev_set_name(&mhi_dev->dev, "%s_%s",
+		     dev_name(&mhi_cntrl->mhi_dev->dev),
+		     mhi_dev->name);
+
+	ret = device_add(&mhi_dev->dev);
+	if (ret)
+		put_device(&mhi_dev->dev);
+
+	return ret;
+}
+
+static int mhi_ep_destroy_device(struct device *dev, void *data)
+{
+	struct mhi_ep_device *mhi_dev;
+	struct mhi_ep_cntrl *mhi_cntrl;
+	struct mhi_ep_chan *ul_chan, *dl_chan;
+
+	if (dev->bus != &mhi_ep_bus_type)
+		return 0;
+
+	mhi_dev = to_mhi_ep_device(dev);
+	mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	/* Only destroy devices created for channels */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	ul_chan = mhi_dev->ul_chan;
+	dl_chan = mhi_dev->dl_chan;
+
+	if (ul_chan)
+		put_device(&ul_chan->mhi_dev->dev);
+
+	if (dl_chan)
+		put_device(&dl_chan->mhi_dev->dev);
+
+	dev_dbg(&mhi_cntrl->mhi_dev->dev, "Destroying device for chan:%s\n",
+		 mhi_dev->name);
+
+	/* Notify the client and remove the device from MHI bus */
+	device_del(dev);
+	put_device(dev);
+
+	return 0;
+}
+
 static int parse_ch_cfg(struct mhi_ep_cntrl *mhi_cntrl,
 			const struct mhi_ep_cntrl_config *config)
 {
-- 
2.25.1

