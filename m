Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89E529CA
	for <mhi@lists.linux.dev>; Sat, 16 Oct 2021 06:57:56 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id c29so10311316pfp.2
        for <mhi@lists.linux.dev>; Fri, 15 Oct 2021 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=zoOpjybTvuwHtP4eb6cvosjEosqpSYWs5m9cP/9HS3A5UmQuEUqHIRSvYdvDmzD7eJ
         YnkVNam2jD6lLXbLZ9/UAGQ8JI4pCu+kUybzSBu70usSBZ9koN6bTcl3HdEsRhpzCYTL
         S4MTJCAshw8yl3ggdIdu9HZUFdgdPjijBpE3rKwFVMvYwjtEIcvjlqVop/tz5dptJ8aM
         8CQA9t6Y05qL1B35bGGeRHp1A8AQJXE4Kns96qRmRUgsGfBxDpDUgsuZnbYjdcf6AW/X
         ZyX+DMfKz0uGO/T1SVVlwjjtSrXjKJbl+vnzyvByCVo0M+mBMY5Hqrx3uCBZ0qqtcojJ
         d+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=xZi1I/cTYkYexW4wEaSg1dYCNhsIqFrJsuwfs8EQGGpeIGdKQGNyRn+kgkX5+B+NwM
         xBLt2x2lurSzfsOoPF918T4k+/X9wqQ0p2UAZCc5HBbbMALZskWWodOAjOrmdIwmUnTr
         4ReMiIl4WkM4qqV9ymQF+vRSL2L8u7t4IX3XqdkfrQrervi4AOUcG2XMJFpwjOFYXxNR
         HpW+b/QWyh+aWFcF2vlHNk61OM798EdNIU3iXSYv4CRnNZ7zh6HU1ZBRcJRUf1b6eLR5
         1zOKwikhLtFPK9srRMnjF7ni0AXKC7YjRvDbOErFAhshn9EP5WLlr2RG3g88SOcllk1+
         Arig==
X-Gm-Message-State: AOAM532qiz0bdLVbqYm9nLrGntFuQP2WfDdmFY5mFU5J65JYfy4cwr3L
	Tyfl0q96AJUU6yEVzmDhyfzO
X-Google-Smtp-Source: ABdhPJygVbcWzrbpQlhdx7t70Ze9/6w7BrhXWkiL0BV04AdsCQILo2Sqq49ZybtPZpCaYiEisTZolw==
X-Received: by 2002:aa7:93d2:0:b0:44d:4a13:5267 with SMTP id y18-20020aa793d2000000b0044d4a135267mr16086049pff.52.1634367476342;
        Fri, 15 Oct 2021 23:57:56 -0700 (PDT)
Received: from localhost.localdomain ([117.202.185.237])
        by smtp.gmail.com with ESMTPSA id a17sm7024253pfd.54.2021.10.15.23.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:57:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	wangqing@vivo.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] MAINTAINERS: Update the entry for MHI bus
Date: Sat, 16 Oct 2021 12:27:32 +0530
Message-Id: <20211016065734.28802-2-manivannan.sadhasivam@linaro.org>
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

