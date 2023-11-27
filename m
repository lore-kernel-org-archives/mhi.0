Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92A1DFD2
	for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0M3Jbry"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d812988394so1185389a34.3
        for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 04:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089157; x=1701693957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah8iq1Txz+5feKQ56aPHrEDMCkBylT8O2PmEcpgbM28=;
        b=b0M3JbryWkWowBLeUinbnPg6cqSVGnZfBUwb0+ABnhwSlQ0EpI8QolL434qOU0A9FK
         +ub7l0pGv5jBierlW407mS8xzafh5vm1t6uQRY9rnopTafX8Xs6nooteHjZbIj3p5H5h
         S28c1rK09A4Oo9TTMcEit10CKt0p86kcFhBVZqEimbNw9DwivJrrkqZ83Uy5MyGPNjHr
         Q7jCeyk3r+W3rsJ+aDRamJ6tHF2efaMmwopfdzFQPXQu1qsXMXdh22TQ/4nZbRN7bcQa
         DZPiYNEWucOFj0JQXCONiCysyZFstdBCAs7pDSeH19Vye5/Jf6uZ2ttVKFuDxVfiCs9q
         G90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089157; x=1701693957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah8iq1Txz+5feKQ56aPHrEDMCkBylT8O2PmEcpgbM28=;
        b=HKipXCDjowdyQU9d4EHdkrL7E1Sgajptoib9x61FZ1BXiDHKbVA9E6QGZ9SujlYaWv
         FOYtRYJGPU0J1uNRZBtaqrb70+dH25sDxgT3yn0G05VRYqSQEY67ey7fXqcVsEvAMXJp
         E3MAvJPe0c/PThNmGaFXRpR9epJcT9lgwDrgwT5Jz3/M4UMswZnCZSVF68MpGIQyNZvC
         54R05GhN0TRh4lLbZn8sjJH9ByqUeiITsiZ3t4u4WxaQBKPnQBfoX1tY0b96LTgF48+n
         WqCRyZm36rIZeLPT/1uFEaPD4ArbJYBWuTgs++8y7Lcv0CcM+3Q+/QVj4v/d4TizbK33
         fa0g==
X-Gm-Message-State: AOJu0YwpGTTDQIMO1fqU5ahuLcHF31BiXZ+BY7FysATssulXl/rfL2ww
	pOoYLKlH5znPB4sm+eChKcQh
X-Google-Smtp-Source: AGHT+IG8yTjpBWVehWRL+B7ZcIXrUSuHpjOgGUeYzRMY3Yi+8iNrXtu1MquzIqT++f3DfkvIy4QlUQ==
X-Received: by 2002:a9d:7d96:0:b0:6d7:f8c1:e473 with SMTP id j22-20020a9d7d96000000b006d7f8c1e473mr14360011otn.19.1701089157632;
        Mon, 27 Nov 2023 04:45:57 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:45:57 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/9] bus: mhi: ep: Introduce async read/write callbacks
Date: Mon, 27 Nov 2023 18:15:23 +0530
Message-Id: <20231127124529.78203-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These callbacks can be implemented by the controller drivers to perform
async read/write operation that increases the throughput.

For aiding the async operation, a completion callback is also introduced.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi_ep.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index b96b543bf2f6..14c6e8d3f573 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -54,11 +54,16 @@ struct mhi_ep_db_info {
  * @dev_addr: Address of the buffer in endpoint
  * @host_addr: Address of the bufffer in host
  * @size: Size of the buffer
+ * @cb: Callback to be executed by controller drivers after transfer completion (async)
+ * @cb_buf: Opaque buffer to be passed to the callback
  */
 struct mhi_ep_buf_info {
 	void *dev_addr;
 	u64 host_addr;
 	size_t size;
+
+	void (*cb)(struct mhi_ep_buf_info *buf_info);
+	void *cb_buf;
 };
 
 /**
@@ -96,6 +101,8 @@ struct mhi_ep_buf_info {
  * @unmap_free: CB function to unmap and free the allocated memory in endpoint for storing host context
  * @read_sync: CB function for reading from host memory synchronously
  * @write_sync: CB function for writing to host memory synchronously
+ * @read_async: CB function for reading from host memory asynchronously
+ * @write_async: CB function for writing to host memory asynchronously
  * @mhi_state: MHI Endpoint state
  * @max_chan: Maximum channels supported by the endpoint controller
  * @mru: MRU (Maximum Receive Unit) value of the endpoint controller
@@ -151,6 +158,8 @@ struct mhi_ep_cntrl {
 			   void __iomem *virt, size_t size);
 	int (*read_sync)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
 	int (*write_sync)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
+	int (*read_async)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
+	int (*write_async)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
 
 	enum mhi_state mhi_state;
 
-- 
2.25.1

