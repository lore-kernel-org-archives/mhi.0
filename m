Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCAB3E8C7A
	for <mhi@lists.linux.dev>; Thu,  5 Feb 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770300512; cv=pass; b=pWoM8Q4uoQm6ha4nVpggsuYabMduaQEaYHyiULbBKxaPlcIHkgDgWCsOCJ0ZLd+wLaOpI/IZ0DnNvpP7iOyAn6bG8xNf7JB6vUpIqDtpniLu5e6+Qt8FUQazlOOXsKOD9N/caoUoy8+LyBZ+Z/yzVDeh/EkLPoR4DX1r6KREdHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770300512; c=relaxed/simple;
	bh=zvrwgPZFz3YS0Diur9aNddZEBJJcuOI2hK7uxTbBlOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBjLHjzjNseJ9sGhpV1BInPF6kcd7UUthAhT2dRGiBfRSr1KyjYwAts2b/NCaYktDpmSCoBv8dPIe+oBMX5oNSUr57jRyVZm3ur/AoablI5Gj//1SIC9iVQ9sBFk4Ut1INgQJLTDWjOg5jwdOfMUztBGCJ5GvHA70QKV5F2J+Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKNS7N2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBuW8Qtb; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKNS7N2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBuW8Qtb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157moXN2945648
	for <mhi@lists.linux.dev>; Thu, 5 Feb 2026 14:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=; b=WKNS7N2fRPJKf+k0
	58E6ODAGpMpk2ZO2aq22UaW3BtpVXCsqyCi2aqr9/FVCitolicqarlbDaTeOrY4k
	+SRcbOBtrv6+3/KvIOqK5kZ79io2z+vYpHVF5qzWjrSvdlle3uc+4Amp9lWWc6K4
	TCjG8PzLJ73WABTurV+jhW4gE8hM5sdu5GsdTw6NdLkenrI7rVDfDc/MxGp0kg7C
	FlQk63aiqq88hHh10w7i8GSx5gCDx3x7NAEJiHrnKCuUvCTKkqmc4oHEoXmMmicD
	lzejCOB76S+RUhSIK7O8NcHL/B7ira+bOuGpDAoRsmAX/ut99Y5XiwfTeS7wRWhl
	eLa/HA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55s4p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 05 Feb 2026 14:08:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6cfd52556so319897585a.0
        for <mhi@lists.linux.dev>; Thu, 05 Feb 2026 06:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770300510; cv=none;
        d=google.com; s=arc-20240605;
        b=XJ4T8kwjW6H0UarhyznbS9zneslG2RGsek+Ka11rICSHk1WEO3DVsqlEENyDj/PL9J
         /5KIfJh/EuaKVT6eam6d2hdzFk3LjQwpuU+1RxxibjnazREj6fM2V+YZSsPDCAqSY5qG
         tCcSwSdGi+eorDGPZJdshG7iviSUYlXBAyhO3M72opT0I+9kwU3VVUj6I8LMIskEdzPU
         cO+phklzKghSdfIGYyWDHa26/vx3sC1k+CeZ1Kppif5ExBDv4t/fZzyfsEDS+yJP/lGy
         9segyE8XqsUmazgyLQWh341gsIEiJhNWiLCLnTv8lzDPgdCqugBJVvsKYUJQ4pSTIslU
         PeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=;
        fh=KnzZioxsdD0i1iAm9UU144bpZk85gbTHIzxyhviWiWI=;
        b=Bop6R7aKicZjPh/LT0hORumRxS7wVqVpMjzkX/ahqu+q7jMAoS9Sx8nLuImq62Z/vf
         XS9ck0Eu0Rfs0h+B6pWyaV6Qz/cbBER48d/MbeVDAsQV8+G6Ocn+gh8uj8vBV2Fj2bkG
         GYbBMjFdhWv3zbZaVgWXvmaFF7q/P/V0GPuZUhRvIPN5/I3yRZ353KSNpP05D9V+Srm2
         ZGwJtQ0bxilyMJCLVp89otDGBVaepVD0CnLGGXlp1n6AJEhFH0RGgiJvRM79v1/VQq+U
         FMwuu4+nnG9yFSwoS2r2WKQt+gRWi4TE2BmoT6sfSxoN2tb9F3kSkB2iE3mIGWVsfqbi
         MumA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770300510; x=1770905310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=;
        b=SBuW8QtbYtl6Z6TFa5kZHMdXypEiftZXAWVguWqhpoq41oxhe+nYjqXX7dzBfx14UW
         FH2v83Ha0hmoUXoqswmvqTmaJF0ejilICc26INt6Ba9wC2MO3FJB2DCbL/G0PVkuRtBC
         FvfUFkZa/Ruukp6EulOVTS6b0cT3UCqN83AEd/1CvB71Rn48n2kx7q6G1+mZhxwo8l35
         l8FNgVbZRPBFg2/8as2p4nEOnIyyOtWfZTzcZsmgumMvqrLYwlu069GHNPgfuzwosj0d
         yC8sLeI30CND6EUDDtDwkQh+ZXOWyy8gQ9j4tpfAsPbVp14ipbo6RIi3/DVCRnZvZBLX
         SMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770300510; x=1770905310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=;
        b=ZTptQfZ2MbMxjugfEA/3ZGEnD4f6Z3vELHh5wlTk98uKBx64kwltGMgp/TnncnSEK9
         dG1JURzX4mH+oCIsd24hcPeP871ipkNeZzHKlmv/MltMA6Lw1HH4NH0/FDbTJN4WfjHx
         UJlUH4SSYSWPgf4kTpo8HJ/C/RQ0yWWUHHTv2cY5GR/VkqoSIoGsFWTv1jp5s27dZqp+
         IsGv8Z5SSupYYOVKNy0BjCwOKv1sIgz3h8xIBBGaR1fYVZu0XK/3fInIfDGqD9rjaYpl
         qs+NwDn9I8WyG2xrt3nlvXJvAZK8cexoHhqpXrLiBpy0mlagCEwYkTAH1XhbOooIfQeE
         W4MA==
