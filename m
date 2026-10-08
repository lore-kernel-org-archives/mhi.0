Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A74E56C4
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473466; cv=pass; b=Euzzf2k2z8il3WCXCt+lCHsx1RIyv5HgcCLiRkJJkAzrQ4k1BOZOCzW9u3tCEscA6r9y58hymKTeoPUcC0QH6HZBbTpK4simI2rHeMvXdQ8Uy6GyZp7q1CwSmlBFlGl1R3m/cb3ezcY/yyRjMbN86mVBZ7nTqnJA83Z2gf+ieew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473466; c=relaxed/simple;
	bh=6X1oax62eG/jAsEtXsfnS/etOl4pWJtGAdc/PQtvw3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmUetaHSt1ccTN8qSE2rK4PB4CGw2pG3d5nEce9GsOtA5o8hq30pkrq6ZnYvVsZrLVCSSYcwYMPtBXXO9uR7/u3rFEJ54vxkzXj5A8q6e0dmgpkz3MDtc6BjJgZFsH32S8uvIwdnAleDTamsv9CohiuIuUwavrVYzX6KJvk6DlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EChaCNpu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idU/0qOr; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EChaCNpu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idU/0qOr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EW01P2535717
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 15:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+vJLD5+Kwx54quixrsgjaIt1Rx3QDCVYV45JpTScVo=; b=EChaCNpuUMQQhvyk
	R3yJW1xVhc/RmoH4NqZXV0BemSJhUxLxe4ZsvajjzumWVQfOsTV/UBtgrbVJBSY4
	sZwfiLxekJQ0j6Ul3w/Bg9fuFZOS+wuHIR06gdAaBGmkzgtYR5NU6VTdX2lVqwpl
	/SFaWq+pqjiHj52k2dOMXI2y0SZAcT4gtHHAjrN/UDtvhXjV2B/IAuFQzMbVeS7B
	bCEAFC/39sUZiK1N7e+qVErc0UQA55php5KWYD7sNsOUaSqW/uYX2T/imO9z2jEZ
	06Nrl6qugfp4/ttvp5ARe/kG+9Wms11AEruundowhAmQ9pjGoYOOl+bAiMyuwXfv
	q6ebXw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe53j55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 15:31:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso91317216d6.3
        for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 08:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791473463; cv=none;
        d=google.com; s=arc-20260327;
        b=fn8K/L4mXdeipy1HddoVVhcvtJbakWJpQ4aixrN9vnGaXeXukLpKiz02iW1sSX6eVs
         kpHhxz7Xc6xWH0sFzvuu9bROv5F+mKFkJYWEbYUfiUXslGXbGtikjaGQPGOo33JCtQkw
         89hoZG59drI5h1dmWd4Z/31IaBRHu5Hz5wOJSgX6DtstOJbAyxI4zkfuLVxqLYQVBSTq
         9cAJgVtEyp+FWeIeK4gWWFfYxoOjummNJ05tDf7YLOmjJgI+kbovO5ylvymIVP58ZLrs
         6Hwsc5sMImbUDXydjvzkhyykTRNCmelHja9d9Y4Qd2TaABQurj1t02xkJF3+A0inNdyb
         aOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X+vJLD5+Kwx54quixrsgjaIt1Rx3QDCVYV45JpTScVo=;
        fh=fgyfxFwukptHuBYXrz7lIDRzwbWRAa4smv+9kj54okM=;
        b=sthre+aswEtGx+ifDM6w24UGfT0csFJZhnIBh7iKKp9ASUTH6J9WtWb6WM9s9OHnij
         Rca4GgzqPXpjKRaUzyKHuulfeZDQVxKxQttTvkbZ+B65lllJvDmDWc3WVHnSkef5K4lI
         HeXv0UrmDnThRxshJrqjze8enl8bReycJBLIhx4QZB7yrCFXVTyYBzP6b0O9xy6kIMTc
         JH752cxFlsVYLKaApYmcaXJhJ0zU//Jaen7Z9AGlKVwalo5i3bJj9Lcbl4Acj6ylcXZe
         jtZW1iAHJcvotk16BZLkenyFuw58e8ZmQokag4NM7giow01oBoTtmXi8NrMYk6yjLx3K
         hymA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791473463; x=1792078263; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+vJLD5+Kwx54quixrsgjaIt1Rx3QDCVYV45JpTScVo=;
        b=idU/0qOrmYLcQdWoyqkD7TUaWp7pWuAJD4NSg8B432FUYchbpnFPRxkLy3G+zR8nEp
         sDZgiiLmCIPR05D/InjA3ZRj30oANyQo00JqRPjpkpYaytPJYDCE2+VSgjG8GSL2x3hi
         z7slPTRt0ERUDcQBjvEjCNkc68KxXZD3P76eP5800y+j/ueOloGFB9fLFEib0B3Bm4qJ
         aq543Dd+2wwOIQXQTNtyx1NIz1lwBzC0pv+iSdOh7IdArFBRTM7WsfL3qUYckvez5v/i
         a4VMK6zA8so3/NNL5uq7y5PISyOnsLQwt/5qP03atdqwIW/2/u7GSTQOxbXIyaZmIXon
         3yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473463; x=1792078263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+vJLD5+Kwx54quixrsgjaIt1Rx3QDCVYV45JpTScVo=;
        b=Y67xlzQABmSXOMis1Clfv1vIut6L1bpAVvB1MuHMQWiUReCiGN5RTzPuy6IWKZSd5J
         jDgwWM0uZPAdANi651yCnebZ4edzAyGp5Hqg9cj7SkPLuUJ70fbPERUDLCKuELDTfJIG
         RCBVvBIB7F9+nGb4knOHjGlLE/PGGTQcS44BVosx5bbguIkBdYb0KH7946EMyDtb22cv
         U9hZgnhmhLnGrUDP3+WnppH8m4hWHjTG7CpIEu13uOoh7QCUu+0lll5zYQVDfPm/pxtP
         K3J2ogntUM5W/o18nTz7NoD0MBnhsXzCxr6qI/VABMKWfFSRR69zIA5u4pHqiu7rOEvk
         PAvw==
