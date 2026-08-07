Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441C3D1CD7
	for <mhi@lists.linux.dev>; Fri,  7 Aug 2026 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088503; cv=pass; b=N3nAdto905MhOpFKzQQKiA0JYQwHqfMpqgkxBEHPfd/TyfBdNlnEb6UkPGACL3hzEd9P/GzN20RDjhZfOISWfBQ6cmau1pgKcLbF8jMwKWBWx04xrr51VMTIv7VKyZtJG6blMPPUrCVhRKiUWk6PSP4EKcxcRjbihvYAel0/9sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088503; c=relaxed/simple;
	bh=5Plns2Jbn5OXeNckqjSXdij6t5RJl7xrBeCtrPo6anI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0xAfgloWh6UZt6xssidpX8jqMkZ2haF01bkw9PaTw1gL1I5UDbev5ou6Inj5hyhAO86RJMmily28d0Jvuq4I+xoqo1pmnL12uPKyYGkjsILUvKK3nOy85M1EthwC3Xbr00nOV3jrmCu2DqyCYSESgZo+FDhhsuMU1dMiTLL+v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIb78wXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkhvAGlv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIb78wXD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkhvAGlv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gkrn3218070
	for <mhi@lists.linux.dev>; Fri, 7 Aug 2026 07:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/BgbG9+UF8c8tgPOwvq4ZdqnX6fF0WI43EkAjZ6ggQ=; b=OIb78wXDz0sJ9VI/
	gggHtDoRAbsq7Ecu0iUnbcGvpUEtsPcuzCqTnp5xPgx49v2XcEgNm0TxbqdgGLGs
	HRTKnrh9/Jm2jhmlSSzEB0G4zQlKODLufx4mi9ZvVhWQgCw0e4/s4FlrrYCYv6E2
	fnwcxvyD+XyPrwDaEKuIwZCERa4XsAPu6BhbbMEFdHDXj6//DMBCM01yvFQUV8XR
	HiEMMhRCyG/rJJLFCbJefDMZxs18TUjiKzzK+CQPHOVQJx4HS4SrCaUopwd1XQuL
	gdefkfrmymCRc+a/FdhU6LEEMTbzQO/VSOQV2uaBw5LEbs0fn0NyujdhAqyerCuR
	LoOn5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6htsu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 07 Aug 2026 07:41:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93106d8af18so292866385a.0
        for <mhi@lists.linux.dev>; Fri, 07 Aug 2026 00:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786088500; cv=none;
        d=google.com; s=arc-20260327;
        b=SnfuIxVDWfF4ROjRhZ57Z7N9hhxwPg2sg7Bq3QBFAfO7E3rNaqXl41URRL2nmSFcoN
         WA5fvm1CjHONGxFkzwd7qJuafdZFbZ1ZawwELrJ99ni9j21FWUKoxdd0PBG9cL5v4sL5
         XVzZ52zPyInjyFQdbcioaG3awtbmzwvl9k9OJSXTJu2XxJhgZ+hpIwBpPVQ/9lw8HxeY
         vikr+DsAb269JNN5XFJd+wtlZVKrxnfqNs9ERnNb4+LbyKbF6wQxkSyNgiJdmKgmrCir
         L+MInL7/+DcbP5X9gJeKw7e3ZV+vwWa7068LMvs12+ytTz5Ms+mjNQrurPYSjXeOzBSG
         8Htw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/BgbG9+UF8c8tgPOwvq4ZdqnX6fF0WI43EkAjZ6ggQ=;
        fh=d34G0gJQ+6CVDDJ0H0mgXEvlhmHmXWQpqwpt8yUcA0Q=;
        b=EXnXUglfVqyTpXgem/dKRJnQ/feRRXroeTrlE9qB72QybZjgRLZi3LdRwAOlbc/17j
         B+HhbNkVQU5//EDVQXxf7nM86tasAqbVqvX1kYiKf9ZHL7W2oMP2LU/ExCkqqLke4Pfr
         fxYkQ4xBrkm9ciGr/gTUIiqC8hnX+E3LJFAhPDJgJ+8b8maP9E+0CFP+PNvqsWq7qCY7
         Ibe7dulWyTcKi5aJI3PZeyyHjv6wUaJyeOuq2ioKVcUdfBDigI2dFpyNo4um8xup3LfD
         zu/YuEU/ylJ0FHJ3uWnJtHkllyB6EausVvWR/daiXrU7UcRrboD5ZgOhA2lA/4SGbNHv
         454A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786088500; x=1786693300; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/BgbG9+UF8c8tgPOwvq4ZdqnX6fF0WI43EkAjZ6ggQ=;
        b=JkhvAGlvBb6P8ztg2VSoV6KcfM07734fUqt7vB0Gnlc7R3jp1DNZSEWiBgbAtAMzAP
         weTatvgaxG6WWDfxI6hatojiJV9n+lzVnTBQtM9SjqkG/I4pAA9y6euHAU/DC21DoDov
         bQ1AregmwyMWKRjXkOpE9TqaIn8zsU8HconbfUgV8LRoLq5eWf8DKCv8P3iRHh+A1ONh
         NvGutj9aazXwnI3X03OL9uz6iOLyB+sYuByIq7WW/UnhKCaMGJ0g/r/2Yj2HE+L1J6t4
         MlYbMOiCUZ2AAnLKQWGwcoTiL4ZMob34f3OTHiGP9wSuK1TOrvBzAnxct/MTwY7yNH85
         PkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088500; x=1786693300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/BgbG9+UF8c8tgPOwvq4ZdqnX6fF0WI43EkAjZ6ggQ=;
        b=GoqhJUNKUmGhZ4IzLV3G67sCI+VAN/KhAggEB+8f92VUktUv7s+oO8VGpFjm2P6yst
         CxPJ88XjY1uEMErqwHAIrCem1zf88SJjiZAhJow4EqPqphQeGv+OnaWRJK+NFht27GFj
         Em28SptE1IdbD+pV0BtRprGTQYPt2G+iKAAQrKs5u8f/qpatdRuRKxmsghPOnooW9eU4
         d4pBUD+nkvhVYq1CBTP6y9i12vbPxl5QDfO/MUyjCH+64mp4/Hu4gKSyTeXifPGAgB1d
         pzwhDQ2hmZ2PDu2LaS7waUfivqCLSh5G1tfnW7C4RxAo3SIEIYKR2bSCrtUr5PkSVsFL
         XB4w==
