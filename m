Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7B2DCF6E
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090576; cv=none; b=e7eDEeEZ/WeJZXIFFfVWrx0zjtqmHRDbuk37kJh0CIQ0F+3KupEpCRs2/yI+8XPcx9XHIKb9pWvp9DAhXxX1DL/jKsHR3pheCOicCuFo1tlHoMkBLlT+3n6J5RP5znWbAt/EimNsvivw0k0aGyOY8Ew9kSrhGL5Rg/YDDn3sj3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090576; c=relaxed/simple;
	bh=4ICv3yuhPrWHwgL1jUFMIG72Z1BgncvRKKGH0bYdP14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rZYchZ/vdjLZ/uZzQ6ueZOssZy0Cy8zDADMQn18d7ilf+wOTLE2Hle+EJxEyfaJljLSruvDW69G3y3KVM9EHVJAZ15qTlctBr+Vtkc9JeNv6bMCXEgqTpO+/0DbfwWxKNCzb+rP+9XowcqccrCA/sM+6PcQSfRjPNbSrtPHfb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gfz2UlXz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gfz2UlXz"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b55443b61so2297178a12.0
        for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 12:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766090572; x=1766695372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4g1ryvYz2NMxLIjSNGcYTJ//wVogM+BYR83E55tzQE=;
        b=gfz2UlXzpP5vtgPnJUTsujddmKxunUFecQPFQemQMwcv01i2Ptk6zRRTig56AUEimy
         XNCaJVcdNff+7fe1g5wZYPA1XoCPzsJX563v8n5qlRggA7ALhShmEAKBdHhFjmGS+Khy
         jyB5/GUxG5URSRi8YRt+JWo50XsuZECC5M9+WuVqeavlarT9s/mI4DAQ1PtjXZgQAjJK
         cjoxhi9fMDeaSqgK3N4f/z3TEz53JMQah2Mbr51c3H5gLTtPt4MlpqG0y0scqdxte2FC
         O5tLgTFZw1pt9WWVeitJAgiU6wVsbnKqDfaEqGgi96NTHfP+NdrZWQk0xZWhib8Ox5od
         lQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090572; x=1766695372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A4g1ryvYz2NMxLIjSNGcYTJ//wVogM+BYR83E55tzQE=;
        b=ZKNxI4PvdPBx8k74ZpQdsnm4Qo5OZ+YRjT/MZI/y2PTdrbiem0vHUAtng+ynEV74/Z
         SzSg8OEsOENXBD+FjjSzutzW4JR8IMVcPbWEGVvWdQPNzwFtBn+1sqCX+nXpzmc+VMTb
         RyFyhA/mqBnCSZOHnr5kQOLuG5AsvawhWGDHniA3IwNr6JmHyTRohJww75OaKYTtG8pV
         Gae0RmhOzu6cNHL7OH2DBgWDHtEtR630iUmlFzb1e1jyUBTnfTNAnIGhQ24l+rBcmZKF
         1xVUTHYZc+mYdn51kJzaNPCZnFINs/0n2BDAbLlUtQ9YG4ERKYj/UXidPZuww8dF/vRe
         m5QQ==
X-Gm-Message-State: AOJu0YxNsTmKm2NSfsuxLh09SN0lkfxHYrVY3QmrPuPsTmcrLp3eMX4A
	woBaOT5j+VJFzkGGVBeysHYr+1UwQR/RVNn1nov1y1xSk91yLDmh2ZWXGSjqWpfevY6XXWeEWnc
	7MT6+
X-Gm-Gg: AY/fxX6TpTO/I4QHTWK/yqgkf/hzpUSKGtYzklqd2+GL7q85+EkocFiKPGchKsGmCk3
	SEthFPOCJXP1qfpwwYlRA/F4M0MpC6akPmKRI82jP4hO8BiDLMNIZICtXPBbbQ+0yoG3oTl/Brs
	yR5BYbGX99vRWW7IAF+OPjrs0Jy2zwN/YgYbMti5dmdlp+gAgrxn4vSs63Iq8GLC03Z63UN9Djm
	Ij/QvyT6e7++GH+tWw23d2KI332RmDGvJCZ38yx5m2drDVlA0Vnu3D2iLdTQMwuhxx+dGVJGGee
	vplno3b4s9ecIBtBRyKT/jk8j4ONkDf4NDtqUJgahWzib6N8f4sfp/Pcz5VWnELrXEcggKhZFb7
	LOgvwO5414X9ri86sm/x7jXaTSk8YdTvtAhzJWbX+q6RjRVaUu4j9L0yxO0jT5dH8CyByksQMXN
	8a+NwOE1Q3yu8Y50js
