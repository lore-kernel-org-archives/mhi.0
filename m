Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED92C08C4
	for <mhi@lists.linux.dev>; Thu,  4 Sep 2025 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756978262; cv=none; b=hTatNadW/BC0EpheJhg9c/gCjX98P5UH10e/dSepAv5+LJa4qmt78JhgT88kn1MbsIAVq5HmgerIPShHqW1kpTaCVl5aa8/bzAfHgNBuTqU54JHFc9RxFfxebnbQ+QUYkzyRZCX2HvAQCFoKRCjo7esDPVVoDkMls1ZGI99xAVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756978262; c=relaxed/simple;
	bh=/3akGTP1lkxwZtcmtPRlyFMRA5KFJLoGC10m6yCNL/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMKlLzo8PoKD1w9t5aOXdF9P+pAHpTfSQraHM2Xab2KqDW5s82V8nV4y6TgXWU2KbAwcCfa+l/oNfeCdlwQKI3eVjMD9A/jc2Dy9oNzj46weo9WzGUBDwLelQaMNCyaRDXh06mlbZXPAuzOMb3GGXjQU9O+UyWjrPmzrFMzgM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIH6VLj7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIH6VLj7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849U3D8026324
	for <mhi@lists.linux.dev>; Thu, 4 Sep 2025 09:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjaZTDZ/aDD7rrhljwAWbgjgue+W9I7isKzXGnJxcQs=; b=EIH6VLj7d4SEajTq
	Q4X2BCIDmfej9ZKbihG5UfoQ6T6Qljw99MgWVr8Kv5msP8BpjpATcPTOjhNR4x0g
	EF1zSe9lqXSRQWLbDh2tdyx/XBW02e3AfdBzf7a+HPRbet7305Kyz6YidM+WxJjC
	J0VI1fb2ozPMUxq6XA2I/x2CVlQsjtG4DUUoGZkO0U5tPhyBe3j/lJizJxkd/GNk
	DS+1ZFG8bFGURb0bje4xsGJd6JYfNlH/nk9S78LckBEAvbIOgJ4eCZn4PNd2b+hP
	EvNGcyLDYTeirOH/ZcN83xOW7swxZGv9HHRQ2fwV0tWQNIAp9Hx/EsPWmSvcYSX1
	9DHXXQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpf4he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 04 Sep 2025 09:30:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4e1675ba95so707826a12.1
        for <mhi@lists.linux.dev>; Thu, 04 Sep 2025 02:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756978258; x=1757583058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjaZTDZ/aDD7rrhljwAWbgjgue+W9I7isKzXGnJxcQs=;
        b=BJOs6FlyLvHRYYMI/wzOi24G7n4GEeMZFtHmhTvmTNhrvK92FbdpurL5f1R+PMsOBn
         M+oScu17X4MxTa+j0sUF65OvC9KhEeXO9PC/acLL4gF5I/D8IMUnjzteaiegB8l1mlIR
         YPlkZNcsRN4KxLrvDYl1JWkUBS2wfd5nrIvMdtAgMZx+q6O6j7KI09fSsvC2r+f+BqkZ
         fzB35vhlvrhJIB6WrUeaibXsZTKJDH1DAC7riVKUowQVhrysyw8VlH1uYfELd1fIHWFW
         UkPThU0lFMFUZgYhjbqmRn3cVndmPsXrtdbEsGGn5DeJnaqA08OWttA1BkCK/vslOqXa
         oHcg==
X-Forwarded-Encrypted: i=1; AJvYcCWLMZ+D9kaXzZIbjJNFfbf+ffYJXdFL4FCtfWWcINCfoe6H6B79QXUV7lIw2psyf5KjNOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYKqsbxbFH2IHBGpJ9PeTp1xdeKBaOHB+DEbz3nVNVJLcVHnGC
	o6/EeZxTpzhuSsTqn/Okdq/NDQYZdATxY0Mk2pg0ZqugJyAdgNRCIgeiHnFVq/+4pEqwJK7hmkp
	6cA+XO6nmPMPzstY72XNTy1swCuRO4MVKx1htYG24CxOqA9AWcVgFxMM=
X-Gm-Gg: ASbGncuJcYcnxVOndR44KfNx2QiZApi0HJhQoValTPSVrH/hh0K+K40Uj/pkPYWQ7Gu
	xzKBOAFWhWZUBA+IACELgNXzXKK727xz4gFX5T7k+AlZFoLQtp70AXf+VsAjhI/A+C9NisRR9eE
	w+R6t/giOZxVgKWZHwIY0qdHwLvDdLN631KhjrjJj3FP57E0bGgs9uSMkwG8X9I89v2wmol0Xfc
	c00XC+Fsb8A56TRq5gfLnP7c0NNKnedifOzVho6rl8BF93TiL+Pul3HUBPFZJqa6yZtzbf7pWYo
	bda6PLYJquNqn+N78pY0XTpdULCvgcZPJIqLuhaKslwSRfDdM/uLZ77sPdYF58yCbsbgKTRA
