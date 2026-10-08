Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0F23B8D79
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438739; cv=none; b=GwIlzH5OrlSDtgK7Imt9XqVYn2713UE72OWvTAmfXCrqI6YCWxBEskiyfsWs2oNK8xBq8vp89HzJv4cA6dyVM/5J/yQQmAVwxOCOOba0vP25LvsyMWMXWTMaVLdY2u23jJ/BiAdpsrd56EtZT+BURSaTn+/qhdpTOoHdDBu1TA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438739; c=relaxed/simple;
	bh=eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP2ipqx2VqZOs+wyaPbVqQvQLyIZvIawu84Chek+DvB6iK3aiE9nJ+ME4IrkSUPvQTjFthRqBo76RjQ7vsP3XvYw9kj03UiUlKChGvphMCxZL90iiMKUcxlCci/h5B+kTBXMZ9LZ9//8zEd2H/oo2MWEVRGd1CijSDgDyRZgkUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ny2TzCJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoo5ys+S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ny2TzCJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoo5ys+S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984C3ZW2146850
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 05:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=; b=Ny2TzCJVR2wZYgLe
	QbVAU/dgqbupsn9ExdPxgbi6YZmWbKmmx8V5YH1dZFf9uB8kUnQcO3P8WvvgZVGb
	+ENAlmVMtF8R9+Q+s42e2mVu/xweeWKpkmC2+hT8lyJtdhCgn9iWRI11rg1z37sR
	ITodF/lToSxtGSWJrHNX+vh5fQyN9jXW/x64b1uEc8O+XEQh29Aiy5hGvClyQub4
	GNs4e5B0mdiYVp44k5NZ4uGyiyckfqIDMhRl/+3cDzv6FF/jKuY9K3mZn9lPdocY
	A2yvs+vYGUhg6TfqgEh+KvFE7FRVmOFIf8RMCdm1cNaHaE3mV4YMoIj2TVJa63y2
	RIpH5g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe819tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 05:52:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso5016936a91.1
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791438735; x=1792043535; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=;
        b=eoo5ys+SXkjAzzs5pnTbpvQldaNwvaOBs6eBMsTyz/gGfCViOQNusfQwlMn/U/l/+A
         XlgtR+de6itU6kmNT/OpXKPv8ShcdxVct3ZENYpgwuq+pzxoRCnskwlilQ0J3XBtQrEP
         yD9z8ECLhidrHXz1Ipr9NJHlZCRujvOFisKRmyy7namaxql3axmRA6NvQNxh74bv5ez7
         2kbNhFME5yrxU/LW8kXPjQBUhvYeffGeMHt4MtsRpgYwOg6dGXPAliWUxjCM4JjHfLNc
         72A5/8aqgAKz9mpe9+wsvbdK5JlihMannLQxnizv0hdjehvR4L2gqFTYye6EwpWoJZSa
         wgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438735; x=1792043535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=;
        b=YtEvRziFJm8ltIsB7L/SbGHJK7urmTl1Lj+EjYRQJy97Gd2SJSlnrVe13R0UG5wh0J
         LfRNwPvGS0J8r6Jm0erY00jshLkqOaaj1DLpM2ovUvYp82WOk78d/KApGbdAioyMpvE5
         8BHGL9K1hk90xdEGx9CGTqi2+37HLybDJFVGh8pZpoR2cqAmk6NLZwpPEVN4H/bO1w0b
         PFgwLHcbZJ7VaxSrYioZlHrbDA2yzDSqHP49iQEoI4o8m7ZcrOexdwa7OpL6V6Hk61JO
         z9K1VL0x+SBRr6KBJIL3r09oE4NHwKQRdiSYZqRbeFT6yuFweqPqSIL6FWvZJX2au5Qq
         QdCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwPBegVR77klqKv6YISfEMxvgKJvdk4OM8p4WAW49W3e+YbRyg8G5/dQbkbsdK36c0rEc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJPeH64xkrc5yi0NGNvwxKESicuwmd+c9Il0abECVsIvGKHpl4c
	QBhoBO8I3RN/nNL90P2xJ1I9SjroxF5CoZcZ+efvuFDHuCEq15BvO7fODiiev8Nx9TSm+Ps7Iut
	7jNJDKBAg54D6Tqpay1jr1f235sg0VpsnF+Ci9TtPYrCx54rtlHbEIZQ=
