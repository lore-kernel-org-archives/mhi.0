Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B8D1FBEB4
	for <mhi@lists.linux.dev>; Tue,  3 Dec 2024 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733250279; cv=none; b=R1fSiPn8DQmeuY7xD04fQuuaZvXoit3vKJhH4rPYRGQ/Vf94UD8l2Vh+30+QZ0kbHVTVjE3b0OMFMpZNLkQGImnBxtrPy47DZ+m+RvwnaDhSnwzjN8QNKoWD1OpcSzkIhtBQjs0k9QU+BVZGMySJ1uhzSWlT/vZDg4Ouu0iwBGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733250279; c=relaxed/simple;
	bh=6KKyjBUJeEpO/2uCHd2+/5fTrzpZ12G+vBLshpOzD3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/nlLZsfNWwYmaJrcztAiAFTtu4hLv7EHRUT1T/QPEkyBqDTYE3MH8m66ZFkQCax7lT2la4FfALUYcKAHMMm7F7H37vu17+yYa25gMQLyFtBS1n/HemY2WKD1O3/mGVB3xLM691SgmXXXsFVOvxggwjrEelLMog+5BZs0UGhfvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbKR25B8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbKR25B8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a14d6bf4so53068145e9.1
        for <mhi@lists.linux.dev>; Tue, 03 Dec 2024 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733250276; x=1733855076; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DN2fk1BvE+/GJLKnXCSoE/txSFPnWsA5v/R/Hc+wxJo=;
        b=FbKR25B8P33LG7cBX+ks2TFADG4xXd0zki1Wo4fJfrjmJqSk3y3avyHDZhwuORj+yt
         VwR4ubS0wkniCDYhTqU10L/63D9Rxg39I5iaTSXMcqG/WdLAaaXkmwWrLD1JjZgAsmbi
         g6o9lWIT9dQLTHH5PrEFqdd8YnGAFfmeEZrPPsZz13cCCTgWwnRAQGARw8kKCAlGQ7az
         l8FmbXFTeiiX2nvu860ieW0gE2NKbwDAEeN3SEM+uCZRcQ0CVI47z3WHq51/1RrCDWiK
         ZMBjCBh+aGWm05XAX29Sdoxxd5LX6vzzaolFEXhc5bXjeKI2LsC4ujYAvYVtE4A7FHR0
         LViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250276; x=1733855076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DN2fk1BvE+/GJLKnXCSoE/txSFPnWsA5v/R/Hc+wxJo=;
        b=wvy/5zltNoBl9NKS7RXDX3NSjgjo1ARm8IKfvuGx0A/xgVNmwr/xopPRXBiDL766iw
         66NoBuQLAJh0AtOWSK8ts1WcWfUhqu7UqXFUkOwWL9aGYVdYlpdowxnSumUlKd+i8Y9u
         fS47aXAmQRH3pjSOJd0eSI+YMhlxquyIiSjW1QA4u3lf1C1Tlvo6Y8bOcPbg3nckMpPR
         4O24Gd4TO1Zi5MFze2XKHHfjT3vc2Fm6jrc2Pu1A5tlO3KglU9wX0mPIgbFlVPf/DrID
         /nSxzWjJ9nBVb+OGlAAaebgIKy8nknZXRkAdHfh55tOVnJ3R60V/nF0z0ToJOKNM00T5
         KZMg==
X-Forwarded-Encrypted: i=1; AJvYcCVQRqdVLA45rfXNGQjGGKBdfdPGvnjoNeEN+U8CYoIamUy8/wFl2K68hd5G6q7FUho+V6s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/TnQrSBqZI9kgsKiwYolYKRg42q4VX4oooinom6sc7JR0aRX4
	tV5YCqXIkUfVCN9jk27cHJKOiU5kIvELK8omeck8ZFDd2VbzWoTp
X-Gm-Gg: ASbGnctQu4afeX2ZS2VMf/OCmwJPDCYr39Fz5dQtVEbpevOSFeq8QbBNWElctWebgys
	lHNWwzaVC7crhkwm3jjO4IbDNIGX7xAhZnrgW/Nsb7NTdYBBr1I/kiihNe+AUe6OczsCT+rgq0L
	bBSbNQ+qQL11KxYxPRnVcCRJrx3AuZcOn1RWRZPDFCX2uhjblXDzL5CIcIGEU2LSxqD56mUt7k6
	9JeBcdECfXhfGINIbN2mvvnliWxvgmjqJJh9sDLrsU7jMsARu4=
X-Google-Smtp-Source: AGHT+IFFBfMSwyCqnfRKsofTgRuRMbks/u8NEa16bGtg1GogZsckHNMzQ2Tbu8pU5uQyNhoXFJ8SHQ==
X-Received: by 2002:a05:600c:4706:b0:434:a504:7a51 with SMTP id 5b1f17b1804b1-434d0a0343bmr25922905e9.21.1733250275819;
        Tue, 03 Dec 2024 10:24:35 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e391656csm10934738f8f.47.2024.12.03.10.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 10:24:35 -0800 (PST)
