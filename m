Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793672913;
	b=iuhHXpFSoYPrWSyZW86SKVlbsOBH1Jq3tpVzWzFuz25+lO04T7kaSspjrqcAgpCBlv5g
	 o91EbD+Ze88qwcAq/omTfxBivwOK9yeUdkp9jpVsskAWV5xr7jxETOMrB0VOR1Q10H8MK
	 Kqf2756D2WHYKCmC+mRnekwNkbTGKrvMc/h4GdjsfUs5Q1XhQDrevFja8NbzXWDjmfGmV
	 UTU8g2noe1sfm1mKnuHCxqIlthic771j/SYR2Y/dBglSlcmt+RVRO84nSvZQGPwYZP2+a
	 TTc2PSGeZ/AW80tmmUtV39uYiRZnhTiRf/FiAiCX/ocezHPrSOU0b34wX8dbzefPEOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
	b=IIlW0KuTkpxc6r/LaN4/euGZvG5neimlN7tLUEORioXSWPkbBP4zg8Jp033SBqcl+nn9
	 zW3YlDcjOI0rkKaRktsnrPcIa8NIeJQFDEzEmWJ94gtN03U/jndmliaKGA4LrqYYnbEjN
	 FUMVvu4VmFIztSttdmR4Jcm1msu8bitb4cZHQpe3ALeAwo3gVDgt3ZHpqaE0dZb/DiiGa
	 BDPQF+k8D2Ko8K9FKvTWNf5EBDO0JELEU7ZXNUYnLYNTdHUt1wrLOLgDN+H5mepyD/fhO
	 hZHtZWIfwVhxwCibd2BwFu7ukSv7zEkMp6+UYhVBfwr9ekC2mmevvhWqe9UsUkMDk6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JT5MzvJo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757D606A324
	for <mhi@lists.linux.dev>; Tue,  3 Nov 2026 02:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1757D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JT5MzvJo
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53c4b82919fso57957211cf.0
        for <mhi@lists.linux.dev>; Mon, 02 Nov 2026 18:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793672912; cv=none;
        d=google.com; s=arc-20260327;
        b=gH4VYRaBhXYVDP30POeAo9f5O0aLkXgeW+KMdRi2ITLLx5v0FFK3+7ZGrv8ODesDkf
         KiddFjO1UuKLP1g246goC9LIdnKZx4tzI09mluDPrxL5znbJ09ralp1zNDKihVOnwBnT
         yJYwq2Xg53rGqbbPxhkLxwGAl4idHj/WvLcTCcFmDs2IxAc/T+3i7DOWfWAxrLGpMA5c
         amqdP/Fqa9t1sCO0hOHHzanbvnD7rqiEnCyF/Pz1k3LT4yiJ2kW6jtKg/cpTmLyUXLmX
         wJ7LeExLEMe/892AWZdui1EAmaqNSXVFZ2PKK5DiQtsA2cYLEDnCvbhjXnGsEu9wU2wl
         ESrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        fh=SjwkO2+cPoWy+0r6MCJTLteWP/JqAuwepOZzMenTVv8=;
        b=aBgLch7eIH1sC8kCU7BA1WtwF3Rrx1VY4dhc/TivL84d8sKYCodGIk4LZgnNa/ulhz
         m7qxHU6GdrR+mq4UDGmFI8MPlc01oa1uzvoPeZd+2Ma7xrlm2n0IAeBzgEEjZzSU8iOy
         eLFzDly705SgthWZvMlgVWbrf9/ZCLqz5j9QPijIv7fx/6GUjOVa8QDtmcuAkUeH6D2T
         oh82eFmh/4OwVC9SSE+b9+wb7LSmMiyVsr/nRTP/AdQ9kouNUofqq0nqYKJKdzmFdQXo
         dZ0pxvLFi+yLeJRsQv7GdW3SZKT+6kjvSp+3Xt3UtT+tOh/OPqHpj4yXvoklWZ6lOum0
         zZPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672912; x=1794277712; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=JT5MzvJo2qD1t9cei6j7iAA2KVMx+Lpj4OIFVk2b4GMro6sKezKo5xovIi0t+Fe5lC
         Oc6i8T9XxP2tWw1uHwyiIiAzMWY4u98Oa2Si+YLZLn0OQmsRHh0YsbgDwHACpMGROtOU
         r7OHXLhK+ikKm5B7seIC6HpPvyAnXI9FVEP2vh6j9y6CEA6GatDStBa129f13mg4OMcQ
         Iftkw5zCtXwYUie0vPS8uicFCH7aCxCaG/wYVjG1atjUJh+jLbX7X4M9zORBxPZsnaIr
         +69Reua6q90cGAvkb/fVl4dhsEu6gikkActTXBPlUhKSuXR9bwx07TU/LcfYx/d7Lykj
         ugZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672912; x=1794277712;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=wK08KVQySgW+H6MB4marNkPPDBlPVjLizDmAw2rkENU9qAM2g3O4YGTTuPs4Y1yQz9
         Nfu2QLSbgN5co4dztoaMyc9IlZk9A+ptEVLExlUsAtGhJ5VQ99PzuzbPVkVcPwr9mmaU
         KU7cGfTO+k36ZcnA1o81WtjpfFXNkFPK/fdbs/OIGFCjSVWavUNk8NPd3GhvDQaT2fnv
         TDdWVqFTFHEw7SRn+FvxF5QTEiUd+b1j2ssTXuZcp5u2l8xflCNsJkRuVTeaCDtVDpnT
         NCYm2bVDvccZ60UfUTtli53KDPofvGVn9kaKtDRgN6K9kdo+zaheNgP39WGTncGvVmN+
         H81w==