X-Gm-Gg: AYBFou3JnuB2GRWvgLuGJGBzIAO0kGepzRMOH/q6bOtA0/VI523E9aBSeqjEwsrQqFV
	lp8flC0b79ukZ68VCn/7CxmXrG8209ODjiqYb68qbe2DMhbPLRqfw03NX9RRpwZcCzsaNT9UScg
	dbYzNMEMyA9YiF9Zlll25fXcauC2JbshsFFzYcvPiPIPAK0/V4hBZZGlpF5L0A18JMnKgKBi28/
	xFlmbbkiy/hHQLgzOZ2EC96meyETYi9kLgI4R6EkO3TKIugYqDvc7bG4pGR7VyYJXtxw92vhsQm
	rEww5TrznfBQgZaj58gCokuaXGuevHfHsjzFs/Lqpgh5c/BwjiSKIh5T46/AZ/BcdrK3GSvljmT
	zMhnZR1iILMZBSBfAA6Nh76ShP+VbM7AK
X-Received: by 2002:a17:90b:17c2:b0:3a8:10e2:acfc with SMTP id 98e67ed59e1d1-3a8a1ceec9cmr3579221a91.65.1791438734921;
        Wed, 07 Oct 2026 22:52:14 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:3a8:10e2:acfc with SMTP id 98e67ed59e1d1-3a8a1ceec9cmr3579214a91.65.1791438734295;
        Wed, 07 Oct 2026 22:52:14 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79babsm2629601a91.6.2026.10.07.22.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:52:13 -0700 (PDT)
Message-ID: <ad34ebc7-df81-414f-848c-0d5b820227b8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:22:06 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
To: Val Packett <val@packett.cool>, Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com>
 <f189cfc2-c36a-4bf5-bac7-36ddb15cc7a4@packett.cool>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <f189cfc2-c36a-4bf5-bac7-36ddb15cc7a4@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfXyVLqSODrJioE
 mzDraPLMFsvGT9BcGBV/BPM95MzZMhQWqx4ysrqm9znmMMuYbcyJxsnfSGYPLxyZpPb65rPkQg9
 YxRkskrpi1HXC3npPU+kFSoCBhznoQwT+X4NJStpTiioaE7U1cwH6/q95TpsczRhjomdd/QDpmS
 W7t+AxHTmgJ8bX7fIRRu2gGageXUrRGA5jKb4LPlLHLHeQ2VDVGtLwBgq2M54tfYyJAxzQ5yWGZ
 r7KpikWozOdWmHw7t+YENqIIHnIJ8tKnENxp4m86cmU46BiKm6BUN3sUkVZYlsqdfDfbZmUXN+l
 fznTyY8U+nwhf7YPTZLP/+0EiSy6F7rzzG095cPloDNQTtTIQVccrGNgE1iTpe2cDX30SHy4UZq
 Sl2/cZnUPsJpr67guQFgIVrs20OLCNZF4iw4SJjhyHiYRH9Ryty8gQRwXDkkucH9oUHsen7kgVV
 JgWx/7S9kapx/eQ8AJg==
X-Proofpoint-GUID: ph00JUyWo6hsBxBTxV3tEan8S0WfJl2g
X-Proofpoint-ORIG-GUID: ph00JUyWo6hsBxBTxV3tEan8S0WfJl2g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX8Jjb+UgqMP2O
 QKXnWZM6YzBaYmQJ7ES1qFhCJ17I6WpDhcZllNIcVlL7PqmRt917OOIF1nSdWk+QISosDXyuTCk
 Rcz6MTH/BcFZpCgRSsZ3trrpFhdRxRw=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac72f90 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6HI80psrSe5n1y8aGwAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023



