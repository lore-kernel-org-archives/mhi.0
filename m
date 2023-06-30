Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E325B14265
	for <mhi@lists.linux.dev>; Fri, 30 Jun 2023 11:55:30 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51d89664272so1896190a12.1
        for <mhi@lists.linux.dev>; Fri, 30 Jun 2023 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688126129; x=1690718129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcVdOlrtw4UQCPRAllTl5FzovwAjvJUPpNKCO4CK+xA=;
        b=JIegVc+KfvFzi5oFggu5McaOKbWGkk9Bbjnk1lHLCxXX7H+JjtmKHD3/hLhCXOH5ss
         juSPZE5sPYFT/pRCdsLEtyef9tkDodF4lPuerhyhQGOV99rYZwc0m88+6ix46/HHCl8A
         J9rmeshZv/LNJgmVX/TR8HAL3cBi8X59NFT2tPeY98NdCH7LSdzFAXBNz7QRIZD94kKo
         KKnMKdu4z1mIsHQphHmbiuBwEEzzNYFB24NsHyJCr2MOg1/h4BhKGGZGW2H4JEuF5mmP
         w8lvYjsCMm6LRdruhDG+ZLx1GkulvRclSiyiralb4/abmnkH71MdC1zB37johwGsWCQd
         CEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688126129; x=1690718129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcVdOlrtw4UQCPRAllTl5FzovwAjvJUPpNKCO4CK+xA=;
        b=fvc66LkYA3NfA976EEMvB2Q4cRht1i/s2ixSC7KtZSLVYR4OKzoSQCpHW+LGbOltx4
         kK6s5Ei0+SQYJ0tItYSOhZVUZLIb2MCd6hKqidTO0bbYY4TvzR/xpsChYFJB0q+WGQSN
         p5ccKZG4iFqGGbQQCGd+CX6Gy+2y2Kp6sA4oO8uM+xpj/qw1hWO3QUaUE+JrfkfHdzgt
         NbwvQ7pc+yRFg1xM0OAjTmQZSttR/n2deP7ZL4VWnUPlQ2blKZZ0b7gyrNi5jhAwfjwl
         InhLRi4DNNVwviZnjaCeAAQT+Uo+oPyxw0pIESe5D4hBsVOsFbFdUCNGnpTh51KPB9TG
         0ZKQ==
X-Gm-Message-State: ABy/qLY+JmJ32Rgr5dfWyWWezunnG92WAKxsw2b52BKoggwg4MvtRc8H
	M4GwDmZ8fyxShL6CqxalRrscqlWDSZKF1c2ADRI=
X-Google-Smtp-Source: APBJJlGaKAK44EsoGuQZSnAcHX8+4XHxi83swR7qzSfwI0g8CEb9rAgW1fUt8wDALb9uo07x6Gko+RH/qYVx3TVZVbA=
X-Received: by 2002:aa7:c689:0:b0:51d:93ea:6446 with SMTP id
 n9-20020aa7c689000000b0051d93ea6446mr1356166edq.20.1688126128561; Fri, 30 Jun
 2023 04:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1688118281-13032-1-git-send-email-quic_vpernami@quicinc.com>
In-Reply-To: <1688118281-13032-1-git-send-email-quic_vpernami@quicinc.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Fri, 30 Jun 2023 13:55:17 +0200
Message-ID: <CAGRyCJH2PwVX4vgU-Xib_twdKsRuKnYb9CCdSkz9jK4-SHHZ1g@mail.gmail.com>
Subject: Re: [PATCH V1] net: mhi : Add support to enable ethernet interface
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, mrana@quicinc.com, quic_qianyu@quicinc.com, 
	manivannan.sadhasivam@linaro.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Vivek,

Il giorno ven 30 giu 2023 alle ore 11:45 Vivek Pernamitta
<quic_vpernami@quicinc.com> ha scritto:
>
> Add support to enable ethernet interface for MHI SWIP channels.
>

Shouldn't this be targeting net-next (currently closed) ?

Anyway, I'm mainly replying since I'm interested in this topic and
would like to be copied in related future submissions.

