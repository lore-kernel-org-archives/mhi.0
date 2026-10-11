Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426F283FDC;
	Sun, 11 Oct 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734685; cv=none; b=gciE6xfryNrBunbGZP4U1u4/2YlybOI00Bhqb47it2HcJHXv2474WKimDzTeYg4Ma63EX9dO4AKGHK/d78XDclaARUdi6YmU9nVXURaAeKpZ6OtC3GnaNKTxeELl6vZME/jWhe6tOwZVrqn4cfFqIYtRLWFTyUwGKcaPm26Nw6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734685; c=relaxed/simple;
	bh=VedIeZ6zmjpINfPLpDpfX3sBTma5OYnqgCfqlac4oX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hEiB7SKIgOJ1VNaIlM0R+tRg4P2yklyAwiNpOeDGoyI10Sg3IloPt7Tk4AMyN1wbYOvQsAKWCsiVt10SWLnH4rEwgMVS+FgJn851x78PBxkbCxslZ4TRUNFotfnJ+tLdNQj7p2ijWT1vprKjrEKudJsH85K7zZRoladQgkrscwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odq0YgCc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odq0YgCc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E021F0089B;
	Sun, 11 Oct 2026 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791734684;
	bh=bec+jpXzHaLwD7RfR4+eVFRbcS73w2UfQ4IfOeNkfVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=odq0YgCcWnlJUoW96cP0quA+rpHAQBxl5Qpx3bQJVb7Ycs4aVQ/ZsRWcWpZDi2wYX
	 OWk9B5R16sU0d2TwZ5fygW5ZqwZbAER0DJcn+3eiCPfFRxvdbpJ8pebRecuUiO8imV
	 gYiEXIc8BbloEd7UI6zJjiBcWe/3kPhftx+gyJ6r7kU1RArtHCZrlB0JgjyPQckX6y
	 1arryjPIqGcf21UVScxCV5uaCUiD8rrzGzP0YrsP2119i2s7umRjwMj06RswSYgP7V
	 ARGG6vMKu65wxEOX8DLvbOVkqGJcPgyQTC4k9D+HJH3gJCxwM6YVpLToBEy6JUwfXI
	 CFUJVHA2qndyw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Steve Meek <stevemeek82@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261011-mhi-next-v1-1-13a738637ff0@gmail.com>
References: <20261011-mhi-next-v1-1-13a738637ff0@gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add Quectel RM500Q-AE
 support
Message-Id: <179173468218.6306.10510688907306277028.b4-ty@b4>
Date: Sun, 11 Oct 2026 21:34:42 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0


On Sun, 11 Oct 2026 08:40:49 +0100, Steve Meek wrote:
> The Quectel RM500Q-AE (SDX55) enumerates with the Qualcomm SDX55 ID
> 17cb:0306 and subsystem ID 17cb:5002, so it binds to the generic
> qcom-sdx55m entry. That configuration expects QMI on channels 14/15,
> which this module's firmware does not answer: the modem probes, but
> every QMI request over the control channel times out and no data
> session can be set up. Users of this module have had to fall back to
> Quectel's out-of-tree driver.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Quectel RM500Q-AE support
      commit: a35e29c95ded8356b405c2abd9e667082a2901ac

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


