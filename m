Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC1718E14
	for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+C7uRwR"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-77d67000b69so237091085a.2
        for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 04:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089184; x=1701693984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+E40YbuoBKmAjqkT6wNa06Lpu/e8RsvW8Aa+FgX6YU=;
        b=d+C7uRwRoOdMrvoXgYcilAmh/0LMSiDljOOunx5UrDL35+yZPo4Mwm7ZIkn0XcWfQJ
         kL+UAi8hYCsWPlikUlA0SPxjiQJ/ABl7uE/Imin8GfQgGoTCB5FOphEXF3fQNeUlBOqT
         adTTlyBBPycIHDf4yu8xf3YYPN0B0T7S6HrDWD/XaAONSNY4i+yny+SJZyEijd73LqPx
         IxnVN4DW4rHr0rLQR/yAY8wLss1M33Q1muZjiNNVLclIRtZfwzBFGYRyfmHzDMuhr5Kb
         4vG61er4poOxT2u7TKYzOdufGUqOxFfNfYOT3Omco9eKjWqVOwP4ILgcBkPqj0NlUK4b
         B+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089184; x=1701693984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+E40YbuoBKmAjqkT6wNa06Lpu/e8RsvW8Aa+FgX6YU=;
        b=Q2fz8kiuaJVd2z53wb8PiNfCgXJhveB95S3OWInMiHLTsDiLlgaGtHY0x4EF9Yj/ov
         xSP+vIetoyaJ+WfogoilBx1pN/WqHGgBXIitfDojZ50sQs6xS6cq8W4MWkIhexUEO9tf
         yo+j8RAfqQ8eDzowRy0zGB6t1P9I2t0RhuPTAY1TLCpJcLS3fh9wDKY71oKaMmKhFLNY
         XDtNpctbHsn8vlBmD3pmoic50PiWCbBh28EWsBXzgE0OC26WMWg11qHJ8+abRsfU7ibq
         5Ei2q13aZ6nAu7DyQD3otYFwDBdLQxvh4EuMPJTnzozpscgycDHu15MeIv5ubCKTAtCM
         QFVw==
X-Gm-Message-State: AOJu0Yx9OosqU176WOgZzTlhj9HWCRFH7c3NelTKouC+QeGAK+JAmQ40
	+qmWk8pGp5zcatW9egTrq+DQWXditjK9NbIUGA==
X-Google-Smtp-Source: AGHT+IGjJ2kzkE/6gacJvEqAeEjIAyBT1VNMtpx4NnbwGuihBYTTMBLfyUdv0rtU06YkX96BCpwzXQ==
X-Received: by 2002:a0c:edcd:0:b0:67a:49c5:8cc3 with SMTP id i13-20020a0cedcd000000b0067a49c58cc3mr1827133qvr.32.1701089184590;
        Mon, 27 Nov 2023 04:46:24 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:46:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 9/9] bus: mhi: ep: Add checks for read/write callbacks while registering controllers
Date: Mon, 27 Nov 2023 18:15:29 +0530
Message-Id: <20231127124529.78203-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MHI EP controller drivers has to support both sync and async read/write
callbacks. Hence, add a check for it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 3e599d9640f5..6b84aeeb247a 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1471,6 +1471,10 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->mmio || !mhi_cntrl->irq)
 		return -EINVAL;
 
+	if (!mhi_cntrl->read_sync || !mhi_cntrl->write_sync ||
+	    !mhi_cntrl->read_async || !mhi_cntrl->write_async)
+		return -EINVAL;
+
 	ret = mhi_ep_chan_init(mhi_cntrl, config);
 	if (ret)
 		return ret;
-- 
2.25.1

