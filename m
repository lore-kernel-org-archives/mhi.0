Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEFC5CAB
	for <mhi@lists.linux.dev>; Tue,  1 Mar 2022 16:03:46 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ge19-20020a17090b0e1300b001bcca16e2e7so2313443pjb.3
        for <mhi@lists.linux.dev>; Tue, 01 Mar 2022 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AmaSgv84IWNODZjOLL+ziGnUZhBepok+ar+ZuBsoOxY=;
        b=EBA9mscxKlH4XihJY+JdFdo2tJH97AxNAEImEl9y7O0QT3e/EKAIEEd6ykc01pzSQp
         flIVPoYpFVeE48Z+hGF3frmZfdGAwUSAx6CQlLEb2Ai9ut3l1XkqIDB4XTOtpwqKmVbf
         My3Hsq+H1xtnqqH2Blf2etrR30k2ZryEFU6tAJOFOqlMtnd0mTjHQoMMHM4szUWlBGVG
         hPv7zKp2sDyA1kXyd5ljqQRoD+ufbHaA5OrB1EGAjGNpQST4PA5ZcxHRiizK6zl+X18R
         dOYI9+rks0F931629mREAjk/ZN/x7NjReUR75gf+2+7OPqYT9YZiowlsQgF+Bnzuim/O
         dU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AmaSgv84IWNODZjOLL+ziGnUZhBepok+ar+ZuBsoOxY=;
        b=1/7XN++nH/28Zy3oyI/b4OsqGeV4XgjoD6I/0PH44BHUu/speszsmLNAdEUF2iOGjE
         AdVURvclja3VxKg2bWjwobnfGnMZWfZk8P5ruk3auDSh3beaqCI1TzDMUk5SU/rVeCaV
         z71Cjj+B2cElVDNIEKP5xWxBKhXen0pp/DPqfCYAK6tLXVGWuZSxjZBS5K12KktoreAG
         fQ1+c6s8j2VmFEMSUX8ROOkiZRwg43Qf5Q+oK0L1Iz1D/Vf8A/sopDzqSZGVGqtgYdi8
         PQGcmrtpC9MFh1WYmXwFncAZQ8UY44689sRcixIvJ8Sw+3GY1013e5QyqUbYijlbJIXh
         lGmw==
X-Gm-Message-State: AOAM531WoFb6wfcG5DsaCQVl8tvfZpCDaUZR+MPEPunrSc19sNhjVb69
	CnlqIxFCVYfIZVJojl6kdL53
X-Google-Smtp-Source: ABdhPJzoC4JPC7eN+qcgeSr05DomhBLAFgB3CfV8rFFSLtlwlLQv7jPeEA1S7ogi6EvJp5osYmx5kw==
X-Received: by 2002:a17:903:2283:b0:14f:dd52:33d4 with SMTP id b3-20020a170903228300b0014fdd5233d4mr26194547plh.95.1646150625676;
        Tue, 01 Mar 2022 08:03:45 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.80])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm2489530pjn.34.2022.03.01.08.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:03:45 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	elder@linaro.org,
	paul.davey@alliedtelesis.co.nz,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 06/10] bus: mhi: Use bitfield operations for handling DWORDs of ring elements
Date: Tue,  1 Mar 2022 21:33:04 +0530
Message-Id: <20220301160308.107452-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
References: <20220301160308.107452-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using the hardcoded bits in DWORD definitions, let's use the
bitfield operations to make it more clear how the DWORDs are structured.

Suggested-by: Alex Elder <elder@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/internal.h | 58 +++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 156bf65b6810..1d1790e83a93 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,6 +7,7 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
+#include <linux/bitfield.h>
 #include <linux/mhi.h>
 
 extern struct bus_type mhi_bus_type;
@@ -205,58 +206,65 @@ enum mhi_cmd_type {
 /* No operation command */
 #define MHI_TRE_CMD_NOOP_PTR (0)
 #define MHI_TRE_CMD_NOOP_DWORD0 (0)
-#define MHI_TRE_CMD_NOOP_DWORD1 (cpu_to_le32(MHI_CMD_NOP << 16))
+#define MHI_TRE_CMD_NOOP_DWORD1 (cpu_to_le32(FIELD_PREP(GENMASK(23, 16), MHI_CMD_NOP)))
 
 /* Channel reset command */
 #define MHI_TRE_CMD_RESET_PTR (0)
 #define MHI_TRE_CMD_RESET_DWORD0 (0)
-#define MHI_TRE_CMD_RESET_DWORD1(chid) (cpu_to_le32((chid << 24) | \
-					(MHI_CMD_RESET_CHAN << 16)))
+#define MHI_TRE_CMD_RESET_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid)) | \
+					FIELD_PREP(GENMASK(23, 16), MHI_CMD_RESET_CHAN))
 
 /* Channel stop command */
 #define MHI_TRE_CMD_STOP_PTR (0)
 #define MHI_TRE_CMD_STOP_DWORD0 (0)
-#define MHI_TRE_CMD_STOP_DWORD1(chid) (cpu_to_le32((chid << 24) | \
-				       (MHI_CMD_STOP_CHAN << 16)))
+#define MHI_TRE_CMD_STOP_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid)) | \
+					FIELD_PREP(GENMASK(23, 16), MHI_CMD_STOP_CHAN))
 
 /* Channel start command */
 #define MHI_TRE_CMD_START_PTR (0)
 #define MHI_TRE_CMD_START_DWORD0 (0)
