Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62F37F32E
	for <mhi@lists.linux.dev>; Mon,  3 Aug 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753122; cv=none; b=mA04+WQIWE+6zMo4xBsPDHhOxOnBscO4rKkVqkNIVEZ19MjYuBgvvzCoHSvYmNTINnXMUBqCy2CHvFg0Nru6E9+dRd/7813JjuDz8PkYdDZtTv6fT1F9keFNDR+A4otxlMjEW/hD454CBGoRf88O630xVJCXNp2zRYv4470pMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753122; c=relaxed/simple;
	bh=BGCmXbHhxIgOfT5cff3VPGGTbFd1u5HedyxcoL2ElDM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S4TUfIFeyoz/2u1XIeUJrhc949evH68rHq4uhY268NPndBAr67+n38PsfHphr3fA7wAxCeiqkmr88lLQKqT4jI9gZYb0axioJIEWQjrTttm9URG+2NBU7LbH3G7vKPzxkqyqwun+46kxDZahDqd/kf0B6/tzaCBft6EalVITdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTuA/tUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HH00/CpY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTuA/tUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HH00/CpY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737InEs3960707
	for <mhi@lists.linux.dev>; Mon, 3 Aug 2026 10:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zgHwwbNKVvtriJyQ8oychC
	OjzeAxXuw2oCV9B5T/Egc=; b=nTuA/tUkTv/kamyHndVR7iTTpjWBZxWkLVHFoZ
	+KxsEtDXGd1jMDB61ZqbkuBHl63GSMp7M+SHbgFC2f0kDYfjuzi4nkxDW5Ji3AQC
	Ew2qsZU914v1UgvGPBllhC+Q+Xrh7WdcME8CIqGGjDw3vm/tSlGUdqk3Ufr3O1Ku
	N5Dwq4+QLP/5LRPCTATe2OxUwAnZadmXoWQn2f7lGKBdIh3lS714pChEZA0U6VIz
	zK0B7hMljT3GYWQSYFd43T1VlACI02QzhZ9tHWzLwhmXlTfKHkrrXBpClqmUdPaU
	7BJ173iqDEvjMCDHu1g6jd1xQYVxPLTdSxyAj2BnOHeN8fAA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajqv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 10:31:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3219768a91.1
        for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753113; x=1786357913; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zgHwwbNKVvtriJyQ8oychCOjzeAxXuw2oCV9B5T/Egc=;
        b=HH00/CpYkVwqCoVPrCpbZ6VfeB3tgT0ihvkGLWX9TtLNmJPJWN++S9kB/+IoCLQnxE
         gC7OBxrQapl691K5NY+4JS+W1GrgoxpuJ62WzV1rzzRV3Zk5pJWuulcfgGw9jaDkC+zd
         BMV9upV5UbAm3dAwpCjnskNJb0CxYdgYsnA55S7d+ou6MdmITpeeD0YYY3V+agipZgpJ
         jMIpLAHtdQVsWYdyVTSNcdb/W+lRxBLgUZx1dMwSbActqQTidSPZKmGlkIaCuV8KDlo8
         pgYEiGJNKCP8KojQ8hNj0BXWqBinGZuN/LTeE1l3twLlvE3o3JaxDYnFidMQ4DXwcDUf
         z3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753113; x=1786357913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zgHwwbNKVvtriJyQ8oychCOjzeAxXuw2oCV9B5T/Egc=;
        b=DM9IkPRtTO8i5hbAmSCLNaINsb7rMAiZQDg1D5lmr7LF3ORdsXDFU6XnC+UHG+PJOZ
         arH3OMKJ9E6XNA+vnInE0XkwZv55DtzVB+7VDhFeiYvvZhOXTPw0Un6BDCJInvdzCLqc
         TBTRyPTvapK0pztd5OI5UGaNQiLnI7Lj1ZrCwYFXeMgmqXVZ2LJDMRiGjmVs734E7uWP
         aVkSIrI6oSyc1NzYkgZEABM6o7/4foUw4GnbCAj5PW337xeaP3PiprBY0dXvQJOyPoTX
         ZwzUfp5aGQXcIngop0rjDgx7pUffq6gk9sTqkRg56cC/NdqYwb27pgAB0Wz72DKrsfHy
         OoLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSxoNiXiYzHHxKTzO8krnkfRfOQrZkGD6V24zjTBKF4u/psgiShjLIp2maDBUIm1YlTqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdeHgOfM+v1cFOzeDhoePZIDlfb78v9vfhmbLeN2rhZmc+D9/n
	bRU+AxohsAkzan4KHgsewRN/8dv2ckSKLSlQzPBMegm02Gd3sYtUJmWCqklDHZwfpG9JCuPdh4x
	vlvwmt+KP2L/dj+J95oqR+XqU3pbRVryNGzYA6/uKoO16O1gjgQGw8LE=
