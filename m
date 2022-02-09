Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616C2F39
	for <mhi@lists.linux.dev>; Wed,  9 Feb 2022 10:07:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id t14-20020a17090a3e4e00b001b8f6032d96so1764214pjm.2
        for <mhi@lists.linux.dev>; Wed, 09 Feb 2022 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pmDkqthjssoHKJ9bLjod6j2IDm4LIWLx3+MkrpaPVXo=;
        b=BEiHMRnQ3d0uqlb0Y/CzgsGVZBB2yLJyXVGsAOrFWnfyYqANuKd6t5lz7go8EsGuky
         xK3B0ZBG4FSwqjzyq6DYa8w6jn59DWThbCY5cpojaE9ipy0eGuNaYs0Oo2bQaH2d6019
         bqsJ3YIVS8YdfQ3akS2Yev/WgX6GbrqYgitYIQCCoVo9sws0XBYLhsCm3KJanX/9rIED
         DB9JFBTIptea75yQNd4zR6KzavAzDVnoaRLpGFOSYAu9IlXR6TtfxA/TQAPUnBwMlIPp
         ozMDVBu++TO0jPtE2k8rtqu0zPGM7y9I/E3BTm+aI5XNtqbbd57V+Cg44HiCJAr+sUKL
         e8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmDkqthjssoHKJ9bLjod6j2IDm4LIWLx3+MkrpaPVXo=;
        b=h1n8TRM1LZ7IghGVckKxFfBFZL1hri8PZCRubPLnJCpnmbtpbrvriMI6qEJsMRidHX
         d/I6uvJOZYeLJj8M7GS9A343exNtdH3UcJG8+1cG2loqtlNqxLOsvaHHcHcZXhTh5f+f
         lqykEAtS0UusD+OjVMpJGDrl9xe3+y8fgLBvNHGnOeRGd6dOCXYAfmNJgYkTTex5rlt4
         qcliuzvItsOlBY0Z2J16HMdhn+BEx0VF2yIN4K0+F758q5w4yHd31SPY8lK11vm0iMh8
         BUO18dszCzYRkgRLuck392owWD3UWwv4Duq+JTKuLXn6IP6IDPb7lpz+h1TjnrLZTIQP
         uf0w==
X-Gm-Message-State: AOAM530Xh1CE1+L2QKlFLM1X467KBdJ4zto3VpGf7sL9daT9P8ogXccn
	atH0rVLvi59xyU70nN6RnRR5V4qS/XjKB14=
X-Google-Smtp-Source: ABdhPJzS+FgYIm8PZLlg8rh64dLRyOt2elhMgWkhYPdGcwQ+ro/gZGH0+GRW613NtZNUMyjPQW3PgA==
X-Received: by 2002:a17:902:bf06:: with SMTP id bi6mr1380824plb.24.1644401242187;
        Wed, 09 Feb 2022 02:07:22 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id p2sm6722024pfo.125.2022.02.09.02.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 02:07:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	quic_jhugo@quicinc.com,
	vinod.koul@linaro.org,
	bjorn.andersson@linaro.org,
	dmitry.baryshkov@linaro.org,
	vbadigan@codeaurora.org,
	quic_cang@quicinc.com,
	quic_skananth@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	elder@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 23/23] bus: mhi: ep: Add uevent support for module autoloading
Date: Wed,  9 Feb 2022 15:26:24 +0530
Message-Id: <20220209095624.26389-24-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
References: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
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

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c       |  9 +++++++++
 include/linux/mod_devicetable.h |  2 ++
 scripts/mod/file2alias.c        | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index ed3dbca170d3..c70062f92c03 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1547,6 +1547,14 @@ void mhi_ep_driver_unregister(struct mhi_ep_driver *mhi_drv)
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
@@ -1573,6 +1581,7 @@ struct bus_type mhi_ep_bus_type = {
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