X-Forwarded-Encrypted: i=1; AKwUvBz7PJ3vLWK7ZJmC3XSZsYyh0MHQ/oUzLxxxAIzg1j/+J/6XuGQrRAUyv+b8etlgKm4XpDM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9L/4rkEjZ+JyKWkVWyDIYsVg6MGJdMQ8mD6MGBpaXOi03f2NXy
	UmBBacHyDNvgNU7HcZcWfaZF/LE4qKrOvFkW8X0VyzFpckLHgTE3TxiKc9ahRFLJV6mf5XyLpqo
	32UU3SCxA0Xlb0sclj9Wx4satPCMcyaE=
X-Gm-Gg: AYBFou3WPiWRQCPZd/Iy6bkC1kE/pcJDge9rsyyOSlO/5/JaCbPIH6BwAlmWbxr9PaT
	rKmDPtoWNQI8ni+Z5pSkYiD8A/XgrN6m2SAXNLvb46Ethq9tz9Lmy5uVrslUAx+Pmsd4qgCBZ2Z
	XAeG95bUY1/PIEAggTdyZZOk31LEWTYDYBPE+HQgtvMycJvO7csesIvll9cgJN4WOs2/8Dld3+4
	7CwB0+4m0k4jf2Q1AcQ+Z4f87CAgeubFJ8V9biZZlwdiTAazvfeg4FRTSAZ/QHhsrJAcmNxj+uU
	BaLQrCYYHheY6ffyqp6AUm79jNmu/y6w9yj5y/6VnQrwkd5s7zdafZB+KcuDzlAv+n11CkFO3rD
	6MPkwT5ENyqRJ0mRkpCYR6XKM7X0Tl3sM6i3AtEruRFy36zg2ujn4HCAq50kdKIsHQjlh7we+CC
	zS7tIDra+BmFdnS76wUOHN73su0Hqbfh5saFegV/1jg1+I8c7V23zkDhnM5jvdel1C62ZtG8g/g
	QvFEdgat34rMb+OJ89P0mapmA==
X-Received: by 2002:ac8:59d3:0:b0:536:3a49:f76 with SMTP id
 d75a77b69052e-542b62a60f2mr208129931cf.27.1793672912039; Mon, 02 Nov 2026
 18:28:32 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:28:20 -0300
X-Gm-Features: AclHuK-mWSKXd9lnXqiSNJlntbzfXiWNAcEZqwA15ieqTiGdj9OVEQ3Jtku0h9M
Message-ID: <CAMAsx6dwZVCVQpfh9DYVU3NoTrsbRLOiORdMKm3Yo-vQLmpyFQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: kishore.batta@oss.qualcomm.com
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com, 
	ogabbay@kernel.org, mani@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kishore,

> +| SAHARA_MODE_MEMORY_DBEUG | 0x2 | Memory debug mode. The host should |

Is "DBEUG" a typo? Shouldn't it be "SAHARA_MODE_MEMORY_DEBUG"? The
rest of the document spells it "debug".

> +| target. The Sahar client interprets|

I think this one is also a typo, right? Shouldn't it be "Sahara client"?

Thanks,
Daniel
