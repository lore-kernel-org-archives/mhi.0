Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1975CAB
	for <mhi@lists.linux.dev>; Tue,  1 Mar 2022 16:03:50 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id m13-20020a17090aab0d00b001bbe267d4d1so2173928pjq.0
        for <mhi@lists.linux.dev>; Tue, 01 Mar 2022 08:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ztR1ZgN3LqpzmgE/aV5hpMhENVc6hmHomH8afl5GlOs=;
        b=L9jOVBQXUToruHDdzcE40Pgr0a/Mt/31m8QM6w0N3bVMSg81bwCmK4NVWr2lQ9p+DP
         /Fh0zIWbTpioWjNjh/crZ940ksxktQvz2AlgKXNplAk+WTK3JsLbH2ie5GfuDAVdqBQu
         xAhI631SfQcY+NsTy4cJFnepY1PIzPSnb4SsKme//IF5gxS54BJbYv6pJvqslOUnOwWp
         OqSX3Dvm/i1eApBZYUM/1POLZzzowNYgOdcvVMqP2Nw2y4oIfjy/hOvPzqU2Q/yyR5JH
         oLiIYb0SSL9u9AghysIgA2DdQbGJ2Jmg7/CMmwv3loLhj+JJqx2v/c1pG4IdEZkqTyMZ
         jt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ztR1ZgN3LqpzmgE/aV5hpMhENVc6hmHomH8afl5GlOs=;
        b=gDN2Hwlo69aLazwKzS3o/1Bg7zpvH3/V7NZPpGw/0e+v6MYZS9WDb/Gu5bPnVgBOwp
         MZ2tx8Y94jkR8KKKdDBp+dAysZ0G8kQzSaWgzDavR2wggjxrWGxeGpig1sCfqLA3V6cA
         g3y0OvSEp4YGlG+Yg3qtszh2HJKWwVDpOCYr3KOzddT1bZyXxNJSvMFqezY+6j7zvENy
         ATI84/S8x2fk5GDJDFMEjFEr5FuoTVc3AIYbJjMGxJezUMMj8uIxNpqDHwJXubQbZ0Mv
         DDDEbCmaj8xTqRM0YP+hcyL/aJUrQGKpu5VO/87JcPRpGCyLFIPJ6Q/ePUuwrPXlFrui
         tp6g==
X-Gm-Message-State: AOAM532vUAuXGSJe201w1CGgI6atZUgPFlA0ql3PIKxbBHsLPkCjEyXX
	+6Y4yUehATxLtztotwoQSubv
X-Google-Smtp-Source: ABdhPJzVKm3P/TJ2+IWff+eeTUrN4HuCmIme2y67OaIrnwu0yOWYwqTQj+JAwUekQzRjDU1RVeRdZg==
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id y3-20020a170902d64300b001516f2ccfb4mr8626952plh.120.1646150629285;
        Tue, 01 Mar 2022 08:03:49 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.80])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a859100b001bc20ddcc67sm2489530pjn.34.2022.03.01.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:03:48 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	quic_hemantk@quicinc.com,
	quic_bbhatt@quicinc.com,
	elder@linaro.org,
	paul.davey@alliedtelesis.co.nz,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH 07/10] bus: mhi: Cleanup the register definitions used in headers
Date: Tue,  1 Mar 2022 21:33:05 +0530
Message-Id: <20220301160308.107452-8-manivannan.sadhasivam@linaro.org>
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

Cleanup includes:

1. Using the GENMASK macro for masks
2. Removing brackets for single values
3. Using lowercase for hex values
4. Using two digits for hex values where applicable
5. Aligning the defines on same column

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/internal.h | 413 +++++++++++++++-----------------
 1 file changed, 199 insertions(+), 214 deletions(-)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 1d1790e83a93..1c7a48be033f 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -12,134 +12,116 @@
 
 extern struct bus_type mhi_bus_type;
 
