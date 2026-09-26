Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAFA26056C;
	Sat, 26 Sep 2026 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422734; cv=none; b=fM3Oq7fpOP5fUQn5twq+aF7pVWY1OzCdDz6VR//A0QZmPYxZcekRbciFWLnUdmUamJYTgx5yngYlvXoympeMxCz7J4tP4zE8rITlabdHE2/9lFSR71oKIBPo3r5s256rs8IuMYqIxvIiHuaoaOMWMwC2MZiQydcLR79GJel+/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422734; c=relaxed/simple;
	bh=pIUGFIa4CCkeKH9BdUKnwFgvD6gxGglCQnWFGQ18KLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bC6i5aZo8KM99yQA6qtual7/xEzpjdhrYQ/aRHNy5tsL+CSDqLsyUDRoDYTUSdyR8mUl/Rk7fLtTi99GFWbsf/T1qIpIxVSM4QtgLSJTWxumLXLQDkeXWxRr/lZd1vXaDyyErK+tZw9ZaxqrrZKUoorL8GDfbir6E0qHAFwzUdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3xWzNHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3xWzNHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F0D1F000FF;
	Sat, 26 Sep 2026 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790422733;
	bh=vp7+h8+CN0gGFoj5xg7gbmyATqBeQDFeo+kd0VpA/J4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A3xWzNHzTCsSVrygWYb+CSybrtcqOeYqJhhZgTzVOyWAWEvpnXWKgnkCwa4pe5QKx
	 u1lseotDreyOLBKbMnjgZi/UJaponc9Guhzx0ArP8vwOihKy9OE8GoGZz/E1dkwGlr
	 1M3itGaekJUOGLl3ZkQrn2l+ZATQvtxKxDgXgEqaoWV66RxzuA7S3fO3YFM4Btcssi
	 PKXF2Q82HD+iVIQl7+rVLrVF/VfVV5O1SZzRATVQ58axd3TmqLnYZ7vCH7MEGsk36U
	 z5JcqJvj4efsHcX2OMSt8Is7nGz5GXA61FjQBDgs0U4zDlnprwv54jgAj1fuPqOduD
	 prB6zKXP2G30A==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923235430.703236-1-oss.patchbox@gmail.com>
References: <20260923235430.703236-1-oss.patchbox@gmail.com>
Subject: Re: [PATCH v1] bus: mhi: ep: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-Id: <179042273052.239868.1261675349569927282.b4-ty@b4>
Date: Sat, 26 Sep 2026 13:38:50 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Wed, 23 Sep 2026 19:54:21 -0400, Yuho Choi wrote:
> mhi_ep_register_controller() sets IRQ_NOAUTOEN on the doorbell IRQ
> descriptor before request_irq(), and the flag is never cleared on the
> error paths or in mhi_ep_unregister_controller(), so it stays on the
> descriptor after the IRQ is freed.
> 
> Pass IRQF_NO_AUTOEN to request_irq() instead. It keeps the IRQ disabled
> until mhi_ep_power_up() enables it, without leaving state behind on the
> descriptor.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: ep: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 3ae2c076ed38afe76b4c223fbc2e87738a5b44dd

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


