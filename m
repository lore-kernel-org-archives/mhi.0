Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66AD38D406
	for <mhi@lists.linux.dev>; Mon,  3 Aug 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753142; cv=none; b=BWqv9h5XgQ5Erng2AgLVavi9QoFVW8eJPhgs+y1MSC1I3hVWrz45/PX5InwnSDKwvrf+MUjkZS9b2WEWJ+wA+dCgX9aBsJCzVeIwzCGbSx5l3t/cjocuhdU8fLaAuV6Tw0b6ifFqvCV9+1l/rj+AMsSkhBG/y/BmXak0tu2KjMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753142; c=relaxed/simple;
	bh=kXJQnle2iy213AQWQj46cMV6D4x1j/TtR9P5Qzd56rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUiF0sTQlu1u34UuglrQq+NjrzYCWIOvprcEZsm7pAVGrZUS4O3TiXsKhcpeW+t5XMr0OOR7YLqqKAzs9MAqxd4yMOK4Ml0OIiztdSCJwRTyjvegENPF6zWhRScKGX01iz+ANuSxvSK5NkLxkSTc6Pt2NRbgGxgqjetl/VMf2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiU7BJpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZS0C0CUa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiU7BJpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZS0C0CUa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bKu83957095
	for <mhi@lists.linux.dev>; Mon, 3 Aug 2026 10:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsOg8BzHaZPjVzLWezCKuNFn2YJ6/+JPUNTdZcJCf2U=; b=TiU7BJpNpXEsU/y2
	mhQjK4BU5En47PTImCEEAkJNY22Im2WfBGZQX8fxXy60Ey+O/ZD1BpvzsVcvRrG4
	hCfA2aGDHQ11mL4FdQ3PXjLLka7SpyRcFoz1c6bcgKkvqGC0AplSCkIaajpvnAXk
	6XIVevQZHrXA9y0NNqaBO3OYcC3MkleBsH9grp/jKVbpHuyd1St5mQ4CDJi8fZpy
	UdrpOccwOt+cQ6UVcH7ngtf7ldpNOzcfLDNUnnOnt3oCFyxJGXQcLXByDxSTsMgN
	9pPRSm5YE3IBIw+Hgwitij1zsFEMaSnusV4rIjCE+K13nv6viAIX+d3d0uJyRwnM
	1q5jDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnh17p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 10:32:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so5273146a91.0
        for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 03:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753138; x=1786357938; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsOg8BzHaZPjVzLWezCKuNFn2YJ6/+JPUNTdZcJCf2U=;
        b=ZS0C0CUaquWeySj0+zDxpe83VMDiytXQTG67CLgF/uLhjenUgcqsMnpQKvSLoomyU+
         moEZoFCQrmFV5Q9mgWXkKashKMlMYr36mpNrB6waEHaJiZeHHDdRRqymhSmR6dwpgiKi
         v5+OA+hl5EBbWja6Pk6KCK8XfErD3tnYhCUPtIkxEJjCPF7PP8jcamZTlSUGnWJ0S2p3
         cVdfc0SQ7u//Buvoud7iuXkOgbB4Cst9/g6QvBNSJml3K02fMyY0RW2tQvZoyUvU9Ds5
         3e9UUFRDusG0cbzLbf5xJ62tH2XIqF/mSSEk5OchxMuXKiAmoowrwuyv1CxwD7M7lbOQ
         ne+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753138; x=1786357938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsOg8BzHaZPjVzLWezCKuNFn2YJ6/+JPUNTdZcJCf2U=;
        b=nZS6fY1TpD3zEPPA19/tcJE+G3ppncNBsN0HPrb+KSNPllGYKu8qX6HXQku5W5v+nf
         0aJHhszf1T8sj5QlHfjSColjJB2RBhHU3ZEaZeTcwPw7yOHmLqfxNemqqX8Udh/yhDt1
         kgA5gXLcoM+GPKCU/rBQCZKmvjgrTTnSZEdOJYhkvCSqFkHwzR6gVhKSdmGnEEmwFTRV
         VQQTrTGel6h9hJX4CGLmizCIT5PmDqtoux3TcPZl+ZvYUyj7RVmKftq+scRg68cnlwbw
         UJv1VMVQ7mvFSSHtMcqHOPCCEQvyNSxJO6th3Xs4iTdaq8SRoGYLrevUz3NssEvy2GVQ
         Q9aQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNvHwJ1Oj7bBzxEPVLzvjnngmA7drgiaUHfV6aEvkYZ73uHbiUCibzyzlqPwICgvhNkZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnB5ENzNYLBrTYbcMwxoG02rMTKPyYRQCJDugod4V88C507qmg
	p2R9urAO3DcVFUF1QBktgERIVamdw7l8TN4nMtgxGUqbmxqHTp2zOE54h4I+bEu+QBDK3NShL1k
	CbTtR5T2sDdGh4BoQwPef/Hoh3P65CDNM68SduuAs/ZwF7ZDBw/zLxGkZ6/SGunY=
X-Gm-Gg: AR+sD13r8y8DendrqX5o1G2Jta21y08SdkPqGoOHWk2TEzxd7RQh323I3Bzngq5F4Fy
	Yzn5Job8S21OEihrsQdrMuc/aC7m1KjUBcDXpFcSPXe0dtiR8si25rrMGL8pkiPsLNS+i+EJBoJ
	LtA4i9bNrQJeuX18/OwK/ZOQFEQJKbI/vUkaD0ezRLddI4eHiKpOqcVgO4QdZ+CZoIH6eTQwNSG
	WPMmo/St44q5cHpEVmPEyJxJh+eQ3i5pEOA8dF2WXcLwVI6dvgEmsMdaxvWiWsETMO+6a1ezydD
	luKVbL7f828A8yJePgyRZC+SRkyHpsGSE4uR/oVmhcMCz5FP2vCUjpx3TIcGHfHI9ociNQdeJRN
	/ou28oqblB1Ci+iPDuCqX4LAKOA==
