Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC57C
	for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 18:23:30 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id y5so21967676pfe.4
        for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 10:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ysuje3nEy8KvAdAcfcWxVoVzsgbCmUXoBnVe5XL9ZLI=;
        b=wPHLfGKLHFKi9xnbSoXzfIWPBKlHLJGYnt7UAa0QUROMkK6gLeTd3BcGYde9yoYHyv
         Sc83DVfbwgvKvQ2wZbPnqJMCFY0tHaV+FOgwuQ+kZkK8rStPD+5oibLMQd+pl1l3IG3r
         nhTNeaIhPWKuNvwUvEzHF6yPiWOoRvwTf3MvzDDjqcO3m94cIdD/ykI7i7zh6rrTzBVa
         UbyQHnI96fpSKQZ2fwlakFoZUouYXSHuto5U+fkoFWa1EYWVAiPcWyVq1T5zTRpAxsf0
         XK1OlRStUcpb9ZfjYXLzU4YFECQBOUyngMWv81FRosViehYyrUebh3WzBEl1zBW21bZ/
         mKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ysuje3nEy8KvAdAcfcWxVoVzsgbCmUXoBnVe5XL9ZLI=;
        b=a0RdgOWNadsA/gi7WhvgaoAOu5S3kAxh8LEpntHIxqYu8T8l5v+VHNaHMI0Kbw0ivg
         D4NojtUKgNCktJ3k/RU0LKSKDbKVvaQZ46cYdXq3K5+d2ppDSF6Cj5EEELtt6zbYDTEh
         OqX7AaJHaFqJudccNkaRWkXJXmY3+Gi8n3KBGNwEYuoMOO5bB0vukx+lrvZTDa7/RdXk
         qH01N9qO4ij3df+1JP5Ta66KhjeHbSH9/PCbAVwyEk3JF2/lEnlKQsoRA9TRDnicEFYz
         rh+2F72Efa+eefcAaJ4zRbYcQ+PtPa/dkwHmc11j7xqAyEeASOTdqLXb56nj6iDyB9V2
         CPfA==
X-Gm-Message-State: AOAM533NHMP8MH7quJ1ZUv+IPKpUMLiEGI0bxwiJuIeYwZdEhfsEb7PJ
	rJP+OkPu0anCtaD/I58VYcY/XiUBGCBOeAs=
X-Google-Smtp-Source: ABdhPJyZVCadrz2t/5hSZ935KMcv1E7SSSKtfPFkJ6xTWe0nbGfrM39zANDUveiLFxgDoKAFavC7yA==
X-Received: by 2002:a05:6a00:2490:: with SMTP id c16mr7060175pfv.67.1644690209534;
        Sat, 12 Feb 2022 10:23:29 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:23:29 -0800 (PST)
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
Subject: [PATCH v3 22/25] bus: mhi: ep: Add support for processing transfer ring
Date: Sat, 12 Feb 2022 23:51:14 +0530
Message-Id: <20220212182117.49438-23-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for processing the transfer ring from host. For the transfer
ring associated with DL channel, the xfer callback will simply invoked.
For the case of UL channel, the ring elements will be read in a buffer
till the write pointer and later passed to the client driver using the
xfer callback.

The client drivers should provide the callbacks for both UL and DL
channels during registration.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b937c6cda9ba..baf383a4857b 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -439,6 +439,55 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 	return 0;
 }
 
+int mhi_ep_process_tre_ring(struct mhi_ep_ring *ring, struct mhi_ep_ring_element *el)
+{
+	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
+	struct mhi_result result = {};
+	u32 len = MHI_EP_DEFAULT_MTU;
+	struct mhi_ep_chan *mhi_chan;
+	int ret;
+
+	mhi_chan = &mhi_cntrl->mhi_chan[ring->ch_id];
+
+	/*
+	 * Bail out if transfer callback is not registered for the channel.
+	 * This is most likely due to the client driver not loaded at this point.
+	 */
+	if (!mhi_chan->xfer_cb) {
+		dev_err(&mhi_chan->mhi_dev->dev, "Client driver not available\n");
+		return -ENODEV;
+	}
+
+	if (ring->ch_id % 2) {
+		/* DL channel */
+		result.dir = mhi_chan->dir;
+		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+	} else {
+		/* UL channel */
+		do {
+			result.buf_addr = kzalloc(len, GFP_KERNEL);
+			if (!result.buf_addr)
+				return -ENOMEM;
+
+			ret = mhi_ep_read_channel(mhi_cntrl, ring, &result, len);
+			if (ret < 0) {
+				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
+				kfree(result.buf_addr);
+				return ret;
+			}
+
+			result.dir = mhi_chan->dir;
+			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
+			kfree(result.buf_addr);
+			result.bytes_xferd = 0;
+
+			/* Read until the ring becomes empty */
+		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
+	}
+
+	return 0;
+}
+
 static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-- 
2.25.1

