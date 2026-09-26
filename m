Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71323F1653;
	Sat, 26 Sep 2026 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418766; cv=none; b=WRppiKVAIxRc8A6y+BfVyR0N3km8oPD5zyHOAUr81v98gxgcGCVjJtGTOW5mUixITv7X9HjXZIFZttez3SCmBtKo4SXGrt70yy7xCiAdeqYrmISj+Jq8F/La1p86EZWBa8mI8y9M4LqKpNDInq+2UnfIJV3+t10kbztwYzcUcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418766; c=relaxed/simple;
	bh=0Af+lO1PY/hMi9UzwHmxeUjlmuWbB+P2pVUs21R74h8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ozAqJkVliOCNS00VX7w9xiL4k4eBObE2CUGi9UTZioCamkskh2siW5kCtg2tsyelPOi0AWsIYtnXxMIfWZdDKoEuKq3SLBncCAq67s4qcd+rMgbyHTNnghOS38H03T5Hf056WWIQPX/t0oz80Xmd7wpQukWIlqkjh00vafQ8KLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSLOs/1T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSLOs/1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BF01F000FF;
	Sat, 26 Sep 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418757;
	bh=diLoGwVBgIth8Bmlw4XGW9CDkoRTk/hU3P3mtADq9m8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iSLOs/1TC9rnd62NeG6XoU142EnY+HJJYDQSsFUEVa1bs5RHJSo+YJV+dB0KLA8ip
	 R1Oh1cnp74MBQZ2HjRjky354fDyHYAAwKMYBerMnV/9CbRPjOYvRAEuUxX2n/+sorf
	 8pr0cwL/8oE1z7mSrnhf4nUGosf4RXRO2//rJDwRtObz5uXiSDNuFSeCbRsWs2wtqf
	 wj1wrorHUVpTFSNFeM3DgJPZ9nhdmlC7hHc5kfgcgw2S5GeGkrczfSPJS9hs9JRpUl
	 mi6Q0SZLJYfX2vbTzbPhbpuZJ0WwcUOe//ZB/wl2YYTiJCwGrZTYXUQk5qtCpApu43
	 Z5LBaFoRlRKtQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260918103236.LFOXxRKS@linutronix.de>
References: <20260918103236.LFOXxRKS@linutronix.de>
Subject: Re: [PATCH] bus: mhi: Use %p for pointer formatting
Message-Id: <179041875572.233961.16133382591873146421.b4-ty@b4>
Date: Sat, 26 Sep 2026 12:32:35 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Fri, 18 Sep 2026 12:32:36 +0200, Sebastian Andrzej Siewior wrote:
> Since commit ad67b74d2469d ("printk: hash addresses printed with %p")
> pointers are hashed by default and the behaviour can be controller by
> `hash_pointers' boot argument.
> Removing %pK makes it possible to remove its handling from the library.
> The pointers are still hashed so there is no address leak. The policy on
> %p is to not introduce new ones.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: Use %p for pointer formatting
      commit: ba9eee2d6f7926ca665d94bd4b8b8c962dec37eb

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


