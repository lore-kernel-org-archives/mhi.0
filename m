Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4C329C43
	for <mhi@lists.linux.dev>; Fri,  7 Nov 2025 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525733; cv=none; b=W6/GiQ0cMe6iftTC2aCqdBCdua2pKfQ3oeDkW/hrO1JckW2UygPAGqINMZ49YwnRbw9Qk4/uXE7L4eBA/bqjFRheyCiqUzpfQ6vFdiHaNEKM9Ydx6ZJeMS9m7MM13WRk0nhhpdWHYsMiGP5FxieI6RLHmA+vigznTCdKbsCUcQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525733; c=relaxed/simple;
	bh=3BhTKLrt8Wvihg8vp8choQ0z6FtpnObNcCgY0g7rt6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RaMnRtC0lNEyqOPo3on5mLy6Cwh4zbWo5VJovQ20+U1kbDCwAimKY6J1GrRy7Q/iuSaPJteGtiwlqEbFEBsfqtQmM+0omNtislbRpSD13EAvTSJlkxDE8h3BYenNi/Ik5jdmDfmCkmiuVybyOZT5kX/ARTnPmej8EIau32couto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FInEj5zA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FInEj5zA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4711b95226dso8155625e9.0
        for <mhi@lists.linux.dev>; Fri, 07 Nov 2025 06:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762525730; x=1763130530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcbvvRs2xvl1u3FoZnWA9K4Q8QMEKWU1ON5YmKljc6k=;
        b=FInEj5zAxLgFg8d/dIR6XKNLKJorSl0QpCB57cw/SwCRoe5Hd9CL3aL33uLjx19F1e
         e1pN0JegjNjxbIGN2BkoHk4xZS91CXPYW05IlzLVvzTcE01AJcBjXgcQkXDhVwk10dXl
         KM/5nmyLOLn38Y9e7icea53zvTn6KtkLJZkTTRq+Hpo+xJace1Id5hr5ZXRLV+0QFWJU
         EmqGXTpEUqdBDgaIiDqIoQpC09krYQtA2wSf4yMFt0W+lGGhH37BNrbMj4bauYQseNuX
         bnqPZpTmKGiSzRFtbietU8fLRy4gmL94t8urF6VL1XeI4kfzshV7wsJqYcB5yluNjVXL
         S6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762525730; x=1763130530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbvvRs2xvl1u3FoZnWA9K4Q8QMEKWU1ON5YmKljc6k=;
        b=pkbiHMDxYSIo6xx4jNeTPVHo60dIhWN2+Wtkx+7iU+LHbio8V4qZFj2nlZHohoD1Iu
         hs3AYhtJ+uqO1NM96ecJ8/J+oxspa/qiU9YcBNp7zziGyyMLOhag93fpnvQCOGy6YQUQ
         YSIJmXrqE9YhjbFmjPfxzHsSyitrD77qUvxJSH7D1Xti6E6bltauCiqWesAXHrhiyyfo
         Ucyx4vfysHg4zoVYy6V2AroE46OmeK3iotoREfjHxmho9jT7dzaoOpZenA8OmMivwMt2
         szqEWDaGIfMTHYhDNo71LrQeOOsaTWNguNxOS0RFrSdgnvTvIX7jvIjk4dND/1aLbReK
         EfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnbxk9la03noq86KUefkFYK0IwFCdWHt5yijWwZmKNPKtC5pexLMC2ihrQ32d5u+6D1E4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDj8/TpiTOLTIk25OqC/qPhFCvV6ftApA+jAeUCK29farAcC6r
	ZhlIzBlDHVjcVZHZoDRYxyMJMhR3Gq2ZGeNTdi1ib/HFkDAPXWaoJiiLJCxj1kZCh7M=
X-Gm-Gg: ASbGncueL7Nmlp7zOB+d9ouja2649jPYMParIdtLmJohjxGFoVuQOeEl0okeP9VjX+0
	ZaIgP6uZaIOlyjPaEWXpLZVAGYBvMQatEF1BCZOoAHGzi/EKYxVcUsIMuZuxLSbWdj5Tfaxk1HN
	HYSq7dS3yuGdxJNG9h5RtP6toqiB2kFNpeOy+3Oo/m7YXGpPtNYdoegPEERvgGgX8u4E1cTPXWW
	qiQu7O55aLOKY/LOI5itMHnQjc5kjTZyLGVg+9dGfq4tQYEqBAULqOXFzPhOirztf6iQpxSSCRC
	ZVjIV79q788Api9pyWg4qkJPuKquMpk7IaXE5Kyk07EB69cQeMNhVRIRBET/O31pUvEdiR6DHCQ
	/byDHOIiBm9zDZ+VTsJ2jwGBp4Kd8WjFhWO7S3ll/pUH9M1auPdGz1GGb9uk79J6feusWagsvA0
	MsZnbINbl0t6p+LWBmitjCirqi
X-Google-Smtp-Source: AGHT+IGSUrN/hCHTEKNrK/nAtni+bSccTeEoJLzD46C+Lw2FCkxvsZIT3Eo/AVNFZdrzTW3STsHRog==
X-Received: by 2002:a05:600c:4fd0:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-4776bc886femr28359035e9.4.1762525729708;
        Fri, 07 Nov 2025 06:28:49 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc552sm181970865e9.6.2025.11.07.06.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:28:49 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: endpoint: epf-mhi: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 15:28:35 +0100
Message-ID: <20251107142835.237636-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
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
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 6643a88c7a0c..27de533f0571 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -686,7 +686,7 @@ static int pci_epf_mhi_dma_init(struct pci_epf_mhi *epf_mhi)
 		goto err_release_tx;
 	}
 
-	epf_mhi->dma_wq = alloc_workqueue("pci_epf_mhi_dma_wq", 0, 0);
+	epf_mhi->dma_wq = alloc_workqueue("pci_epf_mhi_dma_wq", WQ_PERCPU, 0);
 	if (!epf_mhi->dma_wq) {
 		ret = -ENOMEM;
 		goto err_release_rx;
-- 
2.51.1

