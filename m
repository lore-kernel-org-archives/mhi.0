Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35334F47C
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901928; cv=none; b=mFoBvvyHQy55LmD52W7N2AWun/FZmOm6Hd+O6t1DLAOBOwuOkWQMbSvAe5HMP6lNoY4NLZx5lpsu0Cd6TZmbOKkyvvMyQw9/pXm75+28is1jDqdxJmwmjX2/fllbGGrgjLqJhrB2Rh0cDhkWRvvlv0G0i88CtphwOTo5kDgVj9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901928; c=relaxed/simple;
	bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4hYyFnVkdnToqaYc93F4IKLCG71eJLOUS1Fbswl9qMvCvjTe1ZZn5TmdXMIzj5Bm03+VNp6BfpF8uc4PWGeBte/L9PuJoAcrFwf6NqNdvRj/oHMXlLdfyK8lm7h380XDa3PwmCHdihQiFBfrbFtK0y516uR6WUphVVy1RiHfis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Whn166aW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g68jD2K6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Whn166aW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g68jD2K6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XbqY1574707
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=Whn166aWF+XL6yG7
	FGBOscb6eQy7j9Si80EhSoVjfzaM0FEkgX2cWAxkFlVNumEzhyPzOM9CmzWdG1qA
	MZQQI3LX3k7bg9IChdDCQsLasLxF2SAcluNgscqujtiG4IxilP9rK0D11/49d8DL
	ty21gWcNCSyy+9ULXhqcCZKLtXUj22qbjv+ag9nO1PJOjF/notp8RB1I6Jr9FqO6
	cvRjn7Ex3O4eiegBLvHEkL4HhMZ6bxxYMIuZi6XeL7dvhczmWEwLGX5SWZHZw/Px
	uthjzhpknujr7XrPFNiCdVRPrBSlIMs7ySDYLOtD2q3kpdEYSwPE2dzw+XFhxCGR
	DvBxRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75tcnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b05a3c2421so6889855ad.1
        for <mhi@lists.linux.dev>; Wed, 18 Mar 2026 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901925; x=1774506725; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=g68jD2K6ri1W+Z2Mj6eoWPe8Uup3YExDKOjvKhJhYwScsvdyNmaqf3WoY2L+mx8SBY
         Wz6kHPEKZD6WJu8jfHiYwRlrl4dbvlx3hI5Ne3y/QPPAEwmEgfZ1O6YdjTBAcBMsuLbv
         1ynrA79+JrX8ySdwUtwyQBEZGP0P1KUAya/DSyN65RNQzPuhIWRoRmSjwyvnpawj2DOe
         KwgJo0CCc4ekIskEb5o2BK4fi/fgyhwwyX8fyuRfrV5sS+xJoA+JCK0rocZFUP7MBHl0
         vWdgy0Pakdx8N8QpciEBKCk6N0E+7DUjqwHDsbnSMlWZ2dGoI5/3nIkvWvEziwBMf/zh
         pEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901925; x=1774506725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=SybkYhTd638lliYNK+6BAmIVdb7YqivsfMUgTi1xlX2Z6Iu+h6N2LjDaJi73PbDcgJ
         muCVvfagOFVDhIMPWAEtixzEhJi07ekxi5XPlekAwIR1qPyXpuVao27VDXISe3xz+lvH
         wTPDL3SBSbuLq4gKJ5Z4krUfhTq3c4tLofzRCABXFefZ/XgHfkin3g3tFwhRf1LwQIwk
         FGl9PtlDQ5l/vz5UuRqteryW0S27XzGnZuEcKMGVwCfL0h+6NQgjhKJ3X/QsTcYbYs4N
         1FHHqjmWb+D1q8pyExKLieZt4nLgdzk8LyZgmBGVKaH7fDyQbaeb4grGJ5RNbgF3ErQU
         yPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuddBO/3Znb0w4HBH3QgtFLqEr6nahS9J5D1QklFOj/Svs3VQq0if27fLEvE6n7rud2zY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzY41gDRIBMoScKkbuUrJbKjhLMaAWBHaubwt+BbUFF0iRscQha
	EFnvfr1+6yh6sOc0rnIid1EyJFf5GJ3GOG6XcxdKKxAmkmjpLFMTUAicM51h48cFjEJtchSnnNy
	rjKhBlT1QyE8gVpdUZoXw8rqgHJaNndZOm49+7PakIjRt+L165Ufq5ZM=
