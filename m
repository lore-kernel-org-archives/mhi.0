Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCADA2C2ACE
	for <mhi@lists.linux.dev>; Fri, 19 Sep 2025 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267854; cv=none; b=nYZ451pIFyDaa+oxZfzNeAUgx4Ubq9wRLwO4AB02Kt8Kqfcp8xQ0OwSA6+MO9DfVe36Tax8nK0LRo6XxhsYb94aztl/nT0YtsCnchRyjQ//OrAc+4GXF86r81ppxIdZ8L7G0VlNb3mcGOFUMxv+fTdnLNQrsa2hr/qqM+Bn5UJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267854; c=relaxed/simple;
	bh=047gxH9Ln/Nh4q1TaIByviHoFLLL6DAEUP/a6yDoQBA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jEKUUYy8TMksigA9104RvY+c4teOjtSFFIRFp29Y7FzbVA5n225D5iATLb7HvbjZvifFAdsyDkJCCO+VV//IIwoI4v4rWjhIdHJF1nS9Efw4dE7hdCFFvU8SVSIY4pkHrXfUsvKI8bvPmkNdPBzfc1gogCrfDDBPbk8+Oa1gWto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ywdJqz0E; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ywdJqz0E"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-afe81959e5cso180902866b.1
        for <mhi@lists.linux.dev>; Fri, 19 Sep 2025 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758267851; x=1758872651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7PgYC9jmyfrCZbvdyfHm60Addy+L150lAxZLyQ7EXQ=;
        b=ywdJqz0E7YVjzfH37kzEMypySzr/R2EfirE4D0MDvGjDOOZ2vD1TbqX3g1sM9Azt0M
         ydvuQeCkTebC8NzK2bPyLi2UsgsevrCtZuWCqCZrWcJZBJJYt6ecfpVlQm6gCAUS4tFQ
         9WzVbeabYW6PRFm2L5ThBEZq2VtXzBp6FNSiOGOihjBWIiaqw0qbzW7TEdOe+ZuBO4h3
         sivFN7eElm1SGMRFGB16J/1FAX9h7iDZgpbEhv5w0Wa1rNixQKn/J6RIPTvUYizBpaAF
         /oT7UgUJwvfTX4kLiCOb5tds1uNZFChvPGB11yX3BHlbbO6EUqDVR+Mc+25PO5E3o2GZ
         gZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267851; x=1758872651;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7PgYC9jmyfrCZbvdyfHm60Addy+L150lAxZLyQ7EXQ=;
        b=Sflv465N1Lx6fho3abWZ6kXTdvrZbP9fvi++FUWg6V8ScCwOEy3XMJ8dcYhS4m0ibI
         b9hnEbro80eMiouWexF2kAeibiJQTh4O7Z2AoEDuV2PfkzZt2uQbXuQVkPeBstNiLoSN
         sj9FJRuXQ+YRTdUNQ7A2GyFLRyK2RqIHBmE/aWfjXsLw+b13o2W0H2ZR3kicgjojwS38
         z2ipwYUDk+3JjgoRFcXwKzdTDj+QxrB7dFD41nNzNMQVC/fGd1aBsE/dH3RzOlDifvL/
         JbGHpKZ4xFApAxI6zbcUzs2H1nyHCcHN1MNgxBeIdGsyW4wl4WcSIfoaFBN2ppG6cz79
         /Mxw==
X-Forwarded-Encrypted: i=1; AJvYcCXqDRf0dkWWJfYnvAAz4F/dPINyxhYINIi/KKPRX4WOXcZjfGZncdPs2jVl3m4TK3p+B9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYfWYObaocLi4l/lnaHJm4Zv9uzziBbCaksw5R+bB4iWd4Zbt1
	R6LCXrBiMXpfW+zJh8HSWkMJlrH0hsOo6MkzczsPY048GbqGqbSwpKwTryks1GwK0tR0SgKn6+t
	b7vG5rPw9Gw==
X-Google-Smtp-Source: AGHT+IHgY7aJWWyQMnzXevoWxP2gnJgXATXyRzyJl6hO+lIdu02UdQfQvHFWeVcH0R9ftY6JK21TYjjEYS9Y
X-Received: from ejcfj10.prod.google.com ([2002:a17:906:9c8a:b0:b23:3ca4:c982])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:794c:b0:b04:5b3d:c305
 with SMTP id a640c23a62f3a-b24ef9721cdmr270071166b.17.1758267851262; Fri, 19
 Sep 2025 00:44:11 -0700 (PDT)
Date: Fri, 19 Sep 2025 07:44:08 +0000
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919074408.868220-1-abarnas@google.com>
Subject: [PATCH] drivers: mhi: make mhi_ep_bus_type const
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Because driver core can properly handle constant struct bus_type,
move the mhi_ep_bus_type to be a constant structure as well, placing it
into read-only memory which can not be modified at runtime.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/bus/mhi/ep/internal.h | 2 +-
 drivers/bus/mhi/ep/main.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
index 577965f95fda..512da7482acc 100644
--- a/drivers/bus/mhi/ep/internal.h
+++ b/drivers/bus/mhi/ep/internal.h
@@ -11,7 +11,7 @@
=20
 #include "../common.h"
=20
-extern struct bus_type mhi_ep_bus_type;
+extern const struct bus_type mhi_ep_bus_type;
=20
 #define MHI_REG_OFFSET				0x100
 #define BHI_REG_OFFSET				0x200
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index cdea24e92919..86e003bc44e0 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1703,7 +1703,7 @@ static int mhi_ep_match(struct device *dev, const str=
uct device_driver *drv)
 	return 0;
 };
=20
-struct bus_type mhi_ep_bus_type =3D {
+const struct bus_type mhi_ep_bus_type =3D {
 	.name =3D "mhi_ep",
 	.dev_name =3D "mhi_ep",
 	.match =3D mhi_ep_match,
--=20
2.51.0.534.gc79095c0ca-goog

