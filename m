Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F62CD521
	for <mhi@lists.linux.dev>; Tue, 19 Dec 2023 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GeB1LFeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FA2C433C8;
	Tue, 19 Dec 2023 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702972697;
	bh=KuZT/1Hd3XumVmd9GV1qsHdCxR5AIC+2YzvRnv+MNuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeB1LFebgxiVfwGKAhGMKlzwQ4hj+hbV02OOa/oFFUHbGvXM8I9zKVQqkXTuFud/m
	 vykeMy7CGsOfObmRvvpHVqqxN1NyiNiR3EWH4IuvurZr6KnZIt3gSdL18V3SFvsKRh
	 Hp0ZLZ6LDEJ2E6I/VV5MVc14T2R5TpV9VdzgIPHk=
Date: Tue, 19 Dec 2023 08:57:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_qianyu@quicinc.com, quic_krichai@quicinc.com
Subject: Re: [GIT PULL] MHI changes for v6.8
Message-ID: <2023121930-squabble-certainty-60e2@gregkh>
References: <20231218141828.GB2900@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218141828.GB2900@thinkpad>

On Mon, Dec 18, 2023 at 07:48:28PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.8

Pulled and pushed out, thanks.

greg k-h
