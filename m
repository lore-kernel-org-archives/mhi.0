Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAFA3DEAC4
	for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348627; cv=none; b=SGH4y+ppKk+9RwUUGYgzjtZGLNkq57ALitaMAk+PmQGAFBcqqg7jNQv7SUYY+zpFulGL0IErIaVoKTkUMSVzajxVNiLwchy7/3UvrsIex+rIxNZFpTvc+iI2KH0dkDbOGHpLWPcGys2kvaE70daSyUpiY/7pam/tXDQih6A8xgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348627; c=relaxed/simple;
	bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFYMrUrg3FbHqnlS8hXgCLN0PznYDM6qEhzB6MJXaUitx7ti4BtXcv8YWXagqSLKH4CCYyqCvtIGeAWnmC5S8r5u2Txvp5G+TBEfqC7f2Qmwua14zFAlYEZjg5sES+gubVnj6LSL/XWIEXMDXIAmxz2wTSgGGnbsboSYn0knBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXJghhS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF45bruc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXJghhS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF45bruc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xiU94124964
	for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 14:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=; b=NXJghhS5Y94uTiXh
	vlaoOzTtkgnGrV/O/geMhThLlUVMw8E1bxPcKsZvAgXcoJPChVCz3IMqMo0wbfE0
	EySpjaAInNHKjpobrxamxOBMsbIdPCRSMh9oBk+C9LG0vhofKInNpjITY+Qz1Bay
	FreF+ohwj+wyWwe407n7DgHPNivediP6JqFGifIDQKMkeSBXKSqQF9a2nTgBbuGt
	IcqjyXefR6/DkUFclSaMwi963/nxTlVxtzidNvIrc6xVBozHmQ15fbmh6guJaUs1
	aIBR/WSgiF7tWlYcfW88XNVmR3grySvdTGisYgZmZTcydd71Lu1yVf9FzgX8GAdM
	kUtt6A==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf90vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 14:10:24 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-649deef077eso13246142d50.1
        for <mhi@lists.linux.dev>; Thu, 16 Apr 2026 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348624; x=1776953424; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=WF45bruceqb3cvmp7L6b/RBwJC6tZzTlmXGoWafXANgEAqDzfzTGk9CPrC0Zx84zPa
         Mk8ryNIZxKzmteYVRKCcduacMlzjmI4ELRsfH2oqNhOvc0jHfgfzwEtQ+1mMQEM+e9wU
         I2KGpRGZpFwbj4EYY3cvIELECAUnF7EaBFlyJetHxrRC2p5+JX+V0/vzlAVlEnPfkLk8
         UeMsr04QB3Q3N1xDbYi9TQmLIeTpx55gNkasIvQopsXSc+ttfJn4VS/KD8Q1MjvwIKOW
         2pGu+QLPXSLrs3yUkhZvnBzA+QeSkbChIDUqBKXBt0UIuOWTbVMtwMv7/w7vuEGZiYSx
         ZJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348624; x=1776953424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=FvmtLTSW3gujEuOL8pPj/fFLQguP7r/PqvIBXs9yoc9lU7nDYtCl3Shg7hDnaEiQHN
         HWu/qYjZF59kXAYgfpeA39R5rJ/vVCfM8pgibNB7q0r7ay08lv/o8hWMc3HRADX9n07T
         M02guBGjT/cQ4Lp6bT6s4YcnttMh+qkS3KH/0h2zm+ow6tfj/bbX4U/nytPLCfLbzlcZ
         EGOpwsFbAnk3irKtCYvN2mKRJKl8P8t2rWBRUDU3TqmVEn6qt4t+D3XjDYR8atnl4Sb5
         Wk6xKAT5lFdgqqCftera0yhW7DtCaxgzfjP9aIWS/H7hqNiK5Ma+Jsz3WiwgexkwJiDt
         CIig==
