Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6AF1E1DE8
	for <mhi@lists.linux.dev>; Wed, 21 May 2025 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845600; cv=none; b=O+0qETxKhUBgNLDyI99gJo7+0j3HSDkVL5Lsj5JLv8pOLwwEChN5zvKakeCE4fP0tVxS8YzB24HUjwFIHtLJ+pGcSmyEOUsEMo5Syx7GwOtnk+B2h0m4Wbtvrp+g8BxFRW8QXcslUqhhmQfKH0++g54YxaknbV7HMW6XI3rQnEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845600; c=relaxed/simple;
	bh=n3ElQMwoAh4w7EPo/c5pxgWR6UFefdNj67hk/N82heM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAdRrUy8jJV1arCPmP/8XHnwtsThMSlcjYT+l7hZwn1tdgao0+cVdhwmLwcKqQNazaz56hxQuwSzs91FxKNrGD06xCB9ay5CoMVRhUeBGVI1bRxZj9Vbs5Fi9Ub1GxRFLCDUS7QJNRJQa4eHByw7GzOU7+IlHHVgZO0+mkMllmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHrQYy3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHrQYy3E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XIxo013410
	for <mhi@lists.linux.dev>; Wed, 21 May 2025 16:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsTwA3locQ3uWAKxU5KRRSqj/aN0b2AXri11MPsd5J4=; b=OHrQYy3ErAfE9RIw
	6bRYjZm2W0ldHe16stKEjniGQUrzt+Uic60cYDw/y9H83lR9p89JK44Q7DhWCcGF
	TAguTOlRPJHoi9Vnt+uPRGRCb/BbpxC6opCh4i/0i5Ruzz/kxy2TUHBfTg/IqPVY
	ye9IZJDTsu3DqCXQHXDzADJzff1DjeAuRvl/dxPESMD16DMK2ta44b525pKoUXPv
	RSO2AbvDfwcTCigAydJCJU8qzEO03SJVtCxTglQg+oQAUPE3MOYohDFs265oCvJN
	msmj6OGUHtFQ/sB9eDVfjg/oyx+pRvusT4b7EkeNl/K6ZDRuofrYIgoWXnORq0NC
	5JE+3Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5bpap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 21 May 2025 16:39:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73e0094706bso9624893b3a.3
        for <mhi@lists.linux.dev>; Wed, 21 May 2025 09:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747845597; x=1748450397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsTwA3locQ3uWAKxU5KRRSqj/aN0b2AXri11MPsd5J4=;
        b=KMWKcunLMN7LgnwfXM/zvaDqVuzrp52SqiuD6j3pWwISM/AK2m/75hsTbqB+ng63+2
         xxrOcv7SIghUX2c7gkIRgfJgXoMSIZODu3SdYqce7Ti4EtM3kfhnjE+50sLLIT0ZMh1L
         BI4o5VJULCziEQjaJwbosBmBxp/ND3VC4hOEuEqJrWVpUnFhVQwd5IzIOSqE5UK2lQIy
         IsggsoREf3Z6+ptVBSfhhQAZxgwrfr0CNouXid4iJh6Fr0G+lYOWqTncYrHv9eJFckzc
         PpIa3sO4Sl9GD3AsU8Um3Dk7HMEujKAl0QM1ewzaukjSyffZU4qZy/EsP12/Jo5IEfOg
         cElQ==
X-Gm-Message-State: AOJu0YxFtgQXR8piYv7OTmQlwykqfLAw0NDC2TSvfqK3mdFSsY9fPa7J
	2A1v1sC4DnrQ9ASkeYti/51bPbQg38uwCkBzo1TrVByMP04bNo4eFIOX8UdigPhvqBGaIBtvaDh
	OHJC3sul8k3qsjzBrAXdo/uGdY0gnONA93qA6jIBi8Fngic1WLFKje6M=
