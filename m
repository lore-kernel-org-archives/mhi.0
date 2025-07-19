Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D72E36ED
	for <mhi@lists.linux.dev>; Sat, 19 Jul 2025 03:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752896466; cv=none; b=s6KWsEv2OGIfIre00lsuvNoH4z/iBaQzOh3hI737g8BjLn1FHGGDBbWiPzjkfEA6TSsZWhcTVgbd8WkQsJhoGxoiaLxlxFUB1E17AeGjOEIXTi1bfIz1HuknUKayOE6Y+zKMthydKSf7KJhX20Rj/lXZ9hsph9rcxiJip6ncyAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752896466; c=relaxed/simple;
	bh=0x3cS2ilpPOxk9ECMvQU9pB8YzwJKN8v04sfV3kPdV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/RGelLz5gmw25OXMhdNFWOhz5QG0VzcntEgYrpQwQXizzqOuDSE93fUN9qO+P/wdiK2YfXg0YkygyJ76wPYN9kYHPlyFqjknAZKkVy6byzvvDxqKooRNEd+zJvLCRmF+yqeMGfwxNlBng5noznF0lbFxKMyzYoLM9mFjJg/npA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvSRr8m/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvSRr8m/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89F4C4CEE3;
	Sat, 19 Jul 2025 03:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752896466;
	bh=0x3cS2ilpPOxk9ECMvQU9pB8YzwJKN8v04sfV3kPdV0=;
	h=Date:From:To:Cc:Subject:From;
	b=IvSRr8m/GtlaNxgM2WAS0/vpWuOHj0u2dkMfZWnizVHLJRwuFcoawTET0BdcqT5Sl
	 rIuiidZ/DSnSYvb2syuBA7V7yxQeIbIpmeSgiejKgyvjYwpDI1iXwdlMurV8mri01z
	 EVCnpKci1T0fFR6XZJWQJGH7dimhocKhhuktVbbMijggogtLk5lc2pe37d+ABLhzNj
	 AIwE858DavjEzc2g3/39FUUDu/OpkOskGVwKRjRpfQVvR2mIrPe6Yp2DTYa1bWR1i3
	 rBY1JXGaH4VCOrIgMrJr5YOK01mGvGIplLjTIJmyX18yU7zFUESK3zjjaQCW7FR5LI
	 QiVnTgI7FIW6g==
Date: Sat, 19 Jul 2025 09:11:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev
Subject: [GIT PULL] MHI changes for v6.17
Message-ID: <cwupgp4ao3j6ahhg3xvmok3tez3xvhopqgqkma655ut6hkujdq@3q5xvmrwpist>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.17

for you to fetch changes up to 00559ba3ae740e7544b48fb509b2b97f56615892:

  bus: mhi: host: pci_generic: Add Telit FN990B40 modem support (2025-07-19 08:55:02 +0530)

----------------------------------------------------------------
MHI Host
========

- Make local functions static (as they should be).

- Fix the modem name for Foxconn T99W640 modem.

- Disable runtime PM for Qcom QDU100 modem as it doesn't support M3 state.

- Fix endianness of BHI vector table to allow MHI to work correctly on big
  endian platforms like PowerPC.

- Add modem support for Semtech EM929x, Foxconn T99W696 and Telit FN990B40
  modems.

- Fix the OOB access to Transfer Ring Element (TRE) by hardening the checks in
  parse_xfer_event().

----------------------------------------------------------------
Adam Xue (1):
      bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.

Alexander Wilhelm (1):
      bus: mhi: host: Fix endianness of BHI vector table

Daniele Palmas (1):
      bus: mhi: host: pci_generic: Add Telit FN990B40 modem support

Manivannan Sadhasivam (1):
      bus: mhi: host: Make local functions static

Slark Xiao (2):
      bus: mhi: host: pci_generic: Fix the modem name of Foxconn T99W640
      bus: mhi: host: pci_generic: Add Foxconn T99W696 modem

Vivek Pernamitta (1):
      bus: mhi: host: pci_generic: Disable runtime PM for QDU100

Youssef Samir (1):
      bus: mhi: host: Detect events pointing to unexpected TREs

Yumeng Fang (1):
      bus: mhi: host: Use str_true_false() helper

 drivers/bus/mhi/host/boot.c        |  8 ++++----
 drivers/bus/mhi/host/debugfs.c     |  3 ++-
 drivers/bus/mhi/host/init.c        |  8 ++++----
 drivers/bus/mhi/host/internal.h    | 11 ++---------
 drivers/bus/mhi/host/main.c        | 14 ++++++++++++--
 drivers/bus/mhi/host/pci_generic.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 6 files changed, 102 insertions(+), 26 deletions(-)
-- 
மணிவண்ணன் சதாசிவம்
