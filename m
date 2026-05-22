Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4A2F7EF3
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480564; cv=pass; b=lWOCYSYRXIBnFVlmXu/xDik5LitQU/Bmimvui4ItvO3Lbl4oY9I0JoA42e+Ug3EYDZ1lQfZ4UYTzD6zPn6OaAmYICBwcGOOjfUvh526zboHG4BDvZnkMQhMRfUDeTCv9zL5HlaEy/V27w1E95q7vCsGpyVAeSQMEj+BNqB9inZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480564; c=relaxed/simple;
	bh=BYenqKReshgy7WMYk3vXJQUj0YK+MP2HizGUmGHcwiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAeoFXGNumW31zR0nOO2btOYs3A9DQrnotGJnVcKJ6Yxsc4l1v8Pj1UJX31trFgR44WCatbrh5kszBmw6dFt47Jo1+gFR6xl6hyo+CAaZ97rcDe0ZaLvewkYczaTfb8L4ckqRgzuM9xIRJY4LftpJdwbbjeep239DciiFy87I4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbgztTsE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjmVeXYQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbgztTsE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjmVeXYQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpmZC2125423
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 20:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=; b=EbgztTsE1C9CerSE
	ANTpW3uvn5Il5z/EcdPUowP+j1DovIhpYLkshTBQcFSp04zrMrdGzt9VrEDdhC4u
	/OS8jPtLzIIC64gNN8r1/jWRO1QKY7ePcVrH1lXNsJdefWwgMAsp1OkdSnzgxz2A
	RmeUVsDokIDB0hnA0AhEfhHrMWZiz+A/5xNfbXHXQ2JjFfmAuTexFDG4uSh9GBE4
	Uj7Hhq2m1Z1Dkp6h7E7qH5ORpxVxb0PHRo1f9A+gQd3r8tvMFo7+/vT88LSzxMd0
	CYtP3evhGCD5OxWn9UeuQY1sqK6HwmFMAEMNY2/FH5RrzV0e0fIlG8WG6aFtaO5Z
	vTsYIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard89h3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 20:09:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-910304978f3so1550880185a.1
        for <mhi@lists.linux.dev>; Fri, 22 May 2026 13:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779480560; cv=none;
        d=google.com; s=arc-20240605;
        b=kGUPUqgdPDFkp40jiBeudEsavAoUn19hDdazq6Coa3TX0ZZl20hCeBx2Mjl2Mq5LKN
         I6VFvAgHfvb7DKSJL5VmG1PXI5xKQvfBVnuk6heXWUIceR7KJmAojNgOZpkPJTGTH7mN
         WjXyJb9f8fLCpst5PkpFwRZqtKKcEZb9ncyB3msqzjkP84nYEoo9eKWTJ5gfAxgkZS6P
         V+qZXg2ymb7RKjUDvtAjAqyHsVZOrhxukQRkmOI/OSFxGev9hGmzCspCS8eak1OhKiS9
         1xIB28X+/WO20diS008Sj5GITKnNaeYBJVQN66XJ1RqI+wdNdVd3rxjfZgD2pBaTV7OV
         bVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        fh=INHk5b1gLQazKgWLAhJ4gXv/ChAsHEFMFbkA6FZ47oQ=;
        b=LrwBjlA2Our6WBJykQDHi+PHZkjSNs3HAOxx4A3cRzxbqrgkZpLHfMps6lULE2FQYO
         OV9XQvLcHCoWG+bEhU7YUpQZvOBd8gmX5jJhiA9c/VVj2gJlZl/yeL0MEMLMRE5lK02q
         oKfNjcioujW8ToMQB2NCbbRs4avufyrhQQaPIqpn+B1q35irbVsFIvK0st2xT3NOIv9y
         edEnpaz7Nq+hJhOfimrM37/6HU920Yu15upRNuuvc5x+7TNKLg7Ldv60hjejE26Ob/9B
         oUliDmIOxaISN5AdU7UWsTTqWjyAkL53kRqoBE9TUS5LrXS5Lsb7vWI71LoSnIeA9GV6
         z/Mg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779480560; x=1780085360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        b=YjmVeXYQ3YU/Vp26wpV9zgl6lTbq0HDwVM+VFIiPe8X4XT7Rr6F9popj3k3t0DiO3+
         E08yzt4pdUeYDXLuqo5wsNoVQaDRf4O+QiLwOcxfWEv0jPHLoG47/+p0lKb0htOW+N8x
         jR25XntXs2nreHVNtMJnHa3v0rEIP+AdCGPnHJHkRb0Gd1owErNmbOY5TvGRfLnZ9KNX
         Nv14v+VyKQ5JSZ73TbfLfFlhrje8XjCQ0/ULARMQXDCwuL0JDpJURihLSfh8YVjwjudp
         10ITLdPURfA9Sl8tNgMd2+RZSQPdmSqu8omfCFdqf+igxsJrUnkLlBCZr2JBRAGo9jzB
         h75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480560; x=1780085360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        b=YOTHrxLAPlCCEM8WvL1z4YrQBZnsE/UH38UeW8k05DaMLoJjLDKPYq6oamDcL61TEN
         3bx9Ak3eFZ04s1dQpNDzH7/1GXykrjtvUWNyo/GeiJlGpbXqg6STOyXWAIjuS9fJJFEN
         /mmM5dZnETjS2gA1+MX/AdiQ9khaHtry1ufsIudMLuNV7T3idg0mmeCSKgqo/95FUuzm
         90RoxoirYncFwIPnGoRWFQoMRpCWkMGYSA3ALgrYsYR1nbwMmmBO9Qh4QnF59AWjuvou
         SxrZ1R/vOrX/Q+H5Y2CMnUN9c4vZ7S93eQhJqlP/WNevOeUTRwKbR/bw24jrYO4QKoMK
         4zBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RQ8C3pyngFS5KyoJCThLRvt4T6bVUuG8kkACMv01kMz++6KfDmlCel+UqcidHI5CKlQM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOAptc5e4VatkQSOo4+/8BuxHCZIJ2eC7qKTj4NB1PmbcNcT+T
	BLUQXl+6j8kD/CfXgj6jDdzniRa2ZSLZIvwHDnzjPRUhoHKElVFgTO0qm1nJ755CUjNAYtngsm0
	jmX8hwSzx3yZXi+2ay70FgIe/J9GVbLO5RXtw/AFHlZsePJRYVv61AuGQr2YipHki2bueeVjjYj
	Pf9JZybmhgR6bx0DB9GomcFTKvHP/Z3Q==
