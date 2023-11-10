Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8D14008
	for <mhi@lists.linux.dev>; Fri, 10 Nov 2023 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRasFlWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED639C433CA;
	Fri, 10 Nov 2023 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611732;
	bh=jnbhwmRl5zZlAGHpkM5vY+jFOya5KqTgBO3ldORwj7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JRasFlWlr14W9NNPXlOqfKkrUj6oofyQIVxSbSSIMrZzaJPgyA9TGhNzLUUDTA8EZ
	 ZRJcC0nqwAQCCr79/WkN2TlCTWFn+TX65preVjb9bDJZzSau3mOJgcgSG3A7K9VWOF
	 Ue5mM9QHMSFZ24NUtekXB7GHwpakTktKg7HfWsrncCAMVoDraZPodHswdkRx+wRHIw
	 btmNZYUaSi/OpHXhbNBLYjjgBvl1PS4R+AM7GFq3HCLkY4xjyXMNdp8KLpxO2twSQu
	 j/lYKVJkAMa3oFP4DAo9j9JWbNtYZA5JQrySGKmzSQeRqBKI3U3kDosEDGZU5IfAks
	 rD8ilm6xhHJfQ==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 6/8] wifi: ath11k: fix warning on DMA ring capabilities event
Date: Fri, 10 Nov 2023 12:22:00 +0200
Message-Id: <20231110102202.3168243-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110102202.3168243-1-kvalo@kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Baochen Qiang <quic_bqiang@quicinc.com>

We are seeing below warning in both reset and suspend/resume scenarios:

[69663.691847] ath11k_pci 0000:02:00.0: Already processed, so ignoring dma ring caps

This is because ab->num_db_cap is not cleared in
ath11k_wmi_free_dbring_caps(), so clear it to avoid such
warnings.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2845b4313d3a..b73d4286f7d3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4786,6 +4786,7 @@ static void ath11k_wmi_free_dbring_caps(struct ath11k_base *ab)
 {
 	kfree(ab->db_caps);
 	ab->db_caps = NULL;
+	ab->num_db_cap = 0;
 }
 
 static int ath11k_wmi_tlv_dma_ring_caps(struct ath11k_base *ab,
-- 
2.39.2

