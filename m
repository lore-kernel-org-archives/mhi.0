Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557903368A8
	for <mhi@lists.linux.dev>; Mon, 16 Mar 2026 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773634013; cv=none; b=hf1uouWGeM6ikO2Vda+EGFK8ZWyjhsETyyKKhEmv69BjA8yy29xmnMOsJImc4NNWcbSCyy11dioPMTwQEAlfx3r08rYeqr7ZWPxYviyO3MV7UgYoly36F9MZKy4H+isuQnSNyLcyr5UuM/XL15Z1f8tCA1lybWzXSvxKHoaVoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773634013; c=relaxed/simple;
	bh=JaLgnger58+q+UIWkhi1HwRgoOKLN5fnyd11JV87dsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kntjZ4ZSAPmgL3yz4V2+XqNFLO9XigJYw3SkiRLjSOYDiqKD4JTCgnYEoOy4gBcIXATt09/fYFHMOT0L6vql5bO4MV3MRjpiHxMziJJGBWTlRA4oyHzCo4zEw6xRqIy8LeAGfS9CjZrld0OYfYjq6adLb7ZrdDIK55tj0xE89ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irvJfoL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgtvbTkc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irvJfoL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgtvbTkc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FMGo9Y3532114
	for <mhi@lists.linux.dev>; Mon, 16 Mar 2026 04:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ndkr0+Bc2XuTO21elnXe8eizYrsuKcsqBqzlOnvzrDI=; b=irvJfoL3+jiwweR1
	KxZ3VyTgLmfgKetpXxDVJyozeGUuXaqrG9e5sLeFtBCVvZDvNnfOLQxQpHWbW0ST
	YALzvy3VrGCIne911UGY3lylsV2fXNUWoOr6tZNA0Dsf1Y0ksPCe1rqSj93moPQ2
	Sq6Cl/R+AfjqApnA/xzG3CpAXeCKk1dTuBakNwUWJlTrcLHSZmogk2XXmS6rOTgU
	kZfJEf/5fT/hiDli9yBC1gkFwAyMD8Gv1q8MpMZ10KVYc91iTvOi6nl+bPm21eg/
	d1NXWXLIrSbwrz43bUtQFknxzEHzQ3RNHugrcBVIYWASrnrz6h8PX0/bSd+vD33L
	U+KZPA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qm5pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 16 Mar 2026 04:06:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8299499d587so1980494b3a.0
        for <mhi@lists.linux.dev>; Sun, 15 Mar 2026 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773634010; x=1774238810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndkr0+Bc2XuTO21elnXe8eizYrsuKcsqBqzlOnvzrDI=;
        b=hgtvbTkcz0ELzW+uUFvV2obwtraag/uN1RTKU8DdEiZ92skPoehSp/phtNnDUUBv9p
         WPNPD/eGBNiLoVw7O0bUVfU1GiARfOSmAy/HyMaLJEWRLVFGuA/cfkZ0Q1UYnJJgnxDq
         s110pWD5u+gbnPfcYJBMMlW1CtqMdU4yOdCR/bGjKyknh7jSGNWcoFaoKZ2OnZQU0JvD
         HCnmijSgUrIDTmoAZgW+OKTl8vC9V2mr614jH+CK02AlEuQ5/aTXspaBGXLxroWvGeHz
         SF+VfE782pzZRH8eMpnie17UFYAxYtIPunve5fZmgYDKgI1skRGDCKiSMVFULkfr7U9+
         flnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773634010; x=1774238810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ndkr0+Bc2XuTO21elnXe8eizYrsuKcsqBqzlOnvzrDI=;
        b=QkbQFR9yKAnigbPQZ+zLxknibKjgcUh+2EiaslDbawpTj1DtwUovVH5H/O0llLZZYt
         aXqA8UoP1POB0G7tmDEQ6nSxY+FN+Y69zE/NpikO9DAraBknG9pOy+eOl9qgLlAn144Q
         NSDqnHgbv0ambG7UmIDqx6VxdSbN/UMMP/muYAorpQCmeF2UTFPVj3HVC5JOvr+ktD4J
         2PFKc28y3gx1a9C+BvJIquXSwxG/JZ/3eeUymrKV6q9LkA/QDJs/FO7rdx43ePSm5Kxu
         xOUQ4CZ2JMaqs8BBRXMoJ7AiXZ6XV8ZhLrUJJzATLz++1H38SzDna5Ff1urRgT31qmkK
         03WQ==
