Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F6231A3B
	for <mhi@lists.linux.dev>; Thu,  2 Jul 2026 04:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782966691; cv=none; b=a1tNWaBETHpU6lhMH8mak1KZkM1HvVXgXS0oJ+SvoHN81e2Zj3K6rZ6DiZgCh8Q/b9t/Elt4t33Vmqp2tA+Sx2sRslCkw4X09iiju54hbSbEizvza6g+WGJjfiaxfl06rXaCv1cS2Q8XSefu17GeuK692KIgcPjjHuLm8C7Rq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782966691; c=relaxed/simple;
	bh=vE7Hjf+MLc8902/ktwRaxiqP0uFvZ89u+t9/5HuFbB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NF9uhm4Bx9wkQ/X2MhkRIapSXy8QwwdzwPoAjyn2KiUJb9b9ZUD7QoCoBx5plnW69EpvFTJ6W3gDoB27JbXP4v/5TUfOTvLZizETkDd49FLtqUFjpVisUn4zZQYM+wOmjFOHAaePucUA0Arg1OosOgPB6brL0vCTKu2i1ODndXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuH34gzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXr/yqkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuH34gzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXr/yqkK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KojV3048791
	for <mhi@lists.linux.dev>; Thu, 2 Jul 2026 04:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9z14DdaScwvuUkS9S1aCzsy5HUZXH5Z2PoiV67T14h4=; b=FuH34gzmOQltaLm8
	w2azdXwGaNSljN1NZWl5tRrWFe4uA2HTLHGrtEZeDI6F1NSElZalItaY1rlfDQlp
	mh5DFLLg5Hyn8aWsWD6t12SIIPtapo88esXUFpiTA+s5i0D/JyJJeodFEBtrPM1R
	BlMIOGSoTA8QdLgw4mL/D5sudvPCrug6FFhasCnx93V01qqK+qAEnGnq6iHfreuT
	0WsyMdQjStUadCy53dK/6CAqZF//MWsHmkFLjBVGCI25dWSpa1b6Q28VSv0FWPTM
	IFASBpqdwFQNtPbe8oSp4zMrK3ixrBnWFguc4JNFV2FRS5IzPFpEWcus+1oZQTAA
	DTbTpg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqv597-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 02 Jul 2026 04:31:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c98136ceff4so2051437a12.2
        for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 21:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782966688; x=1783571488; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9z14DdaScwvuUkS9S1aCzsy5HUZXH5Z2PoiV67T14h4=;
        b=eXr/yqkKL6FCPKpGSrjytr/aGOW7rQZBTJrcGxA21Vtl0JBlRHDiYvVbxWuaIXJyJQ
         60jw6Dlm4zuMX26ZxzyjwJRjMQRKNK2HrZ5p7H5F2TFRpI/T5/JAu4GdNJgsA+TY30AK
         ke2T443XSYnZJssGBG5FtttQVIVNKfL2AfUjBLYsBHOE+O4sQGpzZk0zRjYa9Xtj2nAc
         2rj9prK2xM60G2AHumJXKRSg8Spw/svVVo+NhUNkncnr/zoZSNx0BvgVLLZWwtN2X8pm
         VqZfkpGjyCAT3oHBtPZ01aL9c53rYqoW8r4KvsXDAz4ywLil9Q24FTUwrgFiN3Xyilik
         o8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782966688; x=1783571488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z14DdaScwvuUkS9S1aCzsy5HUZXH5Z2PoiV67T14h4=;
        b=ME7KvoPuwaPbS+g/hGJM0tu4sAZGbHf1jY7Btk9ZNzgH5SiB3Sxuj5UppeMJ2ulfrI
         zwsD2iPMjVDXQiw7G/uf7M6uLhy4TFd9l3HTTe/DCsiiJ50lrJ8LXNzqWN0KpCw1mfaP
         6MMD3TJrjwCAUDuY2UJpvw6lhagx1YMX1R+tIJQLZwF3YwxYyPUpwzVE1/7DMLVdbp5t
         hegBbUCOvuCmISfKY0Isuj7rBJzn8CM7Tr6h6w0k9yxIZX/KTAPgwEw3icSyDMMUcr7A
         eHvLYI+Df9iAz2+WK0idnCrecbfH+F+UfNYdT8D5PNn4rtguzfhI1DFSnUhLsvNO6MQY
         6SZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BL/ZcoZooQP6BuKQ89CLdX5dElLDkgbkMBcnaRtsxaS6tCbv12A+g8SNGIBXTB5A3dRs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzkUp7OQmF9j40t8aLQw5kRYg0A8czUIDZTcEUlvagG6WXSt6/
	El96Of86PhXgO6lvPlFuZz2BKQdtfIQCoLzi3vsC0DF2Gs5NVa2Xs/ayILu4/BhFB78vyZFW4WD
	Df6wQi1D8fz1JLSKQOd0j4qkm2ad3FfLA5yeoBbLL/6VClwe+hXcYCYM=
