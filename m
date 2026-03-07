Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC319358373
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883755; cv=none; b=DqhLTOl0SwnvI3NXFBPLlKlYk6Z4js6A0ILbQG9Uq2GD/JmC1DxVveimVaAXbR4aPY1SOMuC5GVnL3HsmPp7JXgKPw/76cICGfoy4URvT6YNJ3Mqs7cHSFn0BdhEikmA0ElUpB2HgaGvW4TDGEhxnHP0hxLXV/DjNpLRiQ/SM6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883755; c=relaxed/simple;
	bh=5sIdXvX5PZJdnK1UBqFxD2++EMsLUAFVX5mI3bvja1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKM0dBbqkjJBaaIRxzsJq3UD4eZGb5EnUYMCMKMlsP1+zYSBwPxRzkvnyuf/F3sJIjgYyHkEQCJow3Sbc0AerMcM6YskTdbp8BqXWY3QsCtwn+qfsA2Tda6OupMNyS22s77UBTSk4Xi9mmIThIqezibB2+R9N1MrETc+9yxBVHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ew4ZU1Sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhSlyVQg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ew4ZU1Sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhSlyVQg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276uq2O1977303
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wocxk5JJlE5LitylZ0nLyYMuinlhyHjhkCpBDBLuVCk=; b=Ew4ZU1SnlTbqE57t
	uG/TEaNuhgSHV2FA5lqc7CuWeZhxgLQE1pu8psjx49AkjAdQiwJ/6eC9xKxBb+56
	bSkHlI0lqXBDb9+YTyr879prBnYD5/yJtVGCyd6rNUiUqF7Ls8F5JO1QvkHVFgJS
	kmwvHnO8LpQ+qfEBZ12KSityIFoOqUBeQ5HF4df1uYrqF8dG+InjoWI0kxE+YTZq
	F/qTZCYRFanJE1IgDgPCxwIur/lKsFQDQgpiWQNfFtv2xW5oroPeR0RlcJvft68y
	orJxBB6qOKwpT/CzULPwWKvlLnIbsJFrmsBBzCCwvpvluEhFuKxBKga8hxY0fq5m
	Kb4E9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg0t0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:42:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3e462daeso35399935ad.0
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883749; x=1773488549; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wocxk5JJlE5LitylZ0nLyYMuinlhyHjhkCpBDBLuVCk=;
        b=QhSlyVQg/Mfet0Ukpmj/YXm0YzyXqsEQQgz6J1gJxUm6D6U8x+f3blNHSbdHbTxLi5
         g4SDs5h0SxQh8RQjkcQtQIKzYfphBdDL0pMjHezJSjniKrSZ6vfTuZFLvX/MaQ0wxboV
         wu8Dh5ERe9JoSQHYmYnmSRGr6PEgtn3tHuK3006eNtKpZMUM/7GhUTxVK6TjwkBdV+ei
         MAIph9KElglw7oHJY6YXmVF29RH3ksuMwt4fzHC8Si34UVFQQ7eNZe5KwODL0DvdWlcL
         J5assbSnTJwVV+2k6r54mik78l4gR7/JVGO7Xqo8R9H6tQYddpYsp4tZJYLK8znWeLql
         XTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883749; x=1773488549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wocxk5JJlE5LitylZ0nLyYMuinlhyHjhkCpBDBLuVCk=;
        b=qdNE7WLKVtMwfAFO5trk10KhWlN1vM9TM3n6RlHR54AENpZLBwQzNzhE0Cpi2r9oKa
         UHmu3L9PXIAR7cptWSJpcy8Fblymh56c/FXuAcmwgN+mXABtsc/BpY+DvL6H911vTIcN
         RmQPmMZ8O0jjb52AuBCi0Vl4Gv22ytXNXwF84gNzkqKn+v+k4d5EpAx/R1NLe/Y3QUj4
         68ulTDOzoU+HKRu0U597m+e7U0Eso9/4nOkk3jDGJdK0YY7OKBSV5EpJ0Ht6DuFh2HMI
         CBASzjQ1+hB6ThBCPuGUYPPZTl1wFwPa7Q2dxhrm0850SsZBLHMXDT2lbv66HjZKuKa7
         u9KA==
