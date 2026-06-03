Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB738D011
	for <mhi@lists.linux.dev>; Wed,  3 Jun 2026 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482130; cv=pass; b=qiIwVNfcBuGS8wxYWAawc0Mh78Qe5/IBTO/Zg7nNHXqwb7mPBlRpTxg+5FUbP09udQQ8GDgpqQVO+ejIJunmMWDBvH4Yo5XjQv62EDBd5nPG4C/kNuKsbF3xtRxa5FHybhK7k6UiA8bGpARMAk5f31csZioOTXPt0AdgbdbtVBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482130; c=relaxed/simple;
	bh=E2lhkkD3vWy6NShu+6BbZtfRRL57cJEm/DnxgbgqJzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNpuOMwDD22j7rC7/LiBhW8iXL2QPV2UrHpGnK6iyUtZD724FjLNCZSlFNKYL9xBhax2bFvnChMIZvyD63rLcNAuhlty+xkCDTGl68fzKLcCbA+E3CPxdMmyVvznw9t7+t3L4dEej3A5oGcBq7PnIXlc2s2Rq1NgWjrtdO7P02M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggPtm+b/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKKLeV3+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggPtm+b/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKKLeV3+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RRon873897
	for <mhi@lists.linux.dev>; Wed, 3 Jun 2026 10:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=; b=ggPtm+b/RYN+MeI+
	xoY9WyTn+S7y2qVMMR/YeJ9nZ3kOZ02NrkVv/MiqDf4nY6boxWloVv8WXY+2nGx1
	BGgyj7ltYgEsKBrD6aTYLCzL2HMe8kqhnBeUgKGsYM3IhP3A32O9BI+UyN/71q4E
	tFbY+ZScGieO2Nr3wvNVzUrpE6ol1pNkzu3vjbU6IQtycLJH/4lz3O9WnsxqkZI6
	4h6F5rZzd/3wOny3rZt57lySTpUCdpeOgJtfzFiFxXnTjrqQjWb3WSEbIJzPcCMP
	64ZHlY8/X90XkqkLTDm7DBSVhuYl6EuK1T3CNksAU5nbBgSFI+nEBrRVsDkKiBSh
	dcIuLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9jye8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 03 Jun 2026 10:22:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91579011fd1so415254685a.1
        for <mhi@lists.linux.dev>; Wed, 03 Jun 2026 03:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780482125; cv=none;
        d=google.com; s=arc-20240605;
        b=D8qysfzVj5621YhaLgXoPtTMqjRwXrL3f8iVdYN8VjJiD9fKuFmfWJ5HyTknq7qKRE
         nbhJy33E8jR69b+IxPTF8oDVMUVf7RWNLvXGuIQ4c8oT2dX6JJq7z81hzd7zh2P6O83Z
         REzFgMobc02RMvRVgmSF3KuK+uPZQYlfw+ebBbxqvH5ejF4tM+a5qcAYSaAd2QMTw0Zs
         kwOMxscdFYmOeQv2JZpQshxP4gVL4pty5WQ8m2v4C91jqYVpzHPb+uzaYD4qwRyFtjWv
         lakQNjS21l9aVu/ptypIc+LicqNBFRGc3UhDazffH3RyyzQfaVVr0EuaivQpJ9n4S5xk
         c4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=;
        fh=plqKdSx4c/R0EdDxvR0ogbUsXKeXxWHZHqAo7qd0svU=;
        b=fohAUAPartITP5JxWbTDyvmp39h/2PfRGAwp5l/2NxaVvWCv7PuBmsEYCtSU2hdE0/
         +WCxa9VHz62Og61p5mNCL57QahnLbJygxz2QrTIGTSX3CGvRUoc6Fj3XIrraoYJAHYT1
         RCUxTF9m7vn1nvFJAFPbw2jgBvhpqX4fulHaw3K/SPkTfoybHS7rCoYCzWvRpjBFE/+x
         Z3FWH+lAsSa9fpJTQKzjqsAHTBKwV6dsfeQgZ12nE5BY5SVzzqW5MHgRjjgRbykaHLtl
         xuxqyTZ2NwcfHmO6Vc8McYBHA1u6CONsCRMBlgG57UVxAbaKJbJe+SchAr8uFvUWdYlb
         26Ow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780482125; x=1781086925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=;
        b=KKKLeV3+8gPW5pyfjcRd5easCBeeO8p2tK6lsXDB0FQXBz3h/CS6ZaJnwbeLsVj7Gf
         0lheDBDF6BCc1/zHQnCPfdhOAvnVBtgfDRLh04P0kLtKeisujUdGJuSzA4mAxiPtb/tk
         X/RYuo7ePPw3JEDl1k+HcJcn8fliCGEh+n9pxzyrUZopd73jG0eNITisrnqIGycRAPPh
         wuAPsgr97aJ7aGQc+P7DX1ydhrRLm92ljsR/x0p+w/HrGRbAgIo8eKTYB4Wy9kftpDcC
         zfI9bRgTR5HYRVcuwb6MC2zB2EsKzo3QHmEhgqK1+oVm6xhE3EvZAUCxOG1WVf9jnL15
         3a6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482125; x=1781086925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vyspHsiPTwyZ6GebRoTTOOurXoaLTdsqILlPjpDFqI8=;
        b=oIUrergQRnSxVVtNLxGqDdazyaF5fr4ZrK//5hNxwfmDMKy62ZedxpPykMNQ0gCiKY
         eQ0149qcYw6wfWWBBVdfVtfdkQthT5ijr5HP+qpCvtjL2Qtey9yyCnUbbnDlQ+zN8bhY
         Kyu0htKy/550txHm22bnOCCmJB26qHGS7G3SJE6dO7kf42pvu8dZ1YM71yccJJ97DidF
         OMDLfAV8VyGu7x/2groFkcpjakZUXNDajX+ssXYoeWCavLZ1zdgVYQ1vHHxmUw8PPlWL
         SstiY3VrO4hh0hwwUqZfdGIEDVu43bra5TIaIm3zYsWFWx34VPbL/oIfnSXX6Foe06df
         G0dQ==
