Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2DE3A1A3C
	for <mhi@lists.linux.dev>; Fri,  3 Apr 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211549; cv=none; b=o7Pe7gxtK26P8uJDY2AI4ASHkr5GHWNpqEadioSnD3rwLhpbfqahh5AtJOyB1LS39juMWzvtoj805saw8KQI8GAyN2UP2TzdZEFeoiVe592ZvgX7pPM7keOaJgmFJvZnw4IgqCphku5SwHYDjuFyJX7fwQG02KWokSczhHtXEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211549; c=relaxed/simple;
	bh=O1Q/fDz2RAmpAXWgfSrcVuOCK6sgeUO9IIm4l27LIQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VX9jFGK+Ni90QwS0+V4iHgDe66TdzcKRgCuDS7UNnZibSdEdwdDt2rxl857z9HocO071ZK6P3n+Hxc3AwQo4W0Xo19bOq2X6W271a6ihU9d4CnQ/0rqBsUbY87B3To5CznBDhQ+cqlUncIJl+8fCHUNGkjlCNpjkrFTtYGLTC0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkkKHt0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkkKHt0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE62C4CEF7;
	Fri,  3 Apr 2026 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775211548;
	bh=O1Q/fDz2RAmpAXWgfSrcVuOCK6sgeUO9IIm4l27LIQE=;
	h=Date:From:To:Cc:Subject:From;
	b=MkkKHt0lqUL0P1EuaPLoLoTPMxssfCWXUu1UV5MBIb+XA9M68YSfqhXti2RBQBwmR
	 5q9GebRKmglGEsMgOaqIEIkIU4KejWFQQGTWZDYKdRHwtUT4Uve0fwWKSC+O4SBAQx
	 hFOAAKq2nRkQRaWIxnJ6SBVwkTM7nTFE+f6Ls48jmGspDKHUBG2cSRAjST4duL8QRH
	 1IDQXiR8AMNuY+tuksWUhKueHJlffV+awqUSOs3DR5Ok23LqkA7LpKrOhOtFOV+Oq1
	 LaLROiYjp58xvNNgbp6ywQqD4IBFfZXpSiLKx9BYeBuHTJlpM8yuUQJk0dcH2VqtVb
	 di/qhr8Mancvw==
Date: Fri, 3 Apr 2026 15:49:02 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v7.1
Message-ID: <atilimjgf7mu7optkqbrn36ekyxj27dw6kyqzelqqc3rgldlco@upwkfdqb72wq>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.1

for you to fetch changes up to ac12b852b4ead4a586299c8f68cdcbcaf1bf6cbc:

  bus: mhi: host: pci_generic: Add Telit FE912C04 modem support (2026-04-03 11:44:25 +0530)

----------------------------------------------------------------
MHI Host
--------

- Add support for Qualcomm SDX35 and Telit FE912C04 modems reusing the existing
  channel and event configurations.

- Enable IP_SW and IP_ETH MHI channels for Qualcomm 5G DU X100 Accelerator
  device (QDU100). These channels are used to carry O-RAN specific M-Plane,
  S-Plane and Netconf packets. The drivers making use of these channels is being
  reviewed.

- Add NMEA channels to Telit FN920C04 and FN990A modems for GPS/GNSS support

- Switch to mhi_async_power_up() API in pci_generic driver to avoid boot delays
  as some Qcom modems take a while start. This API ensures that the pci_generic
  driver powers up the modem asynchronously and doesn't block the system boot.

- Add pm_runtime_forbid() in remove callback to balance the pm_runtime_allow()
  call made during the Mission Mode transition.

- Used kzalloc_flex() to simplify kzalloc() + kzalloc() calls

MHI Endpoint
------------

- Test for non-zero return value 'if (ret)' in the endpoint stack where
  applicable to maintain code uniformity.

----------------------------------------------------------------
Daniele Palmas (2):
      bus: mhi: host: pci_generic: Add NMEA channels to FN920C04 and FN990A
      bus: mhi: host: pci_generic: Add Telit FE912C04 modem support

Krishna Chaitanya Chundru (1):
      bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem

Manivannan Sadhasivam (1):
      bus: mhi: ep: Test for non-zero return value where applicable

Qiang Yu (2):
      bus: mhi: host: pci_generic: Switch to async power up to avoid boot delays
      bus: mhi: host: pci_generic: Add pm_runtime_forbid() in remove callback

Rosen Penev (1):
      bus: mhi: host: Use kzalloc_flex

Vivek Pernamitta (1):
      bus: mhi: host: pci_generic: Enable IP_SW and IP_ETH channels for Qcom QDU100 device

 drivers/bus/mhi/ep/main.c          | 10 +++++-----
 drivers/bus/mhi/ep/ring.c          |  6 +++---
 drivers/bus/mhi/host/boot.c        | 22 +++-------------------
 drivers/bus/mhi/host/pci_generic.c | 40 +++++++++++++++++++++++++++++++++++++++-
 include/linux/mhi.h                | 34 +++++++++++++++++-----------------
 5 files changed, 67 insertions(+), 45 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
