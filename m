Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA65111A7;
	Tue, 13 Oct 2026 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905391; cv=none; b=rwPu7W/hESthmiIphpS3t0AGkAibkkyl+S935fUTDrKZBMIp8q6deg5rNb9bxnth8bfv/qGJCsBOrIWp90s+NZduSKgIe2ZOqWN8ihRiXnq0AoBdmVBX9PrXVRGlZ0lCZiW4MrPdsmfD3GMtFF8pOsGm0wU1cpMQqk453prukqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905391; c=relaxed/simple;
	bh=yMADCLCAtBUt7+kChO5lYoSNmJEH0C8EUxkSCqh/QbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b6nYhQZzcvTpZFoeWCh49A0aZTkB0BfGVscjcl/t7UzZJZ16EAQ0dHJr/vvwM+Z8P0Z9ZwFlwA8vavm4Qw473kLOsm/5gh9Fwu8nRqnowpZKiVCQjLh3e5cPTM3dQuxDsZBgKzo18TCgUVlw+K8SLMB2S5bnS8TiJXChTYIpQs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dU0AxCiD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dU0AxCiD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1D55C2BCF4;
	Tue, 13 Oct 2026 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791905390;
	bh=yMADCLCAtBUt7+kChO5lYoSNmJEH0C8EUxkSCqh/QbU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=dU0AxCiDQXqJcw2ujJimw9thgH4lnZ7S4OZRV/4e3JoQex+0/3miIpdexm+ATVZHH
	 +x6oa2agz5KnuzYp1RoqWMnkRHb2+ipgH2BNyaRIh1q6SENnScueCaUsTOtOBZjh/O
	 amH4fKdGsx9IF9dVOq4gU3UgmilrxyYQNIFYEiDnLfWdAx2R1l5PncwTfrMzIqbTlY
	 FOS6I9L7nZaULttAdTKz78YtPnD/9w8X2d8WAPJnJaobUsBclOQmbKW4abyYJSPPCa
	 ytGJ2VIZ269hpBeKpshK6gWYsCMqt8WRixaA0aGBJLSyiH00a906m+zO2qRjMWTe+s
	 qJE9Jfh+g9VdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761FBCC6B16;
	Tue, 13 Oct 2026 15:29:50 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Tue, 13 Oct 2026 17:29:38 +0200
Subject: [PATCH] bus: mhi: host: pci_generic: Add HP Snapdragon X72 5G
 modem support
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-mhi-add-hp-x72-v1-1-cf26405bf097@canonical.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDtgxqpNryIubDKaKfhDoiKId
 zfq8lu8t0NgLxzgm+zgeZUg4xChXgkY1wwdo9hooJQKlSrC3gk21qKbcCsJNeXZpzW6LPQbYjR
 5bmW7h1X9OCy/P5v5usBxnPb3IbpyAAAA
X-Change-ID: 20261012-mhi-add-hp-x72-92538fc97694
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=DZhxHHXBj1Cd5Q5l02eE4hIaNt+qOTIa/0lNai/M90U=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqzk5tEkSiTimfSrxvDL0UjYzXjJUAPPoXcAtQb
 /AUP6OlPtSJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCas5ObQAKCRAP04sJC6ZC
 tySrD/42xTSv+fEcQfXei/nVAWc9gyN6dkQVi2iGyQt0mcfQ97iVnNNq3MHtF8SQhU/9FYFAY8Q
 gtaPMw/14RTder6oF263Ss4csMLtZGwsGMxJ18VPR5P8Dv3gCum7AHo29G79pWbAKoc58o4LY22
 ZmF5WL4TgPtPGQRcE28O2Cx99P2QiHUdMcJ1hCoHhu2zXh+MbJ4ANyuvonaAFaKMWBx9PjpUXDp
 vEIqXt+kFHEOC7m4E2ve7whK7PpwrFN1ehVcgXskAlR8pkGr1j2rUkFHOXB8HyRJVISh316JfIt
 BI9j23dMDj0rVsCHK3IoP0sg38Pcn58FmfP99jCh6MXvAD0TCjZFtgAnoe1QvYRbcWU+PxJ3PRg
 gHGNRbpV7h55Rc9FymgTJ4pSLG+PqvbPNIhlYDQvU59S5hiEPeRdwlLLeB1BP4WeMo2dG4wvOUX
 TVSlnC4pDNo1ZNGyPcIvaFQg4VGd+rsf6xuSXFdeRxWWcktTAYQ/Jg95Rm3/Y/lp7TlFI9ni8Tg
 PFI22j9hWctjECbMPWtrGvAow6OrjIUDcOi9iz/dTTMYBeV7W4jRWjcyDqxFgv2CBHfd7SI0Mss
 RWEbbxDsoTmVq8zq3WuJmOYRKXdlyDAjnfNEI7UeaFd5ST8vOKTQ9j4Cb4WO1jJGTvi63K8Sukk
 ppy1jHduGMXivyg==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

Add the PCI ID (103c:8e09) for the HP Snapdragon X72 5G MHI modem found
in HP Snapdragon X laptops such as the HP EliteBook 6 G1q. The modem is
based on the Qualcomm SDX72/SDX75 baseband and uses mhi_qcom_sdx75_info
for controller and channel configuration.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c23b4d..46cafee39f71 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1082,6 +1082,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* NETPRISMA FCUN69 (SDX6X) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
 		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
+	/* HP Snapdragon X72 5G (sdx75) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_HP, 0x8e09),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);

---
base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
change-id: 20261012-mhi-add-hp-x72-92538fc97694

Best regards,
-- 
Juerg Haefliger <juerg.haefliger@canonical.com>


