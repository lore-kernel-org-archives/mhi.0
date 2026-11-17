Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884916;
	b=mqZv2Ue9KkU/cww4/N9ZZaqXELqavX7Sjq4kTMFkfiAmyfLvazcGWb9Dz2Yo8ooxRxzj
	 aKEiXQai4+bFA1uQjRhsNdGvnXNi3e43823ziblVkTn8t/H0geT+Gcqkcf2BPdudh2Jnp
	 y0s+Khd2QW5LtsAyJKbpvvTNRAZPCzL46taN7P+38JD0rDLRmxbHguc4jPv7mYMH3Wswg
	 sAaK/ryGdn+AsjHnoOjN0YH+pDNavn3d31AKLpvN8kBrmOdAfo2asPqZNPoI1oSw59Qhh
	 vOzQuUqdoJ4JOiSdv4/h7KlERbiJRlJNcP6sO1br/VsQiyQl7XEFlTuNgX9+qRLGsPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
	b=oR3W+7QWiHyBIh+PfwKFwh/C2kcdESE0uYe4UhQHiBjuBe/azQ9rUPZXRGHQMmk8ileb
	 43H7hLbom93ZnZYrA5VufL+hBvKWZ+/8shGhzBWS33CjPgWYpTSQ3G6c3A7hbKxtxPRMW
	 2F6aioJ2rX9bGG1iUsmo8tOpkRh2w+K/eAslQ/hrvUstrPzvzlBkQUjS3NqskzTiCXFMC
	 SC/jKB5dMagLwpe4oF/9bOnc8EjfHfBKNKzh0Xt9qVpfK6D6SKELUdFWsmVoqKpEGgbjg
	 nynMlYp1jE48gg2+ObV7p1rGYpNFjX5zqU+XaXjDxwF+PejhzLFy0SV7NIA2ul5ylWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yzgp351Z;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D2606A31C
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 03:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yzgp351Z
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-949664ee41cso292226885a.3
        for <mhi@lists.linux.dev>; Mon, 16 Nov 2026 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884915; x=1795489715; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
        b=Yzgp351ZTs9ia0jm7rsSbINPBsUbjZ0tcff17DlmFC6E6pq/GS60gCzwD49Txe1nWk
         bQfY352Y5THrp/R4sKftPXSYgCOAVCqn69LGP/IcOhHkyE5KmHtvirirgVsuSMSj3itP
         JfJ+P3HtnqKSd2dmPN/UNnftTTT44CzDbVLp+xbcihxjusLi8RbGTlOlZBwPWJVtVzHo
         9b2LTd7OPGRhk0PiM1U2G3qoTCRTuLiMLvEzzNYI9PLTrFwfBrQg8gb10NImbiZq7Nk5
         WZ5Lwbfc1+Ynn4D1al7mnJWOkgk/QHtBNICPQ83L0E6c3vQOrA6gGgE7efK44xT96Zjk
         gWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884915; x=1795489715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
        b=rLeIrK8aKvkuB643GiIYllnzrYlHxWhaCxeNXtLWEoTNa81ClT7gZbwCZ8Hw9HClqO
         mBxh6fJVolL997utLLqOS2ls7gdJrNJ1lvZj028V0Gduno7YSC61UbHe9ooLD629n771
         /q6tRGgjUfAGAQJwP2wtVSRE12yXDCzmp/tofZL6wnh/s1A2cuzfx+SAPInbFNfVHc5F
         RDTDSwfFX58xeD2pxbyu9p5EzTJ7XXzGKd1lKdXD1d4Xe2u5RolrJrgnOeyFcApmq0k7
         dSgGvRcTceJXNL5MmwdvK7teg5Koei1BKICOIC+OSWnBALW4VLRLZ2z3Jj9WW0+LaprL
         QXeg==
X-Gm-Message-State: APuU4Z8pGngMMi+cXEltRIpqXgEQK5ZptyzZkAXU6OobA+L7KqNJ0NM8
	a9KyZpBZUT7CtcaIRKwwGhF/NAmq8kjmhhmRInsQps8wogEWmUt3y5jR7aWcD24mG08=
X-Gm-Gg: AYBFou26h3t6jC4h2s7slGbs1KSPl/GeM1FOFOD6AW2QagEm/NQ/K6g3Y5iOy37tl4G
	CHfI1S3hrUqi9rzJPvJJ8d1Z0S8Gl95GtWrnTu1w7tD1xop/IYYQrLPUBeBrbIQCvBZ7COsnIZM
	D9ucLH9Z1cfMmDa4TimlKJwKsKjguCqGcGH/yXmgrL6dZcKqaCJW0strkK3J/WjZIzcJTL4r5Ou
	f8UR+vj1dWg/VM9mS6Uf9QAizKeDkzTVgp3wsP8hh/KSziedV70nYbdxqob1hSZZp76/cEz8aoR
	x2xZYrkLkKYz1SQE7H6V7qWR1F3szd653O2AGjjo0N8a7Gfce8xnAiExDhkX8skYzdk/oJG/wad
	jPSskh3UYODImoL28K8MOLX5NK7Y73NSSsWcK+cc37Mx1JiDjfXXKwsQvewegIALeQLs3zxkTZ0
	T8UEspaKl62OBhHrKtbW/ZCftVzMUjF07Y6M84LYgNbczRfVSVt7Vg9D4pLMcah5Hr1UaX4FweP
	Md1Gfez45t2lXDuLumisC5ppzfUJmXh07sIdiMa4OZyWYWKDMJdvnUW+EjqW/TtKpm/AX/aqNBg
	q38/oO+vqngW+12im58+cIaVqlrdjZhvSP+ggho+A91jG+qcKISUQa+9LE5mTsWzar2XOiLB6Se
	tXcEx8RRG28ycY+/Xky9NNqfYMzbxUDhuGeY+JFG+w9DksB5IGGFX
X-Received: by 2002:a05:620a:2a10:b0:93f:2eaf:64d6 with SMTP id af79cd13be357-9494bb90266mr2006054585a.48.1794884915318;
        Mon, 16 Nov 2026 19:08:35 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803fb4sm981181585a.9.2026.11.16.19.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:08:34 -0800 (PST)
Message-ID: <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Date: Mon, 16 Nov 2026 22:08:34 -0500
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, daleyo@gmail.com,
 Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
 <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/13/26 1:53 PM, Jeff Hugo wrote:
> On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
>> From: Haipeng Lin <jimmie.lin@gmail.com>
[...]>> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
>> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
>> This modem carries the generic subsystem ID, so select an MBIM
>> configuration by machine compatible instead.
> I'd like it if we could query the hardware to determine if it is in this mode as maybe one of these systems has a SDX65 dongle attached where this workaround does not apply.  However, I am failing to identify such a mechanism so what you have proposed seem to be the best solution so far.
> 
> Unless someone identifies a better idea, this seems reasonable given the situation.
> 
> -Jeff

Hi Jeff,

Thank you for your reply. I tried to look for a hardware hint since we
have to select the channel layout before opening a channel (so that
can't be the way to select MBIM, I think). The oem_pk_hash on this SP11
SDX65 is non-zero (12 words) so it could potentially tell this module
apart from a dongle, but using it would mean reading BHI before the
controller is registered plus adding a table of hashes in the driver.

I can try the hash route if preferred. The machine match is simpler
although it wouldn't cover the situation e.g., a SDX65 dongle is attach-
ed via PCIe tunneling/USB4 you mentioned...

Best,
Haipeng

