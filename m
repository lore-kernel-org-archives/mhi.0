Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F923E334;
	Sun, 11 Oct 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735821; cv=none; b=R0EOiz0sAv1TPEMjvDx6ebQp7b6MrGp/dZQvmjI0mKFKgbogh2ZTVzY4aHVcgOUAFNyoo6thALbAw8apUnEESTlCYHDEJhmbgSviea6uRFCttOwDUnBj5iUzZfIwIVpgtWW1QfoJPj8pfkCHRF865km56Ecp1EFZ3XtHdk+56qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735821; c=relaxed/simple;
	bh=HRBkK1ujgvMpTyki9iSbpx3bzHHbsI8zUtj+dAftldY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m0kyMoWx+CcPph3ua24P3qxDwDua/c7oDiNCy4dM2jgiDLPHcW3a1QzMDBz8h67bxlE7kuG+Sf9k35lA76crhq1XytsozROQEGwb+pbPluPKTsAwwUM/C6TfwfhHWESY/fmNhLC5K5vVoWGddkqnjtgz+6Ez8pLcV/a/7PkdIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqfiQpAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqfiQpAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECEE1F0089B;
	Sun, 11 Oct 2026 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791735820;
	bh=lyyf5vQSqdsjj2xDdZXmskgyBIrbaAB4nCRmvPY+kqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KqfiQpATlGlEWuQmigD2Jeb+boHqEU+5wSPRh18RZLOgRdvQMEYfd5OaVWS9Bf1C3
	 5+y28Uz8sWnASsAiwlr0iqs8RaMk4ZNGGRip8gCx2M5siLV+CVDEufQXklN79I+tvN
	 cYnB97pkmpmjr8Ck7EFa3drzsGQ3GbsfXeRWYKGYY9beGjLZqw3/SUToU71YFSkZVg
	 DqpH/IPHRuA2GoRlJBnf4WFr+Pv8dliQfSrhJ9PncEbXHApnFJdTGYBBJ38lfZjd7S
	 GQZvAND4IbaMHN8tKzNNyD7XE/LbLcIVyE13DPzOZm1vFtuhp8k0p7rNGrWaUGOl8X
	 n3CLTkV1jzM7Q==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
References: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/3] bus: mhi: Add loopback driver
Message-Id: <179173581801.13977.11949890966087082235.b4-ty@b4>
Date: Sun, 11 Oct 2026 21:53:38 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0


On Mon, 05 Oct 2026 16:09:28 +0530, Sumit Kumar wrote:
> The MHI specification defines a LOOPBACK channel that is already
> implemented by MHI-based devices (modems, WLAN) deployed in the field.
> The endpoint firmware echoes back whatever the host sends on this channel.
> Without a host-side driver, there is no way to exercise this channel to
> validate MHI data path integrity between host and endpoint.
> 
> This series adds drivers to exercise the LOOPBACK channel from both the
> host and endpoint sides. The host driver (patch 1) binds to the LOOPBACK
> channel and provides a sysfs interface for configuring transfer parameters,
> triggering a test, and reading the result. The sysfs interface is stable
> ABI because the wire protocol is fixed by the endpoint firmware already
> deployed in the field and cannot be changed.
> 
> [...]

Applied, thanks!

[1/3] bus: mhi: host: clients: Add loopback driver with sysfs interface
      commit: dd93cef28dcb604375236a9cfa8c683e25b66e33
[2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      commit: f9ff616f57471389893475166f10765d77854e9a
[3/3] bus: mhi: ep: clients: Add loopback driver for data path testing
      commit: 0b1883ca75c0005ab5ca52c7bc1a26329bc39746

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