X-Forwarded-Encrypted: i=1; AKwUvBznkWIntfDi8/uw4zBim8SbF4taHHwg2cz/dfaJy9yBN93zPL84l6DnELR1IzKkZsQ0z/A=@lists.linux.dev
X-Gm-Message-State: AFq9FYIkWEORxI2RaJ8HfGltcvdFEnRAUD0z25wILpil2dRg8nKxltRM
	gJipzAiXASCo3Ram0jhNTOutrkfMVp//zmSv9rMsQg35skjBWyP5eD9Oxkn8DFkq3QoNZhp1vmZ
	yKeTtG5NmEG1AlHudAzPRkA1uK9qD7vUSnUR32n9rWqWU5mYfHnjHJN4bIJdHIePDo42Np8v8hU
	RkcG134SJuGIjBEuKWuEOb4raUHxRyIA==
X-Gm-Gg: AYBFou1D8osQQnztZB0URGmkiGToNQznUWM0r7zC4MA9ApgxCcj4L79jP6KkFYKL3wu
	T9aIy5Z91c8M0xyj6+cpfYL2uL71wDB2iwfJjzipgB3jfvheDUrF6grVqgV5TOBM8SjVjPImbqb
	zdFeo4LCfbTjCDr//VVWi9biSYDKpMkiIrF9m7MXEr1GDk4hlEDbOfytc4xJQpelpynj5fD/gng
	cshgm0U6v7lCiT2ogtKSxQbCbQESg1GKV1z2uWOO4IZBTnPTfLaKqmuVI9V8zywyZHSmFOC8Qo=
X-Received: by 2002:a05:6214:509a:b0:914:4bd3:d98a with SMTP id 6a1803df08f44-9199782605fmr102503796d6.14.1791473462386;
        Thu, 08 Oct 2026 08:31:02 -0700 (PDT)
