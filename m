Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0737F8DB
	for <mhi@lists.linux.dev>; Mon,  3 Aug 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753122; cv=none; b=nNSAviXpumYzUSXB+zaWvGoqjHpJdJqyMiypLthBWD5uxDnmAXU3NIlV6R9hWeThIe4D3KJxqrv+UyDuVuFzS9NZvub4xkRrMtJR75FpQg0GWux+8ZS8N0KPUro5ZEUk9WCX65nrkfHZ2UzV48kJPpb4WaV1qDLvBqoqoXRmWbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753122; c=relaxed/simple;
	bh=F+fPjKe8NP3i0MZrbOhQmL14uCve9gQEON/srSIsDbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+BOtGboY2o6OAbtb49a7yzMCIOIx82bGYLJMHOSzxrvRICQqXpzdZG3TMRU0/zKnin2X60n5YGajadsVxH5UvkBgT3XhnuHwukZBZAR63QSLn3NFwQOQY9toGehivN8NPlTeZJhpsB0NUb71H5wvOrDtuCWWfC8De5p7unrDHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpMGoBKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7AwEc3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpMGoBKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7AwEc3H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736S8kA250008
	for <mhi@lists.linux.dev>; Mon, 3 Aug 2026 10:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Rdiyohjbhr0H44YMyHYEoS5uhqb4cajhLofrK++hek=; b=GpMGoBKINU1FxXvE
	L8mo+yFZ7nKqvo9B/3uwE8NB+TWGgDLkhJdz8KylflQ2ugrhOZ0jjE5F6z4KzlJx
	x9KABTCQRyaNBhEVt5TJJ2A+xxoMjG+ciV+XOvqWcdaRH2j0O8/mw2jEDagAaakH
	rKVOXIq0sLQctsL35OKl+3k+zRgxMr7fB37AERVTkBQPvBGChsB7EjLJqigHOkD8
	FwrTrCmmCFYBzCjpJYp4oojzqTKdec4atJKOyqUHbiA3p00JPEXVpkYmlQbnLwdL
	xkO8aBYAztXj4EApmNDrG1TBbE2zO2r+6bZtfH4sAyjVYoNeEwdyr5Kyr0tyAK3O
	TbQ9Nw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd91v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 10:31:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1235534a91.2
        for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753118; x=1786357918; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Rdiyohjbhr0H44YMyHYEoS5uhqb4cajhLofrK++hek=;
        b=h7AwEc3Hm9leFvwIKNQ+pKTBXiyj4m9mi2rwNxYWZEaGF4AeSRAAiXCwmnsheiNul6
         kiddXxSrAHwmKOHFzcHc8jU7E4G/IJgTL6XK8yoGLe5RXRWi+yH1lZTpBtq3hHb+U7ws
         cjyFWKMRSh+8W+4EUfAa8R4jJi7G1G2gb4BBsPBtas5U7fT5RlQ5kMG7QNVtSViVlfcV
         u4v5MJPEqqlX7g7UMk0ipLWP5vwXA1u5IZFwJyKhxfE3M/P10FbjBzA8xbrBBfqA3wNT
         uVPdqZNhQniN47wEho5tqZXukNsXaPglQk011/j0h7GzbSmA2yQEy1fsFqjv/PpkLtzw
         bt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753118; x=1786357918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Rdiyohjbhr0H44YMyHYEoS5uhqb4cajhLofrK++hek=;
        b=TIfveM/gl03KYMYhg/e2fFlnZ7IiPECY0LwiYVqoR424hZPhIDwYA/x6wC6Q31aBsh
         gdjdKx/akk2rp/I7hG974mf8WP+1umxp6uNOWc1FrLAZELZZiUncV9pfCdL8ttolSvvZ
         LfxOKBnmv4xC3uZrZq5/B9l8HmYSLqzYdqonyW5ykQ9/L/7Y1GmPyc8aSvnJp0spLPaF
         MCGh0YmeGO4ZbvsAAXfiNvZOBz5q2weqsPfiSiwYQnx5TH7kCIG3Bs7KYavB90S2Lzuh
         Z/6XNdEhFPxSesKhbPtmDoTxIbgjRPBQp3uAAub5E6ivKAIxlfKblJpuKxu9BmWtkYX3
         wEAw==
