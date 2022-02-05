Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031342F21
	for <mhi@lists.linux.dev>; Sat,  5 Feb 2022 13:57:37 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 132so7499145pga.5
        for <mhi@lists.linux.dev>; Sat, 05 Feb 2022 05:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82GhfZZRDMo9PvRBNMhlDv8/XgN6bOyBCEdwPEA2qnE=;
        b=cMWCZ2FrVjIAjlIgYVqLw14sbvUJtfDx/FIjZBF+NRQ/s9m32TzrfSVpo/3wKwjWxA
         27/7VZ85vTBAqk0HFZ3lngr133AXk18yfXNxwT5UwTz2W3CuQfIzmjk7YlwYz8xcm/n2
         FRII+YIyiSh3JkcvpTXsXOj1I0BtCFhVGbn8rjwlosCPtetxubEN3lek9uaVFOWxJSye
         p3cWGCvxDaYdoKpX0HlobYAkbKLqQUYqI0aO7zhlLMhXDR95nSJk2C7QPuZ0aS2+Y5Qd
         QMDGWZPj0YS2C2gel6XebgaFbRMSbQEW757Km+mysbzdDeLEoGTyXl50XOUzXQOvmvzh
         /mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82GhfZZRDMo9PvRBNMhlDv8/XgN6bOyBCEdwPEA2qnE=;
        b=AzyvFuZ7PVZ9AWVd0T0e1quhmzHZCp1m8VrfIdZW5vu/uvz06AuUu9AoNbc+8dc7X5
         TNlKH92vZhrn/Nci2bg4hJc51fKse1M3YIEr96xrob9L67G/1ca3OdFfdPpGZTi7Jlip
         Dw02V7SfRagWy+UmlKnsXsKC7E58AerfYZ20aBPnzYzgpT2cQIK7TSSoDoK4huzMy+y0
         LUiRVrevuCmMvcIZn/ubrowltji8c5Reo1a4Y+FTKA2srbBOm2qR07RotbwPRAAX9pxC
         cWAJt9NtF63/AbGsOmSarK4avy0pv3m0XfHsa0OkbFR6Rv39Yf7dzbdoqJCA3DTG0loY
         ovqA==
X-Gm-Message-State: AOAM531YTlIZG2dpzL+IUkKCpOcR8TjshkeiVRTk1RJfInwEJPnuaFad
	YcISBzPYLRxuSrOwHYpqQw5K
X-Google-Smtp-Source: ABdhPJy+TshFlooIyplhRfrGvLXvhexddinSzYR9nt27oDl20elVUHvXHFCe6R7JzOp4FPYI0JzrwA==
X-Received: by 2002:a63:2c0c:: with SMTP id s12mr3017518pgs.331.1644069457236;
        Sat, 05 Feb 2022 05:57:37 -0800 (PST)
Received: from localhost.localdomain ([220.158.158.32])
        by smtp.gmail.com with ESMTPSA id z13sm6355533pfe.20.2022.02.05.05.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 05:57:36 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev,
	hemantk@codeaurora.org,
	bbhatt@codeaurora.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] MHI fixes for v5.17
Date: Sat,  5 Feb 2022 19:27:29 +0530
Message-Id: <20220205135731.157871-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here is the small set of fixes for the v5.17 cycle. Both of the patches adds the
default MRU (Maximum Receive Unit) value for 2 modems, Foxconn SDX55 and
Cinterion MV31-W. Without these MRU values, the MHI host stack would use the
default MRU value of 3500 for these modems and that causes the hang during high
network traffic.

It has been identified that the MRU value of 32786 works well with the firmware
running on these modems and hence the patch adds the same to pci_generic driver.

Please consider merging!

Thanks,
Mani

Slark Xiao (2):
  bus: mhi: pci_generic: Add mru_default for Foxconn SDX55
  bus: mhi: pci_generic: Add mru_default for Cinterion MV31-W

 drivers/bus/mhi/pci_generic.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.25.1

