Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816D4D1783
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829116; cv=none; b=OoJGml2gWnEbxZl+W4XkALHWSV8ld+p1Xlolxy5qg5EJ8ev9OhDJZ4UThMCagit2bOklCsOfPGRhmECgBo3q5p6AqX2pkidqiopOCkXPQAaUMqRQgiL2g0kbhVGVYDR6xDuw5beZtoeKML0AjVWODA3EoStFFvLVVNoR3NH9AUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829116; c=relaxed/simple;
	bh=LI2epAdNTVUimdncg6NOtNOZI6PyMoXM1ZEtdy3pDbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCQmtKRlFHBkAUU62xkBTNJ/CHrqtvLaDI6dlpGyoxzxFRx+kMLHgiChJPWNySqPWwSwJQirt1OeRIAGv8AoOo2T8Krkhq5sWHpXsaubq+ixqd/j2gbw3pxrIlKllTAStcUVU4pe53eTIGV0ryW0zUNRSa4RuKa/vgm/Mvus2ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fE4hAalx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCLY86eN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fE4hAalx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCLY86eN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHufaw2722704
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sw8RZE7vSFZG1vO/uYgqWWGk6n7nko8KiavfyPAl2eQ=; b=fE4hAalxnWjSKUtK
	yphQJfoTZYgpMshM4D8ddx3i1Om+AEV/u40RjGOi32xYvqlIxQXl9q3cFpPowTG/
	SIEYKcJ7RAfyFhK0y8L07l80A/ozcwQ4Mo865DE8GCmOEudsHsiv4fxmQqwDV7qR
	JOQ9yHQ2M5ry1KXyJNENs3Gjx0RArji5Ue1gNGsn6JCJPjXC0ZGI7pV7cK4gB5nC
	wREyiSwm+IrCo4fUG134GEDdaPjcpflI0PxBdGJ46Usz2IzNK5vFy3CxipG4ix/O
	Roivrrtzg/vbU8a/C6HXyiV8zyXan4lPe1KGUZ+xXIsjfqsvxIaXT5GrnOYHt6Se
	Vba9Sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w06yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3592749a017so1800563eec.1
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829112; x=1792433912; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sw8RZE7vSFZG1vO/uYgqWWGk6n7nko8KiavfyPAl2eQ=;
        b=jCLY86eNMse1+5iwrU7g2cYDtxZG+8Z+UYO87uHpHEQ+dNpFGET23OLU42Jl5jb29m
         d9Bg1a1B+5wwUGmYw1wp4Kqk+SiLQC4h98k7v0SQei1RIk3fobQm5UYdWhg01dcfTRpj
         lLYXX+Dogpyc8tKKILKNt4nVm8jrC0/k01aI4/5UDb5IfKlnOiJZ1+o5Q+Jjf9KbikYY
         3T1H1bS10drxbzIZfB21wijbwHmbkc1yYOtwF8/ZeO5Uo30ZrLmI7xEgsrWre5CFk7ND
         KlMKO4qL9duUVLFKx1MQTLf0omnseJ/J2F2ino1dK8QBskqzoMpPhOGv4/3bBiSxQcJD
         zeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829112; x=1792433912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sw8RZE7vSFZG1vO/uYgqWWGk6n7nko8KiavfyPAl2eQ=;
        b=IEVOW85jPLNlIJGwhPshALWoXZXOJCcT4tniD+njtoeu4E94QzxQvaVAkvGM5jagzj
         +l9WWWDQa0U+1ga+bJLmEjFCQenMQQw/Z3yEkbW2WijpSBLHhpvX+kq2LD6c6JHY51Xk
         nW5K5QDCSf98SIQFjvKV5rcUmTMEgvC1v65k8AuTwOi797T5lysjWg9R2nMABKSYDUAn
         IOnIVAFIZiyNEfshf+IkZrMis3oB2ZZ2gqM5ky1tXkyudjPjmf9NwrX4NT1FIGXpBQen
         QzagXCHfOLUrVuWncS/RqLc1DYiudz/0OUF7iJpqu3sbazXlCSq7VL1/L0kuwwu/B72Z
         +3Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxoRCe9nbqu5fAfegXTimtYvM7iHegWxziPlF5BAYitj0b9OVe4UUTk1bjodTPhhoQpq3o=@lists.linux.dev