-#define MHIREGLEN (0x0)
-
-#define MHIVER (0x8)
-
-#define MHICFG (0x10)
-#define MHICFG_NHWER_MASK (GENMASK(31, 24))
-#define MHICFG_NER_MASK (GENMASK(23, 16))
-#define MHICFG_NHWCH_MASK (GENMASK(15, 8))
-#define MHICFG_NCH_MASK (GENMASK(7, 0))
-
-#define CHDBOFF (0x18)
-
-#define ERDBOFF (0x20)
-
-#define BHIOFF (0x28)
-
-#define BHIEOFF (0x2C)
-
-#define DEBUGOFF (0x30)
-
-#define MHICTRL (0x38)
-#define MHICTRL_MHISTATE_MASK (GENMASK(15, 8))
-#define MHICTRL_RESET_MASK (BIT(1))
-
-#define MHISTATUS (0x48)
-#define MHISTATUS_MHISTATE_MASK (GENMASK(15, 8))
-#define MHISTATUS_SYSERR_MASK (BIT(2))
-#define MHISTATUS_READY_MASK (BIT(0))
-
-#define CCABAP_LOWER (0x58)
-
-#define CCABAP_HIGHER (0x5C)
-
-#define ECABAP_LOWER (0x60)
-
-#define ECABAP_HIGHER (0x64)
-
-#define CRCBAP_LOWER (0x68)
-
-#define CRCBAP_HIGHER (0x6C)
-
-#define CRDB_LOWER (0x70)
-
-#define CRDB_HIGHER (0x74)
-
-#define MHICTRLBASE_LOWER (0x80)
-
-#define MHICTRLBASE_HIGHER (0x84)
-
-#define MHICTRLLIMIT_LOWER (0x88)
-
-#define MHICTRLLIMIT_HIGHER (0x8C)
-
-#define MHIDATABASE_LOWER (0x98)
-
-#define MHIDATABASE_HIGHER (0x9C)
-
-#define MHIDATALIMIT_LOWER (0xA0)
-
-#define MHIDATALIMIT_HIGHER (0xA4)
+/* MHI registers */
+#define MHIREGLEN					0x00
+#define MHIVER						0x08
+#define MHICFG						0x10
+#define CHDBOFF						0x18
+#define ERDBOFF						0x20
+#define BHIOFF						0x28
+#define BHIEOFF						0x2c
+#define DEBUGOFF					0x30
+#define MHICTRL						0x38
+#define MHISTATUS					0x48
+#define CCABAP_LOWER					0x58
+#define CCABAP_HIGHER					0x5c
+#define ECABAP_LOWER					0x60
+#define ECABAP_HIGHER					0x64
+#define CRCBAP_LOWER					0x68
+#define CRCBAP_HIGHER					0x6c
+#define CRDB_LOWER					0x70
+#define CRDB_HIGHER					0x74
+#define MHICTRLBASE_LOWER				0x80
+#define MHICTRLBASE_HIGHER				0x84
+#define MHICTRLLIMIT_LOWER				0x88
+#define MHICTRLLIMIT_HIGHER				0x8c
+#define MHIDATABASE_LOWER				0x98
+#define MHIDATABASE_HIGHER				0x9c
+#define MHIDATALIMIT_LOWER				0xa0
+#define MHIDATALIMIT_HIGHER				0xa4
 
 /* Host request register */
