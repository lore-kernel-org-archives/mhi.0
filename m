Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E738829C327
	for <mhi@lists.linux.dev>; Tue,  4 Nov 2025 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234756; cv=none; b=kMZq1T/cCDX1HhuUPjHDx3E3NQpskRRgvI6XQatbYAOXDw1hN2XMM8aRIavVM/8PkQk6Qidjtx8T6eZXGi1ybqOms0R2Bey605qPOMyvZXukzmvjS6g/QPcUfQTo3qz0qdSFvf6n2zE9YwZsSqUAaCu68dlcO1DtpZ803ISiXxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234756; c=relaxed/simple;
	bh=4wypx3hFOMJo7ulJl2NyPqUYO+r2VbZcHKF5EpBIwik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Io0XYfVSHmnexOz8vWK1xTKtLgYWKWzFW2N5WOudRuK4lkxdtXOeClJuCIPYYln3138X5D5jEg+drmJlNbb8KA5XNkKDpJJqDQVGEwITMk+f/Y/fID3dK7l4etFLvk0M0Ti0384E1Evrwi4HZaycnTLKyH7G3No8MLA2NiPYXN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUSIZmJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fC0SNDUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUSIZmJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fC0SNDUo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A45GDUT1059723
	for <mhi@lists.linux.dev>; Tue, 4 Nov 2025 05:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TRds64AGy6m3cdwYYylG2Z
	LbGaOlzu+CE5MUJYzis1U=; b=eUSIZmJVDAAim3CkAqWXx4Fnp7FyJ8GSYfrx2t
	C+pW3c4RVkXxmuYk+jr4vQo6HlAtTMcF/gr2L5xvIyYlaBxJoLtXU42jNtaUp5AI
	WHUIJWhk+0Ak/uGqwA0/vUMOhqVcjEsT17Lg/p0L3h+c8hOetFVxS2RYpIZkJsot
	oTjSq6ls4l+wnMO3OaYy7JQp4972NCLcPA3kg2sf7YwI24ZCvKNi4q/3xr3M0CeQ
	BoJLxhD6B9lChLMnLfL0W1oh/JtLZ/bvBLmIQ4rH8/O0Pd/CpznLcV7RKXwew9bQ
	FXbZfXjOzX14DTx8UmmknweMYwM740geHja0aOyvreJoAPtQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7b6pr1k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 04 Nov 2025 05:39:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b993eb2701bso1945960a12.0
        for <mhi@lists.linux.dev>; Mon, 03 Nov 2025 21:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762234753; x=1762839553; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRds64AGy6m3cdwYYylG2ZLbGaOlzu+CE5MUJYzis1U=;
        b=fC0SNDUoYA4VyxQ0yZlTL2JcQNnFfU3Oe88o7Yv/t12OnQgGpXqMVP/LrRbisNGL2O
         Kg0vy7NO8E4wg9ad7yIL+SdLr2DLwFsJxi9blLStcZS8Zagn3bAwXbc8XdSO2zxND7Ir
         sA+ewlOSxn3yLE9C/VOWUU1tlQVINp91KoeYyoZrT1FgVPyxHyyaATKwgekRKrB75CK/
         67DRP5M4BUZeib7kN9e7MNwsc7EWBZTEE1bWpI70lyaYzdloU6nHEwYGbKkse3kBZxRy
         qa5oDyo7Qs/BjVbXkLLAktrRufx1yDvLlWjCRBt8l3p+TQgJ7Mci1QRA4odWpWHjmum8
         XlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762234753; x=1762839553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRds64AGy6m3cdwYYylG2ZLbGaOlzu+CE5MUJYzis1U=;
        b=LIS8SxetvuWtLelaFoz41yAkFHHllsjEBstopFUoWExRXNN9lIuGWZUw9icDvQtaA6
         eS37HX/gZFaqwAPlS144tZIicxJfMGa58ZAl2ofGiBUPk3ghEl+0uSViVSGjVl/PD4qk
         1bOKLSmjyroHSJTzrCLNPxuE90SDlRE1NWltpA5CLc/QRcidmGY25hEHdc/YE348GiYv
         BvSdlPWO+2IhMiHZUx8FiSkMg+DnAgi95hCu+6wbHv74RwakVSlhln7D8o5b5qvV69cE
         7OeH9fU2GSB5UILvlj6dOtFNI+uTk5klhZf8uKklpA4882GCJfhnVyszQdMMznc+Qtxi
         F3vw==
X-Forwarded-Encrypted: i=1; AJvYcCVqA7M575KxYLMNUkZmTvavC/c1AmkTIZNJUBf56HxPxhAa7i04//B7ntkbI0JlbmS8Kgo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn1gS3LXbSJ/ly7QhpgWE2l4H42CNHgyMzFwbM6NcDes2MNAM8
	b95pN79EOvpVkV1XjUjmkVR8O4uVso/RNFySsTIOP+PSSGZnoWhUutVUdBtpmBRC5Y6QX5+KsbG
	r5Tb5DD30M50CTbLOGv1II9pTPD27k6WYiC6J0FWWZZcEpekAj81ZGlU=
