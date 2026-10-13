Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D33B4EB6
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881167; cv=none; b=tg9MQw+V72/fiWzmExPNkVCni+WtWjC60FivLJGi4qrve4s3ceKz4hOfKfnYSNiiFUxj7OHIMMIhQtDPoeXodooVm1GCWM91H07SqUsVK1o5qR20NiV9QEq5oEzyGRZuVQ4VbiVIVVNsnYYqZpmrKXiuDdZN4Z/bznF61NYuhck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881167; c=relaxed/simple;
	bh=D6ORrR4WZCXe337DEAaoy6vLh2qom8bYpV8ibq3sUAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fX09BdJhwkyx3Jr3NR5j5Nwh6lgnRCwVr1+nABZifkRLdkd0WGU2XCYe1q3GfnfCY0IRx/jzvd7ZLurHo/4vC2gljoMhioN/X4LW7t3Ln1gVOufpgip3IOyeYB3+KP902G56baoEaoUXRIfHtqZ2WrYkeELuncid511seuDoCKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3WVv2WP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6AZlsft; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3WVv2WP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6AZlsft"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D87bS43908217
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hPMzbv/4wi4ODfA9XRSPX8ue5WbPDcJwnRMdAkV9P04=; b=d3WVv2WPID92/+my
	EBZkCwi7mvJbrTP/7xGwePIzSROWL8Dv5arppVeaG5wTdCr930+p5ADCfh6OXb1f
	UxHJTalSwWXW20z8MbmWI6lkkIs+Zoaf2F1/yqJVt7n24u31eYKy1oqHifUC91gZ
	Jw1Pll2iL+vuSJVRmBIZsbdNw60Rvm7Zfqis8ANZc6uB1oxi5BTwEYUa5pXnlF57
	Mx1KMRpSsXyezzyYEjC4swu7gBagk6QvJdJdAQK/MbJa/mdBpTQmdh44cEzrLwS6
	3yYs0k8ZNlWJUcwOfLjAtuZSV0yda8CzrIe2QUf1z8fOg+h/NAMKA9E/ATPuKS8B
	Fe4pdQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtke8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:46:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3e7a65fa8so1672225a12.2
        for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 01:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881164; x=1792485964; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPMzbv/4wi4ODfA9XRSPX8ue5WbPDcJwnRMdAkV9P04=;
        b=B6AZlsftjo8IJ/5wQgPs4WIPbZV1kUnODhL1PDbXm21xzR/K+xH7WkKdtBxy+j4APh
         JCMs+m6Bh4V0zWZEbl+eBgLlPmMB4Yk0LNAHwj59i76sMBd2Lu5RQdu2fozU7nzcxHCH
         p2LVJ3qnXob3syLs18cAhwuGI+jlW+L1s7u10C+l+RNRes3yt5SLVGIMQYSMfMNTWTJY
         HkvpeRUlQ3x+W4vp06q1aE4KjiVPcbpxH+KzPevMGduNIvDFy0q9RE/+roj488saG7DE
         HP85aTrJnyh/iYTZ6ZFzVEFwkoIpRvKkE3JFqyl3pyUeADOBYcZZHY2QEgBofVWWnWnw
         LjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881164; x=1792485964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPMzbv/4wi4ODfA9XRSPX8ue5WbPDcJwnRMdAkV9P04=;
        b=sVoT+XNgHLMj9ytC/3dGE99TaVHwq3cvghjauyrE1ImRTBcHDjNyDv0SzcowVBncP6
         3QsplSZS4s3FEFtOcpXBhnqf6cfVs+LDZAZr6YHERsEKv1K275da/3IbYoMBT+GEdj7B
         XS/icm4a7ul7Dywg/THRc1cPP2Lft6reqirhgPmj8oarE6SxUb33YbjKtFGA62ArbfzB
         GYw1Tjag9ox0NsSi6HiG41mOwC0n1NaUrbzIs0V3LrlECtH2EuCfy/TP/AqKueIhe4pX
         lkHrbi/+FpbrefEISdghSU+JqHuWOVdryhOQQSrNGmS+5hSJWIirVx9tFs7AFtXHIdt8
         xBIw==
X-Forwarded-Encrypted: i=1; AKwUvBz0Odfu6WRfaOoRiD/LJWGrFje+Gnjm1XqmN9EmVh7ogDAJKOklgm4WynD/xcbBFVC7lPY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRaWHe1XwjTUZdTnduiYNIK+fmydtgg29bofarHcDoR3AAwpw/
	V7gBHmY5MWksJi0NchCB5DU4SLa8O+6L9sU+nKWAvBrOa+MFc8s79aJz5V/aoQdYFkYXmLNZwam
	0/VEM9ZQjiSQwzHr/Xw44FbFM91RguvIq9FjxAx106DzaH9aTfkvLp8w=
