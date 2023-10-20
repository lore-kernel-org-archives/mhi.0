Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C61BDC5
	for <mhi@lists.linux.dev>; Fri, 20 Oct 2023 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ycbniLax"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so12607861fa.2
        for <mhi@lists.linux.dev>; Fri, 20 Oct 2023 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697810077; x=1698414877; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yO4uSYPAk6aiUAR/8DEzX+N1ZpAMBlq4fn7n+/LCCIY=;
        b=ycbniLaxbnn6lcBkmPSKJEP9N6skC2V3RPc6r+i2s/xzGVzQfxaH/DjLAWySaNHpk8
         R1psntNnGpks0X6v9trTZwx2PIk9R46QjQVBCWouJvee2R0KSlMw34Ek7Zd5skSsztWc
         LYpvPOd700kiZcuDgJpSeiuve6vpqHUB6VFR8ATSQjeibDbv7KiUtIRIlyafjLwfKPSV
         eBM2P4qPNDBvGGSMfyF25ISj+UjmoZWsMSXrrfs1V2fe2lMWqwu5RwFQcJ61PubtSpoQ
         v/u+du/LdANQ9+UDBjdD7pGlosifMCr6y0XPmbKJBWamVcNsidqHwA58PXgJWEQlCWh4
         gD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810077; x=1698414877;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yO4uSYPAk6aiUAR/8DEzX+N1ZpAMBlq4fn7n+/LCCIY=;
        b=A/vp/lFccP55av69LSvIPXHQXDp5GskybB2iZPa4rejn1T5TNhlHACRrKH1jW6IxPd
         QkHECFX2Bf2xl1hSCzENUAzeF2kywTkEbpdt8xGRqmeKbZaVUCihjeBlC02KjBNlgLjL
         sOok0ONk+m2mqwpFQs6QNf0FitgLhOUxHdActGmCw6UWSNxIuEWtPkdsEeTeXIF4E6y+
         hsDKFq3Ar4SW7gwoKvmwx2rZelgHLAFcXn4kXXDwE8G1uIutmGDt/OlCoedW6EkyLZAj
         /+Ni63zGIrUq6uA/9k2KGIIIv7UNb/2m3ShSCCBbPSNB3eoVb/OJuyyZDEUMPYDKmvCn
         IeOA==
X-Gm-Message-State: AOJu0Yw35dPg891JjzFDDBBANp8RVO/B1RoOgh/fugr45HYRQazrdZn1
	AD9WhtGqcdGhtYgG74os59T5Kg==
X-Google-Smtp-Source: AGHT+IEcl//isVNl8T5/pWxqwNlvAf3hKORnFiso+QYZ9LHwyisYdNMfQaM+qmZZnvDud2w3nIaOyQ==
X-Received: by 2002:a2e:a543:0:b0:2bc:d6a8:1efd with SMTP id e3-20020a2ea543000000b002bcd6a81efdmr1442762ljn.39.1697810077654;
        Fri, 20 Oct 2023 06:54:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c320900b0040644e699a0sm6998865wmp.45.2023.10.20.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:54:37 -0700 (PDT)
Date: Fri, 20 Oct 2023 16:54:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: mani@kernel.org
Cc: mhi@lists.linux.dev
Subject: [bug report] bus: mhi: ep: Do not allocate event ring element on
 stack
Message-ID: <e7d05eeb-2b28-477d-be3f-7f6e9ad7aec5@moroto.mountain>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Manivannan Sadhasivam,

The patch b910ee376ab3: "bus: mhi: ep: Do not allocate event ring
element on stack" from Sep 1, 2023 (linux-next), leads to the
following Smatch static checker warning:

drivers/bus/mhi/ep/main.c:106 mhi_ep_send_ee_event() error: potential null dereference 'event'.  (kzalloc returns null)
drivers/bus/mhi/ep/main.c:121 mhi_ep_send_cmd_comp_event() error: potential null dereference 'event'.  (kzalloc returns null)
drivers/bus/mhi/ep/main.c:77 mhi_ep_send_completion_event() error: potential null dereference 'event'.  (kzalloc returns null)
drivers/bus/mhi/ep/main.c:92 mhi_ep_send_state_change_event() error: potential null dereference 'event'.  (kzalloc returns null)

drivers/bus/mhi/ep/main.c
    101 int mhi_ep_send_ee_event(struct mhi_ep_cntrl *mhi_cntrl, enum mhi_ee_type exec_env)
    102 {
    103         struct mhi_ring_element *event = kzalloc(sizeof(struct mhi_ring_element), GFP_KERNEL);

No checks for NULL.  Some people have a rule that functions which can
fail should not be in the declaration block.  From a static analysis
perspective code in the declaration block is buggier than code in the
code area.

    104         int ret;
    105 
--> 106         event->dword[0] = MHI_EE_EV_DWORD0(exec_env);
    107         event->dword[1] = MHI_SC_EV_DWORD1(MHI_PKT_TYPE_EE_EVENT);
    108 
    109         ret = mhi_ep_send_event(mhi_cntrl, 0, event, 0);
    110         kfree(event);
    111 
    112         return ret;
    113 }

regards,
dan carpenter
