Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278B91C2A9
	for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfQWofrJ"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-67a2b003f8bso9577496d6.2
        for <mhi@lists.linux.dev>; Mon, 27 Nov 2023 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089162; x=1701693962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szORryW2l9J0pCg1kQG3OS6E1waFAt6BYGHK4qsw87M=;
        b=dfQWofrJxi8TWNXxNaWXcUilgZA2jPEBM2s/x0UEIn21pxvKKJGT6cWOsBoSzBkUvz
         Tnkm14nHRzDYU/zwkywEoevAp/PB7V+Gqrzy8W6oZEuff2bh7HcB+gwm3Y515dH8Lg8J
         vUqV1T3eWhToF2CtPJDoRpog9geC2kfV1YH/pOk9RJd+cR4t+uWlOHNuIQDlpiAwJyn3
         zaIG2GgcFnK+3APaUyeLa+tIbzhF9hzeXJFzi8C43ro6Q5z4hoT6KScBVy+oiyDT9y1J
         Xb13T/dLZfDpy1LdEICUkXP7OP4ML/kBeQOp/HyrpD9UxBKQ+sO8ggfqqIEwzs7+Vn+1
         8BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089162; x=1701693962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szORryW2l9J0pCg1kQG3OS6E1waFAt6BYGHK4qsw87M=;
        b=rnVLCJDnd/YhkmSt5dT9iVNpCs2+nInVr3po5avn8YlOoChL4ZOjlh3nsJg1ZhW2vO
         32eHYmLGakxc+g8pS9KyAGwtC0Yps6A5uzELwqDwk0bEuFaPyQk3fjh8ZFZ3ESHEEQft
         a594wPhbXzT2zUHPZEepNbOovyrcl1DDiY3WywmU3S/TJuT+AdRRBlnpSZ/e3UoGCPdN
         km+QV+NxTHOkO3i6xNSuDkh9R+PFPpcABBYI5vtFFyA3+N5GKtOHB0Y+gguJUslP2nOZ
         QIahGHLONAnA5iig/2e0xFDu372gNEVNdNYcBhnykIG4M9iYsIxNEc+w9Q8I+4Zs+1Hz
         /3cQ==
X-Gm-Message-State: AOJu0YzMB50ziRlCyv9y1wBc7ywAGXNTQ89V1sel0BSAArKNZi8A8eZB
	eXHmK9h8pf4E8J9pJfNgroPL
X-Google-Smtp-Source: AGHT+IGNZ+5w8hg9MvVkI8DO0QPnjtjCxvmdxlHAK2q1lIEDQmZD7Ge/AJWS0HSg8+MEFEMaOLLfag==
X-Received: by 2002:a05:6214:5596:b0:67a:191f:2872 with SMTP id mi22-20020a056214559600b0067a191f2872mr12122455qvb.11.1701089162091;
        Mon, 27 Nov 2023 04:46:02 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:46:01 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/9] PCI: epf-mhi: Simulate async read/write using iATU
Date: Mon, 27 Nov 2023 18:15:24 +0530
Message-Id: <20231127124529.78203-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
References: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though iATU only supports synchronous read/write, the MHI stack may
call async read/write callbacks without knowing the limitations of the
controller driver. So in order to maintain compatibility, let's simulate
async read/write operation with iATU by invoking the completion callback
after memcpy.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 34e7191f9508..7214f4da733b 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -234,6 +234,9 @@ static int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mutex_unlock(&epf_mhi->lock);
 
+	if (buf_info->cb)
+		buf_info->cb(buf_info);
+
 	return 0;
 }
 
@@ -262,6 +265,9 @@ static int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl,
 
 	mutex_unlock(&epf_mhi->lock);
 
+	if (buf_info->cb)
+		buf_info->cb(buf_info);
+
 	return 0;
 }
 
-- 
2.25.1

