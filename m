Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9326A25913
	for <mhi@lists.linux.dev>; Thu,  3 Aug 2023 18:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EC9C433C8;
	Thu,  3 Aug 2023 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691087489;
	bh=mkGPjy+loIDmO8JmcO7/O86tOi7CGEUCjA4ltV55Hfs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Zgw6ELPJCZc7fbnwSBRJTI6ShjVQ9Hmtk1FN8xIh3E5JaSyTFDA1FkJ11SM9swqAy
	 wW86a77DkN81aTI3TMl9kNwhEcrSJuQkGZb2JnyBvTLWxNb/hdoOYYVEr7FA44ytfm
	 I3sQtwdK2x9DNbCI3m4GxoAjHJNf/oi39PKoRGANUkGNxKSqkw07qNpCe+e+1cIftG
	 xpbzz3L+8YX4YI2YQjUCvByBmTglM94V6sO/p5EMnJmRns+PjDLg7/34RUY/eT3jaH
	 R7B2mM54KguC06mgTcZ0e5AyQPqNe+7n709NEknyo5+vsrv2dHkBHWWxbpRhpfHSwL
	 EyBuvoNmTe75A==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bus: mhi: host: allow MHI client drivers to
 provide the firmware via a pointer
References: <20230727100430.3603551-1-kvalo@kernel.org>
	<20230727100430.3603551-2-kvalo@kernel.org>
	<20230802110110.GD57374@thinkpad>
Date: Thu, 03 Aug 2023 21:31:51 +0300
In-Reply-To: <20230802110110.GD57374@thinkpad> (Manivannan Sadhasivam's
	message of "Wed, 2 Aug 2023 16:31:10 +0530")
Message-ID: <877cqcyo2w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Manivannan Sadhasivam <mani@kernel.org> writes:

> On Thu, Jul 27, 2023 at 01:04:28PM +0300, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> Currently MHI loads the firmware image from the path provided by client
>> devices. ath11k needs to support firmware image embedded along with meta data
>> (named as firmware-2.bin). So allow the client driver to request the firmware
>> file from user space on it's own and provide the firmware image data and size
>> to MHI via a pointer struct mhi_controller::fw_data.
>> 
>> This is an optional feature, if fw_data is NULL MHI load the firmware using the
>> name from struct mhi_controller::fw_image string as before.
>> 
>> Tested with ath11k and WCN6855 hw2.0.
>> 
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>
> I can apply this for 6.6 and then you can merge ath11k changes for
> 6.7.

Yeah, to keep things simple please apply patch 1 for v6.6. Then I'll
apply patches 2-3 for v6.7 (after fixing Jeff's findings).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
