Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C851DA5E
	for <mhi@lists.linux.dev>; Sun,  1 Dec 2024 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733054496; cv=none; b=BAKMQukIsCiYoaZoh4g+VNGgeP3uLk50cCWqIMPFVd95ebyaB2wXSdWPpU4b2IwUUQmcjJHKhTywK7d6HlkM9PdO0Ov3HX3myXqD/OGwhAaJ02sXYpKSQvF85XGaHC5qXp8aVd8WZbeBhnavUOfi2C+H96nfOCeV5B3HuCUutdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733054496; c=relaxed/simple;
	bh=HCm52alGhzA+10PfghqabVRl3Mi8VYcdpWPiXl0a27w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lmkqr/SBCjw2BrrWKscXHZ7UwaCcTeIcT4e/FJvau3WDhlXEVBPdLCL530efL19F112ZCkdqnlFalxHTWNBGghEB6kvOtlzegGwGWfrchYzJUPvwdFuAcu6xxB5ZR6KbXE1QkXR02w6wIaY2u31W2yDCkg8mjCOBGWLb49dRMf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUJwKeNt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUJwKeNt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so26702065e9.2
        for <mhi@lists.linux.dev>; Sun, 01 Dec 2024 04:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733054493; x=1733659293; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrR8mO80WSXEbpUjZpvEt71iNDvcyWj6m799SHtB0kE=;
        b=KUJwKeNtoYktsqrqlJuV0BwVpRiaFwgyXJh8fp16XapAuBInucc7U/H7RE2w8srW7r
         Wj+x5Q8P7AJe/u1Q0VwiRHbLpdFrRcicoecmRkAG+uxMkjs9sVVHDwbtnqwTlH/BAkyN
         PHAHB3xvebCXCW1BiJyRBVhcacrUEaI+Y63SJtcbPx16TxH6T0q++UDsvarYVaXAJn24
         6zBkswbjgRVJVcym+Y+iOpINFOL/wpwF92Z/wZgANGED8vDMZyeBFYCrpkbZHqx1BuXM
         iiNu1Zlce8S+2dPKssfMG1Qj6SuYhcwxj6QibpNFDH5o+sZQ1uWoj3YHxkYbuC//LTZl
         iAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733054493; x=1733659293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrR8mO80WSXEbpUjZpvEt71iNDvcyWj6m799SHtB0kE=;
        b=C+jcEBkN8BjXM5BfiHz0kX8Zr8QMlc8nVZiaYb1MZzvZqpcx+fnr5VAed/bkS18OHg
         c2NZr0glNzgFVnSeJAHPVgcLzA45B/LDl+22HYxKbqXgiDCTzwnNInj5JsabLWyP02d5
         aBDZ3FE9ti+Mb9HjWocNds4cVxmxS6+f+jAX2aOlg3f4vhXw4NQvXmX2KCSX/NOEnPzS
         VnrrtUkTpKYk4g4mVAS2DxQWgj8jAFCw+jxyk3xsrKTA41Bcwq6IiQh3VW6IV5ND5b8x
         aidc8Ph6XFCtKzY/oHNKgwjaf2BECCeIsKrDStDiSM+c2OjNWXBQU7ToYd5W+mWowSUw
         d1TA==
X-Forwarded-Encrypted: i=1; AJvYcCW41A1NohTQdWJ/O0KLRuyMg71g9TAAAG5VSCP2SbQqImihx1ZLHcrNlYT57dIv2ivpLac=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIvH0cDw0cGtB8TbVJ0QsBp+LVYOUteiPSRoUodYJIT2TdhIWh
	H40rTinh9YGK4iOPpbwPtNivC6AD6pyyFNdguQ0fba32mjuZOZAr
X-Gm-Gg: ASbGncvLcNuuebCngSt0/SAKREPkOYCE8du77VK452i3htct/clgoQehFaifCLH/0Mm
	+VQ3pcxY9xxMhoMvSgkU6XdOibLiSO9wvDtaFZZLPFMhoHvNnjy9IRkLp3xoHt8JBBK660UCZwG
	i8SC96MHpPnlFKJQrc4U9YT6qzcA2ccl5bz3xbJQoOb5J+YXCkzTewnedXi7QRjdVsVVpa/WD7Y
	KcFP3TtjemF+QCoIWDm5/V4ElpzU2P6o7vJTvuvPK1ExPx1SfE=
