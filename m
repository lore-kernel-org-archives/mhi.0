Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B453BA
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 12:45:03 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id em10-20020a17090b014a00b001bc3071f921so14654536pjb.5
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 04:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qP2EzzC3I2IhCGQAXOgXpj1gBQ3j7ZCObf/XVIEWx3s=;
        b=JcEYpQ0zDJ3UIVbiXsaNDN4MMDXzrq5SiAQvpz2OPg3jfOOF9LovhRvXeWAsaGLYdP
         JdUm15Mv1D+sIDdhdCNHnndi6pZUx51tZrYcqYqEnASuXkTUYcyy8a1Z5+BiZe+p+3WI
         9X3gh7DqcSlBh+qJ8pfOenf2DFnU/cCFTiuEULnuTA//mJ+m8H4xLt1HSpIklFrktJW5
         UbXkVU/vBLutJtre56v0fVBcgBKL2bEnNjgu+w/ZxRCoP67mR/Kg6xu5XiCq3pvW1AIx
         204v8S6RGxeYrg/0d32laS01YoRe15FFlqNMUJpjU73MxVqs0BDII77OBy8GwVyNY2P1
         DIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qP2EzzC3I2IhCGQAXOgXpj1gBQ3j7ZCObf/XVIEWx3s=;
        b=hMuFOu3l9kVk3RTVmTQ+UzkdpFOs5H8CAmWQNPIfvysJdGERJqoz3DX0xMaEJxvhT6
         Fr1VQ995C0EfcCloEiJGvcHd03lb3GyJaDv4YRQOoYW2MEeSunsjSJaSdc9s85P3ly+2
         mFb1QBZeJK+/+t3fMd3RauclCL+8efMDrzyhE/9IPR7xB15HdJl7gJWgWeakHQ5uunkp
         ucx46ZZ+KuAGPp+4eg5yDhbKm5pGDPERVw/id1ciPx5Zjv/rPawmCMWKAhHrRPk1S444
         36FYmBr1p5tyv52v5RjgffBEqrRoFUCgWzv788+972yoZcj1v0N3hDfa6JyXden3G9xj
         ngig==
X-Gm-Message-State: AOAM530NHctdWKYVpCsGeGveJ8qome3ABbxadAhimurjApKlpgrvB+aa
	wE+eLKnsMnnKJXN6IQIMl1VNglCcanGS
X-Google-Smtp-Source: ABdhPJwQyVkL4rba7nSaauBpAv4yR7PSjssMkQdBhxxd7FmEclSVr8RcF8iY4jXsbH+e1ojm9DDGcQ==
X-Received: by 2002:a17:902:ccd2:b0:14f:8182:96c4 with SMTP id z18-20020a170902ccd200b0014f818296c4mr20717147ple.67.1646052302779;
        Mon, 28 Feb 2022 04:45:02 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:45:02 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 12/27] bus: mhi: ep: Add support for creating and destroying MHI EP devices
Date: Mon, 28 Feb 2022 18:13:29 +0530
Message-Id: <20220228124344.77359-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
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
 drivers/bus/mhi/ep/main.c | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 2bdcf1657479..3afae0bfd83c 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -68,6 +68,89 @@ static struct mhi_ep_device *mhi_ep_alloc_device(struct mhi_ep_cntrl *mhi_cntrl,
 	return mhi_dev;
 }
 
+/*
+ * MHI channels are always defined in pairs with UL as the even numbered
+ * channel and DL as odd numbered one. This function gets UL channel (primary)
+ * as the ch_id and always looks after the next entry in channel list for
+ * the corresponding DL channel (secondary).
+ */
+static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
+{
+	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ch_id];
+	struct device *dev = mhi_cntrl->cntrl_dev;
+	struct mhi_ep_device *mhi_dev;
+	int ret;
+
+	/* Check if the channel name is same for both UL and DL */
+	if (strcmp(mhi_chan->name, mhi_chan[1].name)) {
+		dev_err(dev, "UL and DL channel names are not same: (%s) != (%s)\n",
+			mhi_chan->name, mhi_chan[1].name);
+		return -EINVAL;
+	}
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
 static int mhi_ep_chan_init(struct mhi_ep_cntrl *mhi_cntrl,
 			    const struct mhi_ep_cntrl_config *config)
 {
-- 
2.25.1