X-Gm-Gg: ATEYQzwpbs6SK/pFuIXV9qOXZELptohA04HjqcZDNM7/X2i9gsOONBQgW42VOCDnFNh
	PeEpDWqOuiCB2u5klNbVydBtmw/WH6M6TVPF/nEsdTD6/cgJhKia5dJugwyzlgHuU4O6tz69Bvi
	uVLmqYPDSU3yUEQ25kVCE6bDRamvdcra1xuKv0M+q/itrBgBVwOAAssARRIZy5/P0DCGNf+50K9
	9QpL6Jt6wUFgs5LGfh9DmsMmv/0h0SF/sNe2mJqh5L/PAMI4LAMeUJpj9Mgv0WYFAQsdjgEC9g2
	fxPglovdfTEV5ZQIm5CimwpIQI7K14bk+WdMNR7htOuwWEZ4uH64U/WCx908VkBmWpmiTnS3Pcr
	lG8rZ3xlsGqJ4BCNyXMkY2Z5bRMS2TIOmrGmzDWj8hkekgUSkbFI=
X-Received: by 2002:a17:902:f547:b0:2b0:7177:d5e5 with SMTP id d9443c01a7336-2b07177dc04mr45425215ad.43.1773901924717;
        Wed, 18 Mar 2026 23:32:04 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:7177:d5e5 with SMTP id d9443c01a7336-2b07177dc04mr45425075ad.43.1773901924217;
        Wed, 18 Mar 2026 23:32:04 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:03 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:44 +0530
Subject: [PATCH v4 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=vr6s4lpUaWr2T9TkXlD+KdE+YQxiqHW3dkYcMsoUITH9JLmrkM1V1VinIAHZ1bzHa8OPBMlFX
 aLXDFnx7Qz7DIK4WvzLkJn0afD+UwqZPiaiR3bpdRalFoHWK91wWibP
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX8b2iAuhJJjbr
 2pI/wNfya+NRBD48y9s0h/u8SR8n/VX+bQXksk7lQDFhZc52GKeENa9yI/jNTttyVTye9Kd3sP8
 UlyWY0tfL9nd6QSg1KHxY4bUcfU/6Kt8aYQKOV9heXmGyWrcenWh2FEmDZezdFizWyXqdD+9bLj
 pnxMLXNClppOnz5N7Ms67DMeh9UxS2jyNUqbqZ/7q7m+ADZAKeHqeirTl6fr2b3NNOzO+rT1W9+
 ZdHDSO7XKDgXuowXIxRbIaUT4BXDYPne/3DMyvguIOXLt2PDGWllTlgZEPqFsDxh/pZwPa/qu+K
 yfcmnKC1OE4IaWTN/4irbedTPBx2NXSnu8rPNmdzEO7dYncIarzCqL4W2TqNnMngjageyxJ4X/h
 38fThc6pbHKZK0fL3dcHq70COhjq3HQ9ULTqi2W+halieTGsduDzdyIqo04tiy7M2QEQIG8jOuy
 m6uiGc49fpRhJ9hM6Rw==
X-Proofpoint-ORIG-GUID: NyNBtqSgIEA1Mr5j7wQIxpuhfnhwtpNL
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bb9865 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NyNBtqSgIEA1Mr5j7wQIxpuhfnhwtpNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190049

The Sahara driver currently selects firmware image tables using
scattered, device specific conditionals in the probe path, making the
logic harder to  follow and extend.

Refactor firmware image table selection into a single, explicit probe-time
mechanism by introducing a variant table that captures device matching,
firmware image tables, firmware folder names, and streaming behavior in
one place.

This centralizes device specific decisions, simplifies the probe logic,
and avoids ad-hoc conditionals while preserving the existing behavior for
all supported AIC devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -180,6 +180,16 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
+	const char			*fw_folder;
+};
+
+struct sahara_variant {
+	const char *match;
+	bool match_is_chan;
+	const char * const *image_table;
+	size_t table_size;
+	const char *fw_folder;
+	bool non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const struct sahara_variant sahara_variants[] = {
+	{
+		.match = "AIC100",
+		.match_is_chan = false,
+		.image_table = aic100_image_table,
+		.table_size = ARRAY_SIZE(aic100_image_table),
+		.fw_folder = "aic100",
+		.non_streaming = true,
+	},
+	{
+		.match = "AIC200",
+		.match_is_chan = false,
+		.image_table = aic200_image_table,
+		.table_size = ARRAY_SIZE(aic200_image_table),
+		.fw_folder = "aic200",
+		.non_streaming = false,
+	}
+};
+
 static bool is_streaming(struct sahara_context *context)
 {
 	return !context->non_streaming;
 }
 
+static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
+							  const struct mhi_device_id *id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
+		const struct sahara_variant *v = &sahara_variants[i];
+
+		if (v->match_is_chan) {
+			if (id && id->chan && !strcmp(id->chan, v->match))
+				return v;
+		} else {
+			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
+			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
+				return v;
+		}
+	}
+	return NULL;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct sahara_variant *variant;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	variant = sahara_select_variant(mhi_dev, id);
+	if (!variant)
+		return -ENODEV;
+
+	context->image_table = variant->image_table;
+	context->table_size = variant->table_size;
+	context->non_streaming = variant->non_streaming;
+	context->fw_folder = variant->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.

-- 
2.34.1

