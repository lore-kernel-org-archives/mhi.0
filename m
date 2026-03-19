Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A132D7FB
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901932; cv=none; b=PHs6QF4BloLpyvhhT0K2mRzNoCMBmzMDncGnW2RzKaQahrRBkOnG/4LLWRHcYibfzyMBYLAGodbZtYJmyVyUp9Z+G4O9V5LTavZjgU/UWf+A5zZWs6IzgADsCkUajhirsqI/WSXI36niRunNnwO1Z2D3ZeGPMl6OzAi+Vgs1u/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901932; c=relaxed/simple;
	bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ReBz63ACZK74q01e+eflxsZdEahSpXg3OPbkIS602Gt3WzMKv3lV87d+oNBFcu+UctA6ii0xkHZ2N8ziWiuGnwnmIbEa1K9CjkqZt2xCXEKS5ZHZBzeqQDWWsfHBD+4yVNv2bzkwe+9eStYCis4nGwnQGmYK4D+uwi9M45rkAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiVy1Vmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDB0AY1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiVy1Vmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDB0AY1P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Y92w2690169
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=; b=GiVy1VmxXUBWGMVw
	rhBiReMM+VZlAF5Etd/nwMhrISpyo4tFZD26N2zTt4WQltNJOYewDgkfCQyjYiF7
	Dj6yC/Z6vNnG7c19WCxdYeb0ydErGZgWfT7gFZ49NrGIi/+BhF8RB9yljIzMmgl5
	8Hg0N/mUpIY85mlUM1/bjndxLwsHDEflDIELwmqB9eKSpzazjuyQ2GN+f9nflL2l
	XCxP+xzxwZfwPd5SBI6SwlEQCS+w1atfye01pJpCe1xwmkTh2DCaU7QxmjIR/Shk
	DA/VwLsZiEWBOk9gyN1UySyCxS+JK3zEzFCn5P+TZSPpCc3qPAtKuVr/lpik7Bqp
	QYM9Pw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyucd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae3badc00dso6694375ad.3
        for <mhi@lists.linux.dev>; Wed, 18 Mar 2026 23:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901929; x=1774506729; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=ZDB0AY1PTghKmf++0sncCFdqDO8NS1b3ElN6GK/5UqSAkp3UHrJ5ByykEVQ3hXCB3O
         hHJqBaVz+X4oNt4aRq23Hgp57hofjBf0euENV0AzxlYO8QcxKKnogaHckeyYwp3XLeS3
         GCODw2Cunp4d2IWmr567S4sMIQ6Y8nKPMi+tNHIAFyY4GA/jNtrWylJ1JUzCJgXQCnMn
         KACAEMnhASctkUfZoQzAw67s2mkx8YgrjPtjcpQbcuHWbJNtjG3WMS9O3fjMR21Fxaf7
         NfVWH1m3mhNXpNkJHclQiTTSqGFnKZLVCN4GeYc4YgAUWbk9ype0V/ToVQcrNeW1hm/h
         BP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901929; x=1774506729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=KOL+Qfk3L0Z68+UmoyewyUJvTPzqwxAp7oKvP+FwKfFG1tqglwn5OvYoFDIcg/1Emw
         GozxH3J8J0hU6DZQEi94FvEs0/ujYJd/6ziBs1IUTSxgQBS3JXlyCTY6opQ5KBayopAD
         weEhqpK0k6fE66cfIm4qo0NYNxXwSOQzkFo2mSGoTUgWnhhkbEtA0vNCzjb0VNZhwBs9
         Ine69zb0OK/jNGNN6uAKhIMnZaJcyxsDLcfvsus4wzi26WDoq382wFz4rR82WdDWDGd8
         +tHDoXHp03Xyv6I39391Wy+K3UfZQj7EUKzrbwCj5Izp1zTjBrOdNZWKweqL12fUXpYU
         h2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTiXZuisGRgoqWjnKBpX9XMtll183JWVNjg1wmUaNV/rauprgCoMSsPRL9ETrsYv+Gzf4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaHUdUpx0XW2E7I+I0wfV/VNo4iHiWFmEWJ0iSA9Wqku5vjl7R
	fFeIUQ2YYr51VNpx5T4CB6f1G30LbZDJDYtMELnoAWsVot3HYCDGjiQ5WYprmjWv3S6HDVBETYN
	sfGxQsXSXlkV+yVjF8D+2bF8ru6DoFA1XoBNqoigm6F+pJ7lavFx84+s=