X-Gm-Gg: AR+sD10DulgL4d7iJ+LdZXHFZfxW2m68LITneH9SSRHtUF8fAIHradYVNqvQ869WFeV
	/+7eOwxST9xLsRiE7T1Y/o8bN4Ae4P5AkyMu0I+EmeDb/WLJdyd3bwF3iqNqifZ2AWVfhgeMyk7
	DlZ/iAQcm1b/jWzeggI55pUX00HhEvvO7tu3YJO2wAonRLZf/NmljK48VoNUaFDypRtOJ+41o9W
	v5BgV9nT0QG6FDwpPGD6BDC+WwynxTjfO0dr5fMuneNuXRtTg03lcMQTLlBb3WOfQDO0cxWpZxp
	rxavd8uhj7uqOPcqS7aq5slM3o7lCCXiMsVdfZ5J0SHfwafkTN5bFwdJ9r/zYGBwDN0wnTrEc1i
	fmMzKW4whA4fVUC7+c7aFzLeMaA==
X-Received: by 2002:a17:90a:e7c4:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38fbc4d976dmr9020457a91.25.1785753112656;
        Mon, 03 Aug 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c4:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38fbc4d976dmr9020430a91.25.1785753112056;
        Mon, 03 Aug 2026 03:31:52 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:31:51 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dmaengine: Add batched scatter-gather DMA support
Date: Mon, 03 Aug 2026 16:01:42 +0530
Message-Id: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5ucGoC/22NQQ6CMBBFr2K6tqQzFYquvIchpJQCTSjVFoiGc
 HcLroxuJnk/eW8WErQ3OpDLYSFezyYYN0TA44GoTg6tpqaOTJBhxoDltLaytFM/mjK0VCGILGV
 ccIUkKnevG/Pcc7cicmfC6Pxrr8+wrZ8QMv4dmoEyCies4hOtBTRXF0LymGSvnLVJPFt+dzn8c
 /NGVhWrQYr0/OsW67q+Aeq+ncDrAAAA
X-Change-ID: 20260108-dma_multi_sg-c217650373c2
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=3409;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=BGCmXbHhxIgOfT5cff3VPGGTbFd1u5HedyxcoL2ElDM=;
 b=3ePDXcG5W+TskRXsGjtBwRB+Q/3qztjHur37oK0opgOyU90+NOpk8t6FzjwxRCSn0ogr2u4Fb
 V7lOTbCJrx4A13InzkcAnsKJbnysxPWhWqpGWIrXoTb9iXUORuesWIL
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a706e19 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mBxW1p0v9Tj6UMWjSKQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ezFEb7k1C6EusFpJAjWOYpnPT_Kie0ye
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX3dIY6TNMU6Mg
 0ZySR6Fs+Vb9FvEupZCHaJpGxYHTzkXUzHwa3pfgqsVAKOOK9pIzvLJlDjvvtGv2E1W/1rmQmWW
 BuLrWtjB928unUBzjSrj+wD7nn8cpLE=
