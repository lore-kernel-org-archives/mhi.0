Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBFC18D649
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597256; cv=none; b=q/sq9IvC98tE6TwsFrSaF7j/HzTQIW9+KyBkVRaWO57+l94oMZXdUX3voER9drk+QCo1uTw4efu8+tErsCtyryG7qvuyl5biu1rauBrb3Vf6kls+i40Mm3BpdU1BjDWdB53PbphgYEXC7Xnx1KAbVQ92G78EinaQNKSr7GP/RxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597256; c=relaxed/simple;
	bh=WZaOdc1wZPK/4EneNSUdAaK7q9TWH49BP3VyKo6ZwAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRnCEtUsBLqIxpANQb63UD0eYskvFEtx1HRv22MJO1Jxa2jT0Y5SK39khsridwk+C1dE940c0SIwY0dR8l9SMblRinAT+5JD4du6sj8edFH77KIxw3KUkNCzI5vA29ajuvYddNWFG1vz5ahZdqcuv8c3P3idsGGSfsxfv8alvVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQ4auNQQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQ4auNQQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b433so28634455ad.2
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745597253; x=1746202053; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ma+iGpUn/AKMVwLZapT0W95tZe34aNE+r6szCxKHl2g=;
        b=rQ4auNQQNlvGrvFWscjIGShCesPHggS4AkFm9BSGIIlyYHKc81EJj8Uavfv7KreSUH
         C6c4jXmhq/QvzDNGczFF7Yp/RGQ2cT45NTBzZCeKvpQayTCbt8wYWyPIrOJ6kqCc/if4
         76xEyUV6cjXZLASqHoudl+WtxIOoLGyu6bO8hGwk5dqiJPjnoLhdirZBW1znZRuhSAf7
         G/+fgjsY51C/wecoJK9DrObmwal9TJZnz2Z6tYB4TuJNv7+vGkADUKB7SU/k1eowDhHv
         bMTFvfdiqHpFhnd4M2Vh6JG1nVh8c/8ynona1pseenWK2wSOjPaVTSPhbADE44SzADla
         qBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597253; x=1746202053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ma+iGpUn/AKMVwLZapT0W95tZe34aNE+r6szCxKHl2g=;
        b=rST9NMc8sbhvDSsulQNvEAQYjBujgLZ5Pg+v8XjN2srtyBcgG8lNqYeYx/KzWYYV39
         nFdRBYRlUsMQFO3dF0BDN1PCUw4Yx230e+VrB3nB2/ZxXMCBycItyJLnFGqJuJ21OtnI
         M14fwxETfckxV3x8TFsrR+9YdHRtZPO45oRAPfFO1K/5IkmQZ4iHs9tdg/WH3bj1ORE3
         yS42rUyQELYK6wU4dMoHAkTLTb0DYpBUC7tbgsC67BYRI9Id2Q9iBdNRT4E7ZM7l28y8
         SaA5Db8JX45qkz4IMYNa2IV0SsruPReT+Ri/p0Fhk6HcL6NHRPZBRjM2OGmowWjqWRHu
         ix4w==
X-Forwarded-Encrypted: i=1; AJvYcCXGQeSq1yub3JAihXmyr70psBEbxu+78MwnrinIEQ468awLFDfLnIPfe1f4gPievZqrvc8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNoa4RHHzCyyo8FjkVLUMvIWdRa3jjwA3Gyu8KM3S0IY0LuaqX
	DqAP/Ro6ZThErctV4cVGk8QYDvPhoMAPfU7n8vSMYDlihKiGW9svS7o4UCMKWw==
X-Gm-Gg: ASbGncuExQsvhUH8n8RA3iiIFrkqgzfs4pPoQNgUf7ld5RCmp09Iwd6YcE9pvZgJL2y
	Lt/rMwgBeVF4alKwNYh4DBYakmQhnXxdZi7IS0obb1Xmg6BlCZLm3gBJIBZIlDHFpTKaJSJlQW3
	L+IYSbCey7l2Zps6GmhQ2I9ncfovK1YL4hqljFkA3rixIvdUCzsO48AyGbNOA/lr75QxtAQTrGd
	36IrHGav6e9e9NGc4EFzuTerbO9E3BW/Qc43SSHQFD1qhFnURRbqFsVXp81sPjvpT2SHXU7FW6q
	Th69j8xWYtdrP7FmwFfx331bvJ9PZLfcMGdm92KcJceBK664OGup
X-Google-Smtp-Source: AGHT+IGHuaRxdPoXNwRTHc78Guuv44yqP3/H83BEy2uFRv1C3A22TKg1MCU7FGgOqFZzBgCQSRzorg==
X-Received: by 2002:a17:902:d2ce:b0:229:1717:882a with SMTP id d9443c01a7336-22dc69efaeemr2288965ad.4.1745597253205;
        Fri, 25 Apr 2025 09:07:33 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faee2091sm3098381a12.75.2025.04.25.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:07:32 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:37:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/10] PCI: qcom: Add support for PCIe bus bw scaling
Message-ID: <ammo5uyd65xyr2gexp6kgkyout2hezrlqqb7l77dix52wbtehl@ezw2ntaabjug>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-5-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-5-869ca32170bf@oss.qualcomm.com>

On Thu, Mar 13, 2025 at 05:10:12PM +0530, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controllers need to disable ASPM before initiating link
> re-train. So as part of pre_bw_scale() disable ASPM and as part of
> post_scale_bus_bw() enable ASPM back.
> 
> Update ICC & OPP votes based on the requested speed so that RPMh votes
> get updated based on the speed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 49 ++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index b66c413f1e2b..a68e62422ff7 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1328,10 +1328,59 @@ static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
>  	return ret;
>  }
>  
> +static int qcom_pcie_scale_bw(struct dw_pcie_rp *pp, int speed)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	u32 offset, status, width;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
> +
> +	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
> +
> +	return qcom_pcie_set_icc_opp(pcie, speed, width);
> +}
> +
> +static int qcom_pcie_enable_disable_aspm(struct pci_dev *pdev, void *userdata)

qcom_pcie_enable_aspm() since the opaque argument is serving as a boolean.

> +{
> +	bool *enable = userdata;
> +
> +	/*
> +	 * QCOM controllers doesn't support link re-train with ASPM enabled.
> +	 * Disable ASPM as part of pre_bus_bw() and enable them back as
> +	 * part of post_bus_bw().
> +	 */
> +	if (*enable)
> +		pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
> +	else
> +		pci_disable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
> +
> +	return 0;
> +}
> +
> +static void qcom_pcie_host_post_scale_bus_bw(struct dw_pcie_rp *pp, int current_speed)
> +{
> +	bool enable = true;
> +
> +	pci_walk_bus(pp->bridge->bus, qcom_pcie_enable_disable_aspm, &enable);

We do not enable ASPM on all platforms. So this is going to affect all platforms
whose client drivers initiate link retrain.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
