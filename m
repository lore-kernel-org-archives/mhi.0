Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F9226AC3
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763729245; cv=none; b=HEhsFg4Xl4tJpP6UT/lj9rwW2ok0w49+JghzWd5FmacOMyOvWya/ZZNwPxfQZ48rE9qoCERq9kLibiIN+6vnJGqY1vwI0QuN/gRt47gSQ0jBm2GPIcuLh4y4XQDb8LdvWKGWB5PMRhFNQkJA7f760N365Gb17TM/tySq3hDJGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763729245; c=relaxed/simple;
	bh=h4WOJ62pfL6IHlZQtCDyGCDMDpVkECvsZ4GVjHlxSY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HG9wLJYEAq8lIPB1bKC3O1dWS5SUHLYDBPAufnWp0dyivr3gCgtoWEbG3FVG+6j/Wkl03YsqjJIAQV+0eHmbQSDAHBcSLy5Dvp0auaITLLrm30t07tX9ayLAcJc26ak/F+spM4iAF/RfvIu8X5bN0k/eL1ajxK/V89ahfqtZQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAXUntXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvZpGJTt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAXUntXg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvZpGJTt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9VvJN3048090
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 12:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvmALCvQ5ptZCSB2+jI5QTgm/ZHNVohRruEciGYDcd4=; b=HAXUntXgZq04+sEg
	khidx5SQO1ch/IyDR0NYVIwKpj2owzOgB52QIBea3j1J6gTpCKzvPFOyJvL94KAU
	2wlG2p7d6H0EbmR+5XaGxfMbCOKWakQ8CoHh0PPELgxQoPkSsqskTzkwZAVRmaOM
	nMBaIDqTpYMU45yZdrBI+j4OPCLqxbatAZUN2CtBYSJ+fJq8ZnhRt+5Wib3QoRl3
	rPP5Y4JZsxCIY2y8D+gvxy/O5pXS76FDRy7cae+GiuiyF3XG4N1sSZ9HKgSq3UyG
	pD+pd4kJjDHQf5/iByEZsd7CNDxXXUbb1gxxQh1i6PQlG6zSm7hyDRFlBKSe6cmu
	hPDODQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjrj67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 12:47:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b286006ffaso520843885a.2
        for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 04:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763729226; x=1764334026; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvmALCvQ5ptZCSB2+jI5QTgm/ZHNVohRruEciGYDcd4=;
        b=WvZpGJTtTFrONURkiM0KljyL7BPkSObSxXkMP2MvltqkiGaUetJhSlLcS0Z1v7USgq
         SqzRXH/6BY4mpgyqEGXYXes6aTkzx35+iPI+LoBG3fULATOGjnUFaAMhtvJ56I4mvosk
         SdyHB6K1PgnzQlIu9jSQ6kR4IFj5oAHJxiaJKUHy9fNY/cqBvxn2cxeLFtofcHkFbuFo
         X0S/qm8DE2atj8BMnTHgmIsvpNrVbnbm47qeRZGRbkjqOPhoGn0I6upKfsfI5jLxQC4D
         N+AWmFMYOtB2BHpytH9n/sn0V62xm0AXK88EgnS3M4pFQZtD5V3nSK4U1O2hk7dwaYmO
         GwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763729226; x=1764334026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvmALCvQ5ptZCSB2+jI5QTgm/ZHNVohRruEciGYDcd4=;
        b=Df98qZcfz2IxDgG8EbLs2/K4le0Be6Pj9vpwKyBZp2/hOYGfrv2J1T2QIBLsvUUidH
         PrqAIXdUj2EaXQF4GMZddDBGeryjIavgQJHuNWgxKlkrv5YJRj8DAEO6jk70Go8GXlsz
         +vwYIPBkH6xcOPc+tl7NN2KjhGSdi8sxjUruldoYkMHptySSZwChfpDbal1FXH+zAf+h
         CTHtfK3PAqfvOx7k1mJZcLwub+5zI6bHfT3dysrFeU58bgk20ecys4Vz15XyIcVCsf9v
         PRS374Nq3B5h/+oJ1lpyXrhQkQ8Ss2KiatYT95vdRKQwVUy1IAb5GSW9qt/yBHKWQzmt
         0cIw==
