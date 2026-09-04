Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135237FF7A
	for <mhi@lists.linux.dev>; Fri,  4 Sep 2026 04:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788497197; cv=none; b=ZJvHA5V/qYs7Mxl3j75qHw7UzXumrG/Owc67IC3ZfjOHIKLPsdGlY+Cye4fx2j5VuzbVTJXHYpF3FX7wBI4dBuH22gsdDd9ScObeJZOh5X86DcPBK1uXHD5fFaZKqlzDVHEbQPl9RwdUKiJ2SRoEEppaekv9/IQ3dYl5z9U+vSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788497197; c=relaxed/simple;
	bh=0cyuRZsyRV7fMePzuvBukVQhmVKtfIgdktFzaCqwNNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JH3yDk2Vrj5l/R8OLX8Mt3N2tYLyaD5TQty7gRW7xUt0pwxjAh/Ev4cmthA7OfDVP+x3pqLvql4z6RcQ4yGgi+q0s3kbUL/JddXqDcGm2vEUpUOy4/NxgR1B/lVfwq58Ijp2rQ6mSq6pAyPNTAJ5lJsbZB8kIQGjif5PUokaOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jqvDXjPs; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jqvDXjPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zQ
	kM+HCnejKRi2E1h7auxIKz9fYZA8hTgLrL70LmJWI=; b=jqvDXjPstp7jAKMmf0
	eqQLqSgofHkQxwyz+mYXHnuIefu4jT87Op5XsE6HiGt+hWishkHWdlopjZIDl76M
	oL1Sr5qdj1kPXRRCt+YjjTTn0RV8k6Nd0rRau0nSkTIpuU1lzrzVRoFNSjuv2iLp
	Lr47HwBZcwuDnon8CTb0pr60o=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXFvIXTZpqIV87Ag--.5396S2;
	Fri, 04 Sep 2026 12:46:16 +0800 (CST)
From: zwq2226404116@163.com
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mani@kernel.org,
	quic_vpernami@quicinc.com,
	krishna.chundru@oss.qualcomm.com,
	jeff.hugo@oss.qualcomm.com,
	zwq2226404116@163.com,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: [PATCH v5 1/1] bus: mhi: pci_generic: add Rolling Wireless RW151 1501/1502 PCI IDs
Date: Fri,  4 Sep 2026 12:42:44 +0800
Message-ID: <20260904044612.6334-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702100013.545593-1-zwq2226404116@163.com>
References: <20260702100013.545593-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXFvIXTZpqIV87Ag--.5396S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw43tFWfJF1DAF4rXry5Arb_yoW8CFy8pF
	4Skr4rCr4DZrWjkayjqFykJF9Y9anakryDKrZ2k3yag34DtFyjqryvgr1Ygw4Yqa18WFya
	vFyDuryDW3WUJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRlALiUUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0hia8WqaTRg3dwAA3E

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

Hi,
Please find v5 on top of v1/v2/v3/v4. It adds PCI_DEVICE_SUB entries for
RW151 sub-vendor 0x2099, sub-device 0x1501 and 0x1502 on QCOM 0x0309,
continuing the 1500 series.
If you have any comments on v4 and before, I am happy to address
them. Please also let me know whether you prefer incremental follow-ups
like this or a single squashed series before merge.
Thanks,
Wanquan Zhong

bus: mhi: pci_generic: add Rolling Wireless RW151 1501/1502 PCI IDs

Add PCI_DEVICE_SUB entries for sub-vendor 0x2099, sub-device 0x1501 and
0x1502 on QCOM 0x0309 (sdx75). These are additional RW151 variants in the
same ID series as 0x1500.

Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>

---
v4 -> v5: Add RW151 PCI subsystem IDs 2099:1501 and 2099:1502
 drivers/bus/mhi/host/pci_generic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index d686aef6e158..af76ce57ce10 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1039,6 +1039,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1500),
 		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
 	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1501),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1502),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb8),
 		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
 	/* Rolling RW151 (sdx75) */

--
2.50.0

