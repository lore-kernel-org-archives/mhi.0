Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF221E2851
	for <mhi@lists.linux.dev>; Tue,  5 Nov 2024 17:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828331; cv=none; b=f15KDANp4i2kDaHdyS+R0q6y8BEOV85F3Wxxkyur5PKlkngcvsFm3xK5nopbrypy8/GzJPhjcclTda3ZJ8ImfP6q2UfaNbJmvqkrOJosFDzM+QOe+EbMwuWDTr9KgdZBcvgRx91sU4quimnSmFv5GChF9ZTeLrttbItMv6HoTuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828331; c=relaxed/simple;
	bh=4lVqMlvbVeIaLRC8JY24fuipuiQcsU90cbAOjOhbmfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dktT5motaJywG0ZBvODF4fyAJEbdm/cxXvlXSwTy8CZ+IvL0Q9FiwQiZSLG55M/s3ewMQJN3qSX0ZQE+/WsRApW+JTSRHSJvSdbUWN0HNyb6+zXTUOIzx0w4PBSVcR7jPbnZmCzxnadGGVDU70W8r9FGyWIU2u77/MyMhUueHWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e5a62031aso4699772b3a.1
        for <mhi@lists.linux.dev>; Tue, 05 Nov 2024 09:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730828329; x=1731433129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PD7THQBIWGT0uMZ+0fdmv+Bq/KO1hinbqgfjxdPvwIM=;
        b=LljGBC++lZd6/MXIAeQNCMtJPtKIFFV8hKetTntJvnqWwjnFwqIVbsDYeqcMg0ND0p
         HEfEvqShpNLrWlHb94zP/SM7XCwJFyWCnub+V3ria9Dw2+HgtvbzTCoiWcK+BC34puCx
         Z0LzAUisFYVJC91MGKK1oLN3ktcfyeU/WWHIOgc/9mxyiLpqf1vdtt25rSxQ+8BK5RFO
         1aprh+bKGvLG5EsHIDEY7qA3J2xVxdLmBKlMWWny1WJ2511aNXakpHKa/KFxXJQv5NEm
         MO3IPvUfJwAFxb5oMbNROLywqFRBsRZr7oTZI7t+owJlRtIomBo4FUTiFz3N5AIUlke8
         UkPA==
X-Forwarded-Encrypted: i=1; AJvYcCVM2N8TLohiArvMKbumKtnJgTRYkxwZ7IqKW18wmeo6MVAPs5JNBneKs+m/s76CFb2HKGg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrFY/UXrVk4QZ8bQlvBGrySwcOj6qN2ckeGNuUPzNXFrPN9nUt
	4UDCI8cC8Xrr7Rm9hmiWNsccg7Mh5Yq8AjFtGFIG+YDeFw9Kbwqp+4i6gozV5Ek=
X-Google-Smtp-Source: AGHT+IG+ht2m85l7VwQoVcTgAteAcpdGNxxC01z797LcY7Qet5QMRhqLO5vLNbROnpbC+W9JL8/TXw==
X-Received: by 2002:a05:6a20:7351:b0:1db:ec7f:609e with SMTP id adf61e73a8af0-1dbec801b78mr6496376637.41.1730828328809;
        Tue, 05 Nov 2024 09:38:48 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45296c97sm9294730a12.14.2024.11.05.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:38:48 -0800 (PST)
Date: Wed, 6 Nov 2024 02:38:46 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Zhongqiu Han <quic_zhonhan@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, kishon@kernel.org,
	bhelgaas@google.com, lpieralisi@kernel.org, dlemoal@kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: Fix potential NULL dereference in
 pci_epf_mhi_bind()
Message-ID: <20241105173846.GB448500@rocinante>
References: <20241105120735.1240728-1-quic_zhonhan@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105120735.1240728-1-quic_zhonhan@quicinc.com>

Hello,

> If platform_get_resource_byname() fails and returns NULL, dereferencing
> res->start will cause a NULL pointer access. Add a check to prevent it.

Applied to endpoint, thank you!

[01/01] PCI: endpoint: epf-mhi: Fix potential NULL dereference in pci_epf_mhi_bind()
        https://git.kernel.org/pci/pci/c/ff977d1bf478

	Krzysztof
