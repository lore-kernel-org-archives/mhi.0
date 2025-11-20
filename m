Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827414AD0D
	for <mhi@lists.linux.dev>; Thu, 20 Nov 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763624670; cv=none; b=ieHAe95jWdUfwU99SPxk3QCZ9pbNexFM1JzWdco40InEEei4wUZ71IDPoewrlP4AXMfJQmORMvAtfyruko3XINwUA1vO6NPZq2dS0aKiJvsp17hgAmd2C3f1+e0JhHXo1xlY3tYMftUfmUrkJld6bNUqcRwSvyPhTE0qXwWWcdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763624670; c=relaxed/simple;
	bh=7zETQiXT4xBuWzwG2Ix7qFEr5Fp3FSTqfDMOr3MK8Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Urfs9Cgs8qT5Jf2MXQF1Xd70qRg4FRrDy9IP+u3uwEPm7QwAAAT1bzAzUnbMN5v4h1fCHeTWVZyYSEvC9TGoq6CNRaLz2g+GoGX1vTU5PAM5MPqjLExBdFB95+rQMSpWDyHrjAOB/7bERCmEIJ7tWrDK00KJvMemAcimD0Tn7hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHAL8ECS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SD909TRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHAL8ECS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SD909TRC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK7atuX082033
	for <mhi@lists.linux.dev>; Thu, 20 Nov 2025 07:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dujPfF8ACV9dgOV+Fgtjs2y5+95hXnDada4nHzZtF9s=; b=VHAL8ECSLelPZLt1
	8WZJAK2BB1cw+nH/6uzmykaAOyo2aXb4cpT5GeebuKcVHYvUnObP2ThlSZfG1lM2
	Ns9/pV/gPB+4WaeDXf4/v6zE+KtncX1/CKv7Cacb8mahFB0XJfvcpLlKexBszeDR
	s/+saYcCPQzB78Uy7b9aOmFLvQVMKM9GklFfVIu9t94HjH/baGKC096XGRLGazrS
	GK+LudppumiZr9pR3RGDc+F3oGnADh1HiN2VBGQnKshEvVJjKoWE8Cw6FLLJZoDy
	7gC5ylUpEDl8/N2t5kyk6/jSvY66wLXHTvEKgaz0vSDJRfMn47sul0n5IhA+3U6T
	rm59LA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahxrn80j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 20 Nov 2025 07:44:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882380beb27so19745986d6.3
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 23:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763624667; x=1764229467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dujPfF8ACV9dgOV+Fgtjs2y5+95hXnDada4nHzZtF9s=;
        b=SD909TRCHRnYWaNOx1q0VxtF5BcaeaZx16F8/uEBz995fse1chyQVwOgknSbNlF6NL
         2E7hcIYEZPWAIMPcMoLlTOgziF1qlvZDzPRFZ5ocgLFSfeHtbIGsaIL6QsZ/pIRyFWbD
         y7W0TNuB6Gh1nuJ3g6rwV8ww1aQRFe/gsQnjvCbAGWTn0kzq6NNhgoleRN1ACLK3pgC0
         5fbEitjPqmBzdFPehL5bRrTuZfwAM3IYDPcQrTByaiYRvYbanwIFUb8hfd6wpX36HPEG
         uGqbWJns9x5AmJgj1gpME2cp/FG19ft0KUQhPRl7ZkVXz9UiAE9AUiSxzrM+kegiMJ8v
         KCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763624667; x=1764229467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dujPfF8ACV9dgOV+Fgtjs2y5+95hXnDada4nHzZtF9s=;
        b=HSGETEWBamnWiHA2GAr0r7F01TtenJUB0rN76RpVnjkNzaSXjuxopYZIHJPmGn72Zs
         tNwdSw5InMlKjSWsyQUugw9+QmRumo6HwXAzYp6Ux1smHbwHfQ02FNLgcrus/cFbgfCb
         LFb7Y7g/5bjcw8jy/Oeq88d+fWOg7EXLiGmnp+sLIDDkAd0XcWKFw7dRmDTmL4PCUdbh
         iEGh4JzmAIDoEottOXSwuI0uNij5xofTNlN7Vm3cqlG9ruhVyiMq8+B0eJI+XLdUBHwa
         5DzIcNRyh0fmRIdl/HFysR8W2xJEcuFKLaoK2FcqaTw4g25S3g7JJRwW+ReLG62gMQ7a
         ex7w==
X-Forwarded-Encrypted: i=1; AJvYcCX1dXl51fI2m3mrJuXD/p1KKBHYv4zyfmeJWV17Ufjg4buxXI/jc5/RUnjm8RVVdLW1YVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTU0Yl9btMVZSyH/r5HBRrEFrSYg+RHCtMCpbQlgWlN627nG5y
	F1TxgGNsX3gQwAjeXndA2nVAyPm1zy8nMnndGaNHbCMV5wo6YqIN9pY+uSBIu16rYkaTxeJYd3u
	fDFLwhWilnTQQZlSnoyZpI2PlWZu7PNWh1wzlVCZ/nzH+Ms4IRnkGs16qBL/gsDNCfnyzlHBolX
	c91d26oY47AcVEUQAhBiK+/4xhfP20sw==