X-Gm-Message-State: AFq9FYIg5OQmtcGrZXZQqqyz7uKHAUpdXRs6FvbRlALNGlvh12R8olVO
	7ucdrrNwDvcZIdSezHDxQTrxJUOmMo3a/KLa/jfRwM9qlclVA6wY4nQBjmJhQv6mdBd0NtelSe1
	paQtpjlvxy/BRYKrFjOyZwkOvkUZJWuqCmYmdIT2t7HpPlhP/8ZOPe/g=
X-Gm-Gg: AYBFou3APBGVCxc0IlPpMQ5wpwdN+ziN3HgHMgn10c2OgO0bKbRB+zbQKQzFzz+bYiM
	eBS5br9Hv0lsRlYe+xRwmP3mnximOacsEZZwswPuleY02GwKsI2E6hSmam44j6r9iWpW/CNdjXX
	1swLEu5YF1idSjkHlugdO+k0o/AsmwJHL8xaetaJmm3izGSnxYBOFOtPJ4IWDpN2m+Q9I8eZPRy
	OwcfaM6lTYF0dC3WEcVh45WO0VOXQ+9O8ZaxivWWVZORw5Z1YSRag3tvXp0g5nelderZtCR9Jag
	yjg7sRMDpnnp1ZB5/9QAna9vqIbMRzqP4EuRCGhgjwbPCWEWQybJXOeexCAsFfK4vYsFRo4jgAx
	qUcQhMzj4a2uGnQxVjt/VehwxGt5M
X-Received: by 2002:a05:7301:550d:b0:353:ba38:789d with SMTP id 5a478bee46e88-353ba388140mr13485353eec.0.1791829112188;
        Mon, 12 Oct 2026 11:18:32 -0700 (PDT)
X-Received: by 2002:a05:7301:550d:b0:353:ba38:789d with SMTP id 5a478bee46e88-353ba388140mr13485293eec.0.1791829111326;
        Mon, 12 Oct 2026 11:18:31 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:30 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:02 +0530
Subject: [PATCH v8 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-4-e12939d229a1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=5671;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=LI2epAdNTVUimdncg6NOtNOZI6PyMoXM1ZEtdy3pDbc=;
 b=wkC+OVvFRtY8UHddDtkJpmNFwHGJW7RpfoVcHn+HpC9M0lCTNm93O6U0Gn77n16mtWnzvZXCy
 Z9ybBBVceZ+CIUa02TCidoT1WSPyB5TW0Q3x/BelsiymE6APDmujaPl
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: 1p-jwtnurffM6Xy0ALmcnwUwj4_OZd1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX5b9v3kRCwJCb
 EGmo4yayJnStMxKrPYgOBpORhljiiSrlpiQWP3fKpdJQqFc+TLWaUlXU+w5/+ShH6v2b56ukMSu
 zY2cOIjgDm6bawWw2veGBbuLkOG60/FBBbjdM81ayCiIdWXDTvpJguZyLE5eh013TxoduwTP+Rq
 vFWOsfFk3jRAG0MyTeI02vNuQaCJIn7H2qDwT9q66RU26UkQcNVSWjFpcuuyT1M/lrJNaaXBPbP
 mhvSzvK/9cS48SGmdlERdy+2vGNlm4I/KvH56pMVKS6On8i0j2A31Izf0PI0t1Pzhla7zwxz8lV
 1QDfJj9lpERIfpQdugRJ6dulEFdO1f1JS7ltgUigepcPBENIOhs4WSFf56+LiT1gTZfGr2rSge2
 fqE7HcROavQAHKxkiKCuyJrfZsZT5ZYeQy/DBur327q1FQyAGhk+HTjGYfUdG20PA9ppmc4+f6a
 H8YgiAq8blmXoltx5yA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX1inIitl6oAi5
 hokyn9TIxYQFzOVyNlfn2dFnCr/MagHmyvPUGgShgAr26nQc0n8fdxB9TA+5O9iWkMLtF6DIEhz
 e+/E30H87GOQh1bgVilSUfn/ymB6bbM=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acd2479 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 1p-jwtnurffM6Xy0ALmcnwUwj4_OZd1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

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
index 74bf57f02873e463d0c2cfdd2673237840169df2..4baa47d0b94e326b5bfcaa80c8ddf008881c85c9 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
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
@@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
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