X-Forwarded-Encrypted: i=1; AJvYcCUf4CDrDJFph/IE1k0EqjnN53ekcaTj+fDvIVoEM9CBX/guJBpvd3zMIpGTstx9wzJeanM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyU2WKi5ZTyXN9ByKNLfTfvRsBIIcqrHMUZENwRbilxA5jGkOtV
	uU7lENVNn2Lb5qNOc6VxyX59FaPe5p4nocLDQKF6urgzmavJY3ghCaelGI9V0EgzCAd4Rt6hqQt
	yuAsxh9xl9FpS/W91AA9HRgOnlvACBLHbmgGqYJO6Ppwr9WrX1MNGby1e4pBQNi74tZTspdaHbZ
	xrXS3l20CMPksv1JcT9hIFPce8Ctt2VQ==
X-Gm-Gg: AZuq6aIKqOSkNimQqGWAUQycEedgwVp4gNmCRyzAG1b51NMN3xfUVVxnGx/z80qLeFt
	czKR5HAvAISF/yiPpXXsIDO611DRTuRgeNTqq/ri75L76F1TWY2q7+A9ltuz4k+MhuGIssS7IMe
	CBpB59oYXBv+Y0BfyHr2D/wDrHhFp/tDTNK603pCU8Gzo+3Uxouhy7/eP+Ze1ADbyq3xxlp/18u
	wUJIB/w2lc5GVipZC13Yx9To7o=
X-Received: by 2002:a05:620a:4005:b0:8c7:1271:f336 with SMTP id af79cd13be357-8ca40b65b93mr362708685a.2.1770300509842;
        Thu, 05 Feb 2026 06:08:29 -0800 (PST)
X-Received: by 2002:a05:620a:4005:b0:8c7:1271:f336 with SMTP id
 af79cd13be357-8ca40b65b93mr362701185a.2.1770300509158; Thu, 05 Feb 2026
 06:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
 <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
In-Reply-To: <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 15:08:16 +0100
X-Gm-Features: AZwV_QhQg3zAGXsp_X9dDCu7sweoDhvjW4gtGrMn8QDgLlXYaIhuuEdmBlb6JyU
Message-ID: <CAFEp6-0Q7Cy9d5=ZEsct3Y2G3C2w_47CM0FxYsE6YkdksrKhcw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] net: mhi: Enable Ethernet interface support
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEwNiBTYWx0ZWRfXwfqPFr15ro8k
 +A2PtB4zQed3ZfeTH6LmTEGAfYWKjL0hYbueHgFpMJdwiFZTxf4/vqQr1SchNZ5WXKC7UqsBLM3
 Y22/NmxlrUrlX5xi7sg15jfYbBgHJe3vBnjW+zPgE7eqGeHFvK4XLxynoyt1vvh5S5GU+BpxonW
 bJLdlroWabD1QrsUymXbtI/i2TDWWrDKQOqPHP/HGv5uVI08FfhVEqtTDa3GXnM+0zE/XnHfa9c
 Y3t7TDErcYc0hYH4MPCia8LmlbZfQue2psAqsEW/2GX9N3wnCOVQ/01jeLH4WA71JeDPGFBF7OW
 sm4irf326XrP6NpHHVMp3xnIFlKD+EcC4BNuqA/RPxsnlz+KJxsvSQFhpNFELyva0kaf3Ihs2V+
 0R1aH0gjdJ0VC6Rn3CpuF6Ib93j70cRqO/noxW/SEjodIx7pwgUuq81Q7xIpiqKWDBPmYg/IOJ9
 k5RJujkWocXkV5I8uew==
