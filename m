Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B60181
	for <mhi@lists.linux.dev>; Mon, 31 Oct 2022 08:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCA2C433D6;
	Mon, 31 Oct 2022 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667205300;
	bh=ASH/N1PVIAa5px2h9gfzwh2e654dPXGg/S3FbL5wbv4=;
	h=From:To:Cc:Subject:Date:From;
	b=XI6nb058S4gn/MfB1GMCiXnCkhiurD4TA1q6ITQAL3PS2bd8X6l2V7RUBQ+TntPzN
	 MS9intDVVcO9DcbYqIlUM8zdBn0D2tDgyzfvVtzYIQUUlIEMkxg9qug3fRwxcOEdds
	 Qi2qJx2aMrMVMDLNyC14FZJtree3RUvhiOyl9jk594kjORjMoVM78VG3+iZ0fTqhZM
	 vJVUT5wyaKh2eHAIvPVN3kjCAuxL4OnDAgpFp7LaolO8NGq7aEqmQhgAaMPzhAyktZ
	 nmwXWf8i37fJ5JpkoSNwc4VCkYRLpsZB98hs4SmEjpSANNifXqNf1s2sh6bZAAgTn7
	 iSUIRT92PdtSQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1opQFq-0004wG-G3; Mon, 31 Oct 2022 09:34:46 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Hemant Kumar <quic_hemantk@quicinc.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] mhi: pci_generic: add support for sc8280xp-crd SDX55 variant
Date: Mon, 31 Oct 2022 09:34:29 +0100
Message-Id: <20221031083429.18971-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SC8280XP Compute Reference Design (CRD) has an on-PCB SDX55 modem
which uses MBIM.

The exact channel configuration is not known but the Foxconn SDX55
configuration allows the modem to be used so reuse that one for now.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index caa4ce28cf9e..f9f4345d472d 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -542,6 +542,9 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
+	/* SC8280XP-CRD (sdx55) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
-- 
2.37.3

