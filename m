Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC938757C
	for <mhi@lists.linux.dev>; Mon,  3 Aug 2026 10:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753127; cv=none; b=C/rOj7BeF+qHPpxiZLWvBOpfomUav1X8Zhgw+aFNhPvpSTHGPowbTAOplDL3oNKu3ARYhXDuJNRNsrZXIS+maTYSgv6pkXv46EUezyKcRkZfl3PvAq0+GQccQd+ziSmI1jO3xvcwjSdU9gn+sA+Za8koUM2Bj/s6gn/hSeoIirE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753127; c=relaxed/simple;
	bh=Dt7uawwamGL5dzZbfwrTJusLP6o30EN5ycCd9lSUTTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbB7m6MFSaDPMxkKyoCDe9fOHi5r17x06j3Fe70nrDXrdVZAMcMf8ub5gbC5jzdRNYQb8436Xpw09wlmJF94bjd0RFGfpn1CU3rsZETW3c/jqAxgHYZHQeFiEPa/ILbaqqGAQ3C5XXeXwoU9XufN7KF/9e/Y6QHClgxvIGOG8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAoOjh3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8CRkyJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAoOjh3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8CRkyJR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736DbQJ3882610
	for <mhi@lists.linux.dev>; Mon, 3 Aug 2026 10:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnKaf8soKtsfI46+7/IcDh6tbT8xlfKfVzMrrCqhrT0=; b=hAoOjh3E7f/wHN+1
	M3aDHDlm2LGxlWFl8ZVuZzRSO8g7y0yP3x/gV9ZNnfE0P5JVomin8GLiIpcum0e3
	gUEVmOevnW7h7pO9XZ5P64oJdtwkCul7d4KtYAmzjMZ/Hsmcxt+QusMaMLXcBfBT
	/4hctq5jt+ULxRspBZrkDZsfxdSfxrAj4ey/BC+MdrsRebdoyh8jRybFXbtnYoQo
	3N3FuTolnWmE0TXebW2hKAmhM/QilCiV7HoQ6WJaNsCTbEpbjhxw/rgxIZSqHN5E
	x3S5qyGU/B2LRaj4YYcN0q/YNh7aj9xWLnKkzebRVzDTyW2B6AjV2ybswnOc0m3L
	uHCkRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkh32u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 10:32:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5172976a91.1
        for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753123; x=1786357923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnKaf8soKtsfI46+7/IcDh6tbT8xlfKfVzMrrCqhrT0=;
        b=a8CRkyJR7KaD5+hvWZUPa4uktDB4PKgb/jlUvk1EMDeLWUgTBdA6t6W0R84tN3p4bq
         hVW/miMasHWTaPTxHUXMpwiyn16gCCLSEuF/4f/5+0Oj3fucdZDF82VVZV+dB9aF2tmj
         uQzJzghvkpZDEnzBxXQamjYvPKn6oA712vBfp4cFGm+sjeWO+9jv3DAoi7NpX2pAe+FP
         u0Dd3iEj0WWuMh3FMtu8fxWBnRBfkQJ1kD7L/tC6jh4PZ2C5lXuXh3hgZsgjSoWi2LUF
         r5ABNJDvKdsah3tiSXNipFZq8PJDOYPzucmN7Z6OtAURTmGvTFsIeq0XdvLJnQ8sHwgx
         cb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753123; x=1786357923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnKaf8soKtsfI46+7/IcDh6tbT8xlfKfVzMrrCqhrT0=;
        b=qPcmdt632UStOhfdSnO6vMhz+kur3GIbUn0yyJYYwBj7DE4+UeUwt87YBInhN57mJU
         rn0Y0f1NFR/wZ7k6MbOshCJ6L/o8ZhduKBvj/UyL6dWDuL9oJmPk4kji240IwsjUnIov
         /DjmN7aS0h7OeE/sgINAJlEm9xKRijMfYJ1XlJbupENhC1v8YBpnbkxV5k737YIU4zzi
         mJiJsBcxygXhVAtBDjuMivpQui8C3PFF3qlswMyCApaiAs4K5bAs4qR24UincDfNicV9
         Y7JexTjsPh0O91CXv+umFOZFdkCHitHG9EhCbpJ7HTL4oBigUkAzJAvMm5jSd3GBC3eR
         m2cw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2d4EjkKHjebPYXtNVklRr3VRWrk+DXKB9OTQxqcn+zChE4EyQkJiodyF7Fw0PvuIuE8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yziht4GwHsMFRX97KSKD0tK3+uDGQAinhDjrmeoarj9tKGWmSbr
	CkRuu0goU6ApsoEd0NsjgphSTD63P/OPc1Bk5eNaLUGnqAwXll4Ewm8Ewbq3gI7j1gHufdlM8OF
	MyVKZZDCYTYGlFIWNHIrIkqCWtFyc8m3Ge+EQyRgjnu+omxO/tWsKcAE=