X-Gm-Gg: AYBFou21U/oVY6lz8YTqBJE1lWxK1becRuA6cU8wkT5pgpLeqX0t6we9GCJ78uhm356
	ddRonWykseyv09VrIroBtMzC0cRxQBchqwQs0UDmiVwOhFTz+az5UqN4kAiSJkfT8egD2uSC43H
	HnndklS6/0II6S37dMEZkVu5lCkt4kicOfViry6hN1HiHWeB5fX3i9HKdBxjhANxPsKiST6W1bt
	1AGNnKd/1hMX+uqga1BxeWhomQHEuae50Nh/k9GlT57jkJ0zXtFbGIqBfy+Btl6evbYXaLueZrK
	91O8B4lyZXxllQ+pN6w1/VOMx+tEAZ9SOx7oENchMWjHKGhANqrkSzaI/4Iebmu2H/CUggDxG8C
	6e/wmfdQO5BGHl4IQXjGd/4DczDGA
X-Received: by 2002:a05:6a20:d80f:b0:3de:5a86:9dca with SMTP id adf61e73a8af0-3e16bd92915mr11238305637.19.1791881163657;
        Tue, 13 Oct 2026 01:46:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:d80f:b0:3de:5a86:9dca with SMTP id adf61e73a8af0-3e16bd92915mr11238257637.19.1791881162540;
        Tue, 13 Oct 2026 01:46:02 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:46:02 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:35 +0530
Subject: [PATCH v9 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-4-dc9f24357c4a@oss.qualcomm.com>
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=5671;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D6ORrR4WZCXe337DEAaoy6vLh2qom8bYpV8ibq3sUAI=;
 b=cEwEItZ/aATGDCtMC/IMrT3jaZb6dpHYBZq2vC/waUlcZ7wIK+wlAP4SywG/I48UQvIQC3YhZ
 pxVgVNGofNQC2mKIdvz7xAIDhtzAaM55jywh9knYnFS9wci/wTYMkp9
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXzENBipkjmule
 2ZyMHqqSY8SOTSHKI30nzgF65vMTCIiHjEllfqZnneBslfcXuqJ/jLAg7so2EZvEQxDvHfAueUw
 8xkSipeot9OK18PBboOysmBCO0CKdm6P313XeD6P+iI+pYfTVVyVN6Lc+RCQixsQUmt8cailZjA
 H/l+yyqSsFwerq6Zv9qPqhe713D7n8A3lebxy8tYDZsnPJJ6AfVOScChWICFySCl1dgNpjiSQi7
 KgujSOaACr4gOdocsOdIgR743f30nbfdfyp0BRdherMZk+sXI92ZN67QJQhwGlN1aw9K6PYlenY
 1/zJLfFBBcJmGTpmQkaiDKf2vkRrcqt5RRFhJpZmiPUW9CM6BvnGAMILWM7i+wVqqVpLX9z42V4
 VPCnbYZexg5PolvH+0MFgKYEkVVoaSebYw9NymSHQjRFEpRT2iqPguHyV86EQaGeGvYCCLrM0il
 Nh8U8426y4i7Q8QrS3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX9ITNd6AdC/YY
 ep6miGxhnKw/VT+49MNVIXUFItpolR2NaYaboxL1p/TopXDEbf7Odyv2KbveJgHahdu8Ts+FG2r
 ylu2hHHm30IZYBRHqcxf8PjIq41aIPM=
X-Proofpoint-ORIG-GUID: 1u6nKRK0AM9QlnYZZ6X7D3P2f6Ti_TR-
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acdefcc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 1u6nKRK0AM9QlnYZZ6X7D3P2f6Ti_TR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe time variant selection to match the SAHARA MHI channel and
associate it with the QDU100 firmware folder. Add a firmware lookup
fallback for cases where an image does not have an explicit entry in the
device's firmware table. This allows required images to be provisioned by
the platform.

This change only affects devices matched on the SAHARA MHI channel and
does not change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 27 ++++++++++++++++--
 drivers/bus/mhi/host/pci_generic.c           | 41 ++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index ce4fcbd40baa1b3a3d65d0d10fc9e54b1c7eb04d..a4b3ef197b303cce5a36cbeda272119f0430e619 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -188,6 +188,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -200,8 +201,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -869,8 +890,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA", },
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a384cca477be9e4f48cdf5f67e680ef55fc5..dcd49cd15074a20cab62a304143abbd0c0614cec 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -47,10 +47,12 @@
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
  * @reset_on_remove: Set true for devices that require SoC during driver removal
+ * @sahara_fw: Sahara firmware mapping
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
 	const struct mhi_controller_config *vf_config;
+	const struct mhi_sahara_fw_table *sahara_fw;
 	const char *name;
 	const char *fw;
 	const char *edl;
@@ -287,11 +289,49 @@ static const struct mhi_controller_config mhi_qcom_qdu100_config = {
 	.event_cfg = mhi_qcom_qdu100_events,
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
+static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
+	.image_table = qdu100_image_table,
+	.table_size = ARRAY_SIZE(qdu100_image_table),
+	.fw_folder = "qdu100",
+	.non_streaming = false,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.name = "qcom-qdu100",
 	.fw = "qcom/qdu100/xbl_s.melf",
 	.edl_trigger = true,
 	.config = &mhi_qcom_qdu100_config,
+	.sahara_fw = &qdu100_sahara_fw,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.vf_dma_data_width = 40,
@@ -1426,6 +1466,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
+	mhi_cntrl->sahara_fw = info->sahara_fw;
 
 	mhi_pdev->no_m3 = info->no_m3;
 

-- 
2.34.1