On 10/7/2026 2:41 PM, Val Packett wrote:
>
> On 8/19/26 10:25 AM, Krishna Chaitanya Chundru wrote:
>> PCIe host bridge controllers may need their operating point raised before
>> retraining to a higher link speed so that hardware resources (e.g., RPMh
>> votes on Qualcomm platforms) are available at the requested data rate.
>> After retraining, the operating point must be updated to reflect the
>> actual negotiated speed.
>>
>> Add pcie_set_opp() to look up an OPP on the host bridge parent device
>> using a key of (per-lane frequency in kHz, LNKCTL2 Target Link Speed
>> level).  Keying by generation rather than total bandwidth lets OPP tables
>> remain width-independent.
>>
>> In pcie_set_target_speed(), call pcie_set_opp() before retraining only
>> when upscaling (speed_req > cur_bus_speed), since only raising the
>> operating point requires pre-staging hardware.  After retraining, call
>> pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
>> the votes.  Both calls are skipped for downstream ports of PCIe switches,
>> as those are outside the host controller's scope.
>>
>> Some controllers also require ASPM to be disabled around link retraining.
>> Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
>> pcie_set_target_speed() saves the child device's ASPM state, disables all
>> ASPM link states before retraining, and restores them afterward.
>>
>> Signed-off-by: Krishna Chaitanya Chundru<krishna.chundru@oss.qualcomm.com>
>> ---
>> [..]
>> @@ -176,6 +231,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum
>> pci_bus_speed speed_req,
>>           !list_empty(&bus->devices))
>>           ret = -EAGAIN;
>>   +    if (bus && is_rootbus && host) {
>> +        if (child && host->disable_aspm_for_retrain)
>> +            pci_enable_link_state_locked(child, aspm_state);
>> +        pcie_set_opp(port, host, bus->cur_bus_speed);
>> +    }
>> +
>>       return ret;
>>   }
>
> ASPM is not actually reenabled here:
>
> LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <8us
>         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> LnkCtl: ASPM Disabled; RCB 128 bytes, LnkDisable- CommClk+
>         ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 2.5GT/s (downgraded), Width x4
>         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>
>
> Because as the comment for pci_enable_link_state(_locked) says, "note that
> this does not enable states disabled by pci_disable_link_state(). Use
> pci_force_enable_link_state() for that"!
>
> This needs something like:
>
>
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 4bad311dc7..c54f2658e0 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1709,6 +1709,12 @@
>  }
>  EXPORT_SYMBOL(pci_force_enable_link_state);
>
> +int pci_force_enable_link_state_locked(struct pci_dev *pdev, int state)
> +{
> +    return __pci_enable_link_state(pdev, state, true, true);
> +}
> +EXPORT_SYMBOL(pci_force_enable_link_state_locked);
> +
>  void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap)
>  {
>      if (lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 623731b96c..530b9047a0 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -211,7 +211,7 @@
>
>      if (bus && is_rootbus && host) {
>          if (child && host->disable_aspm_for_retrain)
> -            pci_enable_link_state_locked(child, aspm_state);
> +            pci_force_enable_link_state_locked(child, aspm_state);
>          pcie_set_opp(port, host, bus->cur_bus_speed);
>      }
>
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 9f20bae6d7..59d7b67c9d 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1960,6 +1960,7 @@
>  int pci_enable_link_state(struct pci_dev *pdev, int state);
>  int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>  int pci_force_enable_link_state(struct pci_dev *pdev, int state);
> +int pci_force_enable_link_state_locked(struct pci_dev *pdev, int state);
>  void pcie_no_aspm(void);
>  bool pcie_aspm_support_enabled(void);
>  u32 pcie_aspm_enabled(struct pci_dev *pdev);
> @@ -1974,6 +1975,8 @@
>  { return 0; }
>  static inline int pci_force_enable_link_state(struct pci_dev *pdev, int state)
>  { return 0; }
> +static inline int pci_force_enable_link_state_locked(struct pci_dev *pdev,
> int state)
> +{ return 0; }
>  static inline void pcie_no_aspm(void) { }
>  static inline bool pcie_aspm_support_enabled(void) { return false; }
>  static inline u32 pcie_aspm_enabled(struct pci_dev *pdev) { return 0; }
>
> (the addition of the new force+locked variant should go as a separate
> commit, but well)
>
> With that,
>
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Thanks Val for testing and pointing the ASPM issue, there is actually patch
for this[1], I missed this new API change, I will fix in the next series.

[1] [PATCH v3 2/8] PCI/ASPM: Add pci_force_enable_link_state() API -
Manivannan Sadhasivam
<https://lore.kernel.org/all/20260708-pci-aspm-fix-v3-2-6bd72451746e@kernel.org/>

- Krishna Chaitanya.
>
> Well, tested without that too, but losing ASPM is not good :)
>
>
> Thanks,
> ~val
>

