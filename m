Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DB5C83
	for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 14:43:36 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id go34so49940596ejc.2
        for <mhi@lists.linux.dev>; Fri, 16 Sep 2022 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=LKoaZ5We1TGLeFod6UTJMH7q09dtJndCh1W2gfaDfzM=;
        b=FPZdopoGGaFUGRqTDSLf/mbn0u3wwg02p7UxOEwbSG5bvv6s1++oPirhDM2S8KDyD3
         Be4kaXWPqfFNLq2WkV+3glORMuZGdpg1KhtQloZrB3q+fLSD6ftqJGEgYYjBh/wBd3eE
         eIuCY02i9QkxVIJ4CbywRVkrJM2CNGcmWwjFWBY9/VggqGJEfPMkOg73aeUsYNqc11Nk
         BSpoheNWqki6kQX/hPBNjmaOV9wmEYoonf2nu8mYsDV4yu7o3NB1BDKYhzVXyVPip/ve
         8UoGeR9+5GsN6d3gary881TBLdzmIfsEcLA5ilkgjX6j1j7bK6TaBbXKy6ba9TUBhjZV
         NCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=LKoaZ5We1TGLeFod6UTJMH7q09dtJndCh1W2gfaDfzM=;
        b=TwE0nhVOz6djDFucN2R2U8qeM1Tj2OFgZFA74Ni0QI2Vxql0e1x92l62lYv0z0NnWV
         tixmE0Yr3OHARlog3M15K84pimurVyo/eSDC4P0U54gi0jKEWewSPOzam0wifCWuf++i
         q7pPGdc51ymYsSQquTGFOQRx953Mz09cdvd8CyJiPw2CupyGoIZ0TOsORYx5uGvJd/Kn
         dun1UeI1IU2fXrK7oMJr9ljKi3hnaC0g+GwODvjoxTVPfLjmATQ8H9GgFTpCQafCKdr2
         fPKpIKSX2DhUbfchCk+pQzoQEfjVQKgXdQBzHkTauEiympwRPTsivkUy3L0KJxmWWJBr
         2O7g==
X-Gm-Message-State: ACrzQf2dLC7vVb4TGs03h6+4Pq+kdnV9B2uRumQIqKK8j4TRK9A1nSEk
	CQ2qfpzqL3zeTVpmyAo1zbCqyN14U8EpKQ==
X-Google-Smtp-Source: AMsMyM7zIcoW0FRIFKPApyLHgN4mHUuTE5bIgYjHNY9NOwwKb46Fr6t/zkSgRGUmnFvAOxGKYq84kA==
X-Received: by 2002:a17:906:7944:b0:73c:838:ac3d with SMTP id l4-20020a170906794400b0073c0838ac3dmr3838252ejo.242.1663339414462;
        Fri, 16 Sep 2022 07:43:34 -0700 (PDT)
Received: from labdl-itc-sw06.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7cd0f000000b004527eb874ebsm6273792edw.40.2022.09.16.07.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:43:31 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	mani@kernel.org,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: dnlplm@gmail.com
Subject: [PATCH 0/2] Add a secondary AT port to the Telit FN990
Date: Fri, 16 Sep 2022 16:43:27 +0200
Message-Id: <20220916144329.243368-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to add a secondary AT port to the Telit FN990 first add "DUN2"
to mhi_wwan_ctrl.c, after that add a seconday AT port to the
Telit FN990 in pci_generic.c

Fabio Porcedda (2):
  net: wwan: mhi_wwan_ctrl: Add DUN2 to have a secondary AT port
  bus: mhi: host: pci_generic: Add a secondary AT port to Telit FN990

 drivers/bus/mhi/host/pci_generic.c | 2 ++
 drivers/net/wwan/mhi_wwan_ctrl.c   | 1 +
 2 files changed, 3 insertions(+)

-- 
2.37.3