X-Proofpoint-ORIG-GUID: _-Zq_TEhtWm95UGE4_L47ZEqY380YCo0
X-Proofpoint-GUID: _-Zq_TEhtWm95UGE4_L47ZEqY380YCo0
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=6984a45f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=V8gMpkdfN-3uPoaNsyEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050106

Hi Vivek,

On Thu, Feb 5, 2026 at 11:35=E2=80=AFAM Vivek Pernamitta
<vivek.pernamitta@oss.qualcomm.com> wrote:
>
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>
> Add support to configure a new client as Ethernet type over MHI by
> setting "mhi_device_info.ethernet_if =3D true". Create a new Ethernet
> interface named eth%d. This complements existing NET driver support.
>
> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
> M-plane, NETCONF, and S-plane components.
>
> M-plane:
> Implement DU M-Plane software for non-real-time O-RAN management
> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
> models. Provide capability exchange, configuration management,
> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
> R004-v18.00.
>
> NETCONF:
> Use NETCONF protocol for configuration operations such as fetching,
> modifying, and deleting network device configurations.
>
> S-plane:
> Support frequency and time synchronization between O-DUs and O-RUs
> using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
> L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
> UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
> O-RAN.WG4.CUS.0-R003-v12.00.
>
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
>  drivers/net/mhi_net.c | 75 ++++++++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 62 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..fbec10c1ba9faf1ccf049b808=
e9d391800320989 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>
> +#include <linux/etherdevice.h>
>  #include <linux/if_arp.h>
>  #include <linux/mhi.h>
>  #include <linux/mod_devicetable.h>
> @@ -38,10 +39,12 @@ struct mhi_net_dev {
>         u32 rx_queue_sz;
>         int msg_enable;
>         unsigned int mru;
> +       bool ethernet_if;
>  };
>
>  struct mhi_device_info {
>         const char *netname;
> +       bool ethernet_if;
>  };
>
>  static int mhi_ndo_open(struct net_device *ndev)
> @@ -119,11 +122,29 @@ static void mhi_ndo_get_stats64(struct net_device *=
ndev,
>         } while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start=
));
>  }
>
> +static int mhi_mac_address(struct net_device *dev, void *p)
> +{
> +       if (dev->type =3D=3D ARPHRD_ETHER)
> +               return eth_mac_addr(dev, p);
> +
> +       return 0;
> +}
> +
> +static int mhi_validate_address(struct net_device *dev)
> +{
> +       if (dev->type =3D=3D ARPHRD_ETHER)
> +               return eth_validate_addr(dev);
> +
> +       return 0;
> +}
> +
>  static const struct net_device_ops mhi_netdev_ops =3D {
>         .ndo_open               =3D mhi_ndo_open,
>         .ndo_stop               =3D mhi_ndo_stop,
>         .ndo_start_xmit         =3D mhi_ndo_xmit,
>         .ndo_get_stats64        =3D mhi_ndo_get_stats64,
> +       .ndo_set_mac_address    =3D mhi_mac_address,
> +       .ndo_validate_addr      =3D mhi_validate_address,
>  };
>
>  static void mhi_net_setup(struct net_device *ndev)
> @@ -140,6 +161,13 @@ static void mhi_net_setup(struct net_device *ndev)
>         ndev->tx_queue_len =3D 1000;
>  }
>
> +static void mhi_ethernet_setup(struct net_device *ndev)
> +{
> +       ndev->netdev_ops =3D &mhi_netdev_ops;
> +       ether_setup(ndev);
> +       ndev->max_mtu =3D ETH_MAX_MTU;
> +}
> +
>  static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
>                                        struct sk_buff *skb)
>  {
> @@ -209,16 +237,22 @@ static void mhi_net_dl_callback(struct mhi_device *=
mhi_dev,
>                         mhi_netdev->skbagg_head =3D NULL;
>                 }
>
> -               switch (skb->data[0] & 0xf0) {
> -               case 0x40:
> -                       skb->protocol =3D htons(ETH_P_IP);
> -                       break;
> -               case 0x60:
> -                       skb->protocol =3D htons(ETH_P_IPV6);
> -                       break;
> -               default:
> -                       skb->protocol =3D htons(ETH_P_MAP);
> -                       break;
> +               if (mhi_netdev->ethernet_if) {
> +                       skb_copy_to_linear_data(skb, skb->data,
> +                                               mhi_res->bytes_xferd);

What is the purpose of the above?




> +                       skb->protocol =3D eth_type_trans(skb, mhi_netdev-=
>ndev);
> +               } else {
> +                       switch (skb->data[0] & 0xf0) {
> +                       case 0x40:
> +                               skb->protocol =3D htons(ETH_P_IP);
> +                               break;
> +                       case 0x60:
> +                               skb->protocol =3D htons(ETH_P_IPV6);
> +                               break;
> +                       default:
> +                               skb->protocol =3D htons(ETH_P_MAP);
> +                               break;
> +                       }
>                 }
>
>                 u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
> @@ -301,11 +335,14 @@ static void mhi_net_rx_refill_work(struct work_stru=
ct *work)
>                 schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>  }
>
> -static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device=
 *ndev)
