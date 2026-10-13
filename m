Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805133C1985
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881173; cv=none; b=Jn3yATReSsjGvLbSiybed9UG+xPp47BUyznvRwtNgfdE0aCbtJtSacjt9jI2uXUpM/fp3Sp9Aa7A8w91vaHlZ3FCD0bWUsPYdnLhoMT7wkiKrWO4ejZUvOf29J/nPQcPqqkCNwEheMiHarE6sWEPuj+rsBKD3vn/5eC7DkGglMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881173; c=relaxed/simple;
	bh=2+l0SnJ6xQbWmIt7CHKhLtT8Hjx827L4qCZBd+DMmbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fkj+BIVNsawQeFalyh6Mr+0be3cXltNrPyDuZ1+/CNGn75kG2U/GTKItLgJwaPfZw6bhKZ2clPNtfAg1eHFOy53wVw67+z37XKf7vJDmXLz/ac9rQjs6HVHoFJ/zrUhMGxy8DAEEBeKrz7QWZhPNnH99jsiK685sSf8KmNllmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhE/ct0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZR5Eb5Yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhE/ct0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZR5Eb5Yq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8ODUG3054788
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=; b=KhE/ct0opXgywKQF
	zc9DGwJVrVbYEoKdqAp29DikI3MOBwcyyKUiIoISqPSefq/Ju9sEMHFz7mKSRhTY
	S/ewT2kuej3w6UF+EsDs857gctQ3OjyUGwYvFWV3P5rNKJAdzcE5jF53piODgLMG
	zmWNZBpkDEL6CTjtKO17ZLy6P+ICwCOh4Y6BeaQyhmjT2/1RbHa4BnuFmXsv2srE
	UDTXVapAX6i9DRHLEceyman4Epgmm+gCil7kkxs7IhmV1xmJJJC8MbhQDxxYfBU4
	cabnedPnHFcG1qWFYv2ZpW2XLlkXlstppT2Vq4zL8H3I/olUhTScccYBH4wBQDvq
	WA40bA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeubhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:46:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-898fe16133eso2090932b3a.0
        for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881170; x=1792485970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=;
        b=ZR5Eb5YqbIHzHSlEW3cTXoj/UGAwWTYvQke6lkp91lhLmB+Ab/lHHy1qNiFmumhcot
         HmKQkUy9Qy9/RFV4v6lCVdwxQoEI4bniz5O21IfD4scGp8KZELSSjgrzzyIIrV2RBAcT
         cq28TQvze1xdoYfR+mMBxKrdHMvb79moccF7fRzRE9GRk5MFCvfE4Nu6PcmrOBAF1DF1
         Wyk1OV7UoV/qwWlTNHbGAUob0dwJqKg+P4lVEzaTE4MdnyjRcSRwTd1y2ctb3gh2tjIk
         6iGgtHBvTZ9fbqkGAHKJGO/CcoNSr+hL9okRFVkMVjEOzixEpz2BSQn5ypDT6ATXpHJG
         IivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881170; x=1792485970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=;
        b=gt/OXDZldvuQuCJNte9cuPuRQEvxMkHOLwk45doWUnXeOrzlHiO2CwlGoGqHF6Q6fo
         ArDcy8bi+BSkFwjZUjTyP+G1fjISSsRKkp65I81tTISYTcC2m88NNUFVCAkzHLXrtHpQ
         o8vmGldS50WQMSy3O0eZ3lhgGAAyvY11/wKuyEq2rRIKZuknLbXdSGKVsRsSmIg9Ojks
         SvlRUMGeY180/P9NXRL0ajRxLUNPWd9We5ivY2+4w7tFaS/IEUZF+r6/1kp3LjvXSugA
         okcT0jjbp7CThl2n5MHB6VBCS9g4OcuNbzd2/J9UQLhw9qUyLAE5REuY6RynlfeizO81
         Bz5w==
