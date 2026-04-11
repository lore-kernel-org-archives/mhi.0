Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267482F546D
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895135; cv=none; b=RbIo0BthbUEEa1v04Egs2MIyYYX5xbpkoUXgDusqrHyCd+vomxu5c3fbKCca9m8l7mMzLjF3caxgg/kGO58CzGxNvcaznu3Jzibz+kUI4cuanuRX5poZiIHQ6wSiC8n4/1/FD2cN3n4amu/ewSq8WYtn0G7odTuORY8hG+18PTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895135; c=relaxed/simple;
	bh=pQiqn3feSgaUicZyou6Fwb+8Rgys/xfH9OF2tMolgkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RCgscJtCD00EeEPimAGzZdbYMQ+VN1vHySYL8fvOFepW4HXfML2IHR3aWOD7G1mr2P7QY+jwUif7Sgv0GSQg9bF8rou0P89PNXz7W8Xk8j+Mpti+sYOE4Ro+1CvOrwg3glfoxP5EVaslie899KzL3YTBBZD+VffV2dPSGVcp3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CanAnbdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiMYi8Hc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CanAnbdK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiMYi8Hc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43rYg621772
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GlXtgT8e+zLgF6GuJlHYNa
	i0J4Taus7qR7tYmBgTmu8=; b=CanAnbdK9HXTrFUmKKxZuaKqMCELAqo37t2F6L
	GN7/lFrE96OCO9MkTg2N0vZMOfKjkAQ2n3ytZJsEIfgZVxl/xZZppUXlW5DhlDrt
	PtpRFKuCtsbpGspTUZcrS/R0uIyJLf2i7iB4rTwKuOileetU4kkJu61zdey9JRvs
	VemZtDbIn/S08ow0zQTKqU0Nf3RHdzev+qPaUN3XIlbZnrcBFuWib+qGaOjE5FYW
	sXq/0yBEdt0ZYmZISBvzrvUSzqtsuuC9WZJ2P3ysjHfs/QkiyYafQPPmVLmXZbgq
	32MHflpFiG+1z3ZyawyRtDt4GI2fMYVWQ05rlzLwGO2KUmIQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrc3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so1629662b3a.1
        for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895131; x=1776499931; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GlXtgT8e+zLgF6GuJlHYNai0J4Taus7qR7tYmBgTmu8=;
        b=GiMYi8Hc5bMl+GPQI6dwMHNpDyRXWJuJ5BXnVCfch+s087NLVnWumbM5BVRBdcXMwt
         699IjJPErmBxVUFXo4zCzYuHZMbHJig6hSEu4ce6jAsLzYZXXK0l2J1RWrjpdxDj6pMU
         usD/+JN1gkXYUXq2OnFyctkI7qeACoxaOX0rC72M+KFj4qCLfnGgXaMmavivqjhUWePY
         898shDO9QTC9MhuaqgzKe4+fju84yTkR5uceh3vsSQE/F3ZXUEkupwIu7mGAe9+5YLvI
         UP1pGRhXusnXBwr7t9QmaB8rgJbq5Ch/7B9ap3ozsuNbsatMAi2XcDW/Ea+qYsGA5EgU
         xHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895131; x=1776499931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlXtgT8e+zLgF6GuJlHYNai0J4Taus7qR7tYmBgTmu8=;
        b=mSlMijSi79rtthOKgsDWLiAn24a77SGcrtyPvjZ8t9Z5OgwW/Bm9GOwm790AG1WaPH
         FUd1yZhZHzNcHksRkjpbW7hfO1vVz1ApzGUQnx0y2Ho/lANeOKS4Yaiyl2Y2vHGx692z
         P/BCKK5kXDLSmVy2Z4b7m7mRuTJZ7MfDiL/FuCjBosqwJMYRbfXAKiVYV8DrxV+Ku7Oq
         rH7tQWrj1cuzTlQsjkVWb7ybtF42QiJsfdm5uWGouuEmQWCtOXl9k6kWRXIzxoNy2ecl
         3dbxvuw4WUk8jdyU/xTZTY1YADluO2NP//vclGuQQ5xIP+1FIsc1BpoMf+hIqi1QOd2O
         dRwA==
X-Gm-Message-State: AOJu0YwHMWctZb9jjsmNzUtfSZVTRAVDYqOdq2XOfMQ5czYIDWYbsMGf
	c1QvNK5eZ/0khuVszCZK74Dau692osJ1EqnjOmy0iq6DBEc9Ntc0nKKw1k4yJLr04/gr40MKByr
	/DNXnLgpQ6OqHVx4/Fw7iIdl3PxYG45LkHb/3zLTDP4mVHKEp8qmhnJM=
X-Gm-Gg: AeBDieupzmbzeNmbWbJ860glqqfkJP4fpuOju083QEcS2xI6lFa94G2n3jtbVLTembm
	5Ew/iX1U23p8KPvl35t7O9NCxS26/xs81FqBad3l9OFRZk8ITEbtedST6BkHnKvWviRb600D1tX
	NLz3gfnJeoagmenaPHwGe8HznJ1y1yngT0jGuqUFgp7g0jrdlGsCS7Zkcq0r6HC3EpvTyf6xRdi
	zYapZbBxVdXXzWBhtNEEWi6Xel41RB/8CIx24G5INUD8VF/awGo4h4z5FhQxtexYUpUIZXcLsVV
	WWpIJ+fTdkvmm702znM1iYiNl/6Xg0NQGrVm5yxaNYCaY7ljdJYttGsedVJcIj+VKjEXUeUm9z9
	flB35ohPIANkb5l8TqJ13BhPLKizN+PRG5DY+0RF/slzMT9DOR955hr8m
