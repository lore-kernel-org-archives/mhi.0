Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00650367F3D
	for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805161; cv=none; b=Z02NwGPXyBmCUTYxRCVccqcU4W7CfcPrSr21ugjofl5YExsG5Kj7YxcQ87+iQjsnaYEBsT8WqCWrlrgfeKKMuLskcNVerAnwIEKm3pdMdikgdqHw13fkseWVb+Odq5ygTGubtM6qdvMEwyo92yqn16fpqGGdgDJh0sUovKP589o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805161; c=relaxed/simple;
	bh=BaDSsHGEy2zX9WVrm5RtNAPsvCwRAo58d7TZpyt7/5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOT3DmLu5+ZL2MrZFwmce64ncUECHBfcylfNOowx4rTaSgZk//8P0fnVrRdabnG7bV32Jp5tsXjMYjBEXZqXomiK3CnfPetu2KhDa+/aQoXrnZtKqEIGs/yM20d4jh8nKX6mzNX4eEW4SRgcorso6Wg4FTOnAIpvqXLslnaCYlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDl1dcMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbiULoqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDl1dcMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbiULoqm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B8luKu3320514
	for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 10:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PvonrZ7OZoRXNS5AixxctJxybwuCwZ5MGB3RDvn9aM=; b=DDl1dcMPM4qlb/VH
	H6wWRe6VODcdQYkwwcH1up935WIejcexRpbzntGMUDK48r4ciX573K9gw09N1e/x
	+3g/R5xRvCFeZ4Xma+u1KcdeHtMltbH42ANJicoiMdb6kvQz0/r6CRibEOViBW/F
	w25Mq55/rommVVShxAv8bjBKdE87tPAI5cU/Q4VSavJjiUkjRpvfbbELT2mzYj78
	M/y6uv7JutAVycMZDefZwVYveLYzzglEuKg2bl0u0wijU3iA7RHDL3dQDa03AoNn
	8zo5qdWgY+/QMazNKrV7kqJogvGh1AgC5c3akGGDARuCgrkF3cnmCp08wMd4eY01
	qiePEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8epshph7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 10:19:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aadeb3dee4so105993235ad.2
        for <mhi@lists.linux.dev>; Wed, 11 Feb 2026 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770805158; x=1771409958; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PvonrZ7OZoRXNS5AixxctJxybwuCwZ5MGB3RDvn9aM=;
        b=HbiULoqmImA5dwHUSmDoqo14Oh+s6M8r33RE7fyK6traeOsenUCs/UVoT0lCat1N9d
         1vaUoSOaPo4p876Z22FPt2YnEXJvY0WZo3OEiCUZbXbuStXjeMAF9i2MssrdbuLXTni0
         y8MWW7mUzZo1DDMQ4NfttobQFLOIXz1JwDT/bzVIKAscQuIX6im48kgIGZ6r3B/FLbo2
         rbrD8mlX4+bGKKvRvNuNc8wSVVDbiMdfVm4CBuYHrIx/Mzz8GcWGxiPEYWzgtCycM1Gm
         SC+rQpuELrIsvzAIxtfy1UaJOWcV2DYWicLext2ps+p4g3k3CXj0T+Zkhcf/bEJKzL0w
         0rGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805158; x=1771409958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PvonrZ7OZoRXNS5AixxctJxybwuCwZ5MGB3RDvn9aM=;
        b=r2i6NV/o9fQ+iF71JrQi+Acl7Tu5Z5kfwOsg0syCT5fmqPGRQubNc697FYlJC4sf7i
         d/v9B18uMsuebWYJry0X7xjeYOndZJ7Dl0nXKhIxKyiNKphBRaEodxQXSM9k3KD/Q5Wy
         lWdDvICiLbnf/TqU4JQhJosTT2VnwUv6JPLy6RMWN3Qujg+VrXbtE2oO+7aKJpO5WJre
         phsDHQWP/DjEAbX6FpyIfi1KRzdFanswwHObFFpQeGQjbcsiqRuIcJRvg9IokgqvzppI
         42B+4vHWxNOgXPSJn1bm9mc5gNcqGckKHGhDRx2sXooJWjgj8a8Mg9wiDWuYxb9yzemO
         tj7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJwjO4DkBbeBwOpepcK06D+u+LUYsYmi56M3vKWAt5jxs3uF4Dhnak3/qQl37KRwu7bEM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7BNiNnNolMgNudYumckvKv9WTNWKD36iloYt4JwRXeQpFow4d
	r3EDxmOqKrbR05E/MPkU5wsdPvVvpGs2p8Ml8lU3/h/NaqbgeQsL8DvY+fIKT4U7KgQjl6c6Tn3
	GskU2E2iLSyAZ5TxKlvJ5JrXSXZYl4ctnYvslZLq86KQyqYsytLQAluw=
