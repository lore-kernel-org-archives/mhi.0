Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92935AC0C
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440661; cv=none; b=tdA2EvT7r4LHHp7vLoCt+ja6pay0O+waFRo+FhMRdOfaZym/VjfIQ0MFLk6RID64GpD19sUHRS0DqYGSPs5bvfx+VRtTOXwIazJIbII3jTorWSpp9jvoz3DrQ5UTUKfQb/TTrZQpkoeVt20xykl1D1yVdGgYsyvOzsBW/0BbhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440661; c=relaxed/simple;
	bh=ZkA86Go2WmwsxeA79B2BPHvYldgOMas+7hnEDf9OKdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDBTAg+LC27p2L+Y+IcYFwRmrovyWhiAex7wO//xm0AsKlFrjedODi2fTM09R+4LRV2cnf5xrnqHm9CQVkqWdlNd4mTWVYyFuOx5DLvUDwTxx6EjiEU998YXv7gYf4keU9rq1+hJdCn5wlwmssmmrpMkIsAtRc7KrYhQWd5psAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFmNdFpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efEnKSeX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFmNdFpO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efEnKSeX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984CKIh1435328
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=; b=TFmNdFpOlG6NHlIp
	ysObBgGGLPPajn+bvzRVehKaxBQR+MqGbnXHIwO80l9sznaCsHTTxnr67Um5cruq
	6Ak60HUHN2YY8cPW4VydPR5c8Y+elQTNoklcIReDUvjI1YvdvrW3OMvTPtUfRij3
	0hN9WZrezjRdiGQuqO/Djk37SFsmiiU1oAE28/O5GwmNbUshM92gp1hmYDA9QWXw
	kxzHyNOX/TnywHGk4RfPjYYkncHlCKOlyvrX+9Rd3LYs3M0d5qc3lUHOS4A60D/c
	tR4uoBtujR1aRD/3K2X8Q6rY6XKzhh6WeB5b+lSJLyPOYbrAPfr6IbPCpnjMFWAA
	59VVRA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hhqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:24:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so1373613a91.1
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440658; x=1792045458; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=;
        b=efEnKSeXYWuS2ZGtJ1O04FJSHX8oKaSEgGDUxACz45H2A4Aeo6rFSrbWvb9m1ATQjV
         dGUpOZ6dsGvh6rJhskThP/rMuHM2QTzHAFZlI/aE9y/mYBu1jnJqAHeaeMF5i+pRGXxX
         GjKBdn/raCAQLCqMCnBfs422ulQRF6TM6f3Ep9wNyKxCaut5LMBBOPj5R4y0HvJqPLMQ
         Gw2cvzKZ9davvRIMYWBv8CaP5/OEB417nIElZk2m07WfwcicPP3mmDuZFMSDRu/wTD9j
         pSX+0M/o7FwLp6lDexfOAATVYS32PBhqhF6J6QqsYjBnspRR4OC03lACTf8q6plW04Oc
         uiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440658; x=1792045458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=;
        b=b7VgPbX00IlcD+PFpaAb+HhWdmf/F93I4DyqAVypwK5lB0fPDwITXA79NENx4jFy+D
         Me8NUVOBdQD5WhLzIuJoR/nNDFdk7cH5hzdygenf6wXhtz+34krNV+EI6IgRn/UJJevY
         q957DVLoifglbQLGHr55fgmDlC5lc/uPliK18dJDqZJ0Zt/W+ck7xz1gz7JrytT0vpXR
         KpmYH9+z0WdWkP6C0lbnsOW9PTQ3J0O3JOlgbk8yJXT7V9po6BQFVYromzz2wDDfSiU2
         vtvMhkpG4n0iI+c8+rQxOf170rChwWnNio3RGid2+D7cR9l7wmQ9XUUXgMyy8huoXMJ8
         b1WA==
