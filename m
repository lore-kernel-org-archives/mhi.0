Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B0210EA
	for <mhi@lists.linux.dev>; Mon, 13 Nov 2023 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6ijUz7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F321EC433C8;
	Mon, 13 Nov 2023 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884906;
	bh=y1OMZ6z7efDhKj1vsokZwE/dfo0DW7No+kNt4zr/hMA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W6ijUz7t8wqqkvA4nNp8oJE1agaJUXkRQBBsP8k1HL8FXbHJAT7DbjYYosBg2Rj+r
	 wsOed5P5VP1NobrIAd32YKDp77ZwSdWv0qtg1IeBcOy6Est+KeI9qIGxoXkQd+lqSe
	 Rhhy8QboGRBOzxmeVy103L8BEVNmMkEzKw0JeB1ZYXZNrplw3b2jvv7wKlnR5ccr3d
	 l8/CK0E34OOiH57X7Wjz/q/OpLq+a3Z9TP42z27CSnHuculfzcEgTVGyXq6VjKoTVl
	 JtVRKkWMyIFmHqaOYxrGmM3Wz40d3l3vzseWNI1lou0aFZS1u93HDZV6g6ukXYOalr
	 12WXmxxiowGHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <mhi@lists.linux.dev>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
References: <20231110102202.3168243-1-kvalo@kernel.org>
	<20231110102202.3168243-5-kvalo@kernel.org>
	<f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
	<e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
	<818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com>
Date: Mon, 13 Nov 2023 16:15:02 +0200
In-Reply-To: <818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com> (Jeffrey
	Hugo's message of "Sun, 12 Nov 2023 09:15:40 -0700")
Message-ID: <87msvhu4d5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jeffrey Hugo <quic_jhugo@quicinc.com> writes:

> On 11/11/2023 9:24 PM, Baochen Qiang wrote:
>
>> On 11/11/2023 12:54 AM, Jeffrey Hugo wrote:
>>> On 11/10/2023 3:21 AM, Kalle Valo wrote:
>>>> From: Baochen Qiang <quic_bqiang@quicinc.com>
>>>>
>>>> There is no driver to match these two channels, so
>>>> remove them. This fixes warnings from MHI subsystem during suspend:
>>>>
>>>> mhi mhi0_LOOPBACK: 1: Failed to reset channel, still resetting
>>>> mhi mhi0_LOOPBACK: 0: Failed to reset channel, still resetting
>>>
>>> This feels like just masking a real issue.
>>>
>>> If LOOPBACK is not being consumed, then the channel should never go
>>> into the start state.=C2=A0 Why would we be trying to transition to the
>>> reset state then?
>>>
>>> -Jeff
>> That is because, with patch 'bus: mhi: host: add new interfaces to
>> handle MHI channels directly' in this patch set, ath11k is able to
>> call mhi_unprepare_all_from_transfer(), which will reset all
>> channels.
>
> that implementation is flawed if it is causing this.  Looks like you
> never check to see if the channel was prepared in the first place.
>
> If you go fix that, then it looks like this change is not needed.

BTW what do these loopback channels do? I didn't notice any difference
in the functionality so I'm wondering the reason for these.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
