Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F6031B837
	for <mhi@lists.linux.dev>; Fri,  3 Jul 2026 04:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783053033; cv=none; b=YyH1Za/q94pnBWMShpZUdfzY05op9etd8933eO9CUmLZQnwf9ulFPmd3p/Z3kFHAcr8ITZySP0QQra5VB0FmEzFQZUDTnVQbX8LyOjTiDo7BHlt7HUE1BHjx4fyT8KXEhPNxEoJdotXEq65Z2lcVAAmVjuJGkcIKWxxW0dRn1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783053033; c=relaxed/simple;
	bh=nvJK/KTbntGuy0BYZL1hNDwOlR+oX1X16iRtb9Eq4ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRQxmFIzAji07iqTtuezCw/aGhR5Zr1RypbRzbZ46tZRW3uTXcPtqbI7gsZJm1cSr0+bnTitluN5NGDr+X7TOa5bR+MzqZUGG69g1dzvwggAxBYmwSnYpWvMaHcIIZ0ASzBaCBRCcU+/edO0QZAQMNY8WuZ5l06skrE0mojTcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhEgygR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9KaThcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhEgygR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9KaThcQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342aSw2819736
	for <mhi@lists.linux.dev>; Fri, 3 Jul 2026 04:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A18Z48GLxT5LW9XCfkBo5cci2Vmn0dPJsWkS1+qliUM=; b=NhEgygR6+nRceuKi
	93lA6e1+cmZCZg3xqu2kWKLLkr2bWKvZqfnFvxDgwFBfBCUW7siQr1+l0C8lG7cZ
	5AFqveouuc0Qogsh3kdeF3iTMPxiTFYumWWWbfinrtVxgmPJI9Tb/47BilvgZiij
	/KvsTgFDQ6G1PVYmILrXm7bWf/5Dw0HLmRI8JI5xcG73+bGI01/dtBXbqZlYVHYo
	rrgsxRpMNJpibOD912zcFGSzMXEfjXDhCnAqu7xSXLLEXRsEirKN1CTBZievC+4k
	g10DbQyXegiTte5y8jS+AVJoQrIXW+5p19Nh0OiwsMJGBlxk3hfEcxIy4D5Or7HQ
	EB9Log==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc3m3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 03 Jul 2026 04:30:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fb9d7b524so265521a91.3
        for <mhi@lists.linux.dev>; Thu, 02 Jul 2026 21:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783053015; x=1783657815; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A18Z48GLxT5LW9XCfkBo5cci2Vmn0dPJsWkS1+qliUM=;
        b=c9KaThcQCnrbbnRg+/V0dFH3xsMUCY8dY9w1fxSYOtrM2Hf4JoFwlhCgLOjVVq1qxa
         evgD4dbHvhMe/20npy+NPH1sA56207z9yAKGJMP0KB6HYB+szI1Cwve9tU4KfSx6APRp
         4ufIzKb362rovZo1e7rpTcIVgnJBBXb0vZQJsHZ0Q1eEOtWxhdIkFPpMyLUvwF+bcEEP
         rtIhvejU3Xa1SZesIYtmrj8DUqoK/jXgwgx94sROizJm1apVxLk1LgVT2onQN6/JqNhg
         juSo1I3wH9UMzZqE0xir3zuEiovF6d+e1Xftna+uouWCDH0t46DD1atLgdq10zPHQnpC
         r+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783053015; x=1783657815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A18Z48GLxT5LW9XCfkBo5cci2Vmn0dPJsWkS1+qliUM=;
        b=sYtow1yL9yTaKCpkVCwC1VpQTN5V9QCOdYFlIkLnW9rOciD0DyooPI30gPvtaWrdEh
         Pb0mT1khauBDtyDzfkA3rLu3n32QEpqfOWazHsEH3E9vFmKDB+B8fHw+tnCz+6SAYsRr
         HKa65quG/D7u8gKwAmCWTmIKVnwTop53kcnwX++dTeEMzZw9hcyv4JVTgXdbUhdP0X2I
         55J6rZOSu1g2ElTJKPnx4MhjSUgrt7GBm/tWvogyVlycVer9Zg/32WoGjHViHPypd1V8
         1uoj9LYvy4VuCd/r6L2n7oajXvIFUnsAgPDe6qBfsTtO+qfDL4r4r2Lg0ii0zsI65KTC
         czrA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Im1B1alGe8yOSLfc+fjaU6jicTOMYPMWJwl8AUVfzzR+7+7C/9XYOmXmgYSrp5ME3f8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8rJSGmJtvZN+KFPyAwh/L4jPY7cgIt///YsDAU14JRCq1Lfvk
	Gu5x21A90tcHTL+8R7vua7bPLBZzfaUuFF52uvakfu2rlT3f8u8yMN9WjewSVbO4yE6U/x+nvXg
	WVI2XcmCJwrs3WIy962efkFR5NEqr0OG+/JReKHTgoBivhpzWwXq+gAY=
