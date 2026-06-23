Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B363C0635
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226321; cv=none; b=TojEOMCPMKd1TVET8dYy1gIs9LTajUrKJOZnR9twCe6j5rpXmbvKtu1PXP/QWdl0f5pc47HSQUj7TCcNbDDhC7XUfPWVFp8ioHkb6nT0CBvzFRDJqAF2NLkkzZAYBNBe5g+wwYyrE7yycuEPjFshrDp9PxX2SOkbyUfjwwmN/Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226321; c=relaxed/simple;
	bh=JEgyj/evZg4/rtg3uPQBQlJTecy8/xf6OfnEyAtAroo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGHPhiZQ4ASNc6J71bkK9q9sFZ3IYGipRrdsUISz4/WilZ/fNemHJIrSFGSIefUgNoG49GtnhPg3AIB+yzGx/Dscb6/JrPy1SjPJVgDDgpRwFkpBdncvK+2/AYX80IvV+DdBN+EJJgZpGYX9Cydcn4It2QpH69oC7ZcuDwFuFX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMZ32ZuC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSuhavO/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMZ32ZuC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSuhavO/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZNfq4017423
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 14:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IW5A2zXwqpu7vvO1GjLX8VdN1ZGOsTO32IE
	aybTI8YA=; b=FMZ32ZuCd3F80V0tl+rjM2sFqESCIOQ0A5e0zhki8Zhb+xodnAo
	CECt2HeltlfXnJmBHu+eio8b03k0tQFUp5+/iIEd0tT+bAMeLh5DKN2Aa7y8PZlV
	avhJQ4CfmnF426wQytKWT52PM5+7Xtg0qCIDhHOrxJUi9ED3qShtS1MaD3E34sTR
	C2/ebgumq7SdwdRpS9WdJCf7lh8570IsWMf6ynArZQ0Gf/dgmDwQeAwyaOwXfM35
	uJ9aPRJ/mbLMjx6ec/9MUQEyQMqm/oE8cFYdAOzGYb3Sa58YQ0nAS9uZo4pX2usX
	zAbyABw67gedBfUpEOL5iIhY/T2s36rzqRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjjvwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 14:51:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c79e5de32cso21731155ad.2
        for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226317; x=1782831117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IW5A2zXwqpu7vvO1GjLX8VdN1ZGOsTO32IEaybTI8YA=;
        b=TSuhavO/Sl9ZQGYqsw84qCU1+PR2p+1aq5r2m0uHstLgNlUEX/G8pfBDuO9iiCNtQg
         9dwM/KSBJTj24qoObvJntpzcqxSOTpRzWLt5CGv7uWxUN2tO1NaEhCtrr6ClgdlvEJwN
         JW1DVrb/ALl6mXbqW4LIkPP2K1DFjiIH6CF9FGuWfdypjFSfs4k+exFzcYIvGg/Xqy58
         j5KVOR/qpF+LCbbUMEIDFGfY/dquJaoqizEMsJlg+QwxBpNX+RRMJdYQqElpbfb6U26F
         QFVMZhpYfrSSODWerq9Inl+vMRwS3MGht8qeREizH85BbxUByFrnrnCN/EmB4SkiGTsu
         RMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226317; x=1782831117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW5A2zXwqpu7vvO1GjLX8VdN1ZGOsTO32IEaybTI8YA=;
        b=FugtCiuJiLcA7QuOBuZA77OeQ9xcFUXFJsCzS/ubTQ1PwwSh9iIURSEzCgs1eDmd5H
         MNOf8hY64Ha4/6Od0ug+CZJ2EkGALO3dTnIf54KUucp2IPPLatfzxmL+m3Hpk96aD6TR
         lvPMITuJI7hc7ot9FTPFWoHS3VMg/2c14/THAP1Z9jynmAX6sObXfPY53VA1N1qoVPpX
         2TiZs2DB4hdqnO4RoADww3w6vfn744jBy2/iBt6SJZIyTUPUGTpMt2FwWvEyPUtx6CDw
         B5RoxNCg6wXZ5v97n8ZqtQQ//vfND2OY3Bmzkk3TDAu1VidncyQ5FeZM8Tu2jrkDnCT0
         pxkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFCsQ+CJzYNxoaNcKF68m/cRGgEoET3JnLv2prmrOrZs2HvixcZHrywL6rcBKOwNdXZzA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy1eiwAl62T+IrT1HAF1fOhccUCYksBcdy92wcB+VTtLNw7cy3
	V2UO0XLdqfLdibrVwb/9zOCs9j8Vi5ka2vHkBEuSI3jONAjcc9CnQ1a5w/oc+uLiT8zjDZhy39k
	YCynmBjk3hpLxn8ns6nenPXwz2b179y+SLURowoZvM0xnj8DZwJJ2Okg=
