Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15852B9B7;
	Sun, 19 Jul 2026 22:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500354; cv=none; b=pO0MMirSAj6qb22Av2OC99Ma09o9FO9BaX5psFcnvz8zowHowsEI+FwECRE5BnifBlntoIQEi8X3ESZDOQ//lwZIKo8XXSHjWQoNQwhL3/DE2b1tRhY0hDVAyXZxZeAXDEffw5Jbin9nt75rKV+/Fl+1dpYjmrmnMukuK0S3txo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500354; c=relaxed/simple;
	bh=7MJdvuABFDfcLYxJ6m9YURmBG3d7tsfxVUhMsmQY09Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpRxdhkN8d1zI15pciLyF2zv5W3/W9X4bF/z/A5tos3OBUtElf1PAmoQtw2wRHIB60Y1QgVclNf395ySCNrG3+52aCIq3yVQ8+NJ+7XCBY95zp/RMV6S7XxU7pxuvJ2jDGhgfmTNsmCi9w6AQAnD0KRkIVvHrpZyU92aozOVa10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1WoYh981; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1WoYh981"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OH7T+DxBbfZfJHoq86MrOY8t6oNhr0U3knSYSm9Qhkw=; b=1WoYh981VXl2VbbA8kMkJjrhEZ
	axEQbwvJOOhFDD1BY+sGB4A8stq0epl1yxS+RnUKmEXUo4ym3EZKT0YVkXrYVptRmXzo5p6Nq4nxP
	NidN0wTYdXymHXqwqQMYf5+aQhZzDZTxseH5ZtreSXFDB5VDhBgmcH7v8QvaKZkPT/6bJM7pR2e6t
	pLkAwsV6LC+k6zpZdpVuehaPC8n95X0LhIoiRyKuYsm1LNCQY/4H9HB0ESoUkfeNh/wk0Esqud22b
	26fT2A0n8kBIcPT9wUcxzkeICSLbCeMHkN8L9ZydrZrnjzj/W2tG905/NjsuMHW/tYeLMMYC/OXUZ
	f6oOSz5A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wla3l-00000005RMg-08fM;
	Sun, 19 Jul 2026 22:32:33 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] bus: mhi: clean up some kernel-doc warnings
Date: Sun, 19 Jul 2026 15:32:31 -0700
Message-ID: <20260719223231.2855431-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up some kernel-doc comments and warnings:
- use correct format for struct members
- add one struct member description
- add one function parameter description
- mark one enum as private
- add a leading '*' on one kernel-doc line

Fixes these warnings:
Warning: include/linux/mhi.h:108 struct member 'target_link_speed' not
 described in 'mhi_link_info'
Warning: include/linux/mhi.h:108 struct member 'target_link_width' not
 described in 'mhi_link_info'
Warning: ../include/linux/mhi.h:159 Enum value 'MHI_STATE_MAX' not
 described in enum 'mhi_state'
Warning: ../include/linux/mhi.h:212 bad line: for UL channels, multiple
 of 8 ring elements for DL channels
Warning: ../include/linux/mhi.h:236 struct member 'wake_capable' not
 described in 'mhi_channel_config'
Warning: ../include/linux/mhi.h:449 struct member 'M0' not described
 in 'mhi_controller'
Warning: ../include/linux/mhi.h:449 struct member 'M2' not described
 in 'mhi_controller'
Warning: ../include/linux/mhi.h:449 struct member 'M3' not described
 in 'mhi_controller'
Warning: ../include/linux/mhi.h:528 struct member 'id_table' not described
 in 'mhi_driver'
Warning: ../include/linux/mhi.h:543 function parameter 'mhi_cntrl' not
 described in 'mhi_free_controller'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org

 include/linux/mhi.h |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

--- linux-next-20260717.orig/include/linux/mhi.h
+++ linux-next-20260717/include/linux/mhi.h
@@ -117,8 +117,8 @@ struct image_info {
 
 /**
  * struct mhi_link_info - BW requirement
- * target_link_speed - Link speed as defined by TLS bits in LinkControl reg
- * target_link_width - Link width as defined by NLW bits in LinkStatus reg
+ * @target_link_speed: Link speed as defined by TLS bits in LinkControl reg
+ * @target_link_width: Link width as defined by NLW bits in LinkStatus reg
  */
 struct mhi_link_info {
 	unsigned int target_link_speed;
@@ -173,6 +173,7 @@ enum mhi_state {
 	MHI_STATE_M3_FAST = 0x6,
 	MHI_STATE_BHI = 0x7,
 	MHI_STATE_SYS_ERR = 0xFF,
+	/* private: */
 	MHI_STATE_MAX,
 };
 
@@ -227,12 +228,12 @@ enum mhi_db_brst_mode {
  * @type: Channel type
  * @ee_mask: Execution Environment mask for this channel
  * @pollcfg: Polling configuration for burst mode.  0 is default.  milliseconds
-	     for UL channels, multiple of 8 ring elements for DL channels
+ *	     for UL channels, multiple of 8 ring elements for DL channels
  * @doorbell: Doorbell mode
  * @lpm_notify: The channel master requires low power mode notifications
  * @offload_channel: The client manages the channel completely
  * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
- * @wake-capable: Channel capable of waking up the system
+ * @wake_capable: Channel capable of waking up the system
  */
 struct mhi_channel_config {
 	char *name;
@@ -350,7 +351,9 @@ struct mhi_controller_config {
  * @dev_state: MHI device state
  * @dev_wake: Device wakeup count
  * @pending_pkts: Pending packets for the controller
- * @M0, M2, M3: Counters to track number of device MHI state changes
+ * @M0: Counter to track number of device MHI state changes
+ * @M2: Counter to track number of device MHI state changes
+ * @M3: Counter to track number of device MHI state changes
  * @transition_list: List of MHI state transitions
  * @transition_lock: Lock for protecting MHI state transition list
  * @wlock: Lock for protecting device wakeup
@@ -507,6 +510,7 @@ struct mhi_result {
 
 /**
  * struct mhi_driver - Structure representing a MHI client driver
+ * @id_table: table of MHI channel names that a driver supports
  * @probe: CB function for client driver probe function
  * @remove: CB function for client driver remove function
  * @ul_xfer_cb: CB function for UL data transfer
@@ -538,6 +542,7 @@ struct mhi_controller *mhi_alloc_control
 
 /**
  * mhi_free_controller - Free the MHI Controller structure
+ * @mhi_cntrl: MHI controller to free
  * Free the mhi_controller structure which was previously allocated
  */
 void mhi_free_controller(struct mhi_controller *mhi_cntrl);
