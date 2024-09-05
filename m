Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89FD38C
	for <mhi@lists.linux.dev>; Thu,  5 Sep 2024 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546671; cv=none; b=emEQE2MDKwPtutDAFx3nxmqYtwhY2yWKgagQSPeH0vZOAb+xB7d8Zqga44k7rG0Guiyu2lukiz/tsIN864/h7chQUqCBn6P6VWwBYRJGullO6TUpkfWB3S7GWrZ87T/CZgWf57Jqf4yUeo20jbvyAh/Exd79JnT8ml7//rfVWb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546671; c=relaxed/simple;
	bh=7GVwsVJSs44j2j0GK9G/iaq/G+KTO3PQKC4nYdixpkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDy7UZnxRH1F+zwn6TS26+glw1WYC22vXZ+s7gXzUC/9I2EBPOmSqbpem3CMw+j1HRP8bytZBhIfn9PvCmrLJR0kjxsSuyaBmDnr5Vue6XwWDacKC/X77hzCRCpMaoqPG6jIhrS7Z24D6uw6Y2z7Jyyd6lkigMU3rhAMbGd/ZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TcR0r2rT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TcR0r2rT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD439C4CEC3;
	Thu,  5 Sep 2024 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725546671;
	bh=7GVwsVJSs44j2j0GK9G/iaq/G+KTO3PQKC4nYdixpkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcR0r2rTYw/WDPJl16KqpbcaOzkbTkssRe6lEBNHviT4jKX80sQLuvIba3V2c3/OW
	 FDW24XsDGpj7o+VLkjZaa0jIlzjHj1X/2cfdn/+0Ruj/PqMBJpu97RxekM9eCC4Z8j
	 efE35MPR4Z+xfK1Zw+j/EuyvoJMpfYy2Yq+R/yLs=
Date: Thu, 5 Sep 2024 16:31:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.12
Message-ID: <2024090559-unclaimed-happily-fa18@gregkh>
References: <20240905141302.c6plpsxn2slkcuc7@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905141302.c6plpsxn2slkcuc7@thinkpad>

On Thu, Sep 05, 2024 at 07:43:02PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.12

Pulled and pushed out, thanks,

greg k-h
