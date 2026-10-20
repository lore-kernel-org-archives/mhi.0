Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792496584;
	b=qIRg2fd2oV44FyqOzgvmUwgKnmxPMht3Drh4szZ3S0J7mW96ZieOPw4kHPCTLPJWjadD
	 Dwj5te6/9ePE980MYK4jB+vYJo65FdkanUkjmOnQDsPVgVNtzGog+CopY2Dzl9G6wT46n
	 3Rl5pEqWlWwueFB44QenUPT9bny+1wd34jxepmktNdDoIFBO/0W6L35Ull7VJpGaE3sXI
	 RV/YX/DxGlEnf7+fYxT5TsoF/SnZO7GvoX3yu5hanwrdQpt++ZxzXKVHZL4TikxIkEYsM
	 4AI9d3NS3vSKLNVZBkwVY3wlR5TkuvnQCRRhIPCZvi/GgMuhNIDySn3ObO7T3Tw5sYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496584;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
	b=rBtP2Jwtwqr5CJ8bpZUJ25QJnulmH5LICIVZ4iV3UcExTapWNOCAaoRrHAhbMuixclk8
	 fRgYazW/vmck/7gWodANzgO44FqkshvhrdcLqrK70IILisZcN7mi3DsmP005b1/50Dh0D
	 lEMXcX/M5MMmOqACoysK3LaqDOTX5Ezc85SkF4pmS1z/iLSoW+OLPlsE0x6BWqZiyDEkt
	 dyicn/hMgZvh80nJrVYTnweh5W3P8yut6TL6Gt3/4J0+o1UGrUsPGAIN2skldxKUAWkUv
	 hZ64B2FW+EjbOUBSYk2OP5wJ4tw803re2QMXBZWbCWtZslzgYVl9KF6KVwSWKdVZM2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9PKX0RI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e2l/rpc4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A17606A31B
	for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 11:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18A17606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9PKX0RI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2l/rpc4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwug01929078
	for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 11:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=; b=k9PKX0RIS1XqcBpu
	qa8Yj1xfUwMHMkwx6UGmrUKVIFrpZSBmCsgxlyls2gW4q3j2+fgLzQAV6R5OoAFr
	/1vddzq+CbUHecPgU85Zmz2XN0LC3O2x/n8wmK89eqIDqGCG7w38HUfLj3Gwjzjt
	5hqGTf7DDpK+eI8MwCRzId0GXyAZD7+HuA5hyMe6OJm0O1r3n2fsZ52/9cSBk+27
	27qdk5xYbXmkFrWHm7BlZYmezMLBPGB3AFyj6xZTmdjAKRbdEICJXyScr4h6HGFD
	XJFphIhQ29tiIreRYTyLqv4GYVaGBnbQdumMQfz9Za27zVZDZiR86g8AxZydws0v
	LbUePA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nt7em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 11:43:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso1063660085a.0
        for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 04:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792496582; cv=none;
        d=google.com; s=arc-20260327;
        b=Caos+3XzTjVotzYHKZZ9GeeBGuLPT8p0T2SxgR9cQO51zYuD9p3SPvypbyOauD6M6n
         XgXGYnyOiplblJkU0IZ2WhtA2uIvNWD5TCyYD/H3eMAYEaLO/WnTdaAusCatN4Ri+KnE
         1V/b/yJltrNoyZkfTFQBQtfHFJ3j6RMBI3UxXjgwX4E3Em0mFpEtkCiJRQhti1EE0alV
         KU0KusJq1Oslgi1otSNGdmdkzMYmlMTFgQdoOYM81wPRGrJ/qKSqF79pPvunIH161rR2
         h2erEdZDB1qlHQZzMzvl9A+d6GE+TfvAh7e7WvXnFB7ua0ox2Rhg/n3MXsSW0G145KLZ
         Y1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        fh=O8T9uINBJTPn8DpI0sRcEJ3bj6WTklnrqdUtqCjVNnc=;
        b=ok8yWdDWfw8iIrrwK61SSgvwQMy5EYfOM/dUt74c/JAnzccwS0pGgL+FteUtBnsFEB
         3+yaVIYjr9XgF18SxvXJQ81M5BFR49QHxDujVtd2gmG3Sz3rYXESiPjYI0JsWQZEmg2i
         7kYitIdFqpKMaspYbQ8h4/nO6sYUfhg/rGkOgpCZaDJ2UgQRaezB4oHVl9bL6lm6bNWY
         DF16LMbVMwZuTmX2UJCwCWfu9ZechHq2ihygSMtugI8TbNfAiT9RV4OPQUCsiJFP9FwZ
         8P8C1zffPVUpGPRp2qtW792DkJF+jaaiNG3T4XTle9pjMnXw8+z80KSA/Yd5LZSmFdZr
         tLxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792496582; x=1793101382; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        b=e2l/rpc4xRfxGkj1gtquUV3qqi4KqCSinLzkbsYul5O69Zi9WJK6G93TU4oXDppBoM
         7QzrIFqPS7Jcs/xpSmT6UkzHgkqd3C7uC4HND+z48lGRIopIasRY8lwl6cvljst4bcvr
         e05+2A9E9a2WDjfurQoUtx8NTjR/HglZ44PZ6Y8pNNkB9XNj6DnFioHCfE2gzoDiy/Fa
         3xq87G6+vvBllcvYktslXAWd/3rwDp/PMOTYcz33mD2RaqN2SMtKC4rpRPUZOscUCS5i
         oDofdOIr6gtnD1QJMotOi8wIoCzTJqDJEXjyHRn25RYvwCa0GX2vR62lDHATJM1XndX4
         MoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496582; x=1793101382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0z0X7rWSX7hGljFOOUTHJ3FuqKHQLBWO6RR8SAZGBQ=;
        b=oOEOQjQCiN2roMkjKlCPKohIXhw2oEm0+MHmBbh6RV5kj9sHqcFfl1dp7aUyvOdiqv
         hrW/SrXUm0w531EX10akaxPiNZzLrE1MmQzMMZw4y4Ogyx394W9I/rubCr4NHoSbJFu8
         qzdMpARJxQGRPAmS7jAK92HSDf5D11JIhSAqCCvklfltZmBRcBI0JEwMPC+E3bTJgsg4
         6ZYYidkU+CEk284wF9Sk98cWbVl70xhCKgEBNVT/0xM2CJS7Csa9ABwTYD1KLqgsa8gN
         XnBaljENKuR0wZM0wJEDVsXKcgpam6UvLp2N/AOohinAKevEk9U/NeCFenVAwI8/dIlQ
         mSkg==
