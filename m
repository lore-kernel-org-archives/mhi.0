Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9C38C42B
	for <mhi@lists.linux.dev>; Mon,  3 Aug 2026 10:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753137; cv=none; b=akZdajpqCyad3X8fjFbBOTzd8gs4qGt3TJ69BUqPt5Qriji9MeVx055D8SFN7sANXhHg3bQINUBzUpb2oAdjz6Sx/R0GnCzH6NhzHRf3q93C8iKPG56BxeqBltFU2oR5QH2cOKmk9jItQNk06pnnfYYwjph1LxAIhyyzssCBIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753137; c=relaxed/simple;
	bh=4QpWEADG4CkH+CP53+qDbiZyPNja9E4z4/xXmZqrsQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lyvFaMY8DBhPVsPttWLqXV37oC7BA1PVz9J4qN0tbVKSi/7v4hUUkHZVs1XkpKwbYwY+Ezh19QOBILntvD1FLES4Nz4iJrjW/9SwnmX4Hr8E1c387gQhfmEyCNRX+DSvBEoh7x3ZFop500Pxkn3SYnaKpje+wu+dEvnITKtmKaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYpkr6g1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVV60vdn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYpkr6g1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVV60vdn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Sh9L3758974
	for <mhi@lists.linux.dev>; Mon, 3 Aug 2026 10:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzu2DfTz3pF/jHcouD27Xpy/1af5e6d+vxLdTi60Gn8=; b=WYpkr6g1QMq82YYo
	CdlBk1aTNqaYeUMNk96gKNxLn6EkUz5C4QgXlxrZRY1xYi85RoAHZd1/0wSpCFWK
	zrZ8AJZFArRm3P24u1OWXqJFK/0Jq4QdvwREGe2yfw6W+ZTuP0qU5sfDAK5iify4
	kpEfLIyrAeWPYfCbWPeyp9aGZyzajCGTDNLGfQi1IgWBv7x/UHLE4sI+DYYV5CLN
	+wIDSn2GsMyMak+0W+tfFSLyUYlnG6jkqeLvxOyW3mV5GNh/MtZBXf/cnDsNQf1C
	1lNVWiwphlep6DtdEjcvdLgTDFeK2t4T6mVPsyWfxmFxhI8tGT5f/j4GhbRNGuPw
	HT8I2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrns1nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 10:32:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so74560875ad.1
        for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 03:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753134; x=1786357934; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzu2DfTz3pF/jHcouD27Xpy/1af5e6d+vxLdTi60Gn8=;
        b=BVV60vdnC74G9VKwfyAdbKv0TPbMwJA0CSIdMIfZNCAGxLgL8tgCWwbdAEggbmpPOg
         Ga+ZjicSyMb6rJNKoL8466wcqahbDMA70JKqI6CnuWLxAMcpLmNtS7t+0RbSy7ozw+qv
         XKto3aGbGr8QLXysD8PHJqC2k4/NFV3NlYTfTmzMUuoHh5MqSgtHUrxtzmDAdSC8w9eC
         OmLt1GYgb/EZiB6OHPm3s8tQQpcm4irMjYmOD9CBR7kyIAEXJVZYQLQZWYOvU2pPCU5l
         CdA0R4WrAPtQBWuBOjaVMaxzneJ+tSf5V8WiRvkqbixq3CziHF93xwjwqlBRvFbX0RDB
         56ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753134; x=1786357934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kzu2DfTz3pF/jHcouD27Xpy/1af5e6d+vxLdTi60Gn8=;
        b=SViPMR+l1tDibEOY83sMIqtBySiALlnZhewPsMOfgPMg8NqmycaNlzbJhjSnQZDbLG
         0SiMg/8VLio3UIe9auV6TQQnDnh7jFkoXsLoh1YbOMfBytdP7MfsdEkYANhw2lQB1K3Z
         DtJ0J3+mmtrWXzuj7KztOsr5t05apyEvG0PmbcOcIC6tiF7otF8guZgsRcqcmxf4x/L8
         Iqy7NX54PspvQ5dyTUEP9c9rZA0Ortzf6zrnrjbK59TgX9GlK5uSn9KeuduZfYJ/5p30
         freKI3iGeuQAKxpgsBBWwvGlNh6R81+dRzECqiMp7+wWDRoaG8X0vNnVIAaK79wH5qVn
         L2gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvTQvOCNEmkIDScnyU1QNS6Muk7AcELSAXOmgCx+aE0SW36ywrvoeBdbp+dPF4+Y/mklA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ0feoHUoVeNDwWJdkCguv53xZUZluDTmKFFhepivoM/4Ip6m5
	henlirT+XK2Ae+o19sPrKEWhGszt7YjlONixNo4q3ZFY7BbgX74H5hGhsuMnbDqU/OjuN9PXPLX
	Jy+/H6xkEJLZvUGNFVmTrEUB3ABB9Arpov3cQOnha9u5svXs9hbl33hA=
