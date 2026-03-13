Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2839D2D8DDB
	for <mhi@lists.linux.dev>; Fri, 13 Mar 2026 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384577; cv=none; b=OwKhZfxBP79piQIBPezwnyLOHVmIabj6ud6DDddFuTmY/3aMi2hQNdyyQTtf71W3ScH0pb4sgzXMb+jkZ926HaL0NgDEpO+j332bGW09IRNb+dbzLGsx3+5Rt9yDXzik1LdOI06Rz1YWALk3Aht1T55CFgZ5JaJz2mzTM6SKpbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384577; c=relaxed/simple;
	bh=pvlk2gOPkIN+ITxicWXFZ618jc3EqUbu9jfuBJT+Pj8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MaadHMBAHVGcB6Pde24qD9r/xgBv3WxRwpnlR3rlHPoS4r4gfs9Pjjo3s/WYCjkhCoQapqgeFc0W/IEz4LK7wImuUN6oaLXezROKSidJE2rYMqEOQI4uyz2c29osXOehL+ANd6Zi+AEXbcMe4wZ/b6VFNnaOklffaftemyCwWdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJLgPv0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H95uHv+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJLgPv0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H95uHv+P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thd53342923
	for <mhi@lists.linux.dev>; Fri, 13 Mar 2026 06:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5AVmFAe9Ik/fE0LX/BsA8E
	1wHztxhMYSWxglI3gqndc=; b=hJLgPv0Z4qDUBFVMEQHi0DDoGS8X4keR73BE3t
	RKLGdEhNe7yWwXWndunp/MZkJR+6CSGY4Ke9tdGCng2D68Bpd+vEhsUfqxG2HwO7
	ZiJlG8zfhLXxIcXG0KTwyNnjL8tF/0S0zdDsl7UKHOB5ZQjJyHvKXLZ2tpbfLglV
	K8jiGYC0yrdyO0Eu383hfcRUAqPFoDCAHgqcbs8VwrRaFAfN+CoTk/CBnYDnapUC
	ZXjC6iQnXBdzEhzfYSWasyBpiY2RgaAREBvHW3z9nLk5u70QOCUtywwUci/rU6cr
	yaveQe29DY55nFQW5Ei5O3g2ASPT61JY3EmJVnHtM6lWJ9bQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w3jh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Mar 2026 06:49:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0b5cf34dso2108862a91.1
        for <mhi@lists.linux.dev>; Thu, 12 Mar 2026 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384573; x=1773989373; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5AVmFAe9Ik/fE0LX/BsA8E1wHztxhMYSWxglI3gqndc=;
        b=H95uHv+PFW4+58Sgv3OBbWx4j8AgR+OLNWrpw2wWumpWuBBgD0ZUzEBi8XkgQNJw/H
         98u+HUOMwEep8iU9IsQYT6glsM/L5PuE0+I3cRnHfRfN6yF7DYkZrSeoMOyKNyWy4d84
         oAkbZ68JT+Gml41V6/Dl1EyqRAq9zVjqjJQP2I+TzXWY4kng7n3O+Ju+Bup64ecsR+5i
         isRIAXHDr/ATaM56wq8uVV/Y1wJngCbYjr89vz2rZNBvKEyY/WHfJ06LJrdoNfHCZ6uv
         fEt8T7ptQpFfuwJqICU8u1tE29QNREWdbsmo8D2XLLS68MjPokknxC5HGc7thY1UNR7y
         EM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384573; x=1773989373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AVmFAe9Ik/fE0LX/BsA8E1wHztxhMYSWxglI3gqndc=;
        b=cj0HAo6XOmka11HzrB3ryoQieN3fOVAYfO+sh3Nyf/lg3b3FDxgRAAnRzpNyd1nAzS
         B6Nb/eSfhuvX9P5Rzn9WpQj+YNm8D0rU2Oj21233jiiRy4Hw4vnjWKJq2Q0oz4+Ua4G7
         6wVXyqvVuodSXl0tLcePd6+xKYolRpR0cX+gPoXlddHgkt3vqx1upBvSz2eL7h1HueFw
         CeRRIPFRu4LghZsdbv/Z+KZVTdZXBF7iDx21fAWzOKe9p+6d5c895PdCxFNjP/1yi8jS
         THw9LZ4dOn3wCcdYRQdqrnJC+YtU0jKHSVS2qWslkoVtNVOo7Ec5v3pegAbzRV0p7Aya
         1DEg==
