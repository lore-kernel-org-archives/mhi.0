Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B88E2AEF5
	for <mhi@lists.linux.dev>; Fri, 23 Aug 2024 03:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724382780; cv=none; b=BzxiDKLXiDr5xVn5thASU2/AR5o5mhtMpTLmE7k5lcRezt+jN20N9fqhKsCDySuFFMJzUDON339S7gzShe7cx7dZO+uICzT022BLRZHC9DEdwJjG1eXnez3LhX5AzVo6pwGMXblQGnmwCsEpGUGtTxv9T5hahQa0dzotRaRjgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724382780; c=relaxed/simple;
	bh=e8M4hGn3F6HeLuW+kugt6mk213gGZGxeB9qx6qGGYJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+b1p518OHt3mt+Fd0hwmoxenY+UJORzjkkB9YzgFnnnfpDKs9BFB0qBXnckHtnUL57FNiOimAZQiLTUFbT4aLDQrL4DXP93z7zW9+nYqxduP7kalg1xmkxTkqSztl7OtJcpzb9y2k9FclX0BvFUPlBozHtBCuIznogY9iKLq7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MV6UcXue; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MV6UcXue"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724382775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=toen39aZXqfvfK7VRtTkKuy2dJycPw3LN43FvI2iTIE=;
	b=MV6UcXueObDmrw/ncEl82PBIJubanNZGiV4nPx2P93yD3hWnm7ijAT+NfjAqGDkPpPUQ0O
	BnBGfchKJwHNKAL/zxECDQLruoo7y6XdwUDwoZLthzhPgFT/c7iBBZGE33LWjcK8GpDrcS
	H++1nXvpJqc7m/uedA37OTtk5Pz+Eco=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: manivannan.sadhasivam@linaro.org
Cc: gregkh@linuxfoundation.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] bus: mhi: host: make mhi_bus_type const
Date: Fri, 23 Aug 2024 11:11:28 +0800
Message-ID: <20240823031129.49010-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <chentao@kylinos.cn>

Now that the driver core can properly handle constant struct bus_type,
move the mhi_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/bus/mhi/host/init.c     | 2 +-
 drivers/bus/mhi/host/internal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index ce7d2e62c2f1..a9b1f8beee7b 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1464,7 +1464,7 @@ static int mhi_match(struct device *dev, const struct device_driver *drv)
 	return 0;
 };
 
-struct bus_type mhi_bus_type = {
+const struct bus_type mhi_bus_type = {
 	.name = "mhi",
 	.dev_name = "mhi",
 	.match = mhi_match,
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index aaad40a07f69..d057e877932e 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -9,7 +9,7 @@
 
 #include "../common.h"
 
-extern struct bus_type mhi_bus_type;
+extern const struct bus_type mhi_bus_type;
 
 /* Host request register */
 #define MHI_SOC_RESET_REQ_OFFSET			0xb0
-- 
2.41.0

