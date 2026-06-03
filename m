Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72E330C144
	for <mhi@lists.linux.dev>; Wed,  3 Jun 2026 01:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449298; cv=none; b=tK8395QyKDyI00fNLjzadCcjh0VH+wr0wWh2Y8WVzH6vmRgqkZ8pI3MTZXx5vPWzTdWxeXuf0G3URu05mfdRWsTeL9U+zUNBggz4t6UCo5J8WMWzUeB8Vojd+F82deGWqZA2UuD+r7BCHQ8NTOm6gEjMXITjJ65pmew8bNHAjs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449298; c=relaxed/simple;
	bh=JajzC6TZGTUiuxzIpeyJ0dRVDu5lvb+jhTk+EFO1NlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLPEVkVaMAP/HBC75uuMhqOU5JQbq9gqpoqegzupw5umfyrjvIkAWrQos2nEISUKjmIqiBglpXcScxbyKKV3+i0expIruEHtyCu4KSpKlgvdXQVNTOZFT8bMK/tLT3s2xaMzuqdioik4d50fow3RecqqIgYF9leHSIEDOn2F3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOzjweXw; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOzjweXw"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso2508385a91.0
        for <mhi@lists.linux.dev>; Tue, 02 Jun 2026 18:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780449297; x=1781054097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2BHlDhO4W0HN654OiftpkbBAK4xn2LgOoUicfv6wG0=;
        b=bOzjweXwavYoW1wKlxeSS8oMoagQaU6WfJbGGGtkJyWTqrERWT/Ux8jB5RLo6H02pV
         /0+9IhwqrwjYQiP8heJ14Q8slMK31AhgK5gaV7lebqlTbf9vWxqx7aCTpuTjE8dn3Yrt
         X+wmnXHuOPlAT0ccWO2J2Ugi11mu6/fOjnStoZj6M8WG8Pv3R6yegKrkS4PRjEQnjYn9
         Qrg2hj2MeqXfTmPpvr1go13vFtpZfdtqE86dMjhpL4fYYHKBYXtg6otD5O5GBmiRaROg
         /NT/nKWixcxRLNL8Bzx/yKx8FDieGD95V0Gy+vkefNax/afcpM6UOxlHFL6mw7mk0INq
         I0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449297; x=1781054097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k2BHlDhO4W0HN654OiftpkbBAK4xn2LgOoUicfv6wG0=;
        b=qiZddifgJFBlaz8VmHnbS6OeqqBQapRdK7R3KKtXxOAZCFIsEeqfl4ujJObIP22EmS
         xqycTi7coaukDIwNgDeQlCnDzTxQJtUImCTALuW7P9g42I+ghpL99vH8b7ktaCNjQfyw
         nFXrEVVkxcEKFRxaRMSwcukQYbOMKui+ePjl/g9FHXLbLhn3yOoF0m2lA5KzogthgmyW
         uJ1nMR/XdSPMB21lbR1v7PED7vu0bmN5OyeeoJymdNrtaHcvv0MuBX58jtrpIyQG9Jfn
         QHvgqsCDfasrpDy3JNJySOQQ6vbSQQE+rcY1ewVyxE8KWp2ZCf7VCUfdyV4Ls7A35T7S
         2hhg==
X-Forwarded-Encrypted: i=1; AFNElJ+21H+bCJeyXw/pClHkh6pa+0UA5u5iTmBW3ss3d3BhP5XF9vJSirpquXpaR4dj3t3qPq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQT8W7FUYdPvWm15R0HlI9SIgETkMak3z6KLHvDANXGYmKQHc7
	547iQ8zvftCgClJHLpAYJ3wptp4JXteKkDeTYvinUiuMP68B99qGNOP1
X-Gm-Gg: Acq92OGTV+bOfJjMZWcOYdFITaRKo3icHoYNDSxxr2VHXu4m8UPU9RE/rl5+JObRM/R
	ygpo7+K6HT8U2KkbiWnyvhSzi8Hs231TIRqM+zq11scf+XST/EeApg7YP4fcUtlKKCW3nFrtZ7N
	XS4OjRaST1wDGqa+vihYU00j6ap1VXOzDUrELJ75RAJvMKG7RnFFShjUjlpNp0a1L0o/6xX56XG
	a/yV0/Ge/VuK3pagVl3uZcnnI5MFdNnSquhxK5UkEiK+LGXCqUDjeTHWDI/xhHeph0qFdYqSc4t
	gnreJO5IWXXU/+Y6KJt6SkXmG/BoXOz3R3/UrT7RQVWOmtOQamFZ3Het6qgYT9K9ZoAj8OQFlE2
	YydmfG/KSbORkLnA+VSJOQ2Gv7oPqOXcRoFLLHYT3isF/sMR+d9ge/qLaOilWSYFGugzgOWTeh6
	5JJ6Hj+QABGIw39aJush4a7/ttuyNh3q97jRiVbZmB02xYfg8uWGkcNQ==
X-Received: by 2002:a17:90a:e706:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-36e2eede3e3mr1315342a91.5.1780449296991;
        Tue, 02 Jun 2026 18:14:56 -0700 (PDT)
Received: from BNE-CLN-QCAO.digi.com ([159.196.14.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd90548dfsm4866590a91.0.2026.06.02.18.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:14:56 -0700 (PDT)
From: Qingtao Cao <qingtao.cao.au@gmail.com>
To: mani@kernel.org,
	kees@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qingtao Cao <qingtao.cao.au@gmail.com>,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	Qingtao Cao <qcao@digi.com>
Subject: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
Date: Wed,  3 Jun 2026 11:06:11 +1000
Message-ID: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bring forward the idea to fix the power down latency in
mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
so that the transition into system error (triggered by AT!RESET)
won't have to return only after the timeout of up to 24 seconds

Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
---
 drivers/bus/mhi/host/pm.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index f799503c8f36..9d29f1591a45 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 
 	/* Trigger MHI RESET so that the device will not access host memory */
 	if (reset_device) {
-		u32 in_reset = -1;
-		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
-
 		dev_dbg(dev, "Triggering MHI Reset in device\n");
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 
 		/* Wait for the reset bit to be cleared by the device */
-		ret = wait_event_timeout(mhi_cntrl->state_event,
-					 mhi_read_reg_field(mhi_cntrl,
-							    mhi_cntrl->regs,
-							    MHICTRL,
-							    MHICTRL_RESET_MASK,
-							    &in_reset) ||
-					!in_reset, timeout);
-		if (!ret || in_reset) {
+		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				 MHICTRL_RESET_MASK, 0, 25000, mhi_cntrl->timeout_ms);
+		if (ret) {
 			dev_err(dev, "Device failed to exit MHI Reset state\n");
 			write_lock_irq(&mhi_cntrl->pm_lock);
 			cur_state = mhi_tryset_pm_state(mhi_cntrl,
-- 
2.43.0