X-Gm-Gg: Acq92OE9jg5Nw0iEpNajKaGBeMSQfphl1oLn+QPD5N6B9bJpbXYxud+3blCTgmF02J0
	JGQSYa35GCu7IT5Q2poWlrLpwhFajJsi9LBu9cHYurdzImGwn/zs22DwCoF+5ejMzVL6Ip4YvtB
	MTmwDbbgUJxPDIrXUthQyR7KBCiyI7+LY/maYTPreHicSJ5nM14Kh1PeCUCAkq7Y0FN3O9Xc3BP
	zwhAsEe28H6sfpZY31iJY7TaJQ8nd+2+9fBOk+4UDwJWmFNsmJPMWtav5nTpyCNGuVe
X-Received: by 2002:a05:620a:28c7:b0:8cd:aa61:ad8f with SMTP id af79cd13be357-914b50cab94mr617029785a.14.1779480560229;
        Fri, 22 May 2026 13:09:20 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:8cd:aa61:ad8f with SMTP id
 af79cd13be357-914b50cab94mr617022585a.14.1779480559708; Fri, 22 May 2026
 13:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com> <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 22:09:08 +0200
X-Gm-Features: AVHnY4J-9F8AAJuD_tJW6-iaDPIYDcwXI9s5goDnYZwmGPWaSdjsV19cBJfwNa0
Message-ID: <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a10b7f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=omgbQWz8Cy1bZfrwG_oA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vIHQjvehFU7Si5CW2tFxNOi4yR9fR5Pz
X-Proofpoint-GUID: vIHQjvehFU7Si5CW2tFxNOi4yR9fR5Pz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwMCBTYWx0ZWRfX2EVvmODiDCh9
 xrFJ3Tw0NIcV9y0EsjEoGU7b4ip0egx7445XcZh8JEDv+mBDZz1egKp3Cr7aSo/ybJf0O8XJjag
 zxDyi2BcYQk5tbjhuU0EjB1LdmMX/tHkeLxtir6cOsEuTxCGEtQXCRhtW3aazLVSitWSkmr/TX2
 /kW65FrWLhkITZdJHhTyrMRXA/Gn+fc5G7Q/bvE3Nt31JKc7xBb6AhAP9K5tLZJ0WjlWYqX7vEV
 eP1S6vqW7STnjJtUaTLWXc4BBiVkAkPi9qTRXsZ/zvPJDRzqKWbPTDwJ3FKaEa9OCzZipP63bPq
 A1fs1MKsQ3UbaZZw0yIGpGV1QT/Ty9u46o8yrVeYKcyrpd0TaRGRJ+fDS0AuTSfUcYuY0dJ28FD
 uELP1s715I79ctITPo9dqU10dII98HZFZI2/SoeN4hZzYYtH0j9tl7JjHPYDTMJndqG7rqjO4hY
 d3gGEEsNRjAAeeCd95A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220200