X-Gm-Gg: AfdE7ck+4s8HLf76vG9ltgyqYxrOoCkm98oEJnnJS5cFM6Syn5I/KdAGMm5Ql6ybmiL
	0dhz4xMgs+DqQuGA8CtNJC7iQttb434WPpiDEySolMenLVp4rwaeAWWMJX2WVEVcqlm6zsvG/We
	moCbt18dIwb+eSi30X9XnmusROf+JDySsEcTFkhRNH4lRfxz0Lj59ncWlTkV1I9RuaC8cYnRhOF
	ZLfzaxAwDi/UkB2ey9wWoi4jwePdcuCzAXNv76OE9vSCWHKikJhjdrH+A8RUjZJ5G8YL+2oR90Z
	HOtI0uu5HnUWoVPdCRRJig0hZeX17vbosZ5S9KTRchy4yV44iR1iNKKelGA1aA/j1HDOw9fvqJ5
	pCzrxxRG0TL5rTqGqwEh/WyLgNrJCx3Siy2BGeiUrnGk=
X-Received: by 2002:a05:6a20:918b:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3bff3c31bd9mr4183270637.0.1782966688027;
        Wed, 01 Jul 2026 21:31:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3bff3c31bd9mr4183227637.0.1782966687526;
        Wed, 01 Jul 2026 21:31:27 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84366sm5441204eec.16.2026.07.01.21.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 21:31:27 -0700 (PDT)
Message-ID: <bb0904d0-81f0-4575-aa17-007aa88f9942@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 10:01:21 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] bus: mhi: pci_generic: fix Rolling Wireless
 RW135R-GL and RW151 support
To: zwq2226404116@163.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
        Wanquan Zhong <wanquan.zhong@fibocom.com>
References: <20260701095344.309409-1-zwq2226404116@163.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260701095344.309409-1-zwq2226404116@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W3Z2WRDY8cPRAkY-0baK_qDPBI23YifR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA0MCBTYWx0ZWRfX2D9FifQ2sZ5c
 q7tLS4xWs0CjNn3pmTqhB0HwJ7ErE/8wNQxmrECRpUu4uNqg7Fp7jVu0xgxwka7q8+NLX/uwwGB
 PgB9P4y0aMWkMcqGBXY170d3aAMCCmU=
X-Proofpoint-ORIG-GUID: W3Z2WRDY8cPRAkY-0baK_qDPBI23YifR
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a45e9a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Byx-y9mGAAAA:8 a=6GUwiT5CAAAA:8 a=nWUtx5Q0ph_BRYhHASsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=tp1klI1xYmtLYojU9LVd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA0MCBTYWx0ZWRfXx/PGNYuO24aF
 ozo1Zj2Qi6W7eJbDwm7G+QlTQHxrHJB2LciFsuLJ6ytBg95+GG5vj0K/nATzvbqtBbgLoOEovZq
 uPPDf6SyNEiApq2mcgn1+xupGKRZrZdeoFjszRah/HNcCT0bMQwv3qecL1jWNlbJv1tZZz4+bB8
 OHVEcCJ9SjR/AQfdQuvbdRxQ2RbbK6iGDoz01FKEMDiEZ0jtwqF5Hy6p6/P5Sp9DG3TmSrrpSm2
 Av+3rim0I+TlPGFp2ZD38JNOsuIGXD7uwI2PVf8kJAirb6PSCRC0OjBudErl2gtBy7vRYGBy53h
 Lq1PUXU5+9aF9OjMtqtIHUq67xStMGo0X7M2ZsUYiU3lwNtVsZ7Hlqp537OAAU3c02f+oPIbr/T
 hn3P09bkfzf+m2MQEOj+eUVJHo2FDmDes+EWMgUByY4H/KhLkzKg7tLZSsxxc4N25f97LOPvGPK
 7uhF8bNYymIikUxSQig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020040



On 7/1/2026 3:23 PM, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> bus: mhi: pci_generic: fix Rolling Wireless RW135R-GL and RW151 support
>
> - Increase RW151 MBIM channel ring size from 4 to 32
>
> On HP and Lenovo laptop platforms the device probes successfully and
> WWAN ports are created, but pci_generic enables runtime autosuspend
> (PCI D3hot/M3) after a short idle period. Resume from runtime PM leaves
> the modem in MHI SYS ERROR; driver recovery (reset) fails and the device
> becomes inaccessible (PCIe config space reads as 0x7f). The failure is not
> self-recoverable while runtime PM remains enabled; keeping power/control=on
> avoids the issue.
This might not be MHI issue, as the endpoint supports both D3hot and M3.
After runtime suspend check what does your platform is doing as part of runtime
suspend. It is more like a platform issue not a mhi issue.

The change is like workaround on platform problem. so for the change
no_m3 = true is not correct.

- Krishna Chaitanya.
>
> Set no_m3 on RW135R-GL and RW151 so probe does not enable runtime M3
> autosuspend for these modules.
>
> Power management testing (separate from runtime PM above):
> - Suspend-to-RAM (S3/mem): tested on RW135R-GL and RW151; MHI/MBIM/wwan
>   function after wake.
> - Suspend-to-disk (hibernate): not available on the test platforms
>   (/sys/power/state lacks "disk", ENODEV).
>
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> ---
> v2 -> v3: RW151 MBIM ring size 32; disable runtime M3 (no_m3)
>  drivers/bus/mhi/host/pci_generic.c | 4 +++-
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index d598bb3b3981..d0fee7e3ba3a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -942,6 +942,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
> +	.no_m3 = true,
>  	.mru_default = 32768,
>  	.edl_trigger = true,
>  };
> @@ -949,8 +950,8 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
>  static const struct mhi_channel_config mhi_rolling_rw151_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> -	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> -	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> @@ -986,6 +987,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw151_info = {
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
> +	.no_m3 = true,
>  	.mru_default = 32768,
>  	.edl_trigger = true,
>  };
>
> --
> 2.50.0
>
>

