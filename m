Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285B97E
	for <mhi@lists.linux.dev>; Sat,  8 Oct 2022 14:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95E3C433C1;
	Sat,  8 Oct 2022 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665238747;
	bh=ncHqj19PYcdj2VfixeA7NItM3XFWktQFqCuiU1u2USo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oXNaJIWXm0epT/kSfs6h0xHwdXHqJDbFnDwGOxS2w79vPSo9I3zWeLjYZklWjtpz5
	 xmiGKzFsGXSGrK2CP02Tm0Ff0bQh7xC8MCXlskOWAi8C9Q6blQcMjrQWzBZOpAASGP
	 ZsH2CNIXqWjkc6XJ6r/MyQMsO4VNvz4x58iCXCjLYC8L93121lzdp0xnSzaYPFnF6u
	 JjwhDMIvAZDEorjqfAM27zw/KobYueP4mjtGT8mPMOdWRmSdfIBLYWrhh0pMy+83t+
	 I6jZMCArMzQg9VLpmiV/DrnuGgOEaG8nhD2es3phP0YKticvK+CVoVe2EHnAPXuLDM
	 X0LcHgUbJ6M/g==
From: Kalle Valo <kvalo@kernel.org>
To: notsyncing <song.fc@gmail.com>
Cc: mhi@lists.linux.dev,  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Hemant Kumar <quic_hemantk@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add HP variant of T99W175
References: <CALL0vWGr0i9Qaf6PYH3V7C5wbV36wSWUSOWKL83uECY9iN+8JA@mail.gmail.com>
Date: Sat, 08 Oct 2022 17:19:03 +0300
In-Reply-To: <CALL0vWGr0i9Qaf6PYH3V7C5wbV36wSWUSOWKL83uECY9iN+8JA@mail.gmail.com>
	(notsyncing's message of "Thu, 29 Sep 2022 22:01:11 +0800")
Message-ID: <87y1tq4cvc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

notsyncing <song.fc@gmail.com> writes:

> The foxconn T99W175 has an HP variant, so add support for it to the
> pci_generic driver.
>
> Signed-off-by: Song Fuchang <song.fc@gmail.com>

Your name in the From header is wrong:

From: notsyncing <song.fc@gmail.com>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
