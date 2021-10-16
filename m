Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06E2C82
	for <mhi@lists.linux.dev>; Sat, 16 Oct 2021 06:58:04 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id d23so10640850pgh.8
        for <mhi@lists.linux.dev>; Fri, 15 Oct 2021 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PSnBBHmQDKKzZaMOl+dSnVydeHhc9eP8o2lCcovzMc8=;
        b=w8tJccHIf6PPWVXEA/XDUTRC3rJpIf9L7f+3DeKSYA69hhp3JJ2+ro4Fv9KZ/Xq/9m
         dUO/uHgMzKPjtT8E5gD8qQ3bDhGJSFJu0B+gTihLrXduYR2t/DNvcoqe9oZKdM8yZVqI
         jPmC1gOU21d28VUAfcuahRmg3+gPdzsppjQLLOJr1rIXfDuwNUY6pqIELm0nsw3TYS01
         m7aq4vloUggNOYskY6X1O5CTeBlC0Qa9C6oDLoDKDRmOqJ/EJaWLyfQ/43DBP3ZjYl0Q
         /DfsSiG06mH22sX0cIuCoGUfofelm2Jxy2AtObZ9cxv2p1WFrjcgRGYaEptNJOT0YBEU
         2X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PSnBBHmQDKKzZaMOl+dSnVydeHhc9eP8o2lCcovzMc8=;
        b=jIgazWnf6bbig39wY2SrNA38WKDYXuD/1hY9VEUjAMJ/F3NifmR/r+x9SbKe3PbTsg
         Qz5YJDtJat9NDIEuPdzU6jIv6Y49xbiVjnudsBPDZ2VEbyxQdd7MPMaeuNu5J60uyWzz
         bRf667acdylp9AUTsoivHGKWkCzDSDJJg7ZBwhjOosZRv53hLhI4t+NqyoB+H0++ooYt
         YSmfhBMy1SvsmIIseit5f/t6I1roswtg+0P4ShLMJU83K7telskj7Tfu3MQ0qMe1cbYZ
         VkA7/07GAdkYUUq7HCXwHUeg3zcupIjVvPAWuuLLOO0geuRziokZSTo6g1y9vKylniRt
         cBXg==
X-Gm-Message-State: AOAM5325HbuDbj1e0245vlou6itZ7fXcEIblyzSEv5KvraVetwWiqHvJ
	KBCOotTqwGFpZ9wlwQVm4nIQ
X-Google-Smtp-Source: ABdhPJwUmO50W6OByAHj6jJvQe3hFBMXPRFvTt8Nun1ZWjTZpMCz5WETXvv8NLVtFMiXAdMsS9lLTQ==
X-Received: by 2002:a63:20f:: with SMTP id 15mr12477340pgc.319.1634367484257;
        Fri, 15 Oct 2021 23:58:04 -0700 (PDT)
Received: from localhost.localdomain ([117.202.185.237])
        by smtp.gmail.com with ESMTPSA id a17sm7024253pfd.54.2021.10.15.23.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:58:03 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	wangqing@vivo.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] bus: mhi: replace snprintf in show functions with sysfs_emit
Date: Sat, 16 Oct 2021 12:27:34 +0530
Message-Id: <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qing Wang <wangqing@vivo.com>

coccicheck complains about the use of snprintf() in sysfs show functions.

Fix the following coccicheck warning:
drivers/bus/mhi/core/init.c:97:8-16: WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/1634095550-3978-1-git-send-email-wangqing@vivo.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5aaca6d0f52b..a5a5c722731e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
 
-	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
+	return sysfs_emit(buf, "Serial Number: %u\n",
 			mhi_cntrl->serial_number);
 }
 static DEVICE_ATTR_RO(serial_number);
-- 
2.25.1

