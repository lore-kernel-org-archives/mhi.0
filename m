Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1513F44D9
	for <mhi@lists.linux.dev>; Tue,  2 Jun 2026 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416060; cv=none; b=MbMzTWmg81BLhSt7z8wDb2+W9UwIfA9YMdSIz/OEY91b8hHMpJd9jKY2OIMrRRp2Nk0nF9wlDrvIg6y5wcBK7EbVwF99afgz0f++cCNoowkcpwhqcDXC8T+Tj1Dos83CItaB6sK/S+xaSB7DBngURgJddFI5DzjEZ3lZnGeKOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416060; c=relaxed/simple;
	bh=X8LfJRRyM9dmOoOOb2mWEz0vr0fXvVv70ydCa+gf9sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=PMUD/yv922UaIK6pADXcwlmWGxYJHHWylCSEsPS+kMVmmKvnA5uNEOFU6FLKse5A0qM8xacphAr7gUz3rWSuCXxjBFX7NLyqXWmO1RBndR1oo/kYaq1r+KaB4TZUoL/F/BumAPBF9alMZV3imPuu5DG63rxZkyNaayLMSr4zJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6jRkobn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6jRkobn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780416058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7lhxXhmw63vVneHWPJnRnLBBsQzjvsFQ841tAfawJk=;
	b=V6jRkobnHwzdVgJX4HvjFoLXO8sdwJQKDAkb7cnQ6MYBifBJxul9kpS8k9byXNiK4re4U5
	FMvp01DoFFfSEU3uJMzhbN61hrSEMk7VIhZkSPw/U71feUlbKQTYpuQF0hqzyz5wdqL3dE
	R1iFGSSQQLwH10q5WzJKht9AM0CqU98=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-4xXEZffvO5aYmkMZnahdfQ-1; Tue,
 02 Jun 2026 12:00:57 -0400
X-MC-Unique: 4xXEZffvO5aYmkMZnahdfQ-1
X-Mimecast-MFC-AGG-ID: 4xXEZffvO5aYmkMZnahdfQ_1780416055
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E93F1955F1A;
	Tue,  2 Jun 2026 16:00:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.109])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53BBA1953947;
	Tue,  2 Jun 2026 16:00:51 +0000 (UTC)
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
Subject: [PATCH v6 3/3] PCI: Disable broken bus reset on Qualcomm devices
Date: Tue,  2 Jun 2026 18:00:24 +0200
Message-ID: <20260602160024.1171949-4-jtornosm@redhat.com>
In-Reply-To: <20260602160024.1171949-1-jtornosm@redhat.com>
References: <20260602160024.1171949-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 3F4Q_OKGS-CICRiEF6KPEXSKLq_mCxET_YvZzhNoVdI_1780416055
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Some Qualcomm PCIe devices (ath11k WiFi, ath12k WiFi, SDX62/SDX65 modems)
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
v6: code unchanged from v5
v5: https://lore.kernel.org/all/20260521130512.515125-4-jtornosm@redhat.com/

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
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1103, quirk_no_bus_reset); /* ath11k */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1107, quirk_no_bus_reset); /* ath12k */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x0308, quirk_no_bus_reset); /* SDX62/SDX65 */

 /*
  * Root port on some Cavium CN8xxx chips do not successfully complete a bus
--
2.53.0