X-Gm-Gg: AfdE7cl6+HINL/F+LPzDMS9GUdqYIrE00ACYiX0PrDXGqgOLx8+7Jy1m4N9iuRqtzlh
	8UfXfHkbE57qiaZvfoVOYOirALH12Dt4idTyFWHIL/KdGmaWRX4qwXvZI3eVxqtkma5fR8RxcVL
	4fivP7oTYy4p+37iIyv6saXaEz/I3n8aPH2UphkfR1PfOTZL0hEXpDmZPCD/8aSSQdIeW14ZCTn
	jnSW9z/70/JwINdlHgH2N/p/y2B45zAyQ9IcXr2UVny9w2fwU1q14nvMIABW0JeA5u6wWomVP+F
	GGlzpuTXkxVeePkiJ58yhhfkUspMHR/xOhbMpAL/ayf1Of5EyB/uFyunB9IHe6WaDf760HKpmd9
	lMpSa8xL4xx1CKNlTd93ItSBo7MZ9hEi/vFly23Zqtlcd1lYA4aDKOhzneizR
X-Received: by 2002:a17:902:f552:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c718f6543amr200107785ad.21.1782226317057;
        Tue, 23 Jun 2026 07:51:57 -0700 (PDT)
X-Received: by 2002:a17:902:f552:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c718f6543amr200107375ad.21.1782226316463;
        Tue, 23 Jun 2026 07:51:56 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.199.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7de7sm105186215ad.32.2026.06.23.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:51:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, mhi@lists.linux.dev
Cc: jeff.hugo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Alex Williamson <alex@shazbot.org>
Subject: [PATCH] bus: mhi: host: Flush the posted write after writing to MHI_SOC_RESET_REQ_OFFSET
Date: Tue, 23 Jun 2026 16:51:34 +0200
Message-ID: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX6Qjrl4/HlEXH
 lxVojMGkUzbYixdWxvBG6lEvCcIUYBx72Gk7e7rMPIahVuoz2/fr57ujvvGlsFM8/habuPa1E3b
 is2+cWuZlf7VRwyseF7jn/sd4wAC9Yse+A+gp1LQvZoXDCzpT9PRex5NfDgu/cOZPIvsWrSb613
 LBpDzwpEwV6G14L3npg88/tZqlVsWKF8htC+p76NIaFxFq35NDrTaoCbTgMNMt066h5tXDDB0QN
 9YCKcG9vuiMS0SsHdtoVbtsZZ6V7cn1R4HrtAjnkgch1kZhWshm2dri0hfxFxEjU1ihuTzS2NLw
 kQUO40MGdN71Z8g9WvaaiNOiSSwYUAV1Os2UEm6luMHN/XVhjGx9Ys1+ZkuY5O630iiN8GfWkrh
 iKUYDq99R3HgUBbHfG/4FQdryt5DUX8/L8waq/CIVtHA1NOrydAMQvb73oZBW2knlnT69Zx5I9C
 XUB5I2AxrYYTm8wPitQ==
X-Proofpoint-GUID: cBTG4OyEGgkCRZZrjcP-EF-S7zsdqc9r
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a9d8e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Alb0JCXUjTgUeOUvUsHAUA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=FCqJEZ2iPJghDfvfNp4A:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX8DUmjbLVXsQT
 nHscvQCtuDLsn7XHd76nr+QeEwp5KpPOa630lvHbVWHkh3V8rZZfSr2zth4OhW239APBt2VR8eM
 7oRAcpmUKHL/L+GL3TZKMFwS4h3EFog=
X-Proofpoint-ORIG-GUID: cBTG4OyEGgkCRZZrjcP-EF-S7zsdqc9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122

mhi_soc_reset() tries to reset the device by writing to the
MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
that the write gets flushed to the device before returning to the caller.

This may lead to the delay (if implemented) on the caller to be
insufficient, if the posted write doesn't reach the device before the
delay.

So add a read-back after writing to the MHI_SOC_RESET_REQ_OFFSET register.

Fixes: b5a8d233a588 ("bus: mhi: core: Add device hardware reset support")
Reported-by: Alex Williamson <alex@shazbot.org>
Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53c0ffe30070..4d458396233a 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -170,6 +170,9 @@ EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
 
 void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
 {
+	int __maybe_unused ret;
+	u32 tmp;
+
 	if (mhi_cntrl->reset) {
 		mhi_cntrl->reset(mhi_cntrl);
 		return;
@@ -178,6 +181,9 @@ void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
 	/* Generic MHI SoC reset */
 	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
 		      MHI_SOC_RESET_REQ);
+	/* Flush the posted write to the device (ignore return value) */
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
+			   &tmp);
 }
 EXPORT_SYMBOL_GPL(mhi_soc_reset);
 
-- 
2.43.0