X-Google-Smtp-Source: AGHT+IGNnpdBTKQikQZocIsWq3iB22zoBWwmboLhMYxqkAhxGrqfRLDHCiiACwlMqdCYJH9TsGGe6Q==
X-Received: by 2002:a05:6402:35cc:b0:64b:58df:cf24 with SMTP id 4fb4d7f45d1cf-64b8d24f389mr839814a12.11.1766090572290;
        Thu, 18 Dec 2025 12:42:52 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64b916b82e7sm365476a12.35.2025.12.18.12.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:42:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 2/2] bus: mhi: ep: Use bus callbacks for .probe() and .remove()
Date: Thu, 18 Dec 2025 21:42:16 +0100
Message-ID:  <2a79d99182a5171e83a07bf9f438ae31362f7e5d.1766090211.git.ukleinek@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4ICv3yuhPrWHwgL1jUFMIG72Z1BgncvRKKGH0bYdP14=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRGc4B+Cx+6lrqUdq7rJgJqKco6uBImN1TK7ym 0GbyAT+zdOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaURnOAAKCRCPgPtYfRL+ Ts7LCACyd1U3000e73Nv1IXXeQ6//AjKstvpejHgoauxmaGI6W3tf9Nawu36xzhcpeALS0Jdcl5 LGQ7dWXDHbikv28ppVKFJvzaB4zcH8GZ3l8YThYF3Mkw2W+z6i+tVadpLDrLClB788IQM5/rGB5 bNvfpUC302SwXHm+e34veYWO5RvmET9LhT4cEhRNsDzB+RUcbUQnn3/rOyHfNBgZvrPCOuIE8wh cy1lFiVuc8XLxrcYsMYdUpLABQfE3bwKiiBBiMCo5jvivw1JrHuLT/P34IiBYJsE8PJBVtFk2zC aC29/LgwIBOaqHNaTyd/jyDnFNvdWSgwzTfE7JDfD4ZzLyDg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These are nearly identical to the driver callbacks, the only relevant
difference is that the bus remove method returns void (instead of an int
where the value is ignored).

The objective is to get rid of users of struct device_driver callbacks
.probe(), and .remove() to eventually remove these.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/bus/mhi/ep/main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 3c208b5c8446..35922e7a24c1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1596,7 +1596,7 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_unregister_controller);
 
-static int mhi_ep_driver_probe(struct device *dev)
+static int mhi_ep_probe(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
 	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
@@ -1609,7 +1609,7 @@ static int mhi_ep_driver_probe(struct device *dev)
 	return mhi_drv->probe(mhi_dev, mhi_dev->id);
 }
 
-static int mhi_ep_driver_remove(struct device *dev)
+static void mhi_ep_remove(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
 	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
@@ -1619,7 +1619,7 @@ static int mhi_ep_driver_remove(struct device *dev)
 
 	/* Skip if it is a controller device */
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
-		return 0;
+		return;
 
 	/* Disconnect the channels associated with the driver */
 	for (dir = 0; dir < 2; dir++) {
@@ -1643,8 +1643,6 @@ static int mhi_ep_driver_remove(struct device *dev)
 
 	/* Remove the client driver now */
 	mhi_drv->remove(mhi_dev);
-
-	return 0;
 }
 
 int __mhi_ep_driver_register(struct mhi_ep_driver *mhi_drv, struct module *owner)
@@ -1660,8 +1658,6 @@ int __mhi_ep_driver_register(struct mhi_ep_driver *mhi_drv, struct module *owner
 
 	driver->bus = &mhi_ep_bus_type;
 	driver->owner = owner;
-	driver->probe = mhi_ep_driver_probe;
-	driver->remove = mhi_ep_driver_remove;
 
 	return driver_register(driver);
 }
@@ -1708,6 +1704,8 @@ const struct bus_type mhi_ep_bus_type = {
 	.dev_name = "mhi_ep",
 	.match = mhi_ep_match,
 	.uevent = mhi_ep_uevent,
+	.probe = mhi_ep_probe,
+	.remove = mhi_ep_remove,
 };
 
 static int __init mhi_ep_init(void)
-- 
2.47.3