X-Gm-Gg: AR+sD11eFjq4+6BZ8Ucdae/GY2q+qkTPL5OaI+UNEkAvzIu3ROA6dLRQ3/UD9yry9CS
	aPIR6Yg0ACBDOXi9pP2vOHao2942GMNYP5gEpWSZbUU0gLhqhrRkOM1LF0o9nDWQlCbRfSD9Nr/
	ZGgwIz0VZ0XfDktGnWTW1Uc7e6bL+3DXNP39qRHkuSmZY25V7U42lQMQcg8gKVZ8MIhfqm9NhNK
	xXA28BAbmJo996FbfYX2OFJRGCktOgFLeibGWfOypROAi86WrApPiIupeBBh/oO/xw6jgJzR0aG
	hplhyeJH9D4aokHuVd4jqVJsDs33ETIwxUK3rURxMi+S5liaxc450qenirTkS50Bf1Ldn6ox4Yb
	upmuuTU+/sd+upJ8tGkTbawqizA==
X-Received: by 2002:a17:90b:280a:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38fbc45436bmr8414436a91.14.1785753123105;
        Mon, 03 Aug 2026 03:32:03 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38fbc45436bmr8414407a91.14.1785753122550;
        Mon, 03 Aug 2026 03:32:02 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:02 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:44 +0530
Subject: [PATCH v2 2/5] dmaengine: dw-edma: Add DMA_SG support
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-2-c12bb05e42d6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=9314;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=Dt7uawwamGL5dzZbfwrTJusLP6o30EN5ycCd9lSUTTA=;
 b=Nn4l0bMMov/mSFqw3meaBaoqHEtMDdiPvrx/ENQmNWAidJ1BQ1j6oH20wYCJqtwxhbUJVyoNV
 IyqdC0G627/CGiVmC4k+FZvC/APWNV1tor2WcbrXmTKStUezyzJwKLn
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: x44m7GiH0BBdqkNkb1Bq-7eGm5GuaN2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX3vOvSgvqiV3W
 a7JTMEFsxEhXVqDlTTFlwrVYiJ0jgbywro7YqZWWNo7s7M1q2k18+c5X+F4/w2Oj6srcMw/MGeO
 cYBq9IVGNSkK1Wc2vjv6HVw3GCp1dRocNPMVaE27BH8WiJrWFFDNLHgwRcTmt/weUAoBoMKEis6
 scH2QkZ/jM84KuNDgUmTjfha4ZTpWMPtjhlf5xr5lKzBAxkJanHN+5G8iZWfiOy1kkLvhj3/hWn
 GovvpT8QyPwbtTioJV+xS0T2XmXFK9tVliCp7ROj3mg0AvIFByHoam/92BeqSrgNkpY4ngpIBsa
 p/jbmmK571Sx8OyPbWXCE+Saj2xPMhDpyc2WwEkJInnl4ouQaUgSYk9YtiaeWnalQnGzMYqJnKs
 2azXtVASnwXW7ugWSuRkJisKqaRBmUYs3tqeH/ObL1gjcL2ApIHeufzh4xvjGwz8j55rPZPFiSM
 Uj4E0xin+z18pYHFa7w==
X-Proofpoint-ORIG-GUID: x44m7GiH0BBdqkNkb1Bq-7eGm5GuaN2T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXxiB9SB1UidQ/
 tiOVWKapbNcIS8K9kSMUYM/xkacOeM72K6Li5CBYPgKRM5yjFKL0XSsnt3Ln3LW9dTbj5kf0MCr
 Zwi+cRJ1OELVrf5Zi6CjkwzTo3KvTaY=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a706e24 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3YK5jeb26AILRK50rYoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030094

Synopsys DesignWare eDMA supports a linked-list mode where each list item
carries independent source and destination addresses, letting multiple
independent memory transfers be described in one linked list and submitted
to the hardware as a single DMA transaction. The IP processes list items
strictly in order, so paired scatter-gather entries are never reordered.

Implement the DMA_SG capability by adding a new EDMA_XFER_DUAL_SG transfer
type and a corresponding struct dw_edma_dual_sg carrying the paired source
and destination SG lists. dw_edma_device_transfer() walks both lists in
lockstep, building a single hardware linked-list; a per-entry length
mismatch or premature list end fails the whole request.

The transfer direction is inferred from the channel hardware polarity
(EDMA_DIR_READ/WRITE), not from dma_slave_config.direction: for local eDMA
(DW_EDMA_CHIP_LOCAL) read channels handle DEV_TO_MEM and write channels
handle MEM_TO_DEV; for remote eDMA the mapping is inverted. PCIe bus
addresses are translated via dw_edma_get_pci_address() for the remote side
of each transfer. dmaengine_slave_config() must still be called before
dmaengine_prep_dma_sg() because dw_edma_device_transfer() gates transfers
on chan->configured, even though the direction field itself is unused by
the DMA_SG path.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/dma/dw-edma/dw-edma-core.c | 87 +++++++++++++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h | 10 ++++-
 2 files changed, 90 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1f893dc54c7938a9c45bafd975a4f99fdc0acb38..9fbfa5ad65b5421b164d2ab9883233225e0269e4 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -372,6 +372,7 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(xfer->dchan);
 	enum dma_transfer_direction dir = xfer->direction;
 	struct scatterlist *sg = NULL;
+	struct scatterlist *dst_sg = NULL;
 	struct dw_edma_burst *burst;
 	struct dw_edma_desc *desc;
 	u64 src_addr, dst_addr;
@@ -429,6 +430,9 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 			return NULL;
 		if (!xfer->xfer.il->src_inc || !xfer->xfer.il->dst_inc)
 			return NULL;
+	} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+		if (xfer->xfer.dual_sg.len < 1)
+			return NULL;
 	} else {
 		return NULL;
 	}
@@ -441,16 +445,27 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 		dst_addr = config->dst_addr;
 	}
 
-	if (dir == DMA_DEV_TO_MEM)
-		src_addr = dw_edma_get_pci_address(chan, (phys_addr_t)src_addr);
-	else
-		dst_addr = dw_edma_get_pci_address(chan, (phys_addr_t)dst_addr);
+	/*
+	 * DUAL_SG translates each src/dst sg entry individually below
+	 * (see the burst->sar/burst->dar assignment), so it is exempt
+	 * from the single up-front translation used by other types.
+	 */
+	if (xfer->type != EDMA_XFER_DUAL_SG) {
+		if (dir == DMA_DEV_TO_MEM)
+			src_addr = dw_edma_get_pci_address(chan, (phys_addr_t)src_addr);
+		else
+			dst_addr = dw_edma_get_pci_address(chan, (phys_addr_t)dst_addr);
+	}
 
 	if (xfer->type == EDMA_XFER_CYCLIC) {
 		cnt = xfer->xfer.cyclic.cnt;
 	} else if (xfer->type == EDMA_XFER_SCATTER_GATHER) {
 		cnt = xfer->xfer.sg.len;
 		sg = xfer->xfer.sg.sgl;
+	} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+		cnt = xfer->xfer.dual_sg.len;
+		sg = xfer->xfer.dual_sg.src_sgl;
+		dst_sg = xfer->xfer.dual_sg.dst_sgl;
 	} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 		cnt = xfer->xfer.il->numf * xfer->xfer.il->frame_size;
 		fsz = xfer->xfer.il->frame_size;
@@ -463,12 +478,23 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 	for (i = 0; i < cnt; i++) {
 		if (xfer->type == EDMA_XFER_SCATTER_GATHER && !sg)
 			break;
+		/*
+		 * DUAL_SG walks the source and destination lists in lockstep;
+		 * a premature end or a per-entry length mismatch would leave
+		 * the descriptor partially built, so fail the whole request.
+		 */
+		if (xfer->type == EDMA_XFER_DUAL_SG &&
+		    (!sg || !dst_sg || sg_dma_len(sg) != sg_dma_len(dst_sg))) {
+			kfree(desc);
+			return NULL;
+		}
 
 		burst = desc->burst + i;
 
 		if (xfer->type == EDMA_XFER_CYCLIC)
 			burst->sz = xfer->xfer.cyclic.len;
-		else if (xfer->type == EDMA_XFER_SCATTER_GATHER)
+		else if (xfer->type == EDMA_XFER_SCATTER_GATHER ||
+			 xfer->type == EDMA_XFER_DUAL_SG)
 			burst->sz = sg_dma_len(sg);
 		else if (xfer->type == EDMA_XFER_INTERLEAVED)
 			burst->sz = xfer->xfer.il->sgl[i % fsz].size;
@@ -492,6 +518,9 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 				 */
 			} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 				burst->dar = dst_addr;
+			} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+				burst->sar = dw_edma_get_pci_address(chan, sg_dma_address(sg));
+				burst->dar = sg_dma_address(dst_sg);
 			}
 		} else {
 			burst->dar = dst_addr;
@@ -507,13 +536,19 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer,
 				 * and destination addresses are increased
 				 * by the same portion (data length)
 				 */
-			}  else if (xfer->type == EDMA_XFER_INTERLEAVED) {
+			} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 				burst->sar = src_addr;
+			} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+				burst->sar = sg_dma_address(sg);
+				burst->dar = dw_edma_get_pci_address(chan, sg_dma_address(dst_sg));
 			}
 		}
 
 		if (xfer->type == EDMA_XFER_SCATTER_GATHER) {
 			sg = sg_next(sg);
+		} else if (xfer->type == EDMA_XFER_DUAL_SG) {
+			sg = sg_next(sg);
+			dst_sg = sg_next(dst_sg);
 		} else if (xfer->type == EDMA_XFER_INTERLEAVED) {
 			struct dma_interleaved_template *il = xfer->xfer.il;
 			struct data_chunk *dc = &il->sgl[i % fsz];
@@ -613,6 +648,44 @@ static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 	res->residue = residue;
 }
 
+static struct dma_async_tx_descriptor *
+dw_edma_device_prep_dma_sg(struct dma_chan *dchan,
+			   struct scatterlist *dst_sg, unsigned int dst_nents,
+			   struct scatterlist *src_sg, unsigned int src_nents,
+			   unsigned long flags)
+{
+	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	struct dw_edma_transfer xfer;
+	enum dma_transfer_direction dir;
+
+	if (src_nents != dst_nents || !src_nents)
+		return NULL;
+
+	if (!src_sg || !dst_sg)
+		return NULL;
+
+	/* Determine direction from channel configuration */
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL)
+		dir = (chan->dir == EDMA_DIR_READ) ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
+	else
+		dir = (chan->dir == EDMA_DIR_WRITE) ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
+
+	xfer.dchan = dchan;
+	xfer.direction = dir;
+	xfer.xfer.dual_sg.src_sgl = src_sg;
+	xfer.xfer.dual_sg.dst_sgl = dst_sg;
+	xfer.xfer.dual_sg.len = src_nents;
+	xfer.flags = flags;
+	xfer.type = EDMA_XFER_DUAL_SG;
+
+	/*
+	 * dw_edma_device_transfer() rejects unconfigured channels, so
+	 * dmaengine_slave_config() must have been called on this channel
+	 * beforehand even though the direction field is unused here.
+	 */
+	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
+}
+
 static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
@@ -997,6 +1070,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma_cap_set(DMA_CYCLIC, dma->cap_mask);
 	dma_cap_set(DMA_PRIVATE, dma->cap_mask);
 	dma_cap_set(DMA_INTERLEAVE, dma->cap_mask);
+	dma_cap_set(DMA_SG, dma->cap_mask);
 	dma->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	dma->src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	dma->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
@@ -1017,6 +1091,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 	dma->device_prep_config_sg = dw_edma_device_prep_config_sg;
 	dma->device_prep_dma_cyclic = dw_edma_device_prep_dma_cyclic;
 	dma->device_prep_interleaved_dma = dw_edma_device_prep_interleaved_dma;
+	dma->device_prep_dma_sg = dw_edma_device_prep_dma_sg;
 
 	dma_set_max_seg_size(dma->dev, U32_MAX);
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f6a5ad31756723e6fd72f7d9d903a1204e25c0b0..e3219ae96d84f528fb7d77dbe3a0b3d7c1264f05 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -38,7 +38,8 @@ enum dw_edma_status {
 enum dw_edma_xfer_type {
 	EDMA_XFER_SCATTER_GATHER = 0,
 	EDMA_XFER_CYCLIC,
-	EDMA_XFER_INTERLEAVED
+	EDMA_XFER_INTERLEAVED,
+	EDMA_XFER_DUAL_SG,
 };
 
 struct dw_edma_chan;
@@ -151,6 +152,12 @@ struct dw_edma_sg {
 	unsigned int			len;
 };
 
+struct dw_edma_dual_sg {
+	struct scatterlist		*src_sgl;
+	struct scatterlist		*dst_sgl;
+	unsigned int			len;
+};
+
 struct dw_edma_cyclic {
 	dma_addr_t			paddr;
 	size_t				len;
@@ -163,6 +170,7 @@ struct dw_edma_transfer {
 		struct dw_edma_sg		sg;
 		struct dw_edma_cyclic		cyclic;
 		struct dma_interleaved_template *il;
+		struct dw_edma_dual_sg		dual_sg;
 	} xfer;
 	enum dma_transfer_direction	direction;
 	unsigned long			flags;

-- 
2.34.1