X-Forwarded-Encrypted: i=1; AJvYcCV8uH+3chfZmZToXjCq5Eqee/qNDKXM3WRjP5q1uay4eJWkOvbt9jvCLxdvMx6gd4lrNNc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/B7O6VeJqJQN+Zf+ui4xRn32gr7OVtHtwctTbUwUHXqJJkD3e
	eAAKp1HHKqQPkkhiPHPdQirmvjwG2BoRMaEGnnKPHMjAPy/K1++UWx+0tSwAiWKFrJMcDqHWXXI
	ldS+XOQVR/c5XXVuOQbFcjSz+VF77KS5EjZIpLA3z591UhCFoPZzg3PnivjhEGss=
X-Gm-Gg: ATEYQzyZEOMSySMVTFHFEwxZSLMS57vE+1hfbBLzMEMf2mUgQI1ZER6wQOkc2tNkakn
	lmOMVGJX0YjHSZkijyJsRUw3Mrb2aNyIYY6va3FiZz1U41jqmc6X3kFUJjM/IKGm9niNSU1Zogp
	/oO/Br+CGy3yfQsWThi1Pff0vT1qZh3VWbV+RbDwNQS39Vl2q8O7XY7JLkZsYJQsfs9Ieqyjl4g
	+dPp8JYptWqrgYt80kgnvOwWjemC1HZeAsCVQwTwxKcwMVX97sa4bZw3VgkJZ20uHFtdas1fPmg
	Ccfb4ybWQEg0nvBmuEFe3dXyWMbvoFZ3rau9huaOnHWroUfjIhDG4O4bbT1wg/dgagiAdRfynVu
	0RNLWn2XbS4jCpO5fAQt5Stwy+kOQ39jc0j1F5T0jSkZbHTz18xU=
X-Received: by 2002:a17:903:380f:b0:2ae:80b8:df16 with SMTP id d9443c01a7336-2ae82526790mr56543745ad.49.1772883749256;
        Sat, 07 Mar 2026 03:42:29 -0800 (PST)
X-Received: by 2002:a17:903:380f:b0:2ae:80b8:df16 with SMTP id d9443c01a7336-2ae82526790mr56543215ad.49.1772883747524;
        Sat, 07 Mar 2026 03:42:27 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:27 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:28 +0530
Subject: [PATCH v2 7/9] bus: mhi: Capture DDR training data using command
 mode
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-7-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=14758;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=5sIdXvX5PZJdnK1UBqFxD2++EMsLUAFVX5mI3bvja1w=;
 b=r2lHpnu5iDL9r8KwKVIvxCT6jJz/84kOPGYJeigyq0YMFYUVG/MwEuHLk1DfPLpQ3jvoNoAEt
 hTkE1JTAbY4B1XeRibXhCrI8eFL57gGgAHx2dQabrB2jbZIBeEbr5Ql
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: UCKyv-YiG_qM3kd9Z4ptNGrRlK3gU-Nc
X-Proofpoint-ORIG-GUID: UCKyv-YiG_qM3kd9Z4ptNGrRlK3gU-Nc
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ac0f26 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_u4x-iUupSARUiuVX_kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX/zF2wkkqGciQ
 0xGWYYBp7tJEFM6unxsGk1aXsdNeOV5BOQCGIGB9P01/WL5RVeuVbFMWKKX77O5+Fi0Qd2guoho
 3Nz0OHfblQGre8x5aIRCOy9B6pLm7UsRLrw7llI0vQZdC+ke6r6LuQBnpdxIUmyaRJmq4o0i941
 kCVwtLlnV1dFTBLdde5k4lHY2aAXCr3YXsZEKt7Pty3ImL1hVsGXXZK9KHHOBeKuevYMutZ1947
 aE6skfDXh/PUgHwuzjZMimBtiEnvroAzgkI3yra4wATdl+SUUcafQ2IVZrWbgyi6JCyLnU2iJhc
 IBzSd4N6yCYmSDhjI10pO01ZR13aj4JNXUlrIBLdeT1sEcsi/eeqI5u6YbU2eysS74dzKKP4hWx
 qdNDZ49FHsAsCnPvqNVSIwStvQM84GSnQ77J2dSaOz0yf/o+NXgCO6bJlTDQXyUz8nOgwPiRl5i
 0SH3PD4edX3Yg0caqlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106

During early boot, devices may perform DDR training and produce training
data that can be reused on subsequent boots to reduce initialization
time. The sahara protocol provides a command mode flow to transfer this
training data to the host, but the driver currently does not handle
command mode and drops the training payload.

