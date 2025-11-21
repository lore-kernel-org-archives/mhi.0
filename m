Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86D7260B
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742005; cv=none; b=Odqq6Yj7FGtTMxj1Z6eEzESjJ59yogzS+kHr6Q81QbT/w6UuYYmyZY+pck6zQBDm2cwz7i3aR4T4WBFEu7cyBGP0cvKk8yIHQCUS3n4funrScwqWhgWXg7ptaK9m3KJ5sPR4p5ut9/7XBwghPNK6oWEQeIElolQLbjr3PTSDYGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742005; c=relaxed/simple;
	bh=XENvtl4r3g/TYmcXRcqzykZWA57n3SYKt1EyHbkVIUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j69rXw6UOAZe93WCTHXkPnnRH+nuxXV03ocjjjMKF2Dws4fp18RvciXiew/jlARuaQyg2JwkKvhXbtiwOVpHsObhydYQxpMEvxUhoXyz/ZVUm5VwzNv5zQ/fyK8iM9+OeRgfrcRNAh+527bJtBjm3iKTvzo72f+xr129w7B8IC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ei4oWPPr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ei4oWPPr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD94AC4CEF1;
	Fri, 21 Nov 2025 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763742003;
	bh=XENvtl4r3g/TYmcXRcqzykZWA57n3SYKt1EyHbkVIUg=;
	h=Date:From:To:Cc:Subject:From;
	b=Ei4oWPPr8iR87CApTk8DNcaXW28bAoNDzuIFJ05oFgxtR7jPKAcpRbKRZUFpo8AhX
	 08OTw7jIHzJx30mSOwAOs94htlK/iU/uP+qSg5RdZiR78I75fNjGc7xFX3cGTNYyC5
	 sbcsHlHcJSPkn1uAK6tdvIH7PrKjeAypJJsH7hHP0L1022UDqJn9BZpdTLORYZeDyg
	 dBhWS49CpA5qLgz8rdqpuWnFtCzVN3t7cy73KhLaBnRTNePYxkuOIA0/hnnLYZtrsU
	 /AcglsBrJM0pCnZ0+0D3SYaSRSqhQfwHwxdE9kt/YBoXjl5FzEdYfimhXiY4scAgFY
	 EkN0RDTGU1C+A==
Date: Fri, 21 Nov 2025 21:49:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL v2] MHI changes for v6.19
Message-ID: <3qqwa5qem45mdxadswbzrzcow3xsu4gixk26a34oplcaslede2@ofagkk4px26u>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.19

for you to fetch changes up to ac35e04f8000aaaf98635792464647e7a6f3422e:

  bus: mhi: host: pci_generic: Add Foxconn T99W760 modem (2025-11-20 11:28:47 +0530)

----------------------------------------------------------------
MHI Host
========

- Add support for Telit FE990B40 and Foxconn T99W760 modems

MHI Endpoint
============

- Make 'struct mhi_ep_bus_type' const  as the driver core now handles the const
  bus_type.

- Add WQ_PERCPU flag to alloc_workqueue() as a part of the workqueue refactoring

----------------------------------------------------------------
Adrian Barnaś (1):
      bus: mhi: ep: Make mhi_ep_bus_type const

Daniele Palmas (1):
      bus: mhi: host: pci_generic: Add Telit FE990B40 modem support

Marco Crivellari (1):
      bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users

Slark Xiao (1):
      bus: mhi: host: pci_generic: Add Foxconn T99W760 modem

 drivers/bus/mhi/ep/internal.h      |  2 +-
 drivers/bus/mhi/ep/main.c          |  4 ++--
 drivers/bus/mhi/host/pci_generic.c | 26 ++++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 3 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
