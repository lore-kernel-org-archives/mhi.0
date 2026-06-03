Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022F846AEF1
	for <mhi@lists.linux.dev>; Wed,  3 Jun 2026 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484371; cv=none; b=b3elJx1ZM/nVzh3S3i31Sde/NQmHF9gXnXAxgbNDhpA0bDnfdoi6A9OV1FOhkw3vcDvH0WgFieTrnrzpWTE1uxX2Uz2KqnZpH6zthvbCRPQU1b58ahY0gUwUeSZTLrWEXL5KUKAWlN3Wqtj3/Thy47+OESJn79pSd63AUQtw68Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484371; c=relaxed/simple;
	bh=L3Jdr9zTMk5w62f8RZI5ycLB+ZJKY7o+2/iVui+gdw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=FPNUc0hMb9sZ1t8iwTyRlXNheq8cIH8FF9WmuOz8xyB0SYjTD/m6ErIfCTyADe0ila5iBKLDnYS4y7piSP0oMa8bl1XMS2YI1E4/yBQWTxR1gz7qflC7InTRTv3ng5a7tRRKzup9Dv+SaguuAnJyH2QaRYN+FNkBVgGSQ85/DkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWkcBleN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWkcBleN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780484369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEIpI5UUbeeTmfMn6Fr/4J/TUJu4+0oPS+MQRpTIvRU=;
	b=DWkcBleNC3lpGtT3cgbTi+X9U25Yy6qzi4tVOA+vEzH4/zAH1ihgTpdmm8lG0tOLZKtA/L
	SQQESJ6upRuqkjXa+AG4FYg9FazaTIvQBBRjRcYMjs6v/3QCRIUxJ21fdjiO1ZK8+gRR8U
	0v5QHShx5aeXMTFaupmJrfkvyX6jdKw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-PUfFB2SnOdiqVZzE7BNLTg-1; Wed,
 03 Jun 2026 06:59:24 -0400
X-MC-Unique: PUfFB2SnOdiqVZzE7BNLTg-1
X-Mimecast-MFC-AGG-ID: PUfFB2SnOdiqVZzE7BNLTg_1780484362
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74FA21800370;
	Wed,  3 Jun 2026 10:59:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.81])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C7B41956095;
	Wed,  3 Jun 2026 10:59:18 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org
Cc: jjohnson@kernel.org,
	mani@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v7 3/3] PCI: Disable broken bus reset on Qualcomm devices
Date: Wed,  3 Jun 2026 12:58:53 +0200
Message-ID: <20260603105853.326290-4-jtornosm@redhat.com>
In-Reply-To: <20260603105853.326290-1-jtornosm@redhat.com>
References: <20260603105853.326290-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 5G-tRucEcrfwwqwj9I5ChWjzyY9InXUXrYk_7g7A-mo_1780484362
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
do not properly support Secondary Bus Reset (SBR).

Testing confirms this is device-specific, not deployment-specific:
MediaTek MT7925e successfully uses bus reset through the same passive
M.2-to-PCIe adapters where Qualcomm devices fail, proving PERST# is
properly wired through the adapters.

This quirk acts as a safety net, preventing the broken bus reset from being
attempted if users override reset methods (device_specific or d3cold when
available) via sysfs.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v7: Address the comments from Jeff Johnson: the problem was detected for
    the specific devices WCN6855 and WCN7850, use the name of the devices
    instead of the related drivers ath11k and ath12k, which support a large
    number of devices
v6: https://lore.kernel.org/all/20260602160024.1171949-4-jtornosm@redhat.com/

 drivers/pci/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 000000000000..111111111111 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3789,6 +3789,9 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0030, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0032, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003c, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0033, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0034, quirk_no_bus_reset);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003e, quirk_no_bus_reset);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1103, quirk_no_bus_reset); /* WCN6855 */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1107, quirk_no_bus_reset); /* WCN7850 */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x0308, quirk_no_bus_reset); /* SDX62/SDX65 */

 /*
  * Root port on some Cavium CN8xxx chips do not successfully complete a bus
--
2.53.0

