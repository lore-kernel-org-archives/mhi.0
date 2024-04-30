Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5185272
	for <mhi@lists.linux.dev>; Tue, 30 Apr 2024 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457680; cv=none; b=UMzMJrnFQvgSZ2wBajGmKaHGGniwo8SbJbeay6TlBI8mYfUqUtANy3vYLUAFxOLbQoAjupZO6T2PyFPwzfZqr8ijFmtzJq5U/s352xv8Q8qC8WaVnTq92Ti1TVokJQ8ipLx/5OqTUM1dkw0sXgPRIiqxicTxHjL8D4Twbj8pFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457680; c=relaxed/simple;
	bh=gwJkiWxyW/wamW6kH7+GRx7VSH7hXsYT3WZXX3driJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+27HInfHPAVseQ/wMxmSkDxVDA2i7qdrJMK3BqwhGnKGgOxGla0OF0MXOG+tHn8CfeT2rk71OuK5WNJBOHhpfKfh9lQTt6AKNhJsweT9CCpWkN24Ys6M9gnK2iCI0Q7mT9VsrFZtuChssRkuEyqCbb0IFgaAjowlTVKUnKrOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yO3TGVLx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO3TGVLx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e5c7d087e1so45712935ad.0
        for <mhi@lists.linux.dev>; Mon, 29 Apr 2024 23:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457678; x=1715062478; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfACtQQSDUwMHO1/0RK0ntsz+YmSOQ8ynC0u7vL0q8w=;
        b=yO3TGVLxWqag+NZM0+IftScz3Jt/d2FX14LiI9h7qQ9ZEhA9kMa/c6vWWqvxF8Vw/W
         4nryInMs6rKZCFm3HBQZEfvrmSkfxvPElRqZwlUGj3Zzjgaj2pVl0YrBiHAFuysBJG6z
         7+E25upKlfMIncQtuAyLIwlgmw4Q+BDEDRjKeCbQ8hZgw9X06mVkqRLvC/dqjMsq45zv
         /s/SoPTJ9Ws0WFCt67gaYARt+3o6V6R5fc1L6jmIkuoPdVL6kwyd45om+jfaCmqPA90O
         kmI88RA/5hhLcYuyx95vehuCM1RZMOpFi/lQZk0F6WNwEOksyC1aqEZijYbp/r+NrpTs
         CFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457678; x=1715062478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfACtQQSDUwMHO1/0RK0ntsz+YmSOQ8ynC0u7vL0q8w=;
        b=ZsPo+UqCcfjz/A2aIwLsFSG06xAcxEp3JZpRzghTaqhfe8N5ulpNt8tnuWvoVAqn4s
         6QoKi/2BmlGfsYItT/IcERaHgdOg66g/GKmlhO2aEZCjegcQ3cwf/B4/edjYSpZ7ulVB
         i/WCAWa/Pmjr9wBcVTxU7Zi1o1qAXR4NE2OVafh/itxlzYNEbFbgUYZFQu6aNfcFszoa
         uwJTUSCoRN02xl6iwinEGhXnmx3mKpxZn74G5j3R0/GwV/ZjnKhASK/xPo8galVzWftz
         57q6GfWmdvuXfEXQZ5Tm2wY+cdAHE09f/ogntApnV16eW5RQwQjXhf50dXqPBW+AJdhx
         cjTw==
X-Forwarded-Encrypted: i=1; AJvYcCWA1OFo9pZLPKWD8SuIPtzf6+FaFQIPgui8Z7o0WYxtm7hdTtKSlhvU1pPX3l0zbzltzndTRa3tME60NverDZwnkZw7
X-Gm-Message-State: AOJu0YycBLC/2Ik5lrYvO9FiRj9yzLSiZgUL2HW5K6CDRI1Wc0517KLV
	XHZvI2f7el6OUj2CGfi3eDim7SZvr4h0g0S3RPgxBLtOKQXOIcbUFLkMfSDYGA==
X-Google-Smtp-Source: AGHT+IGWSiYL4QGZLQ9kxcs8EksybyJBj3Q5TS+tl4f5cOjnz0JQqoAPxUgOn1Wokxhf05hTLpZtWw==
X-Received: by 2002:a17:902:7087:b0:1e6:68d0:d6c1 with SMTP id z7-20020a170902708700b001e668d0d6c1mr12539439plk.40.1714457678284;
        Mon, 29 Apr 2024 23:14:38 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:51 +0530
Subject: [PATCH v4 10/10] PCI: endpoint: pci-epf-test: Handle Link Down
 event
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-10-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=gwJkiWxyW/wamW6kH7+GRx7VSH7hXsYT3WZXX3driJ8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwd973TI9incgBAwvQzAk1axQR3EQfp2S+v7
 0yLEScJY42JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMHQAKCRBVnxHm/pHO
 9W9wB/9fKbNDwL0ouS8vXUIF1ITwHRCULxFhwVZnrKt6wJZZ10YPd6A9VuBZdad+tngXVjkuP8w
 y2VLFDcc4KgVEadpMF08dctlEfIju4UbBdEFJSEWUynyOkW//VQHFnjFFqRDUzgxJGS0/HVtCOx
 DIKJ2WR27vm+b9WdcJqbVuQvS2DJ0p3qbJatfzAVrFxcVxLDH+9DGD9CeExys4NrUyu9TKYZdB0
 ZiL8A0W9pOjEvFALzu9UAY1mhQpoZxwMX4Ldz8ABwFNHKktBYLKK4nD+YcsB2OrFE3EzmJo2Ol/
 GH7xP7PBMproKqyLDV/eCbdhGxKOw/9TTP1FAzdVXKFtqbz1
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
under any of the following circumstances:

1. Fundamental/Hot reset
2. Link disable transmission by upstream component
3. Moving from L2/L3 to L0

When the event happens, the EPC driver capable of detecting it may pass the
notification to the EPF driver through link_down() callback in 'struct
pci_epc_event_ops'.

While the PCIe spec has not defined the actual behavior of the endpoint
when the Link Down event happens, we may assume that at least the ongoing
transactions need to be stopped as the link won't be active. So let's
cancel the command handler work in the callback implementation
pci_epf_test_link_down(). The work will be started again in
pci_epf_test_link_up() once the link comes back again.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index c8d0c51ae329..afb28df174c3 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -809,10 +809,20 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
 	return 0;
 }
 
+static int pci_epf_test_link_down(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work_sync(&epf_test->cmd_handler);
+
+	return 0;
+}
+
 static const struct pci_epc_event_ops pci_epf_test_event_ops = {
 	.epc_init = pci_epf_test_epc_init,
 	.epc_deinit = pci_epf_test_epc_deinit,
 	.link_up = pci_epf_test_link_up,
+	.link_down = pci_epf_test_link_down,
 };
 
 static int pci_epf_test_alloc_space(struct pci_epf *epf)

-- 
2.25.1

