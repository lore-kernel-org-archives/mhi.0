Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AE13D6479
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180073; cv=pass; b=Qvk+cyltTFgivdX9AH4pgCSBbVygBcwO4Vc7VPA9MkbqUn9O5glfB0lfqEBE3UkVp/Zu5TozL3So5pUmzU6g48ySIh+MmNmIo0QzYRcu+QCgVGMtJ73pTBvdnUeu2zhhDs6TQX00okCEARjMlJ0HFhuh0AqcPdO2N1IRi1q9hdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180073; c=relaxed/simple;
	bh=OsxrfJdIwI6/les9N6UKoyK/gkJ1cdVxuLttKjePmP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPaCjL5s+JefEGg3fKRm5cOre2o+R7S3exY7quHsTZ+w9R5uxb38sqKvCpfORc4kvAFMUlj7ryGGP1oC+9oy34vdCF87A5Rurhq2Moe5gRpWSSMG/I2klf3H4snGeP0jbxNe831X0AqV1RxUOQmjb+RcFShYMlu49gl9ejBBLio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK5zcsHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8soamB1; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK5zcsHJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8soamB1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeatr2168826
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 19:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLoUVij4D6Xdoj+d66XdloNJ1a24cAv/lHqAd3GbIW4=; b=VK5zcsHJPmHvIibK
	LFjOfE8gKyh/5KYlEtP9zkL83js+5JTfX0LrTPtTE4z8qcN2skHGbVxbv6fQt6xY
	YsRfkcnQVdT+bYmQlrdZWwQDJ66ITsPLpq0rHbsYu5f8f5Ya4MNOKn42+0kWiyDY
	f2KnUYZ5Vy45KRNsnWY00J29PTsXP0MvSm4gkqQVb7cuXgCo75HHroRYJpTpWpZx
	4ekVt5zZdf7ujocT+hWrF/AudewMGCsnsEw14azhFo2V0jdz6843KszIgOih1iYA
	pD+UCAeVglmhwbKu0+HCdAQpSz4/lfgAKYCdtQADEeIKPqhYizZn94JdN0JZd9qW
	sCWoEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur24cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 19:47:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso59233685a.3
        for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 12:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792180060; cv=none;
        d=google.com; s=arc-20260327;
        b=atXsSEZaRc4DUaVCb8IbmAiyVWB7FGRcGTN4B7CjB4UC9+4LU+fsOyyve7yEtAPxQa
         hHwYs5phEwsXwjH5vevvzyFQwiz8eCNjmTp6GUkFoyTtiJs7HiFg6oPcPGTh4lb/eThC
         UEwWsQERbfCFGuE84KASU1rztSuS1twuSqDL1gfF3tCk8wkq4X+DrtVTxQFvEjDyktV5
         SKxehesMBS7kOxWXkQUVxWcoknG8DHI//S7DUaZaqEI0Zu7fEVOm6axUOE5JT5CmKRe+
         SaKWyZv2olZrIC4/xOL7EApHS41VaosXlT3zUtiILIH8MevvcpAZug0BrYGhiy1sNZeE
         hYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLoUVij4D6Xdoj+d66XdloNJ1a24cAv/lHqAd3GbIW4=;
        fh=WX26DxKWdha+Y6cfuuaid20vLKS81KxlDyhqAgDysmE=;
        b=BrT1oRc+CfKrnOiZstlXRjVtmmElk2yqlrZjWQMg+TUYewdLJ8bC6Bu1sgZU1qIfpr
         SYY+FDyptsd/VD5KbaqcSXUM21tcHyAcbOaZN4gDxhnH1KP7K08R183vCrXzeD7b/eDl
         BeOmr2mh47ZMTJP/lpVd7KYaJxiyKMu01VmTH1u0821SwLhKFmHJJzDxuMPqfedaBovU
         QKUMI0X120YADk9aO3QDkYNIU5elzxoq6EeUoeB4WfoB+kWPSd9yv1+ne2s40wNanZfM
         qLRzJbuOoce28r87vXqJhnrPEJmgeM1xOSYwMLcNLGghYc/KVEfS71X5/rmkJytyoIHt
         YR9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792180060; x=1792784860; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLoUVij4D6Xdoj+d66XdloNJ1a24cAv/lHqAd3GbIW4=;
        b=I8soamB1nd05D4qwRRov5+ak310iqBX3/lCUBCcBOo7BHeWh6ZBBZDokgyDet7wk9S
         gVYp1Ys1iohc+9+MC0YMV3w49/+EeG6OG3RQrKt9BePWHO0u/LrhhCkyEnOSqgGz/WAZ
         yTCpOvU7u2IisM/YM2sja5qW3nPLjQ/LzBqOyH9eHS3imzn9fj45IN7gyHBhXSE6o88a
         jYxSPjhYLcDOcVLSSepXArWkvSWm3vx6lRgAL+9pFc87ZN53hXLfjkLlWTVMTXQmq+l0
         ne2njnzAnUNrGjvez2ymEF+1AXCl9tt7vKb/TVR3pY5stSSvog3qbaVD104KyUXbLY9k
         mISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180060; x=1792784860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLoUVij4D6Xdoj+d66XdloNJ1a24cAv/lHqAd3GbIW4=;
        b=dqU63FF2Pi8bXgR3v7XB0soHv8kam0PZxVnQjGQqAbVLpxeDA2qNeGk/jrCkyU0AJA
         3Eam5+zb7o0tPKJ35uh8Ejq2DPB5SlM1gRjHfxpmGnqJmdabau9fLpHf15MxhFffdH4B
         jn9tiDbaPMpwiQUjIerQGbyEpULttPMdUJthsOetJ13su2TgUZxJMBGwFEELSM6miwwq
         e3GF8Q2OcuFnmwVh7V0rE/xPUQR4PvWD8bQ+EydLxwywfyoN3sN2MC7GyepJwrSpg9yz
         G+gG967AofWr5UMT8I+Yu+6jzjF3paygBMvSaKJxvAGGws2mHDgDkdY39LhrPeUoc1xT
         khQw==
