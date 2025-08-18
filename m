Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC920273804
	for <mhi@lists.linux.dev>; Mon, 18 Aug 2025 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500170; cv=none; b=vFgivt1ds6B5GFv9AIaVZ2mGz4PTERcMDg84yUzeS7j8tz5py9ERldmqoMCa0O724clWucuNOYj6KtuOzCVfaxxpImQt/gcBgMx65wFztHWmk3JmhjkwANX5bbNqzR0FfWOHVEOvuUM4wTcQbZm7sDUA1JD2ohoXDFUCBSw+w9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500170; c=relaxed/simple;
	bh=XOmyi+HYU+PbY5LmpbbgTr7t8C098ZGYJ6WBPF2+jjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZS/a0Dgr5h9CXMAlUtYY7DHGqRu191hGm4rully/hWcnYDRCigetfMbUlON49el3tWd2GU4bOwXaHhwK337/u4D2ediQLAYy+u0VcFeRh539+nOvki+d5JpHzQXfbfRCXgBZD1l5QuZOwLlNbsDytzbw2UHE4aTXs0KK12RIn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiNL5KUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiNL5KUr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HL7unN008998
	for <mhi@lists.linux.dev>; Mon, 18 Aug 2025 06:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WxPU8jx/E0ugmv2MkSniZJ
	rHGnhtr+rttbyBasPDL9A=; b=BiNL5KUrrfdCLAgHH7n9kxYZ80sZ/Zogv3GKRX
	Z35fnrBD6PjvaK1+2jwImLqo+TAkEk3pLNtNv3WV4JTIzbNi6vTdW9L+KoEJxvFB
	1PhBIgRltdNiKqXZATjT5LYDAKPSKgrXONCNnO3LX6AdlDkMrLCDvmIj8N4mOluU
	0oU8gMNpIUUbNkefB41RmcD+b5VJkF2ZlkisULgcSRGtWnnov5IjxOJlIfgTQ10n
	4ipYvPaCNPD+qeBUezK8i2ZAuxtw0vwjo2lxZOETUvXFsQKxaCP1e2jIpN/gYHqm
	UHWJYLM58IufbZVI3bmhdafdl0Bp4pb+CLloc3m+Nl29e18A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfuhr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 18 Aug 2025 06:56:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457f54bb2so92519405ad.0
        for <mhi@lists.linux.dev>; Sun, 17 Aug 2025 23:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500167; x=1756104967;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxPU8jx/E0ugmv2MkSniZJrHGnhtr+rttbyBasPDL9A=;
        b=KOq/B7qDu5oMv1TomLLFZJPa/cjaKG1trnqkYjMl+6jWP5iMdJWMjtAi/LlTeW9jYB
         hOVQABbbbEriu2Str1OevwnHLVlXc3JTzU8GW2AocTO/xLjB3nBDO5/cxuxqLmHt74Gn
         Rp4o9jgRdU6cf4zmftCvpAF0ilth8pNtZ3hQuQIKpJnFlsIXlpq/IrjnSi9E4wDpuVlb
         jKC+6cpFZV8IjaIcTKRKj9XoiCOnv17Wq1cWJv0xSHLVWeKsqwjaWvxlxes1c53lHRrC
         eW48/HZKPLp8o2UT3wun0s8X82HQh19B1WE/fw9JCQCoq3dOFXhCaQQTrikYDgs6O57g
         1asQ==
X-Gm-Message-State: AOJu0Yyps1KYii3WK0Q+eHt5VHYRvvksbMGEfYRBu1etmrG19ngyfWX/
	6/sv4xXFashTDHgoq0R+23x+krrl63zu3O8cC2EmiM0IPu+HBPgLXduBUmddEQnYllKhvpYRowh
	qAmH8ycsw/2JHH7QiisGhQkaPyW8F5GH5avM/J4fm59Uiskosg0TeMl0=
X-Gm-Gg: ASbGncvGvVGzuygVz3DNEC6FmavIbEtETfRFI8wxgAAGKj6l7UJ40CRGPwY62nEzV3o
	iBx9T1b+witWc/FzMTyk8ZS3MItZ3duWqbJuKRBj9ZRR/AKjkeH70Hrci79wMfdlwZZLwiKMsWO
	qIDawodPFIdk8qtbuxUpI7EVg9bAmXsVDVS9jMhnAHr5k6u+xjj9iLwtYYIaxQIZIOeuIFZLMJf
	hMJ8WD8SptbtPcVyPLIO/ectxkNa1vK8bhIxnRW4YASymFZeA8A5girIJPnMP/S4NdWR/XM+MWO
	lY+Mk5ms7nnAGpGuXy7PZsYNj7xJhosM/46aQ9YYUyko8JsZP17MjP1yEaNRKYOyulFy+A7ddNg
	=
