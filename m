Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FDE3BCD24
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095250; cv=none; b=ueg/K+0Gcw/ynyyjOk/cGmjzuzqZE+5LEW0i4spOKyUoJZZkd+YDNM1//3cQC8JIbtrVtkBqc+jpNl/d2GKO9pVwfghM7XP0U7Zrfjp5ybiuWP8ob73i53dhWfPxsfD0BZ2AqnrVaOPS+qJ+zowfVK9SE9ma3tT3I8cp9/z6v4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095250; c=relaxed/simple;
	bh=gO3zAV6ACjX1OKk3k+a7fCPYlSW5P18LyI3qYBL1oQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghAtsRl0j0h5ty5f4u8H2RQNKM9EFSK3+be+AWhQZCCuT0l0wysts5yXpBJuh2zJMD7Sh+BSmzkeSPKwoutwHNMYnQV2gX+TCRHWhAtuGxBplLCoXiyvEL5bjhRitivuE8/W62EV4IUCVV1/bJQI1ypvARAg20LEUrZWIooCsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwTQYFlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgNQ3iH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwTQYFlQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgNQ3iH4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC93j1472537
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 12:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HiKHG7vHKMbpSHBPFtgHyI6hMg/A287URDokAcpdX3k=; b=JwTQYFlQo5ZdSpA7
	orhyAVMks8pwz/hZk2OalXzvMgp+fkm98laHcQcZULwOlX2NJYYTwqdEDDVqlf2s
	Rg+wu8cUq955BQWV0aheei0GrgbnmeI3naKpBigj9jAoLmjEKoROgTFisV80cs4d
	Nbu+ZrjI6kr/Xt0++C/2JR3owiW8uolsyq7DO7q/fra3lt/Txfflgp+u/IqEPG9W
	kijFZCne+xIk5+qiP2zgJhWB88Mb9j/PBCFqZpknrVEb6EG86RNSoGO9cPx63/Zb
	ZSDf3VvH+FP8OrK9GqzVx3o44RDzck0ULia3UFmPFZrMdDGf0DfmkX/AP0luybis
	fWQH2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd9un7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 12:40:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84256bee9a9so4240195b3a.1
        for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781095245; x=1781700045; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiKHG7vHKMbpSHBPFtgHyI6hMg/A287URDokAcpdX3k=;
        b=VgNQ3iH4atKpztigdPzuVOCGI4wTnReecsnEHM9w/hYZhqZEFroT/9LQNtYF05Ctyq
         4XSt7xEv3YJWQYRvgBMzL+3vxeihjkZuTmwDwExxuJxBf3hktuNyUjEJenUDnBmy3ca0
         i2jzFVCXEisKzOoqmv9MGmesuRa3VOIMs0CABQmpxJQI5+tP3MU3+WnOMVVMzFzDIIUT
         B67eqy7mx2uQ4o9uDC314dJGryLnTnzhnYvuTUoZ6U9a/wMWT8R9BoVbQRBaz2/Rb5Sa
         F9KqNdqTykync8rLnaWDR27ze9mbQ0EHJ9PZ633IXG/5wbkyx/t1ZwTd9JR5VpAwIsgG
         PaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095245; x=1781700045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiKHG7vHKMbpSHBPFtgHyI6hMg/A287URDokAcpdX3k=;
        b=RdVHsRC4rehpHksntNeKoNfHYYn6KIrEf1qiv3fDP3M+2q9f2qlGpmeMyqG+CNNlJF
         N/nh+gwPL8Hx6BcJnfMc/zkwelzx4GNgBktd4jDY2g+64Trr0tHLVC6uhT2lwvFvNTVp
         2I2p8AQ6pIOEkUoGF5AIC6dAlflkS83+GLfrz0g9234cAKSDPYlP6E+TMJS9kvjtgvKR
         BtqUSLgph974a9ABq8orAqQq3rbd3PD8UU1t8ie5XDgWbtqP7xWzG0UmnQ91Ura6iFZz
         eMRTelTl6psirwodaLKzu/Wg5CkWMhIZgr70N/ZsrJ6EShxGbwXv+9Fii1fhIVEVu4zL
         DGlg==
X-Forwarded-Encrypted: i=1; AFNElJ8rOn0rLEBxrKQcp51EFgmJkLvVK0uWa8P4EqJ3WmXUATnHP2mWA8AKFu1WA9bPhx95LN8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6glxm2LYXRBrVoM4OQdeeCFnyfMw1vY/996klfl0rSF6iHLfG
	udOe8kJILNn05gfvjbkEhqyYLI3QyF+woXjtULT+P64uLo8wdInUCxZH9riFrsHXwFa7HgFINQi
	dqb077Rsyr2AiQz5rwRLgqDswz0clRDPJ77bu0SaE7eLbDyzcLJNwASE=
