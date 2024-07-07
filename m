Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA3F2E64B
	for <mhi@lists.linux.dev>; Sun,  7 Jul 2024 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720373051; cv=none; b=j8oroepa2P6WOwuaOOYkdg01PEURzj0xNCYJR5Bi2OajweljBn2xjq7Nij/O6yGI73E3X+gxngGdXjyv0sH5kz0bMma5kXq9WGzcyXg6w+WXchA9wOtgkPLznh23n4lyGuGoCqsRUkF4BW1ss1Aet8ATM90Fbd9wfXlb3BnjKeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720373051; c=relaxed/simple;
	bh=Hx2xM1rqGHMvir/V0U948DENMy/SkXgdbxG8XNPdwhQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=a/28R32dL/G5J4wQNW4QzNSYhFm7xmbV7GOGkBNHVUPqbygZDiVsagdQ0hUEB0+6WWrekQUGxAVIQTsTUIl5AMuVbt4vHRNi5neMXaLnZYlsd9/VBjUFwdcwUQvv4HagSOBkJi+AF742EysQXj9e/u7j4SDZodydWTPTAQzUke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncYUx8kg; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncYUx8kg"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6512866fa87so26449507b3.2
        for <mhi@lists.linux.dev>; Sun, 07 Jul 2024 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720373049; x=1720977849; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hx2xM1rqGHMvir/V0U948DENMy/SkXgdbxG8XNPdwhQ=;
        b=ncYUx8kgID2aerwYDZdugy6SlZaV8vtveVHGj/FFI1DcoPCsF46k1mU+eWmWYdPsb3
         +iR1DJnFpcsVl9xzDmPWVn8eytAXG387iYoAaQtDTfpbo0GNKP3Fbp4rHBfSvmzFuTF8
         FMGSAoTkZvCcLZ4XJNFu9ftzReSdpSYcr92iJs6cB2k0NSo38uJkFRKTOCyVye33HELA
         5rSWXKjB6t64FdxWmOPJ3ifESn6yJ9dubNg8/ZJWtXtPYiJ9e02/gDqkWflMVJpB0owF
         UwAzpUQ55qIZd2l6UOrRkUFgLd81eVTZFE4naJeS+CJgUC1ZQi7er2U7SLJ/XDp5JRp6
         7kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720373049; x=1720977849;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hx2xM1rqGHMvir/V0U948DENMy/SkXgdbxG8XNPdwhQ=;
        b=Yf43T2j+6oAiyKzq1Eu19jhZq5SyBdc6hm/PoLOEo19TkGzlqzR3COZITwGLt+/eNq
         NgJKSjTugx/jxXKQXPdOVKjjuW31m1OWVoQY3eN3nAJy1LGpVaIqt0t4KM54Y3P2Y96E
         Os9XPOZYOa6PhVG7cw3Nf4T/1SOm/slAJoAnBdkW4zH0ACe9T+tUS0dBIQIs9Cb44rQR
         MefDS+IBkU/vXOG3g8Uk63IpJhvsuw/04aX/2PcryczzopeNyu+EHe5hB5I2rKzlO+oY
         r3bwECfsXA5oRrN4S7YYex4wYZoYfv+6aV8tRKsN2N30Ulj3eND/uYMs1/0gNikKoOQo
         bZbQ==
X-Gm-Message-State: AOJu0YyXGqllKTtl4Odsgs8pKSO1DVCII9lNFv2Q4PLob+3H9lqvpfS2
	DEG68hPeekwRDD7PmzhbrcRO4os2QNHTjSY30xNM9PPszH3AXrYQPdLRzjIPKiiMn2gIvCT0/kE
	fNwPpwDo2gL02yYOB+g3XbduU4mI=
X-Google-Smtp-Source: AGHT+IHHYn2FQi9vOvfTfC5QSAfkJxOgfmkEfW/y7UcNAv+LsU4FB4ia5IQykmBinzJqEwyWDHY83qYkb+wM19wu2HE=
X-Received: by 2002:a05:690c:3511:b0:651:8337:f094 with SMTP id
 00721157ae682-652d5dfe018mr97451947b3.21.1720373048814; Sun, 07 Jul 2024
 10:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Murithi Borona <borona.murithi@gmail.com>
Date: Sun, 7 Jul 2024 20:23:57 +0300
Message-ID: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>
Subject: [PROBLEM] bus: mhi: host: pci_generic: SDX24 Channels
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Module: Quectel EM120R-GL

This module does not appear to work fully with the default SDX24 configuration.
It appears to be another variant of the EM120R-GL (Also FCC-Locked by default).

Issues:
- Debug ports are missing (AT)
- It only works over MBIM/QMI with Qualcomm's RMNET driver.
- In QMI mode it's really unstable and unpredictable with the QMI port
freezing up.

Are there any missing channels in the SDX24 config or is this a hw/vendor issue.
When using Quectel's drivers (and blacklisting mhi_pci_generic), all
the ports are available.
The configuration for other variants of the same module brings up the
AT port ( with a recurring warning/error).

>> [ 5074.472791] sequence number glitch prev=1 curr=0


mhi_qcom_sdx24_info
==================

lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
Inc SDX24 [Snapdragon X24 4G] [17cb:0304]

ports: mhi_hwip0 (net), mhi_swip0 (net), wwan2mbim0 (mbim), wwan2qcdm0
(ignored), wwan2qmi0 (qmi)


mhi_quectel_em1xx_info
===================

lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
Inc SDX24 [Snapdragon X24 4G] [17cb:0304]

ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim), wwan0qcdm0 (ignored)
