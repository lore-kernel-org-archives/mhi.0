Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF920EE
	for <mhi@lists.linux.dev>; Tue,  7 Mar 2023 07:42:59 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 16so7042095pge.11
        for <mhi@lists.linux.dev>; Mon, 06 Mar 2023 23:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678174978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCVxab7eeIvoCYFhseZDKzvVXTy0q475R4rKd4ZTd+o=;
        b=xN+dBpAHLyfdr+jLD2boIzn+4DBUS/ZfK7oEQdn63WdI7ELYxRNzjdz9/yadb61cyk
         w/PIWOcAqfyWRRAvN1rYSy+QHMB1fNYXYG+QwXz1Lt+rEtPSI8GPyFrNR382kWjqjlyu
         x0Gs7kS2R/fuHD1j7Np1krpQHMfE+Obz24bha/X6TGlSPLwPtq7hp2pacR8VdRvciuK9
         auJfWnqtJfrgwlkBGo6BOtA4xUfBRPErvQViuxYtUwvqMIFmjyZDcWBAQxt1QXDeHi0F
         mCZtBTDv7dhEzSBVn6/fZAIVc4Cve3Q0p322uUNuQuHlqqVXNuoOtoSTh/UiNL5pL/tL
         aXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678174978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCVxab7eeIvoCYFhseZDKzvVXTy0q475R4rKd4ZTd+o=;
        b=MRyXtZcUcgJxaiQehjDZrf4JpzSBZMFTNRqmdeTbB2ze32RiflHc8fxnifwx+9lX1K
         E/xGZIa60fcG0g1cVXe1ltYvIf2nQFYEr/6JFOb9rDRTad34C+rpvnZconSS5EBGZ3Ad
         OlJ55StS5kxOxofoV2am/0iCmrp/GBZsT2oczIR7TlA96g9NS6GSwM7oqlZyV31miSMU
         uF1xF8ChceWYgYzdaA2xVwmOBSnxv9TcYQ1cnvs7Kr2X9NC0IeKJQwa/FEYwAlKmKZwa
         v4+XVLoWjXWB0LDkIw1rKEyYX0uEuy8ylBUCBV2LUMAj8dOtnsv7RkHevyfaT6+V9CUG
         GPxQ==
X-Gm-Message-State: AO0yUKXd0RpeXCKK1H2FupPmHUZCSe32TjB93+m5CIalESch3vlbc0hc
	b7amVzeAhy9FhJLtKAGkudHupqxkKJvnnhsV6w==
X-Google-Smtp-Source: AK7set9AQJg3JWQ2XDlVhjMlGGNAUyGIS+uIongGWw84/OEZkeE2PhD9LarXt5uNqvHDVeNfePLBKg==
X-Received: by 2002:aa7:9497:0:b0:593:c9b6:dc5d with SMTP id z23-20020aa79497000000b00593c9b6dc5dmr10445797pfk.0.1678174978413;
        Mon, 06 Mar 2023 23:42:58 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b005afda149679sm7535567pfo.179.2023.03.06.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:42:58 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: ep: Demote unsupported channel error log to debug
Date: Tue,  7 Mar 2023 13:12:48 +0530
Message-Id: <20230307074248.86731-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all MHI endpoints will support all available channels. Most of them
support only a selected number of channels based on the implementations.
In those cases, it is not needed to print error messages in the endpoint.
So let's demote the error log to debug.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 48bc6abb7b37..ba062df4fe25 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -126,7 +126,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 
 	/* Check if the channel is supported by the controller */
 	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
-		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
+		dev_dbg(dev, "Channel (%u) not supported!\n", ch_id);
 		return -ENODEV;
 	}
 
@@ -702,7 +702,7 @@ static void mhi_ep_cmd_ring_worker(struct work_struct *work)
 		el = &ring->ring_cache[ring->rd_offset];
 
 		ret = mhi_ep_process_cmd_ring(ring, el);
-		if (ret)
+		if (ret && ret != -ENODEV)
 			dev_err(dev, "Error processing cmd ring element: %zu\n", ring->rd_offset);
 
 		mhi_ep_ring_inc_index(ring);
-- 
2.25.1

