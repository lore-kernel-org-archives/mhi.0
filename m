Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E932CA4
	for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 08:13:20 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id r34-20020a17090a43a500b001b0f0837ce8so1790389pjg.2
        for <mhi@lists.linux.dev>; Thu, 16 Dec 2021 00:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vC6zsX1z5vnUW+lKaZ0nR4WtPfovJbiEibZW3cAtkqE=;
        b=qmODtu4fVv7iuTsPNb+bP9PC612zKiobeXGdkynk48IH+EWY/PdpuoHhHEgSGz5uuk
         j26oJHztCG004ALOnTJRS2ECKPpIQpU9b5Cuxf8DPnCot8Va/tzpbt7OFa5WQxX8ugNx
         QfKp/ZxWi5NcUiiKdJp9+Oz/EKbgkLlWTQ2yKm+Dg9czp7OLRMBzZEofKxhcKO/pndr2
         G+62DRD0TiSoTJ4RAcI1Hpx5KR+HHYYLBQamYEHhq2z2xupObGpSXY2/HCCqRBThSB3E
         pjxTuEynC9MgQJxZNCH60DxijLVS2wYhCwFYNugUTN+Ld+aTw7Ii/Qt4e8gsMNcx0LXX
         8kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vC6zsX1z5vnUW+lKaZ0nR4WtPfovJbiEibZW3cAtkqE=;
        b=prQ/VA1WtLkT0HIY3suVEsofU41LxkSF+GuixO8RWgfbwY4G7jwwnQItEvFdDsioOH
         YUjrP3tqwYwKuRs1yBX5/AX7KOWJukXtimMFfCgiKe3RZyBHVNS8ufTku5MWQEiHFgLA
         baat9orDiYYNiZGQrla/2+aeJbsh9xt6J+qAHW4fAaPBFgdxF+K+d2wih8K++jXnu3i+
         GArc1Lfh0Sz1w6q2lmxupgUDyOwW2g4z587XPHfKg2N+WGvdRuicl6GHlF50/pB9Pvt/
         eFxqOmsgecImsu6PEzUUFRl/b7b39pj9vSYCmzpUpwoITNPx9T0AhmDeTWHSxaFliTFK
         Brig==
X-Gm-Message-State: AOAM5338djRrahdPvODQUApXPj02vt0nMXcMldEKa6DfeV7950XQIHnX
	q7so0toVieeJ9XJPQ8XYIw0v
X-Google-Smtp-Source: ABdhPJwKNizbWzfhG5HbZ69FmunvbcaHaIOazuKTjzkxdGQMdMTcvK0dVXqJAngYfM52YIoh5gm6cw==
X-Received: by 2002:a17:90b:3143:: with SMTP id ip3mr4688553pjb.34.1639642400135;
        Thu, 16 Dec 2021 00:13:20 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:13:19 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	loic.poulain@linaro.org,
	thomas.perrot@bootlin.com,
	aleksander@aleksander.es,
	slark_xiao@163.com,
	christophe.jaillet@wanadoo.fr,
	keescook@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Bhaumik Bhatt <quic_bbhatt@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/10] bus: mhi: core: Fix reading wake_capable channel configuration
Date: Thu, 16 Dec 2021 13:42:23 +0530
Message-Id: <20211216081227.237749-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
References: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bhaumik Bhatt <quic_bbhatt@quicinc.com>

The 'wake-capable' entry in channel configuration is not set when
parsing the configuration specified by the controller driver. Add
the missing entry to ensure channel is correctly specified as a
'wake-capable' channel.

Fixes: 0cbf260820fa ("bus: mhi: core: Add support for registering MHI controllers")
Signed-off-by: Bhaumik Bhatt <quic_bbhatt@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/1638320491-13382-1-git-send-email-quic_bbhatt@quicinc.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5aaca6d0f52b..f1ec34417592 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -788,6 +788,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_chan->offload_ch = ch_cfg->offload_channel;
 		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
 		mhi_chan->pre_alloc = ch_cfg->auto_queue;
+		mhi_chan->wake_capable = ch_cfg->wake_capable;
 
 		/*
 		 * If MHI host allocates buffers, then the channel direction
-- 
2.25.1

