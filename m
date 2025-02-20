Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316E61E991B
	for <mhi@lists.linux.dev>; Thu, 20 Feb 2025 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740039759; cv=none; b=u8nSXTqzc4lIMi4SyiCMKfeNN/0HgzaXvfdKwEC30gE041xMNzNO4NDWzV0n6NLuDQQlH8ewfS961XYzo16b2hDdPzanMiiPxvRdv1v/cYH7y9xywbG2eMyZWbYYFVy/bxb8He5zhpIa3Jo6DMnSZ0ifirlULsU/c12se3DB9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740039759; c=relaxed/simple;
	bh=b6b/KlyDPoe2NVV4/jvfs6yEoYmbqfRxVsZauZO20mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLLgz7xvav88rB7Hhp2vvcEgl5gJeyGTgkC9SHD2Rw4ESGX4+4WzJBYSED7vBFOLR81KEWh5LUwKf/JfRfQc4JVKumK34rpzgJE1njaJqLuuR9jnnyRuA+GUsr/hoga9RZrRLwJAwNis0KP4LCFwzELyUxSr3cZKIAqxd3QzBjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yk4iWUkX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yk4iWUkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417A9C4CEDD;
	Thu, 20 Feb 2025 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740039758;
	bh=b6b/KlyDPoe2NVV4/jvfs6yEoYmbqfRxVsZauZO20mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yk4iWUkX53of6yAa14z1ddCfAJ2o+mXyxtJ/I3dDh3lJcTWzMEdktyFy2RPSqurDF
	 5J2eTYeYfUwqo91qnB9GOmyGoDpXgEY4MfNgJxErMSdVyPBW2KqYHFOEE6W73ykIwF
	 OhIUr7YWtFEK8uz8GeXQwDdbrXtL+/I/52PS3HKk=
Date: Thu, 20 Feb 2025 09:22:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [GIT PULL] MHI fix for v6.14
Message-ID: <2025022018-predefine-study-906a@gregkh>
References: <20250220063354.4vbhdnvhfl7c56ck@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220063354.4vbhdnvhfl7c56ck@thinkpad>

On Thu, Feb 20, 2025 at 12:03:54PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.14

Pulled and pushed out, thanks.

greg k-h
