Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E7A14009
	for <mhi@lists.linux.dev>; Fri, 10 Nov 2023 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWxDiZoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340EAC433C7;
	Fri, 10 Nov 2023 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611734;
	bh=s8f7ejt6/6A/AIKa6sJs8NlXnpAnYLCNcVR7yofQBJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWxDiZoqvEUMJIGCjpia9hNLEYYeM7aF+jdw4GLLMl+osG9gI4Q3jz2oHIOJmS/XF
	 Xp7enBMvYSeCIHF+uy2nU4QLzycIpA34EJbHV/uPiortko0WsVU64uIza624ZIa7En
	 hbcFcvtUbZW17dpg8CAbMytZXk4u/df7Kfr1iyFwSwCtWNSIvOEfp3DzK5EMdyLSvc
	 lgz1dSxLCKVDx5NzZ9xIgpG4ExjmdZgY7SYyNo7wSNij3/TK9pYpYONp0iDxZMrlvV
	 9bVbceVp6N6ok+5Rj6jv0/6sIi29ZYZxGY1/G7k5s+48qILF9sLa4YiesA3VvIJ3Yd
	 Xp5eRN7uKQheg==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 7/8] wifi: ath11k: thermal: don't try to register multiple times
Date: Fri, 10 Nov 2023 12:22:01 +0200
Message-Id: <20231110102202.3168243-8-kvalo@kernel.org>
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Every time the firmware boots we call ath11k_core_qmi_firmware_ready() which
ends up calling ath11k_thermal_register(). So we try to register thermal
devices multiple times. And when we power off the firmware during
suspend/hibernation (implemented in the next patch) we get a warning in resume:

hwmon hwmon4: PM: parent phy0 should not be sleeping

Workaround this similarly like ath11k_mac_register() does by testing
ATH11K_FLAG_REGISTERED.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/thermal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
index c9b012f97ba5..80abf472fb87 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -162,6 +162,9 @@ int ath11k_thermal_register(struct ath11k_base *ab)
 	struct ath11k_pdev *pdev;
 	int i, ret;
 
+	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
-- 
2.39.2

