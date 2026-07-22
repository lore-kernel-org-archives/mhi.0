Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C210425CF5;
	Wed, 22 Jul 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714080; cv=none; b=iExvCusVY1PpLXpE1Soz6E0nz2Nfh6COXZ+DvbKUesXR1XRZuyGuZ2CxPxNjdKlJqzfZ44gKtLzL7D5kpVv+Th3SNM3Z0/0dwOQ0wgD5yytCgg/R67Yy5ON2Xt6PYJMb+jAqP0Y/PmjII9/bA9wz4IBA/Ew7/XYTYDoboIdiLKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714080; c=relaxed/simple;
	bh=I1pVuYacF0uWU5Q14tlwRw1QKa7zSxvZegULKBKMM+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QycqukTa7qd9YipMUX0HfBjafZfLT1dVz6xfsM437y/ucU+TRj1iTvF/i/AUxdGI36Tk/A6BEYQBHAQQ6jm1o7vcRqKiuKCd5usXpm6G0pChAKqQCqDOKawflzJV5YGMCM7rXkScgHrncfVFCrbyJM1TrXcDZMK1BXMLlhnPtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F43B1F00A3D;
	Wed, 22 Jul 2026 09:54:35 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260626034633.23112-1-slark_xiao@163.com>
References: <20260626034633.23112-1-slark_xiao@163.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Add SAHARA channel support for
 Foxconn products
Message-Id: <178471407575.138110.7031977488075125143.b4-ty@b4>
Date: Wed, 22 Jul 2026 11:54:35 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Fri, 26 Jun 2026 11:46:33 +0800, Slark Xiao wrote:
> Since we have such a requirement for capturing ram dump for PCIe
> WWAN devices, we shall enable this channel.
> Currently this change shall be applied with QC original uci driver
> which was not upstreamed. And I also found someone try to upstream
> similar SAHRA uci client. Maybe this would be help for us as well.
> 
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: pci_generic: Add SAHARA channel support for Foxconn products
      commit: 676f19e77366e1ef9bc021bcea26348fe7cb078f

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


