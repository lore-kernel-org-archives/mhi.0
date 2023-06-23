Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42F125CD
	for <mhi@lists.linux.dev>; Fri, 23 Jun 2023 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yyXUjWCAlWpegeeP3K+qGmg2LllPAIpv/xP8Xpl32WI=;
  b=WNpEcGRn571MPELqxpUAnUaAd+wthMvgWsZeSBlG9+nslQAvB0467vBy
   +dT+w0mrKtvGj6kEa2+EL8nuFIopX4jUrAeLrjGVqXV7Bg9MGGiQHyXqm
   KujHAwsBPr9y9YnvcAFACQLjPrzg424iTWmZSHchsQwA6ZG8Jt6C5nZ2g
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,153,1684792800"; 
   d="scan'208";a="59686168"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 23:15:11 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: keescook@chromium.org,
	kernel-janitors@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/26] bus: mhi: host: use array_size
Date: Fri, 23 Jun 2023 23:14:41 +0200
Message-Id: <20230623211457.102544-11-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230623211457.102544-1-Julia.Lawall@inria.fr>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use array_size to protect against multiplication overflows.

The changes were done using the following Coccinelle semantic patch:

// <smpl>
@@
    expression E1, E2;
    constant C1, C2;
    identifier alloc = {vmalloc,vzalloc};
@@
    
(
      alloc(C1 * C2,...)
|
      alloc(
-           (E1) * (E2)
+           array_size(E1, E2)
      ,...)
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/bus/mhi/host/init.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index f72fcb66f408..34a543a67068 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -759,8 +759,8 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 	 * so to avoid any memory possible allocation failures, vzalloc is
 	 * used here
 	 */
-	mhi_cntrl->mhi_chan = vzalloc(mhi_cntrl->max_chan *
-				      sizeof(*mhi_cntrl->mhi_chan));
+	mhi_cntrl->mhi_chan = vzalloc(array_size(mhi_cntrl->max_chan,
+				      sizeof(*mhi_cntrl->mhi_chan)));
 	if (!mhi_cntrl->mhi_chan)
 		return -ENOMEM;
 