-#define MHI_SOC_RESET_REQ_OFFSET (0xB0)
-#define MHI_SOC_RESET_REQ BIT(0)
-
-/* MHI BHI offfsets */
-#define BHI_BHIVERSION_MINOR (0x00)
-#define BHI_BHIVERSION_MAJOR (0x04)
-#define BHI_IMGADDR_LOW (0x08)
-#define BHI_IMGADDR_HIGH (0x0C)
-#define BHI_IMGSIZE (0x10)
-#define BHI_RSVD1 (0x14)
-#define BHI_IMGTXDB (0x18)
-#define BHI_TXDB_SEQNUM_BMSK (GENMASK(29, 0))
-#define BHI_RSVD2 (0x1C)
-#define BHI_INTVEC (0x20)
-#define BHI_RSVD3 (0x24)
-#define BHI_EXECENV (0x28)
-#define BHI_STATUS (0x2C)
-#define BHI_ERRCODE (0x30)
-#define BHI_ERRDBG1 (0x34)
-#define BHI_ERRDBG2 (0x38)
-#define BHI_ERRDBG3 (0x3C)
-#define BHI_SERIALNU (0x40)
-#define BHI_SBLANTIROLLVER (0x44)
-#define BHI_NUMSEG (0x48)
-#define BHI_MSMHWID(n) (0x4C + (0x4 * (n)))
-#define BHI_OEMPKHASH(n) (0x64 + (0x4 * (n)))
-#define BHI_RSVD5 (0xC4)
-#define BHI_STATUS_MASK (GENMASK(31, 30))
-#define BHI_STATUS_ERROR (3)
-#define BHI_STATUS_SUCCESS (2)
-#define BHI_STATUS_RESET (0)
-
-/* MHI BHIE offsets */
-#define BHIE_MSMSOCID_OFFS (0x0000)
-#define BHIE_TXVECADDR_LOW_OFFS (0x002C)
-#define BHIE_TXVECADDR_HIGH_OFFS (0x0030)
-#define BHIE_TXVECSIZE_OFFS (0x0034)
-#define BHIE_TXVECDB_OFFS (0x003C)
-#define BHIE_TXVECDB_SEQNUM_BMSK (GENMASK(29, 0))
-#define BHIE_TXVECSTATUS_OFFS (0x0044)
-#define BHIE_TXVECSTATUS_SEQNUM_BMSK (GENMASK(29, 0))
-#define BHIE_TXVECSTATUS_STATUS_BMSK (GENMASK(31, 30))
-#define BHIE_TXVECSTATUS_STATUS_RESET (0x00)
-#define BHIE_TXVECSTATUS_STATUS_XFER_COMPL (0x02)
-#define BHIE_TXVECSTATUS_STATUS_ERROR (0x03)
-#define BHIE_RXVECADDR_LOW_OFFS (0x0060)
-#define BHIE_RXVECADDR_HIGH_OFFS (0x0064)
-#define BHIE_RXVECSIZE_OFFS (0x0068)
-#define BHIE_RXVECDB_OFFS (0x0070)
-#define BHIE_RXVECDB_SEQNUM_BMSK (GENMASK(29, 0))
-#define BHIE_RXVECSTATUS_OFFS (0x0078)
-#define BHIE_RXVECSTATUS_SEQNUM_BMSK (GENMASK(29, 0))
-#define BHIE_RXVECSTATUS_STATUS_BMSK (GENMASK(31, 30))
-#define BHIE_RXVECSTATUS_STATUS_RESET (0x00)
-#define BHIE_RXVECSTATUS_STATUS_XFER_COMPL (0x02)
-#define BHIE_RXVECSTATUS_STATUS_ERROR (0x03)
-
-#define SOC_HW_VERSION_OFFS (0x224)
-#define SOC_HW_VERSION_FAM_NUM_BMSK (GENMASK(31, 28))
-#define SOC_HW_VERSION_DEV_NUM_BMSK (GENMASK(27, 16))
-#define SOC_HW_VERSION_MAJOR_VER_BMSK (GENMASK(15, 8))
-#define SOC_HW_VERSION_MINOR_VER_BMSK (GENMASK(7, 0))
-
-#define EV_CTX_RESERVED_MASK GENMASK(7, 0)
-#define EV_CTX_INTMODC_MASK GENMASK(15, 8)
-#define EV_CTX_INTMODT_MASK GENMASK(31, 16)
+#define MHI_SOC_RESET_REQ_OFFSET			0xb0
+#define MHI_SOC_RESET_REQ				BIT(0)
+
+/* MHI register bits */
+#define MHICFG_NHWER_MASK				GENMASK(31, 24)
+#define MHICFG_NER_MASK					GENMASK(23, 16)
+#define MHICFG_NHWCH_MASK				GENMASK(15, 8)
+#define MHICFG_NCH_MASK					GENMASK(7, 0)
+#define MHICTRL_MHISTATE_MASK				GENMASK(15, 8)
+#define MHICTRL_RESET_MASK				BIT(1)
+#define MHISTATUS_MHISTATE_MASK				GENMASK(15, 8)
+#define MHISTATUS_SYSERR_MASK				BIT(2)
+#define MHISTATUS_READY_MASK				BIT(0)
+
+/* MHI BHI registers */
+#define BHI_BHIVERSION_MINOR				0x00
+#define BHI_BHIVERSION_MAJOR				0x04
+#define BHI_IMGADDR_LOW					0x08
+#define BHI_IMGADDR_HIGH				0x0c
+#define BHI_IMGSIZE					0x10
+#define BHI_RSVD1					0x14
+#define BHI_IMGTXDB					0x18
+#define BHI_RSVD2					0x1c
+#define BHI_INTVEC					0x20
+#define BHI_RSVD3					0x24
+#define BHI_EXECENV					0x28
+#define BHI_STATUS					0x2c
+#define BHI_ERRCODE					0x30
+#define BHI_ERRDBG1					0x34
+#define BHI_ERRDBG2					0x38
+#define BHI_ERRDBG3					0x3c
+#define BHI_SERIALNU					0x40
+#define BHI_SBLANTIROLLVER				0x44
+#define BHI_NUMSEG					0x48
+#define BHI_MSMHWID(n)					(0x4c + (0x4 * (n)))
+#define BHI_OEMPKHASH(n)				(0x64 + (0x4 * (n)))
+#define BHI_RSVD5					0xc4
+
+/* BHI register bits */
+#define BHI_TXDB_SEQNUM_BMSK				GENMASK(29, 0)
+#define BHI_STATUS_MASK					GENMASK(31, 30)
+#define BHI_STATUS_ERROR				0x03
+#define BHI_STATUS_SUCCESS				0x02
+#define BHI_STATUS_RESET				0x00
+
+/* MHI BHIE registers */
+#define BHIE_MSMSOCID_OFFS				0x00
+#define BHIE_TXVECADDR_LOW_OFFS				0x2c
+#define BHIE_TXVECADDR_HIGH_OFFS			0x30
+#define BHIE_TXVECSIZE_OFFS				0x34
+#define BHIE_TXVECDB_OFFS				0x3c
+#define BHIE_TXVECSTATUS_OFFS				0x44
+#define BHIE_RXVECADDR_LOW_OFFS				0x60
+#define BHIE_RXVECADDR_HIGH_OFFS			0x64
+#define BHIE_RXVECSIZE_OFFS				0x68
+#define BHIE_RXVECDB_OFFS				0x70
+#define BHIE_RXVECSTATUS_OFFS				0x78
+
+/* BHIE register bits */
+#define BHIE_TXVECDB_SEQNUM_BMSK			GENMASK(29, 0)
+#define BHIE_TXVECSTATUS_SEQNUM_BMSK			GENMASK(29, 0)
+#define BHIE_TXVECSTATUS_STATUS_BMSK			GENMASK(31, 30)
+#define BHIE_TXVECSTATUS_STATUS_RESET			0x00
+#define BHIE_TXVECSTATUS_STATUS_XFER_COMPL		0x02
+#define BHIE_TXVECSTATUS_STATUS_ERROR			0x03
+#define BHIE_RXVECDB_SEQNUM_BMSK			GENMASK(29, 0)
+#define BHIE_RXVECSTATUS_SEQNUM_BMSK			GENMASK(29, 0)
+#define BHIE_RXVECSTATUS_STATUS_BMSK			GENMASK(31, 30)
+#define BHIE_RXVECSTATUS_STATUS_RESET			0x00
+#define BHIE_RXVECSTATUS_STATUS_XFER_COMPL		0x02
+#define BHIE_RXVECSTATUS_STATUS_ERROR			0x03
+
+#define SOC_HW_VERSION_OFFS				0x224
+#define SOC_HW_VERSION_FAM_NUM_BMSK			GENMASK(31, 28)
+#define SOC_HW_VERSION_DEV_NUM_BMSK			GENMASK(27, 16)
+#define SOC_HW_VERSION_MAJOR_VER_BMSK			GENMASK(15, 8)
+#define SOC_HW_VERSION_MINOR_VER_BMSK			GENMASK(7, 0)
+
+#define EV_CTX_RESERVED_MASK				GENMASK(7, 0)
+#define EV_CTX_INTMODC_MASK				GENMASK(15, 8)
+#define EV_CTX_INTMODT_MASK				GENMASK(31, 16)
 struct mhi_event_ctxt {
 	__le32 intmod;
 	__le32 ertype;
@@ -151,10 +133,10 @@ struct mhi_event_ctxt {
 	__le64 wp __packed __aligned(4);
 };
 
-#define CHAN_CTX_CHSTATE_MASK GENMASK(7, 0)
-#define CHAN_CTX_BRSTMODE_MASK GENMASK(9, 8)
-#define CHAN_CTX_POLLCFG_MASK GENMASK(15, 10)
-#define CHAN_CTX_RESERVED_MASK GENMASK(31, 16)
+#define CHAN_CTX_CHSTATE_MASK				GENMASK(7, 0)
+#define CHAN_CTX_BRSTMODE_MASK				GENMASK(9, 8)
+#define CHAN_CTX_POLLCFG_MASK				GENMASK(15, 10)
+#define CHAN_CTX_RESERVED_MASK				GENMASK(31, 16)
 struct mhi_chan_ctxt {
 	__le32 chcfg;
 	__le32 chtype;
@@ -204,67 +186,71 @@ enum mhi_cmd_type {
 };
 
 /* No operation command */
-#define MHI_TRE_CMD_NOOP_PTR (0)
-#define MHI_TRE_CMD_NOOP_DWORD0 (0)
-#define MHI_TRE_CMD_NOOP_DWORD1 (cpu_to_le32(FIELD_PREP(GENMASK(23, 16), MHI_CMD_NOP)))
+#define MHI_TRE_CMD_NOOP_PTR		0
+#define MHI_TRE_CMD_NOOP_DWORD0		0
+#define MHI_TRE_CMD_NOOP_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), MHI_CMD_NOP))
 
 /* Channel reset command */
-#define MHI_TRE_CMD_RESET_PTR (0)
-#define MHI_TRE_CMD_RESET_DWORD0 (0)
-#define MHI_TRE_CMD_RESET_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid)) | \
-					FIELD_PREP(GENMASK(23, 16), MHI_CMD_RESET_CHAN))
+#define MHI_TRE_CMD_RESET_PTR		0
+#define MHI_TRE_CMD_RESET_DWORD0	0
+#define MHI_TRE_CMD_RESET_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						    FIELD_PREP(GENMASK(23, 16),         \
+							       MHI_CMD_RESET_CHAN))
 
 /* Channel stop command */
