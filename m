Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93351FA4
	for <mhi@lists.linux.dev>; Thu, 12 Jan 2023 10:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417AAC433F1;
	Thu, 12 Jan 2023 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673517661;
	bh=X/6wDyJfkR+Rkx2GS/MEk/jAVjiUJBuLmL+K4Sb+buQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7Vb/iE9EyamXPacyuG9jkVOYV+7pu76AR7g+CKhWjmfDHsr/adehyZyXM+7E6cVS
	 EN3zyTJzc7zrFQgLdupkFooqGgafQNYStUW53dFLUQusfmh/PkWM/L7bofk4+aGX+M
	 Ap5YMNnneNWRNEJmlknnnk2obORlQAtBD8DYyynpicqCbuuWj4ab7yGnsk+k6/AVD0
	 bDql8s2FxZ0oE9ApS+MdmvGO6G9fNm1//frJd3mDREjvKZeoPrucsCGrrhw3kBwIat
	 zFwHSWmDKEc7viWjyd8Nr6c6op6h6jZk6xzfniHDwp+sQwsDc8cUCBxS8rYb9OQQEY
	 gs6jrJ/nwRBxw==
Date: Thu, 12 Jan 2023 15:30:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Update mhi driver description
Message-ID: <20230112100049.GB4782@thinkpad>
References: <20221229011358.15874-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229011358.15874-1-slark_xiao@163.com>

On Thu, Dec 29, 2022 at 09:13:58AM +0800, Slark Xiao wrote:
> This should be a mistake. MHI contains "Host Interface"
> already. So we shall update "MHI" to "Modem" and the full
> name shall be "Modem Host Interface".
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index bf672de35131..7307335c4fd1 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1449,4 +1449,4 @@ postcore_initcall(mhi_init);
>  module_exit(mhi_exit);
>  
>  MODULE_LICENSE("GPL v2");
> -MODULE_DESCRIPTION("MHI Host Interface");
> +MODULE_DESCRIPTION("Modem Host Interface");
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்