Message-ID: <41eb290d-4c50-4067-972d-682a028757a8@gmail.com>
Date: Tue, 3 Dec 2024 20:24:33 +0200
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
 <6f75f867-bf1f-41ec-9b5b-e39c26054454@gmail.com>
 <28100f25.b702.19387231a99.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <28100f25.b702.19387231a99.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Slark,

On 02.12.2024 13:30, Slark Xiao wrote:
> At 2024-12-01 20:01:30, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
>> +Johan
>>
>> On 28.11.2024 05:19, Slark Xiao wrote:
>>> At 2024-11-22 07:25:25, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
>>>> On 21.11.2024 11:01, Loic Poulain wrote:
>>>>> On Wed, 20 Nov 2024 at 08:49, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>>>>> [...]
>>>>>
>>>>>> There two tricky topics. First, a GPS port is not an arbitrary serial (char) device for the kernel. In Linux, there is a dedicated subsystem for GPS/EMEA devices and the port should be registered with it.
>>>>>>
>>>>>> Second, strictly speaking, a GPS port is not a part of WWAN device. Yes, navigation receiver can be implemented as a block of a modem chip. On another hand, GPS port have nothing common with cellular network. It doesn't reveal connection status, and cannot be user to configure the modem.
>>>>>>
>>>>>> So, the first big question is: should we export GPS port via the WWAN subsystem or a modem driver should do it by its own?
>>>>>>
>>>>>> Loic, do you have any thoughts?
>>>>>
>>>>> Many modems have (Assisted) GPS capabilities, and the GPS engine is
>>>>> usually controlled via the Modem control interface (AT, mbim...).
>>>>> So it would make sense for the GPS interface to stay under its WWAN
>>>>> parent, and the interface to be a WWAN internal port  type (NMEA ).
>>>>
>>>> Ouch. Make sense. I've forgot that some (most?) modems utilize control
>>>> port to activate the navigation receiver. Thank you for reminding.
>>>>
>>>> Then, the NMEA port should be exported as a child of WWAN device for sure.
>>>>
>>>>> Now... we could either expose the NMEA port to user like other control
>>>>> ports (wwan cdev solution), or have a shim layer to the GNSS
>>>>> subsystem.The former solution is probably the easiest, the latter
>>>>> solution the most appropriate.
>>>>
>>>> Also make sense. Personally, I'm voting for exporting through the GNSS
>>>> subsystem. This way a userspace application will be easy to find the
>>>> receiver.
>>>>
>>> Do you mean the GNSS driver in driver/gnss ?
>>
>> Not exactly. drivers/gnss is for pure GNSS receivers. Exporting through
>> GNSS subsystem means using gnss_register_device() to make the port
>> available to user space.
>>
>>> And what's the next plan?
>>
>> I could not say somebody has a plan. I can propose a high level design
>> of a future implementation.
>>
>> Basically, components should interact like this:
>>
>> Modem PCIe driver <-> WWAN core <-> GNSS core <-> /dev/gnss0
>>
>> We need the GNSS core to export the modem NMEA port as instance of
>> 'gnss' class.
>>
>> We need WWAN core between the modem driver and the GSNN core because we
>> need a common parent for GNSS port and modem control port (e.g. AT,
>> MBIM). Since we are already exporting control ports via the WWAN
>> subsystem, the GNSS port should also be exported through the WWAN
>> subsystem. To keep devices hierarchy like this:
>>
>>                        .--> AT port
>> PCIe dev -> WWAN dev -|
>>                        '--> GNSS port
>>
>> Back to the implementation. Probably we should introduce a new port
>> type, e.g. WWAN_PORT_NMEA. And this port type should have a special
>> handling in the WWAN core.
>>
> Similar like what I did in my local. I named it as WWAN_PORT_GNSS and
> put it as same level with AT port.
> 
>> wwan_create_port() function should not directly create a char device.
>> Instead, it should call gnss_allocate_device() and
>> gnss_register_device() to register the port with GNSS subsystem.
>>
> If so, the flow control is maintained in wwan_core or the gnss core?

Lets specify the problem more precisely, since I'm a bit lost. Do you want:
a) some uses pace application *really* control the flow?
b) fool a user space with mock-up IOCTLs, so the user-space application 
believes that it capable to control the flow?
c) some "signal" to the driver, so driver can command the modem to 
activate the GNSS receiver and start producing navigation information?

>>> Anybody will responsible for this requirement?
>>
>> Can not follow you. Could you elaborate, what was this question about?
>>
> I mean, both you and Loic noticed that modems support the GPS function but
> there is no such support in current WWAN design.

Ok. Thank you for the clarification. You are right, there are no 
GNSS/NMEA port support in the WWAN core now. The reason is simple. There 
were no "users", so nobody have bothered himself to implement an used API :)

> So who will be the key role of designer of  this new feature? This would be
> great help if there is someone putting this feature into practice.

I would like to say, feel free to implement the GNSS port support for 
the WWAN core. Patches are always welcomed!

If you don't feel confident to implement it then give me some time and 
I'll create some prototype. I believe, it can be done a week or so. It's 
not a big work, just need to find a time to do it.

Tell me, what the option is more convenient for you and will move into 
that direction.

--
Sergey