X-Google-Smtp-Source: AGHT+IG98F+9m7boVBHLq++a14erC2VUBBJbMf7hYj67xtaVr1GVaEo4rETuga8d55Jysa0wKwOxVw==
X-Received: by 2002:a05:600c:4447:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-434a9dc3c8emr169799005e9.8.1733054492880;
        Sun, 01 Dec 2024 04:01:32 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc11sm117281395e9.4.2024.12.01.04.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 04:01:32 -0800 (PST)
Message-ID: <6f75f867-bf1f-41ec-9b5b-e39c26054454@gmail.com>
Date: Sun, 1 Dec 2024 14:01:30 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to add RTS support for wwan0at0 port
To: Slark Xiao <slark_xiao@163.com>
Cc: Loic Poulain <loic.poulain@linaro.org>, Qiang Yu
 <quic_qianyu@quicinc.com>, mhi <mhi@lists.linux.dev>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com>
 <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
 <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com>
 <8d005972-6a56-42f0-ba9a-444a8df5d925@gmail.com>
 <1d37efa8.4475.19347b9b39b.Coremail.slark_xiao@163.com>
 <F987F2EE-E2C2-46D7-BBD5-A7632C4C2CA3@gmail.com>
 <CAMZdPi8oprfHfFuLmNO1NW9ZUNP9nzhoqEaVd-cMGM06jhbxiA@mail.gmail.com>
 <ebd60134-6ba0-453f-bf9a-b215373160c0@gmail.com>
 <a265655.3b31.19370c85dc3.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <a265655.3b31.19370c85dc3.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+Johan

On 28.11.2024 05:19, Slark Xiao wrote:
> At 2024-11-22 07:25:25, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
>> On 21.11.2024 11:01, Loic Poulain wrote:
>>> On Wed, 20 Nov 2024 at 08:49, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>>> [...]
>>>
>>>> There two tricky topics. First, a GPS port is not an arbitrary serial (char) device for the kernel. In Linux, there is a dedicated subsystem for GPS/EMEA devices and the port should be registered with it.
>>>>
>>>> Second, strictly speaking, a GPS port is not a part of WWAN device. Yes, navigation receiver can be implemented as a block of a modem chip. On another hand, GPS port have nothing common with cellular network. It doesn't reveal connection status, and cannot be user to configure the modem.
>>>>
>>>> So, the first big question is: should we export GPS port via the WWAN subsystem or a modem driver should do it by its own?
>>>>
>>>> Loic, do you have any thoughts?
>>>
>>> Many modems have (Assisted) GPS capabilities, and the GPS engine is
>>> usually controlled via the Modem control interface (AT, mbim...).
>>> So it would make sense for the GPS interface to stay under its WWAN
>>> parent, and the interface to be a WWAN internal port  type (NMEA ).
>>
>> Ouch. Make sense. I've forgot that some (most?) modems utilize control
>> port to activate the navigation receiver. Thank you for reminding.
>>
>> Then, the NMEA port should be exported as a child of WWAN device for sure.
>>
>>> Now... we could either expose the NMEA port to user like other control
>>> ports (wwan cdev solution), or have a shim layer to the GNSS
>>> subsystem.The former solution is probably the easiest, the latter
>>> solution the most appropriate.
>>
>> Also make sense. Personally, I'm voting for exporting through the GNSS
>> subsystem. This way a userspace application will be easy to find the
>> receiver.
>>
> Do you mean the GNSS driver in driver/gnss ?

Not exactly. drivers/gnss is for pure GNSS receivers. Exporting through 
GNSS subsystem means using gnss_register_device() to make the port 
available to user space.

> And what's the next plan?

I could not say somebody has a plan. I can propose a high level design 
of a future implementation.

Basically, components should interact like this:

Modem PCIe driver <-> WWAN core <-> GNSS core <-> /dev/gnss0

We need the GNSS core to export the modem NMEA port as instance of 
'gnss' class.

We need WWAN core between the modem driver and the GSNN core because we 
need a common parent for GNSS port and modem control port (e.g. AT, 
MBIM). Since we are already exporting control ports via the WWAN 
subsystem, the GNSS port should also be exported through the WWAN 
subsystem. To keep devices hierarchy like this:

                       .--> AT port
PCIe dev -> WWAN dev -|
                       '--> GNSS port

Back to the implementation. Probably we should introduce a new port 
type, e.g. WWAN_PORT_NMEA. And this port type should have a special 
handling in the WWAN core.

wwan_create_port() function should not directly create a char device. 
Instead, it should call gnss_allocate_device() and 
gnss_register_device() to register the port with GNSS subsystem.

> Anybody will responsible for this requirement?

Can not follow you. Could you elaborate, what was this question about?

--
Sergey
