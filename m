Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F8526FD83
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647759; cv=none; b=bjV3Alrd5L/JfkvIPBRXjQpg2y6iYx+zXrbT3CthZ/UkQHo1TuZ6ByalWRI/gQuCz3Y5EvuO5GPo2R09HkmAAoBM9YpIfvri0tHYaaSb6MbkEkyrIiVyolM3P2GzDbPfY0t1Nm7oaMd8vt1nLoCcGX2Ppt4axqzXiZqBg1raaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647759; c=relaxed/simple;
	bh=uFH7gvcXfq8PXUbSnW4zFmBHt5LxnpwhDzcE1X+yWFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6YFoOHVWUh+1r/JjXmKVrLHy54G/1EN+jMoL7Pqc43x0xQFqwp4p1zYtNUrdk3h0MUR6SOSh2BvXsDDFBSdpqUBgYvSAPPULsAcma28o0dn5SwL50ko1m/AHB5xKVF+Pbi+LnNqrZRkeSs3kG3E/11FSzsXfK3i/amOJJjTaug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsMyobqf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsMyobqf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9II6j005958
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU7PofubsUvHU2URxMpgS+EVNoeW1gK8KIbpSjZ8wvs=; b=JsMyobqftJleRTbj
	B11FC/2JAVgMNtjie8qW+mRAiSMr00ZwBIKJaCtY3K7PJC1hvmlA+odTItz9mkCP
	GIU5Beb95mBvQF1MoNpLuAZAKckt3FHFHBhceDgDSiLuQSndTkJrh3vfHvxrVIyp
	5Y+5+bEuE1WQC5majbNemPAgNASOi3DER8bcp3B5C0fCH4hSP1TxY/fEQJYUKzPF
	uXoHW6oUhwk4bFr8uqL/aKBxxmsApl1JfFXI1U6EDfPjcYkiq/nG3RWA99sCIJtj
	ZtvMxwTMCxFSyfvqeexb0VY2onCr+1/JBfnbs5Tb36ISaKeTEGQGtL6FR/1P+pCX
	4KULVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7burn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:42:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742c620e236so1033317b3a.1
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 02:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647756; x=1748252556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uU7PofubsUvHU2URxMpgS+EVNoeW1gK8KIbpSjZ8wvs=;
        b=Y02S9d3wob6nGiR0MOTqfYSJM8uMhwxUPsH8DwyzWrIwmEzpzEcVNifU5LxEL3Vy2S
         VKfdPPcL4Wz4f/ldGP27acXu2A1MTgHO1qsAM5kqYppbgmBXzfnQbbmRfrNBfOjcxuCN
         SujgqGlp6xAyOFw+sTPpSupuVOv8d2xdXIgb6J687ilEYjwd6yhy9JgzNoxajLoug97L
         FETURAxq2P1Acy6oTt9NKyzZVyYNncX/GQ+OTErb2qQ92D0Eg+h4hmNXrf1LaX+zt9tA
         U7z/CaFGi2ycrHaNdZF13fHQnruGUfyoorKmjTDwD/crERSOuaGSISOk9pPVRnY8gs/r
         fmzw==
X-Forwarded-Encrypted: i=1; AJvYcCVItacGwRled3+RG8AbM+S4qoRGMMQX8MNK1xW7TqD9mmUjaczi9sCmDnJP/9Ma6fYqShs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgJRy6zvjkfNOqb4tph9wHt0XJwKfUEh5FNKL2nZRVV/1hK9M9
	bX3ME+Mby7DpQP33p2Kr149dpamIPWlqfdOmc49KHRewIZQS/9DfSEH0leHpMOqKS+GxA2KFXhW
	WYiBIr8FP285zZNlc7FiU7+hXvitnAdMM400aDQ9j0wAfzUdm+BxunyY=