X-Forwarded-Encrypted: i=1; AHgh+Ro0t+REq0YeajeThQK778JtIQFA3FjW5l6lV4pSG4SkBbFZ7hT0TjJSNWFuoTwZv1XUYvo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/4zRjSDO5xGCRwNDNbT8EoiRxgKlTec9TqxSp1ByC+C75ua0S
	kMH9+bnZq+ONLoD7zAo2+4vamtKehNk6j5CQ4bK6XtAC67Pca2b3z2tJIYlYm1xb9y+bGHWdT4U
	mKNL8eh0/qWXexkGsqM8UNNsQNda4XMI/hfEqUBBQCNUYz5sE3IKMhPxbLH2tlpXTn0mi1a6AdA
	dFSfNkU/WsH5YhAWEs+Y6juYwLZTkTiA==
X-Gm-Gg: AR+sD12FCc2TFHb57lm9m8R43tN+6e6nselA8Uig+z7MVgcNDnkOy3Kldwd0CHse0pd
	ACjXpveD8O7cHaViV9Xczl+EPOOKc8eva9tT//kG48lSs6LenbalU/z76xDCCD/WbhvP3JIFFe6
	zcuAMPKU0nLDTFHhIA6PGHFyDKMUo2rH1u2qJ5alTtau0PI6/XY+0mm39sQzY0wJQOGQKS8xXNf
	LjB7lLEOU20t1JbXQ4QEyIOEDiRzpn/DTjmMYYoJpYfcRW9Fu9WZaxy2O8AQr/hbdgHi9YGmZUm
X-Received: by 2002:a05:620a:2727:b0:92b:45e1:b04f with SMTP id af79cd13be357-936491044dbmr2232182885a.5.1786088500112;
        Fri, 07 Aug 2026 00:41:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2727:b0:92b:45e1:b04f with SMTP id
 af79cd13be357-936491044dbmr2232178185a.5.1786088499249; Fri, 07 Aug 2026
 00:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806155253.3378294-1-peter.hunt@opengear.com> <20260806155253.3378294-2-peter.hunt@opengear.com>
In-Reply-To: <20260806155253.3378294-2-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 09:41:28 +0200
X-Gm-Features: AUfX_mxCtqkSFWdj7GM9fR_-pQUhQERKWaj5Jiidgbbl_nueqlv0AhnjQRgWYWs
Message-ID: <CAFEp6-3UaCMkW4jSmV0ezHBUwisj8zgTTbisuFHR39KJ9Gi5iQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NiBTYWx0ZWRfX73316BguZ7qU
 nB2fl2gwZEJ3fsWvUIl+3ne35jGXU6AjrVL5uRITyEJK97yPx7yhYb5QjTwOlF1ELXla++7yvz/
 YE5MPHopO7Zcxeyp7EhNmaDQMHlVPQE=
