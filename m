Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5147F192D97
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600173; cv=none; b=UHpjS7pVFJuH1idmMjliyF/MfQiyk7g2LGgXSyatN+DwqPlrG7g8GeMg4vs5FRaWHoT7BXRZtfX3Srk6Gm4NhHO0rhR7Kagzu4sE5FX+2uZekfQYWcECXdJs7MMe154mB12toxyaHLcP/3fILqze0PuA5eJ9Z2/cnd4M9VU6GOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600173; c=relaxed/simple;
	bh=O2HB9WXj1AoSWhxiYAZ0nXodQII/89yE6laBRLzq100=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+0eyHK16OoUOvX9uBLC0pvobAcmXDFGQIgKbDEE7ZJQmrPma/rx2HFcS1eLbCq2OFVFkfze2OFE+wqmlqttzey0fdce0jicwXsbqa4dw34BwDYs4eIE7rmKbFW9247UcgV7NKwvcHZAiHRAcKzu1h9fIHLzp1QXAliQtI6F6zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzwTxWVQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzwTxWVQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJpdC031928
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJm7MNzaH/J/vM5UQzpxkTaASRF8p22SemAyXHoKXkE=; b=TzwTxWVQ6bzMBXZc
	OR8Deu1r3Zdq3Bve4iI0fNqpAnAq2qpjvS/B5UFHd8EmMVi+VvEKdgAjV0TFOWyt
	Iibc768E9CUk4iDF3Fg97T/7hYV3i8P7Qm58RXGhLsSe4436blDdWXXnCK+2tI1R
	CJ24UugAOUT82ipQOBqmZDCuysBs8qGs4u7vti/A2iBgjCWzRHiVpSJsQwVwt333
	JSCcZjPRlNpl8/X2AsYdfapp/Yd9s0osOZCw756RHZCFR5oglO3wxXS2V9F5iIeB
	bUdGSGoHpAM0rfFy+utBjhE/J49/jgt9TCpXxhaiWmgKEvE/9H6v0DIEHG+AnfvJ
	f/C1Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9qy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:56:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22c31b55ac6so43513225ad.0
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 09:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600168; x=1746204968;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJm7MNzaH/J/vM5UQzpxkTaASRF8p22SemAyXHoKXkE=;
        b=KyINqqEVpB1Fl/FEw0/3uXd03XjpAfBQ3sC4KVTn/wBAxoh1hgZpKdR1C1r44B/RWU
         JQ4j1wd/L0A8idccTFVSGVfP2tKRH957gNKY+PiLbTU0Fj7qOQZlfUJHzLKVLVd0BwZV
         QyLv9F6MZrI1qSFimyx1zw+qt+58iou64KnsBZMgSRy/KeaI5El+xKSAsCRBCVo8qKYh
         Cg3P9WI3ah/kfKlTFydoS4/ZOXtPfrklFifE2gy9czqQzaS4k3dt4HkQJCLMwnqeIoIt
         ikkx/stc7CXVOYepmH0rn3+83QEUFkfPKOcCpHhY1Wt5e2FZrr3koO4BiYaPk37EeMOQ
         W7kA==
X-Forwarded-Encrypted: i=1; AJvYcCW6AJ762Ln8zrQsDRNxSPaN5lT9R0oRlTGH56jO2TEsfhiFU0MEGFlhGqaEqZ6B/vW01Sc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt1NdGcIaoQZ53e9NKwOWtdewg14pLpAxyxOjjAyk/Ej3CatIW
	ScVJy9XyOkkWRhacBMqtw5v10MLmZJOuRKAv7Pl44FZz5jL91OxnAR0XbzLhYftlsDx1mYNx4M8
	lhwL+xmJ9BeWdq/q4AJwEDLctywHw0U52OIaAUmY2fzcpkNFOvHU=
