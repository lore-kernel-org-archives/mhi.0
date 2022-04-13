Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3DB28E0
	for <mhi@lists.linux.dev>; Wed, 13 Apr 2022 09:00:00 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id p8so1414750pfh.8
        for <mhi@lists.linux.dev>; Wed, 13 Apr 2022 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=EDhS8xYSBd2n9NcaWEWx6PW2TjEIoAofJnoHWA7XnG8=;
        b=O149Sk4abdAzjNa/FuuPlloSGGPPgYqriC+xrIg/TWImciJdOwE5u9tHyqdsYNzpNp
         owIKDOxTfXRUUXW2CAr0WeoyQ7zbMqwJY0L2NKYCANdvk4jh7zfjzMzrbDXKVqbY+TSO
         utfifiKG16sgBOGumS+6N1LFYgT10cdNxCVmqdr+zgw3niSv5RuZ05dmSAYAauvUzIiK
         hkSdt6zK9Z9xWsRsv7cfSu6XAB1oCnKGWp/YPG/SimnAtW3vPUVLTWVveKdN7xHc2n56
         WKtMhyIVv4ky+A5yC2cwh42X6Bjkdsjk5UhESz66JS91FxreEatR+QR5sO9x9yZQIUvJ
         ZKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=EDhS8xYSBd2n9NcaWEWx6PW2TjEIoAofJnoHWA7XnG8=;
        b=Y4H+VuSbtp8ivD1SR8wEaFVlIqnpOWx7Sfa4us3c4wSfWdLsBbh4+lJuvXJNFZBsE8
         lD8/XFBGtIA7B7prPlAg02RKK9m5WOHwxirx2/FRAJd5Jdxceqj33eHk0EciJb6MmfCt
         B7hhUX7A1QcoZrXoyX1bCJZHniNarQg7If1qOHX8TmXMuD15ca8U0ubgu+cx4mefAOgq
         15w55Yfw+SDtc24j6o4XvsLUu8v4hNeplT/qrSELxz9/wk3SCNufA3XVd+HQ+xJ33vnX
         I4zJpboezHA98Pyjltqe3YkZiBekPbi6+oxl6fsndFh2btPpGutm3rxV+Db8IVO9QGfP
         kiFg==
X-Gm-Message-State: AOAM530p2nHlfbFUu+Lct5Tx6Z9CBGtAAefwP3R+fcwC9AYVdUepD/9n
	fPxy+IR2/uj6BR8+ATEqkWX7
X-Google-Smtp-Source: ABdhPJwO2iFFLhBkrptiK2TCZlzOfrLJcUVHx+2oFFdkyWiG9hCOm5NrUnrAD4xSViZlk/JVFd0Kgw==
X-Received: by 2002:a63:195f:0:b0:399:1f0e:a21d with SMTP id 31-20020a63195f000000b003991f0ea21dmr33848070pgz.393.1649840399909;
        Wed, 13 Apr 2022 01:59:59 -0700 (PDT)
Received: from thinkpad ([117.207.28.99])
        by smtp.gmail.com with ESMTPSA id k23-20020a17090a591700b001ca00b46cf9sm2172266pji.18.2022.04.13.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 01:59:59 -0700 (PDT)
Date: Wed, 13 Apr 2022 14:29:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
	loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org
Subject: [GIT PULL] MHI fixes for v5.18
Message-ID: <20220413085954.GE2015@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-v5.18

for you to fetch changes up to c38f83bae4037023827c85e045841d0421f85034:

  bus: mhi: host: pci_generic: Flush recovery worker during freeze (2022-04-13 13:11:19 +0530)

----------------------------------------------------------------
MHI fixes for v5.18

Couple of patches fixing the hibernation issue seen on MHI endpoint devices like
SDX65 modems:

- During hibernation, the host puts the device into D3cold after thaw() stage.
But at that time, the device would be in M0 state. So the device emits a
warning (not visible to the host but to device firmware only) stating invalid
transition. This is fixed by adding a poweroff() callback that puts the device
into M3 before D3cold.

- There is a possibility that the recovery worker might be running while trying
to powerdown the device. So flush the recovery worker before that.

----------------------------------------------------------------
Manivannan Sadhasivam (2):
      bus: mhi: host: pci_generic: Add missing poweroff() PM callback
      bus: mhi: host: pci_generic: Flush recovery worker during freeze

 drivers/bus/mhi/host/pci_generic.c | 2 ++
 1 file changed, 2 insertions(+)
