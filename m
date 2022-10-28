Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85E2F44
	for <mhi@lists.linux.dev>; Fri, 28 Oct 2022 17:43:09 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id k22so5379347pfd.3
        for <mhi@lists.linux.dev>; Fri, 28 Oct 2022 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0lCS/ZUURVz1YCG4pNVk+KiLqyYD23fxRdWfocVL5sE=;
        b=GeM1PpMU78y0RQ5AoOn8RBhPwx+Q8QjxLZ0EgvXK+5nLlO972d2aJ4BtwkJ7IVgIGs
         L3/lvL502/tIjGrLNX9joh+i5e5tTNImqQtMb1q1JcUmLj4U52eb/+nwvY1iE8Shtv9Z
         cgn56hSBg4dCyUhjfJ2wV2Tg71kWA76as5+7Cy1ieDSh5vBJKuDl5cZX010s6Ql4n5FG
         inHqsPaq/7PcI9z84ASt5vYB/nwPdIanrWbM/zQ3ipc7ziH0bcqy5xCJP393yxTK1Ei+
         YlmXXQXxrqYahb4hO9HCnC2dG6YewofBSSZ6eioIYtX3DF4JXPhBnxdkyTFlnlGFkuGq
         6qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lCS/ZUURVz1YCG4pNVk+KiLqyYD23fxRdWfocVL5sE=;
        b=yt4sAod4tZ/NwpRTXHn5EZyn/sI8IJxj699uH7Wy7SYD5sG2EW+8qQENsG+Z2tmdlC
         fcjKCqA29aXJy6GV6ehjyX0mPtvMIM9piZt0xNt7apgKMAkSC9HyTH7HgrScWXG8V7fB
         5UCjnNdQDA8+cOZ+pvXfwiR2Jy5SWLLYnpCzs60obp696JJkvk05U+6vhjALsVy1ca92
         Ala/IsII0QvEM5qUTZyjTqIFFf0SzbZaQ66/liY6RLX8RC889e3Muf0WAJjO4TCZ/P30
         nRjMS9zNl7EEGttwViL1biLMUaauJp7P2hUkfbUYSeaGihzGA+xZQJ6hB6cLmK0JQkdF
         myFQ==
X-Gm-Message-State: ACrzQf3pLAnmIw+kZc28IFc3O6Q0aiJ676ueXd8nLDu+epBB9eEE7Q3X
	Pvj4vPhw66Nn7X/qZm0jblPSCgDAqttF
X-Google-Smtp-Source: AMsMyM4I97Tuks9zFgFeNlC+dT0Lj+6zfOD3GS/7jyrVxydlSI5w7qyDW9LZM9xOAR5uuuf43M2h4Q==
X-Received: by 2002:a63:2b10:0:b0:451:5df1:4b17 with SMTP id r16-20020a632b10000000b004515df14b17mr549658pgr.61.1666978989030;
        Fri, 28 Oct 2022 10:43:09 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id y14-20020a17090a154e00b00210039560c0sm4462499pja.49.2022.10.28.10.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:43:07 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Remove Hemant from MHI bus
Date: Fri, 28 Oct 2022 23:12:57 +0530
Message-Id: <20221028174257.52525-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hemant moved out of Qualcomm and expressed his wish to not continue doing
any reviews for MHI patches. So let's remove him from MAINTAINERS file.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..ad9279218885 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13395,7 +13395,6 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-R:	Hemant Kumar <quic_hemantk@quicinc.com>
 L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.25.1

