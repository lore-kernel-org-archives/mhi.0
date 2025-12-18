Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99F312825
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085008; cv=none; b=Ntl9DDi2qCbt8Y3bhVYff29Gp95G8tGL1z8y7IHolumJ9PNiMnnP9MNUqPfL0EWkk16EpyVS3sMILhpwt4hibKMiBo+L9vxd0NrvdamnxPkhNZ/PpPXotiQAYPUsdpk8exu7a64OG8M9/MN3Bjm71yVkfO5S7FV0I/RVxsxOh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085008; c=relaxed/simple;
	bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxGDaHvBBzQZjxLfgnpefj7AdoqmZwPtfsxMxY8+/q+k7gM9NvCiDXCqsfDanNCVGrErE16tKe0SwtMIFWM8QhDSTExHlHK371EmsApryV8KZn8XzYhxfs+L4Vlnp0MMiBkT2kic4UFKNse409YqDelx82yGHT6vu2sIRU7wPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIC5h6JW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAdrkq1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIC5h6JW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAdrkq1+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIGlVGo167740
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 19:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=; b=DIC5h6JWngJRQiGO
	4a3tmpai3afMojQofFnHVDy3lNKG6BpZGEUzjmcp/bpe8UaN35zK+SPt5D/GO06E
	4ABE1JP940T2DYzfqgEtNUcI7hnyXEpArjvRgANwTV489DM4qv7YGPvynME79vj3
	Cxc/e2h3UtZMqPbr+1sFIU69sYcVBo8zLjhTk2qml3gR4yvc0HIFxWQIbP4B/KOO
	AShzwNTyQQPr5ZiODW8O72sR913m4eszaGMLaEU6o6sNSEVoc2FA9WphrjVFKDZF
	aTFjkkVZOicAJHjBiiBeHgIpLFpkY8EjO5SJv9lanMvDo6gV2dLohtyqR+cwNXcr
	eT4GgA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45w53gf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 19:10:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8888447ffebso24558916d6.1
        for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766085005; x=1766689805; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
        b=RAdrkq1+gqMq2+fi9yCNSKHB7a3iRlfa1D6xvCH8w7OiBMw35gsgEoAAc+mbVxoiOE
         Lfkb50Tm1MVsoyczvnQxQOMmMe4kHLuJPPkVDmhx9G/ARBgobMKgsxayNz68HLMxUoql
         sq8Oyuu98Z6nYSyx84m5/ajYKogrkIi5klepGXaGzmynFZQCkI3n3G0S6EdxPJNiAmOX
         2aQP88OsqklYLW+pYcSwBxeabGNKOxuWTu8ePnVhQ6+A2mMonB2wIbzM1mI5Rkzj8dNR
         Sz/84qdap2Y0ZYhrxWVSLynp67coJBJQBc+rXGWeOQQNi4342ZLb/CtTBsMObUghXWv2
         gRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085005; x=1766689805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
        b=faYk88K/7DCFnJJUYC4ob4hrCd4MdLXyG4ScZ+Fa6WG+x6aMf//ZwfiPmGtQmDEe98
         i6yUsXgVcba5GdM8VDjWXeHx9Z8l0lkKyHxe/GnmE+kjINJDcjAnQ2RMmih4Xr0LpC/i
         GZVS19xWmOdM/zT6bAeJc5AwVoR6xUTjpwfhIVO7HfQEKEc1wzxfZat1TFG3gFOsO4uy
         ljR4a3EDnAnDXm25Bx6AI3YHzJ6eut0IdFOtSE2ngoWZacVuT+woG7cqk2RxIXUs01Gj
         jn8pooW3wn0u5bFokCnuIu7FQKkvDTMfdtqk3+38XF6+cUxC0wZtseqBPSzuF8KEXO+R
         qBCw==
X-Forwarded-Encrypted: i=1; AJvYcCVE4EUGV4nla9MAI5MeisrST4jmUCl5bv5vf2yNOM/Ng7JqQmip4LBdIqm2gcsJWgTSASo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRmlcR+90ABt4mViQvNGsmoadXdZ7O07ztbuffWA1CiGIzqSfo
	Y6UCQ5HwNZgNKw7Q15Ik1BWhDB8J9xwgGrt4AU5s3WHSc0djkgp4f+3B+1+tOFQNALW+L3KuHTR
	TGVbV7YvBLON+UJIERJxlA2tz1juagy+K59GiMvhw+EF/380IUJnUyzctjJJijxhQDYob/ugGbn
	N5zZnZcVIq/B/BwwTR5xM2da+1kpUgAQ==
X-Gm-Gg: AY/fxX6erZaGCT4uu5imEI6mstjIILvS9GcAoaHnL0mEBtRul8S/1dcybjNzgCpGlKv
	x28h65adU0XpBakSVP//nwKBzN78QcSxEGI5rEyM+Qn/TFGGWhSz/NthzUjCQXtMAOIWVSS13Au
	4kMAUzHpNBLsW3bPHjPOo6H3DAZUcJj8UBxhWsZJ0HqHQ4g8m43aUK1wMokTcyPW635tAiSTeMj
	qgOlUDOXeqSd9N+Plt1y+jy4b4=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id 6a1803df08f44-88d8859d814mr11385596d6.66.1766085004807;
        Thu, 18 Dec 2025 11:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElTYAdoPhfH6LxXjgHHJuq9GB+MaXPuKPdY6tm4KOAmStZEaNhs0H2TbaWVu8vQa2PTPIgBrIHJI1918I+nRU=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id
 6a1803df08f44-88d8859d814mr11385106d6.66.1766085004406; Thu, 18 Dec 2025
 11:10:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com> <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 20:09:53 +0100
X-Gm-Features: AQt7F2r9lOf3zDCFBlKxs8sdhKMbeErBZkq0-ox7XPW2t1SLGzCNcjhrK8xkLWc
Message-ID: <CAFEp6-3mHFYFPS=iakDyWUknDH8z4qOaHwFLuP=Qz1PvYSL_XA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: V4fNaO5jRCYmVLYdOZuaMyxCDbTOr5zs
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=6944518d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V4fNaO5jRCYmVLYdOZuaMyxCDbTOr5zs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1OCBTYWx0ZWRfX5kH0iRIWyBDH
 RPFJ7cLMOgtcB/okcyhdmIPY1sCMp3Aeq7x0KQv+FVEEAKny1/KqVZWYwWFXDBxtkgjGbgAtTyc
 yq3QAuwHygw6I9FzN1pU1RM5i1vDWPCQ5pKVGBvgqoDOBJY+buaRVNlCr8pbyN4+q11HFlJ/fJv
 3x14Gbr9hs5f9/GSlUvuqgbPhNEQKi7RIFB27d+ivs+m2lnDM6535IvcFwScWVJJgumf+wEWy9z
 3MRUYkNgtxShW909o924BL9ExQCXZ+pVGxpPFlI91wHKpKckcNvos8ukf6+k4SVpROn8Axv9qWK
 fiHYLXNFUkGSlQYUD28RG0ZTqhnpWp2X3aqup0orWeaBUMTFFRJRmPnbja0Mt12jwFrkfVNRUZ9
 EnF0oDVfBzlS2X/HZ/B0aDThgDPogA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180158

On Thu, Dec 18, 2025 at 5:51=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the clien=
t
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callbac=
k'
> for the DL channel may get called before the client driver is fully probe=
d.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
>
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code pat=
h
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() i=
s
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
>
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manuall=
y.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. Th=
is
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
>
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
>
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffer=
s for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation=
")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldcons=
ulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/.=
..
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
