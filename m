Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77452F2B
	for <mhi@lists.linux.dev>; Wed,  9 Feb 2022 10:06:07 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso4600615pjt.4
        for <mhi@lists.linux.dev>; Wed, 09 Feb 2022 02:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ouITQk3JWyKLA4aS9Z1TEhHxLU1dm/dFTurUA0AndPg=;
        b=UL+o/DvQlKxzuSAnlH45X8P/kXtoX+CBk8xBIozdnL423GtmVuNOTebXw+TlDXyIGE
         Y+BTX9+6AhPyqMYYHDIJ+y/fytCbGgAt7h3fMwpQhgKUGfhWwahDBdULQWQfTeU+KBBG
         jDdxOnzRBaLVfDKVb2dfe9u5Y+XteRZKYIPOGlNyrPKoQxjvBJTNhEtZ3bLCzlVO0jVE
         PVZN2/y6GgSIaczy8nTcd2Myz+L+/RpZ4rq0v2+3CIzBeYOrjIjQO21rpKNhR9qp+sxZ
         74OXyeLXWpTnffru5BOlgcy1d3Vxv+21YAhOJ/IGbHz7PdF29R1PPGMRDxapqgl61yZ9
         I5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ouITQk3JWyKLA4aS9Z1TEhHxLU1dm/dFTurUA0AndPg=;
        b=gorbKC7zCYcAh/q0C3e/0JbozGgUgF0bmsoJ4WB8e3TltiKbYaWIZbOXFcH/ZUY9YJ
         pCCiU8jP9tIBnuomZ6m+SXQfMETZ9AurCQkCZBm2BXAhPSDNO9yXo+dQkmgNxcG70kZR
         7/xjWxEbBu7sD/7CaT7yBvhnr5ZZ5b7IfZkaH9EFSxooVEMC129/yq5btDcKx/6/W2ty
         8WwqMiiNuYePX5/2k+bssgl5vLJYP+kMnOHg3LyIGoTRNIQaaBDeRK1vAIlFgyseu8vG
         M+Wrg9DF/GrK49MLiDiQrd87vu1QG/Yl4a5PG375Y1VKcbKk9eNS8taFpNFSh6OHBGwL
         ShwQ==
X-Gm-Message-State: AOAM531nFAdsOtkU9bYyXW+JU9tHZ9uETJJDmdGKpOXrLarNvPyCBC8B
	KIBkViRwQV4h+pZF17vCqn3Pe6PA5/UpW5s=
X-Google-Smtp-Source: ABdhPJyWsoo7CRjGKHatmNzGiFBVnODdOxleSOYlij1KI1nkyCyfUgkW6mIFfmojQhUo+PFckZemtA==
X-Received: by 2002:a17:903:2412:: with SMTP id e18mr1482964plo.74.1644401167158;
        Wed, 09 Feb 2022 02:06:07 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id p2sm6722024pfo.125.2022.02.09.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 02:06:06 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	vbadigan@codeaurora.org,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 10/23] bus: mhi: ep: Add support for creating and destroying MHI EP devices
Date: Wed,  9 Feb 2022 15:26:11 +0530
Message-Id: <20220209095624.26389-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
References: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
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
 drivers/bus/mhi/ep/main.c | 77 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index de7d52d15da4..f1241b935bbc 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -67,6 +67,83 @@ static struct mhi_ep_device *mhi_ep_alloc_device(struct mhi_ep_cntrl *mhi_cntrl,
 	return mhi_dev;
 }
 
+/*
+ * MHI channels are always defined in pairs with UL as the even numbered
+ * channel and DL as odd numbered one.
+ */
+static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
+{
+	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ch_id];
+	struct mhi_ep_device *mhi_dev;
+	int ret;
+
+	/* Check if the channel name is same for both UL and DL */
+	if (strcmp(mhi_chan->name, mhi_chan[1].name))
+		return -EINVAL;
+
+	mhi_dev = mhi_ep_alloc_device(mhi_cntrl, MHI_DEVICE_XFER);
+	if (IS_ERR(mhi_dev))
+		return PTR_ERR(mhi_dev);
+
+	/* Configure primary channel */
+	mhi_dev->ul_chan = mhi_chan;
+	get_device(&mhi_dev->dev);
+	mhi_chan->mhi_dev = mhi_dev;
+
+	/* Configure secondary channel as well */
+	mhi_chan++;
+	mhi_dev->dl_chan = mhi_chan;
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

