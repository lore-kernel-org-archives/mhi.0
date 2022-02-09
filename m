Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E32F25
	for <mhi@lists.linux.dev>; Wed,  9 Feb 2022 10:05:14 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id x15so962828pfr.5
        for <mhi@lists.linux.dev>; Wed, 09 Feb 2022 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1wTIjLivrgPfop/XqqzPH2ki4x3bw9zR7SXERTNkUpE=;
        b=u0bP8AcW4JKB6uFPlD/6EvDc6OH2J6/QxPLfzzO9DCbpuvMHItjEAFwH7YyYYboBw6
         n704pOV6iN12VEXGWjdJAy8jLxl2JVi8CyjVBv7b97FDS4qM44lN84ibhSIYL2xS2+Rl
         4c30rMEmepmRtjGts85Joc+ChxcZtmQLpAA22EJEktgcysoVikUTInL7Wxg/mMWkGgxe
         3qlIEGaCahMU78Rd7mFpd2odqQfmFdsBd9K3+EpiySbUVzR+7Opwp3mwluvWBngpJlwG
         xxSj1WM4DdwS2vNRi64NO5hMpHnso/HUg7cS7v9/U+eUJPjJgRE0RRvmSRGQTm3/cmTe
         npfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1wTIjLivrgPfop/XqqzPH2ki4x3bw9zR7SXERTNkUpE=;
        b=DN2Rd01BT7jZ02YM21N5UBxH/6vyPDYuQ3/7qeDESAGK7hdQLKGNpP3JLjnSJtGWFg
         ssiZ0Jhpi3IfIqaW1Y9q32PDxeht5AEt5iShfH0UG2n2WCaM6AtBFpWtjkTBNPtLhehz
         VL/RCBHae8cJkrzA8bmP2YVzVTsWx4cHTIqmlP4SF8UJgR19fTbH3CsywQWGWQk/+6zN
         6JKjV87SWInlN3l9dISFQ3Ho/By9uO/rjwgpES2QUbmqcF0CIdT07IOZ8dPwT89q08Xe
         Y0Jm1xiWBpkGXzNkbPFxoH9oFJi+WDfnpEhHKC3QRZe/46YDsUFD/kHHwa8qqHO0T7f0
         EfSA==
X-Gm-Message-State: AOAM533YA5TSRxrHcsOwz7J4eb7ECIAvdJiwghLXQ9fHGsY+5DqBO8b8
	RL9bJjpjlgC7OEBNpsJ0TTltfLocTq3K/VM=
X-Google-Smtp-Source: ABdhPJwimw0vUk+r3YV1nDhN9CvOyCMAaHzUFNankW6HvnxTLCRTmuCcdkUNnGtmQeAXMU19hUmhPA==
X-Received: by 2002:a63:d14c:: with SMTP id c12mr1292263pgj.300.1644401113548;
        Wed, 09 Feb 2022 02:05:13 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id p2sm6722024pfo.125.2022.02.09.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 02:05:13 -0800 (PST)
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
	Paul Davey <paul.davey@alliedtelesis.co.nz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 01/23] bus: mhi: Fix pm_state conversion to string
Date: Wed,  9 Feb 2022 15:26:02 +0530
Message-Id: <20220209095624.26389-2-manivannan.sadhasivam@linaro.org>
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

From: Paul Davey <paul.davey@alliedtelesis.co.nz>

On big endian architectures the mhi debugfs files which report pm state
give "Invalid State" for all states.  This is caused by using
find_last_bit which takes an unsigned long* while the state is passed in
as an enum mhi_pm_state which will be of int size.

Fix by using __fls to pass the value of state instead of find_last_bit.

Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Cc: stable@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 046f407dc5d6..0d588b60929e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -79,10 +79,12 @@ static const char * const mhi_pm_state_str[] = {
 
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
-	unsigned long pm_state = state;
-	int index = find_last_bit(&pm_state, 32);
+	int index;
 
-	if (index >= ARRAY_SIZE(mhi_pm_state_str))
+	if (state)
+		index = __fls(state);
+
+	if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
 
 	return mhi_pm_state_str[index];
@@ -789,7 +791,6 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->pre_alloc = ch_cfg->auto_queue;
-		mhi_chan->wake_capable = ch_cfg->wake_capable;
 
 		/*
 		 * If MHI host allocates buffers, then the channel direction
-- 
2.25.1