X-Forwarded-Encrypted: i=1; AHgh+RoUEyMzz016hW7g5TAlGTWPLCRk+RmT6XsnNSe5Ls7f1C4u4MJ8Kjt225j8Pz/rDwHFFXs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNKWOS/uEF2wjN/p2XbxI2Uk0HWMScVr/druZdZiy0oOoW++oD
	u5O2EIR0V5NADwrlEgsJcLYRTd1p7EDPg9No4/1E/5vdCH3LqW+icb/cmHVaK7utnuy73YlOrk2
	mM8jCHHoYTR3I0ejKjo9dMKIvrGsLr+r7xqyAu16vrmTwxBXCIKtVBzo=
X-Gm-Gg: AR+sD13AfDJY7+G7W5aemRPPoQg0REkOyKZsbJszaYG8paFIJnDob4tG1+3tdv8kbha
	acVNPghkMCCQIyyJX7sK/fzjPov7tpzdsItNJuRwjHgnQECYJNpICjhBVn1gyGLoGQc8C1CVO47
	VNcSPu876vgpGo7K+u9lAPnENwG2tjL4yHvXKMxq91KsKIp1vSKmegNKu6awHymmFF9yR7+2lzy
	Mu0cDdiIhitJ1+0vufPXcgqGnTXXxrwclMjM3SRLfIWJwTOC03JsXUcJJ5/grhaS2V3ggGjZ0OE
	JR5u1UwZExP9bjuXDngn6SttWu+5VjeFe0oDel1+ybTrUE/UZ72zapgBjHWnShXKZ4nMDyUmvIV
	brwipNOkBuh7ySxRegP0OlAsW1w==
X-Received: by 2002:a17:90b:2e06:b0:38e:ab33:9551 with SMTP id 98e67ed59e1d1-38fbc60a11emr8206084a91.42.1785753117913;
        Mon, 03 Aug 2026 03:31:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2e06:b0:38e:ab33:9551 with SMTP id 98e67ed59e1d1-38fbc60a11emr8206046a91.42.1785753117416;
        Mon, 03 Aug 2026 03:31:57 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:31:56 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:43 +0530
Subject: [PATCH v2 1/5] dmaengine: Add DMA_SG support for multi-buffer
 scatter-gather transfers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-1-c12bb05e42d6@oss.qualcomm.com>
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
In-Reply-To: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=7025;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=F+fPjKe8NP3i0MZrbOhQmL14uCve9gQEON/srSIsDbM=;
 b=BHFl2Lx7cmYBNT3LrRyXX+cViMAk98sV6yIvxrf3cYqAZMo6eXZU6N8lrQyU/DB/LId6lHcMI
 O26it2Vb/6iAaYzqSf4sAwug5Cw3nZ2nsfv7C6HGhpzJL0/rgAQYwvg
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX7mxSwGj867oI
 l8+TPwxT8++sJvvbkGK9ijzjVcYSFXoNZ3y7GKjN441OTEvNrhbqmE6WULxJujQted/fsrEb2Ed
 P3tFod0LlY5zuA8dqJJFdJVrUNCb6w4=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a706e1e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0CPfFOknu0lYeC7QLpQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: lXO9hX0PleezRE4tRR4EPpbwRqg2UmO1
