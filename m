Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841AB281369
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070768; cv=none; b=cxXeW12sMwxZATV435ptpea2kYr40EZshsy85aogdxRgiQ5cToOhWBM7knbksQa/eyLz5BtuZe/C7MKd/e6AWizKtH3etLM6lbQfLqApGMLUt4Mbol8+Ofj4zKv+ZdJLNSxPzRzFQOjk4Lxsj6Wa6sQQDSjE7pP6NfggtGfIvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070768; c=relaxed/simple;
	bh=aJxirnbNcHCTGQAzOkuWdnaSgHbxG02cLAcbEiAThwA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FzJkjoLxgX9MsD98t4UaxJP2J3QSwt7o82qhjqQIyj0KTz/TiTP6aAxpuTsyMndslMS3eojMKKd2+CgS2A80K9BJwWcE8V/Rg5/bxjAFzkkihL1WOliUG1cE1aTSPIKVj1buGz/v649qYiaHFjrUUYP55H/BjDfvWwiRe8d/QLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fs9CU++/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFCOqWh1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fs9CU++/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFCOqWh1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2fOFh4099132
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A9D8n7DE9A0Sh0miK31fep
	Ao+JIWEARRrQAJ6KzZWcc=; b=Fs9CU++/ipOEvC3PgD4mHHje7FLmXfx5gUuTZ2
	4sebC06IuXBr7TcwVeqR0LQ+69sCzflvcetSytDtM7+vHzvowhhoSxTDz7JXJcc/
	SndsR1LTiHCv/fdRtprXENU55vLdz6rHvcHt616Njcstc1CMk4nbGPshiVRedEJQ
	/jIh+ATrQmrEy8qcW+vpBW5S/nfKie6F4YI2Ir4YuyxSXjv0TMnsSE4Z8C3vBIQK
	CFb0Q5A4F+8GSHrUPc6gjK0shAlrZb3MRA+2YmG4CzNBVwv0kk68vPzFxS09Cq+Y
	pkh41zWSlqfQGB71WwYpjEPfbgmXIvq/AxbAbdjGpSfnx9Aw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jw4yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:52:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso102054445ad.3
        for <mhi@lists.linux.dev>; Tue, 09 Jun 2026 22:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070765; x=1781675565; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9D8n7DE9A0Sh0miK31fepAo+JIWEARRrQAJ6KzZWcc=;
        b=iFCOqWh1q5hWGJUW6sF7fVuNeNa5tdnOCY34eOrmVm5TNygvcYxvEEomDY8QOWi7YU
         oyv11D4ufDlf/a7ifC0arLgbcj66iC5fVJSlTkHQrfJUfpy1zB1uXJQQ/Xy4FYBQIrIR
         M20IUrYBW6jOhLNxyaBuQ8XTfEK1zKPy4Bjun8ideABDcS/c2cII88ZR7QmLdGtOfczl
         OSNwlvTJAi+n7rPf+rJPdWy5k5rAiTD4a3WEDxWi9pmF3wziBy+jENbL/ElqwdGF2ZKw
         lOloweb0f7HLzrdbsoa6TdBAvdpCJfq2a07qvb9zTT0qXT5+poUoLbcBH60U5VyKp3q3
         eIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070765; x=1781675565;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9D8n7DE9A0Sh0miK31fepAo+JIWEARRrQAJ6KzZWcc=;
        b=qkdlzC2FNWp2KwR9v6Fo6N925CmTf4UVC3Ls03Hj21C4hBDDnd8wED736lGeJcSdpn
         FHKoyq5HyKLDhE+rS9ze0ksD9LUYs1DDKFY/SU2n4qZDKG91BNVfd/yJs7Si2RjaKUOm
         FImlAIzOf+jMDg4IjMHcR1YY5xY+Uy2ghW1/Drrtn8dT6G0qlUu83okYu1IxRRvD2YDv
         FJw3yIftk0VJ5LDurrLZNhm8Fmjd/Gf3F7RC62XVGiMJhCvwOLIM8lXXvbad5IsVJfPz
         YcQ/cASvTen6OpRXDRh+xpiG7Txvv9Z5miZmkjCgqLA2s1a17PKHL2dXjNpYNvxOLEye
         gTQg==
X-Gm-Message-State: AOJu0Yw37r0k4AQ03LN/MefqRO1i+NSSyVQXfIdIYEp5yvw5ajkHTFhN
	BhMKybflj5r8pDfl6VZJ2N3yoMdRd//irx+fuxTnOpArqP0pkfG4RimcGDux5cRO0M4jdvYtM58
	tlLOpDrP1dzTEi5rSmhUZWm4am7WD3c786mb49LdvqXQ3qZ9lGuK27BA=
X-Gm-Gg: Acq92OGRUCZ6+S+T1nnFzR3bOJO0+i+yQVa9ODGmlSgKcWReYE4SR5zR+4rZigoVFul
	kmMjrGIu6mugCbXUs7cTDD0xSTLtFBYb5c8treTKO1EwjZIP8Tp5dnF7PT4/O5vE1oda5lavPdY
	pVfPDTATHahNMT8wqt5+/3fPMzRkD2Y1eTaLBgaQSJ5k0ssfDCwmFNqrTWU0ajrQrGyx5qfxU4b
	DeZYYglusaLCG9ST0vEX8MVti5vk1wscCeb3vm6ZJHf0d3LUuKBvRtDDJevSG03NVan2vLjj1Xj
	2aQjtAmhutOOqIG7YlIrRJS08zgtID5wqOfS7g7n/xEco0O0axmFGcplryySPF8aON+EDE9GyQq
	9jyriHMnRgyYyhlfSqhI52zch9HzwxVGxHT+zXAcxokS7LTWzTRHtUwzNDg==