X-Gm-Gg: ATEYQzy+vD97L4ypI7jM/VaIAS9wpttM+Qil/BhoQhBIMf9PCPv6Vajy4wwYngqJiXd
	1TaXJ34NgWxvbLsF/q8lqMzcGyyhw9+ofIH5LY2aP/AW56vLnqQBVSCBsI33OBktbYfKDzCexw3
	LHuleWrMDfpS+dpZIeL6opNPTjWBD3/0kXUEoWFeHsKaewuh4o57idx1Oss6pV+DNSNpCUYGDpS
	AH+l/ZouJ/vV6mrgbP/sCu3C40wq368lPP35/2ReoH+1s93ES5RMU9vznFArHQK79ohuRA1HfmV
	EJ7Uob/BX6vNc857mXIZ2ozdwDebiquKe3ZJd10TEKjvcHRgiKFnvhgjChFpp5rSEIV6FX0Olir
	9eQu8JrqEURYmHSVfRHm2+mrbs6SmllsxcaObaYEqgnLBXVKra58=
X-Received: by 2002:a17:902:f705:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b06e35b4demr63812525ad.16.1773901929102;
        Wed, 18 Mar 2026 23:32:09 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b06e35b4demr63812295ad.16.1773901928598;
        Wed, 18 Mar 2026 23:32:08 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:08 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:45 +0530
Subject: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=5038;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
 b=/wsjS4Mb50XnI6cIGT6SBvW/dCirIKCjrFdPrSRkNy9DwEoc48RM2a7D6ERQqxMoFRMNyY6GT
 nS7kxdbRRAfB1mI2EAuRyKzKX0ZxgWz0uvulhmpiwIc51noTnTYm9+I
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: xmzTJC-jg_nwFmb9jtSmLiKCr59WwGgN
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bb9869 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=g53SEPjKJ_zQRiRrflAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfXwKoH8F/fn5dq
 anbof+CiOTlY0/xS8J62O3CNh38vsfTHgDiy48kurPyDhnNWT9ZPP1952+ZVgb+RviQFB9kfEpx
 nV4c++MCVC/msnuJqghLBtsHKFrDDrKUdogWYERmBom03HBjeVWVNfe9jguuP0FPP7hOSVtWuo0
 5y4opIAtnvwWzpm8QBShE3fDgNc6VxhywEPDaXNFcHlETzYOuhG599qZca1nIfm1nzrKsxCJLXc
 0UNJz7xV4l1piBL8AVWJa8WtYAR/nSJOdvp9a4RWVNblfL0+KuY1HnotsLt5fng4RJ+0BEwV8LK
 YsixDOc4EuQVINZhHO4pWfAXhxoc4NS8PlNHkSc2e4e53al8cQbGaaResFwG5DsgC6PFbLry1HV
 7qQCo8aV/pekUHIOj+A2TSUUqTaKuPcpaVaFd1XboNpBZZ3yR6SMsNry0ajj6RZgl+RiU8hrqIp
 7Bt0eXI6NfcCEfGhrGA==
X-Proofpoint-ORIG-GUID: xmzTJC-jg_nwFmb9jtSmLiKCr59WwGgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe-time variant selection to match the SAHARA MHI channel
and associate it with the QDU100 firmware folder. Add an image_id based
firmware lookup fallback for cases where an image does not have an explicit
table entry. This allows required images to be provisioned by the platform
without requiring device specific client drivers or additional registration
mechanisms.

This change only affects devices matched on the SAHARA channel and does not
change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
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
 static const struct sahara_variant sahara_variants[] = {
 	{
 		.match = "AIC100",
@@ -250,6 +280,14 @@ static const struct sahara_variant sahara_variants[] = {
 		.table_size = ARRAY_SIZE(aic200_image_table),
 		.fw_folder = "aic200",
 		.non_streaming = false,
+	},
+	{
+		.match = "SAHARA",
+		.match_is_chan = true,
+		.image_table = qdu100_image_table,
+		.table_size = ARRAY_SIZE(qdu100_image_table),
+		.fw_folder = "qdu100",
+		.non_streaming = false,
 	}
 };
 
@@ -278,8 +316,21 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 	return NULL;
 }
 
+static int sahara_request_fw(struct sahara_context *context, const char *path)
+{
+	int ret;
+
+	ret = firmware_request_nowarn(&context->firmware, path,
+				      &context->mhi_dev->dev);
+	if (ret)
+		dev_dbg(&context->mhi_dev->dev,
+			"Request for file %s failed %d\n", path, ret);
+	return ret;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -292,8 +343,26 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
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
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/image_%u.elf",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = sahara_request_fw(context, fw_path);
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
@@ -301,9 +370,7 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	 * Only the device knows. Suppress error messages that could suggest an
 	 * a problem when we were actually able to continue.
 	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
+	ret = sahara_request_fw(context, context->image_table[image_id]);
 	if (ret) {
 		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);

-- 
2.34.1

