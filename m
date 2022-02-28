Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB607B
	for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 12:46:22 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id ge19-20020a17090b0e1300b001bcca16e2e7so10257762pjb.3
        for <mhi@lists.linux.dev>; Mon, 28 Feb 2022 04:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QFXLiL0cwfTscTFGdegC8jG7wPHkkmACZCaIlJcMC4g=;
        b=uzElxq1Co02OjZSETgAp4AlzySZjyNblnTFSlL6ekEy2Jd+SYgQjYwySYZULAQ7q2x
         8ZiFV6Cy+0OSBZnvRjTjOKqS7pEykVqaaj4UyeRYCEsn38pCIU/up2IWhy7HVzLPiPn3
         EPCp/22b8zYfInCnTEp8RFODkrUhClj3vhG0XN73OSdiYlKYdjbZlTljavaUez3WwyQa
         WIb4pfGWNRgOU23cpCL5KI6wV94q1UvV98RP7k2QkvvYRlWDxa3KmvXFCUU3/l3U4ALX
         EPZJGDY4CVabi3WzRpEopru76oAs5ypeAU/527dDy0DnyXcJh/YlCZNHEiLtDGOR2Fbn
         oSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QFXLiL0cwfTscTFGdegC8jG7wPHkkmACZCaIlJcMC4g=;
        b=Hx5TsHgDUZBhimR+jD2k68kiL0fg7Jl1GjmSmDYJWIJMsavxCu0VYY9iP/spkiJBuJ
         O2aSKv2F0dgIgp3fk2U5XZtgT2vcdW0fLur3+Dg546E0Caoy3SaD2r4q+tMms26ytxXZ
         R4vJR2RaVf2SvyO2v/Ahm1hn2bsKX7Z08TqZ0rf+szRFp+EKGqVzS4dZWidm3NXpV9O0
         OYDuedl8nYGH97Pm45oy7BPzkRVMdfsEvwocnTm+7kGCUbLz8zj/jyCVClVb+O8tZ8gg
         ALC2fDL8LPyUMhcZTPSoiZMv2XxIr4wSHjOGVZjzOrGxodWCStoO3BzFTKZeppNCMG3A
         wn2Q==
X-Gm-Message-State: AOAM530JdbsSvYuLU0npkHoysOCWAF/v9fRjopWldTbasmvv0ysd/cI2
	HAf7ZEpwSLe7aS7FoEcyzJKDeBXgbH4W
X-Google-Smtp-Source: ABdhPJz/l4Rjc3SB1CTovpEU0dkPgKs8YNHZfoD96r0SBLyth0Gw6PheAT7YlRKYUk769a7WkNkUSQ==
X-Received: by 2002:a17:90a:241:b0:1bc:1def:a8c5 with SMTP id t1-20020a17090a024100b001bc1defa8c5mr16469088pje.105.1646052382269;
        Mon, 28 Feb 2022 04:46:22 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:46:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	quic_vbadigan@quicinc.com,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 27/27] bus: mhi: ep: Add uevent support for module autoloading
Date: Mon, 28 Feb 2022 18:13:44 +0530
Message-Id: <20220228124344.77359-28-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add uevent support to MHI endpoint bus so that the client drivers can be
autoloaded by udev when the MHI endpoint devices gets created. The client
drivers are expected to provide MODULE_DEVICE_TABLE with the MHI id_table
struct so that the alias can be exported.

The MHI endpoint reused the mhi_device_id structure of the MHI bus.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c       |  9 +++++++++
 include/linux/mod_devicetable.h |  2 ++
 scripts/mod/file2alias.c        | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 3efdbf924076..ce59f38b59a7 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1568,6 +1568,14 @@ void mhi_ep_driver_unregister(struct mhi_ep_driver *mhi_drv)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_driver_unregister);
 
+static int mhi_ep_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
+
+	return add_uevent_var(env, "MODALIAS=" MHI_EP_DEVICE_MODALIAS_FMT,
+					mhi_dev->name);
+}
+
 static int mhi_ep_match(struct device *dev, struct device_driver *drv)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
@@ -1594,6 +1602,7 @@ struct bus_type mhi_ep_bus_type = {
 	.name = "mhi_ep",
 	.dev_name = "mhi_ep",
 	.match = mhi_ep_match,
+	.uevent = mhi_ep_uevent,
 };
 
 static int __init mhi_ep_init(void)
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4bb71979a8fd..0cff19bd72bf 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -835,6 +835,8 @@ struct wmi_device_id {
 #define MHI_DEVICE_MODALIAS_FMT "mhi:%s"
 #define MHI_NAME_SIZE 32
 
+#define MHI_EP_DEVICE_MODALIAS_FMT "mhi_ep:%s"
+
 /**
  * struct mhi_device_id - MHI device identification
  * @chan: MHI channel name
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 5258247d78ac..d9d6a31446ea 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1391,6 +1391,15 @@ static int do_mhi_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* Looks like: mhi_ep:S */
+static int do_mhi_ep_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
+	sprintf(alias, MHI_EP_DEVICE_MODALIAS_FMT, *chan);
+
+	return 1;
+}
+
 /* Looks like: ishtp:{guid} */
 static int do_ishtp_entry(const char *filename, void *symval, char *alias)
 {
@@ -1519,6 +1528,7 @@ static const struct devtable devtable[] = {
 	{"tee", SIZE_tee_client_device_id, do_tee_entry},
 	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
 	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
+	{"mhi_ep", SIZE_mhi_device_id, do_mhi_ep_entry},
 	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
 	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
-- 
2.25.1

