Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712AF2620DE
	for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767039611; cv=none; b=abn9Z6MN3WxEEnSX4IM2ZtIDmyQBunv9m4LxayMBhxbQzqDqLc12IYHbR1WU/415rfMfDKBygKyzuBgPjIHny6ALmABo8ZR14m/5M5h2rhHMtxTomGZWt0zlqNbrGDeoflhRHjiDCSFxr7KeB491i91SJUbAayIQOJ2SrFYRr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767039611; c=relaxed/simple;
	bh=BwsOeiT9u3rzrRz11E8mkHEqiVBgJs18hfyrJTOTuh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED4cbs6uPDzvLOHv6RjsBsfBdetps+KAFira60oqEqinPJTbKZ/v/cW+1G16DIqC7+a4s1elgnbzSDN2XLpjNS7djJvb182j5z2uHWPuIPm4waFUaildH8RRIfkCSoCCdsSxsqzKlGF3VS3/oBL/jTdOvmV446QMVMPcjTX9goM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRwYQYc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPmWfLwO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRwYQYc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPmWfLwO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAS3gr3697474
	for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 20:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=; b=DRwYQYc6xXrnDYfr
	4zRQWdR3gjE1qZXQA0FLzBPH7KkA61L1rU+1UwsFW2KeVAg4ylPLhHzsLwcVreoX
	RBdj6tQj9QdRrgeLzrsl9GpeAnO+WoQdhvIEUBuimZ9l/doWI6ATiXrc9yweeazI
	0WGbiS69rwFLUA6BPpDQDeXEmw4d/qGbTHIsUTwP9aVSSxNsunYUOzvw1gSlvW27
	Z+BdYghv3ZbMC269yXSZDBdNq0HrXwcTmJebFHgnbGo9qXqrwliIMQNXSlZGqjrQ
	U2VvdGIzyWc78GnzV4TFHUmOHt54ps1lb6YANvyCvR1MDQXnnDmUngnPDhMu9DR+
	OcPABA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8ytk7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 20:20:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11ddcc9f85eso18262817c88.0
        for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767039608; x=1767644408; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
        b=aPmWfLwO+FheKD4KZyBgBkPdLg+wLjCSXsWBHAIm12SMSNSBw8at0JEh6HRPbsGsPW
         QNDlaR5kZ32gMk+HGwsJtAaEWQPPupAkQ3upVV4/MzttAvm7vAlvn7Rk1dxv/K2X3xrd
         MpTzD7eaPbXerQsvgu4DelRPx5FS9XMuQwgdq/deqfuNm0dH3P79sb+4k6TvnAuNPxAY
         K2kV+N7oKCYsa+/DOw4jTdQDgwsxZG0cFIcDIkC50DX/011ATyTbgat/KMCJTly0ae+f
         sy4lKOnkh0DqZ7vOD5C4s6CTQZO1KvxePGFtihEaYg1kRZVumyrylopf2RLEN5SLzhak
         jRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767039608; x=1767644408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
        b=ZnyYL1wkc0PgCpl3+6zaBxFCDC2KBJo1oxw8+P/MWBigNabaTMaXmgDkGBTr4s7P5G
         ORy6YpZtKhfaH53DvsvRy+OTVKR2IdU0eI/Dgtdu2CpxHV9n11FDIvYXoklra6aGOOZm
         zuqxk1+E5Nb3jczzra43IlvHe9Y0Z8CVc+z4iQcnzHBKmPuCZwr2nNAV6g7XaMR4uEOa
         UKGdqa3ULa56hUyI4pjRdE/k6iOSNi2xf+pk5Ybo/blAnFG2OgeZWHRmPf9htPqXfa83
         Yy+bbh+1BkrZN6Xhfruai1yR6aA7lOQCLf775gwLfROo7V6q0dxEa6GCGBkZ9sJagN/V
         FTdA==
X-Forwarded-Encrypted: i=1; AJvYcCWomSS/rajuACoAvo5BErNry1wAQaVmoGEkc5CnYyL2tsGMT/6zX1S8l/0t1nxjp3mtBhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRsuIYU3moVmYZmLwK0QFqH/DIkVp+sYIVPMx5Uwl/nOii6LlH
	Sww64ohJVcYObNzFDZSfdkn6NV5J7sMk1yERlMBwRCUcl/c3azeOAGqY2qV7H4t/z+bp48xYeZq
	mpYBAAQf9TpUXfR19MOgZKfl20XflTY6tNueAwht9/rw/+kRCsHJVkcc=
X-Gm-Gg: AY/fxX6PhKD71UbBArO0HB2OA6PGqVMM1A1hHdRuuV4wsvI5h2npsCXU81QOPrvuXJX
	0Vxbuwkk/xdqjMNY1ST/q7Bo4YAa/hntw//f1pp4gDWBhF2lM62bWAECV0O4pklt8/leD8FBqhl
	a9Rnlr4TsJw7+qh7xlrfOL18vGEMlHDq4BeL/+ZiiarEdEyE0YFaWTFidjP7xh4mgUa69wWPgW8
	auBcsAJfhofZGLEUbTBv4YvZScmwfGUTGRiLR5SlWPgXhZs2VUhbYIU79maKr9PDgDgdooA6i7x
	zpK5L5M7GR7gXuX5UFavUEd5qlcTwlQD0t7tv2Hk0IhhlelIUPE5WAe4TCGV+DejxbFvL51aRLG
	/fxCbirN8bepiR2/AMA86FIkMAUzRJXgdVQbzMjlisqXXS+ooXG5HIxoyMktErQw=
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id a92af1059eb24-12171afd95bmr24941784c88.23.1767039607766;
        Mon, 29 Dec 2025 12:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/lwK2wTaR4697pd1i+xemc7zfhrLFxVX/r/0pN47IvpGex944GuH8FMyKdtpVLY3DVSOxHw==
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id a92af1059eb24-12171afd95bmr24941750c88.23.1767039607116;
        Mon, 29 Dec 2025 12:20:07 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm117915702c88.9.2025.12.29.12.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:20:06 -0800 (PST)
Message-ID: <60aea371-915f-431d-88dd-3be633dc2bcf@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:20:04 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NSBTYWx0ZWRfX069e4h7/q1lP
 F3xfvtUsMU/hI/ifgGAgBJFRWhi5d4n71wXi+pcaE+HPb7tEOiQ4voUS9v2FHXs7v70W06cnixL
 vldakbAoWcITy0RTVZJjVK0CO2R5f8lmgNNOuIYiDCNiXu/UYwvuSVQbcQqj4LSchyWtiG/DAb7
 cawvMdt5sMftjlOmYku4jJaTgG9jmDuYJrAjGfh4gnylvF45JxQe8sgxK7uTMziX0SbZCofU3CM
 9TmB5ntOxh4POK7iPogRWSPCkeZpDpc481E7mHIUUQlPytKVNdF2FAqAv0kGFuNxM+KnDNrjVdq
 OU71TG0i2OJNBDxe1Qn055sTDxirXNXvWpGZc4HP+gljGhoyR+sLYQlh7ZJ/WM1mVvsl74atgjb
 +GOkADRyVxJnsVwQg/auph+bn6iikvXqmdk9oGhtVAQtzcFCdqVPeMcz0xSKBDB/OD9B1h2oHmV
 TskbK1Xgw4ZRmRzFQmQ==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=6952e278 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1E3v6lIHAc9zRYLFRd379JmEZfk2BAzt
X-Proofpoint-GUID: 1E3v6lIHAc9zRYLFRd379JmEZfk2BAzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290185

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

For the qaic bits

Acked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