X-Forwarded-Encrypted: i=1; AKwUvByHg7spsVtHxtbHBMb9bnpyq9PLwn9el91w3AFyOMp4wbXwO7ZGU3f5ndUcvP2zzx3EnQ8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJRdUVSZU8U2SEVnN/3IwP4rb1bZBh3/20v/CkgsuZAeNWqi7pD
	10Czqqeui/O+Jd7Jc+BSTtGHO5Gt2u94F9WAKRGXWHv1X9yn6v2HUcSE/dG+XuAQT2PrQkwtOWu
	rl4QwQxIrIGVSUWG9leVKovCIBAbNJD15MaqqLrV7UCm99PeET4fyuHGb7H719+4M+BKwnKOTzT
	nTE4oboQOPWR7AfBgN5h++mFJma3olFg==
X-Gm-Gg: AYBFou2UpZ1KDCDrH/9lPVdAvYoy8P4T4D5jIaa4mpDT8iYLaGeGF5ro2jGfSBZfNR/
	fM+sxjIMZyLpu3+RBo5NbFkeGc8Eb01WxGMptw73XRgoqvRW8xEwcV4EkMC6gaK/Okc+/8viXZ8
	h8MW3TB2Zhe9TlPzD981Ro+zq9k9RUT5oowZ7Xx5neJAjV0ZzopUzAX/gx6FIK67HapKXQWiw2N
	fNnKH7tlvLLhIMVk5n9ksvyhOq1heJAcMvcvzuTabkWV43YqRpxv7oflz2dgfCDbetAlM0WRSs=
X-Received: by 2002:a05:620a:a0d9:10b0:93f:2b23:4824 with SMTP id af79cd13be357-93f2b2369dfmr38755985a.34.1792180060248;
        Fri, 16 Oct 2026 12:47:40 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d9:10b0:93f:2b23:4824 with SMTP id
 af79cd13be357-93f2b2369dfmr38730185a.34.1792180054970; Fri, 16 Oct 2026
 12:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013183500.261229-1-peter.hunt@opengear.com> <20261013183500.261229-3-peter.hunt@opengear.com>