Add Sahara command mode support to retrieve DDR training data from the
device. When the device enters command mode and sends CMD_READY, query
the support command list and request DDR training data using EXECUTE and
EXECUTE_DATA. Allocate receive buffers based on the reported response
size and copy the raw payload directly from the MHI DL completion
callback.

Store the captured training data in controller-scoped memory using devres,
so it remains available after sahara channel teardown. Also distinguish
raw payload completion from control packets in the DL callback, avoiding
misinterpretation of training data as protocol messages, and requeue
the RX buffer after switching back to IMAGE_TX_PENDING to allow the
boot flow to continue.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 328 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 320 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 19fb9cb78fbecee047ba27674043c0940e749195..1eea93384724f559f3b6b78cb6a6e9a77cd5de6b 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -5,11 +5,14 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/sahara.h>
 #include <linux/types.h>
@@ -60,8 +63,16 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
-
+#define SAHARA_COMMAND_READY_LENGTH	0x8
+#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
+#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
+#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
+#define SAHARA_SWITCH_MODE_LENGTH	0xc
+
+#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
+#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
 #define SAHARA_DDR_TRAINING_IMG_ID	34
+#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
 
 struct sahara_packet {
 	__le32 cmd;
@@ -97,6 +108,19 @@ struct sahara_packet {
 			__le64 memory_address;
 			__le64 memory_length;
 		} memory_read64;
+		struct {
+			__le32 client_command;
+		} command_execute;
+		struct {
+			__le32 client_command;
+			__le32 response_length;
+		} command_execute_resp;
+		struct {
+			__le32 client_command;
+		} command_exec_data;
+		struct {
+			__le32 mode;
+		} mode_switch;
 	};
 };
 
@@ -163,6 +187,7 @@ struct sahara_context {
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
 	struct work_struct		read_data_work;
+	struct work_struct		cmd_work;
 	struct mhi_device		*mhi_dev;
 	const char * const		*image_table;
 	u32				table_size;
@@ -183,6 +208,24 @@ struct sahara_context {
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
 	const char			*fw_folder;
+	bool				is_cmd_mode;
+	bool				receiving_trng_data;
+	size_t				trng_size;
+	size_t				trng_rcvd;
+	u32				trng_nbuf;
+	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
+};
+
+/*
+ * Controller-scoped training data store (per MHI controller device).
+ * Stored as devres resource on mhi_cntrl->cntrl_dev.
+ */
+struct sahara_ctrl_trng_data {
+	struct mutex lock;	/* Protects data, size, copied and receiving */
+	void *data;
+	size_t size;
+	size_t copied;
+	bool receiving;
 };
 
 struct sahara_variant {
@@ -319,6 +362,48 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 	return NULL;
 }
 
+static void sahara_ctrl_trng_release(struct device *dev, void *res)
+{
+	struct sahara_ctrl_trng_data *ct = res;
+
+	mutex_lock(&ct->lock);
+	kfree(ct->data);
+	ct->data = NULL;
+	ct->size = 0;
+	ct->copied = 0;
+	ct->receiving = false;
+	mutex_unlock(&ct->lock);
+}
+
+static int sahara_ctrl_trng_match(struct device *dev, void *res, void *match_data)
+{
+	/* Exactly one instance per controller */
+	return 1;
+}
+
+static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
+{
+	struct sahara_ctrl_trng_data *ct;
+
+	ct = devres_find(dev, sahara_ctrl_trng_release,
+			 sahara_ctrl_trng_match, NULL);
+	if (ct)
+		return ct;
+
+	ct = devres_alloc(sahara_ctrl_trng_release, sizeof(*ct), GFP_KERNEL);
+	if (!ct)
+		return NULL;
+
+	mutex_init(&ct->lock);
+	ct->data = NULL;
+	ct->size = 0;
+	ct->copied = 0;
+	ct->receiving = false;
+
+	devres_add(dev, ct);
+	return ct;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -400,6 +485,11 @@ static void sahara_send_reset(struct sahara_context *context)
 	context->is_mem_dump_mode = false;
 	context->read_data_offset = 0;
 	context->read_data_length = 0;
+	context->is_cmd_mode = false;
+	context->receiving_trng_data = false;
+	context->trng_size = 0;
+	context->trng_rcvd = 0;
+	context->trng_nbuf = 0;
 
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
@@ -435,7 +525,8 @@ static void sahara_hello(struct sahara_context *context)
 
 	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
 	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
-	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG &&
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_COMMAND) {
 		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
 			le32_to_cpu(context->rx->hello.mode));
 		return;
@@ -454,6 +545,153 @@ static void sahara_hello(struct sahara_context *context)
 		dev_err(&context->mhi_dev->dev, "Unable to send hello response %d\n", ret);
 }
 
