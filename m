Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7F26111
	for <mhi@lists.linux.dev>; Tue, 20 Sep 2022 14:23:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id m3so4051616eda.12
        for <mhi@lists.linux.dev>; Tue, 20 Sep 2022 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=AdtpZB7U/EABK14zfV/flloJYC93tZl66p8xW/fKflI=;
        b=WiApm+FyIA3oAhh+un2VztEkfOLo0vOyUENAeEGzdK5Xaq/T2D3fYeUWCVg+vBB14h
         H+K4WkGh825B1M3cs6cYQ+KbNbkS/E+oMzFpVqdodOgcMMtbMFJR3w1wQ7FPdav6VQs8
         ryYdKzuDQ+U3KaGmNScrzmHlhMWL18MvcrXzxQ9w3OPN7n12vS5fccOU40vzn9gvZFJD
         aEoRrB9/3Fh7pFLgyIjudA6G5CGENdr6eZukz2gFbHDcW1grp8kQeuwYgdhkCskSoHfv
         7mVT7VAgAUGDWKGDOq/4Nzn/B+eVOHhDW03leKjiGylKhrp5bPGVBVGRiNJ2PWYIHRDd
         ALrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=AdtpZB7U/EABK14zfV/flloJYC93tZl66p8xW/fKflI=;
        b=jgfYUbdfKU6r4/5xnc+UKBr/9u2x1cblLX3c9MMZ12VSwcB+bNMC7EYiduDWrMtafv
         YOgiuUR5mt9zD/98I4d5zE/ScLcTJd3AFZOg0PBI+XHt2mB2pKuJ4ipWk91KwHUA3p0l
         kpl4vd+PPDip0yBCvSl+V6kfoYkT1RBNmd5iauNwAuu3O4bYZ5M/CybT5aexGSTQ0qRp
         G7r1Y9UuUMuCqZAVeRJpeRjOlfG8jpnKTrXvqe2KRZZ20sb93MnP8SgL7i6vjDJOxj9R
         ATWIr9OEMceL5p5ScuHP0j9ddygxWU9aQYtEEKz25z6wpmdrfvBUPVcrYaclbfvCb+1s
         BpaQ==
X-Gm-Message-State: ACrzQf2UpvAw8eb9UkthT4c6spJOUaN6KfxvUMsYJ3nKpXr94c8rftiJ
	pq1lNKZIzYuG90XhAEMsQ10CP7fpRIiaXLbyekjGKNtPwzU=
X-Google-Smtp-Source: AMsMyM7A0vXmhuLnWz/JvadhLpoO0zXesiteq62wMJys2JjmQ/j4DZd0J7mR2NLFnCp8xixumNbGJKe3LOH37nNGRQQ=
X-Received: by 2002:aa7:cad5:0:b0:454:88dc:2c22 with SMTP id
 l21-20020aa7cad5000000b0045488dc2c22mr1698575edt.352.1663683816014; Tue, 20
 Sep 2022 07:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Daniele Palmas <dnlplm@gmail.com>
Date: Tue, 20 Sep 2022 16:23:25 +0200
Message-ID: <CAGRyCJGWQagceLhnECBcpPfG5jMPZrjbsHrio1BvgpZJhk0pbA@mail.gmail.com>
Subject: MHI DTR client implementation
To: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm looking for some guidance related to  a possible MHI client for
serial ports signals management implementation.

Testing the AT channels with Telit modems I noted that unsolicited
indications do not show: the root cause for this is DTR not set for
those ports through MHI channels 18/19, something that with current
upstream code can't be done due to the missing DTR client driver.

I currently have an hack, based on the very first mhi stack submission
(see https://lore.kernel.org/lkml/1524795811-21399-2-git-send-email-sdias@codeaurora.org/#Z31drivers:bus:mhi:core:mhi_dtr.c),
solving my issue, but I would like to understand which would be the
correct way, so maybe I can contribute some code.

Should the MHI DTR client be part of the WWAN subsystem? If yes, does
it make sense to have an associated port exposed as a char device? I
guess the answer is no, since it should be used just by the AT ports
created by mhi_wwan_ctrl, but I'm not sure if that's possible.

Or should the DTR management be somehow part of the MHI stack and
mhi_wwan_ctrl interacts with that through exported functions?

Thanks a lot in advance,
Daniele
