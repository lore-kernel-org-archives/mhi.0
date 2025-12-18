Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269282E88B6
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090574; cv=none; b=iZkPtjeWUhjYK5sC/E66dsVEiVFLajeQcx6mw/+UiEVemR+DHeo4PF2dZaS91FKYhcyMgmQZPADG7EVIsnKeRuMdmLzTA1D8sbPhmGuJDY8U+jLnXqb8+JCbJ+IuljCkdzulH6z8FVGC+LPZd5BzwZLfIImvCGVrhOd0fWuQohA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090574; c=relaxed/simple;
	bh=TfNoqkkmLOkqz2jYFrsq7Qx2WYAXW9MRzz4s7xDFcFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tt+eW5fkj9OViXlDHXrOYs3rZ2ytxKVTj67Ax/uBs64/dTeDIlYFqRFfjjRHhzU57cMa3FsOoGOErN9S18XUtb0/A7zbaLP5jvtmWieo+Mk/neIZ/CzCHunAnqc5P9pj7bypzGFgEAhgv6eqKnIwDAXdbZDa9EnwLnaT0pafFUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hFA+D3cY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hFA+D3cY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so214721a12.3
        for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 12:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766090570; x=1766695370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWySTvtz3dhKwkxiZm5piaCDgiFtDwfMFqwVYzPw2jw=;
        b=hFA+D3cYnoRMpApWPYytImz8H0gloylUCdxjygtlITSzWhGfvMtYNNjNSek/NJhxec
         1zjqHprSZTJd2KXdHohTLCS+v32gkm1YwtD+yK/MHufS2+8HQcu9qkEMgIVgqEUmEOz/
         2NzQjBrIQSyJ4HX1XwN7h98gBc5joErFwOLtxbL/ZPirekmGtnkQfxB8Naov2cCSE2V/
         6Thz3wfgdj0SaoIuy+lsUSCQSXcdyURc2ETges+dGrT7AbetUFnaO854Ozjq4DtZvm3o
         14TMe7befWdscHk+to95QxNDDyClyUqoujnMt+/i4R9TOlAXEDkppvD7VIkhy3eQbikR
         5OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090570; x=1766695370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AWySTvtz3dhKwkxiZm5piaCDgiFtDwfMFqwVYzPw2jw=;
        b=KvksFkLkhTCz1vAfDhUEtoah3rt2U4SbBB1CZJaNYrrggckWgQdI3r3dSuFKblJKAz
         CJMa8+PKWqP68fdEQxfYO0iUh/y9Yp07Z21BuOBoSN68p4ZX3G8zYKMgY4yBYLxUdesF
         qIi1DakHvYTK6/VMkID65EqGi+9qbERYxgP4F1hc67bv5clVT6sXH/kzppWfKxnpGrmM
         LasT49rWwmVfLYTTsFF3zlFAkN0O5YM7QK/fAQSkCRX3RkURIpdb68K/UIaihMhgc7VV
         fyYMdQQw2WbPgPWmaujrfjA/mfb4oMVoBX36NLV7m5zfZGf0HQpDY8GocNG03rqCgIAW
         EH/w==
X-Gm-Message-State: AOJu0YywAaokKF0yqBPABxIAEYOwLIHxhiqOcKLOzTfudO5dOblrhuda
	y4LnPhcMxh572iLedT5uZbZSroNlvbT9hc2MrMacNhp5l93JJD69jh8xHVivyyib1Yg=
X-Gm-Gg: AY/fxX7MClBZTSmH2gWtTf1YOdpL70K2SYMU/IL8LPEmpVJLGgIPgwWnpguWjv2IJ4l
	Z+R45L3e8Ff9Py1ucmC4mDqSKXbUkLRQsuK3stnv13x4sA3Nh9H/3cwIml9VDNKkaSN1ayl+pLm
	V4bLukfsScB6P1JAUg1XXw58E4tGog9tyv8NT7cNRhYK1y4FYJxs1cliyWsHkDdB3TqqeYMIHjJ
	RTHOuLe7Mp3AOcBd22MSiR38i/NehQO9RWmK2DEUPa93hcscayf98j3wtFOK4wm2dh9GHDrTguH
	SXvkO0lNonPbLJCZlpEIKPUrqeSFgXhP6eq9BT7N9rAZbQCYVswDPB6ciePwMbxfDaGciDxJoV1
	BYyezR2M9AfSWxLxCnABp2EtIChaAXDBTuIxDaX+Hf2EukiLaPWDxkFYszJFmiCEAbydXv7LQMx
	sTp7wvTwJ9dz/gLhg7
