Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308C2496901
	for <mhi@lists.linux.dev>; Tue,  9 Jun 2026 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023028; cv=none; b=n1acP9EfS51pNhWEHK8SHmXl6SJ6qXD0xlM57N/DUTcJ7eW/Nr7jFd/Li+FtHRkaE0u7xuZ6JGfLwgm3mcbTVw6K99OUex5a0U2OaRpBzfoWhNuq1vjXYBWAXn4jVd1Jt4BlHPLVxwogQv8Rs0bHbmYvGoKcC95DPg+L6BpcDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023028; c=relaxed/simple;
	bh=IL9COutDyO8RGv6CNQA+EBUtMk3FFt8zFi+o57rRRo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=Zki1G+janB0DnGt+qmryWjdeD7Kv1nhC9J4IasIZ4ecAcY3bFbQX8XyWGEMiXTExt841InbYHJZS2TdMI7dwBLnF01a9V4AaQ3N1tCPhhNu/PqxWmr6LlB0uBgVJ3rvbSOg4YrRttFKovDSbSbnfQZ9kou0JOW2d4BxI3mYVk8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUIAiXNE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUIAiXNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781023024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mli8j5vHP+lIm+xGChsHaTECZChyQ7K/C3hHJV9kyUc=;
	b=BUIAiXNEPrh0WQHsNoTTJ8i7Q75XVK748nObEk7+XrYB+PDz8hezitBhBbp+wp+UgFsGBM
	BxZxDBkoKFejXyrgorti4RQ/BUMZlAJhq7OlSx//E0E4ouWbSSbSGWlX817LlWhXvIiXG2
	alr/0n5OxHboRiz78cVEKB7KIljme3w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-536-E0wiNN4tPBOamtK6RgatAA-1; Tue,
 09 Jun 2026 12:37:00 -0400
X-MC-Unique: E0wiNN4tPBOamtK6RgatAA-1
X-Mimecast-MFC-AGG-ID: E0wiNN4tPBOamtK6RgatAA_1781023018
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE3B51964CD1;
	Tue,  9 Jun 2026 16:36:57 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.77])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0814C1800662;
	Tue,  9 Jun 2026 16:36:53 +0000 (UTC)
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
Subject: [PATCH v8 0/3] PCI: Add d3cold and device-specific reset for Qualcomm devices
Date: Tue,  9 Jun 2026 18:36:46 +0200
Message-ID: <20260609163649.319755-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: W7hgSG5gs1QUSZFaH4TXmJ4UBoyeVzVTNQ0s3X-RlIE_1781023018
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Some PCIe devices lack working reset methods for VFIO passthrough scenarios.
These devices typically have no FLR, advertise NoSoftRst+ (blocking PM reset),
and have broken or unavailable bus reset. When a VM crashes, VFIO cannot reset
the device for reuse without a working reset method.

This series addresses the problem by adding general d3cold infrastructure and
device-specific reset for Qualcomm devices:

**Patch 1/3: d3cold reset method**
Adds D3cold as a general reset method with strict _PR3 requirement. Only
attempts true power cycling via platform control (ACPI _PR3), never falls
back to D3hot. This provides genuine power-off reset on platforms that
support it.

**Patch 2/3: device-specific reset for Qualcomm devices**
Adds device-specific reset entries for Qualcomm WCN6855/WCN7850 WiFi cards and
SDX62/SDX65 modems using D3cold power cycling with automatic D3hot fallback.
Uses pci_set_power_state(D3cold) which automatically falls back to D3hot on
platforms without _PR3. Extracts shared pci_dev_d3cold_d0_cycle() helper to
avoid code duplication with general d3cold method. Device-specific reset is
position #1 in reset hierarchy, providing immediate working reset for these
Qualcomm devices.

**Patch 3/3: Qualcomm quirk_no_bus_reset**
Disables broken bus reset for Qualcomm devices. Testing proves this is
device-specific: MediaTek MT7925e works correctly with bus reset using the
same passive M.2-to-PCIe adapters where Qualcomm devices fail, confirming
PERST# is properly wired and the issue is not deployment-specific. Acts as
safety net to prevent broken SBR if users override via sysfs.

v8: Fix commit message in patch 2/3: correct IOMMU handling description
    Patches 1/3 and 3/3 unchanged from v7 
v7: https://lore.kernel.org/all/20260603105853.326290-1-jtornosm@redhat.com/

Jose Ignacio Tornos Martinez (3):
  PCI: Add d3cold as general reset method
  PCI: Add device-specific reset for Qualcomm devices
  PCI: Disable broken bus reset on Qualcomm devices

--
2.53.0

