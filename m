Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5733140BE0
	for <mhi@lists.linux.dev>; Tue, 19 Nov 2024 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732057542; cv=none; b=s4uINYrMIQTL+7eZhWJMxB8D1OupzR8sHYeWZxLk2xxjgsxqnTP/uXs2oW1gCUNs3YFFz5aVIsJxswLWzyRtxl+OigluyRtKuT+zrFrueDNsAX1IYPgWQqjzbav7svndVx/Rx3vYPYAAppXBGysCaS3Q67kHp6eokkAcaI6soro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732057542; c=relaxed/simple;
	bh=6Y+k+FjeSQycxEJkwAoKlpSBVAsC/mUshND46RLvaeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i52IXEY6WBybVGHWED2GYn2qfGzHBTW3vfLoF1Pc32p75W78CDtZJebsazRwj7IryvwJ0pSZTCggI851MlFaeeS0bB+Og/QLgrzv43i8yjlybfdjcPRfFzQkZLcaoubvfRD6tBAA2Qe+nDlQj4BTw+2okvLhpl9QD3j9c12PRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOwEpwnn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOwEpwnn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4319399a411so13824045e9.2
        for <mhi@lists.linux.dev>; Tue, 19 Nov 2024 15:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732057538; x=1732662338; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YglX5WYYIC51OBYNNxZmR1TapnWsxVGZiIFhf2ISqSw=;
        b=HOwEpwnn3974L6ZrpdT9nUoAXkoKH0DDeXoVLIX1OJ8Bt3yw4+fma3xZFTIy09PO4s
         vtKzsHE1t7Nlhxi9vhk6PlgX9gj2EHPaznMV2oILNYrbRm9Re+4mwCmVkftIW8Symnxa
         Y1P5P+1iuQZCuf/tcS+ALc7cU/FPl0PV7/ixQk46ZLkmrki+fDkszRMWh0TvH+TAd5yt
         uwdWvRzSzJAEyYT+GTiVTcUZeoAblMzbpQk8G5QIfT2i6k65dOiGU4YRJVIHbn5lrs5N
         fcKZ35A54FzHLKmd+lCL0hljvfQ9gmqEZmtJ+cg9xLZc3Qiay+DY2v2sbHFugClcu22k
         uKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732057538; x=1732662338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YglX5WYYIC51OBYNNxZmR1TapnWsxVGZiIFhf2ISqSw=;
        b=PMcKd0oZ4WDCFcYkKPrsot6UTthuXsYykdzJhjZTKTcnKtjqVi+KZVwNYQT3BIcBjX
         PJVQZ/rBsX3hlgKKk4XolFgQjzxED1UdQLz3hMEGgT9IDbAufOC2VUVu4Yfw3we6QT41
         BRYWYQVVWHXcaZpO/K59QDmwfCMzfXW/DTf+PtDv/Vxtvhk5g2bPACmsiQRiXIeNDcMP
         e3/etRWyTtbhZw/8N303B4UdWjHHOdFx0aJy1mVJ7K9Va/SIh+LSFmt9D52FJ9mJt7MT
         ZdX1ftclUT07iVZsvfYrsRQddON80GKHiTwKtN0gdvVE/VjPYYog4Ycnjpxp313Pd21N
         SRgA==
X-Gm-Message-State: AOJu0Yzniyi7THmUbgq4iyCKqihillsJ3F5X2oOZ3D9m/BmDBi6EzBgf
	jYD0g49/vlh4iBCelnx9YF07Bs6uxZe3nH6OiLKPsrR8w4aSkHLV
X-Google-Smtp-Source: AGHT+IH3pLyI11aGx6okpKxbHqoEQZuShUzStzEo5gi1pFoUmTbscFLLVm5gEErKkxZhn+WEV6CoWg==
X-Received: by 2002:a05:6000:2712:b0:371:8319:4dbd with SMTP id ffacd0b85a97d-38254ae58c8mr306221f8f.17.1732057538415;
        Tue, 19 Nov 2024 15:05:38 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549055f2sm521110f8f.16.2024.11.19.15.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 15:05:37 -0800 (PST)
Message-ID: <8d005972-6a56-42f0-ba9a-444a8df5d925@gmail.com>
Date: Wed, 20 Nov 2024 01:06:11 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to add RTS support for wwan0at0 port
To: Loic Poulain <loic.poulain@linaro.org>, Slark Xiao <slark_xiao@163.com>
Cc: mhi <mhi@lists.linux.dev>, Qiang Yu <quic_qianyu@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com>
 <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
 <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Loic, Slark,

