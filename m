Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A18331715D
	for <mhi@lists.linux.dev>; Wed, 12 Aug 2026 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786516547; cv=pass; b=bxecegbKQmfM0+OvVBhurDYmqi1PdW+v6IsuGMgMCSRVUyvshnyFDH30xjh7XuJQUtgJ2SyYjeJlXtFdS34u0X4hLuCTpxr+yGY0EOwgVKWtfEL32cOP+ddmbhExk6q2SM4uB8b8gGXsw9ztH906nFpc9mUOeUKcLlQxjirRXMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786516547; c=relaxed/simple;
	bh=UKFfyAxfc2AHZa+zZoe8RHh8COU04xbUZ9VKCkbn7nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSum5ntCpb3iTY7WFqBLQCWqy8nmkJNvVEdD7buh46KpH3d5Nmv4LRFx9/Gyw+qULh1pExHIFeY9uOMRWOGlfTx7B5C40V6J78kQ53mavlGAgFMvECaWbtKG1OoMY7AzEJUiIaOSq1BcMvBP3gu0YVPZkYvk4vwJRfUN6fyQ1ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VH/t6QOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo+LYTLi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VH/t6QOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo+LYTLi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62c1P2190397
	for <mhi@lists.linux.dev>; Wed, 12 Aug 2026 06:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=; b=VH/t6QODNBBEPcrw
	aJzTYDSeEGW4Ia8c3WO7HTBlkJrJL7dkJ6kju0a1WUULqt/dGhMUgmOBr7Eci3u0
	pzj+hyXhl1r1xddN7LDeLAAq8w1/DNAKhd/CbVksHrqs2LzE4yMaXNevJdeE3vkq
	GBTuWV9Esd+EviUuuqavIFUNjocdLt0GK9Wn3V0R4k0zDQheI4OSvxKTacLHoZz+
	Gi+3OJ+I7Nt3xOpvor6hJOymnXNDqciWxXJvhKnTIFeSN40GG54nAAM9o5P7XVoe
	UREt3jBfEn45gVCTWwyMTwj5bsGO0+S9RO4XUxqNDpEtQyMVtO8w8Q8HTH50R0x8
	YQq2fQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g3tqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 12 Aug 2026 06:35:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e9489f62bfso7977536d6.2
        for <mhi@lists.linux.dev>; Tue, 11 Aug 2026 23:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786516544; cv=none;
        d=google.com; s=arc-20260327;
        b=KTbhhFKq/hFdhCVrfbm+92X8KqlcxukEntiijedtehG4/Q7Hqcw9v0PI+mKd5YH0+S
         TZd4V877ImOglkR+jr1eA6Dem/cmL8TWPEOJZgvf/bxf/mklSJo2h4LKGVvys7c9Qm/o
         GfVLTYapVFQRwuuFM4xLcTCtdDoOuQMkfGZSBD2eiHbLXfW08RGkaEAzKBjucV1/V2p7
         z9Mw/Z/eiboULo6kCy/Snk6hS5CuSERGkfWS8InPcte0CtLUWF5lBN/A9ywzpOoiEQH0
         kWVHoXhk9mym4kkWzvwwWxDnQVfm7US69VhRmSS03skRK5kfDpSa6MvuQpl/sQ8pYs5k
         u4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=;
        fh=qLi11dFS7V2wwizM497WOSul5XLA7REA2qsI+bF82mM=;
        b=MxQI25xe881ncXzuibq2T8LZfwLniYYczQ+36Kvel2Xv+z7/uZB0FgRmbCKcER5krq
         iHFH6Qi6Hb9uEqWs3pE+genevtxKw2cSINz8KcKb1Y35f2fGRfRr87hKIzYqLrTYMP0R
         jqbCl6ZKTe2ZG7GY1k9iHFN+VhEKw4OIJRn1yuJZdwH2rJZtCmh0VBkrmzuwMfXIqidw
         ITmSoAzs6ZfjxAQ875QYwz9EDvSi+mU3LQ9iPZXKJe2mMvGal/vEcSNpyb/4/NAX64Je
         vIdQWFoF5WiLPavq6hDrY7XZNsYn9z5krmqGd+qUHjDhuwSL0dNCVw9hc48AzP7bCpu/
         8xww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786516544; x=1787121344; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=;
        b=Fo+LYTLikeFAJX/9/ESL6IqLxfvUBr3PTaUXXjOtB44g/7jkn7VTVzb6XZhQ5ep6Th
         cFI0mcwElfTEQvcJ306SKqlK8dzr0RFa2NB71z6GU3jjaEgagRYa75l2zBlpRSJAmYKU
         Muw6jXAvQH+VjX60ZPztOuqmvYDymwbJHcYZfucriKdz251PLQb5Yfm1erdR3ZqnK/e9
         KAew22b0fKBLRfttZf+NaoEtmM8Bf85XgGamWx2c1IN58vRQ3CkdQe0ZtEb0jyWE+gyJ
         cBlulNew6dGBdzzKAxX+I1mCXbgXl92/pZMRUYrY24OfPF1i7i+0L6jD5ailb2mB39qd
         YpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516544; x=1787121344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD6IIVZKV4c5mmZkoHVMchn1BaeZqhuYx+TmbD5+G58=;
        b=RKGh/v56GgA8QthQtsWub11UI3VCNARxUcVKfEfLfjhtOsEPf3/xzXSiVLTNWalkYe
         HnpjTpWA1SjYltZKonTAxiW9yn1dkye6DC7DpeqMfQFOkSAvrj5jNe7Ry1x4KOnI1Xo8
         jX+IhjimvuwHxM4T4A1ysO3ElSroKQ8QEk5NBZXzWvmLs+M7dulJ/llWeqxvOGH/5UAF
         yepbx0UWtL54yHt6MK9Mr2S1+LFvjI+qOLUlez55pzVupKusAYXIO05bUy9D4K9JIkrG
         RRFTlRSzb84+ilgjyPd6+zoNN0fwW6OBfxmBEdF2KO8XbkKdR8U8iENms0hSzDZtpzFG
         nUgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpoi7txEr0flPfJ38tEdFfrg4OwV1+ehq880G7pNd1uLu3y1FZ2Ap6HZkKTZLuSmunXYM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9BVZaimr4U2625JIlGP7vul67I0m+6LVcgcsGhUjSI1wSH/ub
	s7Y9qKz5PhAbERMjuU9cSQ01IX/0M8UqNaOLjlRWG3PHA3Roi5rKNunnetB29NMaNAeSnCZS+Wh
	dvCWcCykck+xRwtCQpEkUQAnocwItiam53o6bPNn21cNoSAS8HeN8nXB3XpmqUop3GtBoguOvFY
	/QGAEhEWSJCSjgGeQi19zKZyN2mEQfbA==
