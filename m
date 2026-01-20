Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E8364EB6
	for <mhi@lists.linux.dev>; Tue, 20 Jan 2026 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923735; cv=none; b=eWaSclR+imZX3oFQ2ODNHFRvxDB8QOwfplJmuCIphu+MrT1pbw5WHS5rJNui6ZerwVt3jQJ9R+aM5R+MoEZv/lXlnwAtXBYfTbrUNvttmf+Q+rjUsL8+RsUz0vUCFGhyVXj2Va6Yx3YT89Fw2cEFTs7wPWFtXA1kFhdl1vwO8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923735; c=relaxed/simple;
	bh=fb4bTdnqZb4XnUiiDce5qYTbjsDZrF3LAnSDTMrFXPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtH2WrwVwyKJX/iMGTco7P+mE5lbXkN4IHvW/jN7NiC9XBn8sUwVW7qy7ZIQBnHbZtSCehmFzuUAwFPSVLcE/qPL1ZzTSvTPX8roF6jGxMtyZTTyKZqppHjM0KxKPxUvI+Bdc0a6Dozo7Ky7y+JDHbFl9jLqtq4TjcbKdwyMt9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mKsrwzFa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mKsrwzFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E71C16AAE;
	Tue, 20 Jan 2026 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768923735;
	bh=fb4bTdnqZb4XnUiiDce5qYTbjsDZrF3LAnSDTMrFXPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKsrwzFa+u6Q3mZaxk66b6TyWs5zkU27gJVSiJvMUIWsIIVYRx1cjAZf9r6GwHlQa
	 +rIxKhE1LV056CM2peljeOPVNls6qEo/oU5khNOUFvSYtAdo3/MlTOaIjjJmD/myrl
	 ZE4mN60Y7tEQzvtmG8CwCzRdPB+zXPRwlKLvUnUc=
Date: Tue, 20 Jan 2026 16:41:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
Subject: Re: [GIT PULL] MHI changes for v6.20
Message-ID: <2026012022-lion-muck-c337@gregkh>
References: <5u37cbaldizhvdgnjq2opjvvrfkmehuvwh3ktgjqbmymqur6gz@ddnzo2sruqa4>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5u37cbaldizhvdgnjq2opjvvrfkmehuvwh3ktgjqbmymqur6gz@ddnzo2sruqa4>

On Tue, Jan 20, 2026 at 02:48:34PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.20
> 
> for you to fetch changes up to 91a0b0dce350766675961892ba4431363c4e29f7:
> 
>   bus: mhi: ep: Use bus callbacks for .probe() and .remove() (2025-12-31 16:27:13 +0530)
> 
> There is a minor conflict between mhi and ath trees in
> drivers/net/wireless/ath/ath12k/mhi.c file:
> 
> between commits:
> 
>   7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file")
>   a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components")
>   bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity")
> 
> from the ath tree and commit:
> 
>   51731792a25c ("net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels")
> 
> from the mhi tree.
> 
> I've pushed the resolution here for reference:
> https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/commit/?h=mhi-ath-resolution&id=a1cf17be3ba3718f1a8c70e614f4c0ee026a90fd
> 
> Please let Linus know about this conflict incase the ath tree gets merged first.
> I believe ath maintainer will let the netdev maintainers know about this
> conflict for the case of mhi getting merged first.

I'll try to remember, that's many weeks in the future :)

Now pulled and pushed out, thanks.

greg k-h