-#define MHI_TRE_CMD_STOP_PTR (0)
-#define MHI_TRE_CMD_STOP_DWORD0 (0)
-#define MHI_TRE_CMD_STOP_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid)) | \
-					FIELD_PREP(GENMASK(23, 16), MHI_CMD_STOP_CHAN))
+#define MHI_TRE_CMD_STOP_PTR		0
+#define MHI_TRE_CMD_STOP_DWORD0		0
+#define MHI_TRE_CMD_STOP_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						    FIELD_PREP(GENMASK(23, 16),         \
+							       MHI_CMD_STOP_CHAN))
 
 /* Channel start command */
-#define MHI_TRE_CMD_START_PTR (0)
-#define MHI_TRE_CMD_START_DWORD0 (0)
-#define MHI_TRE_CMD_START_DWORD1(chid) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid)) | \
-					FIELD_PREP(GENMASK(23, 16), MHI_CMD_START_CHAN))
+#define MHI_TRE_CMD_START_PTR		0
+#define MHI_TRE_CMD_START_DWORD0	0
+#define MHI_TRE_CMD_START_DWORD1(chid)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
+						    FIELD_PREP(GENMASK(23, 16),         \
+							       MHI_CMD_START_CHAN))
 
-#define MHI_TRE_GET_DWORD(tre, word) (le32_to_cpu((tre)->dword[(word)]))
-#define MHI_TRE_GET_CMD_CHID(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1))))
-#define MHI_TRE_GET_CMD_TYPE(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1))))
+#define MHI_TRE_GET_DWORD(tre, word)	le32_to_cpu((tre)->dword[(word)])
+#define MHI_TRE_GET_CMD_CHID(tre)	FIELD_GET(GENMASK(31, 24), MHI_TRE_GET_DWORD(tre, 1))
+#define MHI_TRE_GET_CMD_TYPE(tre)	FIELD_GET(GENMASK(23, 16), MHI_TRE_GET_DWORD(tre, 1))
 
 /* Event descriptor macros */
