Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDBE2749D6
	for <mhi@lists.linux.dev>; Tue, 30 Dec 2025 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088255; cv=none; b=BOEwqK7JVakarxlIU4q3k8Q04U5R3O7Iy3WeGp7aAuruneWFBQb6YVUIa7CJSjI+EXjqeo6AliV+iQdqLLavaj13thmyD/FB4Jd7xskb8iJAc/Mpve907aVxmssO6k7e+g1z6jhDjZgL5lgEES+YtMfxfKSUH3lnaic4LjZgN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088255; c=relaxed/simple;
	bh=AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVM/4LAsbpG3h+l/gJtgMX5SwQOZgIKS6xw+1cvgtwJ3OhOX2vYCOCFDPEO0d/p+ee/SHaj8uB1xy3iisZNF7H3guA69BusgqfvNFXaOndsPljHYgY9cgiJZM2Mllh1CmcWqZT4DlFyUDtNScLCi1cHG8WThjn6vPIXktL1omCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+s0fcxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQf+XeNC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+s0fcxV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQf+XeNC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3jbZ43555789
	for <mhi@lists.linux.dev>; Tue, 30 Dec 2025 09:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=; b=A+s0fcxV9wQMugJH
	V4Jdckn5hb+r9TB30GQcfdIAtMp0IiiTUJvUzm0LtqDD1rX+sxlAH3Mi50kk9gjz
	ss3GgtbZQ/SxoJjif3QBqs2KdkSdD/n+Dl6mumk3X7M4Z5frVIZu974+KYdVGgtC
	aqALJPdOLKEEqtQSV9z91WeyXDEmL85TH4vKV6sRHW3LpSdCW/JEKEvT4AWCAwpw
	vbz/KFRAsc7zICuEbrORxl/q+6rKbl3aU+COYhsbjwyyhRK7oHIDkmT49okZ9qoW
	x2d6uOS357XH3omeF1mgEwS11SZC67WTrjeDxrSkPR4T1xNTv1R3Bo6/dHFRe7jU
	DXlfBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7460s1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 30 Dec 2025 09:50:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso226159381cf.1
        for <mhi@lists.linux.dev>; Tue, 30 Dec 2025 01:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767088251; x=1767693051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=;
        b=UQf+XeNCf5ku5nSUfc2xTz9i5W5KTUBAscmx6PGKZch/VzB3wEfowMi1bSzm28lcvY
         bSDk2NAQb0F3qENJqUw13fxrGh/l+efJN0gF8Th1Ckozdt7ehyufq2PPsXhDSLb64CSd
         78FO/3CVtMRbyyb7TzQNJbPSDwJnxpj1umBFfWZJ7qjYx9QQzu36RrRZy5U0oXfsUvhZ
         Sy8c0mImnJqOfHn8vXSZzg6CqDnOjBMoKU/6cHGfpVBrHQO4aRtAAaCPlPLTSONkykrA
         hPjdSMObDFU/zN2dg8ljNwOYdp9xYRV2vywSRz1yXX1GjCbJcS+ceEKnq7umuvGR8PYH
         jhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767088251; x=1767693051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=;
        b=rMybOdBqMMRacu8gBC900zD4vfhYifmg9C+hJaausT0XylHjOEdhnM+g8nfT7F52r8
         vHHFKorckWnOHY1ZzSCn8u7TvV0VgY5roW5YkI2NOelab5NISrxj8hzG+E/YXNWd5J79
         KtoaCnUpcuUM0rJ5JHWn/gXDi3TcrRjMYqIP+pRfe5kleA7/Tmm6hIY0xlr3tyoxtjwF
         BPq/VtQ4o+T9dV9DiWGpcQcnraos2WIIUlabbxiZfKL1fcQovH8VgjoO41IyAsyOV3sO
         PuhvLycpucrGLustf/28wOWDFGFtcNeoZeaAkdfx2fxsU+8LjWonVpyQZ54jYPiQkOKX
         ePPg==
X-Forwarded-Encrypted: i=1; AJvYcCWx0U2rs5C91mf7BUFjsQWWvBnEILxecfdYpzGsKDPuEzpOksUN+VcSZnChBKwwp7KZBbQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKcgkTW1Xy3t2Cb1twGv5Y7AHp9z6dIB1ZjxTosOgP5N1TQH9o
	/XDD0NPxUxnMJUe7k0JYN+SJFeoJ6H4bJz4JMRZ9i6JnTXniGrNTP+egciNppAjOiHhuHUmmq8T
	RU8caXDZwEi5Lm+basSb3lpRPg/CWjIslB8MiiOmQo3vwTI06dnN7hRmRdnSSi3nFlf3Je7JIYg
	Jn82Ts9K89pXkh4HLiUDzgnygMYPrndg==
