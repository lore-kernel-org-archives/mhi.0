Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83C47A7C
	for <mhi@lists.linux.dev>; Mon,  8 Jul 2024 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720426900; cv=none; b=uCsTj5b1h9R/HIuRuz4f2Zr6kyfGbGQrf8j6qyt8+tpykQCE7251aHrNRzuzu7Vt9LKicMu/la5361XPi7pkaZwqGvgTgoV7E17WsmZIE6jm9a5tU7DRmj1O9a2yKzCLxjGdL3En9LulWXAf56a+cNet4qI3AExRvbTr1Wch5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720426900; c=relaxed/simple;
	bh=SCaggQ0CUUfU5h9pyg9OnJko2Oq8BQfNedcLroqplm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6wJpSxsXQPdOmsVe16SS14f9l4hwl8P+NMwAVlAx+LgsHyqtjY5vDJo7uH3t+CNzvOhP69ismdtmlrI8cXMEcuMx2sHy/7YXgJk5zTyWpAze7rQrkk+jqOW17GTUyhLhzPI2J8oKKAd5xksRwWRkfORFmUuMSE9iYtjG/Ngm3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCbN5Zai; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCbN5Zai"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c8517aab46so2621749a91.1
        for <mhi@lists.linux.dev>; Mon, 08 Jul 2024 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720426899; x=1721031699; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXZPF0EiRaPp+WNMg9Ilg1Dc3D4MRNMVjJ6zf7oezV8=;
        b=qCbN5Zai5HZb2nYCTwqOWN7mPXNgG9IQnPU2k+0O9e/KV8iVdpvYWA1ze0A1PDgwLK
         rOCwLM8jEI+Vm6VFwBAH7XG/lz3wndatHjXtdDT9OnPfk7RjsHhde6LwRPXdLC8B31ob
         sJbMhaX0KhMFIl7zio3ObiCJQ1xp5uQOebmauVAvCxP8kr+ehKxss9gH94zEpl+BgKeq
         PEBGhsy8+k7dtJfwQzyMpAof9/aPNCdGGS0l8UmdNol1ONnJENyl897FalKgRMMzm5WT
         niciBveM+LNnTr6wuxLJP0QxLnZfhIHW9HwkmSVBTKMjNFE4dtsqWow9kG2wtqknsN9y
         0rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720426899; x=1721031699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXZPF0EiRaPp+WNMg9Ilg1Dc3D4MRNMVjJ6zf7oezV8=;
        b=lcBy7Cq5p5jsBm70SOaRyNxoxRK9X+BeLmxwH/1kSGXp599BqKk6KEJf4YP8AtMN37
         SBnKnAMBU/cFDzGS60zxqbavoGZXB9pg7XooV6kHS4Wod5d0STuiHKOqW9YK6YerSb0z
         vcrtWVsNeSpBFzsdG9PAqLIbEDpswbzH+/XKMQ9iKy0oDGBKiEXFsEW/HMKx148sKofl
         6zW+2EgEtqgL5udupVI0gvRfaLoqCQ9wa+qN+eQ0ZC4yGWe0fGd6n6KRVhHc0fNsq+7+
         ArnNOtTEE+T4PFNrTDpRMrvzQcHvS++Vu51cr4EI26kcigPFDLblNZy+8NOyhVuzGgec
         AQyw==
X-Gm-Message-State: AOJu0Yxiva2/oCTFwyX5Z1NR0zAd0js5HgHSRKoJurvN0MtX1n9vAqja
	tCX7omSNudedp59mRXoNOu31ssFYBmZ1MrAZjP5grrGmr7Hy4R3gkwdFqxVjNA==
X-Google-Smtp-Source: AGHT+IGcBvjltU0B4lIyUPDK8bVauTgZWVD/MOH/QQNgWnUAQWyLmkMt85XiGvTLX3HisaET8hsjuQ==
X-Received: by 2002:a17:90b:4f81:b0:2c9:c613:2ea7 with SMTP id 98e67ed59e1d1-2c9c61330ccmr4724127a91.47.1720426897696;
        Mon, 08 Jul 2024 01:21:37 -0700 (PDT)
Received: from thinkpad ([120.56.193.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aab0787sm7556864a91.55.2024.07.08.01.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 01:21:37 -0700 (PDT)
Date: Mon, 8 Jul 2024 13:51:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Murithi Borona <borona.murithi@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	duke_xinanwen@163.com
Subject: Re: [PROBLEM] bus: mhi: host: pci_generic: SDX24 Channels
Message-ID: <20240708082132.GA5745@thinkpad>
References: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>

+ Duke Xin (who is adding Quectel modem support these days)

On Sun, Jul 07, 2024 at 08:23:57PM +0300, Murithi Borona wrote:
> Hello,
> 
> Module: Quectel EM120R-GL
> 
> This module does not appear to work fully with the default SDX24 configuration.
> It appears to be another variant of the EM120R-GL (Also FCC-Locked by default).
> 
> Issues:
> - Debug ports are missing (AT)
> - It only works over MBIM/QMI with Qualcomm's RMNET driver.
> - In QMI mode it's really unstable and unpredictable with the QMI port
> freezing up.
> 
> Are there any missing channels in the SDX24 config or is this a hw/vendor issue.
> When using Quectel's drivers (and blacklisting mhi_pci_generic), all
> the ports are available.
> The configuration for other variants of the same module brings up the
> AT port ( with a recurring warning/error).
> 

Most likely this device is a derivative product that needs a different
configuration than EM120R-GL. Could you please share the sub-vendor/device ids?
You can just share the output of 'lspci -vmm' command.

Duke Xin: Are you aware of such derivative product?

- Mani

> >> [ 5074.472791] sequence number glitch prev=1 curr=0
> 
> 
> mhi_qcom_sdx24_info
> ==================
> 
> lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> 
> ports: mhi_hwip0 (net), mhi_swip0 (net), wwan2mbim0 (mbim), wwan2qcdm0
> (ignored), wwan2qmi0 (qmi)
> 
> 
> mhi_quectel_em1xx_info
> ===================
> 
> lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> 
> ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim), wwan0qcdm0 (ignored)

-- 
மணிவண்ணன் சதாசிவம்
