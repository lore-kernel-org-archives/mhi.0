Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0977C
	for <mhi@lists.linux.dev>; Tue,  1 Nov 2022 12:55:20 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id y13so13373565pfp.7
        for <mhi@lists.linux.dev>; Tue, 01 Nov 2022 05:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zNDEojxblVhvbVLuVkkuMKXQJh/LaQWmDtunJFan3I=;
        b=DqwGRmrdt2Wo56rpmOBwg4dfX2PvaKpxR+FZo/70QsE+E4ce0bd3wfCzSGMvCCmHwR
         RS+knK0FYp5tn1MIwbWYqEZsdCOkDTEXdhPCNFakUCSkfg5MeghGjd9USDEboHaIM6IG
         UwR4W4i55RhEUcm0ILcA6MUYOUHn6LzCywjuAqqaltXutc77HsvTiiTJp5oSjnjZQOyY
         NFKUWVeh38ZIrkVwYEwkmwtVhM3V022EV5QfRpKtYuy+DtHe8VCT//oF89ykA1owEes2
         DKPCAue69sTFxK2cUGUJz8ZBK1QqdIvFjhNae+j1H09W9n/H3d7pJm+TkBYOJwzvu995
         KByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zNDEojxblVhvbVLuVkkuMKXQJh/LaQWmDtunJFan3I=;
        b=kDcQO+jPeSy6FALFa6GI6E430yAzf8Zr3ilxPlvikZL0n0RsdeTy679CYNhkWzWZ5H
         jJ3JUWZjIqcR+Z6TveJe1MjBzpPZI+Tcx3SObSmJZr5eZE0dblPEhYNQ2kk7q0VUYxZa
         Ww9S7Af03gYqyQUSEVOpO4wfD9kahgKXvwHG/lHBVe7h/YSJe7q40Hloutr6xWw0F4IQ
         I7rbLZLEvQdLvLNnAPAGn7Vebl/wF7Wj3zzGgyTDx44cC24KYFZbas593d7kW7J0M1Ru
         gq4oEW7LLW+0YB2E7g09+wIfZBQZ/4KFD4E/0kftOWDUbvIsU3NiFrwsEfpS2g5FBNnD
         BHRQ==
X-Gm-Message-State: ACrzQf3+SEVSPDJ8aNmfU4f0yeLaoN62sOWb75lbhYzjGjE2M8/1AYY+
	LxIzU/gAYB9ItullIBKVp1s=
X-Google-Smtp-Source: AMsMyM4cnh0msT9ILwXxFvWQQ5WwYa8f1RcXIVoyXmcqbHnRJZPFADSoX9n8VpivsplmyaCIB4jsBQ==
X-Received: by 2002:a05:6a00:cd6:b0:56d:9a94:4075 with SMTP id b22-20020a056a000cd600b0056d9a944075mr7371301pfv.67.1667307319771;
        Tue, 01 Nov 2022 05:55:19 -0700 (PDT)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id t12-20020a17090b018c00b001fd6066284dsm5926448pjs.6.2022.11.01.05.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 05:55:19 -0700 (PDT)
Message-ID: <bc4b0846-841a-7f4a-1ea1-b8976be77229@gmail.com>
Date: Tue, 1 Nov 2022 20:55:11 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH RESEND] bus: mhi: host: pci_generic: Add HP variant of
 T99W175
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, manivannan.sadhasivam@linaro.org,
 quic_hemantk@quicinc.com
References: <676290c3-0435-d85c-99dc-084f120ee04c@gmail.com>
 <20221028172704.GE13880@thinkpad>
 <7c93e208-3d2e-2884-21a6-efebc1812e8c@gmail.com>
 <20221101114441.GC54667@thinkpad>
Content-Language: en-US
From: Song Fuchang <song.fc@gmail.com>
In-Reply-To: <20221101114441.GC54667@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2022/11/1 19:44, Manivannan Sadhasivam 写道:

> On Sat, Oct 29, 2022 at 09:19:46PM +0800, Song Fuchang wrote:
>> Hello, this modem is really a T99W175, but the vendor id 03f0 is for HP Inc.
>> It also has some HP-specific serial numbers printed on its case.
>>
>> Output of lspci for this modem:
>>
>> 01:00.0 Wireless controller [0d40]: Device 03f0:0a6c
>>
>> I don't know why the HP's variant uses a different VID, maybe some business
>> decisions? Though it works well with this driver on my laptop.
>>
> Okay, thanks for the clarification. Could you please add these info to the
> commit message for the record?

Sure, I will send a v2 patch with detailed commit message.

> Thanks,
> Mani
>
>> Thanks!
>>
>> 在 2022/10/29 01:27, Manivannan Sadhasivam 写道:
>>> On Sun, Oct 09, 2022 at 11:34:39AM +0800, Song Fuchang wrote:
>>>> The foxconn T99W175 has an HP variant, so add support for it to the
>>>> pci_generic driver.
>>>>
>>>> Signed-off-by: Song Fuchang<song.fc@gmail.com>
>>>> ---
>>>>    drivers/bus/mhi/host/pci_generic.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/pci_generic.c
>>>> b/drivers/bus/mhi/host/pci_generic.c
>>>> index 9e545f2a5a26..650e8b9c26ad 100644
>>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>>> @@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>>>>        /* MV32-WB (Cinterion) */
>>>>        { PCI_DEVICE(0x1269, 0x00bb),
>>>>            .driver_data = (kernel_ulong_t) &mhi_mv32_info },
>>>> +    /* T99W175 (sdx55), HP variant */
>>>> +    { PCI_DEVICE(0x03f0, 0x0a6c),
>>> Why a new VID for this modem? Other T99W series modems are using PCI_VENDOR_ID_FOXCONN.
>>>
>>> Thanks,
>>> Mani
>>>
>>>> +        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>>>>        {  }
>>>>    };
>>>>    MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
>>>> -- 2.37.3
>>>>