X-Gm-Gg: AfdE7ckU3JGlEpkvk3yfG5yDivYLF+A8PyIRlp6Ole0HEtzXUbxcEd8S+a+0W3MBt0P
	6CTmlUSSqtT6oSsLaKQG/BEsKo6fdPut8253YC2/c4yGqullGdVU7rU/VA6Dmk/+bTnkNi7B5Fu
	wO90tGVGefdhI/eMir3t8t8MXwC6wqbuB1mOd9CqDvinfSk2HB9MRlaZjmGrtz5frkt+GsXsRBG
	iOM5WncBJrK+gCZxaShJeCPlAJi8e/dDGYuM/KDbfE72keO5P84VjuF0VXEONxQQIOaDSP6ZRuR
	mJpAeqOPiMaNzZCkMoCn4Ew0zy76ViToKyzTnT7c/UEcmKnsOFS8b2sa6U0u1U7JnRbYrRUEmME
	Fg8W7sL6UQBgciWrotAf1hvnByDl+sR/1sDn+z7XAxLU=
X-Received: by 2002:a17:90b:28cc:b0:37f:9ce1:7360 with SMTP id 98e67ed59e1d1-380ba961e32mr7862289a91.33.1783053014791;
        Thu, 02 Jul 2026 21:30:14 -0700 (PDT)
X-Received: by 2002:a17:90b:28cc:b0:37f:9ce1:7360 with SMTP id 98e67ed59e1d1-380ba961e32mr7862261a91.33.1783053014202;
        Thu, 02 Jul 2026 21:30:14 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm26079276eec.9.2026.07.02.21.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 21:30:13 -0700 (PDT)
Message-ID: <c53fe666-7cca-4d25-8ee0-a787e5d1bbce@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:00:07 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] bus: mhi: pci_generic: fix Rolling Wireless RW151
 MBIM channel ring size
To: zwq2226404116@163.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
        Wanquan Zhong <wanquan.zhong@fibocom.com>
References: <20260702100013.545593-1-zwq2226404116@163.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260702100013.545593-1-zwq2226404116@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a0_4U2UMuUq3pZ2WnPjgbr65I-UFFPXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDAzOCBTYWx0ZWRfXxldhr3DBnpw7
 awYHpu+tqA1+LP3bJ9tE/Vz7r1YdtdgYXW6m7Aekx9miSrucJU0XGI3T9FUZuf5JY7RrYQ4mp3R
 JAlfsaMsmtlTuLGqBSlVpNyvIwEBgxei0N8czU71svqj3Xkipta8VENIfHKHRaTnkDNfOeE1gI3
 347o5rkJqxS8rKwRJuTRk2jGBC5Gj/vLjIinTzkU480p2EJygG7u6bvZsuaG7aZR7rvlNPI6tNe
 2/OSGmS7L5oz6Pl6SsVdxpT2tDCbRiuPuXIZNyALDsUzPaVguHxAHuAEgT92iRrCl8STk77jf+e
 dyN+O4WH1ws4JlQPSWF8/HLAMvPLdUNj7mP/D3k2H0UpVgq2Pn3xpsfY5EOl9w4k13pJDKOUzPz
 pncnawweukYMFW/1KBWky85kOJX3oPDq1m6d5Eq9yU2oml+Rxs02SAUODlqMgSKNpr6n0m1OAuT
 xRh/iWXE8uVGRigZIXw==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a473ad7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Byx-y9mGAAAA:8 a=6GUwiT5CAAAA:8 a=jCkg8xpmUld7mFY_8ykA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=tp1klI1xYmtLYojU9LVd:22
X-Proofpoint-GUID: a0_4U2UMuUq3pZ2WnPjgbr65I-UFFPXS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDAzOCBTYWx0ZWRfX8kT7KknpqB4K
 N+vBAvtwG+ImTYGiwUIHjftMrUbexs21q3X8F3/EL3lMXOEHmMsOOT0pPXi/mxdfCz4oopq9Suf
 UwwdBuXHbot7qAjhB2pgsnsVuE7llOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030038



On 7/2/2026 3:30 PM, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> bus: mhi: pci_generic: fix Rolling Wireless RW151 MBIM channel ring size
>
> Increase RW151 MBIM channel ring size from 4 to 32 to match the device
> firmware channel configuration.
can you include what is the side affect if we don't have this change, like what is
functional issue, low throughput etc.

- Krishna Chaitanya.
>
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> ---
> v3 -> v4: Drop no_m3 quirk per review; keep RW151 MBIM ring size fix only
>  drivers/bus/mhi/host/pci_generic.c | 2 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index d598bb3b3981..d686aef6e158 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -949,8 +949,8 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
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
>
> --
> 2.50.0
>
>

