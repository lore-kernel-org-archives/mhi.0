Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929B3E1239
	for <mhi@lists.linux.dev>; Tue, 26 May 2026 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795310; cv=none; b=JiNA3UOwtB0IJPVHt6BwL0g/kluULyKbb6CrVMyHBTBRuETyPa+KTsvBS4y5D9XiXRWReBCCYqk5A7osrnwLUBzkoZcpl3cip8Bl8H8AdSoONPMqUqwqGCppyUrarzgl184ZCwZdq8zoUvz+Q1X3G7yVKEOIGPZV9AeuAWnVkec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795310; c=relaxed/simple;
	bh=ocxFYI38hxzb1ERZvNMOfcjBpfFa+PxSGRxdLDGrzLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoqJgxXWAGt44ycCUoUF6UkdnFsnkmDzPi46yzaKwa5TyOb4xGBTiuidnidfTjp24TSR2Ol75kLaKMLxjDaKBld7eh25jdNyx6e4gpLkOtK9/c4BZB7ao2739HrtwYEBvRaJD4mqJRQvorsblC1dpjbNV//B/ISQpAGz0cyRZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+VOOCHB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+VOOCHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779795294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
	b=X+VOOCHBPLPKsjaKrZYCJrqdeKMKq/0CExH2fF3OgoW+y0CoHU5AJ0Cgg4XfFyH0wTwUri
	2RhTtJDZjvZmOUugidupieE5lYgFf20Uru+vUxaRWS7HvxGlXIlvO1ZOj+UU2zuEByPmcc
	W2dcBKsQCPSC0BZSlmIYugi2BEcz/0I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-ts-zT1L-P5W10dHPdDUO-Q-1; Tue, 26 May 2026 07:34:50 -0400
X-MC-Unique: ts-zT1L-P5W10dHPdDUO-Q-1
X-Mimecast-MFC-AGG-ID: ts-zT1L-P5W10dHPdDUO-Q_1779795290
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48feb0298d7so84678005e9.1
        for <mhi@lists.linux.dev>; Tue, 26 May 2026 04:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795289; x=1780400089;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
        b=T+Z49CxWQFx2UsTG0UKp69RCYLbY9cYQA3Vpcfnq1kZhDUj8uIBBTXTlhkBHH3M+kb
         VSiZ98IunLPtryzSRFqXlF/kqzMyTVNs2fNNFkwk8MwUnE4TKATz6foIN5knNOe6sAqp
         5XvkrlKztye+rkCkfM2X5nj2/LDwQqV8L5eluCmnFS5iH8A/3bLcyk5CCmMp991o3pEe
         Dv9N2Q9JqmU88t6jkVxQBoBPkePeB6/L6oZqMciVLbNFRnYQkZGfdjT30w3YyDO0KOGk
         KptkasANnI7kIg9PHvVZ/G8lVbsfTh1MGR8real8JSJeAeRwex9gd7fHEsJSGqt2gMFx
         0OyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tpX4WHPHU/EUMCW3vTNeriyE6zeyFW+fcKe0t0yWwAUjExF+3vAp4MFgejA44hkC/xZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YznToBGNsr/BBjjIbzOE86ETrKrctPE7wP9lszExfyIuBnwqf5j
	6vu/mA5a1IPqLiYmnij7bPhiWcD/cqd7QFjxY7dQ18rLK3VGC/RX99FAiTiXhyw/T0NgVHzZmB6
	0seVMsbtwUBtlXoSq6/F+lR+pPy8xbvhfGluZRvWuOAxBqxJpRWMVug==
X-Gm-Gg: Acq92OFJSdSF56npry5QyNYWmcak3eakAwUUYOIP+I8vsHokooJTWxxNa/DTQSF9jF7
	DBv6njmKGLJFfE50HhL5nkKQVidCXr7M5lxtwI9uL32om4UJLtyH5iATp4SWYe7wYRZWmAcd1ge
	s9Vv++Epj/YT2OYaf7CtdOSiRAzxHzqrnlEkZPCBjSuXRwyM36l5JMUfleH1FbMbSUsP5Kr6GOJ
	1QeV/8vCqTOCfulJJyCqsBQK168tFmp+0lJjruPy71yQ6aPOw1dgMePlaMdNpx3dg5AkO5wGH2T
	TcO4qZIWiScO1/GHHlcHobpFZIwbv13LtDphLCLQUoaZZSxgLaexVSn3SJObNXebKTAJ5YuipG7
	1cNBC+GQ3geivfC//6cE4RE3fRf6G7NX0/H/QZsLnzSK1uuCfnon0LA24mg==
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275107475e9.11.1779795289587;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275106815e9.11.1779795289064;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm565711385e9.1.2026.05.26.04.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:34:48 -0700 (PDT)
Message-ID: <5a54d307-0b8c-468d-9183-6433f9daba56@redhat.com>
Date: Tue, 26 May 2026 13:34:46 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
 quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
 <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ms0fR-Zv_dJ10Ch6IGiyWQi4wh_ErQpt560-bsXF5a0_1779795290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/22/26 10:09 PM, Loic Poulain wrote:
> On Fri, May 22, 2026 at 12:01 PM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
>>
>> The mhi_net driver does not coordinate with runtime PM, which allows the
>> underlying MHI controller to be runtime-suspended while transmit, receive,
>> or RX buffer refill operations are in progress. This can lead to stalled
>> transfers or failed queueing once runtime PM is enabled in the MHI core.
>>
>> Add runtime PM reference counting to the mhi_net data path to keep the
>> controller active for the duration of TX, RX, and buffer management
>> operations. Enable runtime PM during probe and take/release references
>> explicitly around these critical paths.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8..5d7f9ccdb17b 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/mod_devicetable.h>
>>  #include <linux/module.h>
>>  #include <linux/netdevice.h>
>> +#include <linux/pm_runtime.h>
>>  #include <linux/skbuff.h>
>>  #include <linux/u64_stats_sync.h>
>>
>> @@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>         struct mhi_device *mdev = mhi_netdev->mdev;
>>         int err;
>>
>> +       err = pm_runtime_get(&mdev->dev);
>> +       if (err < 0 && err != -EINPROGRESS) {
>> +               dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
>> +               pm_runtime_put_noidle(&mdev->dev);
>> +               goto exit_drop;
>> +       }
>> +
> 
> I am wondering what the value is in pushing this PM responsibility to
> each individual MHI client driver and requiring every MHI operation to
> be bracketed with runtime PM handling.
> 
> What does the client driver know here that the MHI core itself cannot
> handle centrally? It feels like ensuring the controller is
> runtime-active during transfer could be handled generically in the
> framework instead of duplicating the same logic in every client.

Indeed if *feel* like the MHI core should be able to put together all
the status needed to correctly track the PM.

Adding PM tracking to the NIC driver network data-path looks quite bad.

/P