X-Forwarded-Encrypted: i=1; AKwUvBwV3SDSZMh2OW6jeJV9Gi0PdVshUuFdJc8V0JIpCtkL1Hv2qMpFQV6RzWCu6C22Sp38f+Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYI0gdMCYDV151ZnpUaiu2ZUn8mJIOd02ZEBO3g7SWLvLUNY0RES
	SYsGfSm3IvB9EdtAMBMgNwM3poC1vXb483XXrHZT2yeuIY21/O43G7GX73Cw7E1KIkydNYct4Vk
	5aEBIvxeO5LwkY98fF2UZwbjM/ItfglMfT/R0TZnTViyjEZkU7NRy+ms=
X-Gm-Gg: AYBFou1XjwBao0vJcFbkXNuE1wOPtt+TUP4pka5aRXmxZJEQJIuUhB32k6JupOSt27t
	UKW3y7HM72XPkGhJqP8uMyZhvyxc7cIS8I61SetyF3woW22fx+ZPHnSXIBAXyLN2p11P9ALbLFT
	z4Cspa+fqRULwckODq2VZJqs5D6KCoWHTpiL0HLcjmHnrEp8DlnVQJIuPtFhRUHsXb572r4FiId
	xIFfZtBM29c9HqvhJOaVRZaN86G4oQhac1l21J4o6fApcfIuNU+K7oV9vy88bue3+it04UzNczV
	pEWeJpt307cecHtpuPiAEQZA+ohweOp+0vkApzmmIO2licv+yp0y9qB1+fJSO7msh4gaANfySVq
	1mQVPHtKJyECFIVqsaEZUx1yGYzSn
X-Received: by 2002:a17:90b:4ac8:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3a8a10789bamr3477733a91.51.1791440658141;
        Wed, 07 Oct 2026 23:24:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac8:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3a8a10789bamr3477720a91.51.1791440657697;
        Wed, 07 Oct 2026 23:24:17 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:17 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:49 +0530
Subject: [PATCH v7 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-5-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZkA86Go2WmwsxeA79B2BPHvYldgOMas+7hnEDf9OKdg=;
 b=bOPbALLTjtghyIg6XWPv+m4uZabc/9k/qXf2m7FLi9ATry5ElCUPscnHwYbhJuhKdksUdejlf
 zmj75EumEjGBqTI4IiSli48DtA/009ODsG5zbLLblm0hBjfRMLBzdnL
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX03NbrcnHP3rI
 wIMck/F145avtQhBCXIoqr1loUjcSWxSlLK+MUKyZ729n3phJ9N+EHC3REbOXpcRG01vFrXtFWV
 JMkTCvcbO7nFLyKWMnzPqVQM1UZToag=
X-Proofpoint-ORIG-GUID: wp_mw3RqrfUv1CPvYk0we89D4-912U-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfXz6BeAtTp5hjR
 JlT3lfN/P81IQTZYxdyvrTb16XKGUzArQZ50bksT9y5vnqXEy4eq9XrhDwLvKtQDAKYHqhUTGJb
 UvOfOpKdNS4w26daZTwgG3jk3J5YPMlWOeMMTBvcNRpLO8IK+zDRm4CPZMIVz6bibXubRClUtJN
 Dj+N6EAXziyLpVmhDUi0Llq29HTopOJmLApldJOQmX7bIWhj6xAedyo8bh0LUOkZHUaSWfNXZKC
 8lVffbqnOGw601n/1DGJgyGh6Zgpx/7U43lkwQuZgDwthJjklwst6PWa6mNDADuQtBsAJ+aAjDL
 qewcH3GWEkoi2whNgZnS8mAtdc24tcH3JgPLaTcnvaY4PDOZ/G4nIGygIvYqvgNynVdPo1wTDR1
 7uSa8oREnnA/az7yzybc17z/dPHvmccISlguQd4SHfEI5U30JtL6x+ooR9/fTZr4VQruUPItbkx
 20gRXTmp8qJK2D+cMvg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac73713 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wp_mw3RqrfUv1CPvYk0we89D4-912U-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

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
index 7fe5158c17e9814f50b2065202a629eb10a742a8..460695055572151003110f4aec1d682b92753770 100644
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

-- 
2.34.1