-#define MHI_TRE_EV_PTR(ptr) (cpu_to_le64(ptr))
-#define MHI_TRE_EV_DWORD0(code, len) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), code) | \
-						FIELD_PREP(GENMASK(15, 0), len)))
-#define MHI_TRE_EV_DWORD1(chid, type) (cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid) | \
-						FIELD_PREP(GENMASK(23, 16), type)))
-#define MHI_TRE_GET_EV_PTR(tre) (le64_to_cpu((tre)->ptr))
-#define MHI_TRE_GET_EV_CODE(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0))))
-#define MHI_TRE_GET_EV_LEN(tre) (FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_DWORD(tre, 0))))
-#define MHI_TRE_GET_EV_CHID(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1))))
-#define MHI_TRE_GET_EV_TYPE(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1))))
-#define MHI_TRE_GET_EV_STATE(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0))))
-#define MHI_TRE_GET_EV_EXECENV(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0))))
-#define MHI_TRE_GET_EV_SEQ(tre) MHI_TRE_GET_DWORD(tre, 0)
-#define MHI_TRE_GET_EV_TIME(tre) (MHI_TRE_GET_EV_PTR(tre))
-#define MHI_TRE_GET_EV_COOKIE(tre) lower_32_bits(MHI_TRE_GET_EV_PTR(tre))
-#define MHI_TRE_GET_EV_VEID(tre) (FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 0))))
-#define MHI_TRE_GET_EV_LINKSPEED(tre) (FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1))))
-#define MHI_TRE_GET_EV_LINKWIDTH(tre) (FIELD_GET(GENMASK(7, 0), (MHI_TRE_GET_DWORD(tre, 0))))
+#define MHI_TRE_EV_PTR(ptr)		cpu_to_le64(ptr)
+#define MHI_TRE_EV_DWORD0(code, len)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), code | \
+						    FIELD_PREP(GENMASK(15, 0), len)))
+#define MHI_TRE_EV_DWORD1(chid, type)	cpu_to_le32(FIELD_PREP(GENMASK(31, 24), chid | \
+						    FIELD_PREP(GENMASK(23, 16), type)))
+#define MHI_TRE_GET_EV_PTR(tre)		le64_to_cpu((tre)->ptr)
+#define MHI_TRE_GET_EV_CODE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_LEN(tre)		FIELD_GET(GENMASK(15, 0), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_CHID(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
+#define MHI_TRE_GET_EV_TYPE(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 1)))
+#define MHI_TRE_GET_EV_STATE(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_EXECENV(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_SEQ(tre)		MHI_TRE_GET_DWORD(tre, 0)
+#define MHI_TRE_GET_EV_TIME(tre)	MHI_TRE_GET_EV_PTR(tre)
+#define MHI_TRE_GET_EV_COOKIE(tre)	lower_32_bits(MHI_TRE_GET_EV_PTR(tre))
+#define MHI_TRE_GET_EV_VEID(tre)	FIELD_GET(GENMASK(23, 16), (MHI_TRE_GET_DWORD(tre, 0)))
+#define MHI_TRE_GET_EV_LINKSPEED(tre)	FIELD_GET(GENMASK(31, 24), (MHI_TRE_GET_DWORD(tre, 1)))
+#define MHI_TRE_GET_EV_LINKWIDTH(tre)	FIELD_GET(GENMASK(7, 0), (MHI_TRE_GET_DWORD(tre, 0)))
 
 /* Transfer descriptor macros */
