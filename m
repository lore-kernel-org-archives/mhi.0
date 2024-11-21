Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF41C9DD3
	for <mhi@lists.linux.dev>; Thu, 21 Nov 2024 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732179716; cv=none; b=k1H3xUpc8A4Z5UKFuUMAv0zw0KX6ymILqPnUy2gSJ0HTsLzbXWdd6y9s0wmH1mpXSHhEenNYSidgjSQ/kYOYraX8BW0kx7z6aT1CAdVjw9ecMgSmvK9jvnL3XhrnO1t7VH1Xdd1jUKnqhP8rZFQd/FZb/13FqrG7VGX2cAx9MOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732179716; c=relaxed/simple;
	bh=bznodKXGM9aqrMmkeNXCNrlJ+Qumz4pL5IyEyEddDP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwIXzcvS7G4BgzM1IdEeVtaUhmAyho9j0YCzp06LmQ/TwItp4R5diPHZBd3FIhwNj7JTKD3KV7Cm3pFeGYWEvlHK3eMhowR7tHeeNflZDYpHwESRSeCEJR2xJlyhr9MGd9mAQCgrQfiCDJ1F1PzXyHBILeh9zznU1K5N1Ab5dPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tEQ/Jmea; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tEQ/Jmea"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-296c237a121so441920fac.2
        for <mhi@lists.linux.dev>; Thu, 21 Nov 2024 01:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732179714; x=1732784514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiDkVqh3HBJoqDH5j2wLNl+yJrlJAFtRyN3bg7myU5E=;
        b=tEQ/JmeaRBFyGYtHdaipozc5hkcTYdgPI+oArlguEMGrPP+1TjewEajdBkjEhJux7k
         IDZOEsqKWyypzhrlMU1hkYxtjJfL8yDm/MjjxnOzPb+KGSOT/Fbzjwrx51GkgIxBOuB/
         enQz+o2UJ4skOaVS8w77rzUj1lUwDeQM6Ci5yJopmVZyY4Srh9USCRITt+jcJTuG7KRa
         FBIMNc3ppU+r2B7uESaWBy0wR/Stg+kW/hHCXG6nPatB5oMOLiG3wr366v4cpyhLuMqo
         Hi9pZGeU4AIbswPA6V1u8m9j81BZ7fB88H0Z853YFCSnhdCcXX4IMN+ELbrDBZ5refS/
         guMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732179714; x=1732784514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiDkVqh3HBJoqDH5j2wLNl+yJrlJAFtRyN3bg7myU5E=;
        b=qkbhIeezo0Dd/1VywBB4d+EywnF/8z7MvgrPZBD0aCG9UoN37dD0A1RDyocNmZiUmo
         wCtZlmcPiClTujQVn2PQx2qqUFZ7LqiQKaMEuG0tnzd1rbeJc8wHpF75t1MGnB4ZSTnO
         Ji5irNWHnu+kVZxQEgkFbpl3RVtlzBYu0WdPKeJMQQo+9WsKvk6mueAhGcgz99zNO0ko
         dAgaxvm+cF7reoZsQ7jmVcdiAHfOAhgWtDUCQj4PcBcZwJzZWUYuj99E8fvfZFGECBxp
         nz/sXsXr6s/BsUS8LiK25pNGxPoYOv+ks0jonaZAmSbp5IQBj/VhLeeky9/YsWAou0hB
         zNvw==
X-Forwarded-Encrypted: i=1; AJvYcCWNa6j3+RQAi2v8ouqyyH9FOa9JkATF2NBzck16yZe+ZsTVqfbQj5SNbFuS4AhC30jB39Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIgwMLLIiZRvvm4wrf9kNjBnKm+RYA73n8Q4Sz5LNlTmeI+k7Q
	xVDTKybW+iL+SdApYuMaEzuzvdFwWiu/NBnu1ZQRdC5GdPxv8yME1SMGSTxHXlwJNHi+Ea0aJ90
	bXUuBBpWEJhrPWImvycdJcTmBQeaPFmgVVLIqZw==
X-Google-Smtp-Source: AGHT+IEOFqmd8JNn12gh68lMW9MFvTnS3lfj0o11Kr2BDJX/4++cLM00f7gpLKRXgxPfvUkpindvyoVmbC4Dp+8uIgw=
X-Received: by 2002:a05:6870:d152:b0:296:7ab8:ddf5 with SMTP id
 586e51a60fabf-296d9bcf4admr6153298fac.24.1732179713740; Thu, 21 Nov 2024
 01:01:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com>
 <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
 <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com>
 <8d005972-6a56-42f0-ba9a-444a8df5d925@gmail.com> <1d37efa8.4475.19347b9b39b.Coremail.slark_xiao@163.com>
 <F987F2EE-E2C2-46D7-BBD5-A7632C4C2CA3@gmail.com>
In-Reply-To: <F987F2EE-E2C2-46D7-BBD5-A7632C4C2CA3@gmail.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 21 Nov 2024 10:01:17 +0100
Message-ID: <CAMZdPi8oprfHfFuLmNO1NW9ZUNP9nzhoqEaVd-cMGM06jhbxiA@mail.gmail.com>
Subject: Re: Re: How to add RTS support for wwan0at0 port
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Slark Xiao <slark_xiao@163.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, mhi <mhi@lists.linux.dev>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, 20 Nov 2024 at 08:49, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrot=
e:
[...]

> There two tricky topics. First, a GPS port is not an arbitrary serial (ch=
ar) device for the kernel. In Linux, there is a dedicated subsystem for GPS=
/EMEA devices and the port should be registered with it.
>
> Second, strictly speaking, a GPS port is not a part of WWAN device. Yes, =
navigation receiver can be implemented as a block of a modem chip. On anoth=
er hand, GPS port have nothing common with cellular network. It doesn't rev=
eal connection status, and cannot be user to configure the modem.
>
> So, the first big question is: should we export GPS port via the WWAN sub=
system or a modem driver should do it by its own?
>
> Loic, do you have any thoughts?

Many modems have (Assisted) GPS capabilities, and the GPS engine is
usually controlled via the Modem control interface (AT, mbim...).
So it would make sense for the GPS interface to stay under its WWAN
parent, and the interface to be a WWAN internal port  type (NMEA ).

Now... we could either expose the NMEA port to user like other control
ports (wwan cdev solution), or have a shim layer to the GNSS
subsystem.The former solution is probably the easiest, the latter
solution the most appropriate.

Regards,
Loic
