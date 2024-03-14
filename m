Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D6274C0E
	for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429889; cv=none; b=siWr4wpqd+rjzSClt9U7WTT8Y70bTCKXjTKcuCaQNM7D50jhRomtgHdYuftheBcpRp+xEJYbERxbr/Tqv/Z1JjzdE9SdG4pxlTDSN+7e7zC6N0pLtXsaq2oMh0BHhToGNHCPFnsmU9uAjWrKUFPxs8S2WXcj/eXHQbuVA4Dar3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429889; c=relaxed/simple;
	bh=u+T142/W4OHi4TrqZYDBdEbmgdn1PJvXBdMP9ceIo3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgOdrfIk6oa2UMbi+W688sh9APuzEaqbsKGnVeKjpI+ZofawDM9GwJXJ4MaEKrW+6nauTQr+AS+VzGVvwf0rLvAWJgPIBU2AQQyQXjeclgffSM0cnEhCq3Rkb5bwocOc0+pc2rIsW09Te717rLDfUB2LEybhgy3f5drQfsGLpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STOyJWfv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STOyJWfv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6b6f86975so784308b3a.1
        for <mhi@lists.linux.dev>; Thu, 14 Mar 2024 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429887; x=1711034687; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UesLzv/s5weNz/WtSlaUPJ3gprn2+do0z55ESIdTIKs=;
        b=STOyJWfvSsu6B+M06/B2oiGN/GgI/bShjIKNJZA3zmWILahqSh1EmPLQu3v+gqUWY1
         JmBpeMSfufRALoTAIi+SL2TZxvvUIYpTbF0Y2Jo5oK320Ls7w9kSD3cNauZg7GF5otOs
         CnufcAYnaO4jmoQ7Yfhy3e6EnI7joCHNSpN2zDdYWZDGChrAlNBua1FEG5k4xmO6mMFW
         qmFZd/9/qStOXvtYu+Ug4O1A06iY4m4RiqMx9ouKjidKFc9UkrvqYY8okckTC/DOiJKo
         YorX9BIH4yKYwB4+5NUHfECnUC/Q2EQUZB0qdCcZsf1cLGa4xm/ON1krf9/K9yRODnoD
         lxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429887; x=1711034687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UesLzv/s5weNz/WtSlaUPJ3gprn2+do0z55ESIdTIKs=;
        b=xOwJzGOuqDpnBO2sEcQPdj5MvfCfQR4W1iEg8pItz/7G/W8SAqiz+MV/+FabnL5nwo
         R/o4UfWL95sDO8H9HWsHknGgm0X8CZHA95k4WO/3vjC3uHGiemGPmaGNLcnDqM+UxlRh
         fha/0rMIgrMj4C89lujcrc6bGvHU1TnfmVQxvrGGoVQEK35yxz2lnQwNIObnANdh5EHT
         6k83XL+Zg8rE+0RVd/BO/ivN70pHsZCf4F22yxT18Y87L8+uXqzhd6KCo3Kh2cfRU5Uo
         1Vz8AjQWvl0nr7EPBWgOyMxaO7pVuXdY5FBQOH0DDvsj80fqgNcK+nbCGaxLmUWKaEgr
         fPWg==
X-Forwarded-Encrypted: i=1; AJvYcCXfs0XkZZ5gNIQa++7onlUpE6L0vMk2662a3fo9dwnwxpWhV93UYLwmLQPPnhlMoGJ4WgKN/7WC+fMAVtuOhN0Jl4Vf
X-Gm-Message-State: AOJu0YyE4m4UvYwtKSFNIYe0kgt8jDu6xVw2Q7VYSdJzuiyKC8rtEgCm
	tH0Bj9nnu3mEiFnvnuinyNLsB7RfmJYa10+4ky6p3PgKqs3hKu4aA4RLUL7WHA==
X-Google-Smtp-Source: AGHT+IHQG5KLhzzNsvAOkfN5kVkEw1s96R6Mf6b+5IIQ0GHj3IiEjO1mYEkAkdOoQ49n+BrtdM4wyQ==
X-Received: by 2002:a05:6a20:12c6:b0:1a2:b33b:d6e0 with SMTP id v6-20020a056a2012c600b001a2b33bd6e0mr2571998pzg.59.1710429886716;
        Thu, 14 Mar 2024 08:24:46 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:46 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:48 +0530
Subject: [PATCH 09/11] PCI: epf-test: Handle Link Down event
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-9-6134e6c1d491@linaro.org>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
In-Reply-To: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=u+T142/W4OHi4TrqZYDBdEbmgdn1PJvXBdMP9ceIo3U=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaQb8VpKIpIa5FQmaHW85so3xvUG3jdu7yO8
 MV8jLLZotiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWkAAKCRBVnxHm/pHO
 9TcBB/wKPBWo7Z51yH6ZMP9ARLDl+xRfSnVueOjzfuJQU0rRD2off8VJhbSCOcELFIW+cCMat90
 Cnnu+PXjUtf0C/vXmThEaxNslVw045iRcOydgzgWH6cp8O3ZjC0PLUqbb2LcKyKxVnpTz9pe0Ib
 HykZ0yCgCQ7SSSzadoqKAqObqh2npoW0NeGs2Aj6PmGyNFeftCYzZ28PWINMmpL6AOH+WvkmD9/
 EdA79wTgjUDtsP5CG6WTf7l1G2oHngiWl9h7VcklbivUtoDbIoNqyy2uGelrkaW9NqhLpJfEEwX
 sZ8utoKYhryD+T0QQ1XEqVWTpIxdQm/kbSsabKO99Vos92Li
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
under any of the following circumstances:

1. Fundamental/Hot reset
2. Link disable transmission by upstream component
3. Moving from L2/L3 to L0

When the event happens, the EPC driver capable of detecting it may pass the
notification to the EPF driver through link_down() callback in 'struct
pci_epc_bus_event_ops'.

While the PCIe spec has not defined the actual behavior of the endpoint
when the Link Down event happens, we may assume that atleast the ongoing
transactions need to be stopped as the link won't be active. So let's
cancel the command handler work in the callback implementation
pci_epf_test_link_down(). The work will be started again in
pci_epf_test_link_up() once the link comes back again.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 84cd47ebac22..97245228c9eb 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -823,6 +823,15 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
 	return 0;
 }
 
+static int pci_epf_test_link_down(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+
+	return 0;
+}
+
 static const struct pci_epc_event_ops pci_epf_test_epc_event_ops = {
 	.init = pci_epf_test_epc_init,
 	.deinit = pci_epf_test_epc_deinit,
@@ -830,6 +839,7 @@ static const struct pci_epc_event_ops pci_epf_test_epc_event_ops = {
 
 static const struct pci_epc_bus_event_ops pci_epf_test_bus_event_ops = {
 	.link_up = pci_epf_test_link_up,
+	.link_down = pci_epf_test_link_down,
 };
 
 static int pci_epf_test_alloc_space(struct pci_epf *epf)

-- 
2.25.1

