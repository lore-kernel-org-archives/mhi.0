Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24803A4F4B;
	Thu,  9 Jul 2026 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576589; cv=none; b=US7E+S0MICnfPjJ8EzfngAVOfJN5SHB2F92vGLqhd8nGat3wRmh2SLjwUKKNzBr/FEktiGqq+7yN/vXdAxUr7NcbWpbboztKGLj6rWiITYpYGQUDaPTito9GTGcGURgzJY4RtUf77vgbc5ocn4T/aPBt2pbodmf4sV4+EkQ0Qhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576589; c=relaxed/simple;
	bh=WCWOCcosvf1a3H0MeXBzocDS82Ys6gxGxDYJ8S3McbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oAA+NO9zu4XvWSBuOg8ne5Swu9HZCOrvspjZLAqGyBgwuu3tQHPWR9sjDKmLpW56jLAjbNb9b3Umn74hX/oWUvFfTxVV5IWiVCGVePX7E0jVb2vBXI3lp6lCTklIdIWg5OcyFXlwnmUV2eZqDFWOuZDQC1J/5CpJQeBuys8LLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVW7YGgX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVW7YGgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1780F1F000E9;
	Thu,  9 Jul 2026 05:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783576588;
	bh=XbT1KfJ5qWiKVVsJNIrbamwA3zZFgvVNAtExcvXw14g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RVW7YGgXrF/ggPJfn/KSozQ+F/lbytsaTVX+clbk84IR9Zh3ESwnC5dDpyjuMKxM+
	 BDM711duEXOBNAH4KRf6CoweP7B0/O8CrbIqG2ziMAL7fkv2cblg1taIITdKCzdJO8
	 BFRlHBojEX1FlrdN+pM2c94G8dlKWE19FGcHGJYAvkHkWNenJYPnvjH+RRJHhXcMSJ
	 V1mDmCgMV713KfjQ+oZ4R8rdLeTjTmrMm1nOY9e8CjNzlD6k9SSJZ2f8vMmlKTv8jF
	 5+SWzop80UApNPzFAZzj6xMbjjF4lAfiRGr44dmHRspl5pPIJwTXL1Mjd74Ox7Mcn2
	 mGQ5Byv2cYjuQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: kees@kernel.org, Qingtao Cao <qingtao.cao.au@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>, 
 Qingtao Cao <qcao@digi.com>
In-Reply-To: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
References: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
Message-Id: <178357658570.735095.2248320106411171417.b4-ty@b4>
Date: Thu, 09 Jul 2026 07:56:25 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Wed, 03 Jun 2026 11:06:11 +1000, Qingtao Cao wrote:
> Bring forward the idea to fix the power down latency in
> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
> so that the transition into system error (triggered by AT!RESET)
> won't have to return only after the timeout of up to 24 seconds

Applied, thanks!

[1/1] bus: mhi: core: fix sys error handling latency
      commit: 22568e8f13a42ab69b7d624741768cbf15dded74

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


