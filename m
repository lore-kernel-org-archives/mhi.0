Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1672C80
	for <mhi@lists.linux.dev>; Fri, 26 Nov 2021 03:14:15 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id h24so6317866pjq.2
        for <mhi@lists.linux.dev>; Thu, 25 Nov 2021 19:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOPkYIC9MBDg3QKppD+I6WeSKkJEENVHD/2UOgJbqlQ=;
        b=tDvaWOQvxAj8Tv3TOTfo5fteGwqmptg8AXIPZDzS45YiZpkeI7XtI7L5lMAc6RybKp
         Z72N23jpJii27T1pKbfneBQ4a/NepSAodtk02sl1wsn9CCEw2ihGCEeNZJROEXUNXvO3
         a8yDURi4Qdn843DWmFReXRnyBRgvuMd3pYOTOsy/6hzZsoLTArWcYA5Dz2S1BeiRoJSo
         2VdCtNV4TFLkeERdrGOEssdfCilaOiXd9Aq+JBo1Hg1b2SfoLlnhmJJZuqXGGhlLvN8I
         3DhvCec2gd9ME0QnaiclJx2ervfJfASJJWdPK0fyiShjo8PsOkQvVhLvJ/rwyJ1X+zSJ
         zXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOPkYIC9MBDg3QKppD+I6WeSKkJEENVHD/2UOgJbqlQ=;
        b=SLwA1FLVocAtNYqc77BgsqF4oDZv/dv4pDn0i65ki9o7zejEALIRT171zLXpBCkO33
         xP7e1aNIBYUkdvc6cL9+Ech47q7gbu5z4XBBHO3xBIaLa9w6y3UtA0iJwZWgjTVzmvxQ
         1alUD075FiWYwTNrPwU2gD921R4Zl+Aoc0DKzG1EDoj++NYQsFdJIG6G4quGmKY4tQ0l
         phIzIejEtCkmi9cCsCVxgPJMYC3i8qqJlX3KsfTYrve+h32mezos78drdMEndXx/+fuq
         AU1RXQlhA6ZTun/lEus3sN+Gej/PmKR5LlRRpax8o9eX+Orvvc9Kh7iFyVIJeMXGfm6S
         S3dA==
X-Gm-Message-State: AOAM533Twu0lY+6mFkfXAibWHCKIspmRIMJPSc+YN6G5IJCQVBzEY9WI
	o3v5TYfNqdHsSr0Y04a2FXr2N6QD8m4E
X-Google-Smtp-Source: ABdhPJxyt+KG/J5PtzOvFTRPMYQ+OP3jqecdQQvsfzNjIyfefphthNeYkRwRrF7jcJg8QqPt4gfHOg==
X-Received: by 2002:a17:902:e806:b0:141:fd0a:2201 with SMTP id u6-20020a170902e80600b00141fd0a2201mr34512574plg.48.1637896454782;
        Thu, 25 Nov 2021 19:14:14 -0800 (PST)
Received: from localhost.localdomain ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id o9sm3815088pgu.12.2021.11.25.19.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 19:14:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: Minor style and comment fixes
Date: Fri, 26 Nov 2021 08:44:03 +0530
Message-Id: <20211126031403.8075-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the below checkpatch warnings in MHI bus:

WARNING: Possible repeated word: 'events'
+	/* Process ctrl events events */

WARNING: Missing a blank line after declarations
+			struct mhi_buf_info info = { };
+			buf = kmalloc(len, GFP_KERNEL);

WARNING: Move const after static - use 'static const struct mhi_pm_transitions'
+static struct mhi_pm_transitions const dev_state_transitions[] = {

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 3 ++-
 drivers/bus/mhi/core/pm.c   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index b15c5bc37dd4..930aba666b67 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1065,7 +1065,7 @@ void mhi_ctrl_ev_task(unsigned long data)
 		return;
 	}
 
-	/* Process ctrl events events */
+	/* Process ctrl events */
 	ret = mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
 
 	/*
@@ -1464,6 +1464,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 		while (nr_el--) {
 			void *buf;
 			struct mhi_buf_info info = { };
+
 			buf = kmalloc(len, GFP_KERNEL);
 			if (!buf) {
 				ret = -ENOMEM;
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 0bb8d77515e3..7464f5d09973 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -42,7 +42,7 @@
  * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
  *     LD_ERR_FATAL_DETECT -> DISABLE
  */
-static struct mhi_pm_transitions const dev_state_transitions[] = {
+static const struct mhi_pm_transitions dev_state_transitions[] = {
 	/* L0 States */
 	{
 		MHI_PM_DISABLE,
-- 
2.25.1

