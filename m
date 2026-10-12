Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B64D09F8
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829125; cv=none; b=bnNwKOu8uXAyC+LMXDZLmwEidTqc7SvITtCpFEF1iv5qlS11UzFwKyL/668JC+MnbXCf/4VhvEJvEvLbp8Lb5mMqMd4pk3YJhbg4oy1jf0l1n3L/67wZJaYWIMJtAj+oCdZDTWw3cBQE1b24PXw70QYqm2BcgY8WRchMv2zus+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829125; c=relaxed/simple;
	bh=dBPq6l9rURFDunzSNUlT+sZaqzcP3Ytbz7tKxF9fipg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gmvylQFQZO18vT1jbjAAsK31atELc6EJiV61iZB0/Zg8WMfHEpBXheSkP3qa7H8q0FkhxnEayKnslYkhU0OrNA1Vkames+e+WAs7lYXPbFF2Rx7fKP815+RF0UGAB48EhXLXCRbGKw09XzASgeYCIdKqZNIwCo6u88EtjZRff0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mn28HAZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY7NbTmv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mn28HAZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY7NbTmv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHuhA82722758
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIVGEDll2jp2JXJq4ICnIXt8TxFWZic/DxVsb7WJmMg=; b=Mn28HAZ0FI6We+OW
	T0wfNcdjlhZwIM7wexMjhIngubXrsfodCZZ6EDUqDy2hWPpVnxpTYxltzhMqEXOA
	IAdRL3XoKXZvkQuZAXvloTtGKwzGkCoU7dHYnUnU3NJ/sW9xWDdGv7e0u8AWXayP
	SV5R4zxAcxt/8KirYmMZ9B1D0HkplopdvPacLXtz81aB8IkxmiBPpffTK5gswptv
	k9i7HatlY1rJB6c2IGZVZM1hyllYR+nXvV7UTvyHK0WXUvGD+nndlDc56BQmZEw+
	hm1ILghy1gazCNdnZja90PA64XmH4388z47GwD9zx5TZxU3c1BSfLMQDGE8TTIPR
	suWjTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w0700-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4391968eec.0
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829121; x=1792433921; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIVGEDll2jp2JXJq4ICnIXt8TxFWZic/DxVsb7WJmMg=;
        b=kY7NbTmvAnefCynn8pJ8/2dM444LzOMa1xRCOitJUWa9g6skkBkmZpeYbPrO+nzn2j
         e/Hx1YckcYtw8kgq4RFOLb5dJslO70zxm8fqc1dYUTAzT9JzgGRsjemr8G1KHB62Lp4d
         Jd8xeAvh/ZK+CQ2zzcKI1votl9JrnOa2VOJPfh1V+cIsw2CQTBsqei7UtYMEBeTLHhVa
         ps5tH7BIdqDcmw6+rmiTydPK7VrmjMLf6RgJe8OipZ1KVNlt5pCkJgoXTNpuCVtF+CoG
         tPgDGiJz8vYDjB9B40RIk8Qk7qoYd2ODhSEGmLhvLNlZLBuMY/LrnZhrsSk8M60Aiidi
         Ee/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829121; x=1792433921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIVGEDll2jp2JXJq4ICnIXt8TxFWZic/DxVsb7WJmMg=;
        b=Wyo7Q1xm+GcvyOh4WiJzwmhL9GfvAzST4f8SrNKYlmxtUnLxGavgsurxYzBDsiZjal
         7Kwf/3HYYTgFGotL2jMUxe2VIPrBkdkjZCosfMVzlYeaSq2xH6cteQVL3MQcDt8TFQSD
         QegePEk8df10AqFXGWJrPrdhyWF3sunw0LwNPBcFNtUPHkSVwxV9/LVMQKH4fhOOBnQ9
         uxTI+q8MktP27GM5Ej37O1HhX4V9tlWfTK7yaQApiNQkz85dLM4afmLuyxHyiZ+4/9Rw
         gAY9s0IBtn+d8CDC4t4IS9qSDm3yquMn+nekoBJKGUZetW9XTYTGOavYRDioC8fyfaoo
         GkgA==
X-Forwarded-Encrypted: i=1; AKwUvBxR/Ft/YSpBzl2QC9tPdkejizfiz3r3JRZx4syBWhslk3eR+vQFoQz37UD7uRL9q75Z8jM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJhkWr1abI6W7wriS+P45ePkoKZ3OpbvFxTNSMNv0rCV/w+vhii
	zv5E6Lcj2A+cBmjVexem9lTVYGp+zHPoAYlms7Gwa7qZMvdNhGhGGxj4x4G1V4JdDJIPLNNSmmk
	cTyGxWB88Gm/5NU8yzgop1WWUFEIfJKsJFX2mN43y1u2EGfmDGz/78/0=
