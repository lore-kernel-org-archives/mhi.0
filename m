Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A5F377
	for <mhi@lists.linux.dev>; Fri,  9 Jun 2023 10:49:41 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30ad8f33f1aso1137445f8f.0
        for <mhi@lists.linux.dev>; Fri, 09 Jun 2023 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686307780; x=1688899780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7/b4G181+MHQIHp41//nlSYfR9ybEGflBKyQZuJUvw=;
        b=V5O8iujnQNkhCcIam1hTZkf+ZLG2/2Ubirq7lBYinzScSuNUsh1dWn64nlXwtR7/1Q
         ue+EfikKQnH35ogS/vMaGpOvcZxrmy3n+1/148N34kWMVX/W3OUXAaiPFocedngTr2lX
         aNFzcyuSEzk2LCKpXyHdZE1fCfh7HklYpwyaY9yIGU2Y02ydW6CNuxMRpq1gwt6T5TZE
         WCUFxegwcA77j91SEspEM3DxkkFM4+jT/QDNvnKwyuonr3leTfvyBS/l9rfXKg4lRCfv
         xNLELT0Tb3T9y+dIeKYd0FPMKUDO0phi6anlM5LYwuiF9QQW+LfLtazVvpAcCnT/+iON
         1yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686307780; x=1688899780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7/b4G181+MHQIHp41//nlSYfR9ybEGflBKyQZuJUvw=;
        b=ETrY/SuXjsrGgTTaHP73tobIhmWfG9zkLQokDxtXyUx/HwO/pGChyd4Esig5FvcLTh
         +21tg1hxfQEr+NzTLJXXaI65n2jZSgDYmMQZXuQssFKlmD+89hMTRURERd0feWkeqSEA
         12LR3+2+PU7rqqCqyML8lLZUEIXY4IUcTsBka+WaUVJY7lDcIalYkFANoxT7EicU/h5A
         Q40QlI749o6WBUshA0ytjP3S7bJEYlLd0U8yB1WFZk+NU5gP3RkXCcJZJrc0SRO4OlVS
         KcBI29HZzUIjWlZg8TzR+aUHnHG4TwVW4L4yfccCBSBJpCoQu5q1VlTXs5L+1lnBxLme
         tw3A==
X-Gm-Message-State: AC+VfDzu87cQXlzF9URrM9UGTNtd7yabZUV/xDuUIP4fMKlQCwDWs7hH
	WvI3JpRh+QPbN+4nP+kbMLABYQ==
X-Google-Smtp-Source: ACHHUZ5oqsdm6RcHcYynLSUxXU+NRtZqKnXmXX7d4X/lAxBhMjxzqQTGHG36+5LbULIK1GqQozrfaA==
X-Received: by 2002:a5d:4ac7:0:b0:30a:e643:2517 with SMTP id y7-20020a5d4ac7000000b0030ae6432517mr574141wrs.21.1686307780049;
        Fri, 09 Jun 2023 03:49:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm4127545wrq.43.2023.06.09.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:49:38 -0700 (PDT)
Date: Fri, 9 Jun 2023 13:49:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Damien Le Moal <dlemoal@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] PCI: endpoint: Check correct variable in
 __pci_epf_mhi_alloc_map()
Message-ID: <258e8de1-abff-4024-89e0-1c8df761d790@moroto.mountain>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was intended to check "*vaddr" instead of "vaddr" (without an
asterisk).

Fixes: 7db424a84d96 ("PCI: endpoint: Add PCI Endpoint function driver for MHI bus")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index 1227f059ea12..e7d64b9d12ff 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -112,7 +112,7 @@ static int __pci_epf_mhi_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr,
 	int ret;
 
 	*vaddr = pci_epc_mem_alloc_addr(epc, paddr, size + offset);
-	if (!vaddr)
+	if (!*vaddr)
 		return -ENOMEM;
 
 	ret = pci_epc_map_addr(epc, epf->func_no, epf->vfunc_no, *paddr,
-- 
2.39.2

