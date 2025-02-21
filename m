Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C48C18C937
	for <mhi@lists.linux.dev>; Fri, 21 Feb 2025 06:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740117929; cv=none; b=eVfNpp6dPxo3y7yJhGkCdQDq/13RMfnU7Hi2ZNRLwEezdnGCi1xeKt8wF+COARHwCW9sXsbptxc//A1OMcEI/kbos0bsRIW1Xu9gQnGyet+zE4dwiHAyuzZt1W+zARPgwZ3wxKmRuutsErKa0KXUsCceQeEAuQdb1SZ8rwrItjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740117929; c=relaxed/simple;
	bh=iapny+DICfxkuP2xrLzKx2ZNOS7arlU/6EskcKL+UPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsOUX2LjMbXCvZLOIVxnMX6VVQcaE933GSVFqbQuP4UhjtegAa7vc+xJzDMxgUSfxgSO2fkaub5Syg3I7QgZWwdHO8js55eHHykOkcMwcYDcH0zWdSACVHjXHKw9O8Xh4rCY4OwcEs0SebJ1clNkg7/2huxBXQPrKMtAnRPaFfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220c92c857aso30879255ad.0
        for <mhi@lists.linux.dev>; Thu, 20 Feb 2025 22:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740117927; x=1740722727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbKqhD/TtkBjNOkbjBJzYaQIabf25yHhmzgDtWdw50g=;
        b=tWREtkcaIGPg3ffKpzaeW5K1DLXJ7+wj8SNHjZHSstvDG5Vpj3AGvBoWGzn8JUEtQs
         B5h70KO25gwxeN3yNvmgOKeIpzYEmLjqtDXi/UtGXLHn+2W5KyrqBrNyRYe9fI91e+7h
         DUYGD+f86YW7DBoTynhxO9l7YAQ2OzzlkpFKfIQsUfZ3j2cOjQ80bP0qEEODcRsLktgd
         OiKzdhadiaIRAK6efcw8Ie504pQokxyJTc1/Rq4eIDzRNmPpjT58YMyTDOy1gvvBe8Sj
         oow0F7tar5nT9CI2lVeWv1rSL+0p092Tz/oT89TVe+0MgL7trYNlxydKhW3rpNtBILDh
         GbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbM02Dbc7fVHS9ay2NLZfuEaqe7Mj0NAxL3Auh3q8GBUGpOF/PsTQDxpnHWzXlvgDeu1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUOdazU/W/innoVI4wEir8EIgW/4VsCHdMnYgvHj5aF1JNRKo9
	IePRREpFSnzUgvpf8tIgJI1dBPR2AGHNQIxwto8cXPZ/YDOZ8nOk
X-Gm-Gg: ASbGncu8bB7oRV7JH3UhjN8aHCRntdv+GG7CF0LadjKOL9z0oLSMXg9Db7QXk+P/t08
	OCWw65kxBztgKKETbwHwJZobKXVJBbAnlwoGZDhXSHZwk7Px2blGWg9zyWWumTmfUgJEHQlMcbO
	FwVHuxvOMbyWnr1Y7JzBnH+UGVa8QooZP+wFPk6A3USOkqluravm9jGMH0qHxMxlAAqgiPJ861a
	LiOd9l7WLWUD2LB7CsgRNojev9dz7vifLC1Pr46QyFXKILVt9+eptlwXXEyy1IYlminb9Ab+HiC
	jtOeudVrVNbC5OJvPAC2Q09b8iYOwlErhxTd3tcFV54z3L1p9lF2CTZhLxDw
X-Google-Smtp-Source: AGHT+IFYL+UM5bLfryPJyWCRV7+vSZj4kkwUOAfJ9P+FhLEIS4Uiy1EC9ZLdem8DWs9oatRIJcNkuQ==
X-Received: by 2002:a17:902:c94d:b0:220:fbde:5d70 with SMTP id d9443c01a7336-2218c7637a0mr101240735ad.21.1740117927239;
        Thu, 20 Feb 2025 22:05:27 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5364589sm129639515ad.84.2025.02.20.22.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:05:25 -0800 (PST)
Date: Fri, 21 Feb 2025 15:05:22 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, quic_shazhuss@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Slark Xiao <slark_xiao@163.com>, Qiang Yu <quic_qianyu@quicinc.com>,
	Mank Wang <mank.wang@netprisma.us>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 0/2] pci_generic: Add supoprt for SA8775P target
Message-ID: <20250221060522.GB1376787@rocinante>
References: <20241205065422.2515086-1-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205065422.2515086-1-quic_msarkar@quicinc.com>

Hello,

> This patch series add separate MHI host configuration to enable
> only IP_SW channel for SA8775P target.
> 
> And also update the proper device id for SA8775P endpoint.

Applied to epf-mhi, thank you!

	Krzysztof