Hi Krishna,

On Fri, May 22, 2026 at 12:01=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> The mhi_net driver does not coordinate with runtime PM, which allows the
> underlying MHI controller to be runtime-suspended while transmit, receive=
,
> or RX buffer refill operations are in progress. This can lead to stalled
> transfers or failed queueing once runtime PM is enabled in the MHI core.
>
> Add runtime PM reference counting to the mhi_net data path to keep the
> controller active for the duration of TX, RX, and buffer management
> operations. Enable runtime PM during probe and take/release references
> explicitly around these critical paths.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8..5d7f9ccdb17b 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/skbuff.h>
>  #include <linux/u64_stats_sync.h>
>
> @@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, =
struct net_device *ndev)
>         struct mhi_device *mdev =3D mhi_netdev->mdev;
>         int err;
>
> +       err =3D pm_runtime_get(&mdev->dev);
> +       if (err < 0 && err !=3D -EINPROGRESS) {
> +               dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
> +               pm_runtime_put_noidle(&mdev->dev);
> +               goto exit_drop;
> +       }
> +

I am wondering what the value is in pushing this PM responsibility to
each individual MHI client driver and requiring every MHI operation to
be bracketed with runtime PM handling.

What does the client driver know here that the MHI core itself cannot
handle centrally? It feels like ensuring the controller is
runtime-active during transfer could be handled generically in the
framework instead of duplicating the same logic in every client.

>         err =3D mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT=
);
>         if (unlikely(err)) {
>                 net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
>                                     ndev->name, err);
>                 dev_kfree_skb_any(skb);
> +               pm_runtime_put(&mdev->dev);
>                 goto exit_drop;
>         }
>
> @@ -251,6 +260,7 @@ static void mhi_net_ul_callback(struct mhi_device *mh=
i_dev,
>                 /* MHI layer stopping/resetting the UL channel */
>                 if (mhi_res->transaction_status =3D=3D -ENOTCONN) {
>                         u64_stats_update_end(&mhi_netdev->stats.tx_syncp)=
;
> +                       pm_runtime_put(&mdev->dev);
>                         return;
>                 }
>
> @@ -261,6 +271,7 @@ static void mhi_net_ul_callback(struct mhi_device *mh=
i_dev,
>         }
>         u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>
> +       pm_runtime_put(&mdev->dev);
>         if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_=
DEVICE))
>                 netif_wake_queue(ndev);
>  }
> @@ -277,6 +288,12 @@ static void mhi_net_rx_refill_work(struct work_struc=
t *work)
>
>         size =3D mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu)=
;
>
> +       err =3D pm_runtime_resume_and_get(&mdev->dev);
> +       if (err) {
> +               dev_err(&mdev->dev, "pm_runtime_resume_and_get failed %d\=
n", err);
> +               return;
> +       }
> +
>         while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>                 skb =3D netdev_alloc_skb(ndev, size);
>                 if (unlikely(!skb))
> @@ -296,6 +313,7 @@ static void mhi_net_rx_refill_work(struct work_struct=
 *work)
>                 cond_resched();
>         }
>
> +       pm_runtime_put(&mdev->dev);
>         /* If we're still starved of rx buffers, reschedule later */
>         if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) =3D=3D mhi_net=
dev->rx_queue_sz)
>                 schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,20 +380,41 @@ static int mhi_net_probe(struct mhi_device *mhi_dev=
,
>
>         SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>
> +       pm_runtime_no_callbacks(&mhi_dev->dev);
> +       err =3D devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +       if (err)
> +               return err;
> +
> +       err =3D pm_runtime_resume_and_get(&mhi_dev->dev);
> +       if (err) {
> +               dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed =
%d\n", err);
> +               return err;
> +       }
> +
>         err =3D mhi_net_newlink(mhi_dev, ndev);
>         if (err) {
>                 free_netdev(ndev);
> +               pm_runtime_put(&mhi_dev->dev);
>                 return err;
>         }
>
> +       pm_runtime_put(&mhi_dev->dev);
>         return 0;
>  }
>
>  static void mhi_net_remove(struct mhi_device *mhi_dev)
>  {
>         struct mhi_net_dev *mhi_netdev =3D dev_get_drvdata(&mhi_dev->dev)=
;
> +       int err;
> +
> +       err =3D pm_runtime_resume_and_get(&mhi_dev->dev);
> +       if (err)
> +               dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed =
%d\n", err);
>
>         mhi_net_dellink(mhi_dev, mhi_netdev->ndev);
> +
> +       if (!err)
> +               pm_runtime_put(&mhi_dev->dev);
>  }
>
>  static const struct mhi_device_info mhi_hwip0 =3D {
>
> --
> 2.34.1
>
