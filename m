Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156E4699
	for <mhi@lists.linux.dev>; Mon, 29 Aug 2022 17:17:54 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id n65-20020a17090a5ac700b001fbb4fad865so9221581pji.1
        for <mhi@lists.linux.dev>; Mon, 29 Aug 2022 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=DiLkstIXq8DyIP6HhX1ZozUynqNQLPq1NrMHtVydxyg=;
        b=sC56IWQLVlsWEUPul4XTzt/jL8m1Vk4YULWUWfEVQpukkn0iNmdxc1H8cHUPIXFQ15
         xZJ/o/dczSW9Y697dJaBY9QatMQ0OyKHp+fCk05EFx8EkRUHhRioUI0GsE48B7Fsa8YM
         8bpm9Xi0Se6yZLtmPo4GV3AOq12lm4RoT+/ss+vx5Q9W4WW3bHOX+rsMDOAXuQ8nwJnE
         pBMJLufVlrRhvjcKCDK+a/qzTyzeHnZTZ8TiW9PDY8oObI+66S+ZrV/IJeUQOPr8Nk1D
         +HWjiWaD+8el+5C2aIH9Wr1Ag60dok8NcKfiaK6k2Atkdou1bXQAMflCivtdh0lc7m4K
         H5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=DiLkstIXq8DyIP6HhX1ZozUynqNQLPq1NrMHtVydxyg=;
        b=qaOvdgJ05e09kUP86A8OQsAf04lWRWSS3pIuMeXQc9tAGOSclY9x4LpIRlvWRh6Z/0
         FBWy5NnrAAPGuapOps6k1AzC9/KaUXCU2gl+XWYgZwJBwh3aulH8kubcZtXewoEMzMQ3
         22pW+pc7CdG+22n/2cMGo6cD9KkXxiKcmR5P+3X2U87Gc4wAIP3Q/BMA+Unypps/u9+E
         G12YouixNMDbxcxzgue5YTyJNbI6f7p2Pb6c6VetPe5TOCbxPDpmPUej3JNHomwpLZdz
         UwHRqsJ8f6UxBVtoC/yS6xg0JPWuG7OuLMjXXCg72QsbQxALPG7HQ/H2d5lAr7JjBP8R
         pNMQ==
X-Gm-Message-State: ACgBeo1DKl4HtI9kBAyPACg32FSdkibDhAyfrafWwQRXuU8GrCMj00To
	ZNwsDg0OZxMLr8t0nWvM7mxG
X-Google-Smtp-Source: AA6agR6e2gsuqcTsolq5lN8sraWrqgRFrwqvWA6hF4HTqekOI7HE3UmO4u2KScEcjsOVnHww0rzR6A==
X-Received: by 2002:a17:902:8ecc:b0:174:3c10:542b with SMTP id x12-20020a1709028ecc00b001743c10542bmr16455090plo.91.1661793473685;
        Mon, 29 Aug 2022 10:17:53 -0700 (PDT)
Received: from thinkpad ([117.193.209.245])
        by smtp.gmail.com with ESMTPSA id p63-20020a625b42000000b0052dcbd87ae8sm7554014pfb.25.2022.08.29.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:17:53 -0700 (PDT)
Date: Mon, 29 Aug 2022 22:47:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: quic_hemantk@quicinc.com, mhi@lists.linux.dev,
	ath11k@lists.infradead.org, kvalo@kernel.org
Subject: [GIT PULL] MHI fixes for v6.0
Message-ID: <20220829171746.GA84334@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.0

for you to fetch changes up to acc5495bf764e7e441193f972d96c5d2887f6b8b:

  bus: mhi: host: Fix up null pointer access in mhi_irq_handler (2022-08-29 22:33:46 +0530)

----------------------------------------------------------------
A single fix targeting the MHI host stack:

 - Since the commit 1227d2a20cd7 ("bus: mhi: host: Move IRQ allocation to
   controller registration phase"), the MHI context gets freed during
   mhi_unregister_controller(). But when the MHI IRQs are shared, the IRQ
   handler may get invoked during __free_irq() if CONFIG_DEBUG_SHIRQ is set.
   In that case, there will be a null pointer dereference because of trying to
   use the freed context struct.

   So for fixing the issue, let's check for the existence of the context struct
   at the start of the handler before handling the IRQ.

----------------------------------------------------------------
Qiang Yu (1):
      bus: mhi: host: Fix up null pointer access in mhi_irq_handler

 drivers/bus/mhi/host/main.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்
