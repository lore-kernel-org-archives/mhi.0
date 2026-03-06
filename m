Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7148375F96;
	Fri,  6 Mar 2026 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782989; cv=none; b=qrbEEiANuPsLc9fFUyWPqFpDNcw9apolNN3K/hV1jeWq1kyZxXu8mJAFw69V+n7PkaZpobdcfVbC79ngmsyGxy1sdRgrkzDN5Grcz8PweUuLKpZmMB40iOuKf0SJJ0JdO2m4Lw2464LHxeg5KkLlh9pDEjtRriMM1yiRXXETxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782989; c=relaxed/simple;
	bh=yWhMxQCi4S4VYAmWyXvM6CWmIG51FJKeHCKDvgC7Q94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlNhOBCbov3mgXoj2rhazBEYA1visE0zg5lOvO214O962Y6bkTuxc6yb8ypnPB4Rt5CiGUfrbgD91plglyPBfDwWI2uKKceDmQgGFKVPwwZoPkcFQ2iW02GiRF4lNf9rN0CLuiQXZmScdg9YgPh9n8FRDxVdLLZWUscjTSbb/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0EjM5fm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0EjM5fm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F952C4CEF7;
	Fri,  6 Mar 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772782988;
	bh=yWhMxQCi4S4VYAmWyXvM6CWmIG51FJKeHCKDvgC7Q94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0EjM5fmYxvo/Lt/wgXfh8B+MU4O/qjcQOIqLjUMOEwj6kmK8yzlF+ZXOS3wjPKox
	 gLdOtSW26YNuv9gJkb1sSvzwiiKnKoSH4uLZlyRx8P31tLJCsRwb5bB66tvHuFZC5i
	 WrArfH0UtHAtarYag7xjN0UhkBVL/zUIb/oFqY2psxB7xrb7riG155Rwx5giwxVXeb
	 ByoboaogFoCBp2dBuJ1OWpe9Po0W1dnrjpS85+KeHPdnljhLJV62450IsXDMQXiss6
	 zaLDrSvR3iPh+W/CKcZeq8jL8uaHqqtY3jEhrdhfiWi73Qheybumde+5fG3Ej3ZgdB
	 lIvTZfNxlJgAg==
Date: Fri, 6 Mar 2026 13:12:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, 
	Hemant Kumar <hemantk@codeaurora.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] bus: mhi: host: pci_generic: Add
 pm_runtime_forbid() in remove callback
Message-ID: <3wjtmsjf6yxuhbtwjlg3tyxqfs4bjdktb4koxvdx26ljfxuwnu@3zvmme3palbi>
References: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
 <20260303-b4-async_power_on-v2-2-d3db81eb457d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303-b4-async_power_on-v2-2-d3db81eb457d@oss.qualcomm.com>

On Tue, Mar 03, 2026 at 01:02:14AM -0800, Qiang Yu wrote:
> Add pm_runtime_forbid() to balance the pm_runtime_allow() call made
> during probe. Without this, the device remains in runtime PM allowed
> state after driver removal.
> 
> Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0395a8ea52b0e874209ca56cd20ed04419038cdb..b6b21d0f3388d61b771062b8077f836a6bf8f9f8 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1459,6 +1459,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  		mhi_soc_reset(mhi_cntrl);
>  
>  	mhi_unregister_controller(mhi_cntrl);
> +	pm_runtime_forbid(&pdev->dev);

I moved this to the start of mhi_pci_remove() while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
