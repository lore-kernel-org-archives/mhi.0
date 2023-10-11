Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13235506
	for <mhi@lists.linux.dev>; Wed, 11 Oct 2023 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKvtS2iY"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so86847201fa.3
        for <mhi@lists.linux.dev>; Wed, 11 Oct 2023 04:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697024106; x=1697628906; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Qapw6Vwkgw3j/x2kavvMeUiB4u4WXfkqK2WO2XBHoI=;
        b=rKvtS2iY4BF3ULbnBmqXjuWoZ9T4rmEm6GyNlHqSHGlyqKzn6xSiNfoj+zGsN09W9f
         /6Cyqr1hmo0oHhe53r6LBPrloI2adhhaxd17DYRV+4IuBFWlAm6K1Nnpj1yOX5Eafg4X
         0XawBxSThDWCt4blBlIVvNazXrgaPQXn+RaPQKYB0KeFzVcDfK4aQyPLGu5cI1TXXWvx
         vR72St3CWoq0Rho8DcniDhj7jShp95X/BP7qFeNvw/O/B5UAevB90Xbjs8R/Uma5Hj/b
         QBmL6UFILoEwTBWzToHLUi7kR3+iGxEAyVqKkVH+6oaV4ga+wq8Z3PfTZ6MTUTct4PKg
         bN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024106; x=1697628906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Qapw6Vwkgw3j/x2kavvMeUiB4u4WXfkqK2WO2XBHoI=;
        b=XQU3ZaP5pTLq1fs/nttLthlScxl7tieIkuoHnn+uDqen2/JzcGhKUytvmm6LVCiGom
         cILE68txO89bFcCzh2Kb0z5dHpHWzSlC6VR8g361qUmzmJUEtJ2jmtWjv8mjLt63HpKi
         BMtFiaiLosqGWmZZe+X8n3fXz4fBOcU9GXxI8BatP5avzxjbSz4uUMRlQ9Y7H7r3yGgk
         B9swrpcA1MTxCtDw9+mP3WE5N3SWsxNeUhlQx37oxioPBc2dBulp4lr9DeQDfU7JL0XN
         ZbKRZlC5nj504s9ROnu/WN878bo+mkbezCl2xCyBuvG/h2/bT9kLI2LOWLvyPtCds94r
         l/NA==
X-Gm-Message-State: AOJu0Yy9JLF0AeC9Te8R8rzaWG6aeQrIwrkDOwKHgUu/8WGMQXyOwoQR
	UbN0bW7KIoluWfUAEHlzgJ7bPQ==
X-Google-Smtp-Source: AGHT+IF5GLRI9qQunLWRzrMod3FWnDE+uoxeFzNq35YPTOaf98ygydLZmEYH1BWul8Cf/WIu46bWag==
X-Received: by 2002:a2e:9e53:0:b0:2bf:fa62:5d0e with SMTP id g19-20020a2e9e53000000b002bffa625d0emr18110256ljk.2.1697024105878;
        Wed, 11 Oct 2023 04:35:05 -0700 (PDT)
Received: from [172.30.204.240] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c5-20020a2ea1c5000000b002bcbb464a28sm2882350ljm.59.2023.10.11.04.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 04:35:05 -0700 (PDT)
Message-ID: <7297b408-06e8-41f3-a732-64c3cc3194e1@linaro.org>
Date: Wed, 11 Oct 2023 13:35:04 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] arm64: dts: qcom: sa8775p: Add ep pcie0 controller
 node
Content-Language: en-US
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: agross@kernel.org, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
 quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
 quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
 quic_parass@quicinc.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-phy@lists.infradead.org
References: <1695218113-31198-1-git-send-email-quic_msarkar@quicinc.com>
 <1695218113-31198-6-git-send-email-quic_msarkar@quicinc.com>
 <20230921094823.GE2891@thinkpad>
 <ca898b48-78e0-4bc7-c88c-a33338e7e47a@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ca898b48-78e0-4bc7-c88c-a33338e7e47a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/11/23 12:44, Mrinmay Sarkar wrote:
> 
> On 9/21/2023 3:18 PM, Manivannan Sadhasivam wrote:
>> On Wed, Sep 20, 2023 at 07:25:12PM +0530, Mrinmay Sarkar wrote:
>>> Add ep pcie dtsi node for pcie0 controller found on sa8775p platform.
>>>
>> It would be good to add more info in the commit message, like PCIe 
>> Gen, lane
>> info, IP revision etc...
>>
>>> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
>>> ---
[...]

>>> +        max-link-speed = <3>;
>> Gen 3?
> there is some stability issue with gen4 so going with gen3 as of now.
> Will update once issue is resolved.
That's something that should have definitely been mentioned in the 
commit message..

Please try resolving this first, if it ends up requiring bindings 
changes (missing clocks or whatever), it will be a pain.

Konrad
