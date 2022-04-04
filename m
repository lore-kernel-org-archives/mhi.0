Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884727A
	for <mhi@lists.linux.dev>; Mon,  4 Apr 2022 06:42:33 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id s72so7563306pgc.5
        for <mhi@lists.linux.dev>; Sun, 03 Apr 2022 23:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PegN0LY73qhaXEJ51OmllBB8FerysE5PYKx9aPbALwY=;
        b=nez2g3GyxqQU5kecDLhnZpTR9ZGLVFMT63horZ9s4lHNE+NaIQedEh1X9iN3+K54kC
         o8jQuSoqN3jcn+f61rJS2PthoEhIj3rkQdWSUfPzlBNqMldPOGH6ee9Q/veMqeHGN/Zo
         FvMcJP0NDOR/uL53JSTQ3akA09/SAY06DI3o3LqAPyp0WsW1OnRYa+X19vZd0WLIwvT6
         GplsXkIZ9EoOvoXFX9g2hwB9/UzNJCXh0erZtQwCZfoNX8l6/HdoAdgcx5HZTONV5ngv
         RlTnx1Y551M2SvfV0eB5OfMMgGbfaY8oObwqxkIc0imdZhXbSi4Bs/fz9RRTZ/S4yROu
         HAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PegN0LY73qhaXEJ51OmllBB8FerysE5PYKx9aPbALwY=;
        b=fMdVlet7cqmCNXNgLdQBYvMqx4jhuKIdeBpMSWfxbciU38SglCwMdwNHMOJpgjPmRR
         +kW4cvcz6BpAVSWdCy+VeMp9MPKi4pipRkrzYUyejgzAcLSbuqdVd14PHRhHJIlubNY3
         j9L3JtB7LP4lSbinG9K4P/xk0R2BHIzhUb8qytZj1Yooccr8RS4jJo2fvJFMHsfUBFfr
         HH0K7IC0QBxN2xhjqvnj+3chz+W1ZHivp6CwUABuI5SrO5jIEYE194NJCeGeORxUkpWQ
         TljMvIegzjSzatmkolyDMuw4WVE9wWLjoHQhg6/9V5iQG/8uZNemvkD+58OH8oy7VgFy
         aOWQ==
X-Gm-Message-State: AOAM530PZvOvCMEXoaPyMieUmZDK5sUx/aLGAHwVbXm0ztU3b1SHDWfW
	u/Wk6CSFe1FyAg1FsK3QxQmvTBtmW6qe
X-Google-Smtp-Source: ABdhPJwFU9KB4YkxChyoBR6qa6Aaf6OQbEbszzcy5A4KksDZTTDkHkZp8AKiclccEJ9hyM6tn06cLQ==
X-Received: by 2002:a63:9502:0:b0:386:3916:ca8e with SMTP id p2-20020a639502000000b003863916ca8emr24408663pgd.357.1649054552805;
        Sun, 03 Apr 2022 23:42:32 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.184])
        by smtp.gmail.com with ESMTPSA id s3-20020a056a00194300b004f6664d26eesm11071070pfk.88.2022.04.03.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 23:42:32 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Update Hemant's email id
Date: Mon,  4 Apr 2022 12:12:26 +0530
Message-Id: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The codeaurora email domain is no longer available for Qualcomm employees.
Qualcomm employees should now use the new email ids from quicinc domain for
opensource contributions.

So let's use the new email id for Hemant.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..d714313d5cb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12793,7 +12793,7 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-R:	Hemant Kumar <hemantk@codeaurora.org>
+R:	Hemant Kumar <quic_hemantk@quicinc.com>
 L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.25.1

