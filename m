Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FE38655D
	for <mhi@lists.linux.dev>; Wed,  2 Sep 2026 05:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788326546; cv=none; b=hhT8FZgwA6vILBpM7/8sop4+QzxXUmByWyUanKQGv8lLRWmSjhtl5t3Aq676pwfJYoaXi0oQaPk/jzYk/FLi3Os4oEq7YIGLpAfPS8YnIqpoXJdBtxK34HQtKbS/hf08CDzoW9FJOP4CwoeN06dg14IAytC8i3YeZfZv1NWdytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788326546; c=relaxed/simple;
	bh=RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fA8Y9sLON+fzsin2kDId68tMSyaKs7lGCPqmYWHvpbq/bO84gRp8P/kgwp/psd7hOsIJW9E0H8l0dBWzehcQvPZ9wmJJC5x7yyVndRobJNrMLOriH0jc3St/6gBY80dAJaJNm0u2vQYcDgOPaY5VrqnCXRkC4QfnQAHxsBCEy2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7PaReY9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoUP7InY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7PaReY9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoUP7InY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6822Z71c172795
	for <mhi@lists.linux.dev>; Wed, 2 Sep 2026 05:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=; b=m7PaReY9pZUxLkDN
	dqh44VsclV1XXF4zYuQ1SDCcxyEF1yYKhrLWFgdXUCgKFj9NP+ITQvGs+aQNz0zz
	Yc26OZM1m8LIQPY2lKNMoPrLGCWaEdM/nR5WuxXAJymwnXaZQGE/5tOq6Z2w/BUm
	k2Sg/UK1POZD4ZOhzUNqjlJsNRFKYP/ZK0naZhLk8K8a19rRz3SD4rJlJ4fVFQxm
	oVrJVAFxEDpHQle1gjlCDH5kVr0O415/CNuBvgmrEmIiQjtjK5lglTDXLeTmLM58
	yTBjBuOtQS4+EKooZK6BtG5FRRj1qBbRDlidekgf8NcAohzmg66sgexDJKAmfF2k
	l6vZwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb560g1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 02 Sep 2026 05:22:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1114169a91.3
        for <mhi@lists.linux.dev>; Tue, 01 Sep 2026 22:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788326543; x=1788931343; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=;
        b=AoUP7InYliAok1Z1wY85X7Wy5SXtP+FG1sBAjiz+gA61B9T3XhdEFTK8yfROcTa0io
         fDt3JaiZGrw9FY1oVCXbECRmG07V8Ggw90AhC4rEqCjz+i5bpSRZnjLT12qB9U7GLvK+
         0vorkqTCQ2rlZOBvOLJSXZi21FyBNKBZ0O55ShC/egy0jLg2XTZQft/O6IqUTWeVU6vc
         Bf9vypoy6oS6sA/VCVkkDKvvUGgdIdknc9Hv6/ZqTxAOsB30/0vGU1fD0NO173Nl7Ua1
         W5En+dPF4GDd7bxGeTcJ6peSQHD1AARKYHdAYhmHsZIeluWli3c5maIyegvSb0XIMdga
         ocSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326543; x=1788931343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX1tqIKGVP0bUorI/5rlQmkq+iT8Q7dOX+hFIanw6B4=;
        b=fwuCC1G+2XN/3JUs4jT4TUbXKaMZ+w23zRNS9zxERhdJX0oBYzBmcdDfFMYBsZhFVo
         dL5oZ9rQvd3Vob71hV2DWYNuDlvStUFCv+pf0DX3v/pvP/Ikc4iKLd3SnVRTLJYLB9kA
         e/CwODYgnBEO8s8+jkW3zDYDYxbZskXEKUY3QOPG7OlKKz3hGhXBKQa5M/iIKgnerPLI
         DOLFzWaULcGUaHozSHCtUR1Hm49Q/PIcPtQe5+plDRpMue3E0HgotU+V4OF9Mt86gLy8
         e4z+yxgWeM82Zqdg81r+hP6Yjy+fF55nGuByE+Yufw8oy7aMAhE6Rg/wM0Ksv1PATVcA
         Q2uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtzingj9n7iwnDkOODJDD7LlYgVpbGgX640w1o386Dtbv8U31dsZ/vHSic0fR/eeuYJww=@lists.linux.dev
X-Gm-Message-State: AFuF++nIqza58bnbs8z3rMP2+OIny9IwYx5ySwPPEFh39dPrJHZWQZ0L
	HjfF3xqU1r4UmyGLqgPdoBjnQX0mvRag/agx/NsRnSDVugCL8A3wbZAN3fcFP2n6Ia1MvyiZHAx
	pt1lUjmC4pOjIvr4aWdsYj7IOknLSutvBxYFTYY32yQy3I3i4vCymtas=