X-Gm-Gg: ASbGncs2/GNODhNhJJy1isSVnsr27ZEEF/LbKbE/aUifhso7aLotDaPCi4o1RxGBXIO
	o/VgDH9QIzXMrL3G3KVaZmw9nZicV9mry2qvsDJCqQ6zILjhjYBqVKu5g4W9vB28UygeXQVflnX
	WQsBdFTaN8K50qTJEy9iqM4AUwApKvFio6dVkA31VTlej8EnLBGAyMNh4c//r+SxMsPo/sPzmSM
	X8+wx6+5IogP76iohzgg/20hDyXkJs39xbYz5abIwXh9x+Ey/+v/kNnspkIlgUuYRWCymg1pwu5
	Q4U0qr+bAqBpJ9oEhs8kvhxXooC7ezt9iV64Yo2BRKDvFFFkB7W+6Z89aM580N/eSZSVwARX4mT
	w8UVW
X-Received: by 2002:a17:902:d4d1:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22dbf6218b7mr48496605ad.40.1745600168459;
        Fri, 25 Apr 2025 09:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvNlnEPnYxMjrWt5k9hsuYhZYiXLEAh9EPbD1EAbWDevHLteIuL9RYWdrJGfS2IaYCzi4izQ==
X-Received: by 2002:a17:902:d4d1:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22dbf6218b7mr48495765ad.40.1745600167474;
        Fri, 25 Apr 2025 09:56:07 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm34776685ad.104.2025.04.25.09.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:56:07 -0700 (PDT)
Message-ID: <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 09:56:05 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        quic_bqiang@quicinc.com
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMCBTYWx0ZWRfX5X/EOt9Z+pCU 5JTQMWdoP6nqq0jgHduV8PmhA23V39ENfTNATQtcRdnMr4YItTnZ9RgEUWSaD/AASWvzNKbnqu/ pt0/oh4fjJfhDo3blGOkjYyLf0TeINzTd8e+ig+dqk24b9r2pu6Lzrc8SCCFpv84NJJRn4MhRV2
 04jPRurAF/s47PBgA/GQvjQUo6wtLlFRl5A4zcpDsyyLLde2wZrr5WaXDe7jg1A9ICQf70VJN6e ONu2OqAPfMUiPPBCJQuvlgO4NJOizmuz5flTnGBwZliMoh0zlxUAWLXFLo17FNd8Cvi6fAB+YHz +cMXiJRC3oaF2t9KPoAyAD34R5d2uGw50cKTop1yTXFDWVT9qGVr6MlBRbMYax0ybBBKJ9ItKDn
 YT9PmcrooVLnE/2HY4Ajp7BC+1Ficgk3almbynBIsh65XcWx+4l4fOiHk97yTjO4Bwyel61S
X-Proofpoint-GUID: ydA33WH6kCRKCiNa5rqYw0A-3sdREBHi
X-Proofpoint-ORIG-GUID: ydA33WH6kCRKCiNa5rqYw0A-3sdREBHi
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bbea9 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=TSKuTjsm8c1mV-x-eAYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250120

On 4/24/2025 10:37 PM, Manivannan Sadhasivam wrote:
> I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> reserved region for the iova_start:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331

This predates my role as maintainer.
I was an internal reviewer, but in internal review (as well as the public v1)
the code was using dedicated 'qcom' DT entries and did not have an offset.

So I looked at the entire patch history:
https://lore.kernel.org/linux-wireless/?q=s%3A%22ath11k%3A+Use+reserved+host+DDR+addresses+from+DT+for+PCI+devices%22

The offset was added in v2.

There is nothing that describes why the offset was added, and nobody
questioned it.


> 
> So this means the firmware will only map the memory from reserved + 0x1000000
> for MHI data structures. But even with current implementation, the MHI stack
> doesn't know anything about the offset, because it just relies on
> dma_alloc_coherent() API which will only honor the reserved region pointed by
> 'memory' property in the node (without the offset).
> 
> So I'm not sure how the firmware makes sure that the data structures lives
> within the offset region. This is more of a question to ath11k folks.
> 
> But your series is not going to make it any worse. Sorry about the confusion.
> 
> - Mani
> 

