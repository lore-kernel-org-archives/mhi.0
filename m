Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B0BA37
	for <mhi@lists.linux.dev>; Mon,  4 Mar 2024 05:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709531146; cv=none; b=RGzv/yJ8wz9X5ayKV32EO+HcTGhbS95xqX9FpsYQFfNGoaZKDyB+/13Ng99zuzbCGbxPRNPKK4FBlyUFJ6iZsxMxPa3+wCf6nzlvwHrvB2/ZwhgYrdVuPs/UgQySE+muUrfBiReoxn/EdFGZam0cInJkRXruSgDPnNn0LHUKnxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709531146; c=relaxed/simple;
	bh=Opih2PZV9gDsPvBwpspCv8TGpZmtmjlOY8SluqDWbFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGjq09fj3C/PWzbjmhKBX/VF+TWw0CjHhI5EPWf370XipL5Mn3NYEeHZ0YikLDu2PtZOt5neVLm4iQVDBBWU3YrCE5n/5ofAsbaH5qG9N/IjKfMQT5MSlKC8BMJjQoZ0YVd3j20vE4FQFiuMIwMDAFfcxElk0VMhuacKLLPkylY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkKqJ4u5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkKqJ4u5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e58d259601so2576415b3a.3
        for <mhi@lists.linux.dev>; Sun, 03 Mar 2024 21:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709531144; x=1710135944; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nyLi8+SmSre8SLNOigrTqCqxHxWeA+jhwdAxcyOndLM=;
        b=hkKqJ4u5DDR1jrI/pjG9P2mn8ZpvGig3kjVArlLWPxzZ84vxqBRa9SVEJskXLXsqwJ
         o4gpYJvbuRTysQh3tqPCp8+WQ9pW2OcaJLr5qNG1SmVSpCYuwwZOK+zBCeqw1CoXnCRl
         coJ79LE3UJvtFUeDeGOf9LbduRN+sqbDlsYabUGXonOce2lAinXDsFjLfSREeQU6EHAR
         wz6dIHglVcwc4nW0Z3QLSx+aDiNPqpKawbLyBXihtIBdVhICNe5IViEmifNL9lAvCwqs
         6eU9V76nFCli/T2nFIHEmk/MWVgDa2SoKK3vhy+OMFqvPCfIec2aPu2u7vbrJnCkgtrt
         KBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709531144; x=1710135944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyLi8+SmSre8SLNOigrTqCqxHxWeA+jhwdAxcyOndLM=;
        b=JPWyrzMf943PGTPqa5zoz6wLc3RcgtyOHXEVQsJ3bjxYar7qXkrwrL7btxOczZjYvw
         ELESs2NoqubW496jGiXuObwsbilsLArQ/RwFZEL+zd29lFFriTAIdanqF5RmNLkmLKdX
         FB2hIElV5ezoQtBXYx4GlSr9LPC822GwN3XBfO7n5lR1kbVhocD0hmIKYVGutYiaDs+6
         vVX7CtKKrQH9tQA2ssCmzyppsxdqqrd47gHPWVoaTt3TvXYvG338rsUDHoe328C8ORY/
         tpQNSI6JRYq/f6GYC/3Vu2b+ICpaNOTubGuYD0OPPEQoYifS0H5G7h2N8dwJnpcGW/nE
         374w==
X-Forwarded-Encrypted: i=1; AJvYcCUnZW2Sae/EVrjgFK3ytOlctFHfFzR0QzuFJQDGwGVXrC8hLbZt/SRFFWp6z3Q4Q/TIW8W4DImw72yz4pGs7Rx7TStd
X-Gm-Message-State: AOJu0Yw71DlA0XfWYzs6To4zgPX7Q2nktziLdriFOiOYi0Dtz8LywvRq
	Rz4CQ168BZtrfZpYmEaCZs3D2CNj/eWqqNZyCSX3dGbDbfar9SNZKi1YEmRq0Q==
X-Google-Smtp-Source: AGHT+IEb05hPzFeBZje+h75WEQQpiRcBp848ihooFqT4tnzoz+8bG6TqQJGYpSZro6DP/2UhVDknig==
X-Received: by 2002:a05:6a00:2fd1:b0:6e5:d3b9:2d06 with SMTP id fn17-20020a056a002fd100b006e5d3b92d06mr7157632pfb.21.1709531144470;
        Sun, 03 Mar 2024 21:45:44 -0800 (PST)
Received: from thinkpad ([117.207.30.163])
        by smtp.gmail.com with ESMTPSA id q4-20020a63e944000000b005dc1edf7371sm6746085pgj.9.2024.03.03.21.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 21:45:44 -0800 (PST)
