Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA0D4A3C;
	Wed, 18 Dec 2024 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734511716; cv=none; b=qBZep5/g99lBGgIKDLyou2kAMSwb0734JNheiOJEkETU7DllLZu+mlcilMbS3xy+dlj/wYvX/O3lUgNzXlD20sQmaetzJthqPHbf5LoI1zc3ub4jto5ntgDhSQfiM8QQABp4kD2zHcb5xk82wMwJhMSMzync6a0n2JQCceXK9Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734511716; c=relaxed/simple;
	bh=drsKCPZozs13niBjUfvhx7kcj/5ywH86CJWydnbvlFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB0aMWKWEjHS1knS/AasKTffVIgeQx0bEvkid9i3IZmhtpw3KJSiDb6KAV1BIeGsqWtlps35I++R5PfKZoL7k+eQqe3+e/aq4asdx7RHlvn9ybGMAQ9VydVW14wXNJIwlmTbpO6+oVyIeYQ7wFQ5l8HMWhytztuO05v7ob4vghU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy71o/RI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy71o/RI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7234AC4CECE;
	Wed, 18 Dec 2024 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734511715;
	bh=drsKCPZozs13niBjUfvhx7kcj/5ywH86CJWydnbvlFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cy71o/RIF3ecB+QKys4Togokxz3VtSz7luktfJTY/SUD/4i6ljNoGOWXF6ws5oQ2v
	 SqSxysT1MAqlnRx7UV4oMlnka4ty8mTQ7VRq1+oFPeDKQEKK4VIVcywUwbYowPYqOR
	 pqyi4Kj5PfLWWtBgFpCzsG4AWNjvZH44J/r7p1PRGuNLy2Bm/F6CNF2KFXaNeFkWp5
	 08gEgHmwuz6EHIUXags39TVlO9VXtl15dAxeQmdAmZQvVQi/GaeeVgRJFKeKwCseme
	 9sadkl1woxA+XQbRBODAtLHWQMIy77F9Kf1SI99ZG14dwd6FytfmclSLXVTiefN2WG
	 JE8yxKzb++9Fg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNpjS-000000001zL-1bpC;
	Wed, 18 Dec 2024 09:48:39 +0100
Date: Wed, 18 Dec 2024 09:48:38 +0100
From: Johan Hovold <johan@kernel.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2KMZiUYc_YYBcLS@hovoldconsulting.com>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <CAMZdPi_0oiTFmgkq0hAhamVq-Noqa+jGDLZ_6yVaqHvcO+N=nA@mail.gmail.com>
 <Z2FLErzdRAI73jm8@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2FLErzdRAI73jm8@hovoldconsulting.com>

On Tue, Dec 17, 2024 at 10:57:39AM +0100, Johan Hovold wrote:

> I've now hit this four times. And only since rc2. So I guess that's
> something like four times in a hundred reboots or so.
> 
> I added some printks to the pci_generic driver this morning and have
> been running a boot loop for one hundred iterations without hitting the
> issue even once, however. Perhaps the printks alters the timing enough
> to avoid the fw crash or race.

The printks were not preventing the bug bug from triggering, but I've
only hit this after the machine have been up for a few minutes (i.e. the
delay before rebooting in my boot loop may have been too short).

Johan