X-Gm-Gg: AR+sD10uDpLGYyRE/sDJ3yoMzxmBHhVHLbnrwoZS9wilmGPvQEy9kxr3Gquczj+ie84
	HEG5YbghLR10kA3Lv3B93WsnH1S5YFU2pm7Eg+MmED9hWwtdjA/w7B3mWSSvHre302m3uiORu81
	hyxpdL4jK95jiY5mDkyp82nksRlrvN13AD3o+GImUHVA/MW8IRLV7T/xE6xGNJaqKi5glBPO38o
	QCbmous1zBNgbIkMXnbR6rJh9FtYyHi3et0K/obUW/MaWDYvGmmpnUtwBl8C3JzYB9W81S0yG0s
X-Received: by 2002:ad4:5d63:0:b0:8f0:367c:eb80 with SMTP id 6a1803df08f44-90a7001ad5cmr21931236d6.25.1786516544092;
        Tue, 11 Aug 2026 23:35:44 -0700 (PDT)
X-Received: by 2002:ad4:5d63:0:b0:8f0:367c:eb80 with SMTP id
 6a1803df08f44-90a7001ad5cmr21931006d6.25.1786516543692; Tue, 11 Aug 2026
 23:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807215042.2714442-1-peter.hunt@opengear.com> <20260807215042.2714442-3-peter.hunt@opengear.com>