> +static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device=
 *ndev, bool eth_dev)
>  {
>         struct mhi_net_dev *mhi_netdev;
>         int err;
>
> +       if (eth_dev)
> +               eth_hw_addr_random(ndev);
> +
>         mhi_netdev =3D netdev_priv(ndev);
>
>         dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
> @@ -313,6 +350,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev=
, struct net_device *ndev)
>         mhi_netdev->mdev =3D mhi_dev;
>         mhi_netdev->skbagg_head =3D NULL;
>         mhi_netdev->mru =3D mhi_dev->mhi_cntrl->mru;
> +       mhi_netdev->ethernet_if =3D eth_dev;
>
>         INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work)=
;
>         u64_stats_init(&mhi_netdev->stats.rx_syncp);
> @@ -356,13 +394,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev=
,
>         int err;
>
>         ndev =3D alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
> -                           NET_NAME_PREDICTABLE, mhi_net_setup);
> +                           NET_NAME_ENUM, info->ethernet_if ?
> +                           mhi_ethernet_setup : mhi_net_setup);
>         if (!ndev)
>                 return -ENOMEM;
>
>         SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>
> -       err =3D mhi_net_newlink(mhi_dev, ndev);
> +       err =3D mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
>         if (err) {
>                 free_netdev(ndev);
>                 return err;
> @@ -380,10 +419,17 @@ static void mhi_net_remove(struct mhi_device *mhi_d=
ev)
>
>  static const struct mhi_device_info mhi_hwip0 =3D {
>         .netname =3D "mhi_hwip%d",
> +       .ethernet_if =3D false,
>  };
>
>  static const struct mhi_device_info mhi_swip0 =3D {
>         .netname =3D "mhi_swip%d",
> +       .ethernet_if =3D false,
> +};
> +
> +static const struct mhi_device_info mhi_eth0 =3D {
> +       .netname =3D "eth%d",
> +       .ethernet_if =3D true,
>  };
>
>  static const struct mhi_device_id mhi_net_id_table[] =3D {
> @@ -391,6 +437,9 @@ static const struct mhi_device_id mhi_net_id_table[] =
=3D {
>         { .chan =3D "IP_HW0", .driver_data =3D (kernel_ulong_t)&mhi_hwip0=
 },
>         /* Software data PATH (to modem CPU) */
>         { .chan =3D "IP_SW0", .driver_data =3D (kernel_ulong_t)&mhi_swip0=
 },
> +       { .chan =3D "IP_SW1", .driver_data =3D (kernel_ulong_t)&mhi_swip0=
 },
> +       { .chan =3D "IP_ETH0", .driver_data =3D (kernel_ulong_t)&mhi_eth0=
 },
> +       { .chan =3D "IP_ETH1", .driver_data =3D (kernel_ulong_t)&mhi_eth0=
 },
>         {}
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);
>
> --
> 2.34.1
>
>