X-Forwarded-Encrypted: i=1; AJvYcCXg239Z1MF8TJEz6SsVppuhAZq9VjpTq0jEuV95Kn7GNo1c0h3359bbb/NAX9Y8JWsGBDA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8dUsj8HSu2c+wPum94e9JMutuuVloqg0kIKMv0rbFOfS9g2Kb
	/VXf5InuSAg+xpJatGT+GxSkjkTAqu65VLu5VZ1QhTY6OnHQb0uHbsjXTd4EHtFMz9rZ/4jvEcI
	XEQjGbhCOYyiPMAjQfUisUYtV1i2IeY5y0OIecpZpUvFAd1VzZYFxDOOqoGHUPhGykQLj/OLZZ0
	EXevNdrI5/JXQOvY5y6bsbeLgaT+/XAw==
X-Gm-Gg: ASbGncu/b4IKOl8Duqrr8jexrTFG95ZInVR6H4nStQ+LDlEVZlNSximun7XYEzh3Rco
	oLAHSWoLClLO5242za6GUXjoRJaIpkfsUzkEiBUDQIR6nDuPW6prkwQNxnVP5vyGigixzAQns6w
	UsAI38bUE7joP+FMslNGzwB55Q1pqnZ6Fwr5K5M400C7O8/yygqFwVqCtW2OSzshrQR3kyCnxgm
	VfXXWgrV5k0I3Wa8TI3t+RiGM0=
X-Received: by 2002:a05:620a:4412:b0:8b2:f269:f8a1 with SMTP id af79cd13be357-8b33d468fdcmr219877885a.71.1763729226278;
        Fri, 21 Nov 2025 04:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWPiCIgHWVQUiYgEZLxcTEc4IYShOjsf4gp1DesTemBJOKI/fXv3roTF9QbBQJ6o5Zq2D4RL0UGbl9ep845Ns=
X-Received: by 2002:a05:620a:4412:b0:8b2:f269:f8a1 with SMTP id
 af79cd13be357-8b33d468fdcmr219875085a.71.1763729225849; Fri, 21 Nov 2025
 04:47:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
In-Reply-To: <20251119105615.48295-3-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 13:46:54 +0100
X-Gm-Features: AWmQ_bmuI9sNPf86QyN3uWHpPrHgwmugGLDFCp_d8rNLY1v-hjk-kGSjK1o7rSc
Message-ID: <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: waSg8u-bkA5M5RKky2wolIudBd8YnMU4
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=69205f4b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5NSBTYWx0ZWRfXzhk9GWuMwvDs
 h/ce/bUuEAswZspV/KQK2GN/zKiHGpejdCxhnGv2ESb7qts12BStLDc/gNpc7ExbWjWM/wiMjmI
 bGDKULCTbn+V2ZrqlUlehxWZPjbjJsagogGRKkKpAIdU374NMgd4MwacgpHJVh+vzZ700/WfaSP
 CZZsJJEhyHdd9HhyxwKuUOm0RFA5rQEnfVRPSV8PVu/W6qyuPaMm5njq/qPHWKKKKIskqtigbkc
 ZarPr2Qj1OVnN7BjGK0K9zJW8e6+DO6VCDtqWSZBx+FKFIBzdVfYhiYO5pmpleg+FpvLfYhbkIg
 wuIDcsBUkA5UJmIbcxsutCTHczoL7Ov3n/21+KCoIuREeERF5wLm+oUAEqs+yPB1PuZ0iiV0E3V
 pP2qZGTdTopkpf0YOtrxZyTooXSggQ==
X-Proofpoint-GUID: waSg8u-bkA5M5RKky2wolIudBd8YnMU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210095

On Wed, Nov 19, 2025 at 11:57=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
> T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> architechture with SDX72/SDX75 chip. So we need to assign initial
> link id for this device to make sure network available.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan=
_mbim.c
> index c814fbd756a1..a142af59a91f 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(stru=
ct mhi_mbim_context *mbim
>  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
>  {
>         if (strcmp(cntrl->name, "foxconn-dw5934e") =3D=3D 0 ||
> -           strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0)
> +           strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0 ||
> +           strcmp(cntrl->name, "foxconn-t99w760") =3D=3D 0)
>                 return WDS_BIND_MUX_DATA_PORT_MUX_ID;
>
>         return 0;
> --
> 2.25.1
>
