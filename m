Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5992E3BB12C
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628371; cv=none; b=h3fCvn7rLJVQdyGls6HwrpbjkW0KNEgxDFIXdQTqCpzrCNviYhFZr9Mb21oSL83OKEbqiNiFqHkqx6ubrLlGGHp2RWS4ca/uJuhY+gcDzlT9OGJE2fBFebXxYWSMDgWZuyJcPeGZ5KwTd+5GM/qvkZMBsp3o1k73ZQtBo6cMNzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628371; c=relaxed/simple;
	bh=hJ5GJ4vLuXnoyUYhLQDMtKomFHUpowUPUgS4aTwNKpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=aaxdVZ3vR6LoVDXAwUoVEf0+JD1HU13KPkg7S+a6Yl5YYZXlALeD5br7w4wJksmU1c479tLUnjrtk+8ROzWgGXsPObLpUFiO1nkTRg2BHkG67nWr+AiHrMoe5qrDKaBYEAlO46Gnf1s7nWgZPCDaxyb1KagIcpZ9QojNZEj154Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gyG0ZS8h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gyG0ZS8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789628369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTBRx/POh6sMNSgm0GJh52YtrZBru3mV1Q9aul2DNLU=;
	b=gyG0ZS8h/sH3uwMRSzbwfIOKgvFnx5HNK0qd+Zq+IdfyyXYzJLdsAyyR2Bdb+xz+GhQh6t
	zfFhzAC5Y1byM7HZ1RmD5sh69x+Q8v5sMLe/ShLwGKud42rjEy3DWALHAspux7xdzXiQ9T
	3DRudZrDsf6Bv6BB/EvnBmVeEr5MG9Y=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-B3nzCZyuN6qmTGsSQWl-GQ-1; Thu,
 17 Sep 2026 02:59:26 -0400
X-MC-Unique: B3nzCZyuN6qmTGsSQWl-GQ-1
X-Mimecast-MFC-AGG-ID: B3nzCZyuN6qmTGsSQWl-GQ_1789628364
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1CBC21954B13;
	Thu, 17 Sep 2026 06:59:24 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9524230001BE;
	Thu, 17 Sep 2026 06:59:19 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: helgaas@kernel.org
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
	mhi@lists.linux.dev
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Date: Thu, 17 Sep 2026 08:59:18 +0200
Message-ID: <20260917065918.13357-1-jtornosm@redhat.com>
In-Reply-To: <20260915223634.GA878346@bhelgaas>
References: <20260915223634.GA878346@bhelgaas>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: B61sl8pkZiVpV_L3VmsWVEF8Cchl5HpOHMIBya1W-rQ_1789628364
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi Bjorn,

Thanks for the review.

> I guess you are saying that some kind of reset *does* work
> fine in normal, clean VM termination?  If reset works fine
> for normal VM termination but not for VM crash, do we have
> any idea why they are different?
It depends on the device:

- For the modems (SDX62/SDX65), without a proper reset
  capability, these devices never successfully initialize
  even on first VM assignment.

- For the WLAN devices (WCN6855/WCN7850), the reset fails
  in both cases, but on clean VM shutdown the guest driver's
  .shutdown/.remove callbacks properly deinitialize the device
  (stop DMA, disable interrupts, etc.), so it ends up in a
  known-good state even without a successful reset. On unclean
  termination (crash, force-off), the guest driver callbacks
  never run, the device stays in an undefined state, and
  without a working reset it cannot be reused.

I will try to clarify this better in the commit messages for v14.

> Since these basically copy code from other drivers, is there
> an opportunity to remove it from those drivers and use this
> instead?
Yes, that could be a follow-up after this lands.

> This looks like two patches squashed together.  If there's
> any other reason to touch this patch, I would split them
> apart.
Ok, I will split the WLAN and modem resets into separate
patches for v14.

Thanks

Best regards
Jose Ignacio

