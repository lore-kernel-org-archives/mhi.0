Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A435837D
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883742; cv=none; b=tbxKHoZBwkmMIokIdQ1yTmteH46cIozejiO3JsERg6Wh+q/cMOvJXWm9mlu7WP4NJHpMN9/O0mmzrWx5w0KmowYuoiOFW37kQouy8S67hvT1CYZJHg6neYqXPSGUpVHZkDyjMCuLeBWvMAEXyvzsyWtulGS63C+AWCWZkcy4PZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883742; c=relaxed/simple;
	bh=vJFCyjoa95JiLXs7Pz6h5TcdiwCOOqlAIPqInF7ZlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SR4BwWe7JKd/PfmAPBhkX8BS8pkty9rOVDTjAAcU2H3jyzoMTr5vNVBoWBRRM/UvgumKWl0/qqirBb934g4uOxN78z9Nh/5Cu1O2ghENrrPux1BEyI4WM3DjN8NmurZHo1h1BSIfRGOtViPQ9Ix3qnI59XnweCO+0UIM4gr2fJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7xJadM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhVeIg5d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7xJadM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhVeIg5d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6274dYRf3360540
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=; b=C7xJadM8gA7u/IHN
	bx4dtl1AbW/A6cZfQt6yenU7Y5LK7ekEYg6RvIcibbyRAJsImpkgbxOYbrCpYEtI
	oqevAFsv8iKFFLexOKYQXpM0l2QqJPVnGMxKl5drDuvkeEU8JmzsMOK05sNKEUq2
	o2gu92anooiqn/tSoEehm0xR8JCq8VorUHZuQc9L2t7poOhjQPaUlCv+V4V/uPv7
	jjXFo/6+6AKqyqAxjZ5hL6l3wYlpI+LTC9N37ZKyDtcL5P7shfnribCKtS/w3WtH
	mKlf2QS8mkf6Hy/qkMeCwZIXk59VMguXNHpVPmieMW48uFGtFyr/Cfrt33m/G1ph
	SY3TJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6f8ju0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:42:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4b96c259so69826875ad.1
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883739; x=1773488539; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
        b=VhVeIg5d1R2X2k8Ti92spmnthf2z9jHUa9lnuEpSH0+YLoAsJQ2fhSupRfsnFTdjgt
         MwJF8Sh5Z++pb9Zt60B98znJT4LJ2AxMPR+ogaFHZ8xr+yKuofT7w8+Ia3BreuAQG8Wq
         yASh/5iCRnPAVp11Wf/3+KZ0N6pqOjZ5ILW6RiFHwskPBpI9x8NPuvwn/XJIySUIEW7q
         AfiggH7brnyJvcbp7EBLSp+TbiXSvu87wWywkhKx4VIaflqHUIgCBvQ7g35HxMIi79MZ
         uaz5EvEVlc8ZgnOW1VnJy3Cg+B2KLC5oO/YFIUY7pFITMBBOPlykOiu27ihkUJB193Bj
         JNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883739; x=1773488539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
        b=LDZcj4sjsumkSGRtR7tpZcEr2LIYCDOVLaVy38rqw4Af/NP8ZY/5HwdA0KYvUUcg40
         28+Ql/7P/SJwZbwNVBiOEOWm36XiVg44oLB9MXXJyApYha17avATRrKhytHNXqU4ZWdP
         KN/yg/NZyPMa+1UMI2x+SLgA6gA8mTZpMJQD/IQklssjXQBJZE/gY6PaeCJ/ceGjk3/t
         J6iBe502o1OoRFz4+haw48gNfhHeGp1IlBM150acwE8/+ei8/Ak55M9SE8++Rz5RGHCB
         HO+8FAGm9z9VVGoHvnQMPGmHrXi2bbGDIamE7p09+5z9GDHdtokVVavGX4mK8Sdm8xxp
         UNhA==
X-Forwarded-Encrypted: i=1; AJvYcCVnX23mIAZwCIN0xkBmf6mgJM6OTRRo8NleQ+KR/No/nXkPOhPST8zzW+JqD1p05beOMUY=@lists.linux.dev
X-Gm-Message-State: AOJu0YybDUL77zcZUX5b9ntLSM+9tvdcxfIPDAkJr+MFyWQIEallxyZq
	dyj8ufR7ib0eNkaC88wANtHAvvRSCBlGyd5evDgqHvhFuaMctMU6jGQBmSgx9yc2ouXQCBbskZI
	FeXzzTpQLVET5BpQl8HjwSpViVmg40IOrm/Lknzze08jZmvO9tYICibMBmW2ZvZs=
