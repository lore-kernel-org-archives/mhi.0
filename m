Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377469;
	b=sr9tH/ti5BxOo8hWSQioPOqnX8uyhssW8pKP9rBBu41IAaRzZ9j2OVuU7rbKYDxWv1Q1
	 nUlYbHunPAYnR0XZCIRh1IXHqiEPl/zhNeI3bH/btlOaLmyi1+KVkxCpfnq8e6AP93Dxn
	 9gjKG5j3cDuCQnEhPwEzGsc1lxWjqMmV3A4c9dx4+dLRFTyg4UM4v/1zQS1u5tOI6bFU3
	 G09hZy6tvwZOBmbc9X1HF/jDWWo/Y0WbII0jVqRogVP3z8MhulmCCDcvvZp7uYqxojpPO
	 0htu7Jc2odubEU6Qu901tOPFUEEpH7cqtRGPVMyMPVcbX+UgNZ30O0uR3Ifb265suWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
	b=jxZfy4zOOEauI8HATjBw4jCQOb5DvK4/EKAY4UE6FpneRtdppK+rOck7rhVYyitwa1Ij
	 ASjM55KFUStDl+7f+/1G6BNi4pfsNEjPNP3Cf+QRwZuZla0xeMBxShWnGKTXb/SjKUokD
	 1arDRMM0ykA9xKCn/FLTMEcTZPyX9YoxTK3b/A6nuw+g2gR665Opyj7X5X+3LYqaFH1u9
	 M6Izj/gpMgftPKGCXElAWpFBLpB7EwPMnUS9a71ZvB2tRu/EseyGdVxnpWju3RDQ4zXxA
	 dqXvA5Xzwh9Ne/fJrNzX77OD5fjsNH6ZZHAlVMCC8o4wDswjORLqzxJS2RgwOY7EJEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OggLu0l1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhwiKp0r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73EB606A322
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 16:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73EB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OggLu0l1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhwiKp0r
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERKsZ2968129
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 16:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=; b=OggLu0l19vB35JfI
	fw1RcPInZWESMKS9U5DKkhLEG8l1LF2tT7oPbrZqjqlxyoiUqe4SkHI4x/X4y+yb
	qQgvSaro1se3m2HPvBtmrEsPVbw6OOtH86KDauTo0IuaWxdOf246PhdSIBAU+AZE
	+2QsV2/wjAY/dLX8I3aXfpirf6dCWaLzxELZo3GoQVP8+qYPWaE3azP486Gl6oHg
	fK+Rbp4349jfPxRGwU4KfTdw55vTMP1YTyu4YG51gMwqQwXQsD2J9X/539n+/IXI
	6TVvflByLMzCF3rqDgYVinwsjPd4/KuiKC9EEPt25Wm1HfLXLTK0FaR2RFYWA/Pt
	AyHkEw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm00x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 16:24:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-15a84442a0bso149743c88.0
        for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377467; x=1793982267; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
        b=HhwiKp0rmrYlCdX0JEn+asiDoBcnzHL5bZn7TUFkRoHDvtu9HDroTPEgfqBMP6G1SI
         A5RFAKlmL05kiYPzmbsVwUEp+dISnyBUK58jMViOwPVzBsea7kC/zG2kQ2mzOobC2hrK
         cWB5MMu+ulR4lhbRg9AHq4YavRKSPRJTshrLS+sboZ9idH6zGE/rC8Qb1KzTVs/JjNa/
         Jt29tJ48+674PfySCspS22gosq3ynWY+YSCb4VE4ll9zpRRI5CLbL8PFVoPbXutTzl+a
         tNvf7265LXkIXxCGf9/2DVwArheWThmZ+B2pMAXYTvM0U2206UgHoHcmCXvZDMHMsaUH
         YiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377467; x=1793982267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
        b=H19mXvmaesENteOoVP4wwxdg3YRviXlVAwizu2M0Hs3INqUFB7a1xt5FFhrugtemez
         yrg/g54AAK5hWjnnGnj8I+a5VKst8mHQDWrn3cEhLGAiYuoKun06ftPpsgfE9mUVKMTU
         lO6c/4m8LpkK6Rvl7Eldtztu49fL/aBLoYYG+mVYQF9B3a724iw3/sFo0OpleB9H/kyp
         f4P80j29b3tWatJMmLFXryA/285F9PHYgNwSUe02XtZ9Vrk/YDwrLMS3GMavTioyhKS1
         rxhZ0yxsOpvK0KX5BhOajrxUaP3rZXBX0kknjfhsltrwgIL8dfUW4YehHkx1EQzCzByJ
         VauA==
