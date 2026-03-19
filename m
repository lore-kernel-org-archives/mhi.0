Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E0346E6C
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901938; cv=none; b=k0H3wV5trNJZXhgnyNAU6ADrAEuzF5WduOpCCNCzcXNSjb/hR/MemjQq8KjqRWMHltJm4FnjLRtoj6yOaLiTAMN5FPiR4gVYf09VvxIIliwy6lr7C2PWbRkxaMd6WGbU9E8p+73HoHrVeKEBAdir6Udr9h8rOp+mOG3dCeaCfZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901938; c=relaxed/simple;
	bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acdIBXAkib90KM+zxwUzqRRspahUGqPAkcXOp3hzdQQvuukNwPcJb/shHN4L5vvtmVqyWKljp69snd/2XvUXHGL1ZKqcNoLIuiQAXBs9LsW/3O8xbLC5nIt3gOODB3cwzWmxkg5AUrQpY/PcszO0ecH40ftGVbmkX3CuDRZu4LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d92Vgpa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hWuh0qDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d92Vgpa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hWuh0qDw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xml02469978
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=; b=d92Vgpa8NFRAuX3N
	+nVgU9lUwaxEKaSZTk8Ip21p7jgIRnlFt2pj+YV/dKyykHtdo44AtPfZlX56lW9U
	5lqSlEvCYqHloW2Ap+4rvIyGCCm4+zPBWNAFrIyXgCj4MjGZWQ3jLz7Oe8fe/hjw
	EOrAsa1/+1KdJMcPREs7jpW1vHobAUthvsLKwEXYFmpUQ4KIimafgaAIrf1YBace
	lNtth1WqAR20221Qv+DLLHhXVepNYmI+4Bj6cLOkGvzubuLWem/ITj4o0L8nEQmb
	WsvY4/cf1rNx7Uwr7i4AkUoR+knYHPM4/HiXyRTFjle8QrzyMnTyB6VHL3YcqSrU
	8AHjQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53mru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b061bf1a2dso5159985ad.1
        for <mhi@lists.linux.dev>; Wed, 18 Mar 2026 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901933; x=1774506733; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=hWuh0qDwYyY37DMguCjAmmkW/n164ruTCnex2EDG9web4F607DLH6OyGOvtD0kgSa5
         QXX6x7Mr8oV4YiWpdoV8MQ3bd7Fxaugl1GvmCFqPMoqt88+rFqns6I9ndhzApTH+lBd8
         bZ9AllrBcUuD49PztiVruIJdDvd4ZPWDI2rY4e528LybxLw1rAEeUAuWZROrCUgxP7C4
         R24DEBUKuXQZRRgzSw47GvzblyCqpstgUJ/JhnJgEp4wHqHmGJZONyyMMgFlDL+Nqi8w
         DLux1Rym+hFLmPP95s9LwCd07P50hVXfepmrf/fAvPvRwKme1oMzKJhSlE6lI1jZqnBT
         gLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901933; x=1774506733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWRwk+1b+0EakwPo+UxNIgaxtaiGjN34TJYH+DHiZ08=;
        b=dzItcA5xnI95B64d1DBysMxozlRYLBS62r+MC9kQEl/O9glycgB++eGTBaJ1bQvfDV
         q1/I0ZfsHZu//JPiEKiBRLiEDknTB5w3ehjEnnR1JFTk0LsugNaM0MpyTQPWOgJclrXb
         cx4+MHGtyEaypqMmEb9uYiDknxN1j6CDBgN1SC6Xx2aw7/vqEOBwp/a014aY8OyyhP0B
         OvQZmnN6uyMl9Jz5Jru5WXBq8+YsYiu4El8EGZVqIBgaKDJdexM1PC2BX6X1Zgwnzzx+
         W7OxVFeQUk0uamzgnJZoQ2qvn3HMcVSC/mfvAOv0SS8/laqQFuCj+okkNZrKQrT0K6Ap
         VneA==