X-Gm-Gg: ATEYQzxaHvywRWkjpKMQ9aBIkbSkr+Sj7EvhvQ1vSINVJtIAeisiOV6rBEJBCyiAw7C
	GFZ+tBReSKdR+FrG+NIEHs8qSuzvKW7HHTbgDOO6qY5ntlpkHTnjCo/EewUTtD1rSTiWGz9L+hN
	HCVXyFP8PO5tFAP4ABt0PIMb5GF69fhDVtL/cUKkITGdeNxES7MydAhyq/QKdWRt8pfo+mI4Uro
	7wZ5Srf1fuj1CDLMJXK8IxeWsVzeC9kdIIL2L3fjc8LplKnf2opHWixHzbGYQ3N4h/TEUZRlxIr
	/o5e42s1UG6Z0tC07z0Y2cnzdmehxQFGVPbx7C5Mao4XstmAxNjOSzHZ8p211cLK24wDbJytUUn
	375GRzytle91xXCBK7UmntmC4O/jRtBK4WjxRwCMgyZ7TTW33TnY=
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id d9443c01a7336-2ae75c44e3amr81895215ad.24.1772883739474;
        Sat, 07 Mar 2026 03:42:19 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id d9443c01a7336-2ae75c44e3amr81894975ad.24.1772883738917;
        Sat, 07 Mar 2026 03:42:18 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:18 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:26 +0530
Subject: [PATCH v2 5/9] bus: mhi: Add QDU100 firmware image table
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-5-29dc748b5e9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=2740;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJFCyjoa95JiLXs7Pz6h5TcdiwCOOqlAIPqInF7ZlGw=;
 b=E0DvBMVt1yhlU2+bl19BSbFkyOv8lNtMG/XoDDP3el3kAeZ8yYxst3r6uOujsj9J/WiJJhau5
 3vsjMZdzA9YC4KOv2yPbPKP9Km3C9tjYx8vksXNq6mmqaYpJDw2zjVs
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: -CJN8Fj7L4Ka4Rx3XUPXNZC0ws-yS2be
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX1plLxkKw7soy
 t+O/I/PH+zKJjZ0t3yjDgTS3/JtgXt8xwI2juaw4jUqYK53zmzkPvlBlNJyCYgdmEt72ACeFkXr
 mToPF6HB53+gJRyTyU545dwwlfYsRJllNh0JsrU260sVACBCiwaj+NtTQWhFys+e56uSdT8akY8
 dTmt9HSH09IAZ/qgqUUEeeHP5TiOptBoKOnReXuX4/BttAHp8Koq+4RpURoSHMFhY4SM/5PRlBO
 NIaiTtdV6PLwKdPS2x5s5tDKAUlMcA6uFtuA5w/TgCQW/joeln7upMr3VRDANi2FNCgrN+U4Xmk
 fystpuWpquYTfVuFaa/XW5K7PISK31eGZdGdZjeqH0nEzRjhwMtJGDaqtAnZD/2fisnHChEEoUi
 wu48rTO+14lPLJOl6QWztaFUjwG2/WSqum31Mh6JbQkaisFTd1NjKSMyC/4i6tCUEBgLQDYUuYQ
 FlcsppbGswcG0xSLv4A==
X-Proofpoint-GUID: -CJN8Fj7L4Ka4Rx3XUPXNZC0ws-yS2be
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69ac0f1c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HyzSnua-yo5JtJyIgQUA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108

Add firmware image table support for the Qualcomm QDU100 device to the
sahara protocol driver.

The QDU100 device expose the Sahara protocol directly on the SAHARA MHI
channel. Select the appropriate firmware image table based on the matched
MHI channel, allowing the driver to load QDU100 firmware images without
requiring device specific client drivers or additional registration
mechanisms.

This change integrates QDU100 support into the existing probe time
variant selection logic and does not affect the behavior of existing AIC
devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..73ae722122a35b77760a4816bc60e6607aa53455 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,37 @@ static const char * const aic200_image_table[] = {
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
+	[43] = "qcom/qdu100/kernel_boot.elf",
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
@@ -250,6 +281,14 @@ static const struct sahara_variant sahara_variants[] = {
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
 

-- 
2.34.1