X-Gm-Message-State: AOJu0YzRVHd++PgKR0H5mO04962/vb7QsL/pOJMknX3rgMBiZvpUsky1
	Pw7UTn3WFzqF1hFjM364IBQO6pTqt1iSqVtM6j4oWvBd2B5zyAhLHYK2H+ubA6FqX9q7lXCq+oT
	C/R578aMl9JgqLf2cCNU8J2B6j5m1SL0NNzoFYyn+mK5J+XU7s7rvGmk=
X-Gm-Gg: ATEYQzw20jJ76khVusEOi6cydlII8+CdPuL+0minK3jDYp8LAcZ5m0zEibDH3ExqIys
	qoONDRn84k1msTUsO85+c2rrCpA0wJupsSIpktUWw4gM3EIS6exZPzmypbSkLc2wTRp4siCvuKA
	HGeygtgm4NlJUaTxZdbp1TJVoM39neIZ+MwG+CeZDpNnASigPCTw6ieQpVuR6V2a2KSyKVUciNm
	toy0+hB9u0wzsS3AbJKFcWnEJ3v9NbmCJmTWpTJJVNb9j6KPDx9+qw3YTNS7NgxOSOAgvfKjgdF
	pkPmhvBC5tSSqEWxOznQZMo9sK2r5rgiV9jolyO8xUl4wEXau2Mt9rTPtiEBetn65upifcHo6xN
	4WferqQFuHM5rC5a/F4rnLLPx3vCyHJAPxk3gfTTLiVoOrEFU9g==
X-Received: by 2002:a05:6a00:c84:b0:7ff:ecbb:1c28 with SMTP id d2e1a72fcca58-82a197298dfmr9631229b3a.16.1773634010169;
        Sun, 15 Mar 2026 21:06:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:c84:b0:7ff:ecbb:1c28 with SMTP id d2e1a72fcca58-82a197298dfmr9631201b3a.16.1773634009597;
        Sun, 15 Mar 2026 21:06:49 -0700 (PDT)
Received: from [10.92.199.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725bfd0sm14339943b3a.14.2026.03.15.21.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 21:06:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mhi@lists.linux.dev, Rosen Penev <rosenp@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
In-Reply-To: <20260312045921.7663-1-rosenp@gmail.com>
References: <20260312045921.7663-1-rosenp@gmail.com>
Subject: Re: [PATCH] bus: mhi: use kzalloc_flex
Message-Id: <177363400652.6449.17696320046026788438.b4-ty@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 09:36:46 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 5PGTd43YxmEuDQMTbnMq5cWyyjAIINsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyOSBTYWx0ZWRfX8QBj47j6OLEw
 Mlz2K1VmMqlAD0/0coNE1FX9zXmqxQEJYlh8N5E6kaINpl+SpTNwtsiJz/5Z4KHKat0ENTqtRq3
 rp5M/UHrZfQ8azJkE5Po9yJAW3uNvwCLx92eslvvdln8Ut3mMSCc26JAiBlqV3wACCYm8pABIXJ
 bw34VIN1dOEyH64Wg76hOT+nqqmfiiUw2+m4llodY0IknaBknenpyAyY+l++YejWPD9SbLjFJ7D
 8Cr7iMDe8R80/DPbbYLnNwo/kzGg2ax5YKmrQyDP/ZaSnLRiDwhPXJvA8VDxd9lCkEt4AlRjByi
 S/yYteiJqFc32IAdxjEglJ4owyEvKCUlG1B3cyUKk+cu/2JlzODzm04PE5VR/gyBM/oYM9o8yW3
 G1/Kv0WYBMuU+2qyJPiWNDacU3YLqat6foxtABNMJG806rk2j5JUFQunwMl8oIRu5h6hDzFdpyg
 Of6fBcNDfggju4TxCZg==
X-Proofpoint-ORIG-GUID: 5PGTd43YxmEuDQMTbnMq5cWyyjAIINsn
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b781db cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K8mwyqB7UndrMnxzXikA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160029


On Wed, 11 Mar 2026 21:59:21 -0700, Rosen Penev wrote:
> Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> 
> Add __counted_by for extra runtime analysis when requested.
> 
> Move counting assignment immediately after allocation as required by
> __counted_by.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: use kzalloc_flex
      commit: 2f5ae4827e94955ad3a9757e06da90a5ebc4cc6b

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

