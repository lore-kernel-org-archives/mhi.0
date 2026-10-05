Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2BA3F3288
	for <mhi@lists.linux.dev>; Mon,  5 Oct 2026 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197691; cv=none; b=G0YJbt4PzAIU0mxSQNUxEwcJjC1e9CJFd242hQzegv0XVwaTxprPRPPXhiA0tnw9t0ythsrgz4AoSFkwIQxbz7w+L02grwR7fOk9tbPz9miWW/Ncxxt7ityIO39FWEYg7pqZyD/Z/iNXQv8+gMzb28ndaBZpi5BKjVkTiXa9PI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197691; c=relaxed/simple;
	bh=7yv2fDxwDW/izhtv/3qeKMCYEbfudsMQmfoewhpnBrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=C76NIdgxf9yVppDGQmv865K/DmN3eqNXHzWok88VwOkhRNKwlhD8ThSyOZPHD5R5JmG0OYOiouwbNIBLPj6tVMYPTYyTtH1lWs9EWAkdwI+HNDvIbRcyqpb4idYsW0wYBNCCgY4pzNpFU0mz0FKa4d5uumMvllktU9EZMKjRcOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKHhD371; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKHhD371"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791197689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GQIzOrD80cBVNE5h0CQa8C1wdzcpWOcigbQ+mlRDcY0=;
	b=aKHhD371T7SZSyZv72jc+beIvl1jVLD2iJ2PgHmcIRV597UHKZEgWsVGvPLVWUIZhrLFAB
	HSFa/Y2/XAJGkoUpiXdqC+iudi5Y0ceP4EEkqGmo/zFwNE7aGE2WBYw+fnVI6zY/tShOx0
	Mchsn6RXD5RNQprzvH2T0LcnlH5nwCM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-TFv9j6g5Mwa9XZ7D9O6MFQ-1; Mon,
 05 Oct 2026 06:54:47 -0400
X-MC-Unique: TFv9j6g5Mwa9XZ7D9O6MFQ-1
X-Mimecast-MFC-AGG-ID: TFv9j6g5Mwa9XZ7D9O6MFQ_1791197685
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B373C18007E7;
	Mon,  5 Oct 2026 10:54:44 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4CFD71800446;
	Mon,  5 Oct 2026 10:54:41 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	mani@kernel.org
Cc: jjohnson@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v15 0/2] PCI: Add device-specific reset for Qualcomm devices
Date: Mon,  5 Oct 2026 12:54:34 +0200
Message-ID: <20261005105436.83962-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: YXa0IyGiBDCPEF_Q3wuXaEhIZ9CcwuyOo_jwvl7tSuk_1791197685
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Some Qualcomm PCIe devices (WCN6855, WCN7850 WLAN; SDX62/SDX65 modems)
lack working reset methods for VFIO passthrough scenarios. These devices
have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
broken bus reset.

Standard reset methods were already disabled for these devices by commit
6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm WCN6855/WCN7850 WiFi,
SDX62/SDX65 modems") because they were not working (quirk_no_bus_reset).

VFIO attempts to reset devices on every reassignment:
- For the listed modems, without a proper reset capability, these devices
never successfully initialize even on first VM assignment.
- For the listed WLAN devices, without a working reset method, the attempt
fails. On clean VM shutdown, the guest driver properly deinitializes the
device via .shutdown/.remove callbacks, leaving it in a usable state despite
the failed reset. However, on unclean VM termination (crash, force-off), the
guest driver callbacks are not triggered, the device remains in an undefined
state (DMA active, interrupts enabled, etc.), and without a working reset it
cannot be reused.

Add device-specific reset methods using BAR-space hardware reset registers
that exist in these devices:

  Patch 1: SDX62/SDX65 modem reset via MHI SoC reset
  Patch 2: WCN6855/WCN7850 WLAN reset via SoC global reset

These are true hardware reset mechanisms (not power management or firmware
error recovery), providing proper device reset for VFIO scenarios, allowing
to enforce isolation between successive passthrough users.

Testing shows stable operation over 100+ VM crash/reset cycles. Device-
specific reset is position #1 in the reset hierarchy, so these devices
will use hardware reset as their primary reset method.

Jose Ignacio Tornos Martinez (2):
  PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
  PCI: Add device-specific reset for Qualcomm WCN6855/WCN7850 WLAN

 drivers/pci/quirks.c | 116 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

---
v15: Address Bjorn Helgaas feedback:
  - Explain the relationship with 6a4f64c3a3ad ("PCI: Avoid SBR for Qualcomm
    WCN6855/WCN7850 WiFi, SDX62/SDX65 modems") and previous status.
  - No code changes from v14, only commit message clarifications (Mani's
    Reviewed-by and Alex's Acked-by retained)
v14: https://lore.kernel.org/all/20260917071651.14174-1-jtornosm@redhat.com/

--
2.54.0