X-Received: by 2002:a05:6214:509a:b0:914:4bd3:d98a with SMTP id
 6a1803df08f44-9199782605fmr102502536d6.14.1791473461449; Thu, 08 Oct 2026
 08:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007182238.1154851-1-peter.hunt@opengear.com> <20261007182238.1154851-3-peter.hunt@opengear.com>
In-Reply-To: <20261007182238.1154851-3-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:30:50 +0200
X-Gm-Features: AclHuK-uVpIAd1gIfe8WTI32KePFUly9kKe_PWHylywQ78pMXbf6tIVIvgmbx3c
Message-ID: <CAFEp6-1gb5KgK5rtz4U80AGvs_g2ZPELUge9Q=bhy4+=coJ-GQ@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/2] net: wwan: mhi_wwan_ctrl: drive DTR/RTS
 via the IP_CTRL channel
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, johannes@sipsolutions.net, mani@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: J9lr0QpDb8PL50SevZ3I3s79LdzdbijG
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac7b738 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=t2vznHeBAAAA:8 a=KKAkSRfTAAAA:8
 a=NXuk3Y-Jq4XySTnNiK8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=V_BghkRpYkFyHJIZkSH6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MSBTYWx0ZWRfXwMEvcJrU3p43
 iWqHfCIP3CYqJxd23mtoy3pVxbvV1KEzGFjJTa6X9PFsyiqLbzzgornuyyd6jPTk42HNN3g9mXN
 Y79bx6AhsRVBDzOuSVDZhuLcWuA2528=
X-Proofpoint-GUID: J9lr0QpDb8PL50SevZ3I3s79LdzdbijG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MSBTYWx0ZWRfX5bgNm9wlW7di
 Bi+V5fe7mUcB1yRPdzytZuv5fHgFUl8cPBAxm6QO2A6fUhcqUkq0g0Kl7lRTB7i6AJb7ZVsFtG3
 XTPzS5uk3gx0P5LE1Yqk3r9QoKDtmiZefIqQYliFNbuJWevEYZs309z+2tWfdUHfa5ikrOYM1r4
 WqbBQMtM/8YLhBoqflUWlSiwLZD4X6/h939Umj4JTJ9mXeW57mFvB49+kPGaUyEu3gtrS1EIRvU
 zvrQvVbpPAfVKeIOAgALX+HPJOq18Hau5RHDytD/VLd3WKlrUOcPGHIxx5BD4TOZMsfGsyK3x3l
 m7g+Y9SjabLHFxJlCOS11n6XV3WEFBWvxupNvdLcSbETlOCXuAt5AWq2n04G96htFr0wUYT0TCq
 klram8Tfg85Zk1/UiM9VavT5ArBNHHdNyuvyEnV0cun9+w4w6fVqJF4zNGGW3si6WJZD0+Hrm54
 nkI7Iw8+j0Lls5HuSOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080061

On Wed, Oct 7, 2026 at 8:23=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com>=
 wrote:
