Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C001C07
	for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 16:17:23 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id g16so6775979plq.12
        for <mhi@lists.linux.dev>; Wed, 28 Dec 2022 08:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTBEJ8Yt1F+qFY4dSzBFOLsJDCyD/sILn8NSazfFNCk=;
        b=dj/Ub+3kYN0/agt2gS0Famnp0N3dkHl3+FQoEtgK8tVZZmkz0cvmZhpxMoXa1eohso
         W/q7ffJ3CL2rdK75bB9J1pelQS2Gl7fVyTt/u6b0c2MzkYmsDpSLTJ+n5S/PkQMVpxpg
         W3tx3uGeOsiW3kipxMk+3R6nTT0sfKA0ROiAjB2bdYkF6U4xG1RWl8CKDDbnBLmgQu/n
         ACSEHvnEFfsHMdlRyJjvYR5Q2ywytVYCohuJfc9xu46q4Lyb2vvy+gNZ4T48sjPzEgg/
         ayNGNThqpMWVae/tFgumbIJFspGofWHAyjI7Q3rCIajcGJPV2nFAxsQnkr1zhMyVlz8H
         8Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTBEJ8Yt1F+qFY4dSzBFOLsJDCyD/sILn8NSazfFNCk=;
        b=y8F9Uo/zS+HuVWqppixlgMbIjfRrqu01OqYTIy9nTxHuNXoJa+u61nmrb/RHyWPYdf
         mlG5Le1mM43NH36iGlybO1tGdvXeoc+0n3zl6SIVhr2onZ4E4nmyO1Thf+8mbIkrbeJD
         ejxjFaKSpAiaoBsWCkYGZ/tAIqkrrAXU6KaJdZtmyHsVJZSMSu2FU27bNXke6SQz8XR/
         E+Hz94QZ/YsGhcSyjEF2X5lX3ev2qxhaRith/k2CfB9Zj0uuFuTQ1jLaRSN6KxwLDxCl
         ImemuidtlGdl/L2Ora8YjnyJx0356b80iW3qmWjSmygoikQEDUT5EPjc0bJ7veBU4pM4
         yGug==
X-Gm-Message-State: AFqh2kpKZRYDmI74Lh8vtBCjW89w9Oz3fj/veBh+J+5XAd/G34XUXsVc
	I5Zz0XoKiY1RjvnuZ/+y00hNT94rQHKH6Gs=
X-Google-Smtp-Source: AMrXdXur43RoXjvFIHa8mRXlYHujGDsIAt+jiccMI+o4799ciQu1Uvcdm1daRBtNgm7mnMYbOUdXaw==
X-Received: by 2002:a17:902:cecf:b0:191:191f:e7a7 with SMTP id d15-20020a170902cecf00b00191191fe7a7mr36963609plg.69.1672244242997;
        Wed, 28 Dec 2022 08:17:22 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.100])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm11256798pls.25.2022.12.28.08.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 08:17:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/6] bus: mhi: ep: Check if the channel is supported by the controller
Date: Wed, 28 Dec 2022 21:47:00 +0530
Message-Id: <20221228161704.255268-3-manivannan.sadhasivam@linaro.org>
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

Before processing the command ring for the channel, check if the channel is
supported by the controller or not.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 55209d42a995..8b065a3cc848 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -123,6 +123,13 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 	int ret;
 
 	ch_id = MHI_TRE_GET_CMD_CHID(el);
+
+	/* Check if the channel is supported by the controller */
+	if ((ch_id > mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
+		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
+		return -ENODEV;
+	}
+
 	mhi_chan = &mhi_cntrl->mhi_chan[ch_id];
 	ch_ring = &mhi_cntrl->mhi_chan[ch_id].ring;
 
-- 
2.25.1