X-Gm-Gg: AYBFou0x4y7+sUachZdBnMN+PTn7isyUJ5PW+KhGlqNsrOtQF6dWgx5Ivl4IBXWvBl/
	1WrppNNourz/zgfV6l3CxthA9HKXHfcLZKGaYz+47XRKO400rAcUZbxyEGQcDXnYkzqZu0f33Gi
	s+7vrmf0DGxxL8xEwnWE3NZq9BREnxGurUDIMVsfiCG1ebdvU57+7nDHMgDSBJ3GsrKxuSDFnqg
	j4629CI6+dsg4IluNbpr3sIHDMhJNXaEeMa2QZNW9tEKwbxAiUprzOhKfxEVWmxJMCXOxn+JrcS
	XsvrXohkbQ2l/LPkwD+XZ4KoqVgOeQZUVru2SSRlRexNsJxQSGBsZGhj69e3CtF11Tpzz82twnW
	3Veyz028cQz6j71uTf1TWsgLGMmHx
X-Received: by 2002:a05:7301:1:b0:35b:9bd:1435 with SMTP id 5a478bee46e88-35b09bd1510mr3697161eec.2.1791829121052;
        Mon, 12 Oct 2026 11:18:41 -0700 (PDT)
X-Received: by 2002:a05:7301:1:b0:35b:9bd:1435 with SMTP id 5a478bee46e88-35b09bd1510mr3697113eec.2.1791829120281;
        Mon, 12 Oct 2026 11:18:40 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:39 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:04 +0530
Subject: [PATCH v8 6/7] bus: mhi: Capture DDR training data via command
 mode
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-6-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=15044;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=dBPq6l9rURFDunzSNUlT+sZaqzcP3Ytbz7tKxF9fipg=;
 b=mR4VvIdnx4JMnR0dloxSQCy3bY/aYGnrE0+4wBzxUApizAdrZJh0Ix3Sn4OdK/3xY3s6ywuj1
 LmFd5/f5GkfDbggtoibDpenniczUhUq8t/z3BY/IvwhvoJOJuLC42/k
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: GqpYAZGhY9DKqz9LAxHzF_pQR7jZclqg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX9Holh4JkHJM9
 GsXuXyrhr2Tm5DMHLNYUTE5k/SD4JAnoeKP8MknSZJRbd2Cfv5vWQzEc/qDiA4IyGC9GnCu15o4
 dOpFlIJfQSGyletg+EWFDGIaGIRJ5A1vu9zJpZIwbTyQ0Vl8DzDVuDVsbVi3aQ1jJHoBiJpSe3k
 lxlZlqUo7S5kwtJoCEP8LEOzNrGWRi3Uqq4Ti42TC9B/M1LrsGFZFAuQQZMZnMGL3s2akvhWjj4
 0cBpyv5Wm/JpfR6HuegANtITZhr+u/KUHy0aD4Q/agtbin9LqPNHKoqYXfWEDmyOHu8Yf/FRgYo
 YuvgASRBWJ44xlYk3WAI7hVP4SLap2oiWHmu6hs6sY8SBG4S2u7jUsmsFvPthZbizv5/VLksW60
 mjmHF92mpQqB7jZe9wFKn+hZXT4FD3YU/3NYu+r5xzg1NvDDnN+EtxbFNEZ+ChL+67iPhiXruhE
 +WtTbvWFc/hkcVdKy7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXxYUHn89Ks4S8
 eyqOoNkhOaT4/x71R6ATLnjsnmvtf08yCbv04qzsS1Ds5WDauvwTpdy5yQYtgNTpes1j8wh+NNY
 F6TD+9dijOx6U42e6bIbWmunkGDpcXo=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acd2482 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_u4x-iUupSARUiuVX_kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: GqpYAZGhY9DKqz9LAxHzF_pQR7jZclqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

During early boot, devices may perform DDR training and produce training
data that can be reused on subsequent boots to reduce initialization
time. The Sahara protocol provides a command mode flow to transfer this
training data to the host, but the driver currently does not handle
command mode and drops the training payload.

Add Sahara command mode support to retrieve DDR training data from the
device. When the device enters command mode and sends CMD_READY, query
the support command list(ID 8) and request DDR training data(ID 9) using
EXECUTE and EXECUTE_DATA as defined by protocol. Allocate receive buffers
based on the reported response size and copy the raw payload directly from
the MHI DL completion callback.

Store the captured training data in controller-scoped memory using devres,
so it remains available after Sahara channel teardown. Also distinguish
raw payload completion from control packets in the DL callback, avoiding
misinterpretation of training data as protocol messages, and requeue
the RX buffer after switching back to IMAGE_TX_PENDING to allow the
boot flow to continue.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 326 ++++++++++++++++++++++++++-
 1 file changed, 319 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index afb72910fd67b225cd77c44d7e835cae138c2ffb..e7a6289b11a72d5dda008d6107eff6b4f9b67519 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -5,11 +5,14 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
 #include <linux/minmax.h>
+#include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
@@ -59,7 +62,15 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_COMMAND_READY_LENGTH	0x8
+#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
+#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
+#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
+#define SAHARA_SWITCH_MODE_LENGTH	0xc
+#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
+#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
 #define SAHARA_DDR_TRAINING_IMG_ID	34