Date: Mon, 4 Mar 2024 11:15:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH v5 0/3] wifi: ath11k: hibernation support
Message-ID: <20240304054536.GA2647@thinkpad>
References: <20240304021554.77782-1-quic_bqiang@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240304021554.77782-1-quic_bqiang@quicinc.com>

On Mon, Mar 04, 2024 at 10:15:51AM +0800, Baochen Qiang wrote:
> Currently in ath11k we keep the firmware running on the WLAN device when the
> network interface (wlan0) is down. The problem is that this will break
> hibernation, obviously the firmware can't be running after the whole system is
> powered off. To power down the ath11k firmware for suspend/hibernation some
> changes both in MHI subsystem and ath11k are needed.
> 
> This patchset fixes a longstanding bug report about broken hibernation support:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=214649
> 
> There already is an RFC version which has been tested by multiple users with
> positive results:
> 
> https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/
> 
> Basically the RFC version adds two APIs to MHI stack: with the first one ath11k
> is able to keep MHI devices when going to suspend/hibernation, getting us rid of
> the probe deferral issue when resume back. while with the second one ath11k could
> manually prepare/unprepare MHI channels by itself, which is needed because QRTR
> doesn't probe those channels automatically in this case.
> 
> Mani, the MHI maintainer, firstly doesn't like that version and insists that an
> MHI device should be destroyed when suspend/hibernation, according to his
> understanding on device driver model. See
> 
> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
> 
> After a long discussion Mani thought we might need a new PM callback with which
> ath11k is able to wait until kernel unblocks device probe and thus MHI channels
> get probed. So we came to the kernel PM list and there Mani realized that his
> understanding is not correct so he finally agrees to keep MHI device during
> suspend/hibernation. See
> 
> https://lore.kernel.org/all/21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com/
> 
> Mani also pointed out that an MHI controller driver (ath11k here) should not touch
> MHI channels directly because those channels are managed by the corresponding MHI
> client driver (QRTR here). To address this, we come up with this version.
> 
> Compared with that RFC version, this version adds PM callbacks in QRTR module:
> suspend callback unprepares MHI channels during suspend and resume callback
> prepares those channels during resume. In this way ath11k doesn't need to do
> unprepare/prepare work by itself so those two APIs added in RFC version are
> removed now.
> 
> The power down/up procedure requires a specific sequence in which PM callbacks
> of wiphy, ath11k and QRTR are called, this is achieved by exploiting the
> child-father relationship between their device struct, and also the PM framework
> which separates whole suspend/resume process into several stages. Details in
> patch [3/3].
> 
> v5:
>  - remove Kalle's s-o-b tag in patch 1/3 per Mani.

Why are you not carrying review tags? I have reviewed the patches and provided
my tags for patches 1 and 2 in v3 and v4. Now there is no tag again in v5 :(

You cannot expect maintainers to provide review tags in each revision.

- Mani

> 
> v4:
>  - resend v3 as v4 to CC netdev folks. No changes in patches themselves.
> 
> v3:
>  - skip QRTR suspend/resume if MHI device is found to be in suspend state.
> 
> v2:
>  - add comment on why destroying the device is optional in
>    mhi_pm_disable_transition().
>  - rename mhi_power_down_no_destroy() as mhi_power_down_keep_dev().
>  - refine API description of mhi_power_down() and
>    mhi_power_down_keep_dev().
>  - add/remove __maybe_unused to QRTR PM callbacks.
>  - remove '#ifdef CONFIG_PM'.
>  - refine commit log of patch 1/3 and 2/3.
> 
> Baochen Qiang (3):
>   bus: mhi: host: add mhi_power_down_keep_dev()
>   net: qrtr: support suspend/hibernation
>   wifi: ath11k: support hibernation
> 
>  drivers/bus/mhi/host/internal.h        |   4 +-
>  drivers/bus/mhi/host/pm.c              |  42 ++++++++--
>  drivers/net/wireless/ath/ath11k/ahb.c  |   6 +-
>  drivers/net/wireless/ath/ath11k/core.c | 105 +++++++++++++++++--------
>  drivers/net/wireless/ath/ath11k/core.h |   6 +-
>  drivers/net/wireless/ath/ath11k/hif.h  |  14 +++-
>  drivers/net/wireless/ath/ath11k/mhi.c  |  12 ++-
>  drivers/net/wireless/ath/ath11k/mhi.h  |   5 +-
>  drivers/net/wireless/ath/ath11k/pci.c  |  44 +++++++++--
>  drivers/net/wireless/ath/ath11k/qmi.c  |   2 +-
>  include/linux/mhi.h                    |  18 ++++-
>  net/qrtr/mhi.c                         |  46 +++++++++++
>  12 files changed, 244 insertions(+), 60 deletions(-)
> 
> 
> base-commit: 48294c8a226d82c687b52b2eb90a075bbfbcb884
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
