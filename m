Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E22C85
	for <mhi@lists.linux.dev>; Wed,  6 Oct 2021 06:25:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id kk10so1415369pjb.1
        for <mhi@lists.linux.dev>; Tue, 05 Oct 2021 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=w1p4S9zAl0cmnFFEkqs1653lpUpyT6XR7Co+b9FhBs/GH7fcytAorgcpR6arYy43AY
         30L4x2hzdq5ypwIeeWBDRKPoFPSCiDpYA4UksAAGIPSo52N2U+X+tDxZUKHdKO9L15sq
         DV08D7c+36c/yiMnVBprOHJkj7HnEFG7GfLGaLJv2J/QaYok/9cZuZcWZ7lMYxdcIW6d
         V8z5KB28mZL7icfbsa2AftBuCI3/zyiJsMsBTcEtgpNLRptnQQmBHV5KJQckXhqe52RL
         cR/w5xQwnhqn5bmU+Q3rV1uVN5G5t8e2u6xQoI0N2SsbY/ZsC3Orr2n0cFTKuS2PjYNr
         OsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=GQcY9FrJyIX/FtGX6N4oZYvxZqA5AHJx70zWbRWziPmvnTdT9UUqe6RJiF6ckpVDfl
         5nDos/f1uZ8m96eoTyZ+8NkuFoSJkGRRhGFqvzbAz1oJDXfWroNNzYqo5CSicGwHHOyJ
         8tPB4bEi1xhEbL/EUjo2xxNsolsN1Y5vSU2zk/lCEIevKYqaMlRWyBBYXu2059ju5Xgj
         4tKZ+N+cQB5ucXX4X9eaaRkogkwLA/oEPZVUNoaFxwm5054FDlnsGVuOUVy6yTQCiidD
         b7RRNTlKsXfv+bwZr7PBad+J5RfEh/51zaM2k9Yc82it+QXTfm+GSuQVGGjmfWSCcaBv
         YCBQ==
X-Gm-Message-State: AOAM532yf8y4DWOCBcfFWonZxdptswiKSq6VZnZWOv8JBZ3BCRzTya6/
	fh1ZLpY9v0wXJSVSmnjvYSEWBcNOVXyz
X-Google-Smtp-Source: ABdhPJzM4FZ5kRlWkBgGu9JmRikyxvCpUWH1ohdFMA1Yvh2k0znv139DvEd2ubKDZ5wjyYrL3wYCYw==
X-Received: by 2002:a17:90a:67c1:: with SMTP id g1mr9178172pjm.177.1633501558060;
        Tue, 05 Oct 2021 23:25:58 -0700 (PDT)
Received: from localhost.localdomain ([117.217.176.215])
        by smtp.gmail.com with ESMTPSA id p18sm19329361pgk.28.2021.10.05.23.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 23:25:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Update the entry for MHI bus
Date: Wed,  6 Oct 2021 11:55:45 +0530
Message-Id: <20211006062545.34429-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Hemant is not carrying out any maintainership duties let's make
him as a dedicated reviewer. Also add the new mailing lists dedicated
for MHI in subspace mailing list server.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..8ae357d746c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12191,7 +12191,8 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-M:	Hemant Kumar <hemantk@codeaurora.org>
+R:	Hemant Kumar <hemantk@codeaurora.org>
+L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
-- 
2.25.1