X-Google-Smtp-Source: AGHT+IHMfiMGCf0YoD8f4MOehHnb4tGUdxYLtrvwwgomiu/kgdhz4PIvouWs6MJ5HiEloPqOCQTXFw==
X-Received: by 2002:a17:907:c14:b0:b80:1309:aa09 with SMTP id a640c23a62f3a-b803718387cmr65389066b.47.1766090570493;
        Thu, 18 Dec 2025 12:42:50 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b8037a604f5sm38457966b.11.2025.12.18.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:42:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/2] bus: mhi: host: Use bus callbacks for .probe() and .remove()
Date: Thu, 18 Dec 2025 21:42:15 +0100
Message-ID:  <e8032b3c2a8953a4a2b84dfa79a260c35f1d71b7.1766090211.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766090211.git.ukleinek@kernel.org>
References: <cover.1766090211.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TfNoqkkmLOkqz2jYFrsq7Qx2WYAXW9MRzz4s7xDFcFk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRGc1lKdzluQ+MGcjj+bu8gTVnx8irr/WtRqhc aBbAW7AN/yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaURnNQAKCRCPgPtYfRL+ TjiVB/4zh5xiU7gbg5Q1jjcD5KNz0Pvwp6ar/mUOA5vbrO2iu2YFA844yhGAa/TqKrIPFsVZK0m H+FvTnFd5reEyJKlqiuGDHqovd0gwYIB7rhJYtGAmGbhPw0ajU3KyUttABkgfgZIA49CmRXaAD3 p7A7Y3PZl0TUTVOJLA+qFIYe8eY7LDx04iNgGFm4iP8ioBrYM9vAReDb3JBVempe5M79O9+cTLJ CvQEft7MoTNRteXpvhFhUsxqYwZ2IeEggnOzc/XuKqhXkwUvu0bRy+mQ+oqdOYDVvSfTQ2DIYh4 tmeC2GXzKM9oWGxZGZtRl/tLFnPh+aJM5CCcZtDFZQ6DMdcN
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These are nearly identical to the driver callbacks, the only relevant
difference is that the bus remove method returns void (instead of an int
where the value is ignored).

The objective is to get rid of users of struct device_driver callbacks
.probe(), and .remove() to eventually remove these.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/bus/mhi/host/init.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd1900..8a0fe09d974a 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1265,7 +1265,7 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
 	return mhi_dev;
 }
 
-static int mhi_driver_probe(struct device *dev)
+static int mhi_probe(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1341,7 +1341,7 @@ static int mhi_driver_probe(struct device *dev)
 	return ret;
 }
 
-static int mhi_driver_remove(struct device *dev)
+static void mhi_remove(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_driver *mhi_drv = to_mhi_driver(dev->driver);
@@ -1355,7 +1355,7 @@ static int mhi_driver_remove(struct device *dev)
 
 	/* Skip if it is a controller device */
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
-		return 0;
+		return;
 
 	/* Reset both channels */
 	for (dir = 0; dir < 2; dir++) {
@@ -1407,8 +1407,6 @@ static int mhi_driver_remove(struct device *dev)
 
 	while (mhi_dev->dev_wake)
 		mhi_device_put(mhi_dev);
-
-	return 0;
 }
 
 int __mhi_driver_register(struct mhi_driver *mhi_drv, struct module *owner)
@@ -1420,8 +1418,6 @@ int __mhi_driver_register(struct mhi_driver *mhi_drv, struct module *owner)
 
 	driver->bus = &mhi_bus_type;
 	driver->owner = owner;
-	driver->probe = mhi_driver_probe;
-	driver->remove = mhi_driver_remove;
 
 	return driver_register(driver);
 }
@@ -1468,6 +1464,8 @@ const struct bus_type mhi_bus_type = {
 	.dev_name = "mhi",
 	.match = mhi_match,
 	.uevent = mhi_uevent,
+	.probe = mhi_probe,
+	.remove = mhi_remove,
 	.dev_groups = mhi_dev_groups,
 };
 
-- 
2.47.3

