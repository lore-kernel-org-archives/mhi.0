Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4603E8C5A
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127360; cv=none; b=hfh2mN1L5Sxb+NZ4LfZnkJ8kT4jApKC70Y4uZyLB2lY9bC7ESBnDPeJD1u57xt2r23wI0D5axhRNiWvk2lIdjMEGZlp4ijNzBJ7sNnSoxXujrUudXvAJLw77C6E1J2GSXu/AEAKPVOJKR3vKsZL5nWhhnMZm7mJ45H+YutgCsmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127360; c=relaxed/simple;
	bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJHH2Y6u3l9TVfTgwWzyFNIw0qCogiMZ1K9l560A/xU4hh9Wh3gSGf07GAwJ3m4yQIOSe8+7iZT+PhV/hNIhSwDSYvX1utjuIeH9AMvXQVzHVfkNjxDC1dyEb81yE2U/0HRHsaVe1r39qVg9z+05xQbpKtlkmXUUmKfzMnY1Yuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiqGaWm4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKrn4L6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiqGaWm4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKrn4L6w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EInj2362835
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=; b=hiqGaWm4wM/zo3m5
	4B8q15B09kHMejvtUdfuy/Z/8rTnEEbOVRPm3wXG8sFkfoyywcMrkcDXsrCCYUTd
	srUqqhQr2B/OrjxtmsRaIFuKM489ITCnlsx9ekFFTAxcdmfvf3Pio+B/iSDZXk+K
	CK94vRV/HLxIB/4wWU207FlyqJ+q9q3g0B3yiNWXpWOrBQTTcu7u7kOpx9sAPK2p
	bdzR6/EuD16zZ0pP14CsrnVnoROMYZD7/DUPVS+C+nQjpYZzf48GLLuOj5UVCQE1
	TgVfISsfx6H7nSUPH1W+Qx0gp6/iAvgDRMQgSxHtKzTtJ/PwbRIC3SfbAXVi/ytT
	DnTTdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032b22v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso72558208a91.1
        for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 00:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127357; x=1773732157; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=LKrn4L6wJYhgzHyZNR3og9YArjrA4tTn7gp5jG/1Nv9nl23gChVThn1o86wU2EX4+D
         5bjRp3/FUocSrRJblCKf6cmpyoNC47huAS+wOOGfjP/N48r4gkQsrdyxLlSb3vy+A+fk
         50yicN6keAihXI6DI6ZEfB6aA6ox8zgPUKbxxPtvx7ikexXvSxfvxf+TxxsovRw2SxB1
         Y8XVON9Cv0UGKH6oVEQ7Hwh5BIm4GRvaSNU1s3HQeabSCKWo12H6IILCvy5uz0+WsY27
         20A0gc7KmuqbuZjhgrBYn5d9Psu/NxOUDBaWzo3Wmi3+Ssdi3Liiy57R710mC5+IHnoS
         u23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127357; x=1773732157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=dgAYvY7NRQ77vz9H+XcpnTOjc1jZLl1YEQaJyIskXofDetehw2u2jMPCIyo+SJbC/S
         WjgunpRbLdoR+hy7UvKAhXqD5Tw59+m4NOiWBhysIz1sUNUrVuDOYe6vfXHjVQmPzZ34
         17v4Pk6jUDTObGS9i3J4Yv9L2MCLlfh3BjAR0cc0w14XJvPM/uC4ju0mRYoTgyqDUO/m
         GyynfF5kVGVmWDMkotia8ekP8+JBbR68MWvc81P02Ga5WCJeOJ8/grWmupE4QWAhETHL
         S7qGWcEsqjd1uERNHRA46c0XrHP7W1EKfzbAgJl7JM9EDdDOSjg3RhpA6+L89VJUit0W
         Abhw==
X-Forwarded-Encrypted: i=1; AJvYcCW4Qi09UqRy3DS+VRgSyGA+fzHk5FeKmTiYkzoozm2Fy3nC41iaF3rYaLkuOVuJgMHkHzs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvKfWcGWDeN9JxONLCtFkYifa/yMJWJ8xLD5Z2Y66AU30MF7fG
	UIN7sox4qizc3RoHmhOo67bqeZG2TbLc6b2KoMmY+f34jjAyDgHZiqY0qmF8uO/GVrHWmSTApok
	o2lVK7qbxoLzS5t7ukZC4DsSOPbeUbauqFNv8RHZ2Ypao9nN3A1Z9sq4=
