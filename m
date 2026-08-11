Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CB43E9E0
	for <mhi@lists.linux.dev>; Tue, 11 Aug 2026 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448601; cv=none; b=u5ZSjvLEUctoZ/f3a8A/f0RxGr3yhm+7jyEv2F184/r7JHLB5/6V4KfxHf3CkDNiWfcoFYKiPmIZV64i96nSJcwUB4WJCJlV+QxthO4szSHAy4VIRBfp/oRx0Jwqr2Z66E9BqhI5lXldfN4rRgj9HH7jg44Eu+90S5uRKxtmooA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448601; c=relaxed/simple;
	bh=VR/FR12up2l3bccBXUXL/3VFyoBK3DsRHlCU42gGUeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=XDjFxqOjDyDukSMZfINgW/v02wC3mgXCisOpoDW41TFY+RzMUUF3s1SS3ePVEpTAw4l5/4sDAcNdY9ARMNJksZFm1hM111RRNx3tHU5ngwFNMHXZLltJvqGT1rJ2zka2qBYNxnJ1FDirC6EHQDFA1B8LauaUaLBp/sBfrDNMnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cf8/hH6T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cf8/hH6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786448599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VR/FR12up2l3bccBXUXL/3VFyoBK3DsRHlCU42gGUeo=;
	b=Cf8/hH6TGz21BjWKDJeQLIIFLO8oflpwogwpMo2Ykb/Ki/7hY5yQvFOpbvogOlrvU64Uf2
	EqIHTWRemQYrO66x6TK0ooJDTUOd2HB5r/M3k30J4917wclYTMLKBsSwWTZPBHZ0Nig67u
	QCCrkM4aF0kMI0LZ47o4SG1cd/VksRE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-Pc4_KJBhMvORZ46iogtoQQ-1; Tue,
 11 Aug 2026 07:43:15 -0400
X-MC-Unique: Pc4_KJBhMvORZ46iogtoQQ-1
X-Mimecast-MFC-AGG-ID: Pc4_KJBhMvORZ46iogtoQQ_1786448593
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD492195604E;
	Tue, 11 Aug 2026 11:43:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.68])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 39A743001D38;
	Tue, 11 Aug 2026 11:43:06 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: lkp@intel.com
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
Date: Tue, 11 Aug 2026 13:43:05 +0200
Message-ID: <20260811114305.400333-1-jtornosm@redhat.com>
In-Reply-To: <202608110204.wb17Qqit-lkp@intel.com>
References: <202608110204.wb17Qqit-lkp@intel.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Yev5PlwgG4YN8rMa4tEBGZZ9ZBcvR29LkS2BLVSM090_1786448593
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Please, use the latest version (v13):
https://lore.kernel.org/all/20260721081301.205374-1-jtornosm@redhat.com/
That and more things are fixed there.

Thanks

