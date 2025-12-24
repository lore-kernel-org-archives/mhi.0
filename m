Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587F1D5CEA
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 03:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766545531; cv=none; b=TSISOTzOaJzx7JYNn0Gh7I2nPo5S5TEX36aMUu+CZa82AQuq2TwLXrSH+UOXuvjSiuHx0V+pOsB3DcqYeCyH9jYbgQ48N4H3xRoJMFpe9TXLbmu6ovQKP5fu5P9mtSRaGYv2eQ4HkGn5cNL7OA/yXyczFmnuNROrBNz4viRYKTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766545531; c=relaxed/simple;
	bh=L7d9WDfHwlzNrI0KCwmnPnsGCrTqpAM9L8mNj4ddC74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aRgAIon368jlj2iE5rrZLW2V5CcAODRwSweDWJfHJiXMEqtzC8gf6opgaewRcwY8IQ0uzB/Td/aE4hU1mv+Zks2+PJci+Qd9aMGS0Dmmm4B01u2Ydgold8kpGxt3krYsTR5Ist55lXyF9OFAzuhLtESvpTitQw0HmRfyzsuHw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PR4rg3G5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCmZ8Cgl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PR4rg3G5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCmZ8Cgl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNMeEnD3154790
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 03:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FFOhIoxD+udoXEQm8ssn/k
	1M4rTdS2pHETEOs5w29AI=; b=PR4rg3G5cC9hfSNQTv9U1uBiYrTIIIfxfVvYMv
	jWwIioks7zaooKSChB8SMYi6r3YweMpXajuQLVKaiAUJ2B6YU8rLUN+ZCH9Q05we
	5u+BCSJZWRbCuyNvcXKx3lNjoMpgu4lpQftNcQwr65ovIKv+Qtx1bF6pyEd/7bsn
	G/YrRyZe+XSCjDS7+CRZ07EtSSsIAoXRxP4AgSf4vMMGx6ddI+PUweFxkWEWOm+K
	39yqc6MneivOfRER1lm0UI604ODvjuj5kGU5FKmIBtvDdf7L6J9vMGY0ub52alHz
	Zg5XUnE7ZKrP39H3Lra4bEkGRmrwJ4gwpk5jY7Kf74BAWW1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhcuje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 03:05:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c1290abb178so10004655a12.2
        for <mhi@lists.linux.dev>; Tue, 23 Dec 2025 19:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766545528; x=1767150328; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFOhIoxD+udoXEQm8ssn/k1M4rTdS2pHETEOs5w29AI=;
        b=FCmZ8Cgl4zmn0SNLRzzSJqyuV+G5EyECR27a0jW/RvJR2ysYmEV/rV/mY1FhIVtBZp
         RCHfnuLooHVlmqTTij+EAHJhlvlPF2vV/5sE18euESup/5ApRmvhD06BV/FZW7/KejuU
         9ZDd/zJdCsh3G681gAs2Ph6AT6KoQYQhrv+tKMfVUq9+y/TvUrlyNQvFw51WL2yawC7g
         c0OEgGW/N47IWKdxY9xxQG42arT5dSTiU7nzRYcowLvhUNSD2bS5n0sJ9UC+t2WH5e5y
         hjux5+XHkKv5MHMqD6yqaEsaOlApz90PIGisFc6FC5Od0+s2X00AyOdVhGjy5HtjmyWu
         IE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766545528; x=1767150328;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFOhIoxD+udoXEQm8ssn/k1M4rTdS2pHETEOs5w29AI=;
        b=Ga4IhixsSgjsBFO8l/mEeeuDTrckp6VmxPBC6W8jMPMh7KFNgxGF6wVVFRS0LqN35C
         nM2QSKDP5nAK5xjbjU+aMUepMZzpuQ5Z6TJ8DA1Ww+juC4SyLCYto173yaL62/QcAEq4
         qGiuIAnmnIQcej4iux4USjZ3B9xQNDLIGJlLOgMhaxjMlz8qnELLuWhOIDJar6W7RAO3
         Dq1ttitT4y634ZYZ73hVcJP3AYnZmZjSLpjZl7dLXZd/TXVtoV+0/pYxRuHoSNyLGONi
         BTQAsq266UxDT6fmx6bH/jSaaDVelB/L1FRrxW2OStI4IFwIhbStFKe5I7HD2RWb/30L
         8R8A==