X-Gm-Gg: ASbGncuw7tbkaXutwGOlOjva1du3hfXK0sdY2p7c3i/X/SqhumhWxrExX6WsoIUQz3F
	R1mZVpWVv+iKRbeus602TGjfgVc05SwR0VjfX3n8I/CDjjSbuoivA4vtHuMs/D34oYYeue3kBm1
	OkSCiS5rm9fyi8Z1njKh82rge0ygfQblcclCXISqeqxBFVwQv8JS6kv+xDb6L6F2UfaWOJVwX4L
	n90JafdFXqEhL918CMjppFhOQxuRtn6HZSEQZPl7Ae7BqhDtFrZ+SaMLqyFOz0EmcAZ9uo0BLPO
	O0CJXQFMtTMwHjlI7A45bA+BZuytyIDDPZPdlmKaSZdqm/I=
X-Received: by 2002:a05:6a00:ae1c:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-742b3a6dc2bmr11994282b3a.18.1747647755746;
        Mon, 19 May 2025 02:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE99iUQ+YVc/maiKCsxdLZP8n8nikcwdzK+f/VpTPSVQgsMwchfjJqT1QzUS2xVouHmoYvWTQ==
X-Received: by 2002:a05:6a00:ae1c:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-742b3a6dc2bmr11994251b3a.18.1747647755364;
        Mon, 19 May 2025 02:42:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:14 +0530
Subject: [PATCH v3 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-1-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=1353;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uFH7gvcXfq8PXUbSnW4zFmBHt5LxnpwhDzcE1X+yWFo=;
 b=lXyiRKWe2dUM/NoKi98YA2ST4iD+GyJH/JWFyhdLHqiaIoNSFdOEcmMxv7oVHUvW2lVe0h7ZL
 UYVeLSPwgrlBOdS2f0m/xziM1YsPsEV3QKXX1cYho1bhDVgeJ3/rrYA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682afd0d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3phiJa3m8EW-4BHYHVwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0E4vBSnvbhwSgIv4ulDQQhgrUgfeyUpr
X-Proofpoint-GUID: 0E4vBSnvbhwSgIv4ulDQQhgrUgfeyUpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfXw3BL6tRNG9KY
 dSnRn/+bUI6DfVIf33xLINtZqZSdU3AZ0Bb3dJpKWwyakqG414ejXUrMM4XTLx193jkZ+26ziFA
 JYgrg2Vz4fXn1LuBZHYo4vYY2CCIdfjGwePOOCZzp2COh/AUeDmqlnyzRQg/hr4w7jMArFwLpQx
 WN2SwAVKgOi2TCP6DMOq7e0huoV9eROteSm0/ZalbksL6B76++GSh9IJsljMocc9cANCqLNI7ee
 VGkHRn5Z0h4paPf2eR2RbtOBMqH7crEbfZDMKZ/snHP/oR62yyh3lUUGMk6LbcPsc6PQpdESQZK
 HW3PSjbKzSM0b3E4rT3Ddg0a3RtGtlkMUNOIP48Y0HLgOB6+u5EdgCR5sk/aTE2HwmeTS4y9tEM
 WerShjYmiNUgurtHCRI9pzXVvPc5Fy4F2zCg8auFQ8473HBzJnMJI+IQ3vN9oe+UXMEukF2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

If the link is not up till the pwrctl drivers enable power to endpoints
then cur_bus_speed will not be updated with correct speed.

As part of rescan, pci_pwrctrl_notify() will be called when new devices
are added and as part of it update the link bus speed.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 9cc7e2b7f2b5608ee67c838b6500b2ae4a07ad52..034f0a5d7868fe956e3fc6a9b7ed485bb69caa04 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -10,16 +10,21 @@
 #include <linux/pci-pwrctrl.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include "../pci.h"
 
 static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
 	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
 	struct device *dev = data;
+	struct pci_bus *bus = to_pci_dev(dev)->bus;
 
 	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
 		return NOTIFY_DONE;
 
+	if (bus->self)
+		pcie_update_link_speed((struct pci_bus *)bus);
+
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		/*

-- 
2.34.1

