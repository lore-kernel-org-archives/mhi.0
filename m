Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98A3C0C
	for <mhi@lists.linux.dev>; Tue,  8 Apr 2025 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108068; cv=none; b=Silz4y0b9BNC5xQV0AfLtnlwS3jSSXex/gOL3SJB/KtlTXufxxZkT7nLNmMxhf+HJE99nOXnSOF52pEaccrQe9TRJPnUu+bun5wqk9/FRdTz6fJPHUk9JwmK/7iAJSnghnrkW8RP7uydaoaDHKsplkuhs4ksNt9qTVRCoBdKsmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108068; c=relaxed/simple;
	bh=55pQGynFM4wtuXYkI645m3WSHyqcML9JlbuwZDktbQo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NwYozSE2XbCabFz1FnbJ89IWsdW9xiaaMmP6NXEgG6qGPEnc6LgzdX5hk5zC3+9OWGUHJnehvY3J/2yeStpl2nZtdiwp5EjUO+Hv/IKdbpt5zVX1i0B5JBkF16Elrh4nqqCizzM2DToVnIlmYsWwzgg+1Bv1O/JvwUa2So//T1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2YsHPBA; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2YsHPBA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so5014808a12.1
        for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744108065; x=1744712865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jGiyWeDa8kC0ZVxGs+nfc1I9cal+4HHVVTISi0JKBxI=;
        b=e2YsHPBA3q2TrCFSngMwasY55UngUYZ0au4J5sqBN1GA8OE9qi2BKAuyWrWz/9efpf
         y6q6LYRGRmKYw7/ZiOtjLY2ivA8dYePiOoxT5peRrvOiJXyuyKxQuGIyJpbAXFoFkcBa
         3nxtqMLnJHJ7UJaUakZPbOIEtJr2Mo8Yh/sdfR88QW1EWKyA73Wv0ayzOx/ylCMdG3mG
         UKP9D1XyU5xBks3dXvwg52D0AL04ZfmZTIhWULD6190wdzviJq4OfQfVE4peIQusV5KT
         BKtWzBfXEhdM8HH96p60y9eCijGyrl4Yudz+GEi5Or/gfp83Z4EJzIUsFM1YVa17DosG
         xGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108065; x=1744712865;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGiyWeDa8kC0ZVxGs+nfc1I9cal+4HHVVTISi0JKBxI=;
        b=LCHFB9SjKHruCUt9JTjBSZ9tsMHYh+1zGpoE9SuCSJbF9wIgJPa5PXFME7KzqAAEZo
         LJF2PeyAfmjwecu+gUq761w5IB5OgELIqGyg1mYDRfSnZeIbA0NtTZBZXfIVW8QbtSYv
         hYFnOdm0YmvNrHxd9kngpPqgnxYfrE4Rh2Cep8DDUIYwx+bKhrI+eKckCa7yM7AzFLnY
         8SSR/K8Qv47mkctfPhxdWRGBzCLK4BYf3HbolkZ50D7bWy8Me0sebuq1s0rMOJuxgDzy
         prXl7xgj+yWE8oB+MqzoOUsbnBf3YFthcWleMzzOkfpKRFzRYra4WgQuNpaC5DGRSrBj
         w6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXtaPGwA3bxv8OwzuC9o7njnaEJ59iAnW3hJ42l0SQb88Qmc7lR+PWNxsjaP2vN1KwX1D8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnnclE1VwN2OsIR7bXXhH6VKVtWrFdoo8x0ejKc9pYQrOo8OeL
	NWkEl7Kdfq+X8d2X9IhbMMNHheRJhMzTr+dnX9vDhqz0RmW6mk+G
X-Gm-Gg: ASbGncv0WToNepHEWImpuMMvCe+SoONzlByaXA37cerbJmmb0lv6OeaiZjekGWoca/Y
	YDOUhBOEA0SSQ+gtNUazvy1H3UFq60WmoAuSrtv33QSh56KxuG+WKOf0vsgfRF8oo2EGcrNc4Ds
	wQGA1h7kn/YanaLvnhC7ErmZHFzYChCdahiOLJemwFJGwqiobK0QjXwzewSsiLZ3IEPNDxVw8xF
	X+iNs9Y/Y43hFhkZ5UCQ5bSp+YoXdCe7GqM/rXN14O3EbVYAd5UPbJ/za2jNjHtkWpxCyknZXn4
	xHDEoFZYViDXqT1x2T9jrAA9BpnDX1gzsTFN07e9uFsf/NRXTGmGZbt1Tgak3hlZe4SkAo5vF6c
	FQrsQO54squJFAjU=
