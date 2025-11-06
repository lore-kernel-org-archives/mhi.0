Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73A34F48A
	for <mhi@lists.linux.dev>; Thu,  6 Nov 2025 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446282; cv=none; b=nPmg0kwLoHpZib2ZPbTslY1/ad1Gu4Vo0WTu0vJx7e+sODV678891XZkYi5yk1Q8zXql0ikxLtuAD4CSIiFkp60oBTEqTGM98D53XCOXebvFnoWhyvpLGdVqjjyDXublxCA/YstWe9g9btAfYbsjr9N8xa70veK7CGwQK/hePPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446282; c=relaxed/simple;
	bh=xADnaFf2inaVuBhL68l73ZAxXKGsKVM/VjEgoo9Ej7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LZ1VlXJSKGPrgrh4APlocP5bdcX6a6ttUaOt9jFgT6PiINR8MoMIH68E7zZcWGcoPu/L1Ux2yW7ePmIp7fkQx89x9Y7NsOHvUDyZThvzZNUH5LSmDLgRZ7HY1WzOiTeHsYJNTKWm1200F3GBT7E3MADSt+BEzsbWeRyDZbkGGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fq5/65zF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fq5/65zF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563bcbbcso5996315e9.0
        for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762446279; x=1763051079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v4fzZKX6HwGk5jmCYacn5w6aEzndQSk37nIk3p7Gbek=;
        b=Fq5/65zFaUIkbvbMTOSJSq9jhTaGqB3Pee/HsAyVRrBzlnQvnDjdvUC9boT5qJKEBO
         VNnygp6J+RFiFFDuZ5IPEmBG7jZ3rOkjIipAv63wP7DjZkddWxdAFrXYs2Uik1Vv/Xq6
         wIII3rkNH+lA8S80kgSPycB0kprMzMQYRc7NeMtA7G1zTYrMpVMe7a++beQcxqwYV0xf
         GjwD5zC8Um322nUBafvEjUuWJNLbxmVkSOsOMoMK+2YSkPHUrqMsVizdh99YCkvaSBp6
         SUTYwcgxJ5hhQrBgG8xZWFVfSrtdYqd57QHupSuvQRyI1US4t9SsSgyJdA5ZxMRNn6gx
         aE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446279; x=1763051079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4fzZKX6HwGk5jmCYacn5w6aEzndQSk37nIk3p7Gbek=;
        b=am+NZwT0LAI0BiiU4gzQbmHfH2NYQKjSf5QfgsSsboxM8ez3OyelhLQ/685i9PEdfN
         zcQZdP0+gefC5iCYNDkTDpTZ1MdZ2zobjj1nwecTkX9Y8AoVRC1rYbmTykslZEKlhqWM
         pjDUdMcaCAxslC3+D2g+y8+JUS0q2/qsCstQ/r9Q5UQmJxWd3y8atVEzKAyDF8fsOJmL
         KvZCOjvwpS0n5UHBPfhhlQL8yGZb1aHWOFIpyfovhdI7OgA+xdwAUkRFi7xcySdzKkPC
         LxAEOdBabw2qjHIA52PokOeYzy+tAWccp3HJ3YtG8bYyWLa0naJIdggWVkkZsYyRg+b4
         cG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXpLkDlmR9yo5AHMF0uj7Jm9z+lOr6FQ/t+9eWRkxXrThj/nT7c5VR0Ok09ZMYV1hIspo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/mYga1dWmb0Y8vWhlnfQ/s+G1Jycb6+7xq3eRe7WDr8xaqx9u
	E7ca8qBcguq/MxsMmVj5LFp8EIMcOG322BEi0hgrCm+kvz4UON0x+C67a3va4Aw2m00=
X-Gm-Gg: ASbGncusKoRsG+v6GmDG2MKzmhtuaOwMbHCkbwMp5zsJlKEC2CGmiUxOWKeHsFEelDj
	18VJKj94DU/HAZ4MPbDsMpj70bn9KnV48P9WKJRloZetddZiz9ytGjH67/dq3vvnEXOb40D6Vd3
	X91SYcII/gL5DaBsJyJ1H0hO9DwNYsjvKYBmtQuSZzblTXW9s0BKyLpFnHIBjM1Sft4H+38B9UQ
	5kNvKKC3P2jUAIjy2oyv6li+73g98VLh36k+2lqhpb2G1S5WTwG63eA+aX+P3phjN89UNOq7wAB
	D+n+L4tS15qvmEcLXog7boPdGcliq1+x/5UkOF2RLDewuGR7pPuT9QHBbE/j/da7AC+N8DD/6Uz
	5o9rOj6m3BZmoyRRkrG/k00AcNkLkar6XgEIwbEnh/QKoNlr7jcCPE+SIV/Xyhlzyz1k+B46G1W
	fkb7WyPgva/Q8ETmMx8Dtt1YY=
X-Google-Smtp-Source: AGHT+IGtFn/HCR7L59DoJ3wukB4PCiJ3rzUEs+p33H3lMvfaNMCUEYWulil42PY5+vCfIaYpcI6mgQ==
X-Received: by 2002:a05:600c:1f85:b0:46e:3709:d88a with SMTP id 5b1f17b1804b1-4775ce15bebmr58402885e9.33.1762446279074;
        Thu, 06 Nov 2025 08:24:39 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477640fb723sm19305615e9.10.2025.11.06.08.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:24:38 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
Date: Thu,  6 Nov 2025 17:24:30 +0100
Message-ID: <20251106162430.328701-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdea24e92919..25dc5eec7dc4 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1494,7 +1494,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	INIT_WORK(&mhi_cntrl->cmd_ring_work, mhi_ep_cmd_ring_worker);
 	INIT_WORK(&mhi_cntrl->ch_ring_work, mhi_ep_ch_ring_worker);
 
-	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", 0, 0);
+	mhi_cntrl->wq = alloc_workqueue("mhi_ep_wq", WQ_PERCPU, 0);
 	if (!mhi_cntrl->wq) {
 		ret = -ENOMEM;
 		goto err_destroy_ring_item_cache;
-- 
2.51.1