X-Forwarded-Encrypted: i=1; AFNElJ9IT1ETICb9spljwYiHXFGgs0xih+6nLV2Q3icb7xKH2hdRWHPagI8RH8b+0sctIkO8BHg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVJ4XjAeuzyZJDWIWNEBTJ+m9vLAKpHUPf8M+7MFEYPCXCLzAH
	gdG2J+Ll8M/PSoNLv4ZUQ0Jx+BSEF+PPZo8CYgcQunfAar4IgR5O1PxM7JHOGD2HwAVJLs5t7DK
	LPAZ5RUtVZZbQi5meziQNr0bBpkDzKXRrHgoTScZ04R43Dm3qVyPs2Ig=
X-Gm-Gg: AeBDiet52xWD1BuHbshHj93H8XAPeOUXXQEVmlXGy+powhz41z0cJ/DC5GAtWcTeZE6
	Jj39OffW2rhl1CDsljBB4HUR0xa1dPVqDvu62EF9eQvKCQw8+r4f19RHA3xDAGXA/vBZ4yWUVQK
	2y5k1L6yqa4lwj7AGVp6MIL9lvt510YE+JUXzQWn1YfUDcV1c+x8z3aQ6inQ1h97lgIQTTO7RJu
	gICowabEKv88fyd19k4RAfXLoD/YorWLbuVVJv/YoHtFDCh81QdvzOj8k2OsSSQsMWw/vA6ESEP
	Hxcxp+eaQO6f25DG2pvIxhjkH6f3OWnDNv0HU6U5LU9w9HgWvZqUJ0WKUIYX93D24lG7637AVeA
	GobsOuVJ3ddoAU4KYle3I/gG7rKUGJRFfD55hk1xD0Fn7UXIqyc4=
X-Received: by 2002:a53:b6ce:0:b0:650:7846:f326 with SMTP id 956f58d0204a3-65198bb5341mr17653928d50.51.1776348623056;
        Thu, 16 Apr 2026 07:10:23 -0700 (PDT)
X-Received: by 2002:a53:b6ce:0:b0:650:7846:f326 with SMTP id 956f58d0204a3-65198bb5341mr17653845d50.51.1776348621719;
        Thu, 16 Apr 2026 07:10:21 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:21 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:46 +0530
Subject: [PATCH v5 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-5-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=2770;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
 b=WWlNVMISE32YzOacAObQV7dNIdXlO1BGZ6LObollUK2JIrhEPezGqcUbkpsBTUSpn3s2vLrDp
 UNhQYOZM7PhB+Q1nzHDwRgrwZHLL44tf02jQlSCFTctKmH9zRJSHFeq
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: 16yUhRLSzH_S-I248x9ltJKd7xCfvxfe
X-Proofpoint-ORIG-GUID: 16yUhRLSzH_S-I248x9ltJKd7xCfvxfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNSBTYWx0ZWRfXwC8QNQMcKSW6
 NXgmH7x8OZAs+WVWOR2xf5JZ7E27qxTD3IpBdIdNywucBUu7jdffEgUmq4VYcp2zgi5jsQQ70DA
 nTXxOdAkBL/5rKs46RIuvXgVegxDC3YeJNmNHXm9BtlL+oSmfIzg6vXT52bY7TJOAt7t7dF57pl
 CKppBQdEt2O6HvgUqrwZk3hMka+c9FE01ZaQiNNyFzp5nFpWiyU5XE6Yc+LzyM6HOoYw+Y+9KPs
 mR0pDtxO4Nn7g0RYGz9YmCulsNDXU7xfKu50q0WrbNhDmDp+kNjM+8pWW5/99+K5CYusL6IUuCG
 srGTyFD56AvtVVb9QU+ssVwGdgDtl+eQVd+0lbFBNUlHgPhz5YixP3Wt0KJfnWzSz5AFYR5LF9t
 0PbWLaunktacjEbx29sdNpT2W+eag6w20INxuDvXpeaVbsK/5d1GdszPSPDvgvAWmZ4PvhKEVT2
 e/l6M1k2mt5Brkb1YOQ==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0edd0 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160135

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -59,6 +59,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an
@@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 				      context->image_table[image_id],
 				      &context->mhi_dev->dev);
 	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
+		dev_dbg(&context->mhi_dev->dev,
+			"request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);
 		return ret;
 	}

-- 
2.34.1

