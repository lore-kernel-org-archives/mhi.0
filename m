Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A347B42E
	for <mhi@lists.linux.dev>; Fri,  5 Jun 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645413; cv=none; b=C5MaG7cZ6CW06T6b16dOzymVzvcsKvteYq2oNK3eoVCqpKFwGVC7IG3KM+C1eBpWKnNFo2/0Gf4uAkB1R3how4sWEPvurYgCua9zCJWON80mnYF4fgkODC5OjzdxxOeO877qqfWgO5R8SdFgkFAg5u9etY1iG8q8/MfqLfwYgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645413; c=relaxed/simple;
	bh=/9a9tP30o4h+sqqfwJZVT9oXDK0q1lCma5l6Qzai21U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3ehUMFs6wbH5YRiwGLLz04M8Bgp3xdm22HgifefSokKFHp5hGWbqSeQYoPM8cmRgSSK3htZq8ZQ06fptnmx+g50jkllSlG0urwBcIQ3LgB/2R06fMqe4DiIpKm2q12Bkl+03vAlh0gWTyZIrGmZBnS5zps9xjtnj9r5S9VxiSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsJXVpOq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsJXVpOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688261F00893;
	Fri,  5 Jun 2026 07:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780645412;
	bh=yraE9qJxSGdmKVTNsqi1RNCIbMgny4j3BZIMJPGIrjc=;
	h=Date:From:To:Cc:Subject;
	b=bsJXVpOq8NXADaByY6VHKweytQptzXyZr2Av8XrKGktc8+zdul3AlQ2xSn3NXzh8b
	 q52w46XlR0hz3dSbr03o/OK0QiYjYET+4yakrCHHBVA/PvAsIQnVXo8wiRbYJQBUTU
	 bRPDMEryr6wsVY4hTAwWOblfgsrr58kP4DohRe3IHtxMCsRKD8wU1Oj2rBQZKAY8k4
	 iIEm1cRM7l3YS24bTSaiq8K8Gg+XlrVtvDk0c5gzcppbL1qml5Iu/OXLkydOe5XBci
	 9okcF4gtWUG1pHmmRnHjS4wrLh1RgsAL4qBdWocNJCm1ZlYZL7BHocFtg3l2QmMBXL
	 uRwbVKp+y6sJg==
Date: Fri, 5 Jun 2026 09:43:18 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v7.2
Message-ID: <jerqsbmye24zebssys3tv7oncaj3gurirpjzrqvz2nmandl4xg@oqeyjeuy3rkj>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.2

for you to fetch changes up to 32845111e8ea6ef5e837b6d25080e69e99bd4561:

  bus: mhi: host: pci_generic: Fix the physical function check (2026-05-27 17:43:11 +0200)

----------------------------------------------------------------
MHI Host
--------

- Request power-of-2 MSI vectors from pci_generic driver for sanity.

- Add support for Telit FE910C04 modem based on Qcom SDX35 chipset

- Fix the check used to identify the physical functions to work with both SR-IOV
  and non-SR-IOV devices

MHI Endpoint
------------

- Fix a potential deadlock in the mhi_ep_reset_worker() helper

- Add lock around mhi_ep_handle_syserr() in the error path to avoid race in
  setting MHI state in the error path

- Add missing state_lock protection for mhi_state access

----------------------------------------------------------------
Daniele Palmas (1):
      bus: mhi: host: pci_generic: Add Telit FE910C04 modem support

Javier Achirica (1):
      bus: mhi: host: pci_generic: Round up nr_irqs to power of two

Manivannan Sadhasivam (2):
      bus: mhi: ep: Protect mhi_ep_handle_syserr() in the error path
      bus: mhi: host: pci_generic: Fix the physical function check

Sumit Kumar (2):
      bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
      bus: mhi: ep: Add missing state_lock protection for mhi_state access

 drivers/bus/mhi/ep/main.c          | 11 +++++++----
 drivers/bus/mhi/host/pci_generic.c | 36 +++++++++++++++++++++++++-----------
 2 files changed, 32 insertions(+), 15 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