nice to see you, please find a small note below.

On 19.11.2024 12:59, Loic Poulain wrote:
>>> I tried to add RTS signal support for our AT port of wwan device.
>>> Now we can know that we are using wwan_port_fops_at_ioctl() for
>>> this configuration.
>>> Actually, there are 2 cmd will be ignored by default: TIOCGRS485
>>> and TIOCSRS485 when you tried to use "minicom -D /dev/wwan0at0".
>>> Then I added it into that switch statement. May I know if the "mdmbits"
>>> corresponding to the defination in termios.h?
> 
> Yes, so the initial goal was to support 'legacy' terminal emulators,
> adding no-op stubs for usual termios ioctls.

Exactly! IOCTL support is just a stub. You can find all the details in 
the commit c230035c2f2f ("net: wwan: core: implement terminal ioctls for 
AT port").

Regarding the 'mdmbits' field, it contains so called 'modem bits', see 
tty_ioctl(4). Bits are handled by the core in an opaque way. Core saves 
bits from a user's TIOCMSET command and returns bits back in the 
TIOCMGET request. Copying is done without checking any of these bits, 
just copy sizeof(int) bytes to/from userspace and that's it.

> If I understand correctly, you don't only want stubs, but you need
> them to implement flow control on top of MHI? If so, I think you can
> access the port at_data->mbmbits from the mhi_ctrl port driver under
> data->lock. You may also need a way to forward ioctl 'events' to the
> driver... Wondering if this flow control could simply be supported
> generically at wwan-core level?

Suddenly the 'at_data' field belongs to the port structure private to 
the WWAN core. And a flow control implementation could be tricky. 
Ultimately, it's a nice option to have the flow control implemented in 
the core. Depending on a number of users.

For a single driver, I believe, the most convenient option is to 
implement everything in the driver. E.g. introduce an 'ioctl' operation 
to the wwan_port_ops. And, if core sees the 'ioctl' operation 
implemented, then it will forward all the IOCTLs to the driver bypassing 
internal stub implementation.

In some moment in the future, we can implement a generic flow control in 
the core. In case there are will be more than one driver requiring it. 
Is it make sense?

>>> Below are some test results in wwan_port_fops_at_ioctl():
>>>
>>> //sudo minicom -D /dev/wwan0at0:
>>> [ 1773.390038] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389648
>>> [ 1773.390062] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is 93936443291456
>>> [ 1773.390069] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389408
>>> [ 1773.390078] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389392
>>> [ 1773.390082] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 140726000389344
>>> [ 1773.390087] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389344
>>> [ 1773.390092] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is 140726000389500
>>> [ 1773.390097] wwan wwan0: ##shawn debug## cmd is 0x5418, arg is 140726000389500
>>> [ 1773.390101] wwan wwan0: ##shawn debug1## mdmbits is 4
>>> [ 1773.390106] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389408
>>> [ 1773.390112] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389392
>>> [ 1773.390116] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 140726000389344
>>> [ 1773.390120] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389344
>>> [ 1773.390126] wwan wwan0: ##shawn debug## cmd is 0x542e, arg is 140726000389568
>>> [ 1773.390131] wwan wwan0: ##shawn debug## cmd is 0x542f, arg is 140726000389568
>>> [ 1773.390135] wwan wwan0: ##shawn debug1## mdmbits is 0
>>> [ 1773.390153] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389648
>>> [ 1773.390158] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389632
>>> [ 1773.390163] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 140726000389584
>>> [ 1773.390167] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389584
>>> [ 1773.390172] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389648
>>> [ 1773.390177] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389632
>>> [ 1773.390181] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is 140726000389584
>>> [ 1773.390185] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000389584
>>> [ 1773.390191] wwan wwan0: ##shawn debug## cmd is 0x540b, arg is 2
>>> [ 1773.393848] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is 140726000390084
>>> [ 1773.393861] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is 140726000390064
>>>
>>> I checked the old architecture of Qualcomm PCIE driver, and I found that they support
>>> these signal like RTS,DTR and so on.
>>> Please see: https://git.codelinaro.org/clo/le/platform/mhi-host
>>> file: drivers/net/wwan/mhi_dtr.c

Slark, I cannot find this file. Shall I check a specific branch of the 
repository?

--
Sergey
