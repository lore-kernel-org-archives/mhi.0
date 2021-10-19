Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7372C88
	for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 13:39:27 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id e10so8788682plh.8
        for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fu/N0/wfJM/gNSAgQFxGKP2CBqPDLA0sLqKbjnA3xdY=;
        b=Sle7GBCUBcaMrbCqc/kapDupfY68tIlY5S++TgCSHHZtBhc1aMcV4FYyztVYS9amR0
         uz0NjpiwpgL+O/IXtUAcO172eGrG8HyoURZwHUnT9A0wLAuhLcodsbY8lLbBbmKCNDv3
         m1xKhoXeNsOv95UOslEfSRjdGhq9c3w7Gb2AsKXr2COj27uewgC/QpIJnK5sh206FCVq
         qD/v+FyXnLLL0/+FfqC6xu4pfzukqdu1MP7iL3E85eh6uX1ShdL2VpuYTSWr/yZngBzX
         D1GmfNxFVxTZDuktj7pAs5WuKf8s25kbKsUSavW8hgUvpQJiDdk3yLYOTtWbrxfrIGcV
         ZAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fu/N0/wfJM/gNSAgQFxGKP2CBqPDLA0sLqKbjnA3xdY=;
        b=7Qn4aGo+cPswvwvBjlh/n4uDhkWZ9bfeGw0ZKBffyuxCAbP/Cn0wW/yUGJlUHK35as
         o7qAstOJdyAMBjcw6+i7esGV0g+5fmImzDFsof9ykrbDaODXUmAXQ99w3OPhacWvNj0q
         jMv3n3dL78AQ+d4RjBg70KE/3j0nDM9vB6fFhSMmT9iYATXkglEhbhm9c0rooKJ0EcI4
         8eiMlDweyFt5JKVAMQN5WALrMj3xS+P5b4fdgp5pK7y6Xk4dLQfkC2TxiyfC5qU8cQzS
         qpLgdaqODHcGLFMzCC29HU5F7dS8bs7p89FPh2DvoygQV5143gsRN+34VUuI1ABQwSHi
         IYWw==
X-Gm-Message-State: AOAM5305hymYCXddab2hCm7HT/C8JTIkMCr8BYb4Hi7mYGJlZWnkqjT1
	YZnz0RPjaHv/O6WAeb3kiUfivnQZEhzD
X-Google-Smtp-Source: ABdhPJwZyYaewx1KbnTgde48SxICfHFIR6T6egzKlyy+QHDPCrs3EolfNClqU6G512RRJMFKemEndA==
X-Received: by 2002:a17:902:64d6:b0:13e:a5a9:c6d6 with SMTP id y22-20020a17090264d600b0013ea5a9c6d6mr34024953pli.52.1634650766905;
        Tue, 19 Oct 2021 06:39:26 -0700 (PDT)
Received: from localhost.localdomain ([202.21.43.8])
        by smtp.gmail.com with ESMTPSA id g11sm16020033pgn.41.2021.10.19.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:39:26 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] MAINTAINERS: Update the entry for MHI bus
Date: Tue, 19 Oct 2021 19:09:01 +0530
Message-Id: <20211019133901.173966-1-manivannan.sadhasivam@linaro.org>
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

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Added Hemant's Reviewed-by tag

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

