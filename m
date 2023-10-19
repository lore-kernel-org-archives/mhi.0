Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D3DDA6
	for <mhi@lists.linux.dev>; Thu, 19 Oct 2023 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ng7B2wwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0A6C433C8;
	Thu, 19 Oct 2023 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697722044;
	bh=lPXHENQXTgIKjA0QHMUHzGz9n4glR1pHgOhWvBoM1O0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ng7B2wwUV/nxvj2UxMpPsYWeR4gRJEEuMfWTxub09U/tW07tOJMeTTCRPCbliAjNp
	 ieqyAN8rVYjp4eut1wl+3mR4umLiMyGBEF6mUutinwr4Jz9rYIirGGRWZfypBfPpFx
	 R8YBsYjswTmD6iRAY4g9HlW1SCLrpORHsbviDILt3huL0uh2Mppgq8NklUfWpjfGzG
	 ZOSIxTRBN74Q/c9R7FKiBsP16C23K1WoyK77ARcY2h+y7qn+aDxQjUPFpT1WSDfk+J
	 NANbf1PUglVcD7uFbwp3nEG+kaMxzuesWcMtefpp89d+yAkSdM+fQ0R0w9pEPOkOiX
	 I65a6Ru3YgJxg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <mhi@lists.linux.dev>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] wifi: ath11k: add firmware-2.bin support
References: <20230727100430.3603551-1-kvalo@kernel.org>
	<20230727100430.3603551-4-kvalo@kernel.org>
	<563e8d01-beba-bff2-54e0-7629c462add0@quicinc.com>
Date: Thu, 19 Oct 2023 16:27:21 +0300
In-Reply-To: <563e8d01-beba-bff2-54e0-7629c462add0@quicinc.com> (Jeff
	Johnson's message of "Thu, 27 Jul 2023 10:12:27 -0700")
Message-ID: <87leby2152.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 7/27/2023 3:04 AM, Kalle Valo wrote:
>
>> From: Anilkumar Kolli <quic_akolli@quicinc.com>
>> Firmware IE containers can dynamically provide various information
>> what firmware supports. Also it can embed more than one image so
>> updating firmware is easy, user just needs to update one file in
>> /lib/firmware/.
>> The firmware API 2 or higher will use the IE container format, the
>> current API 1 will not use the new format but it still is supported
>> for some time. Firmware API 2 files are named as firmware-2.bin
>> (which contains both amss.bin and m3.bin images) and API 1 files are
>> amss.bin and m3.bin.
>> Currently ath11k PCI driver provides firmware binary (amss.bin) path
>> to
>> MHI driver, MHI driver reads firmware from filesystem and boots it. Add
>> provision to read firmware files from ath11k driver and provide the amss.bin
>> firmware data and size to MHI using a pointer.
>> Currently enum ath11k_fw_features is empty, the patches adding
>> features will
>> add the flags.
>> With AHB devices there's no amss.bin or m3.bin, so no changes in how
>> AHB
>> firmware files are used. But AHB devices can use future additions to the meta
>> data, for example in enum ath11k_fw_features.
>> Tested-on: WCN6855 hw2.0 PCI
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
>> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>
>> Co-developed-by: Kalle Valo <quic_kvalo@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

>> diff --git a/drivers/net/wireless/ath/ath11k/fw.c
>> b/drivers/net/wireless/ath/ath11k/fw.c
>> new file mode 100644
>> index 000000000000..5423c0be63fa
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath11k/fw.c
>> @@ -0,0 +1,157 @@
>> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>> +/*
>> + * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
>
> should the year be updated?
> same question applies to the .h file

I added 2023 to both files.

>> +		case ATH11K_FW_IE_M3_IMAGE:
>> +			ath11k_dbg(ab, ATH11K_DBG_BOOT,
>> +				   "found m3 image ie (%zd B)\n",
>> +				   ie_len);
>> +
>> +			ab->fw.m3_data = data;
>> +			ab->fw.m3_len = ie_len;
>> +			break;
>> +		default:
>> +			ath11k_warn(ab, "Unknown FW IE: %u\n", ie_id);
>> +			break;
>> +		}
>> +
>> +		/* jump over the padding */
>> +		ie_len = ALIGN(ie_len, 4);
>> +
>> +		len -= ie_len;
>> +		data += ie_len;
>
> is this always safe?
>
> can we have a case where the original ie_len was <= len but the
> aligned ie_len is > len, and hence this will lead to an integer
> underflow of len (becoming a large unsigned value) and we'll continue
> looping with a buffer overread?

A very good point, this isn't safe. I fixed it like this:

		/* jump over the padding */
		ie_len = ALIGN(ie_len, 4);

		/* make sure there's space for padding */
		if (ie_len > len)
			break;

		len -= ie_len;
		data += ie_len;

Does that look correct?

> the same question applies to the code where the magic is checked & skipped

Indeed, I fixed that like this:

	/* jump over the padding */
	magic_len = ALIGN(magic_len, 4);

	/* make sure there's space for padding */
	if (magic_len > len) {
		ath11k_err(ab, "No space for padding after magic\n");
		ret = -EINVAL;
		goto err;
	}

	len -= magic_len;
	data += magic_len;

Here's the updated commit in pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=96e0d3887f65eaac7745ff9da7c89f0c59bb347d

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
