Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2691F0997
	for <mhi@lists.linux.dev>; Thu,  3 Apr 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669766; cv=none; b=O/iN0fijFx9v2Ygvk0PYtCTtMSmh2KeT4UQou5oNhE9/OaEpJmmyyfV7LieX1rckzKl+L+UOVzU/IjZ+6fGgIRDVmS1Rm7X3y82PXksZBMG2xJnv9v1CZYgiCCCdAiu5tRlG5uzv5qJSbWQqGHVVC6eOHczEX+NbhpCn4iqOHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669766; c=relaxed/simple;
	bh=7aJm33v5icxCm0qidJHR4iPjTjoB6eUlKP7PS5rRpgo=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=monvSi44thA4rP+3G4uaHskO37j0PIoV9uCdiMi5Fb1En+oEfVeFxROwM07iHf1Q/Ecc/ggSiuJhdU6CZTHfFGoJnjff3UFwBPZYUKmV8Q2flPg0TyiQGly/BYaqv82F0doMAb9MZwXH6pV3Gf7RoVqcCbTBMq+65nYPN3D0fdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net; spf=pass smtp.mailfrom=unrealasia.net; dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b=NVfvoZnc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b="NVfvoZnc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fb0f619dso6919885ad.1
        for <mhi@lists.linux.dev>; Thu, 03 Apr 2025 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unrealasia-net.20230601.gappssmtp.com; s=20230601; t=1743669764; x=1744274564; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xA35ksag9J2Xv4q27dqXCVSa6SSb65HZF1swwOeMnk=;
        b=NVfvoZnc6anIHr0Z1UUnA+XpI8XOkPsNYC9WFyDqmf16Ce/9+VZVZgWcdwtAFNddjT
         bZ2WbkIljQv00wqDk7HeIYPByrvq2oYmEupYJKmBe2NwSjeE6yVoZONu8/Jqnv/Tci1Z
         NvuhulTQsmNZrLdvazAH2XDRfDuva0eyHrX3U03RVF9BC5jMgxx8F6drxx8bGaUKFM0V
         4LCpLxs4a22vWelAgMLKlGo8484tW7xw5lQRM3lDTxnp8JbXx8kl6VIxvo35kMRot3sO
         imW97iV6+nHyCMCoXkf8/V7cOhjuU/vcW7NnfaP6Dh6Xa0szneX6afIhHi6sw6b5ign/
         1Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743669764; x=1744274564;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xA35ksag9J2Xv4q27dqXCVSa6SSb65HZF1swwOeMnk=;
        b=lc31Na95ykCb/KSI3GIZRbnjVSkad2ZCSi6cbbjrD1tHnv0AQKXN0OzbGRbED+P/+m
         zHH6v8DYt9UX21tJPdnu4R86X7qQ93jfOl6yrmRzLy4p45B7QS9wJ1b6WDLpdIMQvY8A
         ECraRQap74nPrxzdmBi5BG5Q0GwbqC7sZ0sNW/Ck3NKzybheGoijGOCoitScGfipBvyt
         YIJQ4NhNCVC9ihgdHheTkuu6uWUwuFwhwa4Lj7g0xpWOBZ3Ka+tYGHsjw9i80rjrtrQP
         SP3x0XZywBQqzpeFGl8UL1h6inJqeZtvYhg7wWJBHht2NUFdEv+/1KCGs/2vw6PMzDsu
         7zwg==
X-Forwarded-Encrypted: i=1; AJvYcCUlgazz65LKMO2gTT7pR8B7ufiLWZxK8pZ7d5CnvBE8s4bvRzBcu2mULV1/0w9v0Pezaq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRI5NR5+T1v/AOjNPDLQV/cGyN7576MizTnutVINEE9juFZ9ra
	3r6RXiVElHyKn7kGhQmy069VF8ImA+3BcjdS6adCkHSWo5f6IKHARzuMnvwG82k=
X-Gm-Gg: ASbGncvwS6bdAYAR9+LYxq32ipZE6s9AAIZJLYx1WqquA4dMCSgPAFeG8V7FYChOXSI
	S/sKKT/Mus3hUpgMkbeYeMfh0DzEQYwClW0I2AG1VSKTw0TOjfEfQT23APXB5cJkpNo+yAHU4s1
	f1BSvEE16bhGL04vteCZdTvvIGuevLUcEdStCIgck6BCKHn5cB4A9TvJdn1QzGdDxYEsQrCqdO8
	6q4nCpTs6TyS1lzjmf6ErO8NpWa4AT7lCfQwX8ii8pUgQgSe+mTG91vZjAaHdq1236EDldbhNkB
	s2l4mKyQ10EX+Wlf7oZPnH51KdLLv9RhiTUjjWabFmeKuoensGXmMj7t6pw=
X-Google-Smtp-Source: AGHT+IEjowCN4gXZXqm96TUY0x++o8jpRQdsEDVEgbhHSa9RgS155jbANLrw67GahxHTNTH1o9uHWg==
X-Received: by 2002:a17:902:e847:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22993c0dcc3mr20120225ad.19.1743669764333;
        Thu, 03 Apr 2025 01:42:44 -0700 (PDT)
Received: from muhammads-ThinkPad ([2001:e68:5473:808e:fc9e:2417:ec87:2160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2566sm9173505ad.95.2025.04.03.01.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:42:43 -0700 (PDT)
Date: Thu, 03 Apr 2025 16:42:32 +0800
From: Muhammad Nuzaihan <zaihan@unrealasia.net>
Subject: Re: GNSS support for Qualcomm PCIe modem device
To: Slark Xiao <slark_xiao@163.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Loic Poulain
	<loic.poulain@linaro.org>, manivannan.sadhasivam@linaro.org,
	netdev@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>, johan@kernel.org,
	mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
In-Reply-To: <DBU4US.LSH9IZJH4Q933@unrealasia.net>
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
	<DBU4US.LSH9IZJH4Q933@unrealasia.net>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Slark,

I just implemented it in the wwan subsystem since it works for me (even 
without flow control). I wanted to port it to use GPS subsystem, 
however, debugging in GPS subsystem is too troublesome, especially when 
the driver crashes.

Unless i can have some VM with direct access to the Quectel hardware so 
i don't need to keep rebooting my machine if it crashes.

For now, i am getting GNSS/NMEA data from Quectel with MHI wwan 
modifications.

Regards,
Zaihan


On Thu, Apr 3 2025 at 04:02:01 PM +0800, Muhammad Nuzaihan 
<zaihan@unrealasia.net> wrote:
> Hi Slark,
> 
> I just implemented it in the wwan subsystem since it works for me 
> (even without flow control). I wanted to port it to use GPS 
> subsystem, however, debugging in GPS subsystem is too troublesome, 
> especially when the driver crashes.
> 
> Unless i can have some VM with direct access to the Quectel hardware 
> so i don't need to keep rebooting my machine if it crashes.
> 
> For now, i am getting GNSS/NMEA data from Quectel with MHI wwan 
> modifications.
> 
> Regards,
> Zaihan
> 
> On Thu, Apr 3 2025 at 02:06:52 PM +0800, Slark Xiao 
> <slark_xiao@163.com> wrote:
>> 
>> Hi Sergey, Muhammad,
>> This is Slark. We have a discussion about the feature of GNSS/NMEA 
>> over QC PCIe modem
>> device since 2024/12.May I know if we have any progress on this 
>> feature?
>> 
>> It's really a common requirement for modem device since we have 
>> received some complaint
>> from our customer. Please help provide your advice.
>> 
>> 
>> Thank you in advance!
>> 