X-Proofpoint-ORIG-GUID: ezFEb7k1C6EusFpJAjWOYpnPT_Kie0ye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXyRISauZ/N+At
 Yfb4iOdeEdsDNTg9GX1Ke15m0dt0B3G0kibbbh/I3226m1+Ci3l6CW1lXkR85pOEa4r98G8i7aX
 Fhs7r4yAqKP7YcLPYo2tgPtHyCPlxRW879z/Ra5cwfQV3GU76KgVHl7pn6TjfdVc7U0CzQsQhNp
 rPClAa6aq/NS4wEJLBMLJ40g+t1c4Ga+O4SMP/yfhn16NrmnlDDbzVX66YqBhfCn8NE+JvznehW
 bIliM4lcvNvWQlGFMCPCokQ7qOwLW7Dco9KGhRAwIGvAS11rO0aSTu8SrJFNBVW+bKvmlikY0qL
 H31QbvXe5d74luvkWxsjWxNlFBpihTub6ZiMWIISvngpgaSxJFaFY3zrJeoKUXla7fMM2eDqp2h
 7/UQciCnUqttA2kYYueBOf6NUfQMrxmQzv42636XkqvsQUsdcJiP+M+veBjYsCFgmnx7GAxVBDy
 RUXe+tVk50Aebh9tXZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

Synopsys DesignWare eDMA IP supports a linked-list (LL) mode where
each LL item carries independent source and destination addresses.
This allows multiple independent memory transfers to be described in
a single linked list and submitted to the hardware as one DMA
transaction, without any CPU intervention between items. The IP
processes LL items strictly in order, guaranteeing that
scatter-gather entries are never reordered.

The `DMA_SG` transaction type and `device_prep_dma_sg()` API were
previously removed from the dmaengine core in commit c678fa66341c
("dmaengine: remove DMA_SG as it is dead code in kernel") because
there were no in-tree users at the time.

This series reintroduces `DMA_SG` and `device_prep_dma_sg()`.

The reintroduced API takes separate source and destination
scatter-gather lists, where entry `i` of the source list is
transferred to entry `i` of the destination list. This enables the
eDMA hardware to process all pairs as a single transaction without
CPU intervention between transfers.

The primary use case is MHI endpoint ring caching. When an MHI ring
wraps around, data spans two non-contiguous memory regions (tail and
head portions). Previously this required two separate DMA
transactions with two interrupts. With this series, both regions are
submitted as a single batched transaction, reducing submission
overhead and interrupt count.

The series includes:
1. Core DMA engine API and DW eDMA driver implementation
2. PCI EPF MHI driver support for batched transfers
3. MHI endpoint ring caching optimization using batched reads

Expected benefits:
- Reduced DMA submission overhead for multiple transfers
- Better hardware utilization through batched operations
- Lower latency for ring wraparound scenarios

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Reintroduce `DMA_SG` and `device_prep_dma_sg()` instead of a new
  API. (Vinod)
- Use two parallel scatterlist arrays (src_sg/dst_sg) instead of
  extending struct scatterlist with a second DMA address. (Robin
  Murphy)
- Add explicit eDMA LL hardware description and ordering guarantee to
  cover letter. (Mani)
- Link to v1: https://lore.kernel.org/r/20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com

---
Sumit Kumar (5):
      dmaengine: Add DMA_SG support for multi-buffer scatter-gather transfers
      dmaengine: dw-edma: Add DMA_SG support
      PCI: epf-mhi: Use a define for the DMA transfer timeout
      PCI: epf-mhi: Add batched DMA read support
      bus: mhi: ep: Use batched read for ring caching

 Documentation/driver-api/dmaengine/provider.rst |  21 +++
 drivers/bus/mhi/ep/main.c                       |   3 +-
 drivers/bus/mhi/ep/ring.c                       |  36 +++---
 drivers/dma/dmaengine.c                         |   1 +
 drivers/dma/dw-edma/dw-edma-core.c              |  87 ++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h              |  10 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c    | 165 +++++++++++++++++++++++-
 include/linux/dmaengine.h                       |  35 +++++
 include/linux/mhi_ep.h                          |   7 +
 9 files changed, 339 insertions(+), 26 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260108-dma_multi_sg-c217650373c2

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

