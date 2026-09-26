Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75593FFAC6;
	Sat, 26 Sep 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422487; cv=none; b=smEFkpP36tKNDeTOk+6nyYrmQhFgPXdOcS8Tsqq2ut+ZYx6hCKYEYsFBzKb/SOnmnM+5hI0BPRQXbUS7UjbG8nTy6c1CpPo6m+8APIxr/osVgZJ7eeX0MZnG9rw/wHpUxbJ5zA7exSlbqxxabHOUAcKLU5rk6WIjmQ2wj7Zl8lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422487; c=relaxed/simple;
	bh=k4Dg/lJLyUG5pec1EXOgIkncRvsO/pWriGkk26Jbnfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtvtDAFYU1eN91jCHL8YrhFziKD1vxviwaitTmzyUpZoZd9SFHDIW/5rRrjRHa3r+lsqFKFHh4mTGs9g+/BKTAY6SP+PZNh1O1oTLCfJW+6CIO+gnSAf7Ub/TCU1cCsgQw21KthXEopQEkeaLifiYunLqOG7WeXln9BYop5wwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tnh9ah3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tnh9ah3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653391F000FF;
	Sat, 26 Sep 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790422485;
	bh=awbBrEwYoj+7eAWiKdQgsgiNFqMAyTNGOLf61N804/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tnh9ah3wHOICWI24WjTIT3QkPpMJ+5h8KSN+PFEqBsoUToO9z4VwA5uFyBskHXxU4
	 vDPbpHgoCokWWJSX+rBbOgtdrOdZgrgRl4LCE5y3d+hzNZ1PAcTe6aSlTuhiD5Y/rs
	 rh8ATg+V1qOtIhfz/aqCiiz3dbCy1VN8gFfes/13L3YQu7T6jD2Xx3R5BtfJ/URymA
	 Rqfd5rLwCn1pBzh58s+gNW1fsH7w7SdHcFCS3rHXJ9JlOaXmXlMfsdbeodnL1XPYQ5
	 HZUFnpxdupkwaJvT+fg2CHpKfwd5c1+WQ1NqnpoO/0U0VbjF2D7eQ89TF6k1+cRQQg
	 r/lvpc1JUdZxg==
Date: Sat, 26 Sep 2026 13:34:29 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] bus: mhi: ep: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <higpepbcvcvrninh44qnsz4m25i6qbfi2ewf3r7diur6uj24wo@vwk66v6hqqoo>
References: <20260923235430.703236-1-oss.patchbox@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923235430.703236-1-oss.patchbox@gmail.com>

On Wed, Sep 23, 2026 at 07:54:21PM -0400, Yuho Choi wrote:
> mhi_ep_register_controller() sets IRQ_NOAUTOEN on the doorbell IRQ
> descriptor before request_irq(), and the flag is never cleared on the
> error paths or in mhi_ep_unregister_controller(), so it stays on the
> descriptor after the IRQ is freed.
> 
> Pass IRQF_NO_AUTOEN to request_irq() instead. It keeps the IRQ disabled
> until mhi_ep_power_up() enables it, without leaving state behind on the
> descriptor.
> 
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
