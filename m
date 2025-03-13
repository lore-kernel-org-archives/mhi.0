Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BF71F30C3
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 23:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741909730; cv=none; b=Sfz8x6ITAP7e3AGew9Bp/Yhbfx9VXqpDgEvlMVhoya2yOLkqPM0ou5/VWHUSONJvheWya3ijcmVqO21xzlcrpbDE51dWTSBhnMZxsd0SFF9gMhOVNX6XfZlRlVoin+a1mdq6EsZCh8pIenxXBk4ys7BImQzrel3ZR87xOkEr27k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741909730; c=relaxed/simple;
	bh=0lu8oU1tyqYj57FgsKOmobIAzRwBp7FW+RRAsiYBpss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCEy9dFjAHEHYJ5enXbVQIu70qeBO856ZJMm/Gh7cPSgp1dZn/gg8kmCKWadi6qZkPUj3/LqJ4spUQpS54ZRiCggKqa5qEANIERiJcAxz9k00yzzk8OZ6VdVJxhs4SXqKRf5s3u5ltFMJz83bnOc2OIrtg3Pne24oZ0rOHljClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwGqZGNB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwGqZGNB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DCUCeE008673
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 23:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zkd/Jggqn86Uyh/5JzZQRlmlyi5xVymwBZ1NTqzN0CE=; b=dwGqZGNB2o/W1vhD
	lMvadEKnxYanIo9kqSUDcDRjzYmf0TZceWIIFAN5IMf9GLnu0vKfBl3PmMir/KAk
	WlP/r2ERc2k4tD8cZEiRtt8U6GhiW/3HsZAfKDfDxREL6QCLQJZumrxiCZoUrobj
	pPSJMo/CUvLm3P7FqRGHPp/lUzAaaD0iIqgbxHEUd4/4JGcTN2GOIwGJM+Pw/Y24
	/IjsOyMx6/5dwvtNvPO93+76BHj4j8w1KpQldr2S6nNQXj5cvMNNm1fjqL3bhgOJ
	7VUI9ZyZbtkc0yR2cfQX6LW2QF7I3TlWpXNfCgJDt7E7kXr0g2A23DXmkNyrdAsY
	oWs4Hg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8b6uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 23:48:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223477ba158so41892155ad.0
        for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 16:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741909727; x=1742514527;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zkd/Jggqn86Uyh/5JzZQRlmlyi5xVymwBZ1NTqzN0CE=;
        b=erNi2urYdrlLGAxVAa3UVicexrBdWzVSKOap9lv80RUo+OIVrGsaJMiM7Jgo/Ynm77
         ICLOIRZzXmxm1Oo809sZFl8I3OkkWn5kz5nJ0gl0XQGDcQK26QJLD9n+ftd5iEDcEQlD
         A57jB33xvhH2Ql1Um2lGMmz/1x3CF+l/HoaH/pWFg0FEISsVhAdzUiLR0RRnKP0jDBTQ
         rS3gDtAhpV7Jr4Mqgud1peqmOSfyb1+Alo9ritF3WYhiWcSA00dz78sfHGkvpujK/NR4
         9BGpMvRbbtSgPUelPQmnqmCqIfIdz0NUhxvbaCmMGUR4VtwfP2VKa3TdJkiWodEHIGP7
         zSwg==
X-Forwarded-Encrypted: i=1; AJvYcCW/dhwTo9F7y6TpPzRKpD682ySqrcm4HwCK48jkgW3OT5mAVlQ4wgegKcDgNuqI0pDKfLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpNefnoFh3Xz7hjTihEd5EQr9+cJ0CcnbHZ5PnalXPUbjGe83W
	SEAVvg2MjWTPoQvRwZx/78/QcM/v9Rpx7hD+fqr9DeynH8/AqCF/m/C0LxFVLEdZI+DSuNAMDop
	nvzcZbhWXYBBLufcCFtTNoh7Jn8K0VZPBrRcdx1Ai92Lu654U09KCQWroFYk=
X-Gm-Gg: ASbGnct+J1d9vlszLvhJyVPBz0PVRpE8YU5t7ywMRk0YuGGUasWu3nQDSrVlEPU3bSS
	/frb24Z7ghGOampfbxeNiR/6PviZ4munRTbzO4RN0FzdYjB19k2PKHWiZdufSN2n8A0Lctil6dB
	1/ptNdNYAjEPv65eCcyp0H6CLZkK2XrDT6GKgxosKhd6CdCvrg6ZEjBwvOPEfTMyQXEuUdHsUCi
	TJsCXRnjKK82m/YV9Ev4MX6DVgqCnADePG5uref45hC3I3iceIxyX2QHQi5sNSspQGWP1PrB6KA
	3cfVwyyVl265PgnQWDnwCVuSZlcRwP+f7xNlMl3O9OIEJxWs657ACnutb6vlpAFVpvWfbwNQtE6
	NyKsyA8qp
X-Received: by 2002:a17:902:ecc5:b0:223:f7ec:f834 with SMTP id d9443c01a7336-225e0a840camr4625995ad.31.1741909727063;
        Thu, 13 Mar 2025 16:48:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcphUQ8UCrGDx8Md02DmjuseFiFZVhQ2qPU88RhdsaxrxfnuW+c53+Y3w5UiXV4O9t74jPcQ==
X-Received: by 2002:a17:902:ecc5:b0:223:f7ec:f834 with SMTP id d9443c01a7336-225e0a840camr4625785ad.31.1741909726725;
        Thu, 13 Mar 2025 16:48:46 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68887fcsm19356845ad.39.2025.03.13.16.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 16:48:46 -0700 (PDT)
Message-ID: <2654f986-eb8b-430d-b962-8e77d9e11826@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 16:48:44 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
To: Bjorn Helgaas <helgaas@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com
References: <20250313171637.GA739165@bhelgaas>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250313171637.GA739165@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d36ee0 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=wUlHnouiQKlN4MMnk_oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 7UlurQeUx2AbbSLYX1Mvs85ipdfr9fPY
X-Proofpoint-ORIG-GUID: 7UlurQeUx2AbbSLYX1Mvs85ipdfr9fPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=822 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130181

On 3/13/2025 10:16 AM, Bjorn Helgaas wrote:
> On Thu, Mar 13, 2025 at 05:10:16PM +0530, Krishna Chaitanya Chundru wrote:
>> + * @speed: LNKCAP2 SLS value
>> + *
>> + * Returns pci_bus_speed
> 
> Not sure how strict kernel-doc is about this, but I've been told
> it wants "Return:" with a colon here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/doc-guide/kernel-doc.rst?id=v6.13#n142

Yes, patchwork is flagging kernel-doc issues in this series.
However, there are numerous pre-existing kdoc issues in the MHI and PCI files
being modified in this series. Just look at the patches with errors being
flagged in patchwork (including build errors with 06/10):

https://patchwork.kernel.org/project/linux-wireless/list/?series=943497

