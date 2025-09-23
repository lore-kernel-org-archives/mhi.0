Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D3A2609C5
	for <mhi@lists.linux.dev>; Tue, 23 Sep 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758634139; cv=none; b=k5ECccgJuFhgp4nZn47wFpgd36gcI/2PmJuexoNp0gelFH6whyMxcxjVZoXdLzfB+bXInPQFVFckE+4ed30PAEB0aaqaKMX+9wveOD7vbXpCCMScDAiEvAe/OisXDtWjeatKUnjPEoxpTIFloaCvWxA76hYvmqGdvwR3LS9a1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758634139; c=relaxed/simple;
	bh=B5qgxglAi1RRZ0zG5DFehvOKHRDswcF2KAnTJwDmVyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6BG8H4H/MdkGzC40PzO/ZSPTLKGqn34jL4bfiyOVeytd7G/Jw+YuiF5NRn9/DDyhIB3hT/KvrNbktZ+UiipINhyW76HFtW0kQg3UO6IUgXT/qtTrvDg/m7namIKD+LvDS3m6LmXOQ6V+4gAUcSUCNdgiJNnfMVonCHbELtrYg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQEmmNgL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQEmmNgL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7136BC4CEF5;
	Tue, 23 Sep 2025 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758634138;
	bh=B5qgxglAi1RRZ0zG5DFehvOKHRDswcF2KAnTJwDmVyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQEmmNgLhrx3Q/e/gZ6GxQl6nUdTPNO3arHzOc5mnhGryj67RlwyctoSIRCez+Zjb
	 VJfWVs8dBKEfw/t0BhZH2FIZjx2OPqV47ChjhJEL5j69yllfKSW2CiNZ8niAlcG7X/
	 eeghZNi7bnwfZF+33Zz8kHt3ZZmJrK1y49IpWTef9TogD0sJBAC1AFl4TzIrYFKRYx
	 wMOoCjZnaWCL7h8HjGmZGD3Ffe5pd4bI109S0AP/GSAJA3JfWhqi1/j1y8qmRniG9b
	 YXnWlu+5e0bFNkifRkFXavyeyNlkmFfL7Ip4N56Ku6c6ae1T8z0DgjQIQwOP3Le+Ig
	 d2FopW/aCAfcw==
Date: Tue, 23 Sep 2025 18:58:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.18
Message-ID: <r2qzm7sslpagykqc2lfc5nj3htsqqy34qn3o77uwufrul3pbxk@am5laoqrbxuh>
References: <bibfbg3463xep4novmwhu3lrazqh3iau4gp2zx73zrnnkvh4ao@73xc46h7u4ro>
 <2025092312-gumming-relapsing-57f7@gregkh>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025092312-gumming-relapsing-57f7@gregkh>

On Tue, Sep 23, 2025 at 02:11:38PM +0200, Greg KH wrote:
> On Fri, Sep 19, 2025 at 01:28:25PM +0530, Manivannan Sadhasivam wrote:
> > The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> > 
> >   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
> > 
> > for you to fetch changes up to 54c67740fff7360b6607d02b8499d09b944b3fda:
> > 
> >   bus: mhi: host: pci_generic: Set DMA mask for VFs (2025-09-19 13:10:49 +0530)
> > 
> 
> No hint as to what is in here?  You do need to write a pull request
> summary please.
> 

Sorry, I messed up the 'request-pull' command. Sent out v2 pull request.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
