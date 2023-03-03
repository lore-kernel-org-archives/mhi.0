Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA99446
	for <mhi@lists.linux.dev>; Fri,  3 Mar 2023 21:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132ACC433A0;
	Fri,  3 Mar 2023 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677879830;
	bh=0ykQITa9rK+UFQlUR4IjVhVNgB3E0ll98TQEFCA0pm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHISzj/RvyNDZkH6Z3PEIRhNPfjGSSGj9dgha8YRAbC5ltJccjQmOHgBIbkLIrlQf
	 jsZptL0U1Zx6waR2lmdLrW4zHPkwp+pjpKRzIqpH3gEvOGX8dWm+VYAIJS3bU5TSI0
	 ZaW2+B932Sg6KM/Yleb1e/eQB6WMdc+wvBR51yyHTg9Cov0cDZh/KbZMkwkQsVAoVl
	 kltZKxCCObMPEfoNRiJ+PBp1hwsoZ5vZw1NKK7ln8ks7LtIFJehp/HebJp7yw6kXRD
	 8U7BxSssFGZ0pDb9jjEMjYdoSkMu9zKDfvVZaMeENXtF71K0PG/nEJakgJrpiEGoRy
	 IBlGIryHKVREA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	elder@linaro.org,
	gregkh@linuxfoundation.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 18/60] bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD cmd
Date: Fri,  3 Mar 2023 16:42:32 -0500
Message-Id: <20230303214315.1447666-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214315.1447666-1-sashal@kernel.org>
References: <20230303214315.1447666-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

[ Upstream commit 8e697fcfdb9809634e268058ca743369c216b7ac ]

The debug log incorrectly mentions that STOP command is received instead of
RESET command. Fix that.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://lore.kernel.org/r/20221228161704.255268-5-manivannan.sadhasivam@linaro.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 1dc8a3557a464..8ffaf9c6e61d9 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -217,7 +217,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 		mutex_unlock(&mhi_chan->lock);
 		break;
 	case MHI_PKT_TYPE_RESET_CHAN_CMD:
-		dev_dbg(dev, "Received STOP command for channel (%u)\n", ch_id);
+		dev_dbg(dev, "Received RESET command for channel (%u)\n", ch_id);
 		if (!ch_ring->started) {
 			dev_err(dev, "Channel (%u) not opened\n", ch_id);
 			return -ENODEV;
-- 
2.39.2