X-Authority-Analysis: v=2.4 cv=PK0/P/qC c=1 sm=1 tr=0 ts=6a758c35 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=t2vznHeBAAAA:8 a=rCPLLavBaKGQfHEBtq0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NiBTYWx0ZWRfX6kWzv6xBvSLd
 g666u8KgBHxkKxLz1ElFPQo92QKy3ld1wWSLr4XXDdRRsB1yQJRykeSIcpyNeHG4wFRFhPrvCCm
 hgTEU6bsWtrep/oFHtN0G4hnDRdwKbYWMBtS/8TR+WFl3k5PiXxHe6ywdC+CBClWqh7tbcT0wao
 0jXafZ3diDl/E02rJt9JCEl4NXUAvoJLsu5UN93EAHBhfkxoY9PzH4Hd9L8FwEj3bV3072h1s7t
 seNIIJTTBBVCJMLjKLyDgQM1QhrHeRQHBaKjiFtW+6vIzi+HCVe10cAXxBTKvLjUIheiVcTjEv8
 nGSlHwnSE1woiJ9kYLugxztw1KwmBZa92Lue9yLAD52LUdiQfrJXWirLDi6bQoaOEECcifCmAEa
 N1xYOHCkZ78j//iD9fCPnT02F+RZnXEtaFsRGlVavveJ76L/+OnpGap5wVg9/ABSFkU1p/WG1IT
 e6ecuCkDUvPaBJPDeCg==
X-Proofpoint-GUID: v-rKCnw7q5WZMe8n3SYGccxRmkPiMS8Q
X-Proofpoint-ORIG-GUID: v-rKCnw7q5WZMe8n3SYGccxRmkPiMS8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070056

On Thu, Aug 6, 2026 at 5:54=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com>=
 wrote:
>
> The WWAN character device emulates the TTY modem-control ioctls
> (TIOCMGET/TIOCMSET/TIOCMBIC/TIOCMBIS) for AT and QCDM ports, but the
> result is only stored in port->at_data.mdmbits and never reaches the port
> driver. A driver therefore cannot act on the host raising or dropping
> DTR/RTS, even though some modems depend on it (e.g. they withhold
> unsolicited AT result codes until the host asserts DTR).
>
> Add optional ->tiocmget/->tiocmset operations to struct wwan_port_ops and
> call them from the AT/QCDM ioctl path. ->tiocmset is passed the resolved
> TIOCM_* bitmask after BIC/BIS/SET has been applied; ->tiocmget, when
> provided, refreshes the cached bits from the device. Drivers that do not
> implement them keep the previous store-only behaviour.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>
> ---
>  drivers/net/wwan/wwan_core.c | 12 +++++++++++-
>  include/linux/wwan.h         |  4 ++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index ffbcf11e4e68..bf83eb5790fe 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -1018,7 +1018,15 @@ static long wwan_port_fops_at_ioctl(struct wwan_po=
rt *port, unsigned int cmd,
>  #endif
>
>         case TIOCMGET:
> -               ret =3D put_user(port->at_data.mdmbits, (int __user *)arg=
);
> +               if (port->ops->tiocmget) {
> +                       ret =3D port->ops->tiocmget(port);
> +                       if (ret >=3D 0) {
> +                               port->at_data.mdmbits =3D ret;
> +                               ret =3D 0;
> +                       }
> +               }
> +               if (!ret)
> +                       ret =3D put_user(port->at_data.mdmbits, (int __us=
er *)arg);
>                 break;
>
>         case TIOCMSET:
> @@ -1036,6 +1044,8 @@ static long wwan_port_fops_at_ioctl(struct wwan_por=
t *port, unsigned int cmd,
>                         port->at_data.mdmbits |=3D mdmbits;
>                 else
>                         port->at_data.mdmbits =3D mdmbits;
> +               if (port->ops->tiocmset)
> +                       ret =3D port->ops->tiocmset(port, port->at_data.m=
dmbits);
>                 break;
>         }
>
> diff --git a/include/linux/wwan.h b/include/linux/wwan.h
> index 1e0e2cb53579..bac02521e274 100644
> --- a/include/linux/wwan.h
> +++ b/include/linux/wwan.h
> @@ -57,6 +57,8 @@ struct wwan_port;
>   * @tx_blocking: Optional blocking routine that sends WWAN port protocol=
 data
>   *               to the device.
>   * @tx_poll: Optional routine that sets additional TX poll flags.
> + * @tiocmget: Optional routine that reads the modem control lines.
> + * @tiocmset: Optional routine that sets the modem control lines.
>   *
>   * The wwan_port_ops structure contains a list of low-level operations
>   * that control a WWAN port device. All functions are mandatory unless s=
pecified.
> @@ -70,6 +72,8 @@ struct wwan_port_ops {
>         int (*tx_blocking)(struct wwan_port *port, struct sk_buff *skb);
>         __poll_t (*tx_poll)(struct wwan_port *port, struct file *filp,
>                             poll_table *wait);
> +       int (*tiocmget)(struct wwan_port *port);

You don't use it in this series, so please drop.

> +       int (*tiocmset)(struct wwan_port *port, unsigned int mdmbits);

TBH, I would prefer a dtr_rts(port, on/off) callback like
tty_port_operations. the tiocmset/get generic handling can stay in the
WWAN core.

>  };
>
>  /** struct wwan_port_caps - The WWAN port capbilities
> --
> 2.43.0
>
