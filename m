Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7BB44CF59
	for <mhi@lists.linux.dev>; Fri, 18 Sep 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727561; cv=none; b=UkkJkH9SfCw+iu45I7Z6hTRXlmXToU2WuJ/DoQ+1ZogfsOw59KQHyCcgZRDjkeK8aWJITyr3LYsMzPxLx/v1Kfy84wpWCbaUj6M9+xDTYZtxP1Ixm+rJz6DPNHFxJ58yHl6m+Iy5RyxNMYilyI9nm36TegvrQyb02wHKn5teMyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727561; c=relaxed/simple;
	bh=IiVks2OR53uR5Tf0kGzqWZv4p6VMq5OYyVw6pvi/a+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/shtpqLHyNK67yfUCj5CBqGs9nBu5+g+0OwN6f8Ydcusd1NZtGzGBChVKDLbKb4f9pzr7Ji/m9Zb1WtbFTwyxWSa+Xrk4w/h33jwd6KSd+aJkVNFJTEyKGaPr6dGd/B7dOjNcynT99i7jOGPkjaobwhuynGRpbTAWX+Knr6pGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N3NSNuZq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6LKR1yZq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N3NSNuZq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6LKR1yZq"
Date: Fri, 18 Sep 2026 12:32:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789727557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oUkDHu8kMJYkhE5GWf8SFxeb2fK9AKqXhep8PTdw2aE=;
	b=N3NSNuZqMNxLwzOAi2odaicvS9kaT9TBAO5B1rqCPh44MMBHkh9QnbsrlXiJY8dTYNMXYI
	y5PpfrRQoI73leBCs0kbCoyrBE2wCwmgaaeAtTizAD32XyeYnZutvjW9qoZVw3eWic3knN
	J+fdEPMsbmUsTtgoP1eKFPv+F6Uy9/M7BBd5GL4gKxJTuzAWyaZ5Rzfa5FojeUpY50XAlL
	H3rJHSDsWQZfMuAOhkAmW9aNb1iV+9fu14wk5p9W3azlUoD7SHEKVgbWqvuPRU62u2OjGA
	vDrhfm7i7rU6i96T2tg6oi184+se4dV6wV3JPdHY8TUjpAtX4jSi5iYIlVUj0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789727557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oUkDHu8kMJYkhE5GWf8SFxeb2fK9AKqXhep8PTdw2aE=;
	b=6LKR1yZqorYzXVJHalb3cINrVeOjSvbimbeUxoGYzAL4PmAghkoIRy5nGkxiD6WngGGcKx
	wK72bOAyL+lDZeAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] bus: mhi: Use %p for pointer formatting
Message-ID: <20260918103236.LFOXxRKS@linutronix.de>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Since commit ad67b74d2469d ("printk: hash addresses printed with %p")
pointers are hashed by default and the behaviour can be controller by
`hash_pointers' boot argument.
Removing %pK makes it possible to remove its handling from the library.
The pointers are still hashed so there is no address leak. The policy on
%p is to not introduce new ones.

Use %p for pointer formatting instead of removing it so it allows
debugging.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/bus/mhi/host/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/debugfs.c b/drivers/bus/mhi/host/debugfs.c
index 39e45748a24c0..93f458a2557dc 100644
--- a/drivers/bus/mhi/host/debugfs.c
+++ b/drivers/bus/mhi/host/debugfs.c
@@ -72,7 +72,7 @@ static int mhi_debugfs_events_show(struct seq_file *m, void *d)
 		seq_printf(m, " rp: 0x%llx wp: 0x%llx", le64_to_cpu(er_ctxt->rp),
 			   le64_to_cpu(er_ctxt->wp));
 
-		seq_printf(m, " local rp: 0x%pK db: 0x%pad\n", ring->rp,
+		seq_printf(m, " local rp: 0x%p db: 0x%pad\n", ring->rp,
 			   &mhi_event->db_cfg.db_val);
 	}
 
@@ -120,7 +120,7 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
 			   le64_to_cpu(chan_ctxt->rbase), le64_to_cpu(chan_ctxt->rlen),
 			   le64_to_cpu(chan_ctxt->rp), le64_to_cpu(chan_ctxt->wp));
 
-		seq_printf(m, " local rp: 0x%pK local wp: 0x%pK db: 0x%pad\n",
+		seq_printf(m, " local rp: 0x%p local wp: 0x%p db: 0x%pad\n",
 			   ring->rp, ring->wp,
 			   &mhi_chan->db_cfg.db_val);
 	}
-- 
2.55.0