X-Forwarded-Encrypted: i=1; AKwUvBxMSZJPM0WqfuikU4/5tFsxMhAhIUbchV24GUveejGsuqGiB2Fb0rXTREnEWjI2cTnAS94=@lists.linux.dev
X-Gm-Message-State: AFq9FYJzLs1BDNT6RmiECCnG2GPr1SpXBvjudPcsXrIm5Rt24ToHP0o9
	Cv2mhoGPXpzogRNeuAZAfv0cjqOrP6lOxurKuOqu2uz+qF7teoTb65W4d8/yqhL4HLoAFl/DM99
	u07OgfDij+46XsdfjAFNxNfXM6lwJAmDl56X2ia7MM2h8mJK6pgbqhrs=
X-Gm-Gg: AYBFou0Vv+XtHognBoY01PUgGKiWiwNtD2/ZKClb6IF1BriTD9ZQlzhJS9KoLedtne+
	Rm84Z2rwPHQu5xVPkf6JPkrACJhiIezfJlhDRGVKVEVJi6Gzr0yIeh88CI79fFHbMURCQCVlRiq
	z9Wyagv5OuumTWbXbCpmomQuN943ujJLn2TxHyGO82FHxH+jy/l3UXYZkMxARhsItEsfhjLCJJR
	oVfCe9AIwsyOyYEZxwezq5kMQIlA94hyeCmBalzyRpnrVcPrwJ/HX6vIkQY817PDrWH0omaK2sI
	BGSG4WowumBZBcc3vdxRDhS+27qVBo5PIecDVlbnwHxAYPJLxa8lLBy8l3FWZbSCKpjqHPO0wiN
	dIzFy0skqMizlIy5CtF68XqbnDhxI
X-Received: by 2002:a05:6a21:a4c9:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3e16c052430mr9179248637.53.1791881170327;
        Tue, 13 Oct 2026 01:46:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:a4c9:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3e16c052430mr9179215637.53.1791881169627;
        Tue, 13 Oct 2026 01:46:09 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:46:07 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:36 +0530
Subject: [PATCH v9 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-5-dc9f24357c4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=2+l0SnJ6xQbWmIt7CHKhLtT8Hjx827L4qCZBd+DMmbE=;
 b=HnyiFaueBTA9ATyK3dZXMfV2qee62iFqJG+G8cD7P1CuCfQJ+ClZ4AvpSZ0L1UuLOmrq5ceAB
 ADA5An6WtpHC0J7SJF1weIXvXe7vLzFi7gTZcnmhKd1n/BXCyjtx803
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: vJj5e0jC0WQxBFRM7vbXL2REm850v7L5
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdefd3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX8uN8/lS9651t
 2GNpMuoA45t3zEo1fGCCN+WA03oKR2m7BOm3iSsvi7A9ZZO5fOEiZZ/D8Wa40PF9H96DS/gnUua
 aXg2JEqNjyRq5RJA6aNt8lbMwTruZZI=
X-Proofpoint-ORIG-GUID: vJj5e0jC0WQxBFRM7vbXL2REm850v7L5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX6ftqxHuqQWJM
 /7F4Mf8CSDCDK1klL4mL/XLqM6BkASpRHwxdum6/yErj8vqIO59/tblTWH5GkCBQxcqzSzP5KAX
 pATJxZmpnKmXy2DiGnd3oocG1cviDOSrBX3eirg/DUNB76cOtYQXtNZJS5RPr717PnQSu57MnKv
 SdAW/X9xoVUxPz4mje4p2hfzLv7gyeAoOWWqVp9ffCQVjw2fwUI14g1oNyep80Xf+PP6i8sitx/
 WsfEuEsvCwlsrukJyIgYBhMmY4Xtg48T3vf5H1m2tAItU03PQ+nA2znWjXuyam2WX7YUlAXL6HP
 HD6Y5kDYX6dPHys7/iNUP/wFTg7IP7TdYYvhRyLJf4wn8rUHk4fajglUs2GSucJ9fKjSvM6D1B9
 Sh3teF9tiLP3CQQraqWo92BVEiSt9qfTdKPkJ4RvW8LpSWtq3gX2fI6K4Oe9sTxXf4HXbtDaMFX
 85VzYwZbfAx8CaeAt1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130034

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
 drivers/bus/mhi/host/clients/sahara/sahara.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index a4b3ef197b303cce5a36cbeda272119f0430e619..62b9c72e826801a77a321991f9bb91af37e0cc8c 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -58,6 +58,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -225,6 +226,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
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

-- 
2.34.1