+static void sahara_switch_mode_to_img_tx(struct sahara_context *context)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_SWITCH_MODE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_SWITCH_MODE_LENGTH);
+	context->tx[0]->mode_switch.mode = cpu_to_le32(SAHARA_MODE_IMAGE_TX_PENDING);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_SWITCH_MODE_LENGTH, MHI_EOT);
+
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send mode switch %d\n", ret);
+}
+
+static void sahara_command_execute(struct sahara_context *context, u32 client_command)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXECUTE_LENGTH);
+	context->tx[0]->command_execute.client_command = cpu_to_le32(client_command);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_COMMAND_EXECUTE_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
+}
+
+static void sahara_command_execute_data(struct sahara_context *context, u32 client_command)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_DATA_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXEC_DATA_LENGTH);
+	context->tx[0]->command_exec_data.client_command = cpu_to_le32(client_command);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_COMMAND_EXEC_DATA_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send execute data %d\n", ret);
+}
+
+static void sahara_command_ready(struct sahara_context *context)
+{
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_READY_LENGTH) {
+		dev_err(&context->mhi_dev->dev,
+			"Malformed command ready packet - length %u\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	context->is_cmd_mode = true;
+	context->receiving_trng_data = false;
+
+	sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
+}
+
+static void sahara_command_execute_resp(struct sahara_context *context)
+{
+	struct device *dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+	struct sahara_ctrl_trng_data *ct;
+	u32 client_cmd, resp_len;
+	int ret;
+	u64 remaining;
+	u32 i;
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_EXEC_RESP_LENGTH ||
+	    le32_to_cpu(context->rx->command_execute_resp.response_length) < 0) {
+		dev_err(&context->mhi_dev->dev,
+			"Malformed command execute resp packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	client_cmd = le32_to_cpu(context->rx->command_execute_resp.client_command);
+	resp_len = le32_to_cpu(context->rx->command_execute_resp.response_length);
+
+	sahara_command_execute_data(context, client_cmd);
+
+	if (client_cmd == SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST) {
+		sahara_command_execute(context, SAHARA_EXEC_CMD_GET_TRAINING_DATA);
+		return;
+	}
+
+	if (client_cmd != SAHARA_EXEC_CMD_GET_TRAINING_DATA)
+		return;
+
+	ct = sahara_ctrl_trng_get(dev);
+	if (!ct) {
+		context->is_cmd_mode = false;
+		sahara_switch_mode_to_img_tx(context);
+		return;
+	}
+
+	mutex_lock(&ct->lock);
+	kfree(ct->data);
+	ct->data = kzalloc(resp_len, GFP_KERNEL);
+	ct->size = resp_len;
+	ct->copied = 0;
+	ct->receiving = true;
+	mutex_unlock(&ct->lock);
+
+	if (!ct->data) {
+		context->is_cmd_mode = false;
+		sahara_switch_mode_to_img_tx(context);
+		return;
+	}
+
+	context->trng_size = resp_len;
+	context->trng_rcvd = 0;
+	context->receiving_trng_data = true;
+
+	remaining = resp_len;
+	for (i = 0; i < SAHARA_NUM_CMD_BUF && remaining; i++) {
+		size_t pkt = min_t(size_t, remaining, SAHARA_PACKET_MAX_SIZE);
+
+		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
+				    context->cmd_buff[i], pkt,
+				    (remaining <= pkt) ? MHI_EOT : MHI_CHAIN);
+		if (ret)
+			break;
+
+		remaining -= pkt;
+	}
+
+	context->trng_nbuf = i;
+}
+
+static void sahara_command_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, cmd_work);
+	int ret;
+
+	if (le32_to_cpu(context->rx->cmd) == SAHARA_EXECUTE_RESP_CMD)
+		sahara_command_execute_resp(context);
+
+	if (!context->receiving_trng_data) {
+		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
+				    context->rx, SAHARA_PACKET_MAX_SIZE, MHI_EOT);
+
+		if (ret)
+			dev_err(&context->mhi_dev->dev,
+				"Unable to requeue rx buf %d\n", ret);
+	}
+}
+
 static int read_data_helper(struct sahara_context *context, int buf_index)
 {
 	enum mhi_flags mhi_flag;
@@ -680,6 +918,9 @@ static void sahara_processing(struct work_struct *work)
 	case SAHARA_MEM_DEBUG64_CMD:
 		sahara_memory_debug64(context);
 		break;
+	case SAHARA_CMD_READY_CMD:
+		sahara_command_ready(context);
+		break;
 	default:
 		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
 			le32_to_cpu(context->rx->cmd));