In-Reply-To: <20261013183500.261229-3-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 21:47:23 +0200
X-Gm-Features: AclHuK82BVEMNwOOoX7-QLyz02roVe99c3uFgde7R8Y7ar1YoeqPe54ho6qU6oo
Message-ID: <CAFEp6-07eXPbC0Q=UuAMqHF4XKbZQ7X9eEDSFuBp+V_UpFZSpQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 2/2] net: wwan: mhi_wwan_ctrl: drive DTR/RTS
 via the IP_CTRL channel
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, Daniele Palmas <dnlplm@gmail.com>,
        johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfX85xHmtsIskf6
 TEutTEcmovkfewMqHLBKaO3b3fpzeltMI+seFz4q7HHamyjd+/0x2JDXyIvT9yeLesdnNdMxOy+
 3OCyEKnBgV6jq+F20hMCAOjTrjOfy5ySBBx0tyT0NUAgrxf4bxAPuB1OU6jFHzbjCt9NB28J/Zx
 uYgh/4gC2lUN+guXuJskSvQgxTeIc0RKlAnfO7UmzkgOUlUBMAZ9JKoZA2cSR3UYgzo4KOMZtni
 rYcWPdf2McTxSuHdT9v2qGahhgutsNd4OrT32KtEzKBya1p11zZNPPZ9NUTnEqs9J2AfboNCDqT
 uEm4Um8Yx/TGaT4+r/m7lZUghVf7shrA8FhNiNpPxflzF2NUxiQfc3vKnWWhBomGZOlyOhwb4c0
 3gDXbWxL46lL3jzdqEM93CDTq2gSsS+CSJqZuiyFE6xK22Cd4jdbIZE8sNl2TvDJmq63C8VMWXo
 ajDl8WfFPM4mA7qOI9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfXww+qfSj0V6PR
 PU6QxZwjjpUNGbVd/0uPBalTeDJZPqFj8+8utM7ybIZa1FrtZQPzlfMtvLcJCLZxT+0HR/k3daQ
 8i1vORaBVMx+a/i4c7/C6Iwz3sshXEI=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad27f5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=G3Y4Gno3pi7WJKXLtj8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=V_BghkRpYkFyHJIZkSH6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Xd4HJZhwCTU0jpz1n_eX4pZoNiMK280e
X-Proofpoint-GUID: Xd4HJZhwCTU0jpz1n_eX4pZoNiMK280e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160078