X-Proofpoint-ORIG-GUID: lXO9hX0PleezRE4tRR4EPpbwRqg2UmO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX+s50ruukNFjw
 GmJFJtqk45ICV47O8Rilz+wIrVpGRgIYMyeldTlCv4CewZumk3DEOo8wHOgfUt0SilfKe0NGw6C
 1weqMf0qVrwOmZOyUOE4SdcCT2atUrSr0C1Xt4/rF5CBvorVXrU8DsdR613b/NFJC3O2G2LRLO0
 nnoc3mTyvHzdgrgZjC7x+cNwDDhFrHUSjszpdJtGsynp8yVuGlsj58zMie2LMoPAuxGoNNZl9TA
 qN65SynCwEkejLN2bhzkitDl8DMMxZlWN2QyL+jT0eiyt2Xb7t8cSfvFUQw7rwqHhK8RTCxcchT
 FQC3Joy/SZ4Jx2uK/ZdboxkDp3fgHzP7E7PGpL5l9IXCBM6jPlF9sG4WbUFMy4tA4fLzW2rxYgj
 dCtjLEnPN9WJFw/6tcy3k/fmbehenAxinr4ilBBrH4f2kT+19eoy1fLOWbay4n5orY3Aws5ahI+
 SAevRvSheY1o0odQb0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

A client that needs to copy several independent, non-contiguous memory
regions in one operation currently has to submit one DMA_MEMCPY
transaction per region, each with its own completion interrupt, even
when every region is known up front and the copies could be described
as a single hardware transaction.