X-Google-Smtp-Source: AGHT+IFNQPp+qYWbfZqtkO0DEQ4a/+aygcjR+F/2tuyTVx3+WT3NZI9Vjq8T/3P5ANkJJknNFqN8tQ==
X-Received: by 2002:a05:6402:3483:b0:5e0:8a34:3b5c with SMTP id 4fb4d7f45d1cf-5f1dc4abc3cmr2630481a12.0.1744108065220;
        Tue, 08 Apr 2025 03:27:45 -0700 (PDT)
Received: from [127.0.0.1] (217-175-223-214.dyn-pool.spidernet.net. [217.175.223.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a476bsm8016752a12.72.2025.04.08.03.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:27:44 -0700 (PDT)
Date: Tue, 08 Apr 2025 13:26:38 +0300
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Muhammad Nuzaihan <zaihan@unrealasia.net>
CC: Slark Xiao <slark_xiao@163.com>, Loic Poulain <loic.poulain@linaro.org>,
 manivannan.sadhasivam@linaro.org, netdev@vger.kernel.org,
 Qiang Yu <quic_qianyu@quicinc.com>, johan@kernel.org, mhi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: GNSS support for Qualcomm PCIe modem device
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFEp6-2_+25Z+2nPOQtOzJPgfJM8DAs2h_e6HTQ4fAVLt0+bwQ@mail.gmail.com>
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com> <DBU4US.LSH9IZJH4Q933@unrealasia.net> <W6W4US.MQDIW3EU4I8R2@unrealasia.net> <f0798724-d5dd-498b-89be-7d7521ac4930@gmail.com> <CACNYkD6skGNsR-AH=6TWeXLqXeyCut=HGJeWUadw198Ha3to1g@mail.gmail.com> <CAFEp6-2_+25Z+2nPOQtOzJPgfJM8DAs2h_e6HTQ4fAVLt0+bwQ@mail.gmail.com>
Message-ID: <BB06D58C-E27D-42FA-8043-AE767E9B5E91@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 8, 2025 12:13:17 PM GMT+03:00, Loic Poulain <loic=2Epoulain@oss=2E=
qualcomm=2Ecom> wrote:
>Hi Zhaihan, Sergey=2E
>
>On Fri, Apr 4, 2025 at 7:42=E2=80=AFAM Muhammad Nuzaihan <zaihan@unrealas=
ia=2Enet> wrote:
>>
>> Hi Sergey, Slark,
>>
>> Using wwan subsystem and it works without issues, maybe i might miss
>> something, perhaps the flow control but i never have any problems even
>> without flow control=2E
>>
>> I am using gpsd + cgps and xgps with a small modification to Linux
>> kernel's wwan subsystem in the kernel to get NMEA data=2E
>>
>> I had posted the patch previously and i can post the patch again if you=
 like=2E
>>
>> Attached in this email is the screenshot of cgps + gpsd=2E
>>
>> Maybe it should be in GPS subsystem but it's working for me even using
>> wwan subsystem for months now=2E
>
>Yes, I would strongly recommend doing the extra step of making it
>registered to the GNSS subsystem so that device is exposed with the
>correct class=2E
>From WWAN driver perspective, it will not change anything, as we could
>have the WWAN framework handling this properly (bridging to gnss
>intead of exposing the port as wwan character device)=2E
>Sergey, is it your plan?

Yep=2E I made the prototype exactly in this way=2E So a modem driver shoul=
d not care about the port type=2E Just call WWAN core and it will do the jo=
b for the driver=2E

The prototype is done=2E Needs some polishing, proper description, and pro=
bably, today night I'm going to publish  the RFC=2E
Hi Loic,