X-Gm-Gg: Acq92OH/XfgA9lxvJpVpweVsRN6oyo4EPuQ4Q9sCwHgl/qnViMt2++KnVUGxPkS4VMi
	vgBNm/qeLxF5GaGUM8YGf/0KbE5hoopZfe1Ce/iJuiS5EJnzAFhQ8AOahgESDAMsPFNYswI3P/N
	HgCCsokkRWHFscVsKQ911wy5yGY7qov8U6fYKtJ957zAOZKJl8cinoIIP1etWeWIDtFyHsyUFRl
	vbHA+UPDeF4S2yJpGfCCbO7fq+kxdpac3G8cTV8pep5Jcg9i34TCmLB8lCIoeZaxYcdChWyYc6x
	M9Euh+RMuoCRSEheS9EhoSTGGhM2W1i/wHutRENM75KH2n63jO69JDSfHdX+s9MfNwLN4mEWHSd
	WqTrZlOPuRKMhUxFV7ZjITnnK51tq9GPrjV1DFTDdmfGqAQd9uGxgvJw1DM3mrwAQ
X-Received: by 2002:a05:6a00:21c5:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-842b0f9455fmr25820823b3a.35.1781095244783;
        Wed, 10 Jun 2026 05:40:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:21c5:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-842b0f9455fmr25820788b3a.35.1781095244315;
        Wed, 10 Jun 2026 05:40:44 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm25024454b3a.51.2026.06.10.05.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:40:43 -0700 (PDT)
Message-ID: <0d3e4046-42d5-4f91-be85-8681215e84b4@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 18:10:39 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
To: Qingtao Cao <qingtao.cao.au@gmail.com>, mani@kernel.org, kees@kernel.org
Cc: linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Qingtao Cao <qcao@digi.com>
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
 <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a295b4e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=9g4fzgm7rQrqN3lzHvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: sU7ECrE2me2kYCXxuT7OO7fsNK5lo2bB
X-Proofpoint-ORIG-GUID: sU7ECrE2me2kYCXxuT7OO7fsNK5lo2bB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMSBTYWx0ZWRfXwqTeCqx30vDz
 PGUQtGaThmEXC42t9KRZGuX4dCNpUb0ABV+iSfXmDPDcjRdZjTWkJO7T1GQdlsQB2vVTdn23KBb
 MT+7+TwfoTlGhRCtqTjTrAMNicU5uljLpE17C844PJDBH85Ck6YDV+1p8+XP95208P8FRg3WEwr
 5CmR1WwjZIgcPaPbILlGiCubRSIqn8qCj5dOTFPBBiCuM+0/afMb6v4EKjjVzj6U/v0ZWDLWJNZ
 IwvS0yHxjCk9o7MZUEoS4scZHUS2qIbWDGaE+5TEFEM85FMueNgnvN3DfeAD0jbK1v2fw3n/Seg
 tzvt8d8/zOwRlcN9VEHAtwukrc0LVph6yNVG7kZkoZyVY2XvFkUgLF1PSu7K7YR5sGrtg9buMi3
 DSx0T5EOajRkTYFV1+D+ngMssE5stkS19Mv41LhUKjoLaulE6MGE9RanHOSEO81YrjoQM2oxKrC
 vRY/BDiat2dRTwcFY7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100121



On 6/3/2026 6:36 AM, Qingtao Cao wrote:
> Bring forward the idea to fix the power down latency in
> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
> so that the transition into system error (triggered by AT!RESET)
> won't have to return only after the timeout of up to 24 seconds
Hi, 

Generally we should not see this delay, as device is actually clearing
reset. can you give more details what is the device you are using and kernel you
are using etc.

- Krishna Chaitanya.
> Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
> ---
>  drivers/bus/mhi/host/pm.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index f799503c8f36..9d29f1591a45 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  
>  	/* Trigger MHI RESET so that the device will not access host memory */
>  	if (reset_device) {
> -		u32 in_reset = -1;
> -		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
> -
>  		dev_dbg(dev, "Triggering MHI Reset in device\n");
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>  
>  		/* Wait for the reset bit to be cleared by the device */
> -		ret = wait_event_timeout(mhi_cntrl->state_event,
> -					 mhi_read_reg_field(mhi_cntrl,
> -							    mhi_cntrl->regs,
> -							    MHICTRL,
> -							    MHICTRL_RESET_MASK,
> -							    &in_reset) ||
> -					!in_reset, timeout);
> -		if (!ret || in_reset) {
> +		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +				 MHICTRL_RESET_MASK, 0, 25000, mhi_cntrl->timeout_ms);
> +		if (ret) {
>  			dev_err(dev, "Device failed to exit MHI Reset state\n");
>  			write_lock_irq(&mhi_cntrl->pm_lock);
>  			cur_state = mhi_tryset_pm_state(mhi_cntrl,

