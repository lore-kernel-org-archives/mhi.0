Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA302C80
	for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 08:18:31 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso24951000pjk.0
        for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date;
        bh=O2LOS9GzbC4z/iqV70cxFjAmSLO6Aw6vj3s0xm+V2V8=;
        b=C6UI52aXnJK5jNmpaLVmCIKsSYnHS5UDZQd5oi9BNmTJjzjUmeiII3tY/8S5k68+YR
         79Zle6H2ZECQyHVTX9+GE2bKpsmT0To55cTImwKylfYUmzqmxph47z27n9b7BoXFCv8m
         zziHeaGBc6HUz4rQDGnM3ySROmzFNwugifjkqYPx/zlxIyTi2mWk5dekrBBbs7/XzyCu
         tpQuzlqzY7afWmi2/eG4zKEdSnCcnVgOR1n6fJrNqKKmw2+6WL/1dj4SYO0rJzTg9ABC
         ivnLF9h8ZxvYGAXwvqXjwGYU0e3UhP6YnGgyq2FLWHIrjpCOVpkJlTkrA0TaiUPJVsCz
         Uf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=O2LOS9GzbC4z/iqV70cxFjAmSLO6Aw6vj3s0xm+V2V8=;
        b=A7QwckxC1TjhqMGfuqUIxiqSLS1gVXO17fJbiIFArkTY2kTkQWaCc5mU233XrQAsub
         3egbOvhwD+WNRy0/fQh7EU7fHrVs6poZCv6i8+IH3nPrLnwNWlPjs698WWFhitUgI49T
         RDPLC7Zo8+PKhl5TpNkeqWQ8o3+WDZIcoKj5q0xd/7ac4a5ZY9Sd+hjTE36EZhVeUAFQ
         5ry/qVDaUASg9I0ugByrPvecleVDkpXDanxDqNcAjBIjLT5DaTheBDTlkxgV10/iuYi7
         MaPGKROhcV1fhmkKMiNozAGf238TUvGV4uNN0Per/xF8cXHYZ2y0fdUy8/VgV76SPTGJ
         2+pw==
X-Gm-Message-State: ACrzQf0ECtXToR1W6OoKtypfPnj7C+qPe8wxbWnfSLfkVNBAnBcd0Uno
	mcy1+rkcbp30Q0UxLtAbHeqX
X-Google-Smtp-Source: AMsMyM6Zw7LeowehJPl3fqZ4Hw7uLSI/4aDlFsSPxs9kifWPiu5nFKG9k0W53e5AQvG04pV0fp3NhQ==
X-Received: by 2002:a17:902:d2d0:b0:178:329d:a5ed with SMTP id n16-20020a170902d2d000b00178329da5edmr3666099plc.142.1663316310938;
        Fri, 16 Sep 2022 01:18:30 -0700 (PDT)
Received: from workstation ([117.217.181.92])
        by smtp.gmail.com with ESMTPSA id x127-20020a626385000000b0053b2681b0e0sm13901993pfb.39.2022.09.16.01.18.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Sep 2022 01:18:30 -0700 (PDT)
Date: Fri, 16 Sep 2022 13:48:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: quic_hemantk@quicinc.com, mhi@lists.linux.dev,
	koen.vandeputte@citymesh.com
Subject: [GIT PULL] MHI changes for v6.1
Message-ID: <20220916081826.GA11659@workstation>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.1

for you to fetch changes up to e4e9631b2c8886be172f99bd29f326ee56adc2d2:

  bus: mhi: host: always print detected modem name (2022-09-16 13:38:25 +0530)

----------------------------------------------------------------
MHI Host
--------

- Print the modem name while probing the MHI host pci-generic driver. This has
  been exposed as a debug information so far but on a low storate embedded
  devices such as OpenWRT based products, this helps in identifying the
  attached modem without enabling the debug logs.

----------------------------------------------------------------
Koen Vandeputte (1):
      bus: mhi: host: always print detected modem name

 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
