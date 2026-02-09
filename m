Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923CB2528FD
	for <mhi@lists.linux.dev>; Mon,  9 Feb 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770613591; cv=none; b=TGLk59ls+AD6w01k8OMWhLsqtOVWEpBSgn5Bejlh8lxTHvtlLmZumwgC1r0z9Phyvo+IWH9sZiNxE2XN3Rq0X4AtlsmupjjQwwIx9FAERQ6FvpvOw2kFXwCtRka22EOC3g0QRxsXykj59AIU8RNnHuNtN4iqaF3VLVCaC9d+/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770613591; c=relaxed/simple;
	bh=m6mtiPXFLsLf5e+10JiUf4tZFNL6MFDEnTDYOBrewCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNMHZ6OMR0F+9ML4PGCErfVSnQHMfX/InuXWsGZIPi4KcIM+7Az8Zk1fCOL4ltXb+whAVYTrjbhYhCL9yJSgs+duyeFebARnska6eC2UJ6kqBkEBfaMXK92Zo29V0c+Wfcy0bxOXGhr0Av/GgcZf7yVb/BFbZWQxYzK01GjvIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ig68K88K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSRw94/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ig68K88K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSRw94/O"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61952kEf2586894
	for <mhi@lists.linux.dev>; Mon, 9 Feb 2026 05:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3E7UICCtHoEft9ePbt/AmDo6Ki/Hkw8JTeF+RItunsE=; b=Ig68K88KIREo8V0x
	dFtUOuorUJBDlr7CknJlLDN22z5MBAGDCRxUgPxneoo6C0WfIeU/79xq4a961rXr
	7X2JO/d1rn4EM8oYkLhWfcWeUP8PGIHmDxicqKo3DvxhK/4gWDqn1siuHooixzrR
	prrTOwrnf/xRI3sNHrLIRz9FPUrDq2hf6+IPv3ZsOVZvxAjCqZvBAT6WQZ2Lz610
	Iiq9xa8sA7xlZ2RkuFaU2b4G8PCq6ckpuav1fQvUFz9YOvKzxqpaz+DCvWoW/H7J
	AW3pc78NKl0laXPDb4WQtDoCkGv+ClwbiA3C3qNCSgwTeSMi0nChROyr0AbVl8fV
	3NLhKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bg08v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 09 Feb 2026 05:06:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8243c83d108so4201075b3a.0
        for <mhi@lists.linux.dev>; Sun, 08 Feb 2026 21:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770613589; x=1771218389; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3E7UICCtHoEft9ePbt/AmDo6Ki/Hkw8JTeF+RItunsE=;
        b=FSRw94/OTMK+YsnE+VVg+7iVGAXHn3VXuFhnVP8dEScku3QMYDha+PodDYPvXB//fI
         7OEsAkFejlXc9P32Fsga8KILC2h9MU7HiXWFmiZuWBlFxCFAW7jLwxPycKi8Z2uOx0J/
         2wh4H0cQv5y92dt4f1EbDKnP5p9pixYulk3Bv5wPLqrB25eGwfY0lUOdxnlaT0sPWk/f
         uqSUgHwGzXj7uNMtNsQVPUonm2zJVd+jtzWBb8dima3cvh0Vv/1HD6EQi7ql09/9+MWp
         gmhIRtVzra1ncv9X99d38XltESOkqtutbysGcIoYlxy8nP5+vEvw20/QP+oLGT00vzLj
         BDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770613589; x=1771218389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3E7UICCtHoEft9ePbt/AmDo6Ki/Hkw8JTeF+RItunsE=;
        b=H8v8gxT3QGPf5rwJbFx7VVasFrwGKqUZT4V0JLSVJwAGlKRjLC2KbQm45ddjkoR8YE
         gs0Ok77Zlb5WH45uiqlxLaW/vmzxoWCcvrumtqyYhKW6nBp3f1aTEcUiO1khIi5+xEhG
         +dXGP5YkgmfR6yX8XcprlY2VFIvt1jgT7zwVt/XtzP9p6PXeZ+CJF5z0leCXtTSYjvt8
         68JqWtnt/j6dlWQmNQ7AcaX8kMfzfjyv3pFegTQXlGTvkX+aEVsZusZApBKZfBr4VWBY
         fZW3da1vEODf6Hg5cdNuhb0aCeyCYla13USt8U8/9kE5AAeA+/9jMzNQiIdA0SFGch44
         v4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj53lzL1wH3k8NtVYJj/F39ZKcqtOJhAgj3yyzSwGtXklzEI9FHujXc8why6l/lOxRKPQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKta1k3up/ex3Qo1Q0FLv7KGeSGIctNco3A7qigxetN/Yq0/3r
	lr8BwcqE+38sxhJMpQU2hXzD842seRpCOtkYGaYfu2D4xSfbbitBQgf0ldjEfZYON6E60h9SzsY
	EcOxRvw//XH8XyBICtenN+u8Fw3/qu7ajT1HOua0Z9EPH7ysOCYGPjmNCvUPBPzk=