In-Reply-To: <20260807215042.2714442-3-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 08:35:32 +0200
X-Gm-Features: AUfX_mxzpLAFftiMhVSPoQ8lEsOl7VWetlmRHPSqUPRYAGRJNBVcPAJAWQl7h3k
Message-ID: <CAFEp6-1U_s2QshhUrT5nVhDubJPt3YGHuprDbj8=ps7xJgyP7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] bus: mhi: host: pci_generic: enumerate
 IP_CTRL channel for Sierra EM919x/EM929x
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, mani@kernel.org, johannes@sipsolutions.net,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: a4s-TLILGw7Fot4apUaTWAsTDg5_z-Hb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1MCBTYWx0ZWRfX3SEg15JSg4lz
 uFO5iPDz/WtSgl0QaaPAzWG6MN7M7IV41qplVLtACXQYxhoENCGrJbJHKYflAWBO54fpoZqDarl
 fmFrBC1ItJNwyXj7i3bPS+gvVJhckqw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1MCBTYWx0ZWRfX3XtkUn1GTPvG
 ANeStc1XcGONF7+84tjDc2mYM4jRzoavcGulIV5IZ0NR2+S6wr3bT7vuijXClt+JsIUW8KZGizq
 2mk3KfBxKLJ+HwdCasCISt9eN/QyEmWkaEqYfzpegh+AkrsQqNH63KcEWVTwOFkASl7FxCxq33f
 KwrwksmXx+M3XVNYDyYx7SXGm5JV3U0fchUF113MTo69rjCB9tjPCU9uyLgFgpdu+m38nILTAvR
 vXV2uXRDAbDKs9ZRgPM/l7UthPoU5I7/ymfh8rgA8oiFjW8W8T9Z3tG9svWaUbb3wdohBnGHoCc
 wsdOCo5pZMrONR40Q2Hl4PbmgrOv/z4ZYy/puTNimKvvdBrXAWwxjSRTdXvXz+E+Cl+VKKcMqx9
 2gddsYMsFckzVRecG1ZwwI5fed/nxE7s9Q1HWqBpd13W8UDGvUv1LtTtkyoicj/lQwLtvm3Z85p
 kaRuWiXM0te3XESQ7Lg==
X-Proofpoint-ORIG-GUID: a4s-TLILGw7Fot4apUaTWAsTDg5_z-Hb
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7c1441 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8
 a=WViMzPdn84buqVz0jb4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120050

On Fri, Aug 7, 2026 at 11:51=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> IP_CTRL is a standard Qualcomm MHI control channel (channels 18/19) that
> carries the host serial control lines (DTR/RTS) to the modem; it is not
> Sierra-specific. It was not enumerated for any device in pci_generic, so
> the host had no way to drive those signals.
>
> Enumerate it in the Sierra em919x channel config (shared by the EM919x
> and EM929x) using the control event ring. This is the device the change
> was tested against; other Qualcomm modem configs that expose IP_CTRL can
> enable it the same way, since the mhi_wwan_ctrl DTR support that consumes
> it is device-agnostic and binds purely by channel name.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 0d0d9c7ffa4b..ba47dd153837 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -728,6 +728,8 @@ static const struct mhi_channel_config mhi_sierra_em9=
19x_channels[] =3D {
>         MHI_CHANNEL_CONFIG_DL(13, "MBIM", 128, 0),
>         MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(18, "IP_CTRL", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(19, "IP_CTRL", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 512, 1),
> --
> 2.43.0
>