X-Received: by 2002:a05:6a00:6ca2:b0:81f:5acb:55fc with SMTP id d2e1a72fcca58-82f0d10b602mr5122683b3a.10.1775895131364;
        Sat, 11 Apr 2026 01:12:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca2:b0:81f:5acb:55fc with SMTP id d2e1a72fcca58-82f0d10b602mr5122659b3a.10.1775895130857;
        Sat, 11 Apr 2026 01:12:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
Date: Sat, 11 Apr 2026 13:42:00 +0530
Message-Id: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAC2mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDE0ND3ZLi5PiSzNzU4sq8ZN00C3PzRANjSxNjS2MloJaCotS0zAqwcdG
 xtbUAgUJrxF4AAAA=
X-Change-ID: 20260411-tsc_timesync-f877a0394393
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=3043;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pQiqn3feSgaUicZyou6Fwb+8Rgys/xfH9OF2tMolgkE=;
 b=lTlPwJWcvD0IDymoSKm3DjE49QlWNpIcrOJ7qka7GLcFWgChT+ARQ2FCwXSrhrCkzHW6BtNIA
 DCP/1hHeZgdDpha/oHEKOjiilyAhMdHCe3tJfSpX9f9yhTq/zdHWa86
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: UpxAm9EWakaHwFO_u4K7jNW4-4YyjOGO
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da025c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iDy-gfMDp9cvPA8IE7YA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: UpxAm9EWakaHwFO_u4K7jNW4-4YyjOGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfXxiPseFxrzEwA
 w19Gp3ZB43Ly+aAxuMX0j41WwcFzsjII7OI3FUZBPrq7bfumQRu6UjRmuA5Sd8f6JMcfXkmEk9X
 bap1yay9lpgiB2gAIUMjzM61HAF+JrMdfNyAF2xDgGbjXgUXb9mqk94S2fJ6d6PJ7EZ1NpqseUX
 CLXLCKf22T63uUip/4FIhQ/vf3ALl0EQRc/8voA9Iwp3gID+Ecc+wBOWfX/Qf/Q58MPRfjsh2mP
 sYbtwaul1JrHaZwjTxQx1bIqu82Jnxh+xiTx1XFEpl2G5o7yOZmwg8cciQuePyvkVgSvegdZ5s0
 CUxx0fMgMjZKdGXzBusyeEy4wR8/6VRg9IS3UCE8Pi4/062C17pf/qk+Cs9z4KKNId2RaPIMGoC
 5qn3qmnzKJCSMkd4UQ7UH8ZQndmB15TCbdBD4KMJmt/LUGKMUF/7PU0bJ3Y1Ja4pjuectfPHnZR
 O2zqXrVOlm60fWKrwuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110062

This series introduces the MHI PHC (PTP Hardware Clock) driver, which
registers a PTP (Precision Time Protocol) clock and communicates with
the MHI core to get the device side timestamps. These timestamps are
then exposed to the PTP subsystem, enabling precise time synchronization
between the host and the device.

The device exposes these through MHI time sync capability registers.

The following diagram illustrates the architecture and data flow:

 +-------------+    +--------------------+    +--------------+
 |Userspace App|<-->|Kernel PTP framework|<-->|MHI PHC Driver|
 +-------------+    +--------------------+    +--------------+
                                                     |
                                                     v
 +-------------------------------+         +-----------------+
 | MHI Device (Timestamp source) |<------->| MHI Core Driver |
 +-------------------------------+         +-----------------+

- User space applications use the standard Linux PTP interface.
- The PTP subsystem routes IOCTLs to the MHI PHC driver.
- The MHI PHC driver communicates with the MHI core to fetch timestamps.
- The MHI core interacts with the device to retrieve accurate time data.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in V2:
- Rebases to the latest code.
- Patch 1 (bus: mhi: host: Add support to read MHI capabilities) which
is dependent change was brought it here as the series which this patch
is part need to re-designed and will take time https://lore.kernel.org/all/CAFEp6-0ik4B20cRyid9w0f+UgibGciPof9HCWTJ=uBOPvHG35Q@mail.gmail.com/.
- Link to v1: https://lore.kernel.org/all/20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com/

---
Imran Shaik (1):
      bus: mhi: host: mhi_phc: Add support for PHC over MHI

Krishna Chaitanya Chundru (3):
      bus: mhi: host: Add support for 64bit register reads and writes
      bus: mhi: pci_generic: Add support for 64 bit register read & write
      bus: mhi: host: Update the Time sync logic to read 64 bit register value

Vivek Pernamitta (2):
      bus: mhi: host: Add support to read MHI capabilities
      bus: mhi: host: Add support for non-posted TSC timesync feature

 drivers/bus/mhi/common.h           |  15 ++++
 drivers/bus/mhi/host/Kconfig       |   8 ++
 drivers/bus/mhi/host/Makefile      |   1 +
 drivers/bus/mhi/host/init.c        |  60 +++++++++++++++
 drivers/bus/mhi/host/internal.h    |   9 +++
 drivers/bus/mhi/host/main.c        |  97 ++++++++++++++++++++++++
 drivers/bus/mhi/host/mhi_phc.c     | 150 +++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/mhi_phc.h     |  28 +++++++
 drivers/bus/mhi/host/pci_generic.c |  46 ++++++++++++
 include/linux/mhi.h                |  43 +++++++++++
 10 files changed, 457 insertions(+)
---
base-commit: e774d5f1bc27a85f858bce7688509e866f8e8a4e
change-id: 20260411-tsc_timesync-f877a0394393

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

