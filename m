Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC09432E8D;
	Sat, 26 Sep 2026 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422840; cv=none; b=MwrgR/xIqmipquHIkm2drsK/KfohnOYYjfb/IE6QM2sktdBKsxyTZdTBsO6RiBUb3OR3vgaPo7rL9kTX02PDToEmkWx1+FcCuKOfg1FvkMHB++sRwGeSI5y2/pm5m7pVguIwEmkHVRiKy9qY0l37TKZR2eKnSqMeMO5Jo6qn6Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422840; c=relaxed/simple;
	bh=8EztpSR1L01ZTNEwTyN99C9ueDekQxeiceFVcpE0qoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HGvq45B0xMzqqmXG0yq6b1cop8uurZXQJ5p5lrvBqTL4isIg8hWObBcxubNr6Z4NMS10JqlWngT6fdkurWSh/PjA4HP0MkWQW8p/xVqr7wn2Q0xWpJ5l8JrFW/PgkFEyW75vjwI4SDG4s9VyyAO6VuvyAg0hqD9BeKM9lUw1yl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDvhCEJR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDvhCEJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8885F1F000FF;
	Sat, 26 Sep 2026 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790422838;
	bh=ciBGodcOyyvkBbQniOyLhriYdUibRkbbJ7JmEsVptY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jDvhCEJR3s6fQaUNDjXN0VRJs/dWfsKoyVU+I/BLn+ofzCeUkTjMVrh5QbbHM+xgd
	 MYUaHQC255DpWxrNBT9QznbFCCZW2UgdfwxQkG7F1ozs6ZrGWBxy48DlMz+6CZiwzL
	 EE3d+ReNI0GFEcQvba/BLaBKRlkaplI6wjx3vtKFxwiSCuvMgWn8kUf1dY75e/3ktW
	 malk8xBProHxLTr+HAKyOyuZtWopnv5d7mKHvbcHewGUw/SPXUm0gsYqnHGiUoU7d6
	 BQA0i/ks0PlCOHJ8Xexn/7lqW+YrvWSw7Zs2H8qjmzqlmA0iP6w8hA0Jne4uy5F6I+
	 6Mt8UE0SxECUA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925-mhi_dun-v1-1-65bc07ec8a59@oss.qualcomm.com>
References: <20260925-mhi_dun-v1-1-65bc07ec8a59@oss.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add DUN channel
 configuration
Message-Id: <179042283615.240653.16108919722704433637.b4-ty@b4>
Date: Sat, 26 Sep 2026 13:40:36 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Fri, 25 Sep 2026 10:07:43 +0530, Krishna Chaitanya Chundru wrote:
> Add the DUN uplink (ch32) and downlink (ch33) channel definitions to
> the Qualcomm modem MHI channel configuration table.
> 
> These channels are used for transporting AT commands over MHI.
> Defining them allows the MHI core to create the corresponding DUN MHI
> devices and enables userspace access to the modem AT interface through
> the associated client driver.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add DUN channel configuration
      commit: 710bf7329abf86e37db529f19c8f394099238892

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