X-Gm-Gg: AZuq6aKbXSXWiyR+2qNknXCFagOpm6r/B4bmjIGsqRP0ZIlM2eq20patgECFARjCq6l
	6gmgMu8FanXLT8sPbDUdpfNSFc1aaVKyMiIvx54y+4VENNy405VKaunnD6uRGCbNbOEIJC+8DiF
	ZrXJNwTw1byAkBkR7b2UcK6KZM0sR38T9uFEqYrmWvoU8zPTPrjQ0sY8Z//bxVwYE6JHZawCzfa
	xWNStwrYYlVwG3z4El3V3URnPRxp58+B8QlOEujTnp/LyQAgVHsaWRKUZQff3UsB+acF89G7lxQ
	WvZZgU533GHAoZmjwNSUcA9A5L9RSMaL0pw9Rcw68L3JkYarCXzJ4KoVpW4usB1dTsZM4jlc0nE
	6sivtECh337OWcuzJbwGCw7WcMQlHsuTBH9KXF8juHkzWQjDmqqsAwkZuqA==
X-Received: by 2002:a17:902:e948:b0:2a9:30d4:2b05 with SMTP id d9443c01a7336-2ab2ad1fd38mr15046985ad.55.1770805157855;
        Wed, 11 Feb 2026 02:19:17 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2a9:30d4:2b05 with SMTP id d9443c01a7336-2ab2ad1fd38mr15046665ad.55.1770805157367;
        Wed, 11 Feb 2026 02:19:17 -0800 (PST)
Received: from [10.217.218.153] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997aebdsm17702665ad.66.2026.02.11.02.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:19:16 -0800 (PST)
Message-ID: <56147352-f32e-4ee9-aa13-c1a00f5066ec@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 15:49:11 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] net: mhi: Enable Ethernet interface support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
 <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
 <CAFEp6-0Q7Cy9d5=ZEsct3Y2G3C2w_47CM0FxYsE6YkdksrKhcw@mail.gmail.com>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0Q7Cy9d5=ZEsct3Y2G3C2w_47CM0FxYsE6YkdksrKhcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4NCBTYWx0ZWRfX9caJJePqJtdK
 WFCM/ZXmPDgiHo4pVSIRzmUy8jCiHC/JjP0qZswhoMpnM9eu1AM+MjpNXOKB3v/SmNzjWadVJyj
 1ELOFzsQImDWh6DaS120Jgryy4iMuu2iLUXmZsz3k96X/n0TXxMMZiU/sujoglQ4P0JOxdufyXz
 gQiabEW5xxbCIIWZF7iu+1C+PUCHu41cs1IkxvSeK52Loayz9fkSrfEijz2ToAzsIAGm09jP8a+
 BoKjPtbDyNdagIY27VVdvO0WhXebm6n8ft8VJPhw88wz933W4ST+umOW4HccCKjU9cQhfDeTqd8
 BCcb0//fXAGJo4ixz253E7Bf71snLkRZyc6CAI5prQVLBEh2xdx2zGfk4JlK836AiObwpCojc3U
 ctgalgfG6dRdplD+W5G6Wetmk3TV8Cfd6Xy7geoDZL2FAvyeteZTyhzd+ehnVcGzGzTolQgYErL
 ErxKK9g3uk9L6s8txGQ==
