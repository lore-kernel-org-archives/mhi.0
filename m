Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278581494A9
	for <mhi@lists.linux.dev>; Wed, 20 Nov 2024 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732089002; cv=none; b=JnV0bxfvUgorM/cU/wIwB6MKGfxpF5Jz6A2Zh+pLViR834/YgHgQ+EMC95SybpPVI4IxfsGzsyJcVM457o7AGPmW4jRm74WHzgXzEgs69r3DxE4ZJmnrhIqqQqVkU8UysRN2LmFD0qwSim6mxfP5DXBRI0Yf4QfGXS1FLfy4OYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732089002; c=relaxed/simple;
	bh=6ADAiBeedYWACTPkLF4ktHSe1A6LE/OALsE7D1jHQRQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rRnFa68lGAk+h8fUMpIwAH414vw0dlMD3CzeA4eJTLohvpIuSXQknxrnBmwIyDcro5sMVNQkBij/eaNt2cXh6hAW0DNGGvRSk4of/8Ka0dei4g0K/FDpJS0TXs+k0q0rr1neGUjFgVwvUtnrrgkhz/PqWHJ7H8eIrjKftNaGK3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWb7NE8D; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWb7NE8D"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso38001275e9.0
        for <mhi@lists.linux.dev>; Tue, 19 Nov 2024 23:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732088999; x=1732693799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ADAiBeedYWACTPkLF4ktHSe1A6LE/OALsE7D1jHQRQ=;
        b=CWb7NE8DyonwlLhTYOK9Sj2cO8f9eBNrPB1pXmK7eWL0JfqWV0pU9or6RFjgfWJoTf
         1wybDUdWODrAJS8cJ7vSd2OnR3xAoiTwVhDmCLG88+F1snmA3QPjLpQtpI/fmZMlhDii
         naBTA/4RwmAu4gNKrnS0pyhWDGFQxcwj+8Ts7l9lIfnZMIcltqS/wi2zDpzjYGPPuEhv
         oGmEhQsAr4KGoos6KOG7jjkPvV+S2HOclt50jI0Ia5rmr5OGyFg3Lwcis3otRic7oIbr
         J4UjKWlbxAzMeA4ISmfzZNFfkqDbqrDFw3+ype2tLLwL2yW/bFsOcQVO4Ze1CvwgVkN6
         PR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732088999; x=1732693799;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ADAiBeedYWACTPkLF4ktHSe1A6LE/OALsE7D1jHQRQ=;
        b=Xs/tRusURlkqQ2tZ/n9q1JHMgFgEgQY4h9+i1elBZ/05nnVJ69yKXerVLjxMG7Hx76
         eRhE5FyWPGLP3b9hDuVHP4tL1337V0RmdbvchzXcdv7Y7UABxPfqUMmo+nicTe5cCzA9
         +s7M2WIWhOmbMIVMbIhVQvKsYNTm/lelzDarkgllqPM7yB2ww2M5eaxNUuXBN/Wz91QA
         fftHSHanvAL9I9umbwUHdtwL1f47pe3HuuvMdmSUT0VA2OumCJogINi5DVs0bWGHgjyW
         lHCTJqRaaiZizICN2ahbpkC/O+aDdJ6Ospl1qTg4AgC+yTI4FWUh7LFmP+Nd+LIwF+iH
         uXGw==
X-Gm-Message-State: AOJu0YzcK/5C4PD5D32DpEj0KyMdR6KQHt+rGLM5jGJRZob9S02fwe9C
	+anFFcSktKMIYH1ojMo1Iq2rR6HBeK4jjGlUtg+ewgs/vuku3ZQj
X-Google-Smtp-Source: AGHT+IHUNbdEnSLti9xQtj2itl2r2mUxBG8QH/AJ5zXNm30+7FCgUkIy5JoMHawNY0Pk0UTuQFHprg==
X-Received: by 2002:a5d:6c6d:0:b0:382:3afd:125d with SMTP id ffacd0b85a97d-38254b0422dmr1108077f8f.34.1732088999058;
        Tue, 19 Nov 2024 23:49:59 -0800 (PST)
