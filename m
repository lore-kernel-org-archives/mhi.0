Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5623F0A96
	for <mhi@lists.linux.dev>; Thu, 20 Aug 2026 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217468; cv=none; b=lB3qLO2SrCOOwm9hK6C1HzjjwW0i++WvEGOjJdWoD/c8EiXk2/eaanxdd58Srx9ktCb68R+pqbelQRMY7JuPLwM83b7ruUC3qnC3Qp2czxxPSXHCyXSdBdmIFso3bVa7LtAgtKMKTS4/EFotUo9h1iRZbnuizQXI6N5XldVFd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217468; c=relaxed/simple;
	bh=nPkFTOEtgZNq1DnQm57ec1O9IDgRP+zAD+5M9DAnY00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/+2HoHmTyuuGbFaQvhWN7/WxkikT2UhwDyDaYUZLmX5TkOYtmLzlgqjzRJV7Ien6ppl9eLS8Gmg/JaYu2yEaBh4u12AKayvrhYYAlgHGxwpMO2txDhSUZZJoSSMyKbSXqscVVYVGbUAyGjgmKdCjeBuFyF+Q5WJwB70bjLtceU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XT4Gua1W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XT4Gua1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787217464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6lDvs4PBwNh/pPGjCjR9S79ZeFLuFiB1QygAoYt1AWc=;
	b=XT4Gua1W5MfczoWOuC2+MNVWRx6d+1uQc53Mstss/wRpZqHPzwk8LRknK1Kas11K0M6WGi
	Rl+b6kYIzmqZzXi6rF8tTpFrtNlKSapou9QLEw3GdcPqsWR9q5j8EAt8B/lQjT5CDSCWUC
	CzbHl6D3QuUoUq2uB5o99gsPJI7U3+4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-xZPjVecWOSehmJMDlHPS4w-1; Thu, 20 Aug 2026 05:17:40 -0400
X-MC-Unique: xZPjVecWOSehmJMDlHPS4w-1
X-Mimecast-MFC-AGG-ID: xZPjVecWOSehmJMDlHPS4w_1787217459
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f726186c4so1112280f8f.2
        for <mhi@lists.linux.dev>; Thu, 20 Aug 2026 02:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217458; x=1787822258;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lDvs4PBwNh/pPGjCjR9S79ZeFLuFiB1QygAoYt1AWc=;
        b=UoqJppV9a2jolY+apfax3WYZHoXTHRxYl5qj0+j1POlvd7FHe5hJdmIP78AgnOjoP5
         v3fT36erNbPI3COEUwhukv9AFgN86qHFDWtbDEeB+NHzzMBgHkEH4rrOF68p9R2bti25
         PQOTO5xEWp7oqyuOaEOj90HnW7DmpA0IMBAvd1WAAVZxzTPgTK5FcbScZcO1HOsIhgyc
         XwLXmi0FFAz73OpazQuQsYEJwxdrJjYnHXBoD5JlZDNNSJiCiA0DMHBtIlKnqYGzyXXx
         RCOhWL1LO4nt60Wz8bz5Gu+azKfYa4F35FTVudUMrBrAOzeEKFSgeRbd/0ciYGmMCrpV
         2euQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJioFkiskPyER7jEKqloA7LixmYp2Li9n/K7bGI7UKwbPZpkd8fPKa9ra2FdKmh/4pILc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj0sbesxQZmZ8pmfUm9ElHu09hZh8flnVjTgDsdVsUldJigq/O
	FediLwNi9XrdXQ0y9UBsWpvL8aPcQ8b03FIcy2ZYEgaQ9WlnW+GYz8md3cr25AwN+92lclLbIxH
	HvfNh8g8rfiDjZ4/MbfKAh9e+qMeYO8tjqgcNZZ1Xi0AJpIZZ9MdApQ==
X-Gm-Gg: AR+sD10Uon+iqDHgkMfxYeTTaeNADQ9XPfZHfUACjQXM4PGdxwqxZLiZWP5GH4nqvMZ
	WylL+Dz8jM5uQNb2iE8nAfdxrrATa63cXrG3uBM7dosZHpMON2zVIZgdJsYLyVkVpIvvbHI/PJE
	axibJDVD+a0KT9PoHu8uGJJ83zT6iTMwi2yx31YIi6UXUA5BZGtJeHxupPi3eDc2ZEEzq7ZQ34t
	2bREGolAS5SGd7Z4sMTZf4TgFNBX/WudgYG5MZiSWTquWE3RJppLgzustEWMCzEAzzEQMQ9BGgb
	CqRkBRkP9SLQYU/N163SZlzsM1BM4fLWfIZIEKmIFCXTERzQe9tE8HksZJg4Jr5SI5BH8AntZj8
	gm+im4xraH+n8J0jgG7XxPJu/PwEgGxPJcYJP0P2jIH8bIdruFpzTopU59QxIh/946DgsNoZd6w
	0=
X-Received: by 2002:a05:600c:354b:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-499aa1a1f2bmr173636445e9.6.1787217458573;
        Thu, 20 Aug 2026 02:17:38 -0700 (PDT)
X-Received: by 2002:a05:600c:354b:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-499aa1a1f2bmr173635675e9.6.1787217458140;
        Thu, 20 Aug 2026 02:17:38 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2b35386sm25640585e9.4.2026.08.20.02.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:17:37 -0700 (PDT)
Message-ID: <3f078f41-b971-424c-9258-b309a7d5d223@redhat.com>
Date: Thu, 20 Aug 2026 11:17:35 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 0/3] net: wwan: support DTR/RTS on AT ports
 via MHI IP_CTRL
To: Peter Hunt <peter.hunt@opengear.com>, loic.poulain@oss.qualcomm.com,
 mani@kernel.org, ryazanov.s.a@gmail.com
Cc: johannes@sipsolutions.net, netdev@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819224927.2274790-1-peter.hunt@opengear.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260819224927.2274790-1-peter.hunt@opengear.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wLfQ-DmzVA0_1emCkBJ8prMt8LvjBbYw5Hw9-bMIPr0_1787217459
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/26 12:49 AM, Peter Hunt wrote:
> Qualcomm/Sierra SDX55/SDX65 modems (e.g. EM9291) withhold unsolicited AT
> result codes until the host asserts DTR.  The in-tree mhi_wwan_ctrl driver
> exposed AT ports but never signalled DTR, so URCs never reached userspace.
> 
> Patch 1 extends the wwan core with an optional ->dtr_rts(port, mdmbits) port
> op.  The TIOCM bitmask state is tracked entirely in the wwan core; drivers
> receive the full bitmask so they can drive DTR and RTS independently.  The
> core raises DTR/RTS on first open of any AT port whose driver implements
> ->dtr_rts and drops them on last close, mirroring TTY semantics.  In the
> ioctl path mdmbits is re-read under data_lock inside ops_lock so the value
> passed always reflects the committed state and concurrent ioctls are
> correctly ordered.  wwan_remove_port() also de-asserts on hot-unplug.
> 
> Patch 2 enables the IP_CTRL MHI channel in the Sierra PCI table so that
> the IP_CTRL driver (patch 3) is actually bound on those controllers.
> 
> Patch 3 adds a second mhi_driver that binds the IP_CTRL channel and
> registers a ->dtr_rts op so that the wwan core's open/close DTR raise/drop
> and userspace TIOCMSET calls both reach the modem.  A single recycled sink
> buffer keeps the IP_CTRL DL ring live so the modem's transmit path does not
> stall.  The existing AT/QMI/MBIM data path is untouched.
## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v7.3,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