X-Forwarded-Encrypted: i=1; AKwUvBx7dSquHgeKm1VAwQ07D8OsWZFUsUFWiz+PwQbxwF1JD5oBCaGL5fRoNBlFRXFIKGNXM44=@lists.linux.dev
X-Gm-Message-State: AFq9FYIWGspaVgE6mxt9ngbqy4E5ITkRAUKnDTHJySRg7F6gpPRrPhaY
	RJVDZT5gkBp4B0KTa6Mb8tNDgLeKJfH3fE2b8RRmAamPZDOdjW5B6VH47iAlsmYsbP48wY2hCRE
	o3sg+IZ3F2lqal6MnE5+H+aHqoQiPIx8vjQriuJWOiWXm1L/jSVB4JJui/bVIiFZeAB/uTW403S
	HGk8Kli5FhbAJlS/LY0Uc4PIi9a5eh7g==
X-Gm-Gg: AYBFou0zuaxttWAEp1VRJckLI10026zN5GkoJ31vIzBBDwcREieZIvC0+aU6k2rKukv
	ejgGH6Hy4+LZn1frq/RC76J0fFM+kngWNf53u2YE6jNeBNUIeKioJ7WB8WJj/Fo2Hz+y1v6R0me
	uUulA2W/QTaL+IgjFtRn99YC782sERjnGSXZG05u/CpFuGG8bqNwmNj1CPmCAtxKsK7w4Zv5xJV
	/Owg4hNKFOJ/q+zAeYQLAZGPUtikH6vTlda8r9q+zH+QwfhHVCy1CTGeBNIPSKueC/CZH24ndU=
X-Received: by 2002:a05:620a:294e:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-93f29d6f5fdmr1786550185a.47.1792496582348;
        Tue, 20 Oct 2026 04:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93f:24d4:ecf0 with SMTP id
 af79cd13be357-93f29d6f5fdmr1786547285a.47.1792496581916; Tue, 20 Oct 2026
 04:43:01 -0700 (PDT)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019055109.49922-1-slark_xiao@163.com> <CAFEp6-2XUE4AQPm5hinnRGyrrsHok2ftsFXragiHgDSKKtKWow@mail.gmail.com>
 <70714501.3175.1a157532149.Coremail.slark_xiao@163.com> <CAFEp6-3o6gCb61hCQTJydiH2aD6CBVRa947tpmLe4L9j85Jg5w@mail.gmail.com>
 <65d8a1b5.8e5b.1a158ddc4de.Coremail.slark_xiao@163.com>
In-Reply-To: <65d8a1b5.8e5b.1a158ddc4de.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:42:50 +0200
X-Gm-Features: AclHuK8BuO4jl__rRfhaUS7jXOaRUiW_m7JFZ3VPSObwRmR_MtAJEM7HTIQLf14
Message-ID: <CAFEp6-2LSJaKHwZdgdHUzJpPF0H+jGXpHgy3YEPzJR4oAFUTgQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfXyh+bLKdX2aei
 JLshtT1ZzszR4NZ5k/XbW+HQMWwdyoZzoWW9fFGDYPTnk3xam5YEo2ip8AsIH/EFH+p+mkDVg9a
 puBDKA3pFICXbRKKZfUHWbVOQjYk7Q0=
