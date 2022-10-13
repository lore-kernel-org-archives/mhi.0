Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13520F8
	for <mhi@lists.linux.dev>; Thu, 13 Oct 2022 07:07:59 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id d26so1876189eje.10
        for <mhi@lists.linux.dev>; Thu, 13 Oct 2022 00:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB0ydcgvCSWAdvBJD7DwCSbpPowUa7zQXcGO4Ybks6k=;
        b=b2Q8guHNkvCLUlO7h6gBVnmEJEC599xOVk7SOK8/sdWk0bDY/fpuGt0cFni29HWkGd
         vuEAeeytssn+oF0+bQWzMIYGB4I0hV9BXbF0qgn+/CY6awawQ+FhWBDAKlV3xT/PCi/E
         s3ePWaN+ikkBNHl4U07Vh/TYMJtNOO8GyhLrnedpUPb9KR/vHHV8s82rxQQPfZh4abxK
         RnfnXbhwezSYTZI5q7dfimNtiEM1qrvtaYkBuid3uC5elCUGPmpXQ0EAHtw49x69CQNO
         ou1JlZbdPH71HyYcyBK0f4oUuF+PAqHkTKf7JXitUgzAZmuCKQ881iPcHBZm3asuUq5n
         BsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kB0ydcgvCSWAdvBJD7DwCSbpPowUa7zQXcGO4Ybks6k=;
        b=ve17/d68MQCXU9uZYSSo1A44Exnq5sWIhFqAEy9qRtakvlhiNX6r5FlELHMUK7TXN2
         msLfTW/TXqam9/0WDwvfuSi6UNvtEZUKPbZ0TLUFk5MIZqnBuRrhe1B604v+EOzmL/NP
         b4n+tqhPHQjen52ePyCMy8BgjAaJG4DaNVwkGVLyaErX9nN3xDUA0js7lKUpoHC4CsmH
         HIFxSvH8v0REAjiGCw0cUqpDFHX2hb+l4eKM+MfAfe52sFhx5Pe0sGe+8PlO6zaNlL/P
         IWJ93X4JPv2FXwIe0Lsom8Sc+WLVOk2Wy6KY+CWyWUjN9TNcptVOe2tWigaflruSjAzD
         6ing==
X-Gm-Message-State: ACrzQf2mzXoRqRFvk6cxuX0pT58h996/SFHZMW5+xwZBsaady5LvhpQ+
	hgDpgNvIJD+XoWQJANZjkFl0OkBHsDraJRFlw3hYhA==
X-Google-Smtp-Source: AMsMyM66BPJFJSNhWTtWRh+n4ocqHmvOGvRAcl9i5y4joaGgUPGw4PwENz4bHc9VtmwHkr1315u1n+/vgXAXCLC9nZ8=
X-Received: by 2002:a17:907:3da5:b0:78e:793:4084 with SMTP id
 he37-20020a1709073da500b0078e07934084mr2036938ejc.285.1665644878099; Thu, 13
 Oct 2022 00:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7ac21c73.2acb.183cf5fff45.Coremail.slark_xiao@163.com>
In-Reply-To: <7ac21c73.2acb.183cf5fff45.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 13 Oct 2022 09:07:21 +0200
Message-ID: <CAMZdPi_9t-8qHQep87+sfVrWVUJ3-xo0TFY+q4gxFRr18fmMNA@mail.gmail.com>
Subject: Re: Does MHI driver support DMA remapping?
To: Slark Xiao <slark_xiao@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, "quic_hemantk@quicinc.com" <quic_hemantk@quicinc.com>, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Slark,

On Thu, 13 Oct 2022 at 05:25, Slark Xiao <slark_xiao@163.com> wrote:
>
> Hi,
>   I have a question about the DMA feature on our MHI driver. Does MHI sup=
port DMA remapping feature?
>   This is the reference description from Windows OS:
>
> To ensure compatibility with Kernel DMA Protection and DMAGuard Policy, P=
CIe device drivers can opt into Direct Memory Access (DMA) remapping.
>
> DMA remapping for device drivers protects against memory corruption and m=
alicious DMA attacks, and provides a higher level of compatibility for devi=
ces. Also, devices with DMA remapping-compatible drivers can start and perf=
orm DMA regardless of lock screen status.

I assume this is all about IOMMU? then AFAIK it should be supported by
the driver, not because the driver does anything special to handle it,
but because it uses the standard dma helpers. So if there is an IOMMU
in between, indicated in e.g. devicetree or ACPI, the different device
IOVA spaces will be managed/isolated automatically via the IOMMU
layer/driver.

Regards,
Loic
