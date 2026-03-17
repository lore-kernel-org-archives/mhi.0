Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F23A4F3A;
	Tue, 17 Mar 2026 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741993; cv=none; b=RafwC0EqmbtW5GMAe+4BtJfZUkUUWUwFNNv7Yao+xttc4j3YiSGyD2BnaV+hcMAd/tGEkEel5E638fxfpSviR90dyoJT37OANLbY8r3I6YG2SVmwGBMtH2LRzw1hgGqCGtVIuVRwukWqDiYTcpUqr4U8uT+syEE72vNqTo/zVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741993; c=relaxed/simple;
	bh=/HKzhj6Ku4QQ9DLoTf/nVyyf1fTcpvHT4AyjQTdLt9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB/Rru/o8xPsn/B+BeGgVZKCdbem/oI/wndGJ3E5N3VwSRaPLIhLV09p7Ji62RK/upgNTiljJKvk5FvJCxLiGCOGklumnbzw/X2A+g7uCPoqoYHM57Ef19jXI/cfHsvEH5kLLkzUUz2AdrLrUbNHxnWT5IBPS2kWRclZmCUavZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVcjCy2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVcjCy2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1270C4CEF7;
	Tue, 17 Mar 2026 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773741992;
	bh=/HKzhj6Ku4QQ9DLoTf/nVyyf1fTcpvHT4AyjQTdLt9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVcjCy2xGKxtkhEhxT+kPu+/2ZDw1iHuYBgKzWl8qzN8BmlcwfIreqd1nR8MXN+LF
	 ZAQRMaolumiW2GxI6dSG0IP7oR7nsd4GXDkQsg2BkhLwG4hx6mgxvOlzwHNKRXlDmw
	 0TTGMQK7tsxJRxWr9RJOSOEP61Rni3yAC/uDqL264jvf+eLZugGt/yCHxUdj56JWBs
	 i3cSCYMsQs2XGPpvU63aqVYNcvpELUY7V/u5hft8gvf60uaB4Eym12yQGjPhIZWn1E
	 DirxRaH7mTVOHWbVM8ONJe8vETJeJxsYWy/Wr9InVfwMnATb171JnRaXMhbJdBl3R2
	 9ctsVduIt61Xw==
Date: Tue, 17 Mar 2026 15:36:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Rosen Penev <rosenp@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: fix invalid free of BHI/BHIe buffers
Message-ID: <nsohj3gsmiwsua7f4ukkcoks55gyejltbix2rspgmjl5vcgoqk@v56w6dwudqz2>
References: <20260317-mhi-invalid-free-mhi-buffers-v1-1-8418a3ad604f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317-mhi-invalid-free-mhi-buffers-v1-1-8418a3ad604f@oss.qualcomm.com>

On Tue, Mar 17, 2026 at 02:12:46PM +0800, Baochen Qiang wrote:
> Commit [1] converted mhi_buffer into a flexible array embedded in
> image_info by switching to kzalloc_flex(). As a result, mhi_buffer is no
> longer a standalone allocation and must not be freed independently. While
> the error path was updated accordingly, the normal teardown path still
> explicitly frees mhi_buffer, leading to an invalid kfree() and the
> following warning:
> 
> BUG kmalloc-64 (Tainted: G        W          ): Invalid object pointer 0xffff8b05dfb91c50
> Slab 0xffffd490857ee400 objects=32 used=22 fp=0xffff8b05dfb90b40 flags=0x200000000000240(workingset|head|node=0|zone=2)
> WARNING: mm/slub.c:1227 at __slab_err+0x37/0x40, CPU#2: kworker/u113:0/205
> Call Trace:
>  slab_err
>  free_to_partial_list
>  __slab_free
>  kfree
>  mhi_fw_load_handler
>  mhi_pm_st_worker
> 
> Remove the explicit free of mhi_buffer so that the memory is released
> together with its parent image_info allocation.
> 
> Fixes: 2f5ae4827e94 ("bus: mhi: host: Use kzalloc_flex") # [1]
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Squashed with the offending commit, thanks!

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e1d77cecd75e..19c84913cfb9 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -308,7 +308,6 @@ static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
>  	struct mhi_buf *mhi_buf = image_info->mhi_buf;
>  
>  	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len, mhi_buf->buf, mhi_buf->dma_addr);
> -	kfree(image_info->mhi_buf);
>  	kfree(image_info);
>  }
>  
> @@ -322,7 +321,6 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>  		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>  				  mhi_buf->buf, mhi_buf->dma_addr);
>  
> -	kfree(image_info->mhi_buf);
>  	kfree(image_info);
>  }
>  
> 
> ---
> base-commit: 702847e8cfd51856836a282db2073defd7cfd80c
> change-id: 20260317-mhi-invalid-free-mhi-buffers-ba490b94969e
> 
> Best regards,
> -- 
> Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