X-Gm-Gg: AY/fxX6naDgfBh1MwWgkP+7G5RpQnvBTKG2cAafsFRtL5UJZeC8iuSxfpw80Zxzj4+p
	+c/3zTC1FpLrKNA2d5yRjmxA+wxBadlPZR7jgyxSABWtMzEvHWS5BqIAWBoN/S5Vh4iO1v4asRl
	u90hTOn9o6SjFvDg406iHRpuM62KpYNIQzHkX8/V5431C8yxOcmXoT+n1Cic7EW3t3TE6OrPLew
	tNojS6IKWoNX4352lo6VpNnKLs=
X-Received: by 2002:ac8:5d4a:0:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4f35f473c35mr604285041cf.36.1767088251209;
        Tue, 30 Dec 2025 01:50:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBZ8wGhLditZxalNu2tU6+Li0eUjoydVwABPejTw07ZO7ZImHvKWvoB21fJbJ3aHwmUgMYAoppRtYmiE6I5QA=
X-Received: by 2002:ac8:5d4a:0:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4f35f473c35mr604284681cf.36.1767088250633; Tue, 30 Dec 2025
 01:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
 <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com> <4c4751c0.9803.19b3079a159.Coremail.slark_xiao@163.com>
In-Reply-To: <4c4751c0.9803.19b3079a159.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 10:50:39 +0100
X-Gm-Features: AQt7F2p7sKuK-wJ52q7OokTd49nAsSxFeSzV0kjXlxjYiHpoVgcVY-YAufvZoHE
Message-ID: <CAFEp6-2NBa8tgzTH__F4MOg=03-LO7RjhobhaKHmapXXa9Xeyw@mail.gmail.com>
Subject: Re: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for
 Foxconn T99W760
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6953a07b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8
 a=EUspDBNiAAAA:8 a=UVxOvI1-KtSAPj58WwEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kzd2fyKL29X-qgVKLfxmNeGifm3u4o0T
X-Proofpoint-ORIG-GUID: kzd2fyKL29X-qgVKLfxmNeGifm3u4o0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4OCBTYWx0ZWRfXxJ8X8PPpaaHh
 J0Yw04dzEeDJu7ysf28Qjm9ygaPxxczrCCdpFPLamlHqrKZ9CeOeN05JrnqXhS/2nTl/COV2hY3
 KbKNXkUlqzzeqz6FVvfAw6suR5XgQuLPfpsd6MfaM+eVYXtsLJKKnlSZw4BtwB5zpMmdMmHQLX1
 jVZ7i6WZUqBYDfACQoj+2ojfPIBJRZ4rKqO9UD51raSQNStZ4x9y5gJRCKTj0ZTW9o7S/s8nrqb
 C+1dyGflnd8wu736NFkkIJHibfDZ+tFlLkJHmDvbUVFJme5cptVDBfH7ZSL+rycS0nqW741Zw6h
 RtyuRzgb5LSHwJJFD6pd6hlMTfilCpEANvVky7CJzcw5gd0rvVq8m9+B5gKFaUEzFTdUyGK6vqu
 fMQRAaRmSiueosNjrhs+KeyJOrL4Km/eckqO2wiMqCW63SqYbBE/ilt5veBMjHWa0S1cvtkQh9H
 Uc0ng97OnoxzK67nvvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300088

Hi Slark,

On Thu, Dec 18, 2025 at 9:01=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wro=
te:
>
>
> At 2025-11-21 20:46:54, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >On Wed, Nov 19, 2025 at 11:57=E2=80=AFAM Slark Xiao <slark_xiao@163.com>=
 wrote:
> >>
> >> T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> >> architechture with SDX72/SDX75 chip. So we need to assign initial
> >> link id for this device to make sure network available.
> >>
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >
> >Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >
> Hi Loic,
> May I know when this patch would be applied into net or linux-next?
> I saw the changes in MHI side has been applied.
> T99W760 device would have a network problem if missing this changes in ww=
an
> side. Please help do a checking.

You can see status here: https://patchwork.kernel.org/project/netdevbpf/lis=
t/

If the changes have not been picked together, please resend this one,
including tags.

Regards,
Loic