X-Forwarded-Encrypted: i=1; AJvYcCURf8AjLIAxBLHCjoU+bmttOkgAx7GN4Oyk0nhrOSzwTYwbZtTZiUWZNFCe4BlKYFdk+7c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUGJ+w10iOzokDrj1DH2L8XzyyTkDmkQmjjbe4M6i3aMXSEG6W
	IJSLc3uAHknynBDnL3kwbHI6E4t6s/fm5UupFkGZVnjIWtnwpF0sd1PlhcP7B1GKuVVJK++q40V
	/iV/IDO4CYTRfRQx7GeRzVvIRcy+I4rMrl1Tkbi9bIzLKsQ07LA03lwI=
X-Gm-Gg: ATEYQzzRtArhqWvIyfaI6Ma7jcuoOcdTJyIPnXft3pEf37cAfIA+r0CVvy1Y26ovneW
	gN/1b0Iw77U7YqqEoyXInO2iPi2LV0vVKH3pzNUsuxA9eMuCS2yL13RusKEt7AodGI4s8F8cAXB
	q8Y6rzE7XslRFlhC4xjrg20JBySx+HMv4rdCEp0FxyUhlfv1+M8YC1fl5qObzimbumAfdHnZieS
	c+m8Vh2ejwzWJaZQJ4ihDiYxeHe28iSZBs47B6hO2CTEztGa6MRP+grU5wDKRsDV2OrvEeCb4m1
	Itl8IbUvAKkW/I6kL6hwqawDYJcJB+psu9Bs0Y5Dggw3wugrZ/qRR3HMaOEH4SRwRdLebrVzNRF
	w0igT4ruxldp//mpJtZgBvQOLQUogkn9IL15zHtQPqmNQgxg=
X-Received: by 2002:a05:6a21:6197:b0:398:afdf:3463 with SMTP id adf61e73a8af0-398ece212b3mr1705953637.70.1773384573492;
        Thu, 12 Mar 2026 23:49:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:6197:b0:398:afdf:3463 with SMTP id adf61e73a8af0-398ece212b3mr1705918637.70.1773384572883;
        Thu, 12 Mar 2026 23:49:32 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97b41dsm936160a12.5.2026.03.12.23.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:49:32 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/3] dmaengine: Add batched scatter-gather DMA support
Date: Fri, 13 Mar 2026 12:19:24 +0530
Message-Id: <20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHSzs2kC/1WNwQ6CMBBEf4Xs2ZJuUTCe/A9DCJYFNqFUu0A0h
 H+34snLJG+SebOCUGASuCQrBFpY2I8R8JCA7euxI8VNZDDa5Br1WTWurtw8TFxJp6zBIj/prMi
 sgTh5BGr5tetuZeSeZfLhvdsX/LY/kdHZv2hBpRUezT2eEBXYXr1I+pzrwXrn0hhQbtv2AQN8W
 02vAAAA
X-Change-ID: 20260108-dma_multi_sg-c217650373c2
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-pci@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773384567; l=2678;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=pvlk2gOPkIN+ITxicWXFZ618jc3EqUbu9jfuBJT+Pj8=;
 b=CJsyKHGdctf6eMe9FYY1OpAZhEpTLB18Re4kWKHiZ0+TKe0AV4X/h4B2qhl75oyvumt11XvKa
 T/JaOl/TpY9ArzGxVUQ0/u9VR0ZLcx4FAaInJyDJiUPuxoHqhv3XDfC
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: 8DdNrKDjmDxysXzhOfZqzfPhU5W1Ctmq
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3b37e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=f6ynY6_RdjVN_4bGfK8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MiBTYWx0ZWRfXzPH5IaTKAbYb
 TpbP1khHud/wbQV9u6gCsDnNR2WLwWC8wB/PG17RuEJYhV6+dC/Cg6wokMjgxu7kgczxxLmhAUi
 3z99PnNxi4Kqb5UMW8+XQCGMUEaVLHWROeHL1SGx41wY4g/dXlL+y4EUAxoyHLw2pOhHWksEopx
 yAW94mepH4R08RONnLZc1yhIb4RE/uzYJ+JwdASSEG/hKasI697I95Q6ZYwpWyx7yYlbIucTJNb
 aVwdQ44gBZ+ZvOyqo0QlY883CZEf9Hu1gRPb3THTPV6+j+e++czIXyFpic6NAWUkpDWku1MmRKY
 w7FCry2fRmeRBi0OPS8p9yxNmYfT6MCmME0eaA1EwsryI3sURluyyROzat1FufhOOwiNRk/c3eC
 b+qHHb1Vvq8XfX60mi90gim2eyrqHTMYnpfz0hk3Vbx+vRqf0h9W16M0NtCV3JhQS8fCDtxF/9E
 cCioYQr6TNbsY/gWsfQ==
X-Proofpoint-ORIG-GUID: 8DdNrKDjmDxysXzhOfZqzfPhU5W1Ctmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130052

Synopsys DesignWare eDMA IP supports a linked-list (LL) mode where
each LL item carries independent source and destination addresses. This
allows multiple independent memory transfers to be described in a single
linked list and submitted to the hardware as one DMA transaction, without
any CPU intervention between items. The IP processes LL items strictly
in order, guaranteeing that scatter-gather entries are never reordered.

This series leverages that hardware capability to introduce a new
dmaengine API — dmaengine_prep_batch_sg_dma() — for batching multiple
independent buffers into a single DMA transaction. Each scatter-gather
entry specifies both its own source (dma_address) and destination
(dma_dst_address), enabling the eDMA hardware to process them as a
single linked-list transaction.

The primary use case is MHI endpoint ring caching. When an MHI ring
wraps around, data spans two non-contiguous memory regions (tail and
head portions). Previously this required two separate DMA transactions
with two interrupts. With this series, both regions are submitted as a
single batched transaction, reducing submission overhead and interrupt
count.

The series includes:
1. Core DMA engine API and DW eDMA driver implementation
2. PCI EPF MHI driver support for batched transfers
3. MHI endpoint ring caching optimization using batched reads

Performance Benefits:
--------------------
- Reduced DMA submission overhead for multiple transfers
- Better hardware utilization through batched operations
- Lower latency for ring wraparound scenarios

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (3):
      dmaengine: Add multi-buffer support in single DMA transfer
      PCI: epf-mhi: Add batched DMA read support
      bus: mhi: ep: Use batched read for ring caching

 drivers/bus/mhi/ep/ring.c                    |  43 +++++-----
 drivers/dma/dw-edma/Kconfig                  |   1 +
 drivers/dma/dw-edma/dw-edma-core.c           |  40 ++++++++-
 drivers/dma/dw-edma/dw-edma-core.h           |   3 +-
 drivers/pci/endpoint/functions/Kconfig       |   1 +
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 120 +++++++++++++++++++++++++++
 include/linux/dmaengine.h                    |  29 ++++++-
 include/linux/mhi_ep.h                       |   3 +
 include/linux/scatterlist.h                  |   7 ++
 kernel/dma/Kconfig                           |   3 +
 10 files changed, 224 insertions(+), 26 deletions(-)
---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20260108-dma_multi_sg-c217650373c2

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