X-Gm-Gg: ASbGnctPgMDBVGzZkTmz1zGawDXnZ/R89/2TQ0N4VpAY2e3SaXj4cXLPPe3iVleBydt
	58gaGBy4GPhNiHHSL1rpB39bokqH095++v7GlqQAlPISImvBgAidKKZ4WWOg4iKtz8amnc6A4Il
	5ATWwEPRNa+eQlV6ZpyQj2ivKpHfeQJKOixuvPbznx7pcb2pFxQiAIML7m0LcP7gehvr/fUlHUs
	EI81J0E79QZVeL6Zs5b10a1yursC9yyCAu6Gs4ZnPARaS6YEyJAtl28cltZ5QpAZDL0crNWJbL2
	Cig0YbdM4LBGbLxkN5yNPlzNhNH5eG1AIsdfRT46Pq6jowpOMhXdV1DkGBGBNg==
X-Received: by 2002:a05:6a00:2790:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-742a961837amr25941664b3a.0.1747845596781;
        Wed, 21 May 2025 09:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+ZhGaSugTFX7epDYIyxN9z6RXlhFYxvBiDfQHHnlMyoSLDPTSECMC2e4o9dJlsCzkQOPcdw==
X-Received: by 2002:a05:6a00:2790:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-742a961837amr25941640b3a.0.1747845596428;
        Wed, 21 May 2025 09:39:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b7bcsm10081510b3a.52.2025.05.21.09.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 09:39:55 -0700 (PDT)
Message-ID: <d88aed39-b142-4ae7-a8fc-581e24ed6ebe@oss.qualcomm.com>
Date: Wed, 21 May 2025 10:39:54 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
To: Youssef Samir <quic_yabdulra@quicinc.com>,
        manivannan.sadhasivam@linaro.org, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NCBTYWx0ZWRfXyjPWGzHwxBQZ
 LxTYT8tBVQdRvFtxooiEAslgl1MRnIsxIg9SiVeNQ4fdvtUJcuX7jfjTB0iqOdZT0qEo4/2W5VD
 XkIT8rmtV2ozXyfZpIgdDTLrak1/rMlzqkoQ/a/Sxu/RIHlI3tplOjtauaysV0hWMv4OZo6Jmfj
 dS3wrc38RAeiB0yvNiyssf9B4bXLeTxj1g/LVSrFVSKLtM1PF5HaLGb/slp0v9W0rs5fyWhIC5o
 vu+6ZTrQ3k+0kGHa9fiBtm/HeDVeN7Ji6BBCogxP6kg7uKn8T5uQzvyPqeap7MConw6oL/dIBBK
 AK7WCBSCdZtOVnPmVjdi4d6COFeey6oKPxNBItMjWtBsOwU49J3KT/TIj6BIAU2hUVigg2ZblGw
 gTO8fJPqUXOMZdhtbSq+xHeElAen62iLyxsZdRC57JamSi6NZxKhUo30C+kRo+u65OAGYnky
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682e01dd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MlxiPQrgYWHJ-qK4OrsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: atM4klzd33y6C4pp-7wcu3-VdvCBWaXF
X-Proofpoint-ORIG-GUID: atM4klzd33y6C4pp-7wcu3-VdvCBWaXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210164

On 5/21/2025 10:31 AM, Youssef Samir wrote:
> When a remote device sends a completion event to the host, it contains a
> pointer to the consumed TRE. The host uses this pointer to process all of
> the TREs between it and the host's local copy of the ring's read pointer.
> This works when processing completion for chained transactions, but can
> lead to nasty results if the device sends an event for a single-element
> transaction with a read pointer that is multiple elements ahead of the
> host's read pointer.
> 
> For instance, if the host accesses an event ring while the device is
> updating it, the pointer inside of the event might still point to an old
> TRE. If the host uses the channel's xfer_cb() to directly free the buffer
> pointed to by the TRE, the buffer will be double-freed.
> 
> Validate the pointer inside an event before processing it.
> 
> Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
