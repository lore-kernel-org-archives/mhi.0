Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A41C10E8
	for <mhi@lists.linux.dev>; Mon, 11 Apr 2022 12:39:24 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id v4so4706049edl.7
        for <mhi@lists.linux.dev>; Mon, 11 Apr 2022 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ud08G4s/0xjBy6Vv4C3jyp2d/2WCW9Z15cTVyED8BKc=;
        b=oAOIW4z3DcQ4J+Ql7KHgqtzw3+pKUPC7cpD+7xpymzdsGwvSaTmGEiNYL2PkWK8jo1
         lIK6flFSiDB+bVC0erzxMvJ5hiRhVOH7v5NgTfmygl/4USPlyr4BLpgAVv4JcW/oVmFa
         SM5VFQbf/sALbUd4FOrS5tKrOp1ZM2JXdkMidunSGOHNZYEAxqWHMG0N+x45H1c1pCwF
         EYEVThL665B7y2jrXTyDnKCKbp5BP7YvXICJaz45ebjwUSi2uILVdgSnW0qOYHbYkYyT
         Uovkv5zGkRbkP59Z9gXhCdviBPUZmSmtmZA1mlLSeKClDOyy7+1bFyKAgEbsf6S3b85M
         7c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ud08G4s/0xjBy6Vv4C3jyp2d/2WCW9Z15cTVyED8BKc=;
        b=V82lEw6+ZPRtOb0e5OAscGBeXr6od0HZ853oW5ibPc6u4p4rPUg6Dym3vtM9qcpjxs
         6e1zKHM04AvKrkNts9q0JTy+W1ReCjRkzmXOvZoSw76HpfSImInuSpSQhWd1RARkj64+
         /zHukHW2wTegNAMR6KLXDKTGPgkGpGOljz1ZzsP62Z0DKw68PR4C/zoVhxYTYSpmQ4wW
         mmXptdRF0lWW/VJgRfSJZCKz7d8HxvsSOhUnSy9JbR8afsBov4UW9InL1n/LReLUdBbI
         evkNVvbVkZlOjNrU2yruTxWCb/hTIMOjKA/DEYJD9n1WlCyEwS68agAjY7exwxXQVjca
         RG7Q==
X-Gm-Message-State: AOAM530iIHZnws3VvkWUaluKp9tURkWo7OnH5JEOlPdBy/Om8IRzmmTS
	XwdDAVoxdyI6DEKNqR86R10=
X-Google-Smtp-Source: ABdhPJyKXVNmQUBaNyN3MN5SEMx8A8Il7pcI0GIX+S0c4wogac6dfMFHedHThQkRv9cnv1j16He+DQ==
X-Received: by 2002:a05:6402:54:b0:419:9b58:e305 with SMTP id f20-20020a056402005400b004199b58e305mr32680114edu.158.1649680762381;
        Mon, 11 Apr 2022 05:39:22 -0700 (PDT)
Received: from ThinkStation-P340.. (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090679c300b006cf9ce53354sm11898283ejo.190.2022.04.11.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 05:39:21 -0700 (PDT)
From: Daniele Palmas <dnlplm@gmail.com>
To: dnlplm@gmail.com,
	manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org,
	mhi@lists.linux.dev,
	quic_bbhatt@quicinc.com,
	quic_hemantk@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Sort mhi_pci_id_table based on the PID'
Date: Mon, 11 Apr 2022 14:37:15 +0200
Message-Id: <20220411123715.3640935-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411054831.16344-1-manivannan.sadhasivam@linaro.org>
References: <20220411054831.16344-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mani,

> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),

Shouldn't this entry be after all PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306,
ones?

Otherwise will it catch all of them?

Thanks,
Daniele