X-Gm-Message-State: AOJu0YzOIQNWUzbDM3DIvY134ZkC1RnkjDqUkKIcVXUqonEPlp3PltFz
	WzWqVywXCps7stYmfwriKMMRhRFWf4Pvx03HzTCkZzAsWIi/HHI3MGPHRXO/b6/5LJ7C2nwUiV5
	/rTaph9oW7wd5QuukMpEtTuLSuYiGMyx26PX/ogXRupGwsbCrn9wWgIe0WKzwdoSvzg==
X-Gm-Gg: AY/fxX4sxh93qMtRrnhwH/iEHeY/T4JDzFBRnq4VJn5uQN/dwuFDShEuIUO27vWyepU
	OLbvljv3mdc4mkcjPaMySpZmWNLsJZaFq9Q96l+5zbtNfIFz6qNgXBdywIwSd4+42h1rJbGaJQc
	CZUkIRNm2C4vbRzOS4odzG7uT2uMc3jeu5tzhB4ylMU5fpREr0sbSA0DfFQVtIjwTY4XoqhUCyf
	1n8vMxI+ijgRek+lGcqh7xzJYAB/w9hEvtxoCjbyH0eUM9yEAAfm4KaN/VYz1ryOCOhmP19IxR9
	QRd1ATpZXpveXxmIJ5jErBOEJwbX/Le63f/bxsjbZsV3gIPnjRxfL7C5VY7qQ6SfTkDQNNV8wJk
	1Wi8T8iEhL9XZVID4LT9uyDXUQzPRO0nV8lMKaCgV2e4jJCH9707yXXTy
X-Received: by 2002:a05:7022:61d:b0:11a:3483:4a87 with SMTP id a92af1059eb24-121722b771cmr17037686c88.13.1766545528299;
        Tue, 23 Dec 2025 19:05:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG93BEwr9RbdIfRstr3iob3AI6olRrNRYusetw+VRPaE/pCjjFrKIVLFO50zD+6M45FOzVPsA==
X-Received: by 2002:a05:7022:61d:b0:11a:3483:4a87 with SMTP id a92af1059eb24-121722b771cmr17037654c88.13.1766545527574;
        Tue, 23 Dec 2025 19:05:27 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm65186256c88.17.2025.12.23.19.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 19:05:27 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 19:05:26 -0800
Subject: [PATCH v5] mhi: host: Add support for dual ELF image format
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-wlan_image_load_skip_512k-v5-1-8d4459d720b5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHVYS2kC/33PTWrDMBAF4KsErasg68exuuo9ShBjaRyL2JYrO
 UpL8N0rp1BaWrIZeIv55s2NJIweE3ne3UjE7JMPUwnqaUdsD9MJqXclE864qiqu6XWAyfgRTmi
 GAM6ks5+NqviZOmc7lNq1DQpS9ueInX+/26/HkrsYRrr0EeFbZDUTNC0wOYjO4ND9ki/zHOJCM
 6cVtRb1oZYStcaXkNL+7QKDDeO4L2O71vu0hPhxfySL7eZXZ86qB52zKHaLrlVSN6Aa+Gtv1bP
 8AXLxCJQFBMa4kFBbdWj+Add1/QSM4CDIeAEAAA==
