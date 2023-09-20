Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DEB3B29B
	for <mhi@lists.linux.dev>; Wed, 20 Sep 2023 14:28:41 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bffc55af02so60430681fa.2
        for <mhi@lists.linux.dev>; Wed, 20 Sep 2023 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695220120; x=1695824920; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtxCq9Na6rpCtPYQhYFE+hYkNtnlIQOOpKV463CAC6I=;
        b=VT7UZf6n3IHUc9itb7RsHTVHelmGwgO6PtX2aTKZp6pYgkSEQWoba7FKVIo/B9303x
         IzzER8RIGDtsQ4PeYrz4CIs4RC2CwWfPh+JFkT5pSGdc1RgKtaplR2eZH5nQZxDCvHW+
         FP4NU5VhlOFJQ9iYR5vHfZHJwDpXMBHr/F7jvc9OWjHzyG7kh7BBR5cM1EhH1vsxa7Kr
         riV8gnZGMbTDXME0ifyY31pa1pprLK/o1RivnjrWSsacWOVXA7gpMtEAi8rWmEPmYO4j
         2KsX1iuHsLcthES/bqeert7rRbtXkObKR0BPDmhTenKXcsAfi9YKDeUt79fGaUtB8Y9M
         8mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695220120; x=1695824920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtxCq9Na6rpCtPYQhYFE+hYkNtnlIQOOpKV463CAC6I=;
        b=vcsckxJ45lq5dvffIkESmR4Oa1Lw8mNYBca5KvH1M5O9M0axO2H76TdtSOzRjEKsPy
         5cDReYW/EIMD1cYM84staoE2DGKG8vGd29w8lUxSWcUXJ6xmNxi/SB8jPhwFdY5SucjG
         L4yvq8vQvGZCFMfdSRt11xnUHFWhmyMwUy6zLAUd5GKqwY4eWQphJTAWy14YPhyosNl4
         tRPhuuBFVeKQNLd6AtCMGC1nbKm1j8pkbzQxpCcDZVTzShLPcktFyt7BVSXXLUz5I2/z
         LzRXlkZD11HgYUb6zUpT2SlJGnvfYZI6972YAvNQGmgL1zI8jZ/qHXc2KHcaPAK+PGwu
         vPyQ==
X-Gm-Message-State: AOJu0YyCb7Zhlt5Gnln+Q5pZTCgGY1V18w2KLn9NgJ8onXBfF/kbyR83
	HsIqbEm7TPtd5fqE2aJrxeYcuA==
X-Google-Smtp-Source: AGHT+IHy7BqgLDFZs6UQbHtu2/7vJypH4EJX8MKjk8ev1/EHp8Jj55x1ob7FX8sqs1VAb0K4W9HOQA==
X-Received: by 2002:a2e:884e:0:b0:2bc:39f5:ecb4 with SMTP id z14-20020a2e884e000000b002bc39f5ecb4mr2411051ljj.25.1695220119763;
        Wed, 20 Sep 2023 07:28:39 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906390d00b00982a92a849asm9418489eje.91.2023.09.20.07.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 07:28:39 -0700 (PDT)
Message-ID: <911fd752-d5dc-79e2-91b7-74c70e5d8632@linaro.org>
Date: Wed, 20 Sep 2023 16:28:38 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 4/5] PCI: epf-mhi: Add support for SA8775P
Content-Language: en-US
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, mani@kernel.org
Cc: quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
 quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
 quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
 quic_parass@quicinc.com, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-phy@lists.infradead.org
References: <1695218113-31198-1-git-send-email-quic_msarkar@quicinc.com>
 <1695218113-31198-5-git-send-email-quic_msarkar@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1695218113-31198-5-git-send-email-quic_msarkar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/20/23 15:55, Mrinmay Sarkar wrote:
> Add support for Qualcomm Snapdragon SA8775P SoC to the EPF driver.
> SA8775P has the PID (0x0306) and supports HDMA. Currently, it has
> no fixed PCI class, so it is being advertised as "PCI_CLASS_OTHERS".
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>   drivers/pci/endpoint/functions/pci-epf-mhi.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index b7b9d3e..4b349fd 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -114,6 +114,23 @@ static const struct pci_epf_mhi_ep_info sm8450_info = {
>   	.flags = MHI_EPF_USE_DMA,
>   };
>   
> +static struct pci_epf_header sa8775p_header = {
const?

Konrad