On Tue, Oct 13, 2026 at 8:36=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
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
> The wwan core, with "net: wwan: core: propagate modem control signals to
> port drivers", raises DTR/RTS on first open and drops them on last close
> (if HUPCL is set) for any AT port whose driver implements ->dtr_rts, so
> no open/close handling is needed here. The new ->dtr_rts op lets
> userspace assert or de-assert them via TIOCMSET/TIOCMBIC/TIOCMBIS.
> Received device->host serial state messages are silently discarded; a
> single recycled sink buffer keeps the IP_CTRL DL ring live so the
> modem's transmit path does not stall.
>
> ->dtr_rts is void, following the tty_port_operations model it is
> modelled on. It records the requested state and schedules a per-port
> work item that sends the latest state to the modem, so a burst of
> changes is coalesced into one message and cannot fill the IP_CTRL UL
> ring. If a send fails because the ring is full or memory is short, the
> work retries shortly with whatever state is latest by then, so the modem
> ends up with the final state that was requested. The DL sink buffer is
> requeued from a work item, which retries a transient -ENOMEM so the DL
> ring does not stay empty, and which remove() disables before tearing
> down the channel.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> v10: Send DTR/RTS changes from a per-port work item that coalesces
>     bursts and retries a send that fails with -EAGAIN (UL ring full) or
>     -ENOMEM, so the modem always ends up with the final state. Testing
>     v9 showed that rapid toggling could fill the IP_CTRL UL ring and
>     drop updates (Sashiko review of v9). Loic's Reviewed-by is dropped
>     as the send path changed
> v9: Requeue the DL sink buffer only from the refill work and disable it
>     with disable_delayed_work_sync() before mhi_unprepare_from_transfer()
>     in remove(), so no requeue can race with channel teardown (Loic
>     Poulain, Sashiko review of v7). Leave unpreparing to mhi_probe() when
>     probe fails. Name the wwan core commit instead of "patch 1"
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
>  drivers/net/wwan/mhi_wwan_ctrl.c | 262 ++++++++++++++++++++++++++++++-
>  1 file changed, 261 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index a31d8540fbb8..e3c207588956 100644
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
> @@ -35,6 +66,12 @@ struct mhi_wwan_dev {
>          * decremented on data queueing and incremented on data release.
>          */
>         unsigned int rx_budget;
> +
> +       /* Latest DTR/RTS state for the modem, sent from dtr_work so a bu=
rst of
> +        * changes is coalesced and only the final state has to get throu=
gh
> +        */
> +       unsigned int dtr_mdmbits;
> +       struct delayed_work dtr_work;
>  };
>
>  /* Increment RX budget and schedule RX refill if necessary */
> @@ -103,6 +140,80 @@ static void mhi_wwan_ctrl_refill_work(struct work_st=
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
> +       if (ret)
> +               kfree(dtr_msg);
> +
> +       return ret;
> +}
> +
> +/* Send the latest DTR/RTS state. A full UL ring or a failed allocation =
is
> + * retried shortly, with whatever state is latest by then, so the modem =
ends
> + * up with the final state. Other errors mean the channel is going away.
> + */
> +static void mhi_wwan_ctrl_dtr_work(struct work_struct *work)
> +{
> +       struct mhi_wwan_dev *mhiwwan =3D container_of(to_delayed_work(wor=
k),
> +                                                   struct mhi_wwan_dev, =
dtr_work);
> +       int ret;
> +
> +       ret =3D mhi_wwan_ctrl_send_dtr(mhiwwan, READ_ONCE(mhiwwan->dtr_md=
mbits));
> +       if (ret =3D=3D -EAGAIN || ret =3D=3D -ENOMEM)
> +               schedule_delayed_work(&mhiwwan->dtr_work, msecs_to_jiffie=
s(10));
> +       else if (ret)
> +               dev_warn_ratelimited(&mhiwwan->mhi_dev->dev,
> +                                    "failed to send DTR/RTS state to mod=
em: %d\n",
> +                                    ret);
> +}
> +
> +static void mhi_wwan_ctrl_dtr_rts(struct wwan_port *port, unsigned int m=
dmbits)
> +{
> +       struct mhi_wwan_dev *mhiwwan =3D wwan_port_get_drvdata(port);
> +
> +       WRITE_ONCE(mhiwwan->dtr_mdmbits, mdmbits);
> +       schedule_delayed_work(&mhiwwan->dtr_work, 0);
> +}
> +
>  static int mhi_wwan_ctrl_start(struct wwan_port *port)
>  {
>         struct mhi_wwan_dev *mhiwwan =3D wwan_port_get_drvdata(port);
> @@ -163,6 +274,7 @@ static const struct wwan_port_ops wwan_pops =3D {
>         .start =3D mhi_wwan_ctrl_start,
>         .stop =3D mhi_wwan_ctrl_stop,
>         .tx =3D mhi_wwan_ctrl_tx,
> +       .dtr_rts =3D mhi_wwan_ctrl_dtr_rts,
>  };
>
>  static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
> @@ -224,6 +336,7 @@ static int mhi_wwan_ctrl_probe(struct mhi_device *mhi=
_dev,
>         mhiwwan->mhi_dev =3D mhi_dev;
>         mhiwwan->mtu =3D MHI_WWAN_MAX_MTU;
>         INIT_WORK(&mhiwwan->rx_refill, mhi_wwan_ctrl_refill_work);
> +       INIT_DELAYED_WORK(&mhiwwan->dtr_work, mhi_wwan_ctrl_dtr_work);
>         spin_lock_init(&mhiwwan->tx_lock);
>         spin_lock_init(&mhiwwan->rx_lock);
>
> @@ -252,9 +365,118 @@ static void mhi_wwan_ctrl_remove(struct mhi_device =
*mhi_dev)
>         struct mhi_wwan_dev *mhiwwan =3D dev_get_drvdata(&mhi_dev->dev);
>
>         wwan_remove_port(mhiwwan->wwan_port);
> +       /* Give the DTR/RTS drop from removal one attempt, then stop the =
work */
> +       flush_delayed_work(&mhiwwan->dtr_work);
> +       disable_delayed_work_sync(&mhiwwan->dtr_work);
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
> + * This only runs from the work item, so remove() can stop it before the
> + * channel is torn down. A transient mapping failure is retried, other e=
rrors
> + * mean the channel is going away and the next probe queues a fresh buff=
er.
> + */
> +static void mhi_wwan_dtr_refill_work(struct work_struct *work)
> +{
> +       struct mhi_wwan_dtr *dtr =3D container_of(to_delayed_work(work),
> +                                               struct mhi_wwan_dtr, rx_r=
efill);
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
> +       schedule_delayed_work(&dtr->rx_refill, 0);
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
> +       /* On failure mhi_probe() unprepares the channels itself */
> +       ret =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, dtr->rx_buf,
> +                           sizeof(*dtr->rx_buf), MHI_EOT);
> +       if (ret)
> +               goto err_free_buf;
> +
> +       mutex_lock(&mhi_wwan_dtr_lock);
> +       list_add(&dtr->node, &mhi_wwan_dtr_list);
> +       mutex_unlock(&mhi_wwan_dtr_lock);
> +
> +       return 0;
> +
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
> +       /* Stop the refill work, and stop a late DL callback re-arming it=
, before
> +        * the channel is torn down so no requeue can race with the teard=
own
> +        */
> +       disable_delayed_work_sync(&dtr->rx_refill);
> +       mhi_unprepare_from_transfer(mhi_dev);
> +       kfree(dtr->rx_buf);
> +       kfree(dtr);
> +}
> +
>  static const struct mhi_device_id mhi_wwan_ctrl_match_table[] =3D {
>         { .chan =3D "DUN", .driver_data =3D WWAN_PORT_AT },
>         { .chan =3D "DUN2", .driver_data =3D WWAN_PORT_AT },
> @@ -278,7 +500,45 @@ static struct mhi_driver mhi_wwan_ctrl_driver =3D {
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
