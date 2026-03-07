Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5353235836A
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883746; cv=none; b=KxbreEJxC/DcQ4QMkFp9sI5qCUut+JWN/103yVOTAcjEdGjkz0Yz2olKc3mqZsuRDYz6Y6Qg4chOVGt+n91dS6c7ReoAoUAP6yzCJISs4eWySt0tIOuhJR4xB+j29MXCA3d10UNCJv0JxJ3mQwZtEMgF5F6445gvRgHFAoqBSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883746; c=relaxed/simple;
	bh=McPnRZC5WUBs06Eu6S+05ajVf/2AASOXcpXG+shgcL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OERZzNbUR0yjsokjDPWxZyzZJoq1JZobHLsuql50JL6ef7q2jqOZbw3tzXuIBP+6AtXSEyjd371R1aPGEWhLcnVw/0ekYuxdhO5L4oFhAQ06ub5eimY40t4PE2RO55PmojtZk1M8DQaZQyVToSR6MsGbFsGi5joFIhWMfMh0rk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5xH9dh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApLUXsaJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5xH9dh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApLUXsaJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6274ld2T1249597
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=; b=D5xH9dh762LhVitI
	i83guZKqD15/hYO5iRREcmno9jDXEswiErwKSxmn+Ozzp9tu0YGwNhMwN/HgNS+R
	cNHsenMNULEOgzUurieZ1+EDPTLs1pvTTHwKV4i/diV3sdQ3H8qjyTEorsf+Cul9
	cYydzxd1Bkzz8KNd1htSVEpBTp3y8xArLNTTRaDHSk8ybNHLjL0eu7UrajEFIi8v
	0VPTZ8g5kTEtbXPU1T4HvDfihDLUtzkjJaHVguwAOQOI9ATEgLx/p4BAH2Yyc0cv
	PzPmlm+oYXFABJuPyWs6Ebh6gkd6XttAItuPkowZNstWTzXJo1wrdJHu4NcMZ/+X
	t0gaHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda98j19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:42:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae669a8ff1so214389285ad.3
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883744; x=1773488544; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=;
        b=ApLUXsaJ8LJfD8wNl/OFWo2MDSPVda9ZA2e64vhRq0yHY8NCv3XCeQ4PUHGZaY21WO
         fzecGpmrbPxeGkYE8DSKnF5TNfwzT8sEx2xaLdUtNc3e+00QwS81hstCVntqpno3oa9Z
         05RXYQDrAgZexM6wOGkLqz2KoaZKqaADewZtrE2/XmzyzpSORVL9Qc4jgw3qoLVsa0dz
         KJHZ4oi5AXXy0H+UTiRLE3Njm2a7xPtEoo+vLM3ig92duz04y4HcIOM3YhyyMuiLtWvh
         345mEiA3+YU+9vWndTJ/WFn3PKzkcWybbaBOjbfrBNqgCVcoZQUlpugsNxyuhzm/fdeK
         R2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883744; x=1773488544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=;
        b=eTTM6vvwmt+FkFdOyQE58M5xrUNHJleCOOKl2QSbtS3LEMWJhHppmxSsi2RNRsOw8L
         vigFI910IcMaj+2kJxQCV2oQnXa7KgHU9eNoGXu1JpZfmuLZY9sGETXZFT5niC2iI4dv
         9DS1OYSOgWlxhujzTxl43+jGXPf3+x0bnDLebwoWjIhsT4zEu/E3Oy/7TyFuw4r+1ovN
         ppp4DwikZkt7z33M+K2p9jguXZ8m41WsgAprdHhqOY0dnFlOigX6X9UERTG+wmAhRufn
         iBT2shbgU+YBzfZa9Z0YdXMdi0aKV/7AzQOn/XH7rFg18muq16ViSrQaXUht+IBwc0S5
         p/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuEhWCD/CMMdhP0XlxXDaM1GJNPAsteVJJ4zTuHO6dA1VLs+KmJZ5ND6LGCMKOy16ZQc4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoWFY9mzL/4qIGYnIoTblb8HBGDYz6CPAh6BVlAOxNZpkwMXcs
	+a9fdgK/XGwZnpycyRpXfZ3fp1HxesZ+0pyF88H0OALgf3CAL159T24KMLyGugG1GgmPM/oD7uj
	z5Itx43rNU88ub6KCc2WWZtSeJCSsI0i6P4UUPwi00rSTZK9iKzn0qzyVZOI2fvY=