X-Forwarded-Encrypted: i=1; AJvYcCV6AqCnWKI7Vh8s/anmQ1h/mmtdAdQSP8KvEHH4Mblq8AfwR2dyZywE7Vcz98I4OcgeT8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWmmEi6m9raXIEWFXCntB7QsbCPHzMnkhlvBJEb39sVgpV9TMj
	+n9qIVuQWnWCpf819vanvanqNRm3YYdW7rDgllu8jqfyKiAt8IXL8bJKok8nhqoKUdDA8IDpxOm
	SDGBTfrCxiYbBOsLUYjW7rlWaYejX5ZP6/UALUYepwQ3oj6cfiqkS0rM=
X-Gm-Gg: ATEYQzwBDiQxO+S7hF0koq4nR6DzznVtVRza5KYpabcMxYhbW/EKxjarKMMjcLSdbnO
	XGKBUj5p7QXmkUNd+ZCew+sJ2uUBNeDPXyvvp4aiNQSxoTKd7gUQ6slw1qJVWotEryHcrL3nMxI
	Wr2oNAYrBKIwDWY7vsjE+xjAv/0hnv+ujybG7DRSLwKSA5K3acDZMjIuUbBjL5lsJZ93OvFe/dL
	grz2i7nMZPnNvBQVD4EPAWN51AlRwsm/u+x4gtQ6cOUy+Kb9O6Wdv5J5wY/hTbIiZGOfMXN5HnT
	/t6KGYzhOrDH1RBM4XPZ7eVjSoAkhcC5rcqoJChpC22lRA+IM1VATaZeHSefrgD/0TJwyD8OAjl
	fP6oWrEsIUtM8Lfq9FcMg3Z2EGgcrdL22Q9nDe8MMVd2HD6ndnDc=
X-Received: by 2002:a17:903:1a67:b0:2b0:48ca:a641 with SMTP id d9443c01a7336-2b06e3c3abdmr57658485ad.25.1773901933440;
        Wed, 18 Mar 2026 23:32:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:48ca:a641 with SMTP id d9443c01a7336-2b06e3c3abdmr57658205ad.25.1773901932969;
        Wed, 18 Mar 2026 23:32:12 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:12 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:46 +0530
Subject: [PATCH v4 6/9] bus: mhi: Load DDR training data using per-device
 serial number
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-6-47ad79308762@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3154;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ap7TaXFPFmY7vxQioEQxXOj5gqr4VqCldx5s0gGK/Jw=;
 b=P/EiG/Ox8r4P5G4oR1MFzhur+NXMa2Gi7t1dDjAqXLD1FDiqn++C0jyKd+T01VGQHN0sFZPMr
 aMqQNJJLI4PDL60h+ifxRx6Hyyb0ReTpHexQOU9CjbMdJbAk1/mz+bD
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX9FBitAXjk8ZG
 qPUHi6zRQGyu7tKzsYuoMlFXOGqjcOsd24nZUWxNnANsKyCODbulhUgSOJS2WyClZU/8vfwShUY
 IvdnnSlYKo3m+/DcLdgwWlMXMGxuNFvF17ybYlNylC/glSqd7vKWoAz3oYoc30GxzVpVhm+BE9s
 KDm3r+nKcGwdkDyAYy40p18Q7/S0LhatJMNjlGHL30QJoaRPUGq5YFVdSRMC9WV4W0jlRviRiVx
 vnWd6IR+4Y5fJ4nPAorQE6Q8OD+pT/xPYXf8EQM0LemdP04MPYcMJjQ7fINUtx3jVlvd79eCk/G
 CKBCyaSAkhYx+x9IfyOL+3/4eL/kgBgXgYFFQTn4lf431FRwQpD8KYtS2XRFoUxTTbemQbW9KlO
 eOoj2+KWH+eHQh1YzBtuuiDLKld2GfB164mjdK5yUO3dp3B6Vll2j5ajnwjSqJFEiKrBmSJpypb
 D4frLmnwLDl5Iv8hoTw==
X-Proofpoint-ORIG-GUID: vPuDx4cu4dt6yS2bzP6txfgpHuNVOpaM
X-Proofpoint-GUID: vPuDx4cu4dt6yS2bzP6txfgpHuNVOpaM
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb986e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

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

