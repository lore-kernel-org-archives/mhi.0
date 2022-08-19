Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD82F52
	for <mhi@lists.linux.dev>; Fri, 19 Aug 2022 13:54:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gb36so8905143ejc.10
        for <mhi@lists.linux.dev>; Fri, 19 Aug 2022 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ujtjVFJx0V5YMLHqbBS7t4234aedyxmmWb+qMI2rgj0=;
        b=x9b7HCU2Kgz9reCaGor+YLSLJPDhU6Q29YR2eQQAxu5PedX9SvXlpDKtU+a4Ya5dMK
         1df3QC+gOXf2mWSPFxldNvhUqVkISjoeqhP7vVB1d4Am553lsiz7Ds6VU8s6qxeqE45M
         7y9J1HaMnv+D/Siqnf5IYoHGAXLC73z4EO/mD/g62oOaiU30j764OBiRR7i+fCHvtF46
         bwEgXNFD/zaIt7LcnKY/PUri/4KguPEqldr4lzm2KAaVK5r7JUYVSYAkp1Pz1TQlgAMZ
         9jRAsuDedH/p5No6WYn1xGzigXu4YFSpZPFWxSrtPSZ3Nz8D+EhkjhTjPRAEW6xlnzUS
         LryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ujtjVFJx0V5YMLHqbBS7t4234aedyxmmWb+qMI2rgj0=;
        b=1AvguJKjoMTRIscyVapW2vajHu/NjKCRTLuGFvHcJ3RJJSjylnimhBFY57We3rvkFZ
         Ii3N9FZ7041NqwYS+47qUjHv+zd8+il1MFKyYRiCrDyCUO1XFZqFSWuVyScMamP/e6T+
         fF9hrYXVruxnGZtCo4P4tFXzE+1ILR2OR7QEYJFcstY58a8pKynm7OCCwEICZqu+1vXY
         ZbCp+Hdv2/jq9Qf/LXuqkFspIrZtst+nafcdqHWNcyWwnC6qZ657PCfULaqUYvp82KyR
         kxYizNMaSRrDFnInwZKTxZ1rwEeYj/yDguX0kL3ovZ7/EsURLuohQGeLc5ZmKLNS2OuW
         oQ7w==
X-Gm-Message-State: ACgBeo3iu55xFdI2Lx14oCAChq2jI9c1OyfAf9f0e8gwPX23TZcOz918
	yGg5ZXruZmTqw2X8MQJQp6j/SQ==
X-Google-Smtp-Source: AA6agR4d10Ahx3vU35ke4eMAzcpZ8isA0v3iiPzO6BErC+D0Vr4VHCaH+C9tuYYFuGaxTqbDYPu2ag==
X-Received: by 2002:a17:907:7d91:b0:731:7ecb:1e5b with SMTP id oz17-20020a1709077d9100b007317ecb1e5bmr4892156ejc.78.1660917248463;
        Fri, 19 Aug 2022 06:54:08 -0700 (PDT)
Received: from [10.202.0.7] ([31.31.140.89])
        by smtp.gmail.com with ESMTPSA id kx10-20020a170907774a00b00730cc173c6asm2379450ejc.43.2022.08.19.06.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 06:54:07 -0700 (PDT)
Message-ID: <4a28a2cc-b961-c790-bdbe-7c0da532e6e6@citymesh.com>
Date: Fri, 19 Aug 2022 15:54:07 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] bus: mhi: host: always print detected modem name
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev
Cc: Koen Vandeputte <koen.vandeputte@ncentric.com>
References: <20220819083615.251960-1-koen.vandeputte@ncentric.com>
 <f10a67d1-9ce6-d037-bf48-4cda8b3d5b29@quicinc.com>
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
In-Reply-To: <f10a67d1-9ce6-d037-bf48-4cda8b3d5b29@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 19.08.22 15:24, Jeffrey Hugo wrote:
> On 8/19/2022 2:36 AM, Koen Vandeputte wrote:
>> This harmless print provides a very easy way of knowing
>> if the modem is detected properly during probing.
>>
>> Promote it to an informational print so no hassle is required
>> enabling kernel debugging info to obtain it.
>>
>> The rationale here is that:
>> On a lot of low-storage embedded devices, extensive kernel
>> debugging info is not always present as this would
>> increase it's size to much causing partition size issues.
>
> With dynamic debug, you can turn on this one specific log and nothing 
> else.  Seems like it would have the same effect as this change.

Hi Jeffrey,

This is exactly my point.
A lot of targets using OpenWRT don't have dynamic debug featuring 
compiled-in as it enlarges the kernel too much :-)
Also, it seems pretty logical to at least simply show which modem type 
has been detected on boot.

Also, I'm currently encountering a bug using MHI on kernel 5.15.x which 
was a pain to debug without this print:
- Using a FN980v1 (which is available in the PCI list in pci_generic.c)
- The modem is always detected as generic sdx55 iso the more specific 
fn980v1 (all ID's match perfectly, and sdx55 is defined behind it, but 
still ...)
- Enabling dynamic debug on MHI parts when build as a module didn't work 
at all

I had to manually add this proposed patch to detect this wrong behavior

>
>>
>> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c 
>> b/drivers/bus/mhi/host/pci_generic.c
>> index 9e545f2a5a26..51e2b901bae0 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -841,7 +841,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *id)
>>       struct mhi_controller *mhi_cntrl;
>>       int err;
>>   -    dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>> +    dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>>         /* mhi_pdev.mhi_cntrl must be zero-initialized */
>>       mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), 
>> GFP_KERNEL);
>