X-Gm-Gg: AYBFou20TN3wxOSwbGYjsllU2qZQkSLRD1c18o3GDq/AmRR4S4YwM3W2EOtJwB4LP9c
	iBXhjpEe7mdSQdtisPoG1TztDWMtkF94VKC+ep1px8uSU0JOuzLjHLga9xKOorbMNOxFb6sKc1Q
	zxOh1tRKChKEkOx5weNHC/dwXFGTUuFf51xv8k4Xwj3k+z1kC13fZOfeYKZppLrY650TxAkyry2
	nyJ+XdG2SwB9k2YJ/DJnPZoNdeLKSIn966PB8IuBMrCxhHfwHW8y/AbIHs06sF8jFO9TqsDhhPk
	ACgpLJA/LArHZDpNu8bSXgGcR59fNu3jJB3zC3IzoUZbBjqF7hzVYwWuJYvNfN9i0yvy5Ohi4Ee
	HNSwKZGECyVPwgtd3KTWPVyB4uVZ6HU2E
X-Received: by 2002:a17:90b:2f0b:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39aee1f5fc2mr3694897a91.21.1788326542654;
        Tue, 01 Sep 2026 22:22:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0b:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39aee1f5fc2mr3694846a91.21.1788326542204;
        Tue, 01 Sep 2026 22:22:22 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430eafc907sm3003702c88.9.2026.09.01.22.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:22:21 -0700 (PDT)
Message-ID: <cf33b23b-9068-42e5-ab90-ad7f42d72b74@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:52:15 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] PCI: qcom: Enable ASPM disabling during link
 retraining
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishnac@codeaurora.org>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-6-6dea79786b37@oss.qualcomm.com>
 <jdch2j3vcjsr2f4u7jhiazuotwqu6pon4xlvhzuhrzpzjhmkkb@7zzy2autzbmo>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <jdch2j3vcjsr2f4u7jhiazuotwqu6pon4xlvhzuhrzpzjhmkkb@7zzy2autzbmo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfX7GuNfMCKNxWX
 cYthJM784/YSZy6KmeQsGOy55mcIUsCLlYLTps6iSCnP28+4hM4H9Vyra1dYx/ihQSncSxFm2Ns
 4/cw67W7QL3DLj/4K8oTIqE/uR3Ve8M7MonZOu/0LfXOzQ9TW6p88Q9Fp4TH7rDysJhmclLHYgR
 RcXkjXY1r4PL33FsZOsxIly/Qy7St9L4nij5cqsWAq6eXWA/eumwxCx4vG+YFR1YK9xhq8x8ivH
 fo2mJrbQovsssJIaffKYGBSxDxXssuZyK38J4iRR4DBdlM601NCOyTP3Qrxwi28bSL6mCnKGC/y
 aHpndXItMB3GZ4T3AX4KkY6/tcbsSFGevigXHtJo+09AlC9cr3JEwtyFpQeAXcJhOdrwhFUFtBV
 EibiWucDfdpK9vfcvM8MW3lyXwjkLQMMOTqBlio4DzdLWB9x56uxBpFLYTge667vrXjgDnjwVHD
 8XtTI0PR6NVJSo4mEbw==
X-Proofpoint-GUID: u2sHxQpI5unG78DQtEyEeOycIhf1sdEp
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97b28f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LpQP-O61AAAA:8 a=B3be4mm0s3FIsxF7KqEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: u2sHxQpI5unG78DQtEyEeOycIhf1sdEp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfXwKjWglGW5mcd
 vb0BefiO+8dXdbgdkvQy2A9EuJl73DM9ncGnppCujHUxF0+jr9WL2GKgzHryQa7O5jJaon/B/t7
 R8QnsZDnH+/VGuilDbpIdw64pZLIICU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020046



On 9/1/2026 1:38 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 19, 2026 at 06:55:57PM +0530, Krishna Chaitanya Chundru wrote:
>> Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() to ensure
>> ASPM is disabled during link retraining operations. This prevents potential
>> issues with link state transitions during bandwidth scaling on Qualcomm
>> PCIe controllers.
>>
> Is it really a controller requirement or a device quirk?
yes, it is controller requirement, for the future targets there is a fix, we
will not set this for those targets.

- Krishna Chaitanya.
>
>> Signed-off-by: Krishna Chaitanya Chundru <krishnac@codeaurora.org>
> You need to use OSS email.
>
> - Mani
>