X-Received: by 2002:a17:90b:2588:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38fbc530fe4mr8942864a91.24.1785753138501;
        Mon, 03 Aug 2026 03:32:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2588:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38fbc530fe4mr8942831a91.24.1785753138002;
        Mon, 03 Aug 2026 03:32:18 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:17 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:47 +0530
Subject: [PATCH v2 5/5] bus: mhi: ep: Use batched read for ring caching
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-5-c12bb05e42d6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=3180;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=kXJQnle2iy213AQWQj46cMV6D4x1j/TtR9P5Qzd56rA=;
 b=+8Fy0NjdzuFsiqbwvScTz4Xn76n/ysFSpxfGLANQlTO8kqhW/k29GAcN9IKv825+jmOn97fT4
 OmfYqMfaJTzBIo5STgSVXs09zHTAA7nUzj1rknHfloExXKfrqI72JgI
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a706e33 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=O-L2LWsoD7DDJCLd4zEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: hMdIaMsOJcNPDeU1X9bJ7TGWnyHk6B2A
X-Proofpoint-ORIG-GUID: hMdIaMsOJcNPDeU1X9bJ7TGWnyHk6B2A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXy7tRdR82grZ2
 GAPbZu8yWhPtbxvqg4F61wYpMDj9pGOb9a3ofHhyuMzV9DPnOOxIXu0i4tD5+VwN1/u/JCrQaox
 +xkOq5H0ZuW4DbWrE9XrUn9dwAEY93rePudxmCsDcAjni2+HB6QJOdqXAbscxTRRM5Brd6LO5X4
 XLWgBMT8eqvg5iRb2oxVd5j2zw0NH1FKGkNVXRrunPmzGf4PYgvG53DCAEm98egisdl5hpiuwRV
 6AJdjlMDeLeyGCDFKWcjjo/7Z/g3Qu1woscIcyqfQpShONK3hzextCs80w7OPbNYNcvUPuguMeC
 L97wsLrILwow6qGIYUh3CL1Gpbq9+3hcJXNZ0yYPlPPl8FMd01KlGZ8eEjh1LI5zYQEAH9BSYj2
 6KKXAYmT49JIPeyKfNG3+6u84lELn9JkdgeeH1C/nMPRtpSuubebLRTtXqhbGtgv3i2U9x+2DgS
 QZJzBMSldLY/CEyikhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX91+1ONNwcg/i
 taaN2unkFWfBREBYkQ9twWBuasksIVKrH0NrII5Y0SKi8w/APG0AeFSjJxXH7qZ8vJpgNGB99VC
 ww79IB9UoQlsYh+R8/YGBpVTVBtjrJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

Optimise ring caching in __mhi_ep_cache_ring().
For the non-wraparound case, use read_sync(); for the wraparound case
where ring data spans two non-contiguous host memory regions, both the
tail portion (start -> ring_size) and head portion (0 -> end) are
submitted using the new read_batch() API in a single operation.
On DMA-capable platforms this transfers both segments in one DMA
transaction.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/ring.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 405ce16c02a89ea2268ea1033ff5c1c26b1c81bd..a369c1eb0c0b849d7ced01b99898ca461cf680b9 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -30,7 +30,6 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	struct mhi_ep_buf_info buf_info = {};
 	size_t start;
 	int ret;
 
@@ -44,6 +43,8 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 
 	start = ring->wr_offset;
 	if (start < end) {
+		struct mhi_ep_buf_info buf_info = {};
+
 		buf_info.size = (end - start) * sizeof(struct mhi_ring_element);
 		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
 		buf_info.dev_addr = &ring->ring_cache[start];
@@ -51,27 +52,30 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
 		if (ret)
 			return ret;
+
+		dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end,
+			buf_info.size);
 	} else {
-		buf_info.size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
-		buf_info.host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
-		buf_info.dev_addr = &ring->ring_cache[start];
+		struct mhi_ep_buf_info buf_info[2] = {};
+		u32 count = 1;
 
-		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-		if (ret)
-			return ret;
+		buf_info[0].size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
+		buf_info[0].host_addr = ring->rbase + (start * sizeof(struct mhi_ring_element));
+		buf_info[0].dev_addr = &ring->ring_cache[start];
 
 		if (end) {
-			buf_info.host_addr = ring->rbase;
-			buf_info.dev_addr = &ring->ring_cache[0];
-			buf_info.size = end * sizeof(struct mhi_ring_element);
-
-			ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-			if (ret)
-				return ret;
+			buf_info[1].size = end * sizeof(struct mhi_ring_element);
+			buf_info[1].host_addr = ring->rbase;
+			buf_info[1].dev_addr = &ring->ring_cache[0];
+			count = 2;
 		}
-	}
+		ret = mhi_cntrl->read_batch(mhi_cntrl, buf_info, count);
+		if (ret)
+			return ret;
 
-	dev_dbg(dev, "Cached ring: start %zu end %zu size %zu\n", start, end, buf_info.size);
+		dev_dbg(dev, "Cached ring (batched): start %zu end %zu tail_size %zu head_size %zu count %u\n",
+			start, end, buf_info[0].size, end ? buf_info[1].size : 0, count);
+	}
 
 	return 0;
 }

-- 
2.34.1