X-Gm-Gg: ATEYQzyz9s7tvzkc9pVYNuI7vquUjDTxNUKjNNJ2E8NRnk54LYxmxJCPSaTi8O8uShi
	qJZqGNlIBdqxmu8OADcJeF+HwPcKYE1MWXubpQ/5n1znE1vEq8gJYghZvJlEYYQJN87DeR1B3qt
	fIoiFMp5rC7PP2kWlZCCCCUd7PMOvRat9B/TJxBamSkxGQrasyxjgNZjmthpGFbj8BcQmlBBpnp
	SkMrduJglNALVRlfaPVU2GPeOHGRxX4+HphoMnrjq3s3URTgq4rETjBHFJqTONpnGWWBrYsk/p9
	NKSnj1zqeiMzs5ZU317+8qebyzdzRQjvRC7Kl50GQm0/Y2ssOCXVzuGl/aELMAFz1ABK79fJ54c
	zEl1GcnhecWd3gNhwt4r/OixttZ18KZPVoHgegbmymoiTSUnW8BM=
X-Received: by 2002:a17:903:1968:b0:2ae:8062:8362 with SMTP id d9443c01a7336-2ae82266d9fmr51669095ad.0.1772883743682;
        Sat, 07 Mar 2026 03:42:23 -0800 (PST)
X-Received: by 2002:a17:903:1968:b0:2ae:8062:8362 with SMTP id d9443c01a7336-2ae82266d9fmr51668875ad.0.1772883743238;
        Sat, 07 Mar 2026 03:42:23 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:22 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:27 +0530
Subject: [PATCH v2 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-6-29dc748b5e9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3692;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=McPnRZC5WUBs06Eu6S+05ajVf/2AASOXcpXG+shgcL8=;
 b=/todAhtMbh8tFvxjx2w9XFXvnGlfpGJTYVN+29dh4Z3dq17sjAF3Pro6/6WgjiZnJeVmxJVQ6
 LqwCNEkdXMcCqIkt4DUmOEwvVVCLoyVZAnqiZwj2udbkqLxXIQnmFXz
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOSBTYWx0ZWRfX3dJVvijjRwXv
 vPsKhH+tMPNgvAXndPibFgngOUa7K8ps+KvAoKnhApTRFZKNpObarDCOMz1Yw0CtpuCzzQdMETc
 V61yW6krP3VJQj2qf+V4ZL2UZ+DlkTm9pCKZULj0nxZt67t0ATLmK5T7CrgG9z9tk/mOM/lOmTK
 j2VrS5LDdR5XJodqeTM4cbZTAhI6u7A0qCCj9oB3RlZgQl4pMdPtpRIroQZVGaSRBNzMV6K5mYI
 Kt/jP3Tn/Kzk/ylLRb3P6xA3rhBtwWab1bkueAz39p+IbSv8G7Qdy9JmXQ4x1NERii1DjZ4DD+F
 ej3/aWz7eMOysHivWxsiWP6Rx8p4aYwh6RVXI7ExAlCFN3e0a98G9dABSCYGwYkBetsFHC8RS2K
 gWZccdR/dnH2wmT12pWJ9/kikGLshv5M3o1Gcmzp325qWhKvXFDBdRTtK6Di1/ohF8lqjbc1dXP
 zFrUel5DfN9VeHDlVWA==
X-Proofpoint-ORIG-GUID: Bhn5uyGmE0Mz3osW0WaFnXecx2I6Htvn
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ac0f20 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Bhn5uyGmE0Mz3osW0WaFnXecx2I6Htvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070109

Devices may provide device-specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
per-device training data is available.

Extend the firmware loading logic to first attempt loading a per-device
DDR training image using the device serial number. If the serial-specific
image is not present, fallback to the existing default image, preserving
current behavior.

This change enables DDR training data reuse when available while keeping
the existing training flow unchanged for devices without saved data.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 56 ++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 73ae722122a35b77760a4816bc60e6607aa53455..19fb9cb78fbecee047ba27674043c0940e749195 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -61,6 +61,8 @@
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
 
+#define SAHARA_DDR_TRAINING_IMG_ID	34
+
 struct sahara_packet {
 	__le32 cmd;
 	__le32 length;
@@ -319,6 +321,7 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -335,18 +338,47 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return -EINVAL;
 	}
 
-	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
-	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
-	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
-			image_id, context->image_table[image_id], ret);
-		return ret;
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
+		if (ret) {
+			ret = firmware_request_nowarn(&context->firmware,
+						      context->image_table[image_id],
+						      &context->mhi_dev->dev);
+			if (ret) {
+				dev_dbg(&context->mhi_dev->dev,
+					"request for image id %d / file %s failed %d\n",
+					image_id, context->image_table[image_id], ret);
+			}
+			return ret;
+		}
+	} else {
+		/*
+		 * This image might be optional. The device may continue without it.
+		 * Only the device knows. Suppress error messages that could suggest an
+		 * a problem when we were actually able to continue.
+		 */
+		ret = firmware_request_nowarn(&context->firmware,
+					      context->image_table[image_id],
+					      &context->mhi_dev->dev);
+		if (ret) {
+			dev_dbg(&context->mhi_dev->dev,
+				"request for image id %d / file %s failed %d\n",
+				image_id, context->image_table[image_id], ret);
+			return ret;
+		}
 	}
 
 	context->active_image_id = image_id;

-- 
2.34.1

