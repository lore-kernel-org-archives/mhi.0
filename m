Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD8322B68
	for <mhi@lists.linux.dev>; Tue, 23 Dec 2025 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481412; cv=none; b=DEeZlTGa3HqfbVMzyEwBHPKSVfgZEvOwkx76T4jZRMCGjisjFbErCwasoFKjorn4OIRFisnZ4Ad0VHRtK3bNBaXIHgQly7qdK7mTn0+XMdKyoxw9pdO8tAzUGekcl6y8AJ31r/A7MJIkp7nTRdPr17T25r6HpjQmjb4Ytn0xfoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481412; c=relaxed/simple;
	bh=Ooh/Y1wNUiIlJUNDCEDKVGJcP9tyUFJnSvKYmynbJfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fKth2daTZmpVvB+jOdXjIZwd9XIw+4KwP4CppAl6icN31+nooCbWx0Rj5gv2u65jZ0eGw06nXLGMRbxymosiULgG5y0GarEDUcc3lKjjWOrz54HsrDmyUjK9ikDO/ERyBwFv+YDB2m4K9OgGHpSjN/73IVMI0AM3szaTy1yrbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdHR0OTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX2fVQhJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdHR0OTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX2fVQhJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2Wxjd1568773
	for <mhi@lists.linux.dev>; Tue, 23 Dec 2025 09:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wvhf6tDxCN1I4MjR4CqRoX
	Y1pe/hNwHpzYJ7PCuWEjM=; b=IdHR0OThnco1FQdfM3RIg+Or9ea+juIF27GvNT
	qf4IxsgJgfB3p4KoFbBS631Ytaz4OZy+yF9N+lzUic63K9mJx7ExGtTvArWJdrr4
	Bld1PjqJYMnMJP3xSVR0XX/KMonGYWkH9FcJETaL+OCWbxnI2FkQzChedUHzsLZm
	Ng8ZGYfFmWXe4eLIoh+6m9THFKhBrizt+TyfZiYg7O2v1PD3NipXfnxf8P292ORi
	+5ZzYnTDxsMA1enBeJQy4mbgVGzs0ciO36zcgD1Tn2lGrddRpeYd9XsNrKnRYUKT
	6+noihpvckugAU5Fm780dt3pX1KzIZ+o2CYCg1h2k+7hAmrA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy31wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 23 Dec 2025 09:16:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99f6516262so13200059a12.3
        for <mhi@lists.linux.dev>; Tue, 23 Dec 2025 01:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481409; x=1767086209; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvhf6tDxCN1I4MjR4CqRoXY1pe/hNwHpzYJ7PCuWEjM=;
        b=gX2fVQhJ03abukA9iO2mxXqfCFvkzsPVgG/9q5jRPfweWIu8itSh/ajWJnIANSLPG5
         /Y5uIqmJ5OkmP6QetLOs9sXVAysLPrSF7U2B3VWGT0jpOzdKmq8VQnPdD5QJnzs5IfYu
         U3TjUZCWGqh6cXXcSRG6dSACgsVhCDZpnslhO/6kpTkGI85WjcvdCl+qClc1bRI1pEka
         nqrKPKVZ2qhHHHMb4XZR/6P5AO6S2ROTIAjwmjbiW7A5o4sEtK4ttx1LGO/bMe2JM3Qb
         m7QsrOyLrjSHapC3jVbs+x3SMrfxHyAuBQZmQ/Wa3tEX/zISnQtHerY0YLSxi/az7Ggb
         nVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481409; x=1767086209;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wvhf6tDxCN1I4MjR4CqRoXY1pe/hNwHpzYJ7PCuWEjM=;
        b=uebi8L3ubJF83B2BBX/El1h0hk8iKafJgfNd1w3UcO11C74ao0cgXkeg5hG8fgMQak
         YYe3U0ABqezVOqW6eVLnmkW3oKGR9ZWyWMFTyFhEROPuB6Atue/CDdhyEtbvPf/xrwY2
         rgECpxl4pVok7EFWKQ7VHVrq2aVBcEHDNxJ5GJNw2qowNSri5xvrpZsLyW/0wQKRY7sB
         DkhOBmJSa33LsXNlCoa7EKYxqOBrQ9H2fprDTosX9dKIxyc+xE3au+tLBGO1HEf+aYnl
         WEmRUHkRcaMg5cYVlFQBQ34z55SLA+8AY4FzauNZyKZq0d7zlQ1igOxkQnuGGIwb1nlE
         +92g==
X-Gm-Message-State: AOJu0YzLEsUxGBZRyJ9YFA6CEECODxsg9zK0nhU82zNSxC6YbBQ2bB/s
	qnQsTX2dMixOCtBM3lDvC/hJd6TewlqM1wXpPry9M0A/bOj3ntjI5KmgP41ww5FZoiNjsj8aznh
	GyB96ZB9u3IU0nd8U/pql1DZiSAb4N741iiVGtMSZ+Un6mNfjNZxkOqiifc2OOlAxPg==