Received: from [127.0.0.1] (217-175-223-153.dyn-pool.spidernet.net. [217.175.223.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254910e82sm1298974f8f.57.2024.11.19.23.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 23:49:58 -0800 (PST)
Date: Wed, 20 Nov 2024 09:49:51 +0200
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Slark Xiao <slark_xiao@163.com>, Qiang Yu <quic_qianyu@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>
CC: mhi <mhi@lists.linux.dev>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re:Re: How to add RTS support for wwan0at0 port
User-Agent: K-9 Mail for Android
In-Reply-To: <1d37efa8.4475.19347b9b39b.Coremail.slark_xiao@163.com>
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com> <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com> <CAMZdPi_MF=-AjTaBZ_HxtwpbQK5+WwR9eXsSvnvK_-O30ff+Tw@mail.gmail.com> <8d005972-6a56-42f0-ba9a-444a8df5d925@gmail.com> <1d37efa8.4475.19347b9b39b.Coremail.slark_xiao@163.com>
Message-ID: <F987F2EE-E2C2-46D7-BBD5-A7632C4C2CA3@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 20, 2024 5:59:32 AM, Slark Xiao <slark_xiao@163=2Ecom> wrote:
>At 2024-11-20 07:06:11, "Sergey Ryazanov" <ryazanov=2Es=2Ea@gmail=2Ecom> =
wrote:
>>On 19=2E11=2E2024 12:59, Loic Poulain wrote:
>>>>> I tried to add RTS signal support for our AT port of wwan device=2E
>>>>> Now we can know that we are using wwan_port_fops_at_ioctl() for
>>>>> this configuration=2E
>>>>> Actually, there are 2 cmd will be ignored by default: TIOCGRS485
>>>>> and TIOCSRS485 when you tried to use "minicom -D /dev/wwan0at0"=2E
>>>>> Then I added it into that switch statement=2E May I know if the "mdm=
bits"
>>>>> corresponding to the defination in termios=2Eh?
>>>=20
>>> Yes, so the initial goal was to support 'legacy' terminal emulators,
>>> adding no-op stubs for usual termios ioctls=2E
>>
>>Exactly! IOCTL support is just a stub=2E You can find all the details in=
=20
>>the commit c230035c2f2f ("net: wwan: core: implement terminal ioctls for=
=20
>>AT port")=2E
>>
>>Regarding the 'mdmbits' field, it contains so called 'modem bits', see=
=20
>>tty_ioctl(4)=2E Bits are handled by the core in an opaque way=2E Core sa=
ves=20
>>bits from a user's TIOCMSET command and returns bits back in the=20
>>TIOCMGET request=2E Copying is done without checking any of these bits,=
=20
>>just copy sizeof(int) bytes to/from userspace and that's it=2E
>
>May I know if these bits (copy from user) has been sent to device over th=
e driver?
>So far it seems that we didn't receive these bits in device side=2E

You are right=2E The modem bits are not sent to the driver=2E If driver ne=
eds this information the core should be updated this way or another=2E See =
below=2E

>>> If I understand correctly, you don't only want stubs, but you need
>>> them to implement flow control on top of MHI? If so, I think you can
>>> access the port at_data->mbmbits from the mhi_ctrl port driver under
>>> data->lock=2E You may also need a way to forward ioctl 'events' to the
>>> driver=2E=2E=2E Wondering if this flow control could simply be support=
ed
>>> generically at wwan-core level?
>>
>>Suddenly the 'at_data' field belongs to the port structure private to=20
>>the WWAN core=2E And a flow control implementation could be tricky=2E=20
>>Ultimately, it's a nice option to have the flow control implemented in=
=20
>>the core=2E Depending on a number of users=2E
>>
>Yes, we need that flow control for these "serial" port=2E Currently we st=
ill
>don't have the NMEA support over PCIE(MHI)=2E Device GPS daemon
>needs such a RTS signal from host side to start GPS=2E

Thank you for clarifying the use case=2E In this specific case, you don't =
need all these IOCTL stuff=2E

If the device needs only DTR (device terminal ready) indication then it co=
uld be done way simple=2E DTR in fact is an indication of the host readines=
s to receive data=2E The WWAN port ops already has port open and port close=
 callbacks=2E I believe, the driver can use them to indicate the host readi=
ness as soon as user opens a GPS (NMEA) port=2E And clear the signal as soo=
n as user have closed the port=2E

This were good news=2E See below for so so news about GPS ports=2E

>Windows use GNSS driver(not same as Linux GNSS) to support GPS=2E
>But for MHI device this feature is none, I think=2E

You are right here as well=2E The WWAN subsystem doesn't supports GPS port=
s exporting=2E There was an attempt to implement it for t7xx chipset, if I =
remember correctly=2E But the author have not finished it=2E

There two tricky topics=2E First, a GPS port is not an arbitrary serial (c=
har) device for the kernel=2E In Linux, there is a dedicated subsystem for =
GPS/EMEA devices and the port should be registered with it=2E

Second, strictly speaking, a GPS port is not a part of WWAN device=2E Yes,=
 navigation receiver can be implemented as a block of a modem chip=2E On an=
other hand, GPS port have nothing common with cellular network=2E It doesn'=
t reveal connection status, and cannot be user to configure the modem=2E

So, the first big question is: should we export GPS port via the WWAN subs=
ystem or a modem driver should do it by its own?

Loic, do you have any thoughts?

>>For a single driver, I believe, the most convenient option is to=20
>>implement everything in the driver=2E E=2Eg=2E introduce an 'ioctl' oper=
ation=20
>>to the wwan_port_ops=2E And, if core sees the 'ioctl' operation=20
>>implemented, then it will forward all the IOCTLs to the driver bypassing=
=20
>>internal stub implementation=2E
>>
>>In some moment in the future, we can implement a generic flow control in=
=20
>>the core=2E In case there are will be more than one driver requiring it=
=2E=20
>>Is it make sense?
>>
>
>Exactly!