>
> Qualcomm/Sierra SDX55/SDX65 modems withhold unsolicited AT result codes
> (URCs such as +CREG, and the +DMI OMA-DM/LwM2M session indications) on
> an AT port until the host asserts DTR. mhi_wwan_ctrl exposed the AT
> (DUN) ports but had no way to signal DTR, so URCs never reached
> userspace.
>
> Carry the host serial-control lines to the modem over the dedicated
> IP_CTRL MHI channel, which this module now also binds. IP_CTRL uses a
> separate mhi_driver with its own callbacks so the AT/QMI/MBIM data path
> is untouched; the control-channel device for each MHI controller is
> tracked in a small registry so an AT port drives the IP_CTRL channel of
> its own modem (multiple modems are supported).
>
> The IP_CTRL channel has to be declared in the controller's channel config
> for this driver to bind. For the Sierra EM919x/EM929x this is done by
> commit 83c29a55b89e ("bus: mhi: host: pci_generic: Add IP_CTRL channel
> for Sierra EM919x/EM929x") in the MHI tree. On controllers that do not
> declare IP_CTRL the driver does not bind and ->dtr_rts is a no-op.
>
> The wwan core (patch 1) raises DTR/RTS on first open and drops them on
> last close (if HUPCL is set) for any AT port whose driver implements
> ->dtr_rts, so no open/close handling is needed here. The new ->dtr_rts
> op lets userspace assert or de-assert them via
> TIOCMSET/TIOCMBIC/TIOCMBIS. Received device->host serial state messages
> are silently discarded; a single recycled sink buffer keeps the IP_CTRL
> DL ring live so the modem's transmit path does not stall.
>
> ->dtr_rts is void, following the tty_port_operations model it is modelled
> on. Delivery is best-effort: at_data.mdmbits always reflects the committe=
d
> userspace intent for TIOCMGET regardless of whether the IP_CTRL message w=
as
> queued, and the next ioctl or open/close cycle will resynchronise the mod=
em
> state. If requeueing the DL sink buffer fails with a transient -ENOMEM it
> is retried from a work item, so the DL ring does not stay empty.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>
> ---
> v8: No changes
> v7: Retry a failed DL sink buffer requeue from a delayed work item on
>     -ENOMEM, and log other failures. Note the dependency on the IP_CTRL
>     channel entry in pci_generic, now in the MHI tree. Both from the
>     Sashiko review of v6
> v6: Rebase onto net-next. Allocate the IP_CTRL DL sink buffer separately
>     instead of embedding it in struct mhi_wwan_dtr, so DMA cache
>     maintenance on non-coherent platforms cannot touch neighbouring field=
s.
>     Do not requeue the sink buffer from the DL callback when the transfer
>     completes with an error (e.g. -ENOTCONN during channel teardown)
> v5: Implement ->dtr_rts(port, mdmbits) and drive DTR and RTS
>     independently. Pre-queue an RX sink buffer in probe and requeue it in
>     the DL callback so the IP_CTRL DL ring does not run empty and stall
>     the modem's transmit path
> v4: Add dev_dbg when IP_CTRL channel is not enumerated for this controlle=
r
>     and when mhi_queue_buf fails, to aid diagnosis of the "URCs missing"
>     case on controllers that do not declare IP_CTRL
> v3: Remove is_at_port, implement ->dtr_rts instead of ->tiocmset,
>     open/close DTR raise/drop handled by wwan core (Loic Poulain)
> ---
>  drivers/net/wwan/mhi_wwan_ctrl.c | 239 ++++++++++++++++++++++++++++++-
>  1 file changed, 238 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index a31d8540fbb8..feb9c03b6392 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -1,8 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2021, Linaro Ltd <loic.poulain@linaro.org> */
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/mhi.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/termios.h>
> +#include <linux/workqueue.h>
>  #include <linux/wwan.h>
>
>  /* MHI wwan flags */
> @@ -14,6 +19,32 @@ enum mhi_wwan_flags {
>
>  #define MHI_WWAN_MAX_MTU       0x8000
>
> +/* IP_CTRL channel message that sets the modem's DTR/RTS control lines *=
/
> +struct mhi_dtr_ctrl_msg {
> +       __le32 preamble;
> +       __le32 msg_id;
> +       __le32 dest_id;
> +       __le32 size;
> +       __le32 msg;
> +} __packed;
> +
> +#define MHI_DTR_CTRL_MAGIC     0x4C525443      /* 'CTRL' */
> +#define MHI_DTR_MSG_DTR                BIT(0)
> +#define MHI_DTR_MSG_RTS                BIT(1)
> +#define MHI_DTR_HOST_STATE     0x10
> +
> +/* Per-controller IP_CTRL channel, used to signal DTR/RTS to that modem =
*/
> +struct mhi_wwan_dtr {
> +       struct mhi_controller *cntrl;
> +       struct mhi_device *mhi_dev;
> +       struct list_head node;
> +       struct mhi_dtr_ctrl_msg *rx_buf; /* DL sink, separate allocation =
for DMA safety */
> +       struct delayed_work rx_refill; /* retries a failed sink buffer re=
queue */
> +};
> +
> +static LIST_HEAD(mhi_wwan_dtr_list);
> +static DEFINE_MUTEX(mhi_wwan_dtr_lock);
> +
>  struct mhi_wwan_dev {
>         /* Lower level is a mhi dev, upper level is a wwan port */
>         struct mhi_device *mhi_dev;
> @@ -103,6 +134,61 @@ static void mhi_wwan_ctrl_refill_work(struct work_st=
ruct *work)
>         }
>  }
>
> +/* Signal the modem's DTR/RTS lines over its own controller's IP_CTRL ch=
annel */
> +static int mhi_wwan_ctrl_send_dtr(struct mhi_wwan_dev *mhiwwan, unsigned=
 int mdmbits)
> +{
> +       struct mhi_controller *cntrl =3D mhiwwan->mhi_dev->mhi_cntrl;
> +       struct mhi_device *ctrl_dev =3D NULL;
> +       struct mhi_dtr_ctrl_msg *dtr_msg;
> +       struct mhi_wwan_dtr *dtr;
> +       u32 msg =3D 0;
> +       int ret;
> +
> +       guard(mutex)(&mhi_wwan_dtr_lock);
> +
> +       list_for_each_entry(dtr, &mhi_wwan_dtr_list, node) {
> +               if (dtr->cntrl =3D=3D cntrl) {
> +                       ctrl_dev =3D dtr->mhi_dev;
> +                       break;
> +               }
> +       }
> +       if (!ctrl_dev) {
> +               dev_dbg(&mhiwwan->mhi_dev->dev,
> +                       "IP_CTRL not enumerated; DTR/RTS not signalled to=
 modem\n");
> +               return 0;
> +       }
> +
> +       dtr_msg =3D kzalloc_obj(*dtr_msg);
> +       if (!dtr_msg)
> +               return -ENOMEM;
> +
> +       if (mdmbits & TIOCM_DTR)
> +               msg |=3D MHI_DTR_MSG_DTR;
> +       if (mdmbits & TIOCM_RTS)
> +               msg |=3D MHI_DTR_MSG_RTS;
> +
> +       dtr_msg->preamble =3D cpu_to_le32(MHI_DTR_CTRL_MAGIC);
> +       dtr_msg->msg_id =3D cpu_to_le32(MHI_DTR_HOST_STATE);
> +       dtr_msg->dest_id =3D cpu_to_le32(mhiwwan->mhi_dev->ul_chan_id);
> +       dtr_msg->size =3D cpu_to_le32(sizeof(__le32));
> +       dtr_msg->msg =3D cpu_to_le32(msg);
> +
> +       ret =3D mhi_queue_buf(ctrl_dev, DMA_TO_DEVICE, dtr_msg, sizeof(*d=
tr_msg),
> +                           MHI_EOT);
> +       if (ret) {
> +               dev_dbg(&mhiwwan->mhi_dev->dev,
> +                       "failed to queue DTR/RTS signal: %d\n", ret);
> +               kfree(dtr_msg);
> +       }
> +
> +       return ret;
> +}
> +
> +static void mhi_wwan_ctrl_dtr_rts(struct wwan_port *port, unsigned int m=
dmbits)
> +{
> +       mhi_wwan_ctrl_send_dtr(wwan_port_get_drvdata(port), mdmbits);
> +}
> +
>  static int mhi_wwan_ctrl_start(struct wwan_port *port)
>  {
>         struct mhi_wwan_dev *mhiwwan =3D wwan_port_get_drvdata(port);
> @@ -163,6 +249,7 @@ static const struct wwan_port_ops wwan_pops =3D {
>         .start =3D mhi_wwan_ctrl_start,
>         .stop =3D mhi_wwan_ctrl_stop,
>         .tx =3D mhi_wwan_ctrl_tx,
> +       .dtr_rts =3D mhi_wwan_ctrl_dtr_rts,
>  };
>
>  static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
> @@ -255,6 +342,118 @@ static void mhi_wwan_ctrl_remove(struct mhi_device =
*mhi_dev)
>         kfree(mhiwwan);
>  }
>
> +/* IP_CTRL channel driver, bound separately so the data-port path is unt=
ouched */
> +static void mhi_wwan_dtr_ul_xfer_cb(struct mhi_device *mhi_dev,
> +                                   struct mhi_result *mhi_result)
> +{
> +       /* MHI core has done with the buffer, release it */
> +       kfree(mhi_result->buf_addr);
> +}
> +
> +/* Requeue the single DL sink buffer so the IP_CTRL DL ring never runs e=
mpty.
> + * A transient mapping failure is retried from a work item, other errors=
 mean
> + * the channel is going away and the next probe queues a fresh buffer.
> + */
> +static void mhi_wwan_dtr_queue_rx(struct mhi_wwan_dtr *dtr)
> +{
> +       int ret;
> +
> +       ret =3D mhi_queue_buf(dtr->mhi_dev, DMA_FROM_DEVICE, dtr->rx_buf,
> +                           sizeof(*dtr->rx_buf), MHI_EOT);
> +       if (ret =3D=3D -ENOMEM) {
> +               dev_warn_ratelimited(&dtr->mhi_dev->dev,
> +                                    "failed to requeue IP_CTRL RX buffer=
, retrying\n");
> +               schedule_delayed_work(&dtr->rx_refill, msecs_to_jiffies(1=
00));
> +       } else if (ret) {
> +               dev_dbg(&dtr->mhi_dev->dev,
> +                       "failed to requeue IP_CTRL RX buffer: %d\n", ret)=
;
> +       }
> +}
> +
> +static void mhi_wwan_dtr_refill_work(struct work_struct *work)
> +{
> +       struct mhi_wwan_dtr *dtr =3D container_of(to_delayed_work(work),
> +                                               struct mhi_wwan_dtr, rx_r=
efill);
> +
> +       mhi_wwan_dtr_queue_rx(dtr);
> +}
> +
> +static void mhi_wwan_dtr_dl_xfer_cb(struct mhi_device *mhi_dev,
> +                                   struct mhi_result *mhi_result)
> +{
> +       struct mhi_wwan_dtr *dtr =3D dev_get_drvdata(&mhi_dev->dev);
> +
> +       /* Channel is being torn down (e.g. -ENOTCONN), do not requeue */
> +       if (mhi_result->transaction_status &&
> +           mhi_result->transaction_status !=3D -EOVERFLOW)
> +               return;
> +
> +       /* Modem serial state not needed, requeue the sink buffer to keep=
 DL ring live */
> +       mhi_wwan_dtr_queue_rx(dtr);
> +}
> +
> +static int mhi_wwan_dtr_probe(struct mhi_device *mhi_dev,
> +                             const struct mhi_device_id *id)
> +{
> +       struct mhi_wwan_dtr *dtr;
> +       int ret;
> +
> +       dtr =3D kzalloc_obj(*dtr);
> +       if (!dtr)
> +               return -ENOMEM;
> +
> +       dtr->rx_buf =3D kmalloc_obj(*dtr->rx_buf);
> +       if (!dtr->rx_buf) {
> +               ret =3D -ENOMEM;
> +               goto err_free_dtr;
> +       }
> +       INIT_DELAYED_WORK(&dtr->rx_refill, mhi_wwan_dtr_refill_work);
> +
> +       ret =3D mhi_prepare_for_transfer(mhi_dev);
> +       if (ret)
> +               goto err_free_buf;
> +
> +       dtr->cntrl =3D mhi_dev->mhi_cntrl;
> +       dtr->mhi_dev =3D mhi_dev;
> +       dev_set_drvdata(&mhi_dev->dev, dtr);
> +
> +       ret =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, dtr->rx_buf,
> +                           sizeof(*dtr->rx_buf), MHI_EOT);
> +       if (ret)
> +               goto err_unprepare;
> +
> +       mutex_lock(&mhi_wwan_dtr_lock);
> +       list_add(&dtr->node, &mhi_wwan_dtr_list);
> +       mutex_unlock(&mhi_wwan_dtr_lock);
> +
> +       return 0;
> +
> +err_unprepare:
> +       mhi_unprepare_from_transfer(mhi_dev);
> +err_free_buf:
> +       kfree(dtr->rx_buf);
> +err_free_dtr:
> +       kfree(dtr);
> +       return ret;
> +}
> +
> +static void mhi_wwan_dtr_remove(struct mhi_device *mhi_dev)
> +{
> +       struct mhi_wwan_dtr *dtr =3D dev_get_drvdata(&mhi_dev->dev);
> +
> +       mutex_lock(&mhi_wwan_dtr_lock);
> +       list_del(&dtr->node);
> +       mutex_unlock(&mhi_wwan_dtr_lock);
> +
> +       mhi_unprepare_from_transfer(mhi_dev);
> +       /* No DL callbacks after unprepare, and a pending retry now fails=
 on
> +        * the disabled channel without rescheduling
> +        */
> +       cancel_delayed_work_sync(&dtr->rx_refill);

This function ensures that the work is either cancelled or has
completed, but it does not prevent it from being requeued
concurrently. That can happen when rx_refill is rescheduled from
mhi_wwan_dtr_queue_rx(). Using disable_delayed_work_sync() here would
be preferable.


> +       kfree(dtr->rx_buf);
> +       kfree(dtr);
> +}
> +
>  static const struct mhi_device_id mhi_wwan_ctrl_match_table[] =3D {
>         { .chan =3D "DUN", .driver_data =3D WWAN_PORT_AT },
>         { .chan =3D "DUN2", .driver_data =3D WWAN_PORT_AT },
> @@ -278,7 +477,45 @@ static struct mhi_driver mhi_wwan_ctrl_driver =3D {
>         },
>  };
>
> -module_mhi_driver(mhi_wwan_ctrl_driver);
> +static const struct mhi_device_id mhi_wwan_dtr_match_table[] =3D {
> +       { .chan =3D "IP_CTRL" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_wwan_dtr_match_table);
> +
> +static struct mhi_driver mhi_wwan_dtr_driver =3D {
> +       .id_table =3D mhi_wwan_dtr_match_table,
> +       .remove =3D mhi_wwan_dtr_remove,
> +       .probe =3D mhi_wwan_dtr_probe,
> +       .ul_xfer_cb =3D mhi_wwan_dtr_ul_xfer_cb,
> +       .dl_xfer_cb =3D mhi_wwan_dtr_dl_xfer_cb,
> +       .driver =3D {
> +               .name =3D "mhi_wwan_dtr",
> +       },
> +};
> +
> +static int __init mhi_wwan_ctrl_init(void)
> +{
> +       int ret;
> +
> +       ret =3D mhi_driver_register(&mhi_wwan_dtr_driver);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D mhi_driver_register(&mhi_wwan_ctrl_driver);
> +       if (ret)
> +               mhi_driver_unregister(&mhi_wwan_dtr_driver);
> +
> +       return ret;
> +}
> +module_init(mhi_wwan_ctrl_init);
> +
> +static void __exit mhi_wwan_ctrl_exit(void)
> +{
> +       mhi_driver_unregister(&mhi_wwan_ctrl_driver);
> +       mhi_driver_unregister(&mhi_wwan_dtr_driver);
> +}
> +module_exit(mhi_wwan_ctrl_exit);
>
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("MHI WWAN CTRL Driver");
> --
> 2.43.0
>
