Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB96B2B9A4
	for <mhi@lists.linux.dev>; Wed,  3 Jun 2026 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449275; cv=none; b=KzYhwkec7WWxDvE2fd6iduqSw2wPZy/Rf8C60jRtCeah1ov4LO1BUhA8u6M4PZNGYG6Kucr9gsYrlSTGNoVDiRgZxcfkfMMSQDAFfqcMylPjqOdAoyFfpx2EGg4Te5oDvgiPJIKz6cpNf/fXFsRopsklm3m3fb7qYnQdHpvH2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449275; c=relaxed/simple;
	bh=Kztzd7NXKG8IK8+em5/LCAi5C57avspABVpmOq1/LyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IX3MS9a16GbqREFeDdTsUtANFAIHUajMbnRN+1Zh8DrfzhmwKme6FYcuQCYzKkrzLhmWP8V+7Y0Yar+CK+OfWh2TLyJNnUIKLyIXt2NlTNpJO/BVNXDuxJgtEKpz6/vKGMzGfZ5XpNdSiyiUie51fXG18kQBNLBRZOohsATsx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7qCSb4a; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7qCSb4a"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so23764335ad.2
        for <mhi@lists.linux.dev>; Tue, 02 Jun 2026 18:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780449273; x=1781054073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kztzd7NXKG8IK8+em5/LCAi5C57avspABVpmOq1/LyY=;
        b=o7qCSb4a37rKYiIxXxGaJcBOC1rL362Ml3+gZSCb0+TtwovSLSSX/d+NZZYKh3KUkM
         NZywDa6S941lG31SO/z1FAwx4aAOFwbIssizWFlhR88CNCj9crHhT/BgvfhNLmuLEXg9
         2iA8YUYc72h8hdI491yUaNGjqpBjcCdNvV4pmGOHkhY8N1mkPyMiA1kruwtCblgdOAmj
         iE/ACZ9XnztfbZAkAGHR/J1t76XnZFSHC0C3CLUilwP1SvWiJH/qEST1FXfyzVxj/dfy
         sgyDpxhd2qEDK8SPyXAYKGu+6NX1dXVyudmy95IpJpShNIZgU0fRcOKfhsp+m29StDfH
         /XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449273; x=1781054073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kztzd7NXKG8IK8+em5/LCAi5C57avspABVpmOq1/LyY=;
        b=shZoTAPUlLmq270U8KpxMGQxDne/hXYob9eaA2d1kUKmxq6S8SRDTkhtsZpAK2/KO0
         Tdh/7crx7Jjpj5eDulOG/oa98AefcHbG+2DPVhUriP3Zl8GDjPQfelgBEMA9fIYutUh6
         mvbt6OCoHxVmFFgw8BGb5sQwuOhGLNymM5tNb53KkKkpg67rCnFQGv63cPgAFSjjCSYZ
         2kQLRoUraRBuMbRIWp5OTXeAAf/WQI45aoL1YpA3AgpC6+kA2Wqx8f2KRzuq20zwR9gl
         YREelEaBH65J+ArnvlujJUkRTv0OkyniIBBJYj3QG75NjrODwtx9Q1J+w3XcymIh17es
         Wr/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9G0IS17YH7rfxpWrfKBZLZ6WGalPrU36DduHBOKOqIOtRmAvLabtdXnnsga5zPew4Qyh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXAzZqQXqRJ9OdlV04GCVX3aUZ0vgKPsO+d0UOw7mN1/sUuvyI
	lXJWBd1W1Nbnmb74aF/iZDqWsPPNYbapctTTgtFpUQwJ1ObATv9xQcRU
X-Gm-Gg: Acq92OEKFnys1lQDlxPDropZXc4QLs/0tNvasolnEf30164h+c2L3SaOtof0W+G53NU
	LRgU+9YicM+fZu17LSfktDb+Ib39ceBT6fhDU3P7jpmPI3X+ttvfRYAl1ew5mFMK4KpblfK9/eE
	rApM2XFBeJ2AdbqLE+s/HO9TX9cjGGjidLleW0hUV5p9+7sYytJL3lC9oTfnld3AZrsLBwyykmk
	VRsHCmp+IZP9F70GL4qSyaH0TxH3eG0kHcHtvD8qOQep9cZhyEg7oXxK+jJsh0l2cOd9tsko1TW
	kPlA9nmGDWOI0ls2vjZ2Tx58gbxau8slIl+J3+nxhJpRJr1MaBq1vWMtlhEvzKHXfzdLVaHrrLg
	CaJgy3dh0g1OI08m0yKKLomeMbVUjSr0N63IRiWAwE7xRj22MhOiyuNYP+SOk3z3VR/f6Fm154X
	rw0shT1iuH3MSFcIeuF5c/vdhTgCdxs6J6hUtBGeZW9ac3UTZBQXe1jVgBvYY0Bmm7
X-Received: by 2002:a17:90b:5744:b0:36d:cc9b:2f67 with SMTP id 98e67ed59e1d1-36e32a42cc6mr1074968a91.19.1780449273236;
        Tue, 02 Jun 2026 18:14:33 -0700 (PDT)
Received: from BNE-CLN-QCAO.digi.com ([159.196.14.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd90548dfsm4866590a91.0.2026.06.02.18.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:14:32 -0700 (PDT)
From: Qingtao Cao <qingtao.cao.au@gmail.com>
To: mani@kernel.org,
	kees@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	Qingtao Cao <qcao@digi.com>
Subject: Fix long latency in MHI PM sys error transition
Date: Wed,  3 Jun 2026 11:06:10 +1000
Message-ID: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi community,

I have been using and testing an older kernel than the latest and found that
once the fix to mhi_pm_disable_transition() is brought forward to
mhi_pm_sys_error_transition() to poll if the hardware may have cleared the
RESET bit in its MHI control register, the handling of AT!RESET command on
my EM9291 cellular modem won't have to wait 24 seconds (but 11 seconds or so)
to finish.

Please kindly review this change, thanks!

Regards,
Qingtao