X-Gm-Gg: AR+sD13D8k+6mTL+DKQrFQmPYXldcfniooJHzCrRh5FUImxUjAepmOWkEbgXPt8RTnq
	em3KzYHdxog0jfY2ADqrmibdiNu2E2O4zOrdwb5fxxSkbhBxmZ/8oC4Heg3tnVj3CfNuG5+LW0j
	gEr9OfYshne7Zf1tMFzY60Gp91eIawOh4u0kOujEK/ExOUMm11REwTvRG56vuY87Oj6Gq2vQIlo
	0CAtBI9Es38lfgsg5y+vrOftwBJ4K35m0vq1gstDuzyVZzndgA8BA7BViGwfZXKXxpmN0DrxCVM
	tff3PTFVSw6q7qgL18OAoJac3NMldcBO5K6ZcRM869hsoaGhOuVB0KLZdvYeYA/NSwei5iydYV6
	mm24GlTnU/BWX5yHqbSxkFNXmpQ==
X-Received: by 2002:a17:90b:1c06:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-38fbc0c9bd9mr8433527a91.0.1785753133440;
        Mon, 03 Aug 2026 03:32:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1c06:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-38fbc0c9bd9mr8433492a91.0.1785753132847;
        Mon, 03 Aug 2026 03:32:12 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:12 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:46 +0530
Subject: [PATCH v2 4/5] PCI: epf-mhi: Add batched DMA read support
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-4-c12bb05e42d6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=9526;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=4QpWEADG4CkH+CP53+qDbiZyPNja9E4z4/xXmZqrsQU=;
 b=ZWwBKKhxFxlU1y+hFSSNRfzdca0yerwMiZT59hD0GLb/a9RUBqcBLIw8RAerzrnXxnxqspfbn
 e+CVE/QIXHqCnPyltWZXuJbQvYvf1rZTufLFnkxZRjavIROgytwFvCy
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXxQdFaanGFFqB
 mGRTd923/7ieajXVfRSTGmAn2aN5fHmBq2uriUHqf0WfnnG/RcCjM54LX3sog9vix9xOrrbACPn
 YORT2TZGtHBhTRzHAzg07hEW83a9zV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXyUfZj/5cRJaY
 rYjCQfeewvH4Z65wfmvZ9h5s51PXnWz+pfZr8ihmpAhLte9RRYGcEpAjeDcjqPYznON7d2itTeA
 IOnJAq67ZTEnpRrmu8sfep+Hdcwoa3490M3jRBfrOnTXMfjFf+RsjqEQgDsdFA2h87aMHbecVZ9
 pVzrIowVU4QsfiUHvUpFSj59N/iFHt9XO8yIVf99ZKz3wr48JwRASRipfYOW3s5JK0DMALG8n9Y
 HRw6CCm8wR5zGo7JGNs7AdopcyJj7bJ676SpjgeihoVlPW/A4Y2ZWZ8lAkV0KtgHkAoAZbTJ7lQ
 V22G0fPPDSXOHJZVkedmqL5RwDBJ4PszUfi4ewEUDtD0Y0pILXrmOc/2YQn4G8PP7bK0jcHldtB
 kFh8UcIJrpHbS6OU0Y2cuy8jw3OvQg28w+yhzZoytiFZBc2N7hImEDy6dGGHIEvFvshSWVH3GSe
 7/hd67cV4N6v0BmM1aA==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a706e2e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DqDsU1vVsjqoWll3QmEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 4MHtNJJiMtwcvMGKnMaubLm6Y_6anF28
X-Proofpoint-ORIG-GUID: 4MHtNJJiMtwcvMGKnMaubLm6Y_6anF28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

Add support for batched DMA transfers in the PCI EPF MHI driver to
improve performance when reading multiple buffers from the host.

Implement two variants of the read_batch() callback:
pci_epf_mhi_edma_read_batch() is a DMA-optimized implementation that uses
dmaengine_prep_dma_sg() to transfer multiple buffers in a single DMA
transaction, while pci_epf_mhi_iatu_read_batch() serves as a CPU-copy
fallback for platforms without DMA support by sequentially processing each
buffer via IATU mapping. Wire up read_batch() to the eDMA variant only
when the RX DMA channel advertises the DMA_SG capability, falling back to
the IATU variant otherwise.

On a successful batch, notify completion for every buffer via its
caller-supplied buf_info->cb, mirroring the read_sync/read_async
completion semantics so the MHI stack can free each buffer and raise its
transfer completion event. Make read_batch() a mandatory callback in
mhi_ep_register_controller(), alongside read_sync/write_sync/read_async/
write_async.

