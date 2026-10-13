Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85740D587
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899534; cv=none; b=Bgxx98mPMIzQxuoTx+h2J2E3Vl0C5ymuzdvRpFKf46xI2//umDMFeg4a3jcF5KO6D2PuMgI2XiTKaBpIR5nkUdpa8xYQJvG/LT/qIIaxA3mOnm6EAcDKZYRlwgPe4PPMZTeUAhBeEBNb562AYw4JlfraSs5zlSINJdNzRE0LQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899534; c=relaxed/simple;
	bh=/oblkydYcROYLlLGI7YnB6JcuRsEBFuej4uYW2bYVmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1IEM0xTppdHxUaXaKWo6zm0iWFCwm2i6ToctmHXZPKU29tlkKiYaTnxczz4i0uON8cEMzbqlavslK+WMax//Sz/bXf9l3Lk0p99emjmURI/b8eqQFV127TOpKieviMkNYC0aPwKnNVxhXqHVmB4O62qNkKCGHwecvsjmMpPRKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=POHF+ayU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="POHF+ayU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CD01F000FF;
	Tue, 13 Oct 2026 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791899533;
	bh=LeF+SZ1JKsIRjd42QxuG4gbA0UIhmZ9gbbsuVjHeDHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=POHF+ayUAmEEe7zfhcsXnQlu5pXVy5P87JA+jQ/wVB6wq9fbb828tFlQqGJYWAdxj
	 juNY1kMQ07EWx1mBlToDRzmc8cpluwx1FfF+5MyZeP1e336ngxi0fuV3TDftMYSttq
	 wuJTf/jUNKPhwjNC8neDyBeha2cjPE9WWGVoqPH8=
Date: Tue, 13 Oct 2026 15:52:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [GIT PULL] MHI changes for v7.4
Message-ID: <2026101310-fester-dastardly-0b3f@gregkh>
References: <ctnmebhstfosmpc2togw2xeiqrcj2f2ffdmfqgragsuizlftmk@krdvivv7lqjv>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ctnmebhstfosmpc2togw2xeiqrcj2f2ffdmfqgragsuizlftmk@krdvivv7lqjv>

On Sun, Oct 11, 2026 at 06:54:09PM +0200, Manivannan Sadhasivam wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.4

Pulled and pushed out, thanks.

greg k-h