X-Gm-Message-State: AOJu0Yx3HH74lvau3w/wwzDO9YW96YAlbnRAirLDYAxhZ6JqAalNNJHr
	dqg4+GGtJwjJsCif9EZ7cCKoZNC3DtlT82mm+zDnjmYA8kD8/sZ4w++BRN+riCcH7QJUbtSiolx
	1cXHIRNqxM4VQLKU8iEuyM2R8j344jgbKTHCqX13Xk5wENDQfbp08OqJf6u04Ojm1XQiL8iz1tn
	z+HXcaBuE9d3Vj3LV79T0ZBh99S8aelg==
X-Gm-Gg: Acq92OEOoj4YFhWGa8BOpDnw4XJC6BywUwcAk5RLGhMgX75PKc1CL9HqCJWN4RgZp5c
	Dwc2VDnSAXxhM5GA5C+4LgTou1c6uZRg72wX2udhkq1cKWDCd/Iyf8BMtNSq46C9X7PGFrw2/tn
	gIaXlf8bmtJcW5vFDhP+nVy+BOCG1sZa0IFQgmsRxfXvhplMTWMo6ovyEXnTBqrTMtjfGDG8nuB
	idqCHVu/AuKp2wf2fRccPC86S9dAfWJ3bUhZQIjuekkIZaWhHU=
X-Received: by 2002:a05:620a:410f:b0:915:4c90:34fc with SMTP id af79cd13be357-9158a645299mr474823685a.11.1780482125540;
        Wed, 03 Jun 2026 03:22:05 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:915:4c90:34fc with SMTP id
 af79cd13be357-9158a645299mr474818885a.11.1780482125039; Wed, 03 Jun 2026
 03:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603070608.309114-1-zwq2226404116@163.com>
In-Reply-To: <20260603070608.309114-1-zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:21:53 +0200
X-Gm-Features: AVHnY4Jf_VeyqqmKkqRnsZXE1Bfk8QllKlsKD1FlosCDBNy9-wJjka38T5nKSN8
Message-ID: <CAFEp6-24xL80zhK6rgAqHv2z-P7=v1vF-5f0XjfPPmB=2DaSBg@mail.gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: pci_generic: add Rolling Wireless RW135R-GL
 and RW151 support