X-Received: by 2002:a05:6a20:430c:b0:243:a7f1:ffd9 with SMTP id adf61e73a8af0-243d6f03220mr25742554637.14.1756978258532;
        Thu, 04 Sep 2025 02:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMkvfv7QM1gNoAVHNThaAcgLHPGgeMYdHu4pMt4ULdHgTWcrUFnW10134ZoHlO5C/MUQvZQg==
X-Received: by 2002:a05:6a20:430c:b0:243:a7f1:ffd9 with SMTP id adf61e73a8af0-243d6f03220mr25742533637.14.1756978258059;
        Thu, 04 Sep 2025 02:30:58 -0700 (PDT)
Received: from [10.92.206.21] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f2c990296sm12110931a12.39.2025.09.04.02.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:30:57 -0700 (PDT)
Message-ID: <3202167b-9403-4b68-9b99-55be190f7e2c@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 15:00:52 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] bus: mhi: host: Fix potential kernel panic by calling
 dev_err
To: Adam Xue <zxue@semtech.com>, mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        quic_yabdulra@quicinc.com, chentao@kylinos.cn,
        quic_mattleun@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: imocanu@semtech.com
References: <20250902165635.18951-1-zxue@semtech.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250902165635.18951-1-zxue@semtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3fVCTUVFaEw_tNiJMn1kTf7bomVT8BEy
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b95c53 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=SfXQzQb2AAAA:8 a=xogcm1YOMVM3hb4W_dUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=187EmVsF5pRpP46aC3wK:22
X-Proofpoint-ORIG-GUID: 3fVCTUVFaEw_tNiJMn1kTf7bomVT8BEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX0qBEcF3Ca5K6
 xFm1zG5WWVkhENvPdg+btgk00e+KoSeMO3POPz1M0m8JN7Xs5rT2tCiUp+Mrb2rsiIyF4HX5mE3
 vK/IgSqxkXhFSgPzc+lDnkq3Z9zjo+dnfQms23k3xKyvTq/gU3eAPdpxwWJmNHITV5DmoPRTSEh
 BYh6SgaaF7RIoDnEwA8Az6S5EWB0yvSVn2cv+jJimdvXJJAdy6zoOi7bA7XhwGq4SzUj6D+fHL6
 AlijKeyAR2xuKvBCKRM/2KeiqF4JRRCsk82gib5iRAOGSeZXeZTdHimd0ZBiObc+MpBQl80dLPu
 OU6FeJMlN1cFdHHXMXh5CXwP2lpqmnGUnD4gS0qkgBLiN53vQvWGZ3m8tyK/KSXG+NUUldb5Ss+
 XRfFTzmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001



On 9/2/2025 10:26 PM, Adam Xue wrote:
> In mhi_init_irq_setup, the device pointer used for dev_err
> was not initialized. Use the pointer from pci_dev instead.
> 
> Signed-off-by: Adam Xue <zxue@semtech.com>
> ---
>   drivers/bus/mhi/host/init.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 13e7a55f54ff..93eddf302a49 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -18,6 +18,7 @@
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
>   #include <linux/wait.h>
> +#include <linux/pci.h>
>   #include "internal.h"
>   
>   #define CREATE_TRACE_POINTS
> @@ -194,7 +195,7 @@ void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
>   int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   {
>   	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>   	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>   	int i, ret;
>   
> @@ -221,7 +222,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   			continue;
>   
>   		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> -			dev_err(dev, "irq %d not available for event ring\n",
> +			dev_err(&pdev->dev, "irq %d not available for event ring\n",
>   				mhi_event->irq);
Don't use pci_dev in mhi as mhi agnostic of the underlying transfer
protocol like PCIe.

Use dev_err(mhi_cntrl->cntrl_dev, here.

- Krishna Chaitanya.
>   			ret = -EINVAL;
>   			goto error_request;
> @@ -232,7 +233,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   				  irq_flags,
>   				  "mhi", mhi_event);
>   		if (ret) {
> -			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> +			dev_err(&pdev->dev, "Error requesting irq:%d for ev:%d\n",
>   				mhi_cntrl->irq[mhi_event->irq], i);
>   			goto error_request;
>   		}