X-Change-ID: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766545526; l=3460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=L7d9WDfHwlzNrI0KCwmnPnsGCrTqpAM9L8mNj4ddC74=;
 b=Cx/oxMivL3KjwL0QdFU/ZJfYUgZiKpJY2Kfzj2hsCLOTJibinz2tUObTeJ2aMNUWct8AQs3/e
 2UTHwVZlc6SAJ9EHHfoLsSeObYQmWcXQDLtTjt67A/FJiBk+WNtd1qN
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: Dnt3Jo2_NyMN3tM2HPcloFmOPiGu6L48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyMyBTYWx0ZWRfX+hTY+AlhzS2V
 SasJveF57T93wwhVciQUgt/CuAZANcDgAHxmzV7RqiVP1ThYy9W0FKMF38CJq2cG24AXWpKmnEY
 VEEPhFUAnFuICwPnGnaWlDn2Ff1IQoQrfNNcU73uVsm5f3SoHjP+MPcahpHhCgSIgXR54v1u75n
 ep2fC4UgrSax88T6dJ5rKOgkHEy+e8AvxiUzjQi8Sgm8ZhB8GRjjVxd69uyz4yPAtDY5oXcT1I6
 GYMw5WUQq0EG2HwQcto1DZIxmUGUUyenbmugk+P8pGwyhFDwR1Z5ptMnHojjtkkxlZLx/rmjf/4
 dp1WrfRmDtECzS/HOeuNXMkLgTREbkBaDPF1iCrAh7y5pxhldfznyi7u602AXEf12W8WaXVYoSM
 NuKI4dIo1RJf7hO1+iehPxX1YDk+dDTCsiO0j80V3+EvsBuUhXAUVZ1jkRoVR0RJXhn6dk8qsTr
 PUBu2jtWvzL8Oa42rQg==
X-Proofpoint-GUID: Dnt3Jo2_NyMN3tM2HPcloFmOPiGu6L48
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694b5879 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=yWoLkE6zulz-TMI_RbsA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240023

Currently, the FBC image contains a single ELF header followed by segments
for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
supported devices (e.g., QCC2072) require separate ELF headers for SBL and
WLAN FW segments due to TME-L image authentication requirements.

Current image format contains two sections in a single binary:
- First 512KB: ELF header + SBL segments
- Remaining: WLAN FW segments (raw data)

The TME-L supported image format contains two complete ELF files in a
single binary:
- First 512KB: Complete SBL ELF file (ELF header + SBL segments)
- Remaining: Complete WLAN FW ELF file (ELF header + WLAN FW segments)

Download behavior:
- Legacy: 1. First 512KB via BHI (ELF header + SBL)
          2. Full image via BHIe

- TME-L: 1. First 512KB via BHI (SBL ELF file)
         2. Remaining via BHIe (WLAN FW ELF file only)

Add runtime detection to automatically identify the image format by
checking for the presence of a second ELF header at the 512KB boundary.
When detected, MHI skips the first 512KB during WLAN FW download over BHIe
as it is loaded in BHI phase.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v5:
- Remove invalid Reviewed-by and Signed-off-by tags
- No code changes, only commit message tag corrections
- Link to v4: https://lore.kernel.org/r/20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com

Changes in v4:
- Detect image format runtime by checking second ELF header instead of using a flag.
- Link to v3: https://lore.kernel.org/r/20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com

Changes in v3:
- Reword commit message.
- Reword comments of standard_elf_image flag
- Add reviewed-by tag.
- Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/

Changes in v2:
- V1 patch is paused because of no user. WLAN team plan to add support for
  new WLAN chip that requires this patch, so send v2.
- Change author and SOB with new mail address.
- Reword commit message.
- Place standard_elf_image flag after wake_set in struct mhi_controller
- Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
---
 drivers/bus/mhi/host/boot.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 205d83ac069f15a19ab2d66a63692e5d60334d4c..6ba0f16854d3a839e987f19d782600467b5f9836 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -584,6 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * device transitioning into MHI READY state
 	 */
 	if (fw_load_type == MHI_FW_LOAD_FBC) {
+
+		/*
+		 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
+		 * file. Hence, check for the existence of the second ELF header after
+		 * SBL. If present, load the second image separately.
+		 */
+		if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
+			fw_data += mhi_cntrl->sbl_size;
+			fw_sz -= mhi_cntrl->sbl_size;
+		}
+
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);

---
base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>

