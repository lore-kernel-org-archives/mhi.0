Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD7F1AA1DB
	for <mhi@lists.linux.dev>; Thu, 21 Nov 2024 23:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732231494; cv=none; b=tgx/hxH4MLR8fD+yu/e+U8eMAQOuT0rOR7enX1f9OCVeyFCfBQr/gSvHGWYx0j3Zm6ch2YoBka2z487/Dac9OBwHOA4JVidKrQzv+vwKkiauwH2LBQMlHa3FLc4f/8okVyxWCppZoOGIeIV5v986Ig4s0oozXdVFP8FX/5/DsQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732231494; c=relaxed/simple;
	bh=d2e9rmPyoDqiQs66HVdb2ddagnLf6bhdffYaELxfStg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSCvxStnhqQWKYCoeqs3kJkkzCJb8tf6H4EBJkixvv8xDsgjerwkN8e8fiZy8/sUz0Kaiwx3rWfQ9jIOQvr2TJgujIfRXygvr/yWOzaSYfkDfrOBkvBs/YCKNabYLSB//uSxCVItZjRAteKECt0HIEBscapO5R3uuqdlAP1JZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyPkpSIq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyPkpSIq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-432d866f70fso13053025e9.2
        for <mhi@lists.linux.dev>; Thu, 21 Nov 2024 15:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732231491; x=1732836291; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmXlx6v1iZft9gxpkCKW5wwYxY0lpbJRy6aPXhM3avo=;
        b=jyPkpSIqynqLOn90o4I4FWkUiAPgnffeUUohvrkYrxgt/pIROhjqQACdsI2sHcjxH+
         PYAXxgZJedyBkTJf7+EM7NUl/cKdpSRAfjy+pBPWlK4iRjDLiLKXJ33aTOC8MZfo6gik
         VtKuQ6sQADtJk+qaWNo1WP1ci5ivdxFxmibkREzJySXhuS9MeBHkJaN+LopdHAfCDJzL
         FFY6YHkdVI8FvjyG+v4HpoE0+9xYpAjGozFbHyixEAXT0RnsCbc5SBmMh4WgnCTYcLVW
         clam55/1h2YkyEPEoHDhv+wavmeSpdr/3BReujPFxstLrYQ4SYkMyeI4rzjVKMunnFv3
         k7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732231491; x=1732836291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmXlx6v1iZft9gxpkCKW5wwYxY0lpbJRy6aPXhM3avo=;
        b=A4MrNqCIoYwN83DmIIXY1zqUONz4wc/xJTmxxXYFA7732zzMrindAnvAw7iT0Ksat6
         ulfetpCK6m03MYoNwMCvvJ9BV5xddVUOUsvd+6mbpWfP6tp5EhiQLKlYi4yv7+g6cO1O
         61rjIc/HogusNcrEwgDUBNXVOz05ostwUGNEAANWTf8S451beWOWWOkr3RmIr3xlSq+l
         JxBbE5dUY5f/FDXsL7Tqu/jS0R0nHEM8GgHzTIQs/DNOrHlu+XzrKyOwVRHYsqvIqmGs
         eeIXhkHuCrqHS9UOOSXFC+fYfJ3hHBNjXlEtQoiEqPIKPZ2n9F1/p0dZtc7FMcbZXJob
         w6gw==
X-Forwarded-Encrypted: i=1; AJvYcCUIRtLLXlhhqjR/fAsMu4rURwAIlwt/N+tTRe/6m4+Mcqsa5/dY9mmlrKySdYuzKYy6aTo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW/1r86n2db1RQQmeTNy04qR0oOipjiVscryiaLRg5QyslR3KY
	CVU3B9tQjmnTNgrpCtnkjT0iGQHBpImPm3PL7LLyu76TfjpvuQAG
X-Gm-Gg: ASbGncv6vjzsXBBxlZNvmIJUQ4E9+8b6uMxwsrDhrDQzEN7Ix4FHrG5R+Ol0zgosrRc
	xqDasvdih6h6z4H5GYHFMJdpXR4i1AhOEQjcXcnIKTmvEfgJQeagWatombCE3aKLyXiwNRuDjx9
	MhFzWJfu+fvzqvyeZKaWNwRZRuQ/5/hn87mgexwW8qLRXN6gwE8IlHZvPFzDlY23/CSuJ+RFs1J
	qgqaTmTlRTMoj9cEeNfsLX85coW8ZkEy/e1YGUypSAo4GREFfM=
X-Google-Smtp-Source: AGHT+IHkSARc7LGU7GDbCFIwi2s9ePx0TVQhbrtf2gayw1ayQDmh8YxoDovZvqx+pGUWzwCRAsrMBQ==
X-Received: by 2002:a05:600c:511f:b0:430:5654:45d0 with SMTP id 5b1f17b1804b1-433ce4250camr4718115e9.14.1732231490892;
        Thu, 21 Nov 2024 15:24:50 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1165sm70783115e9.2.2024.11.21.15.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 15:24:49 -0800 (PST)
Message-ID: <ebd60134-6ba0-453f-bf9a-b215373160c0@gmail.com>
Date: Fri, 22 Nov 2024 01:25:25 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to add RTS support for wwan0at0 port
To: Loic Poulain <loic.poulain@linaro.org>, Slark Xiao <slark_xiao@163.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, mhi <mhi@lists.linux.dev>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com>
 <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
 <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com>
 <8d005972-6a56-42f0-ba9a-444a8df5d925@gmail.com>
 <1d37efa8.4475.19347b9b39b.Coremail.slark_xiao@163.com>
 <F987F2EE-E2C2-46D7-BBD5-A7632C4C2CA3@gmail.com>
 <CAMZdPi8oprfHfFuLmNO1NW9ZUNP9nzhoqEaVd-cMGM06jhbxiA@mail.gmail.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <CAMZdPi8oprfHfFuLmNO1NW9ZUNP9nzhoqEaVd-cMGM06jhbxiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.11.2024 11:01, Loic Poulain wrote:
> On Wed, 20 Nov 2024 at 08:49, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
> [...]
> 
>> There two tricky topics. First, a GPS port is not an arbitrary serial (char) device for the kernel. In Linux, there is a dedicated subsystem for GPS/EMEA devices and the port should be registered with it.
>>
>> Second, strictly speaking, a GPS port is not a part of WWAN device. Yes, navigation receiver can be implemented as a block of a modem chip. On another hand, GPS port have nothing common with cellular network. It doesn't reveal connection status, and cannot be user to configure the modem.
>>
>> So, the first big question is: should we export GPS port via the WWAN subsystem or a modem driver should do it by its own?
>>
>> Loic, do you have any thoughts?
> 
> Many modems have (Assisted) GPS capabilities, and the GPS engine is
> usually controlled via the Modem control interface (AT, mbim...).
> So it would make sense for the GPS interface to stay under its WWAN
> parent, and the interface to be a WWAN internal port  type (NMEA ).

Ouch. Make sense. I've forgot that some (most?) modems utilize control 
port to activate the navigation receiver. Thank you for reminding.

Then, the NMEA port should be exported as a child of WWAN device for sure.

> Now... we could either expose the NMEA port to user like other control
> ports (wwan cdev solution), or have a shim layer to the GNSS
> subsystem.The former solution is probably the easiest, the latter
> solution the most appropriate.

Also make sense. Personally, I'm voting for exporting through the GNSS 
subsystem. This way a userspace application will be easy to find the 
receiver.

--
Sergey
