Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DBFBA55
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 14:12:12 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so12607325pjh.1
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 06:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ema866Q9GnNxgQKHvyrIyuwe5KFJZE/XRDwCNKuM4oY=;
        b=CCHJd+5nvBfwW1F8b13/1KmaksDWHOyYoWttddTZ4fIjFfbildvL2kZ5CmDqlkpCvn
         8TBfaw57qx+IGnAS+19ZM6q0ruEHSjmHfBvrnrgxIX0D+AtlZyNCzN6VOofJNiH8HR8g
         TZ70mmYz/M3XaR106mcSDeLbbUewuni9ofUXS2oQy69inbxZ/orv3HZPOD7xrJt7ubgS
         MXEUD601MPuYbyJfZTeLz1Y+cg+BNQsEfStMUTMXlN4btyqfxsnuLfjmtyzZyRi/j7eq
         rL9SIFYLUY3FUr/9EjuB3Y7Mhjm/auxTe7af4TAN8c+k59HlaHgdGMWtFkUr723/A8aY
         bKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ema866Q9GnNxgQKHvyrIyuwe5KFJZE/XRDwCNKuM4oY=;
        b=jqoDLZu7UBagwYK+RikPf8D0odiNgZZVPCQkQn0MlggWJLYJ6KMqQCnqB5iTGcLs+2
         O6SXvfE0Jfx3xqyOa78yXr5ZfKp4BOHuhfIlyk3+WiWHBuuEE648SomEio6l9z9pt1rn
         tvQ0nvU7nYBlLGV2+rtPDp4v6183pujBGv+0Jr7NtluLfcD4dfeEKnNijeG0BReqkZrS
         GD2RoG0MvrmYfS07n7ww9KIlIFYky20vwl7YChYpDfy0LfaTA11Q634BWgBI6/hZg1VL
         yYTVic1UpqrMayz+lpxeAHINGIqTe6EdeBjNRbAPpZcoQLHHGYiidQDts2ZNtAGJk5Hm
         9XkA==
X-Gm-Message-State: ACrzQf38EAlwHzWvdK/ff+a+lwzwI9ASNcWWotWEE4XFMv0t5uQ7CIME
	A2/uVmuDtRneX0osyfvanjP4NkQMgxQ=
X-Google-Smtp-Source: AMsMyM5D/FLmdIIRLLeWvu+81b2+0EFbqz8Vm3Eukb2huZy/Fiba6FOvd3Ygv+ErZuGTvRuKCXmncg==
X-Received: by 2002:a17:902:ef85:b0:187:85d:bd2e with SMTP id iz5-20020a170902ef8500b00187085dbd2emr48148239plb.31.1667830332194;
        Mon, 07 Nov 2022 06:12:12 -0800 (PST)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id j5-20020a170903024500b001785a72d285sm5097867plh.48.2022.11.07.06.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 06:12:11 -0800 (PST)
Message-ID: <9e2f84f5-72c3-1ada-0561-3d4f4ea06f7a@gmail.com>
Date: Mon, 7 Nov 2022 22:12:05 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 RESEND rebased] bus: mhi: host: pci_generic: Add HP
 variant of T99W175
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
References: <836f0bd5-0f38-dbf1-c3a0-d670cc09cb2e@gmail.com>
 <20221107135207.GG2220@thinkpad>
From: Song Fuchang <song.fc@gmail.com>
In-Reply-To: <20221107135207.GG2220@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


在 2022/11/7 21:52, Manivannan Sadhasivam 写道:
> On Mon, Nov 07, 2022 at 09:10:47PM +0800, Song Fuchang wrote:
>> The Foxconn T99W175 modem has an HP variant, which has
>> the following output from lspci:
>>
>>   01:00.0 Wireless controller [0d40]: Device 03f0:0a6c
>>
>> It also has some HP-specific serial numbers on the
>> metal case. It works well with this driver, so add
>> support for this to the pci_generic driver.
>>
>> Signed-off-by: Song Fuchang <song.fc@gmail.com>
>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Still it didn't apply using git am. So I went ahead and applied manually to
> mhi-next.
This is strange. I have already rebased to the latest mhi-next tree, and this patch applied without error.
>
> Next time, please try applying the patches to mhi-next before sending to see if
> everything is fine about the patch.
I guess I should not use thunderbird to send this patch? I'll take care of it next time. Sorry for this mistake!
>
> Thanks,
> Mani
>
>> ---
>>
>>
>> Changes in v2:
>>   - Add more detailed commit message and rebased on mhi-next.
>>
>>
>>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index fb3b050aed70..b58a30367896 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -598,6 +598,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>>         /* MV32-WB (Cinterion) */
>>         { PCI_DEVICE(0x1269, 0x00bb),
>>                 .driver_data = (kernel_ulong_t) &mhi_mv32_info },
>> +       /* T99W175 (sdx55), HP variant */
>> +       { PCI_DEVICE(0x03f0, 0x0a6c),
>> +               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>>         {  }
>>  };
>>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
>> -- 
>> 2.37.3
>>
>>
>>