X-Gm-Message-State: AFq9FYJtPgvqG45WCuMIfqwG5nYyootyRffG4los87G2VPTLUexfSO0Z
	Uni+ZlgQHCoJkrHYBgRfN3veLVxuWj7M5i3bmHJtoDik+Kq2bRB/Y9HUVbuPdXRwURVHm4daiOP
	QQMfvQgirvhdvJlPlb8pbs2d8aEY6IqaMoWlTgbz8Yp5s2XQjQQRyXII=
X-Gm-Gg: AYBFou1K2H3WVJs6Rmovzo7D0pjBDKfbVBcvGrEvA10VPOvLuH430idur2m9FSrJFxV
	05kZHWJcYCHq+z0ZKva/8pJcVlWqTJwvYSwcGQresWDxcf2KyqIkDuu5bqYVXLRt4K4i325A/6s
	XD4N8DR6LysNT766XqPAd2z7qZECtB91H/WL7ALknnC9EtupiVJReDxRsFWIIcDL9/Kn9VkrXcv
	MzX2p3uJgKpfoArx/CweW+2SPkaZVeVkubVwt37T2B4FHCOR0LraohGw1RzSEJNl1giKTsD35dv
	IGm1s8a5s1dovX3nD0i3fnQn7MsP8O8gVesZQSCZEKV32m0c9y5zCDDIqWBmR446YHRCZBvkCnr
	IaLzIv9OG+nHjXu2v0gbwF8KZkxKCv5GOa6RiycusavOuFLpkyBNdliX7/9EIh5y5cKV/JZU7HF
	fBboB6mcnFe61NsithtiwqNm4=
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr6857198c88.26.1793377466936;
        Fri, 30 Oct 2026 09:24:26 -0700 (PDT)
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr6857150c88.26.1793377466102;
        Fri, 30 Oct 2026 09:24:26 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm9468350eec.11.2026.10.30.09.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:24:25 -0700 (PDT)
Message-ID: <1cb4d497-73b7-4148-ae40-259c57bbda4b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:24:24 -0600
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Shut down the health check timer on
 removal
To: Myeonghun Pak <mhun512@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
References: <20261011185134.1759331-1-mhun512@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261011185134.1759331-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX4CNwxIbuWdB/
 W8rlI8QMjp/UYxfSTRcVrLadDbHqH2ChwrRoBdpToubx1hWxYQL5aolTeM78S9Q46KMWicpp1R3
 bZPirIgF5CN1d1he8FnnKWgDt/lvTL8sXWD1LwxojcJictbnNOJb4YOXo9D+dRylW+pUhG0eyhf
 6awdIyw5FdPENsSSLWC1QQONTh4ylTft+dmkGMOiCMPt4x15lKDR2Qa5yHuVffGLFyIxTBw8LC6
 vmcqmzTEBRhxqNSZdTuVRu3BXaOvP4Yv1EOzm1/MhYTkABz3UVWO3v4dedyX+ZxcMt9TD7bHouf
 ACJNfKhloWvjbbCZCUgtYeIySTJExK+uPfgNxFtfG+ylHYgO9vcR5NQ/u3xV99EDNKrmagrAoQP
 G9EcMvbOj7VCzxDCEyqfMASJTCGZA4i8fmtvkh3Lfxd/uLkBanFfcdKNQ594c9dtYm8m1hRlkxI
 AzBLU21Iu+Nlx0olkDA==
X-Proofpoint-GUID: DJFj6btyrX_2gkUppLxRqqmGriZJXeif
X-Proofpoint-ORIG-GUID: DJFj6btyrX_2gkUppLxRqqmGriZJXeif
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4c4bb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JxfxcCzmXtKzj0Cw3IEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX0CZYTouJNj3V
 qggOeeP+vkmJta4nOGWZroye/1P3/YumlrdsMYcqwabriFKvler8cnuHyUhm9q3UMP2eFmmI7Fi
 6XcXQJhjUkwIEiZpWtO1PzHqND9CJw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300065

On 10/11/2026 12:51 PM, Myeonghun Pak wrote:
> The recovery worker rearms health_check_timer after a successful device
> recovery. Deleting the timer before cancel_work_sync() does not prevent
> an already running recovery worker from adding it again while removal
> waits for that worker. The timer can then run after the controller and
> the managed mhi_pci_device have been released.
> 
> Use timer_shutdown_sync() before cancelling recovery_work. This waits for
> the timer callback and rejects subsequent rearming, including rearming
> by the worker being cancelled. Keep the reversible timer deletion used
> by suspend and reset paths.
> 
> This issue was found by static analysis.
> 
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