This enables the MHI endpoint stack to cache ring data efficiently,
particularly for wraparound scenarios where ring data spans two
non-contiguous memory regions.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c                    |   3 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 159 +++++++++++++++++++++++++++
 include/linux/mhi_ep.h                       |   7 ++
 3 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 21bc2c50170ff7f0181c0d0d4eefd51db30f34c8..c45240fc481dc3260a61b546c223b6be8e105587 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1459,7 +1459,8 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 		return -EINVAL;
 
 	if (!mhi_cntrl->read_sync || !mhi_cntrl->write_sync ||
-	    !mhi_cntrl->read_async || !mhi_cntrl->write_async)
+	    !mhi_cntrl->read_async || !mhi_cntrl->write_async ||
+	    !mhi_cntrl->read_batch)
 		return -EINVAL;
 
 	ret = mhi_ep_chan_init(mhi_cntrl, config);
diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 6bac69fc84b472c5f1abbeede2b441b5db73c784..ad245148de1462cffc950ba9a9e232405514dfb7 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -444,6 +444,162 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
 	return ret;
 }
 
+static int pci_epf_mhi_iatu_read_batch(struct mhi_ep_cntrl *mhi_cntrl,
+				       struct mhi_ep_buf_info *buf_info_array,
+				       u32 num_buffers)
+{
+	struct pci_epf_mhi *epf_mhi = to_epf_mhi(mhi_cntrl);
+	struct device *dev = &epf_mhi->epf->dev;
+	u32 i;
+	int ret;
+
+	if (num_buffers == 0)
+		return -EINVAL;
+
+	for (i = 0; i < num_buffers; i++) {
+		ret = pci_epf_mhi_iatu_read(mhi_cntrl, &buf_info_array[i]);
+		if (ret < 0) {
+			dev_err(dev, "Failed to read buffer %u of %u in batch: %d\n",
+				i, num_buffers, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int pci_epf_mhi_edma_read_batch(struct mhi_ep_cntrl *mhi_cntrl,
+				       struct mhi_ep_buf_info *buf_info_array,
+				       u32 num_buffers)
+{
+	struct pci_epf_mhi *epf_mhi = to_epf_mhi(mhi_cntrl);
+	struct device *dma_dev = epf_mhi->epf->epc->dev.parent;
+	struct device *dev = &epf_mhi->epf->dev;
+	struct dma_async_tx_descriptor *desc;
+	struct dma_slave_config config = {};
+	DECLARE_COMPLETION_ONSTACK(complete);
+	struct scatterlist *src_sg;
+	struct scatterlist *dst_sg;
+	unsigned long time_left;
+	struct dma_chan *chan;
+	dma_cookie_t cookie;
+	unsigned int i;
+	int mapped;
+	void *buf;
+	int ret;
+
+	if (num_buffers == 0)
+		return -EINVAL;
+
+	/*
+	 * Single allocation carved into two arrays: src_sg[], dst_sg[].
+	 * Reduces allocator round-trips on the ring-cache hot path. Done
+	 * before taking the lock so direct reclaim cannot stall other
+	 * transfers waiting on epf_mhi->lock.
+	 */
+	buf = kcalloc(num_buffers, 2 * sizeof(*src_sg), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+	src_sg = buf;
+	dst_sg = src_sg + num_buffers;
+
+	mutex_lock(&epf_mhi->lock);
+
+	chan = epf_mhi->dma_chan_rx;
+	if (!chan) {
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	sg_init_table(src_sg, num_buffers);
+	sg_init_table(dst_sg, num_buffers);
+
+	for (i = 0; i < num_buffers; i++) {
+		/*
+		 * src addresses are PCIe host bus addresses already visible to
+		 * the eDMA engine; no dma_map_sg() is needed for the source list.
+		 */
+		sg_dma_address(&src_sg[i]) = buf_info_array[i].host_addr;
+		sg_dma_len(&src_sg[i]) = buf_info_array[i].size;
+
+		sg_set_buf(&dst_sg[i], buf_info_array[i].dev_addr, buf_info_array[i].size);
+	}
+
+	mapped = dma_map_sg(dma_dev, dst_sg, num_buffers, DMA_FROM_DEVICE);
+	if (!mapped) {
+		dev_err(dev, "Failed to map destination buffers for %u-buffer batch read\n",
+			num_buffers);
+		ret = -EIO;
+		goto err_unlock;
+	}
+
+	config.direction = DMA_DEV_TO_MEM;
+	ret = dmaengine_slave_config(chan, &config);
+	if (ret) {
+		dev_err(dev, "Failed to configure DMA channel for %u-buffer batch read: %d\n",
+			num_buffers, ret);
+		goto err_unmap;
+	}
+
+	desc = dmaengine_prep_dma_sg(chan, dst_sg, num_buffers,
+				     src_sg, num_buffers,
+				     DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
+	if (!desc) {
+		dev_err(dev, "Failed to prepare batch DMA\n");
+		ret = -EIO;
+		goto err_unmap;
+	}
+
+	desc->callback = pci_epf_mhi_dma_callback;
+	desc->callback_param = &complete;
+
+	cookie = dmaengine_submit(desc);
+	ret = dma_submit_error(cookie);
+	if (ret) {
+		dev_err(dev, "Failed to submit DMA\n");
+		if (dmaengine_terminate_sync(chan))
+			dev_err(dev, "Failed to terminate DMA channel after submit failure\n");
+		goto err_unmap;
+	}
+
+	dma_async_issue_pending(chan);
+
+	time_left = wait_for_completion_timeout(&complete,
+						msecs_to_jiffies(PCI_EPF_MHI_DMA_TIMEOUT_MS));
+	if (!time_left) {
+		dev_err(dev, "DMA transfer timeout\n");
+		if (dmaengine_terminate_sync(chan))
+			dev_err(dev, "Failed to terminate DMA channel after timeout\n");
+		ret = -ETIMEDOUT;
+		goto err_unmap;
+	}
+
+	ret = 0;
+
+err_unmap:
+	/* dma_unmap_sg() must use the nents passed to dma_map_sg(), not its return value */
+	dma_unmap_sg(dma_dev, dst_sg, num_buffers, DMA_FROM_DEVICE);
+err_unlock:
+	mutex_unlock(&epf_mhi->lock);
+
+	kfree(buf);
+
+	/*
+	 * On a successful batch, notify completion for every buffer via its
+	 * caller-supplied callback so MHI can free the backing buffer and raise
+	 * the transfer completion event per entry, matching the
+	 * read_sync/read_async semantics. Done after dropping the lock as a
+	 * callback may re-enter the driver and epf_mhi->lock is not reentrant.
+	 */
+	if (!ret) {
+		for (i = 0; i < num_buffers; i++)
+			if (buf_info_array[i].cb)
+				buf_info_array[i].cb(&buf_info_array[i]);
+	}
+
+	return ret;
+}
+
 static void pci_epf_mhi_dma_worker(struct work_struct *work)
 {
 	struct pci_epf_mhi *epf_mhi = container_of(work, struct pci_epf_mhi, dma_work);
@@ -789,11 +945,14 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
 	mhi_cntrl->read_sync = mhi_cntrl->read_async = pci_epf_mhi_iatu_read;
 	mhi_cntrl->write_sync = mhi_cntrl->write_async = pci_epf_mhi_iatu_write;
+	mhi_cntrl->read_batch = pci_epf_mhi_iatu_read_batch;
 	if (info->flags & MHI_EPF_USE_DMA) {
 		mhi_cntrl->read_sync = pci_epf_mhi_edma_read;
 		mhi_cntrl->write_sync = pci_epf_mhi_edma_write;
 		mhi_cntrl->read_async = pci_epf_mhi_edma_read_async;
 		mhi_cntrl->write_async = pci_epf_mhi_edma_write_async;
+		if (dma_has_cap(DMA_SG, epf_mhi->dma_chan_rx->device->cap_mask))
+			mhi_cntrl->read_batch = pci_epf_mhi_edma_read_batch;
 	}
 
 	/* Register the MHI EP controller */
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 7b40fc8cbe77ab8419d167e89264b69a817b9fb1..51f66cae937a53a93e9ae76cdcfaac7b1e08283f 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -107,6 +107,11 @@ struct mhi_ep_buf_info {
  * @write_sync: CB function for writing to host memory synchronously
  * @read_async: CB function for reading from host memory asynchronously
  * @write_async: CB function for writing to host memory asynchronously
+ * @read_batch: CB function for reading from host memory in batches synchronously.
+ *              Callers must pass at least one buffer (num_buffers > 0); each
+ *              buf_info entry must have host_addr, dev_addr and size set.
+ *              Each buffer's buf_info->cb, if set, is invoked once the batch
+ *              completes successfully, mirroring read_sync/read_async.
  * @mhi_state: MHI Endpoint state
  * @max_chan: Maximum channels supported by the endpoint controller
  * @mru: MRU (Maximum Receive Unit) value of the endpoint controller
@@ -164,6 +169,8 @@ struct mhi_ep_cntrl {
 	int (*write_sync)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
 	int (*read_async)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
 	int (*write_async)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info);
+	int (*read_batch)(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_buf_info *buf_info_array,
+			  u32 num_buffers);
 
 	enum mhi_state mhi_state;
 

-- 
2.34.1

