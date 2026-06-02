Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76DA3F23C0
	for <mhi@lists.linux.dev>; Tue,  2 Jun 2026 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416043; cv=none; b=FzizoHj0IQnspwlrfcSzUSm4VT7Rjf966ELdQckOqI62/ncnLoJqn3auA9QDzqclgDAB1iWZOIMAyNHIXEu3xlj0A7BzCmBjXljaQa7Pz5nDH6GQybbdZI9Q5NbQyJtT0oTxvhI96mVW3eUlYvrJyksjGXmNFBKdgaE43RkMfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416043; c=relaxed/simple;
	bh=uZdF596PNZnuGbALi2cUiTrmcQOsXIobn1K8xAwNAh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=f8yVTzk+MJ9G8PkVJSAsXzGXcAwLHfoKF1eVw+UoMy87w3PdIzq/GwtRHMIkqvBKC1qcpb9Qo8VL5f/tjKwdm7HkCNJjVQdNQ9yFIEn8nt4fY4brDrHTADN+YA2RHnVuTuA4RrWOqusfpbTjgRHOT00MqGfmMKcnGX6S0dmDq2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8IeBj9y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8IeBj9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780416041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ScNxumSQCLZY0CA50/rf+ukYfKVFTKvR4NqwPnDooNA=;
	b=E8IeBj9y4Qdavm7MyaZVS8AvxNr2cAtldp0bvULo5xpYMeB2fXjIjXzKH+TQD2aDXVuE5O
	Lo4x1aFEdXIzC07Wxowp66OFZ2cYm/MX6vGkD96iIgxiM2DjjC5uImby5Y3z9iEFbjQ3QN
	aA64R6fnhsEfuPwLSNW374ecE93bMjA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-jBXE21GHNhyXaxH5QHis2w-1; Tue,
 02 Jun 2026 12:00:37 -0400
X-MC-Unique: jBXE21GHNhyXaxH5QHis2w-1
X-Mimecast-MFC-AGG-ID: jBXE21GHNhyXaxH5QHis2w_1780416034
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1698C18005B6;
	Tue,  2 Jun 2026 16:00:34 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.109])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A22961956095;
	Tue,  2 Jun 2026 16:00:29 +0000 (UTC)
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
Subject: [PATCH v6 0/3] PCI: Add d3cold and device-specific reset for Qualcomm devices
Date: Tue,  2 Jun 2026 18:00:21 +0200
Message-ID: <20260602160024.1171949-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: XhAQzxKK27_4TPq6mQ43xlsuYqJhor2bBhatgmjk9-U_1780416034
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
Adds device-specific reset entries for Qualcomm ath11k/ath12k WiFi and
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

v6: - Patch 1/3 and 3/3 unchanged from v5
    - For patch 2/3, fix double IOMMU handling for device-specific reset:
      remove pci_dev_reset_iommu_prepare/done from pci_dev_d3cold_d0_cycle()
      helper, keep in pci_d3cold_reset() caller
    - Qualcomm maintainers CC'd
v5: https://lore.kernel.org/all/20260521130512.515125-1-jtornosm@redhat.com/

Jose Ignacio Tornos Martinez (3):
  PCI: Add d3cold as general reset method
  PCI: Add device-specific reset for Qualcomm devices
  PCI: Disable broken bus reset on Qualcomm devices

--
2.53.0

