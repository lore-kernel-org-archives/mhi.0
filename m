Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52AD305665
	for <mhi@lists.linux.dev>; Fri,  7 Aug 2026 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112097; cv=none; b=M9uekgdj2DfNu1RA4/k/XzVO+XrFnvQA/AeIH0MI8m0ahCG/Bm0yXU2DCcY6kompYHMoHnO+vObftdy+0QwvLGGRbVCAMhvBo9ttpwgJ0ysMsZYbuW5xsnj22JfODnrd36RL4fQ1C3J83MAnQ1cCi5hkH+8vlBRqRuJp1kRkVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112097; c=relaxed/simple;
	bh=2BM747wx3ip57ePFq57UGoXsZ496CSjlqPPAb2mbh6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWAXsnDhwk+73lorxcmlOFfxGRrLC3fkpSOp8FH3yV5FLDJfm/s9iK6TtIpq7QQaDIRdeTW1fPjL6+GUgMRj8SEbX70SuCh79/fXmnluAYw6MDfa8S5dyCR1RlweE4le+ywaV1qziE2yUE+SZLflhmuZrAtXYS7uLxHKffbyUss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EapvW9b2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EapvW9b2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94C11F000E9;
	Fri,  7 Aug 2026 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786112084;
	bh=UYMMAAL6g8oCEhJwd31qrO4iUVJLqNkHa87awjQAf3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EapvW9b2wjXYBHuKsYE0HssyHEtNr1fEx98hDakTl8jmxHCXw1GimraUy7+YX1d8e
	 nVQtxcDJwh8OzqbKRNMYCmQ+/1/lBmESp0QeAzFpnLOrMwibkbNTySA897onSGx6Fd
	 WGUz1DmIOOCmHzITQk2Hy0hr3QsP6JFOP1z0blsc=
Date: Fri, 7 Aug 2026 16:13:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v7.3
Message-ID: <2026080747-vengeful-public-d4d0@gregkh>
References: <wtodnwcia2tjuftfkmnyb3hor2z246ivmulbz3frphemsa27ma@ku3tdgjucyyv>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wtodnwcia2tjuftfkmnyb3hor2z246ivmulbz3frphemsa27ma@ku3tdgjucyyv>

On Fri, Aug 07, 2026 at 07:59:11AM +0200, Manivannan Sadhasivam wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v7.3

Pulled and pushed out, thanks.

greg k-h
