Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B615D3C3B
	for <mhi@lists.linux.dev>; Fri,  1 Sep 2023 07:35:18 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68c3b9f85b7so1217189b3a.2
        for <mhi@lists.linux.dev>; Fri, 01 Sep 2023 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693553718; x=1694158518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twC24zwbv4rxrutTxkfSyT3gLWKA93+iK2AGFx/l/NE=;
        b=CuKo5ZRyH60CRk3nivQ2xirUyZfmGXOTcRvQ51IE5erVQoXP2lOkgBJEoBsk3Q9fY1
         mgzwCdz2Bx/j9p+eVYyAFMjXsbrB35QSGm4OkJ6RZtc4TM6pbddH0rnucal1/HgpzoTr
         XkAIWbPw3Ska173EW1XMxkC+DoUh/WJ6OBCJq2ZlMPFKlrvF2nkfrdFMZFrvGFapX3qE
         oFixZDWK/PIbpdIGrOeV4YIQ5doMT3QYwn29Cyvgmsa0WuTSL7ftSWqMCVCZWoFhAyk6
         7TtTA89oRL2OTb+QTQQozonNGtg7si7QkXzA0IjLD0c4R8SGJnOkz7ddkIkJ6cHdCjlQ
         le0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693553718; x=1694158518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twC24zwbv4rxrutTxkfSyT3gLWKA93+iK2AGFx/l/NE=;
        b=CzbBC7rkyyYw11ghtOc8goiKrX9PZkoHnbPMUn3rYcw9vhjp1XwhSVBvnEOL+qldS9
         4G4FRQis2M0nFj/f/SvHnO0tZJNeTznTXip+cp4S8bNRj9LPzbG7PO5lpiluP1IwAKnJ
         ezOdOhF/VkbNvTkr79gYnGz80SRnOGeSJFVhJhJOxEJfUGEG9I33sN4pMdCyhPL5IX5e
         1pyQF4kbnKER5fABTY/Gnh64dOOj6iYs49QnYsJte7q+R3hlB59fhlD+opifU6E4b0nP
         K7rvQ/2rw84w1BuMla5UG/x0MZD9uX3rEI7kcsGJQOLNlz/JcW5KbzhpEtGZrTJgxTyp
         9n4w==
X-Gm-Message-State: AOJu0YyhGlLPWFvUIiqUBXmmrqhB+FylXDOLcjHIA55W7H/Gi7ka7vmR
	U/o1qpMcNy6iJHS/IQ97Tn4LJBMlpcminTOPTw==
X-Google-Smtp-Source: AGHT+IEbqx6ojHyG0IAXecWFY7u2o3fb/zTxAc6jY/6YNuNvZeWI4jiOxr2Du4dLiD2wjQrRHcx6Iw==
X-Received: by 2002:a05:6a00:180f:b0:68a:3bb9:7e86 with SMTP id y15-20020a056a00180f00b0068a3bb97e86mr2327112pfa.0.1693553717713;
        Fri, 01 Sep 2023 00:35:17 -0700 (PDT)
Received: from localhost.localdomain ([59.92.102.217])
        by smtp.gmail.com with ESMTPSA id g20-20020a62e314000000b00688214cff65sm2376427pfh.44.2023.09.01.00.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 00:35:17 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_msarkar@quicinc.com,
	schintav@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Do not allocate event ring element on stack
Date: Fri,  1 Sep 2023 13:05:02 +0530
Message-Id: <20230901073502.69385-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible that the host controller driver would use DMA framework to
write the event ring element. So avoid allocating event ring element on the
stack as DMA cannot work on vmalloc memory.

Cc: stable@vger.kernel.org
Fixes: 961aeb689224 ("bus: mhi: ep: Add support for sending events to the host")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 52 +++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 600881808982..66ca470bf302 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -71,45 +71,61 @@ static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
 static int mhi_ep_send_completion_event(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
 					struct mhi_ring_element *tre, u32 len, enum mhi_ev_ccs code)
 {
-	struct mhi_ring_element event = {};
+	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	int ret;
+
+	event->ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(*tre));
+	event->dword[0] = MHI_TRE_EV_DWORD0(code, len);
+	event->dword[1] = MHI_TRE_EV_DWORD1(ring->ch_id, MHI_PKT_TYPE_TX_EVENT);
 
-	event.ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(*tre));
-	event.dword[0] = MHI_TRE_EV_DWORD0(code, len);
-	event.dword[1] = MHI_TRE_EV_DWORD1(ring->ch_id, MHI_PKT_TYPE_TX_EVENT);
+	ret = mhi_ep_send_event(mhi_cntrl, ring->er_index, event, MHI_TRE_DATA_GET_BEI(tre));
+	kfree(event);
 
-	return mhi_ep_send_event(mhi_cntrl, ring->er_index, &event, MHI_TRE_DATA_GET_BEI(tre));
+	return ret;
 }
 
 int mhi_ep_send_state_change_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_state state)
 {
-	struct mhi_ring_element event = {};
+	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	int ret;
+
+	event->dword[0] = MHI_SC_EV_DWORD0(state);
+	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_STATE_CHANGE_EVENT);
 
-	event.dword[0] = MHI_SC_EV_DWORD0(state);
-	event.dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_STATE_CHANGE_EVENT);
+	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
+	kfree(event);
 
-	return mhi_ep_send_event(mhi_cntrl, 0, &event, 0);
+	return ret;
 }
 
 int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_env)
 {
-	struct mhi_ring_element event = {};
+	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
+	int ret;
+
+	event->dword[0] = MHI_EE_EV_DWORD0(exec_env);
+	event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
 
-	event.dword[0] = MHI_EE_EV_DWORD0(exec_env);
-	event.dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
+	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
+	kfree(event);
 
-	return mhi_ep_send_event(mhi_cntrl, 0, &event, 0);
+	return ret;
 }
 
 static int mhi_ep_send_cmd_comp_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ev_ccs code)
 {
+	struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);
 	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_cmd->ring;
-	struct mhi_ring_element event = {};
+	int ret;
+
+	event->ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(struct mhi_ring_element));
+	event->dword[0] = MHI_CC_EV_DWORD0(code);
+	event->dword[1] = MHI_CC_EV_DWORD1(MHI_PKT_TYPE_CMD_COMPLETION_EVENT);
 
-	event.ptr = cpu_to_le64(ring->rbase + ring->rd_offset * sizeof(struct mhi_ring_element));
-	event.dword[0] = MHI_CC_EV_DWORD0(code);
-	event.dword[1] = MHI_CC_EV_DWORD1(MHI_PKT_TYPE_CMD_COMPLETION_EVENT);
+	ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
+	kfree(event);
 
-	return mhi_ep_send_event(mhi_cntrl, 0, &event, 0);
+	return ret;
 }
 
 static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_element *el)
-- 
2.25.1