X-Gm-Gg: ATEYQzwenKMzUn93UoiyGiBnphBrxUrEJnV095L4VY5+FZraysma4qI3WTVoh1mLoqz
	20BuzmIFrLh0kKGXmYN/eoRdGEKx7CGHxZO3YGga9nmVx8/2WdXfc+uVrKcWn7l/YCz4XOWe5fX
	/fQS7333L1xqjRtzXrlRNupDd3KHdeHpjzewHkgVk5HLeQwHBk7MXYZS0t6rUWbl5JNDdajhlNt
	vMwMpam+xUHmuPRdDsEwMv+1zE1/Zia/Xf8cQrCLnzYcSKMe5FidZDJQRFxTF+K9r42lizec4DL
	Zt/qGGDMTR5uVi7d4YUWEbjouul2iv6qu9LXl3H0I5wGkLRZyiFhpGnIY6GXxz+GYseWoQ0kTMg
	Wmn7YnMhyzzJgpDoFQmud/iDmZ3sgv7qlG6Qg7++tDq/r+TeK5hc=
X-Received: by 2002:a17:903:3510:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae823679c9mr142880655ad.8.1773127357228;
        Tue, 10 Mar 2026 00:22:37 -0700 (PDT)
X-Received: by 2002:a17:903:3510:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2ae823679c9mr142880315ad.8.1773127356698;
        Tue, 10 Mar 2026 00:22:36 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:36 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:03 +0530
Subject: [PATCH v3 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-6-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=3154;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
 b=jGY5fnLsLQTR3pxOzCMF05KRfsJnnBISbNlEOkTYIaDuFNBt328cRi62kblnpXDbp/jYHl6h3
 Qjm9GgWdCf6DGz76s0BGNvrnj7HqC45wHyAkcYNbIM5RGCOe+hQ0tPX
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfXwbiUGHmRmsy+
 PFpowu5MWQtIkCtE+1eMAnmrKWEAYttyuNdw/6aZtejKwcIAAT70/R62gLiAGUvjYm48wsXH7mz
 loNmJWZC2M8P4hl6xYbEP/8sQIbxSV4hP624gYiVyCHpH+tJ3W16G72HydH1xxg8Axy1eYYANbQ
 mZvDZqRRXF22e/bmPTzBWj9C0GQ8+LYwNyeqDWTBt7Y7Syr17vuz4sNImvdTXrzsSb+EU1UNIuX
 09vn9tN2lamqbD86u+pT2RKeszUtg8N48N/drGMr4dvDmEH2rguFk7lOyTGNOgCLCy5KVKcGejk
 wbSpVaUYgLZQVhUwv+zAw8kgFqLdW7DG2C3C+HfvQRIKToAfM8LjSUA7H0XLT/JevT7zJdYUuiF
 CgIP9KJZKbr1gEtZkMz7t7IQU3guL9/A3qxaGC+FJ0EqGtT3jufWKERwoE0BXWGtuVVsqZfSc9F
 5OEiLrw1EElJ8mG7Mug==
X-Proofpoint-ORIG-GUID: b4XaVHmq1kWkeNJ30apLi-EY7PrRNq_H
X-Proofpoint-GUID: b4XaVHmq1kWkeNJ30apLi-EY7PrRNq_H
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afc6bd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

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
 drivers/bus/mhi/sahara/sahara.c | 47 ++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 4ea14c57774f51a778289d7409372a6ab21fea60..0a0f578aaa47ab2c4ca0765666b392fb9936ddd5 100644
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
@@ -365,16 +367,41 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
-	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
-	 */
-	ret = sahara_request_fw(context, context->image_table[image_id]);
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
+		ret = sahara_request_fw(context, fw_path);
+		kfree(fw_path);
+
+		if (ret) {
+			ret = sahara_request_fw(context, context->image_table[image_id]);
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
+		ret = sahara_request_fw(context, context->image_table[image_id]);
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

