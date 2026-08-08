Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD81A6825
	for <mhi@lists.linux.dev>; Sat,  8 Aug 2026 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170743; cv=none; b=mAEcmVYWK/X+pjzG4CuWYZP4rLjI7W6xKM9ZrWFGH23mTMbezzJPyIZIjd/Auxu1QY8rQIXU0f6XDj/oaNoeKJA1jFgZzF6R1mVY0GWAOx3gxZsRWuv7pca+JFTMFNjnbNcZoOz6d2jv1Vb5GK88anwSxVqZvdWicXWJBQ/5yiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170743; c=relaxed/simple;
	bh=utJwx9x/emAa/FX5+FqoqFvE8ykdtMHfQcVG1Wtfo0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YkPzGuJzdv8iCdshwb+Yym5PvjlJwa+veZIkkxubLeTZuRdG7n7kSow7+ub2O53i1/zw/bhYKqugVCdYkb0fTSmHRpJK6iYdLZ3JvnQXGDgfqamKpt9V++xy79tlJUXNlCe/ROIFZZIN4YsTTja+2CPgPu4o1Bvjd0pFRz4zQS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGNg+cjL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGNg+cjL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacf197759so5182615ad.2
        for <mhi@lists.linux.dev>; Fri, 07 Aug 2026 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786170741; x=1786775541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=opM1ArZY9ycrOafIY5Aeu7mw/sEReWno9u0hjjJ5rx4=;
        b=IGNg+cjLFRX4n/7vtPsWOpTmCb7Y/xjST1YIWiyvOeJm+jPoXrFVpHFfwbHlurcQam
         6I1VBhcgizzVjJamPA9dCOrQLTH2SvShlZ6+rHw9MLDqSl/EDZKq3dwwMVU4wBvXVrNG
         T/Cdb63vIJTK2ugibszs43RyOd1uHTgZ3kG1jPIZ9AHFRDDt6nc4XO1ZazQq6PaW/wdD
         L3aT3X9qOZ72rB2w4uOCF/KwG38UNqVF3O7CQf+Wj4KCjAin5mfwlvL0K1rsDDW5/sNC
         mgUf9Ie1Rkc+u3GWeED+z7Gy8s2jIkk9P/Lbod8N+NLM/bFoyIJ4vQRVXD2rS17E11nN
         V24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786170741; x=1786775541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opM1ArZY9ycrOafIY5Aeu7mw/sEReWno9u0hjjJ5rx4=;
        b=gIccZRVY++5MRW4KFL/gHIAt2p/emBw6KegpEQyN3pUhfK2bLW3/Gjyyeg94ZW6EYn
         J5YLldm/9aC6vS33Eiol+QCzpwZdISM9hzf5nguAqgfPyPc97eMBtZXj2wKE7EqWAQyx
         LbQPB7Af3cFMO2D5/Ipyu+2JVSd9/IeyC+mc2aF8ZAnD2ESjkFOn/zSGnrGd7oRkVV9H
         ZjrBY2Th21ToBep3lSOJC97tJyPz8Jcs6l4XV2TC3GBwSrcNrOp9vziYeQYJVin7qeVC
         F4BzXghL3HEHwiwBd6Cft4NWsQBSDAGNgRhMZqVYLOHihd2Y5h4fVWJctixZ0E6uK/SD
         D6vg==
X-Forwarded-Encrypted: i=1; AHgh+RowX3oUNG3k+84hMLq+UUy6v8iqWuFcXY94/83j7XBPKWLDflUyWx6mpjmjPbeRPVCMJHo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoykQlyL2d85HwxCc2/0X2Rj9S1BCK1vOm7J5FQ0MD+6841XAd
	o8GN2XJNJ7/TH+coiXu715lcb4UOySxBpUV2dqmZb8XLAN2vorCp7B98
X-Gm-Gg: AR+sD13K1q5h6DO9ukeswD9Ii3Rc/er9OsWrdQbx6wy6EJcqotxacCaD802YgA7XfG+
	7/IvQ8lkW/E7jfqkkJF+ZGnPTZ2rvfy+NqDNxQ9WNT8t2WONBFUU10bZCCBHoFoUqL0WbN+jOo7
	1AxGgELY3oY5jSpcCBNAJW4muAVusqDAiGv+GbyC+j9SUyN3E44p++ZBFXWXtUYZ5yo5Gqq4mY6
	WUFPd/SKmfRbg5i1ucrd+tAv7qMei7Dg4ATOp2i0657NNggcMY1ZvvxM0cCC2CjWFjGlN8WAiRA
	mSf9pB8D3QB8CIuGIwhiSTDpa/1/YxPbOU7CnBTrEAzG8UWcSZaHA/H1GR3aBMCoiX2Ndu1EwkZ
	lsFh9PhSQHVbmxR4SRsrSJtxyNRlQrCpmIxf8py1uANrjRAw1SedHUZSDbRANgX3GESfwsAhwDn
	fofE44P7/SjOMC3rMoGmeKxIH5NkGGLY3bgrZkzNvE5h8=
X-Received: by 2002:a05:6a21:6f17:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3cbc0175426mr12832407637.9.1786170741232;
        Fri, 07 Aug 2026 23:32:21 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af2d8sm1484585a12.10.2026.08.07.23.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 23:32:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
	Daniele Palmas <dnlplm@gmail.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Slark Xiao <slark_xiao@163.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: fix usage_count leak when autosuspend_delay is negative
Date: Sat,  8 Aug 2026 14:29:16 +0800
Message-ID: <20260808062916.2604668-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhi_pci_probe() calls pm_runtime_use_autosuspend() when runtime PM is
supported, but mhi_pci_remove() does not call the matching
pm_runtime_dont_use_autosuspend() during device removal.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during driver teardown, this reference is not dropped and usage_count
remains unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call before
forbidding runtime PM.

This issue was found by manual code inspection.

Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0d0d9c7ffa4b..8efff3e0a31c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1479,6 +1479,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_forbid(&pdev->dev);
 	pci_disable_sriov(pdev);
 
-- 
2.43.0