X-Gm-Gg: AZuq6aLTK9SfMDWNSH74Q+1rJGl27YGb+dqNjNG6BlSwjmPdoktmOkzm4H4xTVOYa4N
	aj0n8BZHBEtIH9gOPkixoJW4a/GMEb6Ce91T82EalvcOjRbrIl/6sTCISTJIj2sKttIJTXHz7RK
	MjAjewQFvU2K4On/1XyD8rVTlI4g9fXrTZTInaH6d2XY2X0bEmwuzjLtcRrvXvxb/3lEC+iEj6x
	e5ucMdjpaW0rPNZps5ELZp9F4+a1TanUhlRx1aT5uM5InUxmZwSIYrnrOWs6wVZok6Vx3VwXg95
	Bin7oNYH95atlqAkje9GnHR3NRUH/9Q8RjHpO7hdw/HV4M92rW4FxlKGQ2U0682OEBvN+xDf4p5
	71Zvy9ujfkTalBpz1VguRMSU8MkBEsCkzjTjmIL6Q8A==
X-Received: by 2002:a05:6a00:3e02:b0:81f:fef:1fd3 with SMTP id d2e1a72fcca58-824416f8f09mr10733358b3a.41.1770613589485;
        Sun, 08 Feb 2026 21:06:29 -0800 (PST)
X-Received: by 2002:a05:6a00:3e02:b0:81f:fef:1fd3 with SMTP id d2e1a72fcca58-824416f8f09mr10733326b3a.41.1770613589010;
        Sun, 08 Feb 2026 21:06:29 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824416952e4sm8810443b3a.21.2026.02.08.21.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 21:06:28 -0800 (PST)
Message-ID: <7c44e9da-e7d6-4288-b000-939ffcdf7b39@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 10:36:21 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: epf-mhi: return 0 on success instead of positive
 jiffies
To: Daniel Hodges <git@danielhodges.dev>, mani@kernel.org,
        kwilczynski@kernel.org
Cc: kishon@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260206200529.10784-1-git@danielhodges.dev>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260206200529.10784-1-git@danielhodges.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=69896b56 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Gk_b0IoX-7N14tGkj8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: PPhbUq3APqrkzchISVEzxNarOHdWb_9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzOSBTYWx0ZWRfX3LXiB7UG4YAv
 xGG9UzfGmxhyMSYp0dWGOo7e8TSWb9quleBYWGwD9+WtqAskChqXTp5dIZs/peVbltO2+blUFns
 V01OkYkwidDN1XbYCkSP5j/XKzw5kXiGAoJcevY1X1Of952wHBaOonGd0hLf4NAsLQpvrcn6Jpp
 wQdM7pcfWeal9D92fImefku9OJjEAJv7LoONZmiFpcdq/fO14Z6vQjYkuhLvt5XJmGE/ISqITnk
 g5Zj52zTtIFd0MhKTo8nCl383lym2QhgA9cvsYUNuI45VW8KSuzlX+9ODffcNQnLxEx010LXL5p
 gTJx1VDmI2KOhaTZCL8NXcpqvSh6X+bPEB7fmIgv6/Lzb/HvI6LXjW86EzKeMfnTq9NuD/grSJ7
 4RTlYmFh2/lr2VECgXm+CDbrMnILiRy2c0YVOdm1oTh+1rndIbdiQSY1zXBF1AmKKOWE2b7BeQC
 URZUGCaOB/lZ7N2GuBQ==
X-Proofpoint-GUID: PPhbUq3APqrkzchISVEzxNarOHdWb_9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090039



On 2/7/2026 1:35 AM, Daniel Hodges wrote:
> wait_for_completion_timeout() returns the number of jiffies remaining
> on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
> and pci_epf_mhi_edma_write() functions use the return value directly as
> their own return value, only converting timeout (0) to -ETIMEDOUT.
>
> On success, they return the positive jiffies value. The callers in
> drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
> read_sync and "if (ret)" for write_sync. This causes write_sync success
> cases to be incorrectly treated as errors since the positive jiffies
> value is non-zero.
>
> Fix by setting ret to 0 when wait_for_completion_timeout() succeeds.
>
> Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Hodges <git@danielhodges.dev>

Reviewed-by: Krishna Chaitanya Chundru<krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.

> ---
>   drivers/pci/endpoint/functions/pci-epf-mhi.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index 6643a88c7a0c..2f077d0b7957 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -367,6 +367,8 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
>   		dev_err(dev, "DMA transfer timeout\n");
>   		dmaengine_terminate_sync(chan);
>   		ret = -ETIMEDOUT;
> +	} else {
> +		ret = 0;
>   	}
>   
>   err_unmap:
> @@ -438,6 +440,8 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
>   		dev_err(dev, "DMA transfer timeout\n");
>   		dmaengine_terminate_sync(chan);
>   		ret = -ETIMEDOUT;
> +	} else {
> +		ret = 0;
>   	}
>   
>   err_unmap:

