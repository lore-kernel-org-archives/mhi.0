Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C212765D7
	for <mhi@lists.linux.dev>; Tue, 30 Jun 2026 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782800960; cv=none; b=Q5hdWlEHCuQZdUyu4vPUZzYsCX5KoEkW+HimIRZK/v6behB36qga321KtReG5Pn/Dpu/gOn3CswMWk8EQQ/yUA+/iL8Nl/RY8VMffnX9MtZzWNc/UjSq6pUT4/75ZTFVuJPumQZGn9BPiMV2L0dYvEzJ+9tD15vCl2yrot/Ho0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782800960; c=relaxed/simple;
	bh=2aaA+j96ATu54kIfRUjrZHWPEKT1weTYWyrrAFERnVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=UZdnk0iB9THLtCeiGgpHnxmelrx/wZFj75OAb/7qBFKJ8DaRSlg/5Y+cb/EDXVtQfr1kHqxxPWTr2e+a9DlK7WCL47d9r0Qy40p7Nve8Q4n0JQW4JH2AtPcidyEt7bZzNb8jMUCWUI4/4drcBJU6nlpJQI6cwnv4lDkKVJHBu7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVz8nBiC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVz8nBiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782800958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2aaA+j96ATu54kIfRUjrZHWPEKT1weTYWyrrAFERnVw=;
	b=KVz8nBiCXpmavcEPUQwZAAUcLmDPBmT8YjM0aqzhqe/+gzoK3BEG+6riNCaPb5AhKOCeSd
	xEd+em+9gu+949pZkUOGxj5EIej5HSTaqLuIRaviDcdGrW7xvpOHWFPp/YHMdoBe7G5VB1
	RDfKmmapz9iC+ZWOMPDfPeRTYpoF3Mw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-WG2wTwo0Meu3YKrqxdSpYQ-1; Tue,
 30 Jun 2026 02:29:14 -0400
X-MC-Unique: WG2wTwo0Meu3YKrqxdSpYQ-1
X-Mimecast-MFC-AGG-ID: WG2wTwo0Meu3YKrqxdSpYQ_1782800953
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED91C19774F5;
	Tue, 30 Jun 2026 06:29:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.35])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D3743000B4D;
	Tue, 30 Jun 2026 06:29:05 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: mani@kernel.org
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v11] PCI: Add device-specific reset for Qualcomm devices
Date: Tue, 30 Jun 2026 08:29:04 +0200
Message-ID: <20260630062904.197939-1-jtornosm@redhat.com>
In-Reply-To: <5mrwcurlf6xnqla5x5idpt7ug34nv2eqpijnjmccgdwazrmwyv@64tixxe4aa57>
References: <5mrwcurlf6xnqla5x5idpt7ug34nv2eqpijnjmccgdwazrmwyv@64tixxe4aa57>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: -luLYUUTZUVR14q2KrMjFDASq3ATYWEKy3k6uZ7Htos_1782800953
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi Mani,

No worries! v12 with the fix and WLAN renaming is on the way.
Thanks for catching it and your help

Best regards
Jose Ignacio

