Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256C334680
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543124; cv=none; b=XosnGCQALgi/Ed/dLnHiNeJemNIIRyVbJ7OdjySAJ3XdJrAvUOdglvomqmtloW4xXGmndiigCaf2vVOlikhY8Es7AZcvzBeNUtcbgbChlUjwl5Q7qvYhWo8HR5EAhE9SDkfJzBnjEUDaZGp0DbDRrNES8r2b20AE2hsEMzP5kUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543124; c=relaxed/simple;
	bh=ezXtnxmmy4nKLRLUirnPsKAzx/wRLwitVXJfmH83Lpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epejNNPjpVPoeOYt8+L+DM+1riOpPJOi1nD2haN3B9ru0ahALmzdPCylHlNt3gQggeK7QgTKwZzjMGeaXxpx0TbEFVK39cCgRbSb0FpVvpf3dGIYAvVKpEqIUTHeLIraXBWRPDEbyzr/ISvcvyJRpam2dm6ERsYFMFf2v5mCk5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9bwyRrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfS7aCN5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9bwyRrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfS7aCN5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1M9ai2755484
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oBAgJBWC5PELt9dF08F2H0pq
	iR9jG9unSRTCNbWqiMQ=; b=A9bwyRrIZe3RrEjd8qyp+x1YZQWMnIYRRv8haD/p
	laQQTqRN7yWDRWLLpw05m5f0N3B6is1xlVs7ivtt/sdpXDHNE9G/eHH4OSwiZ3BL
	ID8Xz/hMfJjSjbxBJwMZS+8tagDEgp/AhrIpz9y+93eSGqGIGuSGiUhwt0/78c6e
	Udor9GbxW9j6l8D9pY2JymUNyHLVVDll1JLL59tcHTaVnkBEZu+h7EYMd+zYzCz3
	I6cHXf4e/VFTLEYDRc3YSST8JpCC84Wlvs0VsB3brC4+HhEEBjVjsfqgPjtYdPJx
	/x/NXKgPAvgt3jaRNjQmdGurXxSmQ7HJJ0zCuLzFlmbUfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj3xpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:05:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-89ee646359cso2068693485a.1
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 01:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763543122; x=1764147922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBAgJBWC5PELt9dF08F2H0pqiR9jG9unSRTCNbWqiMQ=;
        b=KfS7aCN5qXYAC1lMn4O/Ko1cPmvCqrRjWOxddHtiV/cYJu/zAZOqFKg3xZqPkLlkL8
         AmOqNdAqU6uvnAReK1IT3jDLfUZ76zmkpDvpW5RG4SwYi+kbG+WFTjYWlu4usqFtpE+u
         e2r7tp1Gliuj0LI/FLhyPTIbrQOCjjd4Y9jUr0PngLz5Z4vPy/xD6RUmKL//oUI/VUmd
         mEOr1kc9YhMHTjv7m0TnJrxPkyfmNdbLAAULMFNc5bdMfYjqqJJuRS4r34K1p5M4HFVf
         4m4adiQnGaSjHIwlLBoBdnXObc+HRvEqaqGsnhFkEha3LrQpk5wgBA0Tcu/M2UwkHNZO
         QlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543122; x=1764147922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBAgJBWC5PELt9dF08F2H0pqiR9jG9unSRTCNbWqiMQ=;
        b=HhauaJJ5uQu0GE6MOHZu+0NVEK+4rDhLw1ov69VDiRD2KVjjL4zPpZ8jaQ8w4Z84Lj
         lx+Xw2khUPuzTw7snQqQ3h0jqLeDev29gQmtSLaHcWLNDEfcwx1LdH3+ADUhpTSz8tT9
         C7YQHBskQoSFyTLKaV8AH9jPChR6heqf2/8VlRCRQFOcEprLAhYAgdq+i/fKcDLNXTsj
         /E9GOL/M3kRsnUTs9Az3XFAGhd3kjim9xW9OsdN1Coah31J8MmniiNGINxuzSpnpRGj/
         Nng2TzH+MGeVPZzjw1doi6P7+2yIiJEx4SepZc+FD8/eossMoPH8LoMmmB6Mc9uMJkOx
         93rA==