X-Received: by 2002:a17:902:ce04:b0:234:d292:be7a with SMTP id d9443c01a7336-2446d71ae4cmr187562035ad.1.1755500167033;
        Sun, 17 Aug 2025 23:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/5zSY5ws7t+A3f+gy43WCVEOiGAO+ZvVq9U6cZZhX1cPtu5cRz8y+ICKkzfGxpgl78kwstw==
X-Received: by 2002:a17:902:ce04:b0:234:d292:be7a with SMTP id d9443c01a7336-2446d71ae4cmr187561565ad.1.1755500166450;
        Sun, 17 Aug 2025 23:56:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm70240105ad.75.2025.08.17.23.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:56:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/5] bus: mhi: host: mhi_phc: Add support for PHC over MHI
Date: Mon, 18 Aug 2025 12:25:45 +0530
Message-Id: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHOomgC/0XM0Q6CIBTG8Vdh5zo2xFDzVZpjAoc8F5IBuZrz3
 WO51eX/277fBgkjYYKebRBxpUT3UKI6MbDTGG7IyZUGKaQSXdXxnKzONKNO72C58yjtpWldayS
 UzxLR0+vrXYejIz6ehc3H+Fd79jPnibQdF14baYxQTVP7c78qGPb9A5W6pQ+hAAAA
X-Change-ID: 20250818-tsc_time_sync-dfe2c967d7b2
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755500162; l=2651;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XOmyi+HYU+PbY5LmpbbgTr7t8C098ZGYJ6WBPF2+jjI=;
 b=JoWS9I/SbN6taF9CRgAUctPTUQ4cYTrqVu0GbCduC+/QAGxRWyWw30G5R/ctnppOLtRPikAio
 a+go/fBPmIqCZYM8fcWCySY9N4/0YJhOCAbXSrW0gUBLljb+ABVSdHd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: BnsG5dd1e9GKRKKB_3BdHNw_CUBP1tLC
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a2ce87 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ZFGd2MdK1819gLI47OcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX0ywGc0h+lKPP
 iotXcTnVzQ4yDsu9iWqdVYWvMMYV8UP/ywzjstHdoIMVSyyUYzoG3EgbQtPBvLrHFUtRAI76/Km
 XEmVt/JVrFflR2wQEbljfC5MvOyKvSiieWLDiBmtgVbX5pIJVTrqj8LC99kRuzAnCSdY69x8ON1
 Vq01ybwLZK4rzrPTQ26FKDJhYMFTqdrfa70KGtYtNzMnFqMfJZHxFLkDcg604o5MmR9wwYNQ9Pa
 BfBDjuWvafUxtQhsnuwZUZP4xVh9VhMOmq0Nk8hN+n40amVfQWfN0hTQ0RBujyNgaZlYQBZK2gw
 9laMcy6sJrNEypygwpzEQfTKci/dDB1Fv9gCvhqtsUFvkk+4p4u0//oQx6elj1PuVONnfmNxNkQ
 EisVPudQ
X-Proofpoint-ORIG-GUID: BnsG5dd1e9GKRKKB_3BdHNw_CUBP1tLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

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
Imran Shaik (1):
      bus: mhi: host: mhi_phc: Add support for PHC over MHI

Krishna Chaitanya Chundru (3):
      bus: mhi: host: Add support for 64bit register reads and writes
      bus: mhi: pci_generic: Add support for 64 bit register read & write
      bus: mhi: host: Update the Time sync logic to read 64 bit register value

Vivek Pernamitta (1):
      bus: mhi: host: Add support for non-posted TSC timesync feature

 drivers/bus/mhi/common.h           |   4 +
 drivers/bus/mhi/host/Kconfig       |   8 ++
 drivers/bus/mhi/host/Makefile      |   1 +
 drivers/bus/mhi/host/init.c        |  28 +++++++
 drivers/bus/mhi/host/internal.h    |   9 +++
 drivers/bus/mhi/host/main.c        |  97 ++++++++++++++++++++++++
 drivers/bus/mhi/host/mhi_phc.c     | 150 +++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/mhi_phc.h     |  28 +++++++
 drivers/bus/mhi/host/pci_generic.c |  46 ++++++++++++
 include/linux/mhi.h                |  43 +++++++++++
 10 files changed, 414 insertions(+)
---
base-commit: 76dc04ffefccd3cbd8cfd160d8f3ca2667fd8dcb
change-id: 20250818-tsc_time_sync-dfe2c967d7b2
prerequisite-change-id: 20250818-mhi_cap-3b2bb05663f4:v5
prerequisite-patch-id: c19893c69b10f975a4f675273f4277030a429d2d

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

