Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F63A9619;
	Sat, 26 Sep 2026 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417935; cv=none; b=Fi+BEmn/p3WsSkKltVjF81Ep4rHDbiYPVSItwKilO+HAUfb6bVdaoM9fDzpu8EAVu72LPblSP9GMpkfQxpeky26tHloCxr+Zgr6EhHizQqEQ0L0QBGdpA+5RxSDkxNP49arzzHm4HyIv2tFmv3V6KmvMuTS2eZDkgvQcW9O/GnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417935; c=relaxed/simple;
	bh=iEk7V1/0WBxsUmi09StiNddndOWxuQdkmi27S9qY7RQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fi5q2yVPJnzNWmWPuYihexiUyuUmxoEWxl8jP2sN24Ny6q6ujZgIicdg/2PuzufehJyIVNTkPtyWOQWHdUoNMp6Ko4kCezJ4MupF0U5ATD5VXoUJcL6W5s27O9m5uN/xzAQpYhFnG2uoKfsBfM7jeoNoRNhz1ljRa1zKMvfR2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W60/ZOSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W60/ZOSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12521F000FF;
	Sat, 26 Sep 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790417933;
	bh=QWK9woV9CptYmbcc53OWuTMscc/CJL5LLAF/moZU1Zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W60/ZOSw9Cu1aLUmf/Ch6O5Ovd6odSXqJf5T9i0IylRZ0ENn4V42b6Qf1Ek3z9cc/
	 pwhUaP5olsdy+cgw6I17OBDz9nGnFa3lFLlyy5OALzsqb28MFmdKKhXVXl6wZx5Zie
	 5ZqMozYcHALb8DUL3AA6CwVFJNgKTraOPw1SGwMAB6eFq3M2Zq8YAQv8VE1Lt5VXzt
	 vPTCn+oHUrxZMPOYwjIGYYd4MTf3zWcthxf2jqCVLf8l34EExejotQ3UiUNai+MIDo
	 p3Rsw6hLrCsiGRU4/HIf1+KUPyNLUcwfv6NLaz99GSV61Z96U/06tXD73nSAoWZdAA
	 9UbNp9fgm54dw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Alexandra Lu <alexandra.lu@nokia.com>
Cc: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>, 
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807143353.1932381-1-alexandra.lu@nokia.com>
References: <20260807143353.1932381-1-alexandra.lu@nokia.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Fix runtime PM imbalance
 for no_m3 devices
Message-Id: <179041793127.232689.3792166271248903025.b4-ty@b4>
Date: Sat, 26 Sep 2026 12:18:51 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Fri, 07 Aug 2026 14:33:53 +0000, Alexandra Lu wrote:
> mhi_pci_probe() drops the runtime PM reference taken by local_pci_probe()
> only when the device supports both PME from D3hot and M3, but
> mhi_pci_remove() re-takes it based on PME capability alone, without
> checking no_m3.
> 
> For a device that is PME capable and has no_m3 set, probe therefore never
> drops the reference while remove takes an extra one, leaving the runtime
> PM usage count one higher after every bind/unbind cycle.  That is benign
> for the device being removed, since the PCI core resumes it to D0 on
> unbind regardless, but the struct device outlives the binding, so the
> count accumulates across repeated cycles and can end up preventing
> runtime suspend altogether.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Fix runtime PM imbalance for no_m3 devices
      commit: 95601e9948b42f82600ff2d9e0c2f699a067d561

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


