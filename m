Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596274BE1
	for <mhi@lists.linux.dev>; Fri, 19 Dec 2025 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141258; cv=none; b=Otepzj2svbV8DYjBbewYnubUKpTK6BmREtzldgHs6qDidtPvYkTRUXOVNIDat2te8si3HJH1DE/1x0AbUyAaXVlmCaO5Pyn1/+hpucNxp8FYRKZY1TBO/0JLIG19stub1EW2POzuXa0jDORlBzAF901AbEX7j/REbUbJ+4rf6ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141258; c=relaxed/simple;
	bh=jcSLquhQd9vs3yycLTlkV962wYyg0ao0gWX1c4mC+3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtfG+uQsEhDyqiJwq86xwbWmotNBTthYakY48zXpVNDQymt3JNbz8F+078STvltwZcCZxsAr8tbCQBlFicSQs/b1qKX6agM3cDyAqO6ulsLypByX9ryPxCBx9rt6sGptGnSSqgQtDiyzGaJthEac1AB97BQPVMp6NEM907OgSTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dC2TE71J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dC2TE71J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766141255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
	b=dC2TE71J+YfHJewG58FwvcxeKkgfTh93hutbdh9GkWS3cPBgcoFmRCuDrbZk0Q7QNWVDNu
	0hn5R/RNi1GJ0zfJQYFs9w5HxadAT5iCjAGYSjZ4ABN5ubVF77pMXLoBqjBDwXDTIP93qG
	EX4zAKm9pvl4/Icv8FpiDVEFCACKE9o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-7PIas3xbOry0g-KLS8q9oQ-1; Fri, 19 Dec 2025 05:47:33 -0500
X-MC-Unique: 7PIas3xbOry0g-KLS8q9oQ-1
X-Mimecast-MFC-AGG-ID: 7PIas3xbOry0g-KLS8q9oQ_1766141252
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477c49f273fso20608815e9.3
        for <mhi@lists.linux.dev>; Fri, 19 Dec 2025 02:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766141252; x=1766746052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
        b=fBeJiR6Gs9nllEcUPLkJX2VITs2mJl5y7MJZXlXplogj5WQo+T1B+ZA+fT+k6lMnDM
         XRJ6GVSfxTFdKZMTKw3/zPTZTKX1gJvIxsnUxu0BuNl8mPcKbFI8uNn+6SL2quBKoXKf
         qA/PrTFJ9J70nmjvTfv1udq9i9DVPC4xRHwZJHfFDvURT4/pQgxIKl+loX90nsYlqnf2
         kST7yT7l/y/Fku38gCv5DzJcqNfNkap3XJC3c0inVOHyr7GOB9EAZFeDOJwzMmO7O6H/
         UAjW+4C7Gjv4SDyaKilqfPwENNbw+aXHoVO4FSzBsQSc5qWTjg3xO0DfdbRwLKav7GfQ
         BsGw==
X-Forwarded-Encrypted: i=1; AJvYcCXthCDHVtqpGMvuAvxuTNSyhSBFd6nMKuLLSN4thNvzokhlyH2/eR1ONSv18rvOMFMKLpY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGarxi8dr0EKhQzLQt0iLXpVyi19y8UXlHbTAWndxq4QpN1RhH
	JAPw9WPkSrlcu0uEeqmGE/vnxVNOudRG13dOCZwBhIKGYxGIUlnE/shsNR0sNgxkHHocmbxw9aU
	gSzw+4tUfIn4jfHbPfRIn05C9p9F0CUurVnJyJatc5GTnd6cO5IrRiQ==
X-Gm-Gg: AY/fxX5W5Hs/CSmdqKIosOVfut6PpINYzKjOx/q9bURahTpiRuOSd+5jJpMt0rjGl1f
	PX1vbRoJdw5vq15imM0CcoWMwy1BBNPyHrTwrH1k1znojRpw6dDb3nz7Oi3gs/ydC67c/p0zWb/
	AJoB7GoFvTxceB6hEJcDluPxIC30h5UvOoVv/ntT6vPnEXf1wYE/795BhdzxkAJfAeToZ32kjK9
	KW6c02PcfB3FTBH9fG6BanC+pOr1ZE+YkbZg44GgDZxdgIjq6IoS9xoADrOa4PvemqI+brVCdRT
	3LWttgVIuVgvtD56ZwD+UeOWjt3sUjHh0aojIOhMnNUiicM0PgMchcQWi/bMBWZVxcssK9ef94D
	+5+vvTxSD1xFa
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47d1955b97cmr21387285e9.6.1766141252212;
        Fri, 19 Dec 2025 02:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0haeKdz6e1wVUfU68PetlUVJ262uD0U3xuzOT7CFHMjUWuxjHWC2bHGvwH3+5rKwg5RCnYg==
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47d1955b97cmr21387045e9.6.1766141251798;
        Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm92155575e9.7.2025.12.19.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Message-ID: <b547252f-9893-4c23-8b17-9808c8bdd0c9@redhat.com>
Date: Fri, 19 Dec 2025 11:47:28 +0100
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 Chris Lew <quic_clew@quicinc.com>, stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wKWuH6HG70MF4EtCDVVeJNFt_lRm169Gf_CC8Xz04PA_1766141252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/18/25 5:51 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

For net/...

Acked-by: Paolo Abeni <pabeni@redhat.com>

even if I don't see anything network specific there.

/P

