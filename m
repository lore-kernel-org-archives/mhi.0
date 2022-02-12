Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9D7C
	for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 18:21:48 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso14968834pjt.4
        for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 10:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7DQ/ZJ2gQOCs8afpwgV3IUsPGlYg0pNNMCW2zNhUO8=;
        b=WYLrcsL4z93Z79+6TZmR1sVn94tNgubl+JfaCtqejObohJL+hcAyUh2RWSDzlpwEr+
         1lsptBo9XrX0q94C9ENxJCybs2WAo4k5EOvR2VFZV6JhrIxtDcaX6hlxryb1/gWwI5c9
         3JyBQDEXfL5LwEbsdEbQj1/4nfsSZ3/ZEEEtdOaZhYjrLXIEkCGc8l2X3KYPqgAgR2re
         piR+uv8ZxFo9C1Z9rN07f1KomwTl/RO2BMuQZI3tvXo1XOg8+GVlyCxfbP0kEYpBk8L5
         1tjo/7gSqaywFI9hP8JPaAgTNsNA8v7gZC2cRTgu5CweLwyer/c1iy2df/nq9sJ9W0q1
         zPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7DQ/ZJ2gQOCs8afpwgV3IUsPGlYg0pNNMCW2zNhUO8=;
        b=e+DwbmVwUKbYSd/RSq08l1J2f23ckZusMYNCscr0YaxTK/Cub0+YSllQRFn+I1Z4uJ
         lBsYUJNGUJ0fyZ1c6RqZxkFAlOVDCNIuhDCo2g2nShp7p5zRLWtJCl+JPy2zabOtTbKB
         dAYC28Q3/Nbsyb0ztr2PVtgfAw35le15lhH3XllmDGNebNYa56zC1fnMDn6a12/Wl9vT
         lHy7AS7XX6jTxDs1wIItPSrpJmYMQ4Wgsjt8j8/7o9bBE7q/s2t2ccTamvtU91sYx8Ci
         x5XEVhZL/oDehX/y42pOQ9h5a5HzVKk7EgzmlAvx5xisfnCR6eWReeZ34wxQnNIDny/Z
         49fQ==
X-Gm-Message-State: AOAM531R/zZp9CRGjNH6nC+mIO8zrWKsiVKjAL8Ohji3IcYXQk0YZcBx
	EUUWPyJA5E2Q6AsO5dMRHhYU12dIgAjKpDE=
X-Google-Smtp-Source: ABdhPJwjJuEzA3rG6VR1TZ2r3vKn3OMJXR3L5Y4wVNt3Gz785c7ZEDqOc9RN+ePb0Lq/fNq4vW0iPw==
X-Received: by 2002:a17:902:bcca:: with SMTP id o10mr6894783pls.147.1644690107434;
        Sat, 12 Feb 2022 10:21:47 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:21:47 -0800 (PST)
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
	Paul Davey <paul.davey@alliedtelesis.co.nz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 01/25] bus: mhi: Fix pm_state conversion to string
Date: Sat, 12 Feb 2022 23:50:53 +0530
Message-Id: <20220212182117.49438-2-manivannan.sadhasivam@linaro.org>
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
 drivers/bus/mhi/core/init.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 046f407dc5d6..af484b03558a 100644
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
-- 
2.25.1

