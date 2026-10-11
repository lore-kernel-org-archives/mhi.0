Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8BD382381
	for <mhi@lists.linux.dev>; Sun, 11 Oct 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744701; cv=none; b=A0fQKSTX0GBv35ikg7hTurK69fUJOa4zQjJoYDQGJn+wBdvpWXU1DdFiQ2qbSdBQRgjsjNxlCzt+L4Ma5ErejRe+YScTFn9nGRkUIcrWi1G4S4xMCN0FEdNTOJUlgZPxKju29REsM6mwppHbZramem6UM2p+NTsnIkjU5hApOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744701; c=relaxed/simple;
	bh=HAl0tw4A2/XGqRCEjWRTCUg/mbwX/UtCTd05d7oPNJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EAbk9IKb3giJv2FrAQ0W+9UARijqfxP3NTR05tpYV2T195mi5DfsU2enGej+X/n3d5874rZoltotK6lJOS3L0jHRE2LysUWHTa7YRdO0wIedbYwbF+gB8sf9TN/IOjlzKIXB9aNK6YXJrlIM+3Y+lIOnkgPCia6oPVJv9ORTqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5S4bHTs; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5S4bHTs"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e6f83f0bbso127260885a.2
        for <mhi@lists.linux.dev>; Sun, 11 Oct 2026 11:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744699; x=1792349499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Jf32+IQ1Xgq4isKE7x6gOmGNb27qgow4H2816v9yaU=;
        b=J5S4bHTsYKZ79qoamW9PvH6Q+eNRerD1U/ySXJ6knnuqBi4i9LoXDHzfJm07vPtIq9
         6kLrxWnZaVtxiaLGJbikuulUM5KBQ+Q8bCJ5cPVgHhvIA4i/Yz//mr2f3BwUGTL4oUSW
         kr9U/B6tF3DMPgpSyuc8xZgX3lERu3gzC6TsKq6XfcjM6ufgk3hV6UuGe7CLxhFFmNOP
         AMVUrSLAgV/jEdXcdVS8g8mx4qmP97IzFNneVSMVd3kH3Iwouj9oTUh8XWX1qXws4pyT
         xugB923n7RDvdSvGykucMHW0Pq9q+qr1P6aye4ceSsyCRXdXCIuAiZ26xonev92ES8WW
         +ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744699; x=1792349499;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Jf32+IQ1Xgq4isKE7x6gOmGNb27qgow4H2816v9yaU=;
        b=imiIQSMDdX4u2KHcwGofg3tWdIZkN55XYW9GBVWudNGofdRgmqJqBwY2sJXhGsAe9I
         3xSHTBTQ+5tq/ZphurzZeUbWBON8qc2Q16+ubHxNfP4v50cLzpcSy/yspd83msi9UZJ7
         mNlTppuyUQJC1iyVOSZi5WzziQo4QeeBrZvFNT8QYJVdMoRocTeh+sBK6AF8a7A3g88p
         DWGXMPbn8oWwjvwWs3Nb2xD02Mp8cTDJl4HI8WdTXzUv7QiOTIZ2bhfUD8EeDNJfK0Tr
         BQnqWWSm0ceMCyPc4JdQFu9xcEFliynCFBbnbd8l+BkpU7kZp94lOR3SOD+h4vfM1wBx
         nuOg==
X-Forwarded-Encrypted: i=1; AKwUvBzJGD30CNGgZYN8mwM5f2TNuj1Wq+lJigoJ/RJa/gG06jMHREi1ta6Kg7KeCHpxJs4zi7s=@lists.linux.dev
X-Gm-Message-State: AFq9FYKd6lpvlTq9X/LZ/NCZq4xaERVmicw/cx/bohNAZ9G1FibXGJpz
	NToa5gF7mn1I/dk2xsEVSGnYQim7i46+NzbWmLE3hs9p83ZL+Mkk4ZI=
X-Gm-Gg: AYBFou0AKC7sGHe4AWZZsm4/2o/YOgMwXGtGSSG1gCaPErH1PN2Z+D9N3BptkWBEo7z
	JUqWFO0C40FyMVblzSE6CI5OdwrbLR1shXIyxyBkOQqFL/Uei5u/figyTVPO0KrGl19WrEtvTiZ
	jjkg0SSyN/9NwYfuGYU4TQ61SbRKktuC3mNzeY8lEJMsI+umN2DVvB2rnbkzhdWxOCzE3q2/XR6
	XTyiq9ziPaCjcn5xk42J/1FlHnSgM5+u0eXhzfFtNkplnbcZaw1JpqE+hZ32md54PVE5uDZOj3N
	Tf/2ZWPgjexPM4f9q+5pJtffFF7o4r5QzL6czvIFVoUn9peYEGw8xOIHJfgMWON8z7TaRBM4oS1
	YIByLZKJe5FL339YPqKUjUJJVTUkRVPni17Rk+LTi/b2R13BhaymzW0tvcyhUzSqhqN0k5UFX9Z
	SY4hw6EEpOjfJp34LZQ3rfLPUZjgbQwqafuUcdf1uw0JMUCK1tu9/YMYLkIsxCFceVJjn7HiP9Z
	TZcGjGXxX5f0I4/m80RwRIpjQFNqPXbYr/dF6h7fisgP2/Cfx9urAClEuWF5w42/Vy6SQNOldeb
	rlAIGJ/F5c2qOwkuQU5UP+WMBvLV
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1342671185a.9.1791744699031;
        Sun, 11 Oct 2026 11:51:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98bdb8fsm687707885a.33.2026.10.11.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:51:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] bus: mhi: host: Shut down the health check timer on removal
Date: Sun, 11 Oct 2026 14:51:34 -0400
Message-ID: <20261011185134.1759331-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recovery worker rearms health_check_timer after a successful device
recovery. Deleting the timer before cancel_work_sync() does not prevent
an already running recovery worker from adding it again while removal
waits for that worker. The timer can then run after the controller and
the managed mhi_pci_device have been released.

Use timer_shutdown_sync() before cancelling recovery_work. This waits for
the timer callback and rejects subsequent rearming, including rearming
by the worker being cancelled. Keep the reversible timer deletion used
by suspend and reset paths.

This issue was found by static analysis.

Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c..f8de889 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1488,7 +1488,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	pci_disable_sriov(pdev);
 
 	if (!pdev->is_virtfn)
-		timer_delete_sync(&mhi_pdev->health_check_timer);
+		timer_shutdown_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
