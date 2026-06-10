Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34B3E5EE7
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085675; cv=none; b=sgmkX4dkxGlC0FeLhezCEHAq10Ud8eebGuzqyFppJ4gaOOoy8HdpvW+Ci4E4qxAIyrjEDMi8vxR3Xa0uRdNLgx5hro/wehp6uYX7OL+benNGAelnMB39iyeKa1uSnuYiMZSPKoGABEnAHjW5Q/QWkOH2nL5UmJm4EcdjbeZpaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085675; c=relaxed/simple;
	bh=NXj8s/f7UZBoXS9eyuxmfRgMWd0CvdIZLbRTYsC+3F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=pm3eZ4qonSRFNTLSqPxoC2mKCYrQnfPPNBT4S8P5EVCXJjP4JuoC02Qa2fICX8rTSJLzxM47wFJP147EocRXroOMxdCQ/IRTNIgLkZ68axTCQoSWxw3lR1ap+9Rk9KyxtGUqQe/roytXLna451Ctk8Jva5hPc7jkc5FVkSvIn84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NW413LBO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NW413LBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781085673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0u3YOlBGasTqI/efMg4dbBFjH2Jdl45+ZYBRiUMwLY=;
	b=NW413LBOVuhCSUbQQYtqEAu4+yMzK1PDwOjLdxEgFyb3CwMZpu/4ZgU7W8s0UULlyyukWi
	o3tw7mrfBC/CXRASyEyV9Gcj+ZoSrS6IwJAsUnb/3BppNYQjfTFhGJrXpTqptuO1UPemnr
	IYw4H1tJQ7OD54tsajNVOWg7qyPA/9U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-kRo-Y_WdOd6I7y7utJw08Q-1; Wed,
 10 Jun 2026 06:01:09 -0400
X-MC-Unique: kRo-Y_WdOd6I7y7utJw08Q-1
X-Mimecast-MFC-AGG-ID: kRo-Y_WdOd6I7y7utJw08Q_1781085667
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 505BB1845575;
	Wed, 10 Jun 2026 10:01:07 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.27])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E818C1800599;
	Wed, 10 Jun 2026 10:01:01 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: alex@shazbot.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v8 2/3] PCI: Add device-specific reset for Qualcomm devices
Date: Wed, 10 Jun 2026 12:00:59 +0200
Message-ID: <20260610100059.19235-1-jtornosm@redhat.com>
In-Reply-To: <20260609115352.32acb6fe@shazbot.org>
References: <20260609115352.32acb6fe@shazbot.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: MzBKF2OJBaBooP4lj0pQ31PnMkvIjuVgmA727k9PYgk_1781085667
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi Alex,

> My only complaint is that this is positioned a bit generically...
Ok, I'll make the comment of the function more specific for these Qualcomm
devices.
  
> Has each of these devices been tested on a platform where D3cold is
> actually achieved through this method?
No, I don't have access to platforms with _PR3 support. All testing was on
M.2 adapters (D3hot fallback only). Since D3hot works reliably and D3cold
is a stronger reset mechanism, the approach should work - but I cannot
confirm the D3cold path through testing.

I'll send v9 with the updated comment.

Thanks,
Jose Ignacio

