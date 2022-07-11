Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679801FA6
	for <mhi@lists.linux.dev>; Mon, 11 Jul 2022 06:26:39 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id o3-20020a17090a744300b001ef8f7f3dddso4027738pjk.3
        for <mhi@lists.linux.dev>; Sun, 10 Jul 2022 23:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=kjU9s3R+y4mplIvMosu0IUEgqf/cvyuhqr3ROR2sPQM=;
        b=YzM6Dxw43AgFHs0Ue5OJ6wIxF8EcnLy5EO/qWVm+447WeBLa50F7G5hwa6rRD3KPKf
         m39RNTgfFJtT2uWHYbXYfym5OtRNd0BkStoxvvR5Lli0YuIyKyz2n1E6XNMmEwCNfj/4
         Lloq+wv62eyYAd76hpI38oDSlocYZVMuMBgwFbino+K7+PUXGGnUAUzWty6IeaRGepVH
         zZJ7wipw7vM1w3D1UW+PuQwP5AXaDAw6pd4z/vRWb2KY5ymvmIbPmSxfryY3ID+sdfkg
         L6aE+SHyG6aAIsbdEcYIX/C/xYJQcIK6uSZaLN+1TA4tc68LoAgrw6geg8SrNYd7e8g3
         nESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=kjU9s3R+y4mplIvMosu0IUEgqf/cvyuhqr3ROR2sPQM=;
        b=iqaDeL9mbISw8yx3FrlMGrCr9sL6wG92OfSPMV7ucztBVXoo3nUstFIXLhiYpYmcDx
         qZUz4Pu1Z02dWoqHXJhnVK/iBLnzy5nd9+0UE4ZF/WAOtd55QJptcSYOaHYmG/ePNYbZ
         TkTlhAM3X6v3BfzJI6rCDF8cT5ibf1Et/u/3DJLYJz/xYLUjYSRTgdp5+ViyEaQ9eXo6
         9sWzAE7uzUF0xMm4nfZhYAuv+u5pIgOvu9ospzeswVlX4V3mCOYsTRsu9fU7d3d+DEFM
         bOckGB4ZX49tWb8r5HINud6bYHF/ixYryysPBaO4caF9+2zK4zO0ps4r+SJae8xiWYkr
         OQgA==
X-Gm-Message-State: AJIora90iiXylCZegm5IhM5bPeRt8G8v5ACaUutsxljnnCHqfQ+GYDcm
	Mbg95f6C5PacKl94inKfYPor
X-Google-Smtp-Source: AGRyM1uoUGzXwBZCYY9CA9cl3a6eY9y24qumS9WQo3oP8WfN/CUF/wAXrMGBZvXyhuKigIZsRtkI7A==
X-Received: by 2002:a17:902:6b42:b0:16b:f27c:1c17 with SMTP id g2-20020a1709026b4200b0016bf27c1c17mr16831916plt.152.1657520798772;
        Sun, 10 Jul 2022 23:26:38 -0700 (PDT)
Received: from thinkpad ([117.207.27.92])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090ae4c600b001ef82e5f5aesm3898947pju.47.2022.07.10.23.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 23:26:38 -0700 (PDT)
Date: Mon, 11 Jul 2022 11:56:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: quic_hemantk@quicinc.com, slark_xiao@163.com, quic_jhugo@quicinc.com,
	bjorn.andersson@linaro.org, yonglin.tan@outlook.com,
	loic.poulain@linaro.org, mhi@lists.linux.dev,
	quic_qianyu@quicinc.com
Subject: [GIT PULL] MHI changes for v5.20
Message-ID: <20220711062636.GS5063@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.20

for you to fetch changes up to 2ebb36ea41a7aaabacd03a48292ca91ed0306453:

  bus: mhi: ep: Check dev_set_name() return value (2022-07-09 11:57:54 +0530)

----------------------------------------------------------------
MHI Host
--------

Support for new modems:

 - Quectel EM120 FCCL based on SDX24. This product MHI configuration is same
   as EM120R-GL modem.
 - Foxconn Cinterion MV31-W. This product is same as the existing MV31-W
   modem but sold as a separate product as it uses a different firmware
   baseline.
 - Foxconn T99W175 based on SDX55.

Core changes:

 - Moved the IRQ allocation to MHI controller registration phase. Since the
   MHI endpoint may be powered up/down several times during runtime, it
   makes sense to move the IRQ allocation to registration phase and just
   enable/disable IRQs during endpoint power up/down.

MHI endpoint
------------

Core changes:

 - Added error check for dev_set_name()

----------------------------------------------------------------
Bjorn Andersson (1):
      bus: mhi: host: pci_generic: Add another Foxconn T99W175

Bo Liu (1):
      bus: mhi: ep: Check dev_set_name() return value

Qiang Yu (1):
      bus: mhi: host: Move IRQ allocation to controller registration phase

Slark Xiao (1):
      bus: mhi: host: pci_generic: Add Cinterion MV31-W with new baseline

Yonglin Tan (1):
      bus: mhi: host: pci_generic: Add support for Quectel EM120 FCCL modem

 drivers/bus/mhi/ep/main.c          | 11 +++++++++--
 drivers/bus/mhi/host/init.c        | 17 ++++++++++++++++-
 drivers/bus/mhi/host/pci_generic.c |  8 ++++++++
 drivers/bus/mhi/host/pm.c          | 19 +++++++++++++------
 4 files changed, 46 insertions(+), 9 deletions(-)
-- 
மணிவண்ணன் சதாசிவம்