X-Proofpoint-GUID: QzUSu3-8c8FnA_Olg0fplttP8wJUMlNb
X-Proofpoint-ORIG-GUID: QzUSu3-8c8FnA_Olg0fplttP8wJUMlNb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX9SnFXKFDnEmf
 69G818nVoalEu4Bo4N5sOBpERchbGHU+IFZqVPy5shE6jUIt8VhSq5oiGujLageTfqqVeJ4CIog
 u4fYKhGfJDEgxkjbjTsD6fCFglP/nZckp++o/kG6xMU1RPZKwgsUgeJFma4hqPB/M2crTlT3Ol6
 6yXJriSxZvgH6GwEhPth3k2h2e/gb5De4CTVY0K01tsPR30aDWC5FlGIrMZM2mskqJMnav61IHH
 e/Y5lO3tEjQTUjugNsBeTINwJ/izp/OCaiD99nh1xUCxcy7zyZWPYfDXhudMaz8Iu13BrsWUGYw
 sUH1QL3JvDVjYw47/CbBKoKxrI8eWHr+qIHZGPdFfwlnsQJzMsgeCq0Yap0l3lxahLbxUK+ICm+
 f7Cr6BsWFnxRaz0eU/f++2GP68MUO78mIrFNd28WvCgSbE0QVjjaeoHjBLwSBki1c3bu/MdAR9x
 OuZXtBk8TaTV5bmGdSA==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad753c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=aMfntx_4cxk6xlV4G7oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046

On Tue, Oct 20, 2026 at 12:31=E2=80=AFPM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
>
>
> At 2026-10-20 15:27:43, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >Hi Slark,
> >
> >On Tue, Oct 20, 2026 at 5:20=E2=80=AFAM Slark Xiao <slark_xiao@163.com> =
wrote:
> >>
> >>
> >> At 2026-10-19 15:41:27, "Loic Poulain" <loic.poulain@oss.qualcomm.com>=
 wrote:
> >> >On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.co=
m> wrote:
> >> >>
> >> >> For some MHI devices in some specific scenario, the default value
> >> >> of autosuspend_delay_ms may not enough to handle last wake event.
> >> >> This may lead to some unexpected problems.
> >> >>
> >> >> Refer to the Qualcomm's Windows settings and we checked this with
> >> >> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.
> >> >
> >> >Qualcomm
> >> >
> >> >> Qualcomm also suggests us to update this for all MHI devices.
> >> >> Since this setting has affected some existed kernel versions, it's
> >> >> better to be applied to stable version.
> >> >
> >> >This looks more like a workaround than a proper fix. It would be
> >> >helpful to describe the underlying issue, including the timing and
> >> >sequence of events that make this necessary. In principle, either the
> >> >device can be suspended at that point or it cannot. Relying on a
> >> >delayed suspend feels fragile and may end up masking the real problem=
.
> >> >
> >> Hi Loic,
> >> Honestly, Qualcomm has been analyzing for over 2 months and still hasn=
't
> >> identified the root cause.
> >>
> >> Actually I have explained the reasons behind the events to Mani in ano=
ther
> >> thread, you can refer to https://lore.kernel.org/mhi/20260919095506.95=
70-1-slark_xiao@163.com/
> >>
> >> From Qualcomm's perspective, 2 seconds is not enough for their default=
 design.
> >> They recommended us to update this value to 5 seconds and Mani checked=
 this
> >> internally as well. So we decided to update this 5 seconds setting to =
all MHI devices.
> >
> >Thanks. I'm really surprised we still don't have a more precise
> >understanding or description of the underlying issue. That said, I
> >think it's reasonable to proceed with this as an initial workaround.
> >
> >Could you please send a v2 that introduces a define for the 5000 ms
> >timeout? It would also be helpful to add a comment explaining that
> >this value is required to accommodate the 'late wake-event issue'.
> >
> >Regards,
> >Loic
>
> Do you mean something like below?
>
> /* Add define of  initial autosuspend_delay_ms to accommodate a potential=
 'late wake-event' issue */
> #define MHI_AUTOSUSPEND_DELAY_MS 5000
> ......
>  -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>  +               pm_runtime_set_autosuspend_delay(&pdev->dev, MHI_AUTOSUS=
PEND_DELAY_MS);

Yes.

>
> Thanks
>
> >>
> >> Thanks
> >> >>
> >> >> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtim=
e PM")
> >> >> Cc: stable@vger.kernel.org
> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >> ---
> >> >>  drivers/bus/mhi/host/pci_generic.c | 2 +-
> >> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/h=
ost/pci_generic.c
> >> >> index 7193a384cca4..40735beb46cb 100644
> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev=
, const struct pci_device_id *id)
> >> >>
> >> >>         /* Allow runtime suspend only if both PME from D3Hot and M3=
 are supported */
> >> >>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> >> >> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> >> >> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> >> >>                 pm_runtime_use_autosuspend(&pdev->dev);
> >> >>                 pm_runtime_mark_last_busy(&pdev->dev);
> >> >>                 pm_runtime_put_noidle(&pdev->dev);
> >> >> --
> >> >> 2.53.0
> >> >>
