Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC607C
	for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 18:23:42 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id t36so11137238pfg.0
        for <mhi@lists.linux.dev>; Sat, 12 Feb 2022 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Au/mBqZaaQyBAGIOH8RzJibxV3VU/TZF+4arCyxvGTY=;
        b=KaOcepOdTQrhOR4AS8lQLqlzl7Q6jPb8Sp1fugWR2kck0NPwQOzIORI/gBTLGakR4r
         mta45Y/42w3HqwzwIkj6/ojghtSL2zLxZSBpfu9ehwvYwIpoTvRW9Tvpz3in4vnCEXkX
         etExvaeN8yYqmfniJum7ZrW+ExsK/EbPbwQaV/CTek6eZeKRGbPQVtdK+mYLrQBwiAet
         eXOKCOjgl+MtnfuOPNBYlWkoge4EMEZS7GG+887shkuPAZHEf9UZq+4UwPSAkY4WSZPo
         J4DJGVCOkVws3RtTh4QeGywhQzxrF7Fkm1qC38o8B6Zd71tcdeNXSX1v2y/8iE4QYkwF
         u0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Au/mBqZaaQyBAGIOH8RzJibxV3VU/TZF+4arCyxvGTY=;
        b=ZQ9KmhpzFhrmsbAJukTxFA4uwjzMCzjRMQtHmPjY44Xa17Y9Y56Jfl1stTucvSdtXZ
         914m1fSL+J2wUyBjEfU7uoyjLr8OTLsLVgieV9vug5tTXULgwq0C7FyLPpZwVuAVNplB
         CYzUQHwUVZl8sJHAh5663y4P7wsTjKFJdnLm/319DgoFZ3fuUq4s1gP179hAEvA7yY//
         syZWMtk+TAk5uh/BhI/Lii+Fj+G05ek8h+5hocqf/pARS1sXhAphvfw25/TAVgd9mIYs
         P2J6Qmz2EgNjPszxUMm1+k0+tmuwhmXAWWEkedrF6u2uhmVkpkABZEURo8NUSZRmre4r
         CUEw==
X-Gm-Message-State: AOAM533QP1xaiY4/ptAuTErZRvgIzK/DM1URiz1S1ycixz0se+i/99kW
	TaaLvtDoURFA2KuRPWF6VspX9gJuEmTTpKY=
X-Google-Smtp-Source: ABdhPJw7rtn/EqYS4Ti9SeALK9sOS/Hq/eKqV26Px0lGVYCc+iEb1T9YnhTUhEymkPvN7SoJF+YBNQ==
X-Received: by 2002:a63:4903:: with SMTP id w3mr5749982pga.5.1644690222170;
        Sat, 12 Feb 2022 10:23:42 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:23:41 -0800 (PST)
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
Subject: [PATCH v3 25/25] bus: mhi: ep: Add uevent support for module autoloading
Date: Sat, 12 Feb 2022 23:51:17 +0530
Message-Id: <20220212182117.49438-26-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
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
index 315409705b91..8889382ee8d0 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1546,6 +1546,14 @@ void mhi_ep_driver_unregister(struct mhi_ep_driver *mhi_drv)
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
@@ -1572,6 +1580,7 @@ struct bus_type mhi_ep_bus_type = {
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