X-Gm-Gg: AY/fxX7W+gm5GGcdwPAJUAmeQUNta9H0RnO5Lr2t6/29cyGqv6aJDfphXNbp+P641FV
	FxpilNyGzQwZhHbrMg7v8VHZG3/VF0SOBUW30mN+Yt5AvwA+Go4xWXvK33rgvIVJ//OFQCG2clw
	6x7lbeWXaJH5JbKtfzW2lpiygyEgo8Ed7qTeRMuSYE/+5o6F5mHdG71sdXZ9c4giIMNabR20CfD
	1XqtzY2q5c/UjCQWPF3V00puvH8dZUPXs8+NCbDVgrft1W+kyJAfxNQIFfCd417jZUDhjgQ4yUR
	uLV2jTbeVe7hmViVPvHsMhQ49NFGve031wlNVUeL9wGo6kWDf2BrV/9mN49ryVAfSj7tURtlniP
	pGjgynKRrGRbu0m8JHkXHR/fttOu8CmUNMw3CWxTc8msPGQ2gdxVnGnr6
X-Received: by 2002:a05:7300:50e2:b0:2af:cd0a:ef8c with SMTP id 5a478bee46e88-2b05ec9162dmr14944699eec.36.1766481409182;
        Tue, 23 Dec 2025 01:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKf4qTYw7AEPcEbQ2LCeERW1vmIZ/9PY0R9YpK+j+f2D58dxleDF7HMOolSZfQxnOz7TdtZQ==
X-Received: by 2002:a05:7300:50e2:b0:2af:cd0a:ef8c with SMTP id 5a478bee46e88-2b05ec9162dmr14944669eec.36.1766481408540;
        Tue, 23 Dec 2025 01:16:48 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm33055965eec.4.2025.12.23.01.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:16:47 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:16:46 -0800
Subject: [PATCH v4] mhi: host: Add support for dual ELF image format
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP1dSmkC/32P0QqCMBSGXyV23cLNWa6r3iNkHLdjjtTZplaI7
 94qCCLo5sB38X//f2YS0FsMZL+aicfJBuu6CGK9IrqG7oTUmsiEJzxjjEt6baBTtoUTqsaBUeF
 se5UxfqbG6AqFNGWOKYn53mNlby/3sYhcedfSofYIH2OyTVIaBugMeKOwqb7MY987P9CJU0a1R
 rnbCoFS4sGFsLmM0GjXtpt4nm21DYPz99cjU/rsfG/mCfuzeUqju0RTZkLmkOXw6y6WZXkA+XX
 AgicBAAA=
X-Change-ID: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481407; l=3390;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=C+A8qHMtEOFOgyFYF9SwWUcHD1V4zZsKXVCt9deYI94=;
 b=Ooax4iwSFOswFLHKEclv0TfJauk1FWql2aJ08SMJBT99FTYNHw3uZJxgrkVBhaxFpNxZK5sld
 xxgxetspSerA5gb/fN9D35Ry5EGHHxa4sYOFXjiXALOOrVa0vVMOrSX
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfXwPB8puO4v0sb
 /Sxo5ZsVGQGFztemdK3Roqr6ZgG2zqOsgh2aXOvFlq7YQ19zn2HuknT+BFJ1iHTEjqmbPUdj4m4
 nuw+cpN1q7zBbkPlp9ZNg9Do9lcQRIoKXCGqaz4LpMK8bzY27wRAgG8Tlhu/NJiTvmfNYN2co4l
 TkG0l3RgtTgpIpc36tf1BtgQ+tXZUfVLbZCy7/HEjswUMvJI4KNrzYsNfUPh4f2DsfYaoSkaErW
 0BCyqTZhHAVsWTjtRjAWp1MW7RCvdg4UCOqcjpWzhKxKnlU8uK/0JkXJqDsI0uJvdMH1y6VwRGH
 +tU5EBslIAKkrl5IGx6gZo2Eg6+yEol1tzM2Nrz1k8FvKIIlKCyCZBkOfz4i/zd6M/6//wZ/om8
 +hsORTjjbMMx94EBX6hHtbb5yeAlCMrAKvakiEVUZT0q5W9YlWQzOteWWvbbC+BbCx43/DnRHnY
 seFDTywZkCiBqK455sg==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a5e02 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=yWoLkE6zulz-TMI_RbsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tmj6QcCeGL2UvQO2EkSEJOP80p4dl_kf
X-Proofpoint-GUID: tmj6QcCeGL2UvQO2EkSEJOP80p4dl_kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230074

From: Mayank Rana <mayank.rana@oss.qualcomm.com>

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

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
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