X-Proofpoint-ORIG-GUID: SYHl4PDRsVR50e25jZX0W43x8rFKG7cc
X-Proofpoint-GUID: SYHl4PDRsVR50e25jZX0W43x8rFKG7cc
X-Authority-Analysis: v=2.4 cv=I/Vohdgg c=1 sm=1 tr=0 ts=698c57a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tylL_gffLuDzp9gNwmUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110084



On 2/5/2026 7:38 PM, Loic Poulain wrote:
> Hi Vivek,
> 
> On Thu, Feb 5, 2026 at 11:35 AM Vivek Pernamitta
> <vivek.pernamitta@oss.qualcomm.com> wrote:
>>
>> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>>
>> Add support to configure a new client as Ethernet type over MHI by
>> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
>> interface named eth%d. This complements existing NET driver support.
>>
>> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
>> M-plane, NETCONF, and S-plane components.
>>
>> M-plane:
>> Implement DU M-Plane software for non-real-time O-RAN management
>> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
>> models. Provide capability exchange, configuration management,
>> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
>> R004-v18.00.
>>
>> NETCONF:
>> Use NETCONF protocol for configuration operations such as fetching,
>> modifying, and deleting network device configurations.
>>
>> S-plane:
>> Support frequency and time synchronization between O-DUs and O-RUs
>> using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
>> L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
>> UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
>> O-RAN.WG4.CUS.0-R003-v12.00.
>>
>> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>> ---
>>   drivers/net/mhi_net.c | 75 ++++++++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 62 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8e449b5a427993abf68e8d032fae2..fbec10c1ba9faf1ccf049b808e9d391800320989 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -4,6 +4,7 @@
>>    * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>>    */
>>
>> +#include <linux/etherdevice.h>
>>   #include <linux/if_arp.h>
>>   #include <linux/mhi.h>
>>   #include <linux/mod_devicetable.h>
>> @@ -38,10 +39,12 @@ struct mhi_net_dev {
>>          u32 rx_queue_sz;
>>          int msg_enable;
>>          unsigned int mru;
>> +       bool ethernet_if;
>>   };
>>
>>   struct mhi_device_info {
>>          const char *netname;
>> +       bool ethernet_if;
>>   };
>>
>>   static int mhi_ndo_open(struct net_device *ndev)
>> @@ -119,11 +122,29 @@ static void mhi_ndo_get_stats64(struct net_device *ndev,
>>          } while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start));
>>   }
>>
>> +static int mhi_mac_address(struct net_device *dev, void *p)
>> +{
>> +       if (dev->type == ARPHRD_ETHER)
>> +               return eth_mac_addr(dev, p);
>> +
>> +       return 0;
>> +}
>> +
>> +static int mhi_validate_address(struct net_device *dev)
>> +{
>> +       if (dev->type == ARPHRD_ETHER)
>> +               return eth_validate_addr(dev);
>> +
>> +       return 0;
>> +}
>> +
>>   static const struct net_device_ops mhi_netdev_ops = {
>>          .ndo_open               = mhi_ndo_open,
>>          .ndo_stop               = mhi_ndo_stop,
>>          .ndo_start_xmit         = mhi_ndo_xmit,
>>          .ndo_get_stats64        = mhi_ndo_get_stats64,
>> +       .ndo_set_mac_address    = mhi_mac_address,
>> +       .ndo_validate_addr      = mhi_validate_address,
>>   };
>>
>>   static void mhi_net_setup(struct net_device *ndev)
>> @@ -140,6 +161,13 @@ static void mhi_net_setup(struct net_device *ndev)
>>          ndev->tx_queue_len = 1000;
>>   }
>>
>> +static void mhi_ethernet_setup(struct net_device *ndev)
>> +{
>> +       ndev->netdev_ops = &mhi_netdev_ops;
>> +       ether_setup(ndev);
>> +       ndev->max_mtu = ETH_MAX_MTU;
>> +}
>> +
>>   static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
>>                                         struct sk_buff *skb)
>>   {
>> @@ -209,16 +237,22 @@ static void mhi_net_dl_callback(struct mhi_device *mhi_dev,
>>                          mhi_netdev->skbagg_head = NULL;
>>                  }
>>
>> -               switch (skb->data[0] & 0xf0) {
>> -               case 0x40:
>> -                       skb->protocol = htons(ETH_P_IP);
>> -                       break;
>> -               case 0x60:
>> -                       skb->protocol = htons(ETH_P_IPV6);
>> -                       break;
>> -               default:
>> -                       skb->protocol = htons(ETH_P_MAP);
>> -                       break;
>> +               if (mhi_netdev->ethernet_if) {
>> +                       skb_copy_to_linear_data(skb, skb->data,
>> +                                               mhi_res->bytes_xferd);
> 
> What is the purpose of the above?
> 
> 
> 
Will remove this line skb_copy_to_linear_data, as it does memcpy
again in same skb->data
>> +                       skb->protocol = eth_type_trans(skb, mhi_netdev->ndev);
>> +               } else {
>> +                       switch (skb->data[0] & 0xf0) {
>> +                       case 0x40:
>> +                               skb->protocol = htons(ETH_P_IP);
>> +                               break;
>> +                       case 0x60:
>> +                               skb->protocol = htons(ETH_P_IPV6);
>> +                               break;
>> +                       default:
>> +                               skb->protocol = htons(ETH_P_MAP);
>> +                               break;
>> +                       }
>>                  }
>>
>>                  u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
>> @@ -301,11 +335,14 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>>                  schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>>   }
>>
>> -static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
>> +static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev, bool eth_dev)
>>   {
>>          struct mhi_net_dev *mhi_netdev;
>>          int err;
>>
>> +       if (eth_dev)
>> +               eth_hw_addr_random(ndev);
>> +
>>          mhi_netdev = netdev_priv(ndev);
>>
>>          dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
>> @@ -313,6 +350,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device *ndev)
>>          mhi_netdev->mdev = mhi_dev;
>>          mhi_netdev->skbagg_head = NULL;
>>          mhi_netdev->mru = mhi_dev->mhi_cntrl->mru;
>> +       mhi_netdev->ethernet_if = eth_dev;
>>
>>          INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
>>          u64_stats_init(&mhi_netdev->stats.rx_syncp);
>> @@ -356,13 +394,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>>          int err;
>>
>>          ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
>> -                           NET_NAME_PREDICTABLE, mhi_net_setup);
>> +                           NET_NAME_ENUM, info->ethernet_if ?
>> +                           mhi_ethernet_setup : mhi_net_setup);
>>          if (!ndev)
>>                  return -ENOMEM;
>>
>>          SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>>
>> -       err = mhi_net_newlink(mhi_dev, ndev);
>> +       err = mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
>>          if (err) {
>>                  free_netdev(ndev);
>>                  return err;
>> @@ -380,10 +419,17 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
>>
>>   static const struct mhi_device_info mhi_hwip0 = {
>>          .netname = "mhi_hwip%d",
>> +       .ethernet_if = false,
>>   };
>>
>>   static const struct mhi_device_info mhi_swip0 = {
>>          .netname = "mhi_swip%d",
>> +       .ethernet_if = false,
>> +};
>> +
>> +static const struct mhi_device_info mhi_eth0 = {
>> +       .netname = "eth%d",
>> +       .ethernet_if = true,
>>   };
>>
>>   static const struct mhi_device_id mhi_net_id_table[] = {
>> @@ -391,6 +437,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
>>          { .chan = "IP_HW0", .driver_data = (kernel_ulong_t)&mhi_hwip0 },
>>          /* Software data PATH (to modem CPU) */
>>          { .chan = "IP_SW0", .driver_data = (kernel_ulong_t)&mhi_swip0 },
>> +       { .chan = "IP_SW1", .driver_data = (kernel_ulong_t)&mhi_swip0 },
>> +       { .chan = "IP_ETH0", .driver_data = (kernel_ulong_t)&mhi_eth0 },
>> +       { .chan = "IP_ETH1", .driver_data = (kernel_ulong_t)&mhi_eth0 },
>>          {}
>>   };
>>   MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);
>>
>> --
>> 2.34.1
>>
>>

