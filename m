Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A355C83
	for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 14:43:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id y17so44893422ejo.6
        for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ot7dgyB+KtHLDN7Xyqgw/4QKfFL14qXZyomQmyozivc=;
        b=TBL9jjzQgiXJcDlPnuYA0DP07U23BwTRwfRHAOhLJt/wUIozpDKbBdwxSdYrxtzZNX
         1gwg2rs5lAZnRaTMpYlR/fEVejvKMoY9mplZz5Oux0xqY/sgLqMuPOduMedGkqwJakGU
         Oo0LTT2C2xFS4/rmCaxLU4gplP5/MR0Wj5eIGlJqBYXdzD73OC7aotFdtXdRUlgfJzpW
         l9mstCpFOFw9owE6zxP0Zbptb/WGBbL1ceXt/pENXR1VW/jnQbLlSfd0HJVydM/zhNT+
         om8nkdTPcDxE/J8l171h9JUw2g5M66ZhYC0vkqWbYpH66pKNuxNNPjsylp0mJYOmxPR2
         Gm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ot7dgyB+KtHLDN7Xyqgw/4QKfFL14qXZyomQmyozivc=;
        b=yJemldwIx9O/APel/fPxtFNZnzY/qmj3nRyGXjdIxIig/T3IJmPmpZ9azi2dI/ZLTG
         Tj7KDlsqVAIa50U9KpdKYsQlrGQWl402jumgQGDt7PGVJF9jhLWQTQKQhDuFnu3CgSQa
         YrHVi5czAmTs+WKmf5iajW2AV4nzzz4dOoujfJlRq1yvjtcPfDTiNrVw0Oko5nmt+6mW
         5+Ne+HhMLtQrqrGiTtCdrgAoOJSIHi4odLHpmUKs052a+/zDHMJ9pvUSjK00BWCHkEUo
         BTOCbpoi1UuxIiq8gLznrTLRTL3MrGSDgrvUKraK9KjQJ5rwVdEUfeLtqqPnSawCbeCc
         Su/w==
X-Gm-Message-State: ACrzQf0VKpx/K2bl8Pa9otW9pZPYqt6BwyotCeKmwIn/zx4cCHUDc+FV
	/0Tjafk1nKAySWzhAVdfkJ9frxQhVym9Ew==
X-Google-Smtp-Source: AMsMyM4dkscApZ9i0ayoK9S6XBYFSlZGHUE4c8o92NL9XHVxUl7n8gZKN152nsNzzBO6NPSSKDVplQ==
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id ho30-20020a1709070e9e00b0077f96882714mr3915614ejc.208.1663339418500;
        Fri, 16 Sep 2022 07:43:38 -0700 (PDT)
Received: from labdl-itc-sw06.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7cd0f000000b004527eb874ebsm6273792edw.40.2022.09.16.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:43:37 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	mani@kernel.org,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: dnlplm@gmail.com
Subject: [PATCH 2/2] bus: mhi: host: pci_generic: Add a secondary AT port to Telit FN990
Date: Fri, 16 Sep 2022 16:43:29 +0200
Message-Id: <20220916144329.243368-3-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916144329.243368-1-fabio.porcedda@gmail.com>
References: <20220916144329.243368-1-fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a secondary AT port using one of OEM reserved channel.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 51e2b901bae0..caa4ce28cf9e 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -507,6 +507,8 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
-- 
2.37.3

