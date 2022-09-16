Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FFD5C83
	for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 14:43:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id 13so20941702ejn.3
        for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gllMF7rEKjn2stwt8zy38QVQBQaalDndHDH9GUJ9KbI=;
        b=aGU63eF0ffZjrabeXppQR6A07Z1vdKgRsAOOfVWaru5FTK02mInfQTd44/O915hd3v
         rnktJEUalIXx5b3WTn7/cUUCvVHv+JQloN0hjM6k5BmUzgF9VDGdCTDAmlYq3wqs4mPx
         BGIhOJb1lfE8DwyHwPeX7SP7rqqK0mvzzdbc9nwZR9hW2zRbJeN8glg5yVfK7oanoI/Q
         4tIHkmohMyhvbcoHh+1ayDXsgyJC2o3OwP2nKl0Ng6zCKq1Aut95LS3hCVewHy+ximsl
         8pdqrxCkwOHJmOQzFnr9MKVVFUM+O+6wxuFJMfHup92GBMyrZD1v5yHLGTrEYInFzGiF
         QG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gllMF7rEKjn2stwt8zy38QVQBQaalDndHDH9GUJ9KbI=;
        b=QoapMNxHSrOzXN5XTaio9ZQMI+xo4VWjmElGyp4lGw6Fq3Re6qOFzlbGhWHiyvvonc
         H8xH5Y7UPfIld3fFYV/0c5t4CE1eVgSVHXx2KE4KzjQ8eIOyqPuEmXsoaoai0mxEkObE
         XWuQamWWMGY6ZZgPOnfN90JbDm9/UI6zUOQjbB8V3gKulgdi1zMX+oSf++iomRufe+tb
         CuMyLLmsPL9oavfAN+zrpQxglh9TNiL2ijxLFiuxprDI5uTDlPrSSUU5fAHNI+jifKFR
         kOuA+9lLClRaIrYW0NCK0kEVrK4hm+uOYwzFQRGGCbcMQJZDfiXaTTZPRRfn2ssxl6hO
         8TJA==
X-Gm-Message-State: ACrzQf0jM2AdEFrYW+ri3eHjy5KVnnO9C1swe54KY37ILUpval27A7pY
	EhZIoeu0W89DUdvSNipVx6wdhaOOz28ALQ==
X-Google-Smtp-Source: AMsMyM6yuNIBAzryvbRBESypYb/cWw5mw3gBg1Qyg6kFhU6B+DCAix0l11fB0Esz6fJ+QP+eEiwhow==
X-Received: by 2002:a17:907:d91:b0:770:86d3:36e4 with SMTP id go17-20020a1709070d9100b0077086d336e4mr3591670ejc.687.1663339416784;
        Fri, 16 Sep 2022 07:43:36 -0700 (PDT)
Received: from labdl-itc-sw06.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7cd0f000000b004527eb874ebsm6273792edw.40.2022.09.16.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:43:35 -0700 (PDT)
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
Subject: [PATCH 1/2] net: wwan: mhi_wwan_ctrl: Add DUN2 to have a secondary AT port
Date: Fri, 16 Sep 2022 16:43:28 +0200
Message-Id: <20220916144329.243368-2-fabio.porcedda@gmail.com>
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

In order to have a secondary AT port add "DUN2".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index e4d0f696687f..f7ca52353f40 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -258,6 +258,7 @@ static void mhi_wwan_ctrl_remove(struct mhi_device *mhi_dev)
 
 static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
 	{ .chan = "DUN", .driver_data = WWAN_PORT_AT },
+	{ .chan = "DUN2", .driver_data = WWAN_PORT_AT },
 	{ .chan = "MBIM", .driver_data = WWAN_PORT_MBIM },
 	{ .chan = "QMI", .driver_data = WWAN_PORT_QMI },
 	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
-- 
2.37.3

