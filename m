Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7C1C13
	for <mhi@lists.linux.dev>; Thu, 29 Sep 2022 14:01:25 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id lh5so2980878ejb.10
        for <mhi@lists.linux.dev>; Thu, 29 Sep 2022 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=7NYIbesMJ2B59ItmTW7eVwTp9j+TaFM7RI/yFrV8y2o=;
        b=hr/0b9DZ234qAvNtBg8Rlc3EAdzMRzi8n6U3UIkN69rMCHLsQtm2UiLuStqkGl/f4I
         DpFFzmdgi5XhztK504fTMyp9CNdOSJjD5BVRDXSPmuAv44T5+hlO9SacKHmYnpedar8J
         D+ErlCR7JtXGqgHfW4pZL2bKy61LBeRWoLBbTSHmewZd29a8tL84pwiB5pPekL5GMaL9
         tSSBSKwBSFJ87/NCk4pB3wVIzRezz8Z6+DWmecvkVw7iWOjStsnCPwMpgr8vfgXuyPnO
         UGX49+Uu7TuZhs1JK2Vd5Bmm0lkIDNY1oShx3YBrR68lhh3XF2vy0kM0wLbqHQg9AL4x
         b6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=7NYIbesMJ2B59ItmTW7eVwTp9j+TaFM7RI/yFrV8y2o=;
        b=uMz0NBzg2ypQE9Gv+7lmC4u7GFzL3bAbuBxLMNqti42R4dLqCH6feH9kGWWqWX+PhI
         Um+TTVKtPkNsmketg+/FGbQJIMFpSkHiu4nW/BnAbmrk8Y1jWcTS8IupemxxYvddjOo4
         3jYxUlUGB6eV3XsJz6vzbVhLXInZ+BbP2/4hPER2yYxDlaJ2mwn1ThwQUArky9ftynfX
         wgCZ05JX7X2M7X4Z5gd+02PUWPNyqoroKTg4K5u+BuRL4JwOlx0WC0f4sGeAaMMgsqVU
         t6S/hSWlwJzJW+65Apq3kxppleULXbk6YWjXCyeshvYa98VUvygDfYg12XYM02wNrY5g
         /k4Q==
X-Gm-Message-State: ACrzQf184D2NuiGpvI44nigc8pXWjN+/RvImnuTTyV5eUxccwi142/q+
	8S8X9jK0p5Z2goyiy+H81wLkknWG00jUaJRwfDnYPN7utQ8Yyg==
X-Google-Smtp-Source: AMsMyM6t2PwmYYx1RGzjEI0PEGAXHinvqvBJiQjsQYWU4FC1oVfNiZLyD0o/mUJPVy/mZeSPa4GXXTddDO5dCFNftIw=
X-Received: by 2002:a17:907:96a0:b0:782:9633:2751 with SMTP id
 hd32-20020a17090796a000b0078296332751mr2816192ejc.359.1664460082936; Thu, 29
 Sep 2022 07:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: notsyncing <song.fc@gmail.com>
Date: Thu, 29 Sep 2022 22:01:11 +0800
Message-ID: <CALL0vWGr0i9Qaf6PYH3V7C5wbV36wSWUSOWKL83uECY9iN+8JA@mail.gmail.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add HP variant of T99W175
To: mhi@lists.linux.dev
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Hemant Kumar <quic_hemantk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

The foxconn T99W175 has an HP variant, so add support for it to the
pci_generic driver.

Signed-off-by: Song Fuchang <song.fc@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c
b/drivers/bus/mhi/host/pci_generic.c
index 9e545f2a5a26..650e8b9c26ad 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
     /* MV32-WB (Cinterion) */
     { PCI_DEVICE(0x1269, 0x00bb),
         .driver_data = (kernel_ulong_t) &mhi_mv32_info },
+    /* T99W175 (sdx55), HP variant */
+    { PCI_DEVICE(0x03f0, 0x0a6c),
+        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
     {  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.37.3