-#define MHI_TRE_CMD_START_DWORD1(chid) (cpu_to_le32((chid << 24) | \
-					(MHI_CMD_START_CHAN << 16)))
+#define MHI_TRE_CMD_START_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid)) | \
+					FIELD_PREP(GENMASK(23, 16), MHI_CMD_START_CHAN))
 
 #define MHI_TRE_GET_DWORD(tre, word) (le32_to_cpu((tre)->dword[(word)]))
-#define MHI_TRE_GET_CMD_CHID(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0xFF)
-#define MHI_TRE_GET_CMD_TYPE(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 16) & 0xFF)
+#define MHI_TRE_GET_CMD_CHID(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1))))
+#define MHI_TRE_GET_CMD_TYPE(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1))))
 
 /* Event descriptor macros */
 #define MHI_TRE_EV_PTR(ptr) (cpu_to_le64(ptr))
-#define MHI_TRE_EV_DWORD0(code, len) (cpu_to_le32((code << 24) | len))
-#define MHI_TRE_EV_DWORD1(chid, type) (cpu_to_le32((chid << 24) | (type << 16)))
+#define MHI_TRE_EV_DWORD0(code, len) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), code) | \
+						FIELD_PREP(GENMASK(15, 0), len)))
+#define MHI_TRE_EV_DWORD1(chid, type) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						FIELD_PREP(GENMASK(23, 16), type)))
 #define MHI_TRE_GET_EV_PTR(tre) (le64_to_cpu((tre)->ptr))
-#define MHI_TRE_GET_EV_CODE(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_LEN(tre) (MHI_TRE_GET_DWORD(tre, 0) & 0xFFFF)
-#define MHI_TRE_GET_EV_CHID(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_TYPE(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 16) & 0xFF)
-#define MHI_TRE_GET_EV_STATE(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_EXECENV(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) & 0xFF)
+#define MHI_TRE_GET_EV_CODE(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0))))
+#define MHI_TRE_GET_EV_LEN(tre) (FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_DWORD(tre, 0))))
+#define MHI_TRE_GET_EV_CHID(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1))))
+#define MHI_TRE_GET_EV_TYPE(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1))))
+#define MHI_TRE_GET_EV_STATE(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0))))
+#define MHI_TRE_GET_EV_EXECENV(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0))))
 #define MHI_TRE_GET_EV_SEQ(tre) MHI_TRE_GET_DWORD(tre, 0)
 #define MHI_TRE_GET_EV_TIME(tre) (MHI_TRE_GET_EV_PTR(tre))
 #define MHI_TRE_GET_EV_COOKIE(tre) lower_32_bits(MHI_TRE_GET_EV_PTR(tre))
-#define MHI_TRE_GET_EV_VEID(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 16) & 0xFF)
-#define MHI_TRE_GET_EV_LINKSPEED(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_LINKWIDTH(tre) (MHI_TRE_GET_DWORD(tre, 0) & 0xFF)
+#define MHI_TRE_GET_EV_VEID(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 0))))
+#define MHI_TRE_GET_EV_LINKSPEED(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1))))
+#define MHI_TRE_GET_EV_LINKWIDTH(tre) (FIELD_GET(GENMASK(7, 0), (MHI_TRE_GET_DWORD(tre, 0))))
 
 /* Transfer descriptor macros */
 #define MHI_TRE_DATA_PTR(ptr) (cpu_to_le64(ptr))
-#define MHI_TRE_DATA_DWORD0(len) (cpu_to_le32(len & MHI_MAX_MTU))
-#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) (cpu_to_le32((2 << 16) | (bei << 10) \
-	| (ieot << 9) | (ieob << 8) | chain))
+#define MHI_TRE_DATA_DWORD0(len) (cpu_to_le32(FIELD_PREP(GENMASK(15, 0), len)))
+#define MHI_TRE_TYPE_TRANSFER 2
+#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) (cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
+							MHI_TRE_TYPE_TRANSFER) | \
+							FIELD_PREP(BIT(10), bei) | \
+							FIELD_PREP(BIT(9), ieot) | \
+							FIELD_PREP(BIT(8), ieob) | \
+							FIELD_PREP(BIT(0), chain)))
 
 /* RSC transfer descriptor macros */
-#define MHI_RSCTRE_DATA_PTR(ptr, len) (cpu_to_le64(((u64)len << 48) | ptr))
+#define MHI_RSCTRE_DATA_PTR(ptr, len) (cpu_to_le64(FIELD_PREP(GENMASK(64, 48), len) | ptr))
 #define MHI_RSCTRE_DATA_DWORD0(cookie) (cpu_to_le32(cookie))
-#define MHI_RSCTRE_DATA_DWORD1 (cpu_to_le32(MHI_PKT_TYPE_COALESCING << 16))
+#define MHI_RSCTRE_DATA_DWORD1 (cpu_to_le32(FIELD_PREP(GENMASK(23, 16), MHI_PKT_TYPE_COALESCING)
 
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
-- 
2.25.1

