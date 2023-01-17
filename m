Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250392906
	for <mhi@lists.linux.dev>; Tue, 17 Jan 2023 14:17:14 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso4656908wms.3
        for <mhi@lists.linux.dev>; Tue, 17 Jan 2023 06:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pxpyrztm0IeXAGdzoCPB/TIkZzE0psb26yKG6U7oTo=;
        b=eaavDx3rpl+QUgMwkrIJHPMuE7R9BEi3PQ0mg8AtRgFpV9Nw39SLUc0pQy3eNDNadc
         zhAS9sK0J35SXeXIOWLSIX6RtfY4ldlmULxEACQeFaj0MsaVchLxuHiMIFuybeO/bFEN
         a5LqEQmmWw5oxKxYLuOoEzUn9fPX1sSpHgtVBgrt49Nz3OUMfzuhu15CdX4DoqrHBFWc
         HHWqKomcDpteaPXTLf6dCO0XdDLpM/t8GbsmcscnYK44H/RP3tSjuTODICgccYPeTGja
         6jaUABkTk4lJd91AQG/inTpY5+XZdwlUIMGYAdebJ2ZiDXwotNwQGJXuXQRWomNXVFgt
         iwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pxpyrztm0IeXAGdzoCPB/TIkZzE0psb26yKG6U7oTo=;
        b=no0zfMt1sqNTco2t1FseUuKTSHAoWfClJcIq5OJDMJhSkP2qyCMMWM+VO1fs874wl0
         YZcBHgP5jjBI5d9k6bg4oYtUWCTGhCeDn3nqQ+LvyqaKKTxFxeiUG/4MHimWGj/BLAkJ
         NBVt3VaWmodBCGUHfgxiapAktk2YSrasHZAkBhjUOs5s4iIDBtbm6c01P5HzFI++oHHY
         gjKf/izFC7UIyD1Rg4PxUTIpJSFWaqogwAiCJmeOgzHvEhwNA+93QKvHhPaBKaqc9LAh
         qjdruKSmKunVvSXe9s1fFSiKIJzLajUcKcqGgVpgRKYBptarV9tfMvjP4cQsJPDxspP5
         Ji9A==
X-Gm-Message-State: AFqh2kocyMZroNCq7ZyiTo9IxnVYX4dpPTdVDFbHp4rpP09R6QyQHZH5
	cQaPDrKCqxEns8DHGdNfNR4=
X-Google-Smtp-Source: AMrXdXumqnWrqvVyfusI9W12ENW6v7UzQVgEpHEjbK4+kYS6BpmCr/LyEPMewUDSUEALpAilvl2Fzw==
X-Received: by 2002:a05:600c:2d0b:b0:3da:fcf0:a31d with SMTP id x11-20020a05600c2d0b00b003dafcf0a31dmr3416669wmf.22.1673965032293;
        Tue, 17 Jan 2023 06:17:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k30-20020a05600c1c9e00b003d9b89a39b2sm41140041wms.10.2023.01.17.06.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:17:11 -0800 (PST)
Date: Tue, 17 Jan 2023 17:17:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev
Subject: [bug report] bus: mhi: ep: Add support for suspending and resuming
 channels
Message-ID: <Y8at3oH+T0wd2NR+@kili>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Manivannan Sadhasivam,

The patch e4b7b5f0f30a: "bus: mhi: ep: Add support for suspending and
resuming channels" from Apr 5, 2022, leads to the following Smatch
static checker warning:

	drivers/bus/mhi/ep/main.c:1141 mhi_ep_resume_channels()
	warn: sleeping in atomic context

drivers/bus/mhi/ep/main.c
    1129 void mhi_ep_resume_channels(struct mhi_ep_cntrl *mhi_cntrl)
    1130 {
    1131         struct mhi_ep_chan *mhi_chan;
    1132         u32 tmp;
    1133         int i;
    1134 
    1135         for (i = 0; i < mhi_cntrl->max_chan; i++) {
    1136                 mhi_chan = &mhi_cntrl->mhi_chan[i];
    1137 
    1138                 if (!mhi_chan->mhi_dev)
    1139                         continue;
    1140 
--> 1141                 mutex_lock(&mhi_chan->lock);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is called from mhi_ep_set_m0_state().  The mhi_ep_set_m0_state()
function takes a spinlock so we can't take a mutex if we're holding a
spinlock.

Enable CONFIG_DEBUG_ATOMIC_SLEEP for more information.

regards,
dan carpenter