X-Received: by 2002:a17:902:cccd:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1e80e41ebmr256115135ad.3.1781070765508;
        Tue, 09 Jun 2026 22:52:45 -0700 (PDT)
X-Received: by 2002:a17:902:cccd:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1e80e41ebmr256114835ad.3.1781070765005;
        Tue, 09 Jun 2026 22:52:45 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm108601105ad.45.2026.06.09.22.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:52:44 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v3 0/3] bus: mhi: Add loopback driver
Date: Wed, 10 Jun 2026 11:22:24 +0530
Message-Id: <20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJn7KGoC/32PywrCMBBFf0WyNiWvpqkr/0NEYjKxQWu00aKU/
 rtpRUFa3AzcgXPmTociNB4iWi061EDrow/nFPhygUylzwfA3qaMGGE5KQnHpxAue22Ou7ry2AL
 kuXPECslQQi4NOP8YdZttypWPt9A8R3tLh+1HJH5FLcUES2GNUUI5yvN1iDG73vXJhLrO0hj0b
 5ayGdZIKFUiQeviD8v4DKskVY5TJ4TWU3b4o2Xf7pROurPkKFihubNlOi9mHH3fvwAqjxfAawE
 AAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070762; l=4135;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=aJxirnbNcHCTGQAzOkuWdnaSgHbxG02cLAcbEiAThwA=;
 b=wlgCpWlNqvmyelir7a8kKrh2sM1qoXr0uX07minwR5JAzWg1oWZDpPii+WVb7YRLQSumWODDz
 eJwqxeE768IDSmfuOIdVlpcdAkQoeX4ik+NRNBzNoso6M7+c20F2FGK
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: 3VKSPxIvnpNdq0uexzULWr0SUoWcJZPR
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28fbae cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bOyLq1Ju37NIHqrd0P8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX7v1X5YaiUZbV
 +qmJbeKD9bUe7f6meg1L4EYstItIySt9X8MFkCBFZb8VcX6aOvMpPgIF7VO08dY5WSgRrKuA2tC
 OLyBbIQ8CUFHyOfgYg9GgVmiCoqK27yfRo6Bou6GLhAbS6iQZPL4fmtr5IPq3hPXyG8mbQcMJYo
 oUgKnFVVGyY8FQozZ9l1ChuTCs+bwH4LssqN2U7Hc7QExraKTfZKnZkVofz7cyL6vsI+h4M9Iih
 FbEYSzb8lgWJb+QUddwvDqUK/7w53hy/9g204Z0BcA5j4bM0II3V3mmC3UQVuZ2eiWJ+JBijbQa
 KUCHcHzeRIhtz3WGfrfb3CO3ewDZgyGLy1tq0rHIG+3THpGOfu2lux3wUnxBJ+D8tga1Yj03dWz
 e67fLJtCtTHL82fIpBxDW0Srj6SlXFKuq6MGlwtbPz0JgPOLvRKAYQ36LFJn6vuxX5e7mqUjjF7
 MOKXZ750Zt2S5j9DtwQ==
X-Proofpoint-ORIG-GUID: 3VKSPxIvnpNdq0uexzULWr0SUoWcJZPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052

The MHI specification defines a LOOPBACK channel that is already
implemented by MHI-based devices (modems, WLAN) deployed in the field.
The endpoint firmware echoes back whatever the host sends on this channel.
Without a host-side driver, there is no way to exercise this channel to
validate MHI data path integrity between host and endpoint.

This series adds drivers to exercise the LOOPBACK channel from both the
host and endpoint sides. The host driver (patch 1) binds to the LOOPBACK
channel and provides a sysfs interface for configuring transfer parameters,
triggering a test, and reading the result. The sysfs interface is stable
ABI because the wire protocol is fixed by the endpoint firmware already
deployed in the field and cannot be changed.

The endpoint driver (patch 3) echoes received data back to the host using
a workqueue for asynchronous processing. Patch 2 introduces the
mhi_ep_queue_buf() API needed by the endpoint driver for raw buffer
queuing without an skb dependency.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v3:
- Move ep driver to drivers/bus/mhi/ep/clients/loopback.c (Mani)
- Move host driver to drivers/bus/mhi/host/clients/loopback.c; keep
  module name mhi_loopback (Bjorn, Mani)
- Add ABI documentation in Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  (Bjorn, Mani)
- Rename sysfs attribute 'size' to 'tre_size'; add 'max_tre_size' attribute
- Update Kconfig title to 'MHI LOOPBACK client driver' and describe that
  the driver binds to the MHI LOOPBACK channel defined in the MHI spec
  (Mani).
- Fix memory leak in ep loopback DL transfer error path.
- Rename mhi_ep_skb_completion() to mhi_ep_buf_completion().
- Document buffer ownership semantics in mhi_ep_queue_buf() kernel-doc
- Fix use-after-free in host loopback
- Fix completion race: arm completion before queuing recv TREs
- Fix teardown race: synchronize mhi_loopback_remove() with start_store()
  via lb_mutex
- Fix u32 multiplication overflow in total_size: use size_mul()
- Replace kmalloc+memcpy with kmemdup in ep loopback UL callback
- Update mhi_ep_queue_buf() kernel-doc: note per-TRE callback behavior
  when buffer length spans multiple host DL TREs
- Move mhi_prepare_for_transfer()/mhi_unprepare_from_transfer() into
  start_store() to avoid holding the channel open when idle
- Link to v2: https://lore.kernel.org/r/20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com

Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 ++
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 122 ++++++++
 drivers/bus/mhi/ep/main.c                          |  27 +-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 316 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  15 +
 14 files changed, 566 insertions(+), 8 deletions(-)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

