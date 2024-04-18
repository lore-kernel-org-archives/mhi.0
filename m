Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1EC15FA82
	for <mhi@lists.linux.dev>; Thu, 18 Apr 2024 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441565; cv=none; b=Dng7uj0BT/pJyKOyfpilrxDOkLkJMISXv9JQm/ZBquGOhw5KzuArXaDzKKCH9Oak8Z1MNbpHwk6phqgX61GGr1q9+XimTBBPLbwf5usRuJ+KQeH0cpdxs5us2gIWHyNmSB8UskGVB3I6XDmAIrTTUPZrGvqAxr/Vp8IBhI6DPnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441565; c=relaxed/simple;
	bh=atG+1UQfYDhhLUGqdEx8VNjGeYLNZVix4fHyruhkqxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4F8bjZXRDR0cdf1aWFOl8nxGRs7k2r5qh3yle+isJ2198akP59QpQYnXj1VZyuZCJtf35faPAaZgNMESK7Fb6nkFa15I/RNCPaTjeQWIDMZQkeiQbnirWKKkzNDn8e71FShaf8O5wmWYZowVRtc4XJy90NBNfctphcDrIwU9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYPFG5Cs; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYPFG5Cs"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso527925a12.3
        for <mhi@lists.linux.dev>; Thu, 18 Apr 2024 04:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713441563; x=1714046363; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAcw7E8oN4uVzIUIOF8pEddwwqX+D/yCDKw3KFfwl3A=;
        b=zYPFG5CsgJi+rQa2VyENnK6oumz9wKYkXsZlFOF+cl9AqWORh27wLdwScvSrsJS0Os
         emedNTGYl5pZakqKi1OUYyEH+07o5Dn1uI5YyCi0yCG1K1Y2uN6Y8Q4jDsZJCsKipFEb
         0VcmSqnAR28iVu1t7fEgLczN8TRXsdcp12JgqNJLuA+ANT+rbMzpDW8C/vDys1S1h+xY
         PbUPD443UWmw0YLOeM8zYsxDGlGetFG9KSDixDCluqzUlz4HnuhlV2zYs0r75W60vPNX
         mcki5uxugd3rgrv1KMd9KRaUvkdd4o3BVDVgMjPK8pfDqImzQnsNSVUbGLbTO6ER0wHW
         Vi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713441563; x=1714046363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAcw7E8oN4uVzIUIOF8pEddwwqX+D/yCDKw3KFfwl3A=;
        b=tr0xDW7Ul4bKdWMZ2Ozmv2TCP31Et1TRTUorPgOf/ksN9dVv2w1IZndq00GV7Gk3S5
         Fegr8jT4RMJLSSThPIrLVucLNQjr8yMYep1XN/rkNBg0VEZ1clVSvBzQsWVvhsDrzJZ9
         GSozUhTBpZg1NuxwrdXxfmrjZNhZEhPnchAs4vHGAfKnxGSs8i+h2ydmmXuXvMWDcpDC
         SI88ZGQpkAel7kJ/IU721q+X+5N6Jphb+MdPh1li4mltSMalDtSYdwuFmQwdxzqNxfmu
         dUanzpji3BVGslZHjaezCWyovNyjKN/NLplcL4ODQTzq6nbdA1ANuLwBhl15awDr1QsA
         hq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPQdNnqxsXrHPOoUwN8pI5Mz6F8UZczs/eLMIHN8GXC/omELE4agkKPTz772WQpgVlb+hq+x96KgPREDG/UMianj49
X-Gm-Message-State: AOJu0YxtKs+uAY6mBZT/d+3KY6FT1uMZdg41v48U1hLqw+VF9BCGCqR+
	fLCsRk4jIbyT/bZJ+xzjNPWFVKSQe+puSOB8T6RxQf2g4IRhunFBVk9qSoUjYyyFNy00Zi0D0oQ
	=
X-Google-Smtp-Source: AGHT+IFSqDRaCBSoo8BoGX0u04qMirP3lQLymca/l6FmNsm3RAtW1htgucW5/5eUyGEsvsCQ6dtGbQ==
X-Received: by 2002:a05:6a20:840b:b0:1a9:c80a:bdcf with SMTP id c11-20020a056a20840b00b001a9c80abdcfmr3613106pzd.2.1713441563006;
        Thu, 18 Apr 2024 04:59:23 -0700 (PDT)
Received: from [127.0.1.1] ([120.56.197.253])
        by smtp.gmail.com with ESMTPSA id ei16-20020a056a0080d000b006ed06c4074bsm1305512pfb.85.2024.04.18.04.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:59:22 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 18 Apr 2024 17:28:36 +0530
Subject: [PATCH v3 8/9] PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown()
 API to handle Link Down event
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-pci-epf-rework-v3-8-222a5d1ed2e5@linaro.org>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
In-Reply-To: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=atG+1UQfYDhhLUGqdEx8VNjGeYLNZVix4fHyruhkqxw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmIQrzQyeOnNXefT1bfI+O0Ma5JSu9+usv5cm9J
 cAHRmpaedqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZiEK8wAKCRBVnxHm/pHO
 9RfIB/9uJMQCz4cdPaw2Hh9qei43flPkHVNyX2jDTngRHx+E6VSEifEhd5QFCmbUTanNcwV3VTA
 2eUwRNH3tOOSw1HUe6yJ1qM2y39VllyIOYTzopkC2CN+j8I11D5d+YBJ7ydVmtc46YvtZktz8v5
 JcdJVPjyeyIvyoxUaeiS2uoq/VE2v0acmKeM+uL5WncmPIaVq9lACPEN26KT5EOZZA3Jji3im4D
 yWu0AA8sQs+Z5JSxFpZHgVgytKegpBBjBkcd7LCIDHxB+1tvX/OGMyclZw7csNmal2n7HP0OYff
 //jFit6t/Lc+9VuatbccvEgxKt+tRT2hHloWbJbNnLJWCKCI
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 458145d1f796..96f5acdc9317 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -635,7 +635,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received Bus Master Enable event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1

