Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E9A3236
	for <mhi@lists.linux.dev>; Mon, 27 Jun 2022 17:05:20 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id s124so13758470oia.0
        for <mhi@lists.linux.dev>; Mon, 27 Jun 2022 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hiy6+iiLMeGDFL3yjWewYCuuYeu2rtEHRH1Mk/XtDns=;
        b=QyMvNo8m4T4TgwC1HpgS28kutB5bX/froVFu40QZNr8jKdGTdFzyVD0Eho8FO90ag6
         b9PdDHM8MvcHpcDYzcGhJLRYWlCSfwv0JEO9m4YwDjiM70RE/SY9DYTsVTol0wEl4oj4
         y+rJU6jj4JNSYVaaDRSsIuTl92Jf5FV1LIhBxyOy0GhjOLS8S16EqNjLjq+u3/FxSB7N
         xZnfg2lS2BkhbtVMXoI/4p2sjmgnSrwquLhrO0kstzVdFaO9twKcFerIbX2zxSQ4NsZo
         pq5KOIMlue1YiiqONpRWXmDpwDlNf5eJuwTajSGUoJCP/jT4p4BnPoweMItLaYxbb3/d
         wrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hiy6+iiLMeGDFL3yjWewYCuuYeu2rtEHRH1Mk/XtDns=;
        b=atWz9/zrI6+YjdP4W2yoeXAEFQT1CUXF6lkBGwIWM3VmlmFlDxbv3iiL/woEbfbeQp
         hD6K/7zwmTgLzRzW4kKzAnxF3ZGRPYHiZcGPkf4aTY2hrn1ps9PwY+z9u3ewEVGMfsE+
         X3J8st2fb64USwdhpfKJezDvERKGme8GGVHNNvQMRCqN1DMGlACFwE77usNIZghVJzn+
         CCUN6z6dkacm8EXFkV0Cdi9EmjFp51COMnQz4FjDyVbjWL8HyBQLsZeyLnhPfSYNfe/7
         VWxWLTQYcLbXW+6URovjEj6ex+m42rHgAWcQlM0Rs3CCXljNEbEPPqCQTrCRh7lUDWcg
         ohZg==
X-Gm-Message-State: AJIora8hOXk3g1+LmpsELp5qq4L0i5S8bJh1l1ASKK55gQIIq5DxkviN
	JOtAZjGYmFWp82gWCgQLPUcGCg==
X-Google-Smtp-Source: AGRyM1sY/DvE1sLhaZz0G6NJ4ve3bOkQmSv9AL7zpQxIJqIY3FhpZKQIVsCNUjWlNP6i46JvXnLxJw==
X-Received: by 2002:a05:6808:2111:b0:335:510c:eee4 with SMTP id r17-20020a056808211100b00335510ceee4mr8161509oiw.151.1656349519431;
        Mon, 27 Jun 2022 10:05:19 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm7303175oaq.55.2022.06.27.10.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 10:05:18 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: Add another Foxconn T99W175
Date: Mon, 27 Jun 2022 10:07:17 -0700
Message-Id: <20220627170717.2252335-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Foxconn e0c3 device identifies itself as a T99W175 X55, add support
for this to the pci_generic driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 57d5f611a979..bf82d90f9ca9 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -571,6 +571,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* T99W175 (sdx55), Based on Qualcomm new baseline */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* T99W175 (sdx55) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0c3),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* T99W368 (sdx65) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d8),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
-- 
2.35.1

