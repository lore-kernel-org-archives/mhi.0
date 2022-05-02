Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE37317D3
	for <mhi@lists.linux.dev>; Mon,  2 May 2022 10:42:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id i17so2968663pla.10
        for <mhi@lists.linux.dev>; Mon, 02 May 2022 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k5HAh8ngAVPFB9BApz5vRyzeAzX7yXOYLyScd179RCI=;
        b=uOEY1LPQQJfDZn4ittpZjnYRqf2uREgsqUIs3DQ1yLqiiDgnA0b26ayC3UN8gKuhsk
         wr+kXmEQ+gDKMH8wOf56loM6L3Jjg3Vrzyxhw0KuIICdmCuAFKAigUHZBLhpXW7fzv/O
         FYUZTpS8VX0EF1e9BFnhrBqAhZGsCbVsy5BczbGyzF2BVkC6C0r7t9kArxe5WhqrlJHE
         NArAxMWJTWnFp3ULVPy+fAjph3lk4gvzuRzgd2e4O4JS9tKSlGVi0ybCsC7WfnyzP/hn
         zffbaVX0NMP1P09hz34wyYRPUONU2tozxBMUmI2cOzx0obvzMDMB9JNKj5XYJiiMuGLL
         /SbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5HAh8ngAVPFB9BApz5vRyzeAzX7yXOYLyScd179RCI=;
        b=qDbpbXdc6+5lgsDh3IHjhAzBnyZ43HoFWrkbwGJw08nYk4pDOm6HC68/rkz6XFw4ji
         ynXs62srWJDpW6Z21U4Kzfb+orDV7YvKbM5vr/+8pgi68xuRHJ23jIUIAIhZFb/znSJJ
         FglDrCtNh2EdbOY+lvCKrdaCH8Jg3IjvwTgkWpFrvSFTyo2SqCswdu8LbmCDovQFldjt
         hAtJdvmM/+zgbbEl8SaR+kL1Bmz6W8VTkd89H314w96DYC6nHH/t/vcLn+gRGeIpgkDA
         RbhAVRmRAV1Bv46wTS9/NvuFV+G5g80a0twZAQMkaEDumKFbPvJaGfCXqKeXezw1VHQq
         FbgA==
X-Gm-Message-State: AOAM530V5LnpI/DYPX8DAtmePyrm6hAXnj88v/YPNJv6F6k+SOrxGtyw
	x6cVQvBAqmvnGuB1Fw8yKPG8f45aMIkl
X-Google-Smtp-Source: ABdhPJxcDuQwcxprePCJ9P8ujm+ox0ns8BfIT2VUCWkUlpI+Q1viKa0+CO/t90f0uGR0QrT/elsPkw==
X-Received: by 2002:a17:90b:3b43:b0:1da:284f:7792 with SMTP id ot3-20020a17090b3b4300b001da284f7792mr12633082pjb.189.1651488127155;
        Mon, 02 May 2022 03:42:07 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:42:06 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before ctx wp update
Date: Mon,  2 May 2022 16:11:44 +0530
Message-Id: <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The endpoint device will only read the context wp when the host rings
the doorbell. And moreover the doorbell write is using writel(). This
guarantess that the prior writes will be completed before ringing
doorbell.

So there is no need of an additional dma_wmb() to order the coherent
memory writes w.r.t each other. Even if the writes gets reordered, it
won't affect the endpoint device.

Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 966ffc2458b9..6706a82d3aa8 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -138,11 +138,6 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 
 	db = ring->iommu_base + (ring->wp - ring->base);
 
-	/*
-	 * Writes to the new ring element must be visible to the hardware
-	 * before letting h/w know there is new element to fetch.
-	 */
-	dma_wmb();
 	*ring->ctxt_wp = cpu_to_le64(db);
 
 	mhi_chan->db_cfg.ring_db(mhi_cntrl, &mhi_chan->db_cfg,
-- 
2.25.1

