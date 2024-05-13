Received: from mxb.hotsplots.de (mxb.hotsplots.de [185.46.137.13])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3586153572
	for <mhi@lists.linux.dev>; Mon, 13 May 2024 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.46.137.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715608896; cv=none; b=of5z5GwQlX7ObgunPuPC7rFh4cx9VQbY9vKm6DXZsegDJrTMuuUe40DNPqfUtTpoOMWobylkXwMycTajhA3oYlsKEmSpfvjjK6HhXifizymKWGz3AL1BG8GtJZvcZtq8jFUwVxEmsB3nXRnBzhUjop6LaHVgo2hLIQLX9W2FBso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715608896; c=relaxed/simple;
	bh=aO3s/NcLi8t5Jh4SXvRxtzUqiOd0Q8FfymiyrdG+uNE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rP9fOifmZJY7CsJp4bBq5MINvHRx87SMlr68nVoSZ8za0wK++a3pWJEkN/VugViN96jyqBE9zqg+SHEDkUaPEmeVL4tyTGHL1gfu8hpmQs5pDUunDIjNNidz8nw1sWBWMvcLO32FYSTZ2SFMjaKPk3PmM0ieyB7Qo52gmI+zFcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotsplots.de; spf=pass smtp.mailfrom=hotsplots.de; arc=none smtp.client-ip=185.46.137.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotsplots.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotsplots.de
Received: from build2.hotsplots.bln (unknown [217.66.62.140])
	by mxb.hotsplots.de (Postfix) with ESMTPS id 23B0E8C03EB;
	Mon, 13 May 2024 16:01:32 +0200 (CEST)
Received: from mf by build2.hotsplots.bln with local (Exim 4.89)
	(envelope-from <faecknitz@hotsplots.de>)
	id 1s6WFA-0003yi-11; Mon, 13 May 2024 16:01:32 +0200
From: =?UTF-8?q?Martin=20F=C3=A4cknitz?= <faecknitz@hotsplots.de>
To: mhi@lists.linux.dev
Cc: =?UTF-8?q?Martin=20F=C3=A4cknitz?= <faecknitz@hotsplots.de>
Subject: [PATCH net] bus: mhi: host: fix MMIO registers byte order
Date: Mon, 13 May 2024 16:01:25 +0200
Message-Id: <20240513140125.14485-1-faecknitz@hotsplots.de>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: --------------------------------------------------
X-Rspamd-Server: mxb
X-Rspamd-Queue-Id: 23B0E8C03EB
Authentication-Results: mxb.hotsplots.de;
	none
X-Spamd-Result: default: False [-50.00 / 500.00];
	 ASN(0.00)[asn:33811, ipnet:217.66.48.0/20, country:DE];
	 IP_WHITELIST(-50.00)[217.66.62.140]

MHI is little endian, but host may big endian.

Signed-off-by: Martin Fäcknitz <faecknitz@hotsplots.de>
---
 drivers/bus/mhi/host/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 173f79918741..b59c276a68d8 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -588,7 +588,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	/* Write to MMIO registers */
 	for (i = 0; reg_info[i].offset; i++)
 		mhi_write_reg(mhi_cntrl, base, reg_info[i].offset,
-			      reg_info[i].val);
+			      cpu_to_le32(reg_info[i].val));
 
 	ret = mhi_write_reg_field(mhi_cntrl, base, MHICFG, MHICFG_NER_MASK,
 				  mhi_cntrl->total_ev_rings);
-- 
2.11.0

