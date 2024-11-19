Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36153363
	for <mhi@lists.linux.dev>; Tue, 19 Nov 2024 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732013980; cv=none; b=HWXWRb0unwv72tS/mPlxoRH/x2hd8faXtCcyBri5czBR4Q0A4Fb2OHGvStCdYyFD4KxGFUXv9HaFKZUjA60Yiblpxn8hE/b2kS5aPy2Wx16HfiLSFziOKcABtTwtABdp8hipqyaxzASSXi6JQ1yZVtbXo+q69pTiheQpnFMhiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732013980; c=relaxed/simple;
	bh=DL+LQdB0mYoLi37Kked9Yk7l5yZTgiocRQ2xfcCjEaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8RwWCif0NEEfvaA+nCg0X1X2NR4HY65jeqq8DSI72Gq8vfWmNRHuJpSD8jBkwc8hzuffcnpVZHXn20Qd8j+xUKxpyhoajynrzlme9+QgohW5SpTYkpSjHxmHvAGN2DxReGuHw2LE9PcSiAVO823zIiM8IBwtlH2I3m8HHuAUg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MCmgU64q; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MCmgU64q"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2951f3af3ceso1376326fac.1
        for <mhi@lists.linux.dev>; Tue, 19 Nov 2024 02:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732013977; x=1732618777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DL+LQdB0mYoLi37Kked9Yk7l5yZTgiocRQ2xfcCjEaI=;
        b=MCmgU64q7VLvQUH01Rrbmkv9NrhPFY3Santd6TGM0GxtNZzzAQP0j31uEDHMkpCoUN
         Fi9EyRqT4auSnlJfIteON5cX4NnRTWLLsUfJbkCz9cO2Uw981fWDH6xC3mPT2Ut1QX6G
         aMx3T/TMmQyYpASbFUfHiDLauzzWCYDcSixGe8EQFlnEopyRKH2sMoRK8pnprlGuveSP
         nR1ZtGfwc8UElDwjUqEJoeb17JU5FRNVukl0DSs6/+tWHh7bNPoSnNJhdqfZ+BkVCQdQ
         ZYjrptWHfB51VteaUc5sIr9QLsTcza+BRjpVlCgP+5rv592jqp+2hX8yL00+LqEZk6Rp
         m0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732013977; x=1732618777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DL+LQdB0mYoLi37Kked9Yk7l5yZTgiocRQ2xfcCjEaI=;
        b=WVIX3VjOmGkea4zMMKauEj8yCMmNkWx2mI6znDte5lQm5VUWP4OiMsksqYC5rxkVfF
         HDWTEff5g+LEvkxhqndyJQoCzFIyaZgF2/k2XdcLkEegMsq8J/IhcfCcFP/pXOo4iSV3
         R0A+5kxFx2dKEWBZZjDih/ng7qstVhTwXhdPcW2mYhF7JWx629lwEu4TqM2INILRWJMq
         sfFWp8cjKcCsnK7dL/p+pf1QxD1u3FeTYOYmiuynkJFMZ9cQK7aVrWIIWclgJu7w88TD
         3BbJsXemcmKGApKdyO39mty88tKcx3EfM0DynartdAZmmS5vGt1B4UpAeV+tZrAGX6ZK
         lkDg==
X-Gm-Message-State: AOJu0YyeYJ0ZhHY8KIRLf7BAKG0+PMIcY9CL0jCpuDWis0ucKUWwjFu8
	YKwIuvo1y9qmspUDu7OU5IPq5TFu8UYCU6KNp41qZEl9K0Oa/DrBEFnEk91JXniIdvAeQ/a6yAV
	qUHX420URoQvS9DU2AWQEr02KN7FQbWMqvQvlQA==
X-Google-Smtp-Source: AGHT+IHqGWGzMrcETAsKHpEAxk8PgTpW2j6tM01qVCCEmlgAnXjKmQeBZxqIACXfnClcvOsF8ik11FNWuRxIPZ5tE1s=
X-Received: by 2002:a05:6870:712:b0:296:862b:5a01 with SMTP id
 586e51a60fabf-296862b72d3mr5544389fac.26.1732013977687; Tue, 19 Nov 2024
 02:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com> <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
In-Reply-To: <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Tue, 19 Nov 2024 11:59:01 +0100
Message-ID: <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com>
Subject: Re: How to add RTS support for wwan0at0 port
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi <mhi@lists.linux.dev>, Qiang Yu <quic_qianyu@quicinc.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sergey Ryazanov <ryazanov.s.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

+ Sergey,

>> Hi Loic,
>> I tried to add RTS signal support for our AT port of wwan device.
>> Now we can know that we are using wwan_port_fops_at_ioctl() for
>> this configuration.
>> Actually, there are 2 cmd will be ignored by default: TIOCGRS485
>> and TIOCSRS485 when you tried to use "minicom -D /dev/wwan0at0".
>> Then I added it into that switch statement. May I know if the "mdmbits"
>> corresponding to the defination in termios.h?

Yes, so the initial goal was to support 'legacy' terminal emulators,
adding no-op stubs for usual termios ioctls.

If I understand correctly, you don't only want stubs, but you need
them to implement flow control on top of MHI? If so, I think you can
access the port at_data->mbmbits from the mhi_ctrl port driver under
data->lock. You may also need a way to forward ioctl 'events' to the
driver... Wondering if this flow control could simply be supported
generically at wwan-core level?

>>
>> Below are some test results in wwan_port_fops_at_ioctl():
>>
>> //sudo minicom -D /dev/wwan0at0:
>> [ 1773.390038] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389648
>> [ 1773.390062] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is 9393644=
3291456
>> [ 1773.390069] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389408
>> [ 1773.390078] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389392
>> [ 1773.390082] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 1407260=
00389344
>> [ 1773.390087] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389344
>> [ 1773.390092] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is 1407260=
00389500
>> [ 1773.390097] wwan wwan0: ##shawn debug## cmd is 0x5418, arg is 1407260=
00389500
>> [ 1773.390101] wwan wwan0: ##shawn debug1## mdmbits is 4
>> [ 1773.390106] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389408
>> [ 1773.390112] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389392
>> [ 1773.390116] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 1407260=
00389344
>> [ 1773.390120] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389344
>> [ 1773.390126] wwan wwan0: ##shawn debug## cmd is 0x542e, arg is 1407260=
00389568
>> [ 1773.390131] wwan wwan0: ##shawn debug## cmd is 0x542f, arg is 1407260=
00389568
>> [ 1773.390135] wwan wwan0: ##shawn debug1## mdmbits is 0
>> [ 1773.390153] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389648
>> [ 1773.390158] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389632
>> [ 1773.390163] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 1407260=
00389584
>> [ 1773.390167] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389584
>> [ 1773.390172] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389648
>> [ 1773.390177] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389632
>> [ 1773.390181] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 1407260=
00389584
>> [ 1773.390185] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00389584
>> [ 1773.390191] wwan wwan0: ##shawn debug## cmd is 0x540b, arg is 2
>> [ 1773.393848] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is 1407260=
00390084
>> [ 1773.393861] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 1407260=
00390064
>>
>> I checked the old architecture of Qualcomm PCIE driver, and I found that=
 they support
>> these signal like RTS,DTR and so on.
>> Please see: https://git.codelinaro.org/clo/le/platform/mhi-host
>> file: drivers/net/wwan/mhi_dtr.c
>>
>> Thanks
>>
>
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