-#define MHI_TRE_DATA_PTR(ptr) (cpu_to_le64(ptr))
-#define MHI_TRE_DATA_DWORD0(len) (cpu_to_le32(FIELD_PREP(GENMASK(15, 0), len)))
-#define MHI_TRE_TYPE_TRANSFER 2
-#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) (cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
-							MHI_TRE_TYPE_TRANSFER) | \
-							FIELD_PREP(BIT(10), bei) | \
-							FIELD_PREP(BIT(9), ieot) | \
-							FIELD_PREP(BIT(8), ieob) | \
-							FIELD_PREP(BIT(0), chain)))
+#define MHI_TRE_DATA_PTR(ptr)		cpu_to_le64(ptr)
+#define MHI_TRE_DATA_DWORD0(len)	cpu_to_le32(FIELD_PREP(GENMASK(15, 0), len))
+#define MHI_TRE_TYPE_TRANSFER		2
+#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
+								MHI_TRE_TYPE_TRANSFER) |    \
+								FIELD_PREP(BIT(10), bei) |  \
+								FIELD_PREP(BIT(9), ieot) |  \
+								FIELD_PREP(BIT(8), ieob) |  \
+								FIELD_PREP(BIT(0), chain))
 
 /* RSC transfer descriptor macros */
-#define MHI_RSCTRE_DATA_PTR(ptr, len) (cpu_to_le64(FIELD_PREP(GENMASK(64, 48), len) | ptr))
-#define MHI_RSCTRE_DATA_DWORD0(cookie) (cpu_to_le32(cookie))
-#define MHI_RSCTRE_DATA_DWORD1 (cpu_to_le32(FIELD_PREP(GENMASK(23, 16), MHI_PKT_TYPE_COALESCING)
+#define MHI_RSCTRE_DATA_PTR(ptr, len)	cpu_to_le64(FIELD_PREP(GENMASK(64, 48), len) | ptr)
+#define MHI_RSCTRE_DATA_DWORD0(cookie)	cpu_to_le32(cookie)
+#define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
+							       MHI_PKT_TYPE_COALESCING))
 
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
@@ -369,44 +355,43 @@ enum mhi_pm_state {
 	MHI_PM_STATE_MAX
 };
 