X-Forwarded-Encrypted: i=1; AJvYcCUNwxltdLbdH33ermP7O/IE5h1Sd2UKrqJf4BDdiP/PvyJKPFoFzdWTc6GrMD9miT/s6Qk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5fsMO/91YH1XqeL1UYghNWJMYEMo82CtNCYC6Gd8u88DfljY3
	JD8rCrO5IICLw8JtQ8YarCTXUODFCxUXDLVh9HlXxlYGFxrTNTA/bJIy3ULK9XwBsa9w7bMySy3
	DeQI04QtWkvJwqYMl2sHKXP+qCXknZBvYmfO7ta0cX+4PPPheHJUQPMo=
X-Gm-Gg: ASbGncsLcHWaskOL9xwKNEPTtv3HFw4Wbb87uBdL+1QwwTorrBsuT0OtHgPtQLjjZJ5
	+nlqY4oJH6vx+pKbHMzNdZtvWe28p1VavxghyG23IKVXVMhhf7w6/c5adqPMPsePoLGmj/keL0S
	bUR4Ml7nN/zRP5WqIU41xg5SdXOEY62nAa+JVIUFCX4tMWarM2EDDni9k7/yTgWc/KGz/Otoqh9
	G2DpyYnB71VsX69efQMsVy88hD0DbOYQP6cmnWz4C/LYzSvgQ78PnON1j5MyQradUaSlMaPRWlZ
	Mirc7FKlieBJwNWmVj00ibgjHuRuTatgiGaW0+N6ePHcs01LK53mLD1gFSYOxM3CBXviK4XPUrw
	v3mHyZHSsHfxBvehfmt43IFeboK4owjVlrRsDeMJtPXsIxrCPn+MqLXylRty8ycJIz3+Bjw1k1Q
	ZUmWm1NOw3/koEx56m08HVHAw=
X-Received: by 2002:a05:620a:5ec6:b0:8b2:d26f:14a8 with SMTP id af79cd13be357-8b2d26f15fcmr1482718385a.9.1763543121649;
        Wed, 19 Nov 2025 01:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl0tVP0nruUET6azg14pcDZMW+9RwVCKQSB0MA+hirvaAaTc5VWCKGXZJPH/eYVd8nYtboXQ==
X-Received: by 2002:a05:620a:5ec6:b0:8b2:d26f:14a8 with SMTP id af79cd13be357-8b2d26f15fcmr1482715585a.9.1763543121100;
        Wed, 19 Nov 2025 01:05:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce25408sm39192991fa.20.2025.11.19.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:05:20 -0800 (PST)
Date: Wed, 19 Nov 2025 11:05:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760
 modem
Message-ID: <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
References: <20251119084537.34303-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119084537.34303-1-slark_xiao@163.com>
X-Proofpoint-GUID: IyEZIsLla8EiMdA6ObIfHrjA00obJwTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MCBTYWx0ZWRfXxlKYUTEwbtXn
 rTYcbCt2+NcOlJ10CZqz+dCNoSjlOfxwVC3NWhxXiU4hzEbX7kfTwCMPRvmnkNMka+t5soDKfuh
 DEFVKB4ceBZy5/hjgmXneVcKrLxOVIpbw/9RLbY9tHmaX30uirp99eL4rtzZm+z07j25wgjcQ4K
 LlZf1lE7rAFrjqatGLBVWtF7UTrnFLga9yAFx5w+gob0X9NhxRtaOF3/3VOVFjiChynBvuxl7ma
 VGEx6LkkM+k3a2yF4rfZL3yGxCtckWmJJflgIWqNazCQkgimqKR8TS03QxqCMTapkeGz4htKtwF
 oYEQkdZX6Q4L//7tKk8chaKd/FXPYvWany41VyI0aPI/UECimGp/rL5UzNh+otXJg8d+ZO50oyT
 LBDwSTwv+DWYC5fcMihRpwO405QqZQ==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691d8852 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Byx-y9mGAAAA:8 a=Zbds-apdPVEvrNjdMCwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IyEZIsLla8EiMdA6ObIfHrjA00obJwTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190070

On Wed, Nov 19, 2025 at 04:45:37PM +0800, Slark Xiao wrote:
> T99W760 modem is based on Qualcomm SDX35 chipset.
> It use the same channel settings with Foxconn SDX61.
> edl file has been committed to linux-firmware.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v2: Add net and MHI maintainer together
> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Note: only 1/2 made it to linux-arm-msm. Is it intentional or was there
any kind of an error while sending the patches?

-- 
With best wishes
Dmitry