X-Gm-Gg: ASbGncvD+Yk5Ruia7nntC4oMaZJB/clITg3Kw094ZzUPUJ7xO6gGUdAueQzPlou5DSn
	/3WHCAfOly/fT/Z+xz9XFwjRiKCBtPDpQe4grCkmFiXbd3aPAi9o/K3nAKFZPPsl68T7OFToilP
	xepK7REGEMhjRiWbgBMHIVgMlxULbw4KpF2uf8IW9f9pHoI7tsMdPDweTMwEFoEdSqLftbVP+8o
	vGSRLebCcspfZz2dkgtFG9bg6c6h1QCENPIF9IN9tURQRRM+L7nmAZvlnVInLl5+9UECfTNevW7
	6scWhD3F/aHrY1eP8qbFYTKNSqWGd6kogx+h8G90EwIkvrWpOZ+W4dR7cFEG4sicfvO+pVDHQKz
	bniAHnze03UmsdDlxqTF3jSa9
X-Received: by 2002:a05:6a00:189c:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7a77474c916mr20027908b3a.0.1762234753243;
        Mon, 03 Nov 2025 21:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyPkuj55Yb9/jYE/3bTW2iGIwFodzrtCBKrGVxOUSEsI1GcmfNr96R/gHVfwD51Hgach8Htg==
X-Received: by 2002:a05:6a00:189c:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7a77474c916mr20027866b3a.0.1762234752604;
        Mon, 03 Nov 2025 21:39:12 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3150f0asm1462402b3a.2.2025.11.03.21.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:39:12 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/3] bus: mhi: Add loopback driver
Date: Tue, 04 Nov 2025 11:09:04 +0530
Message-Id: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiRCWkC/33M0Q6CIBTG8VdxXIcDBMOueo/mGsEhWSom5WrOd
 w9tXbRcN2f7zvb7jyhA7yCgXTKiHgYXnG/jYJsE6Uq1Z8DOxI0YYYIUJMO1991J6cuxqRw2AEJ
 YSwzPGYqk68G6x5I7lHFXLtx8/1zqA52/nxD/Dg0UE5xzo7Xk0tJM7H0I6fWuau2bJo1nzr8tZ
 StW51DIKEGp7R/LshUrcyptRi3nSv3acpqmFx/+Or4nAQAA
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762234749; l=1702;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=4wypx3hFOMJo7ulJl2NyPqUYO+r2VbZcHKF5EpBIwik=;
 b=UIEZW5wivpSBIqHH3pF2Tllc7B4the977GG8y1cyzVSg0ZzPZtlS0aBpyAPZiHPo2EjH0vXuE
 1HqYq3m0ng+DysFVkWBa4OmkF6N1M5h9zBA4089Kh/XEz4v4J/EBGgI
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0NCBTYWx0ZWRfX27HKQficfOlf
 gyo/zDEKr3Uqf+FxsQ5UP1dFfhto3KaX8VdstX6lZchLUhHr09tFuifPcmJBGsgF+OxXKdtp7lA
 K80lxSjVsiYGe9pBJDkGwNXa38TGa97yISlIytO0tN7eGXhypNKE5IwLoVn0t7Xn+GGovQtYhB/
 cscz0PVT/ikgeryrQw16dGOCwtmYFE4I1/6So9mR1vsV59xaesygqxYmHJj3tTfFyKFA7qhCQS2
 C/tdlJupTLINdDoic5flfimqS+SqEn0VeMFCp/oddyB/hAoj+JE1iblrXG/Teq37jLLHTzmJctR
 2zisjCtQ9ryhieR8YdtGC6bd1LEiT1nYEiaJ5Z9kYg/RZJxvT7cgkY0tlqJXGPh6qszyNO3Y5qJ
 MiVc7WgdFaTr7zyw9c3g3r/DnIcOlQ==
X-Proofpoint-GUID: koaNhxO5atRFatfUc1IRNhcQWTSBgDmL
X-Proofpoint-ORIG-GUID: koaNhxO5atRFatfUc1IRNhcQWTSBgDmL
X-Authority-Analysis: v=2.4 cv=Y4L1cxeN c=1 sm=1 tr=0 ts=69099182 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Kxh_h3bSnmR7gis_oVoA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040044

This series adds MHI loopback drivers to enable comprehensive testing and
validation of MHI data path functionality between host controllers and
endpoint devices. The drivers support configurable transfer sizes, TRE
chaining, and provide real-time status reporting for thorough testing.

Testing is initiated with sysfs entries from the host side and results are
reflected back in the sysfs entry.
The device side driver echoes back the data recieved.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: Add loopback driver with sysfs interface
      bus: mhi: ep: Create mhi_ep_queue_buf API for raw buffer queuing
      bus: mhi: ep: Add loopback driver for data path testing

 drivers/bus/mhi/ep/Kconfig           |   8 +
 drivers/bus/mhi/ep/Makefile          |   1 +
 drivers/bus/mhi/ep/main.c            |  23 ++-
 drivers/bus/mhi/ep/mhi_ep_loopback.c | 134 ++++++++++++++
 drivers/bus/mhi/host/Kconfig         |   7 +
 drivers/bus/mhi/host/Makefile        |   1 +
 drivers/bus/mhi/host/mhi_loopback.c  | 347 +++++++++++++++++++++++++++++++++++
 include/linux/mhi_ep.h               |  10 +
 8 files changed, 525 insertions(+), 6 deletions(-)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