-#define MHI_PM_DISABLE			BIT(0)
-#define MHI_PM_POR			BIT(1)
-#define MHI_PM_M0			BIT(2)
-#define MHI_PM_M2			BIT(3)
-#define MHI_PM_M3_ENTER			BIT(4)
-#define MHI_PM_M3			BIT(5)
-#define MHI_PM_M3_EXIT			BIT(6)
+#define MHI_PM_DISABLE					BIT(0)
+#define MHI_PM_POR					BIT(1)
+#define MHI_PM_M0					BIT(2)
+#define MHI_PM_M2					BIT(3)
+#define MHI_PM_M3_ENTER					BIT(4)
+#define MHI_PM_M3					BIT(5)
+#define MHI_PM_M3_EXIT					BIT(6)
 /* firmware download failure state */
-#define MHI_PM_FW_DL_ERR		BIT(7)
-#define MHI_PM_SYS_ERR_DETECT		BIT(8)
-#define MHI_PM_SYS_ERR_PROCESS		BIT(9)
-#define MHI_PM_SHUTDOWN_PROCESS		BIT(10)
+#define MHI_PM_FW_DL_ERR				BIT(7)
+#define MHI_PM_SYS_ERR_DETECT				BIT(8)
+#define MHI_PM_SYS_ERR_PROCESS				BIT(9)
+#define MHI_PM_SHUTDOWN_PROCESS				BIT(10)
 /* link not accessible */
