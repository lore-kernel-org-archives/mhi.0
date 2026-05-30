Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF79E20ED
	for <mhi@lists.linux.dev>; Sat, 30 May 2026 00:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780099273; cv=none; b=rCpL604tFI2QThwOkdLFpCAmmeaGQJ9sT3ueAXxM8lH6Eo1b2l2Xt8WRuT+Hp+YFBjELI+NnEkX3aRfbu9YSv9LGVVUfGr/jM2FFEHQ8SyPwPEDiz4GEOJA78N/F7ovJx6EFNKVtcrRVKIgHTKKGpgQJEt0GJ0W8WPhqEj/GHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780099273; c=relaxed/simple;
	bh=UagpOC7gFmND7+vIy3Ut00Mk3Or7YtH3/4V9U4a1Erg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yapy+q3rWRSSZiUVHMvWghrxHg6ACNUCTk1xBHxZxB8CKATNK7CdHV0SH6DF4x2GbNcd2WD7CAoJ03YXMTQ0/kqFTklfYOoNal0F7vAfpqz2K1aUQWCNzMV10KziYfTm9D2H8ZEJ8EOHS2jBgsNc4XkqcunqlznSsP/pnnbXNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPjJSPV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/mP0Acd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPjJSPV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/mP0Acd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TJZr2v4123936
	for <mhi@lists.linux.dev>; Sat, 30 May 2026 00:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=; b=SPjJSPV+ZNlrAoQn
	ZHxh7mmtcvDOm1MYocHyO1ZEIhJMunDrcUhCqbHQLdAuI1BDF0Ql+/oIxZZmLhic
	FMywCJ1j1ahva4KoZ/rxXJd9C6M2ukZJnKaGcjwlFY+lmggD1+zjUQEK3OhXBnik
	Vgp86RjtLCvAfK3PMeDe9To2Pd3DVU4F8TpzWHeU1v6zbLRjefpWtPbnu7PZrNLc
	wMOA8NTRrBZ1eYh0tygVzbxKYMzbVKSKu++zKen9u+LT9KSbwllVS6868krliWEj
	GtjURwWxPyZUkGTvu1MFVmLMZSMfK1LE8CERJZbpk0eeMIlgTqk3HlXB9YAQJI7T
	8R/e3g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efh3n8udu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 30 May 2026 00:01:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f23c55b2so1121067eec.0
        for <mhi@lists.linux.dev>; Fri, 29 May 2026 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780099272; x=1780704072; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=I/mP0Acd0P2ijcW8FPvZgRxxXGTERfrqUEtvuDg5QTZLMOX9aT9xtpeI7z9sdN/KeK
         U2V2/Aj3kYSphnvJ7Me5hVHH5WXwnoXQ8kZsRb/x74Q+tmrO4EofnKlbSZkConnUVHLX
         q66eVU+7JVmthp2ql7v9thfIEDqUpLBOXx6Mdbk6pm01eO90TxgQD5mN1eHuYE+WGlpe
         4dv/DO2OSQF1esCNb89lgaxLTdO5kgZPNSElUseFWXMy/XrNPj/aOtoqhIszJfUVfj+M
         Qmg1LKqe5NODfaWuDEksj7Uuty58Q0U9YIrCfXd85RLWbsZxpTyRaY0Wwv+NTAejf1ry
         6YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780099272; x=1780704072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=DTDTGjdhfXEKWSydkDuT3582pMizFi3ItSVHusERiwNaWBkqs2Oe+sI1s5wkXVH1QF
         /u+dJ6T7HzuSyYUj3kchslfgO7PIQ6Qho8TAwHno4Lf1jG/bAZJ8DGHMGjsMNBlXP5M1
         cMhMaD0Gi8PYLpfsctBXnLVfLVtLWVSPix3UrfteYEGSq2eyh39cfTyCa/QQxEQYm0Qd
         svXudY3x3mLDzEsTdIhKWBy7kyx6FJyXsFQFR74gR1qd5Pf6zbTt1qs8lk0eY1+XTl+l
         X7hF1n8LA94Jvsvd7bSi1tKtb8iUOH/x7ctJY+AviKlJsIK7obgaJTaI1kwFWsb1c7k7
         vVhQ==