Thanks,
Daniele

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/net/mhi_net.c | 53 ++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index 3d322ac..0a47e15 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -11,6 +11,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/skbuff.h>
>  #include <linux/u64_stats_sync.h>
> +#include <linux/etherdevice.h>
>
>  #define MHI_NET_MIN_MTU                ETH_MIN_MTU
>  #define MHI_NET_MAX_MTU                0xffff
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
> @@ -140,6 +143,14 @@ static void mhi_net_setup(struct net_device *ndev)
>         ndev->tx_queue_len = 1000;
>  }
>
> +static void mhi_ethernet_setup(struct net_device *ndev)
> +{
> +       ndev->netdev_ops = &mhi_netdev_ops;
> +       ether_setup(ndev);
> +       ndev->min_mtu = ETH_MIN_MTU;
> +       ndev->max_mtu = ETH_MAX_MTU;
> +}
> +
>  static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
>                                        struct sk_buff *skb)
>  {
> @@ -209,16 +220,22 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
>                         mhi_netdev->skbagg_head = NULL;
>                 }
>
> -               switch (skb->data[0] & 0xf0) {
> -               case 0x40:
> -                       skb->protocol = htons(ETH_P_IP);
> -                       break;
> -               case 0x60:
> -                       skb->protocol = htons(ETH_P_IPV6);
> -                       break;
> -               default:
> -                       skb->protocol = htons(ETH_P_MAP);
> -                       break;
> +               if (mhi_netdev->ethernet_if) {
> +                       skb_copy_to_linear_data(skb, skb->data,
> +                                               mhi_res->bytes_xferd);
> +                       skb->protocol = eth_type_trans(skb, mhi_netdev->ndev);
> +               } else {
> +                       switch (skb->data[0] & 0xf0) {
> +                       case 0x40:
> +                               skb->protocol = htons(ETH_P_IP);
> +                               break;
> +                       case 0x60:
> +                               skb->protocol = htons(ETH_P_IPV6);
> +                               break;
> +                       default:
> +                               skb->protocol = htons(ETH_P_MAP);
> +                               break;
> +                       }
>                 }
>
>                 u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
> @@ -301,11 +318,17 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>                 schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>  }
>
> -static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
> +static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev, bool eth_dev)
>  {
>         struct mhi_net_dev *mhi_netdev;
>         int err;
>
> +       if (eth_dev) {
> +               eth_random_addr(ndev->dev_addr);
> +               if (!is_valid_ether_addr(ndev->dev_addr))
> +                       return -EADDRNOTAVAIL;
> +       }
> +
>         mhi_netdev = netdev_priv(ndev);
>
>         dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
> @@ -313,6 +336,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
>         mhi_netdev->mdev = mhi_dev;
>         mhi_netdev->skbagg_head = NULL;
>         mhi_netdev->mru = mhi_dev->mhi_cntrl->mru;
> +       mhi_netdev->ethernet_if = eth_dev;
>
>         INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
>         u64_stats_init(&mhi_netdev->stats.rx_syncp);
> @@ -356,13 +380,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>         int err;
>
>         ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
> -                           NET_NAME_PREDICTABLE, mhi_net_setup);
> +                           NET_NAME_PREDICTABLE, info->ethernet_if ?
> +                           mhi_ethernet_setup : mhi_net_setup);
>         if (!ndev)
>                 return -ENOMEM;
>
>         SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>
> -       err = mhi_net_newlink(mhi_dev, ndev);
> +       err = mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
>         if (err) {
>                 free_netdev(ndev);
>                 return err;
> @@ -380,10 +405,12 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
>
>  static const struct mhi_device_info mhi_hwip0 = {
>         .netname = "mhi_hwip%d",
> +       .ethernet_if = false,
>  };
>
>  static const struct mhi_device_info mhi_swip0 = {
>         .netname = "mhi_swip%d",
> +       .ethernet_if = false,
>  };
>
>  static const struct mhi_device_id mhi_net_id_table[] = {
> --
> 2.7.4
>
>
