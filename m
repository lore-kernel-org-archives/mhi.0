Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFFE274B40
	for <mhi@lists.linux.dev>; Thu, 20 Nov 2025 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763619060; cv=none; b=m018EXVkELUMarSPHgkKo3lmimhgz1blDY8Whk1IvK3OiV+SQuJ32V0u4MnYnRwS9JAloRL8VMD/b9B8mX3i/jhIaaiR+07mTSOqyIUjLq1K+6eCJspojl4hoRvS092HyfKhf5x1NGvb6PN6VqYXtRKKKZqfsmW5AGmwrbmc7AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763619060; c=relaxed/simple;
	bh=XENvtl4r3g/TYmcXRcqzykZWA57n3SYKt1EyHbkVIUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F6lKPkxtjoMLkB+8Keo8Z37Yncs+BKntjTr8bCCpeMk1cd/DwtrUDqa15DG8VE7isBqM7WwVdkEQZNaAVpGhKqIdovgvNdvKO5+/v+F1VnM2AQPo+Z4IYLwn1N2a5WJp8VJCEY22NEBAh9CWDz06jcp1eEhfMhV0P3AZySwjAZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFn0HrUw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFn0HrUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995D5C113D0;
	Thu, 20 Nov 2025 06:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763619059;
	bh=XENvtl4r3g/TYmcXRcqzykZWA57n3SYKt1EyHbkVIUg=;
	h=Date:From:To:Cc:Subject:From;
	b=AFn0HrUwMyoUCnv8Jt3U2MpVHjXv1GIR7d+2rfD3+UOcm2LLUnVO3EtwaEyx+AQn/
	 Kfh9rPoYPzwAKakoxmNaIBn1KlWrRq5xSOHSgy3NMpyvcwUZnrHZ5n7+s8T6O5vfJ1
	 UjHmK/scXkLTjjeyWbJQVIpYvzTowpQN0ZDEE3dXtJNT9qlbYE8CfI8ctgvP5ylKq/
	 t/HPK2BkNbzy//MpE0QQ7oLYi52AApqqSgE+yXEOf0N+6oT+uniN/79vzRz6oF3Uxt
	 ++HNLMIeSyb5rtMpSfwLxKwYLTRdFfjqLZUIRozRfhu0acVrl5pOQk1Q2YfESNOkyB
	 ikFrjLYiWV+lw==
Date: Thu, 20 Nov 2025 11:40:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.19
Message-ID: <34iklxcwetejiip7pjaohgudz5plbbxvt6bj3ijv7gcsf4t4jx@alpswssesdws>
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
