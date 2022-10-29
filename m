Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589315AD
	for <mhi@lists.linux.dev>; Sat, 29 Oct 2022 13:19:55 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso12300125pjc.0
        for <mhi@lists.linux.dev>; Sat, 29 Oct 2022 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9U/vzPhxneGrDLg9eA7v9NIcEn0AHq6pgQwYzxT54k=;
        b=aqo2Meb5Moj17hEc6Y/7TkomJfxRLzzGc2hdB/Al0AS8RFKyn7TI1sIgt3G/HXOu6X
         mOBPXYiDTJM5u82X0GtC5Ea2lRmbchL+n6qcXUBnCPbRZ9yyFifukdoo/zk1emjMaU9F
         JZH9c8bPQI5CNy1kIXQyaTBp+NXVJo1cvtQ96Kn0au+Yz2lmBVAfxypxJrqVv/x2FSpT
         9E/APOrND4Mt6FozX53P2yY1C1VYDfxdoS33F+QjUn6Y/hlU7wmPWANZEAouPSuxec7N
         YKe4ShGpZzedm7JlVhxJW2vUavIMRV3Msn9Tp0iLxwgt9MnMmyvSNbL2DuROg/vZni7u
         4xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9U/vzPhxneGrDLg9eA7v9NIcEn0AHq6pgQwYzxT54k=;
        b=An0c6zKDaMLxK+oZNdjMIpNvzMCzJqmC70ecIISNvEWb6GGwYAwd2Pugxx5o31gwEm
         jNLrY7Hir7fbqrAUGTSb/RNARFa7RMHuLTwtPWTup+lekMaSdX+BQ0EdUNCvp+yV11OK
         6qfnoiChHzaPhLM/7UmPtvBe+NPj8FDyaMoSlYvGb4Dn9+Ol3AM8J5H9zjrQj5/YaYFN
         W4afLNJBg2YIRKzdGH5CzIoB5hQs8L9G9eEnnuk7GlaaQJotFEZ4I2+1afQa4KKEMKuf
         lbP0YP1Inre9wfaR8DUtaMXGpEISH1U86zKLChy8amjMhAzbDeVGFkyWu4ywNspEUw1p
         nC2A==
X-Gm-Message-State: ACrzQf1+NUe+EgxWQSh0mutViqUI8xunIUcP2awbh+CMGOOcmH8lXawf
	F38mk/D7iOCKCjevKV4D/mM=
X-Google-Smtp-Source: AMsMyM4zvUpFj8Qt3nmWPcEjZFKu7ljsz/Qkg8vILPPVwvDB7UszdiL7bmQvzjRG7zxsx/G7zh6Nvw==
X-Received: by 2002:a17:90b:4d84:b0:212:c78f:8d6e with SMTP id oj4-20020a17090b4d8400b00212c78f8d6emr4591084pjb.201.1667049595228;
        Sat, 29 Oct 2022 06:19:55 -0700 (PDT)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id q16-20020a17090311d000b001745662d568sm1246525plh.278.2022.10.29.06.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 06:19:54 -0700 (PDT)
Message-ID: <7c93e208-3d2e-2884-21a6-efebc1812e8c@gmail.com>
Date: Sat, 29 Oct 2022 21:19:46 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RESEND] bus: mhi: host: pci_generic: Add HP variant of
 T99W175
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, manivannan.sadhasivam@linaro.org,
 quic_hemantk@quicinc.com
References: <676290c3-0435-d85c-99dc-084f120ee04c@gmail.com>
 <20221028172704.GE13880@thinkpad>
Content-Language: en-US
From: Song Fuchang <song.fc@gmail.com>
In-Reply-To: <20221028172704.GE13880@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, this modem is really a T99W175, but the vendor id 03f0 is for HP 
Inc. It also has some HP-specific serial numbers printed on its case.

Output of lspci for this modem:

01:00.0 Wireless controller [0d40]: Device 03f0:0a6c

I don't know why the HP's variant uses a different VID, maybe some 
business decisions? Though it works well with this driver on my laptop.

Thanks!

在 2022/10/29 01:27, Manivannan Sadhasivam 写道:
> On Sun, Oct 09, 2022 at 11:34:39AM +0800, Song Fuchang wrote:
>> The foxconn T99W175 has an HP variant, so add support for it to the
>> pci_generic driver.
>>
>> Signed-off-by: Song Fuchang<song.fc@gmail.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c
>> b/drivers/bus/mhi/host/pci_generic.c
>> index 9e545f2a5a26..650e8b9c26ad 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>>       /* MV32-WB (Cinterion) */
>>       { PCI_DEVICE(0x1269, 0x00bb),
>>           .driver_data = (kernel_ulong_t) &mhi_mv32_info },
>> +    /* T99W175 (sdx55), HP variant */
>> +    { PCI_DEVICE(0x03f0, 0x0a6c),
> Why a new VID for this modem? Other T99W series modems are using PCI_VENDOR_ID_FOXCONN.
>
> Thanks,
> Mani
>
>> +        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>>       {  }
>>   };
>>   MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
>> -- 2.37.3
>>