-#define MHI_PM_LD_ERR_FATAL_DETECT	BIT(11)
-
-#define MHI_REG_ACCESS_VALID(pm_state) ((pm_state & (MHI_PM_POR | MHI_PM_M0 | \
-		MHI_PM_M2 | MHI_PM_M3_ENTER | MHI_PM_M3_EXIT | \
-		MHI_PM_SYS_ERR_DETECT | MHI_PM_SYS_ERR_PROCESS | \
-		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_FW_DL_ERR)))
-#define MHI_PM_IN_ERROR_STATE(pm_state) (pm_state >= MHI_PM_FW_DL_ERR)
-#define MHI_PM_IN_FATAL_STATE(pm_state) (pm_state == MHI_PM_LD_ERR_FATAL_DETECT)
-#define MHI_DB_ACCESS_VALID(mhi_cntrl) (mhi_cntrl->pm_state & \
-					mhi_cntrl->db_access)
-#define MHI_WAKE_DB_CLEAR_VALID(pm_state) (pm_state & (MHI_PM_M0 | \
-						MHI_PM_M2 | MHI_PM_M3_EXIT))
-#define MHI_WAKE_DB_SET_VALID(pm_state) (pm_state & MHI_PM_M2)
-#define MHI_WAKE_DB_FORCE_SET_VALID(pm_state) MHI_WAKE_DB_CLEAR_VALID(pm_state)
-#define MHI_EVENT_ACCESS_INVALID(pm_state) (pm_state == MHI_PM_DISABLE || \
-					    MHI_PM_IN_ERROR_STATE(pm_state))
-#define MHI_PM_IN_SUSPEND_STATE(pm_state) (pm_state & \
-					   (MHI_PM_M3_ENTER | MHI_PM_M3))
-
-#define NR_OF_CMD_RINGS			1
-#define CMD_EL_PER_RING			128
-#define PRIMARY_CMD_RING		0
-#define MHI_DEV_WAKE_DB			127
-#define MHI_MAX_MTU			0xffff
-#define MHI_RANDOM_U32_NONZERO(bmsk)	(prandom_u32_max(bmsk) + 1)
+#define MHI_PM_LD_ERR_FATAL_DETECT			BIT(11)
+
+#define MHI_REG_ACCESS_VALID(pm_state)			((pm_state & (MHI_PM_POR | MHI_PM_M0 | \
+						MHI_PM_M2 | MHI_PM_M3_ENTER | MHI_PM_M3_EXIT | \
+						MHI_PM_SYS_ERR_DETECT | MHI_PM_SYS_ERR_PROCESS | \
+						MHI_PM_SHUTDOWN_PROCESS | MHI_PM_FW_DL_ERR)))
+#define MHI_PM_IN_ERROR_STATE(pm_state)			(pm_state >= MHI_PM_FW_DL_ERR)
+#define MHI_PM_IN_FATAL_STATE(pm_state)			(pm_state == MHI_PM_LD_ERR_FATAL_DETECT)
+#define MHI_DB_ACCESS_VALID(mhi_cntrl)			(mhi_cntrl->pm_state & mhi_cntrl->db_access)
+#define MHI_WAKE_DB_CLEAR_VALID(pm_state)		(pm_state & (MHI_PM_M0 | \
+							MHI_PM_M2 | MHI_PM_M3_EXIT))
+#define MHI_WAKE_DB_SET_VALID(pm_state)			(pm_state & MHI_PM_M2)
+#define MHI_WAKE_DB_FORCE_SET_VALID(pm_state)		MHI_WAKE_DB_CLEAR_VALID(pm_state)
+#define MHI_EVENT_ACCESS_INVALID(pm_state)		(pm_state == MHI_PM_DISABLE || \
+							MHI_PM_IN_ERROR_STATE(pm_state))
+#define MHI_PM_IN_SUSPEND_STATE(pm_state)		(pm_state & \
+							(MHI_PM_M3_ENTER | MHI_PM_M3))
+
+#define NR_OF_CMD_RINGS					1
+#define CMD_EL_PER_RING					128
+#define PRIMARY_CMD_RING				0
+#define MHI_DEV_WAKE_DB					127
+#define MHI_MAX_MTU					0xffff
+#define MHI_RANDOM_U32_NONZERO(bmsk)			(prandom_u32_max(bmsk) + 1)
 
 enum mhi_er_type {
 	MHI_ER_TYPE_INVALID = 0x0,
-- 
2.25.1