@@ -980,6 +1221,20 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
 	INIT_WORK(&context->read_data_work, sahara_read_data_processing);
+	INIT_WORK(&context->cmd_work, sahara_command_processing);
+
+	for (i = 0; i < SAHARA_NUM_CMD_BUF; i++) {
+		context->cmd_buff[i] = devm_kzalloc(&mhi_dev->dev,
+						    SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
+		if (!context->cmd_buff[i])
+			return -ENOMEM;
+	}
+
+	context->is_cmd_mode = false;
+	context->receiving_trng_data = false;
+	context->trng_size = 0;
+	context->trng_rcvd = 0;
+	context->trng_nbuf = 0;
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
@@ -1003,6 +1258,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 	cancel_work_sync(&context->fw_work);
 	cancel_work_sync(&context->dump_work);
+	cancel_work_sync(&context->cmd_work);
 	vfree(context->mem_dump);
 	sahara_release_image(context);
 	mhi_unprepare_from_transfer(mhi_dev);
@@ -1019,15 +1275,71 @@ static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
 	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+	struct sahara_ctrl_trng_data *ct;
+	struct device *dev;
+	size_t copy;
+	int ret;
+	u32 i;
+
+	if (mhi_result->transaction_status)
+		return;
+
+	/*
+	 * Raw training payload completions arrive for cmd_buff[] buffers.
+	 * Do not schedule cmd_work for those.
+	 */
+	if (context->is_cmd_mode && context->receiving_trng_data &&
+	    mhi_result->buf_addr != context->rx) {
+		dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+		ct = sahara_ctrl_trng_get(dev);
+		if (!ct)
+			return;
 
-	if (!mhi_result->transaction_status) {
-		context->rx_size = mhi_result->bytes_xferd;
-		if (context->is_mem_dump_mode)
-			schedule_work(&context->dump_work);
-		else
-			schedule_work(&context->fw_work);
+		for (i = 0; i < context->trng_nbuf; i++) {
+			if (mhi_result->buf_addr == context->cmd_buff[i]) {
+				mutex_lock(&ct->lock);
+				copy = min_t(size_t, mhi_result->bytes_xferd,
+					     ct->size - ct->copied);
+				memcpy((u8 *)ct->data + ct->copied,
+				       mhi_result->buf_addr, copy);
+				ct->copied += copy;
+				mutex_unlock(&ct->lock);
+
+				context->trng_rcvd += copy;
+
+				if (context->trng_rcvd >= context->trng_size) {
+					mutex_lock(&ct->lock);
+					ct->receiving = false;
+					mutex_unlock(&ct->lock);
+
+					context->receiving_trng_data = false;
+					context->is_cmd_mode = false;
+
+					sahara_switch_mode_to_img_tx(context);
+					ret = mhi_queue_buf(context->mhi_dev,
+							    DMA_FROM_DEVICE,
+							    context->rx,
+							    SAHARA_PACKET_MAX_SIZE,
+							    MHI_EOT);
+					if (ret)
+						dev_err(&context->mhi_dev->dev,
+							"Unable to requeue rx buf %d\n", ret);
+				}
+				return;
+			}
+		}
+		return;
 	}
 
+	/* Normal Rx completion */
+	context->rx_size = mhi_result->bytes_xferd;
+	if (context->is_mem_dump_mode)
+		schedule_work(&context->dump_work);
+	else if (context->is_cmd_mode)
+		schedule_work(&context->cmd_work);
+	else
+		schedule_work(&context->fw_work);
+
 }
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {

-- 
2.34.1

