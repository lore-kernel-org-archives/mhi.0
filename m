Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643037267A;
	Sat, 15 Aug 2026 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786774993; cv=none; b=HzbKeGwrvPl/u63r0Wcgv/vFk1eUxTH39ItwXJ7gqjjLt+1yWtTq9njiw3zkT/U3JIY/CajlR0vv2XU4ype7lAf1+likbVzgZn+jaEf2JIg6AIK3K5mbRClfF85qJAmZq6nWJCz2DvrRZj0fqRRMhi8Tsv/E5Ag1S68N6wEr+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786774993; c=relaxed/simple;
	bh=c8Yf04VokSeWgGgUKFU0UEhPHLc0Awnf4TqAfJV6Bx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qihg56preGOSzxReJT58zq5ILNzoWj1t+QV+8teL77o3Rlyz8hrwtbmzEWGK8P4aosN41EMWCwmvAZkh867ts3OvCVOaphYQ780bh//qQpilTOd2mUCScHG+03wlf5g9iwfhFZ5ndE5067NcfrwprmIE5FQiG+JdZMySzYsIh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaOu4q9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaOu4q9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA4A1F000E9;
	Sat, 15 Aug 2026 06:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786774992;
	bh=+Oq8sJKL+Ux5fYnzNZhetzafDDvpMD1GOwew6rRyGTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaOu4q9wSPeoa9Me5Cf6CvFIKVi19dMsxnzRRJlxF2yG/tm8xhPGFR86DBrsyUDjW
	 WoP00ayTJ5VwenJmF9G31hYRuoayZ++VhlcxYl08SC1n0H88eb1zZStnf0TvoIPaX0
	 dKeAfDFW6Hw/9TDhqS6Ig2Akf9QKhCru+J+6lCYxNz22JDOBf43SZxwDIzIPWl6Y0a
	 DyKGJv6TNt/oSeAcK/CoLTgGY8LRlfZrtiEOKb9/uyMu80S/NfFpT4z1dqgVrYrUbI
	 eU677zmbokho2owoRKkTh8YeZdq0rhvKNqc/7MoTE/AAOFaVVLE4YKICTm+CHxFvJK
	 yqdbEibxrhjLw==
Date: Sat, 15 Aug 2026 08:23:05 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alexandra Lu <alexandra.lu@nokia.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Fix runtime PM imbalance
 for no_m3 devices
Message-ID: <qxdxn5mfqeoaefyl6nft3xzqwpsyariiwd2uyrusg3huh2llks@eges52jkri6r>
References: <20260807143353.1932381-1-alexandra.lu@nokia.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807143353.1932381-1-alexandra.lu@nokia.com>

On Fri, Aug 07, 2026 at 02:33:53PM +0000, Alexandra Lu wrote:
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
> Cache no_m3 in the driver's private data, as is already done for
> reset_on_remove, and gate the removal side on it as well.  Unlike
> reset_on_remove it is cached for virtual functions too, because the probe
> side gate tests info->no_m3 for physical and virtual functions alike.
> 
> QDU100 is currently the only device that sets no_m3.
> 
> Fixes: 0494cf9793b7 ("bus: mhi: host: pci_generic: Disable runtime PM for QDU100")
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Alexandra Lu <alexandra.lu@nokia.com>

LGTM! But since the MHI tree is closed for v7.3, this patch will get applied
only when v7.3-rc1 is released.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