X-Gm-Message-State: AOJu0Yz2IlDc0/OpWPsGWRE8/ZbOkZzOqosInmBdrnTgr7Df82Bx8qvK
	lBNFO7eTfHqh4dh33eAY3MZ4sBHiegvX9Lw8il+xUzy3DPjTdLE4FVbZd1gvlcDJJZneTsC6vqw
	Tq66+4+xVHIXpK3CRRXnMcXKy3tJhjKvZiInjC/ub74kDG96FcHoOlS4=
X-Gm-Gg: Acq92OG4nw7VU+YKQRU3C5kI9octeOfaw9DT0pJ+4FFK/4iYD9gCe5jDE4rRNbAzrgJ
	sxpHuUl/xXHvHB9IHAkC8HQyEtPYq16ZbIE2icw+q4jDgNknFcdCA7BxRbEaTErbTbefJpgWlsP
	5z37q5mkYSKg0BoJk9H4XviRppVxhzQGKgECEWkwvV0loimnAdV30vXEYE+STV+c2qT/OExwaDo
	lFGwD3c1UCHtEDz/Lhkd7dAxj8av0P8VRZM7tyw6o+SX1APwEbb/6fB7/T54+POY+R/rTgU59T7
	iKWvRHidZrRF+G4cZI5S4JBLXCUGywJAvmHhkAN5pc+ACGQ+JKZ9EtXSOvJaUFjgbfaxy3Qxgd6
	C9fX2CYb/QBFB/vZqtydwbdNn4iKE6gdcruezhjjDv2S1vsmmSEevj3P5lEurvWL6ed81npZbfS
	T7vOx3N3NtA8dxtf0JLyTh8Xhf
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962699eec.30.1780099271377;
        Fri, 29 May 2026 17:01:11 -0700 (PDT)
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962652eec.30.1780099270745;
        Fri, 29 May 2026 17:01:10 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5d5385sm2693818eec.28.2026.05.29.17.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 17:01:09 -0700 (PDT)
Message-ID: <4bf20c0b-f153-44cc-ab83-cd0251dabaff@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:01:07 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] bus: mhi: Drop controller runtime PM callback
 indirection
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain
 <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RcCgzVtv c=1 sm=1 tr=0 ts=6a1a28c8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q7cftjHEbLmqyJcuSDAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDIzOSBTYWx0ZWRfX6myoOB0bvy/a
 d0CQwaA9omlQdJWV1ZL6i5D2hu4y/e83T+LafZ56qkxgtTsRdfB3ijccGrJg21zjCZUtL8/i0H8
 GbNli5xLsc22TSiA4PH+XztKi69HVQdTkdNwp8bqsucsOsWo+tcUZoqREtDPs7jarhU5A62wSVs
 JUJIzykTaEichf49R+VHOpI3YZn/+FqtepEQKNx/JUxixjtQB50z2MAPZpWOkVfDCVNRjj3WcIh
 pqQY1WctKtT0cK5CU8BeWmugl309iihShs0qedAxofhh1T6Pr7QjPlnuj7IVMuxifqOFjfk/NvS
 wbIn0GzkR3iV8xxy7EN9qNWP8iFn9Gi+Cz5o5vYkL5Co2pwjQr8ITupzkLk5Ad60JbamHh7Txkb
 g/u23DTbS8/3wI/RCnItN2X4x457/Nu31/odKGjBUQdeEdCiT5z92YNWg6/f2VgroN0XhjDNmQy
 R+2TYsXmid1eRNtNn+Q==
X-Proofpoint-ORIG-GUID: hWEvwZ4WaZWayuLjhum94emr6alIZdtC
X-Proofpoint-GUID: hWEvwZ4WaZWayuLjhum94emr6alIZdtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290239

On 5/22/2026 3:00 AM, Krishna Chaitanya Chundru wrote:
> The MHI controller interface exposes runtime_get and runtime_put callbacks
> to abstract runtime PM handling from the MHI core. This indirection is
> unnecessary since the MHI core can directly use the generic pm_runtime_*
> APIs, and the existing implementations are either no-ops or trivial
> wrappers around those same APIs.
> 
> Remove the runtime_get and runtime_put function pointers from struct
> mhi_controller and update all users in the MHI host stack to call the
> standard runtime PM helpers directly.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

>  drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
>  drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

