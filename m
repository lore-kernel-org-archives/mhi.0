Received: from devnull.danielhodges.dev (vps-2f6e086e.vps.ovh.us [135.148.138.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA721684B0
	for <mhi@lists.linux.dev>; Fri,  6 Feb 2026 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.148.138.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770408338; cv=none; b=sHhsGS2qDxOLESR2javE3Nz/fVFNScTGpl9Y5HFHminc7nLiu+RbtoeGzaU/UJJ7Bdykm+GMHxAOr/q3CnZ2BNlXni6ulLe461nn04mRj3gxZQQzKX+JAvhLw7/F48IA2JYIzSxuoG2JX2Y0feNT9Hn4QL2BVVClzIqHjpf+SSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770408338; c=relaxed/simple;
	bh=OW+Q3rzodi0tW38z+786M3YCC3DeD5z4t0v6YdGlt2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LaRLkgNyjP2DOfgD8HqlsTV2E59ejYT4gFgyXJdM7ZkdhnjyJosyM01hFoGTg3P4mqonV8yoW7KIP8CVsswtCp8O2ygEvAGzl5wun3cbp6gi+XvOPOUdKGWf27TCuI48hLzIKHEENNlUE2l7QZKPo+U1ZmRGxBrzHlBMSTpNI/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev; spf=pass smtp.mailfrom=danielhodges.dev; dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=i6iburd6; dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=SdPRbV7z; arc=none smtp.client-ip=135.148.138.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danielhodges.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="i6iburd6";
	dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="SdPRbV7z"
DKIM-Signature: v=1; a=rsa-sha256; s=202510r; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1770408330; bh=5QQtgVbtkot2rgxT7w3IBYs
	aUEG80YUdurHvF76mGi8=; b=i6iburd6bUi2yiOeQ92+nHXUYxNSjyhEnBRGyuSMP/HQUBnoya
	J3fWye8Z9O6gKjy7sQ9sp6hmD7lc3iz13A8v5Ugwc5RDqa74QeE0cnIY3PndahfFkFPBJBNbQ5/
	kpFZaHq/+s4bthT16wC0m/VM5GSQjbPYBSnzNnW66uNHI2EsPuk8c9zVw+anDNOvMi7I2CvCoLX
	vUfmrkWhZPytkq3YVf44ZVsnjwWsQvYR6MVT31WcBSZ7156U83SfEZYLhMIWequdWM7SqNvJBQf
	/syEfw3kcog1znFazvPcWNF5Nj40T0etTu7qlGVoxO4e+Llycb0pIf944SP+LWqdtMw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202510e; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1770408330; bh=5QQtgVbtkot2rgxT7w3IBYs
	aUEG80YUdurHvF76mGi8=; b=SdPRbV7zHGtxVuFTg8s2NS6qMmuPmN/qOmRAyiKsZlyhOGmYmP
	roY0mMPhtXSdpKirQd88UKXNOrxH1nS0f4Bw==;
From: Daniel Hodges <git@danielhodges.dev>
To: mani@kernel.org,
	kwilczynski@kernel.org
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Daniel Hodges <git@danielhodges.dev>
Subject: [PATCH] PCI: epf-mhi: return 0 on success instead of positive jiffies
Date: Fri,  6 Feb 2026 15:05:29 -0500
Message-ID: <20260206200529.10784-1-git@danielhodges.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_for_completion_timeout() returns the number of jiffies remaining
on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
and pci_epf_mhi_edma_write() functions use the return value directly as
their own return value, only converting timeout (0) to -ETIMEDOUT.

On success, they return the positive jiffies value. The callers in
drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
read_sync and "if (ret)" for write_sync. This causes write_sync success
cases to be incorrectly treated as errors since the positive jiffies
value is non-zero.

Fix by setting ret to 0 when wait_for_completion_timeout() succeeds.

Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Hodges <git@danielhodges.dev>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 6643a88c7a0c..2f077d0b7957 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -367,6 +367,8 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);
 		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
 	}
 
 err_unmap:
@@ -438,6 +440,8 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);
 		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
 	}
 
 err_unmap:
-- 
2.52.0