To: zwq2226404116@163.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        mani@kernel.org, ryazanov.s.a@gmail.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org,
        Wanquan Zhong <wanquan.zhong@fibocom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: lNWwy3gomtqPD0r8FXS4N5BGS9AxqRHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5OSBTYWx0ZWRfXwlGdUXHb487R
 4WYmZ/b4W2vkIWOQhJdfFPScYZrC1qUPjHq5DDHOmOLmtgvG0G9vPCZ24aSxikINiGhD1fDIzXy
 NrrjeR+nr3VAtESYxfhda6fxVbZdoEf9pdu44JoZGdM2U5fZTJPOybSdALRbP81YU7G7gX1QIWf
 Xbdr8/8Dys0JAYY5k+TOGCiIcDSycyFLebuRhGnKsXO4Q0VW0sZspMbIibSInTHl8BKA8aY92xb
 d6OdV3dkdBse7/dBxWaTc52prFXOK/5oKV0EUZX4WqEjF4oOwWwTqXQsl1TufBdTaZkiRnkesE/
 0t57/7dzR29lcr4eQ71lwiAYlPsYkTkJJofjKQHAZd3p+iehVqxsTMAqfucS1QbzzQI/HpifdiI
 nRsD2PTL2HJ5Y7S3X7HuaVA/zJHnd0MA+oigDU4O9D2gM0ntXyEg1EjvblCoGQkTNgFeAXEAHCj
 Mw11EWcM6xj0hfRGf5g==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a20004e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Byx-y9mGAAAA:8 a=6GUwiT5CAAAA:8
 a=qXxXCjKvfSkB11hXGCMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=tp1klI1xYmtLYojU9LVd:22
X-Proofpoint-ORIG-GUID: lNWwy3gomtqPD0r8FXS4N5BGS9AxqRHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030099

On Wed, Jun 3, 2026 at 9:06=E2=80=AFAM <zwq2226404116@163.com> wrote:
>
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support
>
> Add MHI PCIe device configuration for Rolling Wireless modules:
>
> - RW135R-GL (Qualcomm sdx35): MBIM, DIAG, DUN, NMEA, FIREHOSE, ADB, IP_HW=
0
> - RW151 (Qualcomm sdx75): same channel layout with adjusted ring sizes
>
> Register PCI_DEVICE_SUB entries for vendor 0x2099, device 0x1300/1301 on
> QCOM 0x011a (sdx35) and 0x0309 (sdx75) respectively.
>
> Enable the ADB MHI channel in mhi_wwan_ctrl so userspace can access the
> WWAN_PORT_ADB port via the wwan subsystem.

This should be done in a different patch.

>
> Tested-on: Rolling RW135R-GL / RW151 hardware (MHI probe, MBIM, DIAG, ADB=
)

Have you been able to test suspend-to-ram and hibernate?

> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 100 +++++++++++++++++++++++++++++
>  drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
>  2 files changed, 101 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 0884a384b77f..ad166de2d0f3 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -902,6 +902,94 @@ static const struct mhi_pci_dev_info mhi_netprisma_f=
cun69_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_channel_config mhi_rolling_rw135r_channels[] =3D=
 {
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw135r_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw135r_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw135r_channels),
> +       .ch_cfg =3D mhi_rolling_rw135r_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw135r_events),
> +       .event_cfg =3D mhi_rolling_rw135r_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw135r_info =3D {
> +       .edl =3D "qcom/sdx35m/prog_firehose_ddr.elf",
> +       .name =3D "rolling-rw135r",
> +       .config =3D &modem_rolling_rw135r_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .sideband_wake =3D false,
> +       .mru_default =3D 32768,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_channel_config mhi_rolling_rw151_channels[] =3D =
{
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +       MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw151_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_config =3D=
 {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 50000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_info =3D {
> +       .edl =3D "qcom/sdx75m/prog_firehose_lite.elf",
> +       .name =3D "rolling-rw151",
> +       .config =3D &modem_rolling_rw151_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .sideband_wake =3D false,
> +       .mru_default =3D 32768,
> +       .edl_trigger =3D true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the=
 last entry */
>  static const struct pci_device_id mhi_pci_id_table[] =3D {
>         {PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
> @@ -909,6 +997,12 @@ static const struct pci_device_id mhi_pci_id_table[]=
 =3D {
>         /* Telit FN920C04 (sdx35) */
>         {PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fn920c04_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx24_info },
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, =
0x010c),
> @@ -941,6 +1035,12 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE990B40 (sdx72) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe990b40_inf=
o },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1300),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1301),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx75_info },
>         /* QDU100, x100-DU */
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index fa73861db6ad..c0bba94d5c3f 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -264,6 +264,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match=
_table[] =3D {
>         { .chan =3D "DIAG", .driver_data =3D WWAN_PORT_QCDM },
>         { .chan =3D "FIREHOSE", .driver_data =3D WWAN_PORT_FIREHOSE },
>         { .chan =3D "NMEA", .driver_data =3D WWAN_PORT_NMEA },
> +       { .chan =3D "ADB", .driver_data =3D WWAN_PORT_ADB },
>         {},
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
>
> --
> 2.43.0
>