+#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
 
 struct sahara_packet {
 	__le32 cmd;
@@ -95,6 +106,19 @@ struct sahara_packet {
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
 
@@ -161,6 +185,7 @@ struct sahara_context {
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
 	struct work_struct		read_data_work;
+	struct work_struct		cmd_work;
 	struct mhi_device		*mhi_dev;
 	const char * const		*image_table;
 	u32				table_size;
@@ -181,6 +206,24 @@ struct sahara_context {
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
 	const char			*fw_folder;
+	bool				is_cmd_mode;
+	bool				receiving_training_data;
+	size_t				training_size;
+	size_t				training_rcvd;
+	u32				training_nbuf;
+	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
+};
+
+/*
+ * Controller-scoped training data store (per MHI controller device).
+ * Stored as devres resource on mhi_dev->mhi_cntrl->mhi_dev->dev.
+ */
+struct sahara_cntrl_training_data {
+	struct mutex lock;	/* Protects data, size, copied and receiving */
+	void *data;
+	size_t size;
+	size_t copied;
+	bool receiving;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -188,6 +231,48 @@ static bool is_streaming(struct sahara_context *context)
 	return !context->non_streaming;
 }
 
+static void sahara_cntrl_training_release(struct device *dev, void *res)
+{
+	struct sahara_cntrl_training_data *ct = res;
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
+static int sahara_cntrl_training_match(struct device *dev, void *res, void *match_data)
+{
+	/* Exactly one instance per controller */
+	return 1;
+}
+
+static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct device *dev)
+{
+	struct sahara_cntrl_training_data *ct;
+
+	ct = devres_find(dev, sahara_cntrl_training_release,
+			 sahara_cntrl_training_match, NULL);
+	if (ct)
+		return ct;
+
+	ct = devres_alloc(sahara_cntrl_training_release, sizeof(*ct), GFP_KERNEL);
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
@@ -281,6 +366,11 @@ static void sahara_send_reset(struct sahara_context *context)
 	context->is_mem_dump_mode = false;
 	context->read_data_offset = 0;
 	context->read_data_length = 0;
+	context->is_cmd_mode = false;
+	context->receiving_training_data = false;
+	context->training_size = 0;
+	context->training_rcvd = 0;
+	context->training_nbuf = 0;
 
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
@@ -316,7 +406,8 @@ static void sahara_hello(struct sahara_context *context)
 
 	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
 	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
-	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG &&
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_COMMAND) {
 		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
 			le32_to_cpu(context->rx->hello.mode));
 		return;
@@ -335,6 +426,153 @@ static void sahara_hello(struct sahara_context *context)
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
+	context->receiving_training_data = false;
+
+	sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
+}
+
+static void sahara_command_execute_resp(struct sahara_context *context)
+{
+	struct device *dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+	struct sahara_cntrl_training_data *ct;
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
+	ct = sahara_cntrl_training_get(dev);
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
+	context->training_size = resp_len;
+	context->training_rcvd = 0;
+	context->receiving_training_data = true;
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
+	context->training_nbuf = i;
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
+	if (!context->receiving_training_data) {
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
@@ -561,6 +799,9 @@ static void sahara_processing(struct work_struct *work)
 	case SAHARA_MEM_DEBUG64_CMD:
 		sahara_memory_debug64(context);
 		break;
+	case SAHARA_CMD_READY_CMD:
+		sahara_command_ready(context);
+		break;
 	default:
 		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
 			le32_to_cpu(context->rx->cmd));
@@ -861,6 +1102,20 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
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
+	context->receiving_training_data = false;
+	context->training_size = 0;
+	context->training_rcvd = 0;
+	context->training_nbuf = 0;
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
@@ -884,6 +1139,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 	cancel_work_sync(&context->fw_work);
 	cancel_work_sync(&context->dump_work);
+	cancel_work_sync(&context->cmd_work);
 	vfree(context->mem_dump);
 	sahara_release_image(context);
 	mhi_unprepare_from_transfer(mhi_dev);
@@ -900,15 +1156,71 @@ static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
 	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+	struct sahara_cntrl_training_data *ct;
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
+	if (context->is_cmd_mode && context->receiving_training_data &&
+	    mhi_result->buf_addr != context->rx) {
+		dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+		ct = sahara_cntrl_training_get(dev);
+		if (!ct)
+			return;
 
-	if (!mhi_result->transaction_status) {
-		context->rx_size = mhi_result->bytes_xferd;
-		if (context->is_mem_dump_mode)
-			schedule_work(&context->dump_work);
-		else
-			schedule_work(&context->fw_work);
+		for (i = 0; i < context->training_nbuf; i++) {
+			if (mhi_result->buf_addr == context->cmd_buff[i]) {
+				mutex_lock(&ct->lock);
+				copy = min_t(size_t, mhi_result->bytes_xferd,
+					     ct->size - ct->copied);
+				memcpy((u8 *)ct->data + ct->copied,
+				       mhi_result->buf_addr, copy);
+				ct->copied += copy;
+				mutex_unlock(&ct->lock);
+
+				context->training_rcvd += copy;
+
+				if (context->training_rcvd >= context->training_size) {
+					mutex_lock(&ct->lock);
+					ct->receiving = false;
+					mutex_unlock(&ct->lock);
+
+					context->receiving_training_data = false;
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

