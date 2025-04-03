Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB6136E37
	for <mhi@lists.linux.dev>; Thu,  3 Apr 2025 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743716799; cv=none; b=CV6BQ6X+9iiT0oAvXULfzoMa1ZjRJ2f4gnj9NGpb/YhnEf/l9B80TfLekllcNyNAjzmCZBc6AgmnqL5liW0qtRgLWNyU9/GIkRAdCASRr6LsTOpFMem5eUgUb7ZBMWdwM41Gry5kIEUQ9mExDapkmLC+27pMvgOa86b+Jhxhrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743716799; c=relaxed/simple;
	bh=UoHi17w8zgHvpFGQto+G13hZRwmTH8OcIzC9cvweJ94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/yE0ExhFegSk2qAYx5hpcGsSnUc/F4roKdH21S8jzxWUppk186ROrLzGcrn8Z74PjZ5/m3a22qgUnY3ehpCIN4Z3Zh27u+RIS77O3yfMR11GlCVgHywrX48mypur6kvqvQVRNU88KryWrMy0ZJSnJnOHzfBADXeaSmXg90pqhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0olJI++; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0olJI++"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso6805855e9.3
        for <mhi@lists.linux.dev>; Thu, 03 Apr 2025 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743716796; x=1744321596; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDLT5jaOfTvnXrHcbjmxYiedZsavDNsVTNdUJK4Wfl8=;
        b=U0olJI++josmC/uW7DPYISGb+s8FkFyARVi/vqwM/J6gG8GwmFsLx+y7D/Y6zdyMB3
         6Y4xFuRw1sxQBPICC17Cld31PVU5Tr016Kbr7bgiOL7dEG46YUaOVtRC4cxc+OS+cYaC
         4mEvTXw5hFJ+6qgVzDmdFNZX1/azitJH6H0ygZhjlCyxOv3JdrkjN3wXBE0jeUcFjABU
         wbySqRVq3IJgx7nnP8Kxe71Btlu94RIyg5+92IJ5HLPgB/Qx14D7gXfCySS8t+UF0KGR
         78Z9BEBMNyLWCrtV1ZaGYZgRLBcVfMP7zQs/osaKMA+NTbXhpj+V05afji/gCHBSgLgW
         UeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743716796; x=1744321596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDLT5jaOfTvnXrHcbjmxYiedZsavDNsVTNdUJK4Wfl8=;
        b=vHeQAlCGOvceNyRqV++NelAX3w3oYX+BYgx5votnf+N5Zscg0ptDP+8mgXQD9kNw7f
         Yqy4rza5AJu9wJXN+Kl8N7tg4OHKGpkBPmE/mf90NaVNjmZkm06xGyfDanofqfIDKJ9Z
         inZaWgd+O09X8Z1q3rS/U1qUefa/WQExb8a+TTDrnepbBUJ36uNwnKT4wjgM3fo744Ug
         z2Vq4Qe6ZnJm/ihrPA/K/hOpctNZCqbP4GMdpcUDJBet/9BI4DkQ+io20xpSxv0ajgD8
         H44Kt3fFRxQzy5zLD79ldac7TdHbgmyj2SqTlLMzfoPhYqpyXmKZA8jRGdbXTi3pnmHv
         emvg==
X-Forwarded-Encrypted: i=1; AJvYcCV0HJ5f7qMyxVilDuo2wmj923I1FGPKeds2UlhQCsgNT+tQxX6SeAT32WEcRtUOYJlFC18=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFyaSjc/wNU/++8xmPmLflIg6ByvYk23WY8BhbXf/zKegyrELV
	HMAmEHIfHV7Cfword+Cpm8z2PWA4CSyoRLC2nVtpZRF3IAA8Y2Rv