X-Gm-Gg: ASbGnct9ELfpuDHdSxUWcS4F03TfPKu16afnJO8d/Jr53ZeVAzSwF++XSdLaIPS35oR
	+nfCtgdxqcW9ja2bhMR8fDqEPB5KC0Q1hrThlptARkcEAwnv0e5MJSsaDY8YZDr2PAdiqLyEXwH
	tmQ30HKJMOY/UAQ0NyrALx1B9e4Aq3TWLKUxCUr5fmD3PeBCuJCcuygxKwUQYEAHgsfZJk46PFe
	6gQ5aFY1vCGf14i/lIebm2e3I9V
X-Received: by 2002:a05:620a:4627:b0:8b2:e177:eca7 with SMTP id af79cd13be357-8b32a1a2f3cmr175857285a.65.1763624666982;
        Wed, 19 Nov 2025 23:44:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiTSpTLL63gFNA6kfAEuwhtERl1L6tPSLZBLhGwEhTfPcT1NDl90S4wwKlZLkAOyMLn0P1RJq1xqQ+nA4aT24=
X-Received: by 2002:a05:620a:4627:b0:8b2:e177:eca7 with SMTP id
 af79cd13be357-8b32a1a2f3cmr175855985a.65.1763624666597; Wed, 19 Nov 2025
 23:44:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
 <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com> <moob5m5ek4jialx4vbxdkuagrkvvv7ioaqm2yhvei5flrdrzxi@c45te734h3yf>
In-Reply-To: <moob5m5ek4jialx4vbxdkuagrkvvv7ioaqm2yhvei5flrdrzxi@c45te734h3yf>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 08:44:14 +0100
X-Gm-Features: AWmQ_bkbG-y72KHENe0Ls0_KPXmUg0MtnXnXf44C4r75Jlynu6WUZb1WzxdIMb0
Message-ID: <CAFEp6-1kSMGY0ydJjTvZqB4okXQgcwkvhMni8r-tOMzXyY7P_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
To: Slark Xiao <slark_xiao@163.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: UJpYLEasUA1GT6oV00obM0aZjSAtXOPN
X-Proofpoint-GUID: UJpYLEasUA1GT6oV00obM0aZjSAtXOPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0MyBTYWx0ZWRfX11tuyP9tgBY0
 oqTKbPDfzKbHD36AlP5VLZgxXYLtjszqKZR5D6LsZSeUpHdgKxMZFLHPkGlKKQAcDEOLnbKuhBc
 hcr5ZVHgz7kGhAujBgyHpHerFU/BEm3eqE9yqd96kjNQGaEVXxhryK/ZuGAi6N/hIGJqCc0g5Zf
 y32jbmfNcuVgVYrgqrSGy1yBFStqIMGYRC8mecQNiQE+H4LcPgPCwNL5PmhHT9AV8MI/9qQOLjr
 /GiCRvLJCnjbXMYlB8JMlClB1wG0C7xjGeeARb/P5N6yDHN+9wAlByrtJfotKBXmb76XdUHyR3O
 XbBwfKB1lOfXsC6K6Tbbzr0OlSsF/NrfKl9Fk8pr0KhxaM+cH4JWO5FaUQlCjZPAtc8ZBkZmwrG
 bBFIltVvEfMdvTfGyaDSmTXjiWrTaQ==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=691ec6db cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Byx-y9mGAAAA:8 a=bWBNashKTJGlpAx1TYsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200043

On Thu, Nov 20, 2025 at 6:41=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Nov 19, 2025 at 02:08:33PM +0100, Loic Poulain wrote:
> > On Wed, Nov 19, 2025 at 12:27=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> > > > T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> > > > architechture with SDX72/SDX75 chip. So we need to assign initial
> > > > link id for this device to make sure network available.
> > > >
> > > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > > ---
> > > >  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mh=
i_wwan_mbim.c
> > > > index c814fbd756a1..a142af59a91f 100644
> > > > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > > > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > > > @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rc=
u(struct mhi_mbim_context *mbim
> > > >  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
> > > >  {
> > > >       if (strcmp(cntrl->name, "foxconn-dw5934e") =3D=3D 0 ||
> > > > -         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0)
> > > > +         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0 ||
> > > > +         strcmp(cntrl->name, "foxconn-t99w760") =3D=3D 0)
> > >
> > > Can we replace this list of strinc comparisons with some kind of devi=
ce
> > > data, being set in the mhi-pci-generic driver?
> >
> > If we move this MBIM-specific information into mhi-pci-generic, we
> > should consider using a software node (e.g. via
> > device_add_software_node) so that these properties can be accessed
> > through the generic device-property API.
> >
>
> MHI has to business in dealing with MBIM specific information as we alrea=
dy
> concluded. So it should be handled within the WWAN subsystem.

it doesn=E2=80=99t make sense to include MBIM-specific fields in a generic =
MHI
structure. However, attaching fwnode properties could be reasonable
since the MHI PCI driver is responsible for device enumeration, and
that would keep device model specific handling fully covered in that
driver.

It=E2=80=99s fine to keep device-specific handling within WWAN/MBIM. Howeve=
r,
next time, please introduce a dedicated device data structure for the
mux-id instead of adding another strcmp.

Regards,
Loic