Partially reintroduce the DMA_SG transaction type and device_prep_dma_sg()
API that was removed in commit c678fa66341c ("dmaengine: remove DMA_SG as
it is dead code in kernel"). Only the core API is restored here.

The API accepts separate source and destination scatter-gather lists,
where entry i of the source list is transferred to entry i of the
destination list. This allows multiple independent (src[i] -> dst[i])
transfers to be batched into a single DMA transaction instead of N
separate submissions, reducing submission and interrupt overhead.

DMA_SG is a memcpy-class operation: both endpoints are memory buffers,
and neither DMA address is a FIFO-style peripheral register. The source
and destination scatter-gather lists must contain the same number of
entries; providers reject requests where the entry counts differ.

Restore the DMA_SG entry in
Documentation/driver-api/dmaengine/provider.rst and add
CHECK_CAP(dma_sg, DMA_SG) to dma_async_device_register() to validate
that drivers setting the capability provide the corresponding function
pointer.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 Documentation/driver-api/dmaengine/provider.rst | 21 +++++++++++++++
 drivers/dma/dmaengine.c                         |  1 +
 include/linux/dmaengine.h                       | 35 +++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index f4ed98f701c918ff81bc674845880f8d01efbf1d..638e4b83e9a2f90c056111dbdd7572a4ed0f536d 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -210,6 +210,27 @@ Currently, the types available are:
   - Used by the client drivers to register a callback that will be
     called on a regular basis through the DMA controller interrupt
 
+- DMA_SG
+
+  - The device supports memory to memory scatter-gather transfers
+    using paired source and destination scatter-gather lists, where
+    entry ``i`` of the source list is transferred to entry ``i`` of
+    the destination list in a single DMA transaction.
+
+  - The source and destination scatter-gather lists must contain the
+    same number of entries; providers reject (return NULL for) requests
+    where the entry counts differ. Providers that walk the two lists in
+    lockstep pair them entry-by-entry as passed in, so clients that
+    DMA-map the lists must ensure the mapped segmentation stays aligned
+    between the two lists (for example by not relying on the DMA layer
+    to merge entries of one list but not the other).
+
+  - Unlike DMA_MEMCPY, neither the source nor destination is a
+    FIFO-style peripheral register; both are memory buffers. Multiple
+    independent (src[i] -> dst[i]) copies are submitted as a single
+    DMA transaction, reducing submission and interrupt overhead
+    compared to N separate DMA_MEMCPY operations.
+
 - DMA_PRIVATE
 
   - The devices only supports slave transfers, and as such isn't
diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 6ffd8bd82154af2af2807d1c8b7ae7475eab56d3..9e790b9f165063d696438ace6370df98dffb8a32 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1211,6 +1211,7 @@ int dma_async_device_register(struct dma_device *device)
 	CHECK_CAP(dma_pq_val,      DMA_PQ_VAL);
 	CHECK_CAP(dma_memset,      DMA_MEMSET);
 	CHECK_CAP(dma_interrupt,   DMA_INTERRUPT);
+	CHECK_CAP(dma_sg,          DMA_SG);
 	CHECK_CAP(dma_cyclic,      DMA_CYCLIC);
 	CHECK_CAP(interleaved_dma, DMA_INTERLEAVE);
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index fe33a20abc6146d539670e0e6fe6c9d27d96aa2a..61aa72149f5d5cf1828b89d13d0b35f1a12bb000 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -65,6 +65,7 @@ enum dma_transaction_type {
 	DMA_COMPLETION_NO_ORDER,
 	DMA_REPEAT,
 	DMA_LOAD_EOT,
+	DMA_SG,
 /* last transaction type for creation of the capabilities mask */
 	DMA_TX_TYPE_END,
 };
@@ -848,6 +849,7 @@ struct dma_filter {
  *	The function takes a buffer of size buf_len. The callback function will
  *	be called after period_len bytes have been transferred.
  * @device_prep_interleaved_dma: Transfer expression in a generic way.
+ * @device_prep_dma_sg: prepares a memory to memory scatter-gather operation
  * @device_caps: May be used to override the generic DMA slave capabilities
  *	with per-channel specific ones
  * @device_config: Pushes a new configuration to a channel, return 0 or an error
@@ -954,6 +956,11 @@ struct dma_device {
 	struct dma_async_tx_descriptor *(*device_prep_interleaved_dma)(
 		struct dma_chan *chan, struct dma_interleaved_template *xt,
 		unsigned long flags);
+	struct dma_async_tx_descriptor *(*device_prep_dma_sg)
+		(struct dma_chan *chan,
+		 struct scatterlist *dst_sg, unsigned int dst_nents,
+		 struct scatterlist *src_sg, unsigned int src_nents,
+		 unsigned long flags);
 
 	void (*device_caps)(struct dma_chan *chan, struct dma_slave_caps *caps);
 	int (*device_config)(struct dma_chan *chan, struct dma_slave_config *config);
@@ -1194,6 +1201,34 @@ static inline struct dma_async_tx_descriptor *dmaengine_prep_interleaved_dma(
 	return chan->device->device_prep_interleaved_dma(chan, xt, flags);
 }
 
+/**
+ * dmaengine_prep_dma_sg() - Prepare a memory-to-memory scatter-gather DMA descriptor.
+ * @chan: The channel to be used for this descriptor
+ * @dst_sg: Destination scatter list
+ * @dst_nents: Number of entries in destination scatter list
+ * @src_sg: Source scatter list
+ * @src_nents: Number of entries in source scatter list
+ * @flags: DMA engine flags
+ *
+ * Prepares a DMA transaction that copies data from multiple source memory
+ * regions to multiple destination memory regions in a single DMA transaction.
+ * Entry i of the source list is paired with entry i of the destination list,
+ * so both lists must contain the same number of entries; the call returns
+ * NULL otherwise.
+ */
+static inline struct dma_async_tx_descriptor *dmaengine_prep_dma_sg
+		(struct dma_chan *chan,
+		 struct scatterlist *dst_sg, unsigned int dst_nents,
+		 struct scatterlist *src_sg, unsigned int src_nents,
+		 unsigned long flags)
+{
+	if (!chan || !chan->device || !chan->device->device_prep_dma_sg)
+		return NULL;
+
+	return chan->device->device_prep_dma_sg(chan, dst_sg, dst_nents,
+			src_sg, src_nents, flags);
+}
+
 /**
  * dmaengine_prep_dma_memset() - Prepare a DMA memset descriptor.
  * @chan: The channel to be used for this descriptor

-- 
2.34.1