X-Gm-Gg: ASbGnctkVd3bybrRz68VuZoy3uSkOLuGW2mhv5rdYTyDpTbIZ2T3SpuIMcQOvG9Jy7t
	yTYbqdjZ6zZQEPtyqPUi0ljyZRQYCgB7wh525SGqy33/6uAOJfJs1BdsdIPnN+4QKeYLKDB6ILY
	kTbQA/Xjd5BQnrDz2hYw4XRenUqf4SwV93elq2FSuO5juATwIQ+Hw7OkvKBf4zmd4GePCT63Z/G
	Af1jO+EE26Kqu3WmABC4c8s95vC4JR3uZMXuqVcdPz56I+1KHMb/avFjCyt7csN+/J7h+UZnFxF
	MV/I97Ax/oesYPne1N9DeROSbcCDUMYg1zLwM7vKAigKxMFvNFpwQKTv0pY=
X-Google-Smtp-Source: AGHT+IFtF/KVAoDcggALyJa6yUnhhZ7LhPdgH+LEEouPBpTHX9lLc/XZJT72W1VXptDBNhM5KaENqg==
X-Received: by 2002:a05:600c:1d12:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43ed0db3ba4mr2585675e9.29.1743716796219;
        Thu, 03 Apr 2025 14:46:36 -0700 (PDT)
Received: from [192.168.0.2] ([212.50.121.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm2788425f8f.53.2025.04.03.14.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 14:46:34 -0700 (PDT)
Message-ID: <f0798724-d5dd-498b-89be-7d7521ac4930@gmail.com>
Date: Fri, 4 Apr 2025 00:47:01 +0300
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: GNSS support for Qualcomm PCIe modem device
To: Muhammad Nuzaihan <zaihan@unrealasia.net>, Slark Xiao <slark_xiao@163.com>
Cc: Loic Poulain <loic.poulain@linaro.org>, manivannan.sadhasivam@linaro.org,
 netdev@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>,
 johan@kernel.org, mhi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
 <DBU4US.LSH9IZJH4Q933@unrealasia.net> <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Slark, Zaihan,

Zaihn, congratulations with the progress, curious to see the result.

Slark, thank you for remind me. It's a good moment. Lets see how we can 
prototype it. Will try to do it this weekend and send some RFC next week.

On 03.04.2025 11:42, Muhammad Nuzaihan wrote:
> Hi Slark,
> 
> I just implemented it in the wwan subsystem since it works for me (even 
> without flow control). I wanted to port it to use GPS subsystem, 
> however, debugging in GPS subsystem is too troublesome, especially when 
> the driver crashes.
> 
> Unless i can have some VM with direct access to the Quectel hardware so 
> i don't need to keep rebooting my machine if it crashes.
> 
> For now, i am getting GNSS/NMEA data from Quectel with MHI wwan 
> modifications.
> 
> Regards,
> Zaihan
> 
> 
> On Thu, Apr 3 2025 at 04:02:01 PM +0800, Muhammad Nuzaihan 
> <zaihan@unrealasia.net> wrote:
>> Hi Slark,
>>
>> I just implemented it in the wwan subsystem since it works for me 
>> (even without flow control). I wanted to port it to use GPS subsystem, 
>> however, debugging in GPS subsystem is too troublesome, especially 
>> when the driver crashes.
>>
>> Unless i can have some VM with direct access to the Quectel hardware 
>> so i don't need to keep rebooting my machine if it crashes.
>>
>> For now, i am getting GNSS/NMEA data from Quectel with MHI wwan 
>> modifications.
>>
>> Regards,
>> Zaihan
>>
>> On Thu, Apr 3 2025 at 02:06:52 PM +0800, Slark Xiao 
>> <slark_xiao@163.com> wrote:
>>>
>>> Hi Sergey, Muhammad,
>>> This is Slark. We have a discussion about the feature of GNSS/NMEA 
>>> over QC PCIe modem
>>> device since 2024/12.May I know if we have any progress on this feature?
>>>
>>> It's really a common requirement for modem device since we have 
>>> received some complaint
>>> from our customer. Please help provide your advice.

--
Sergey
