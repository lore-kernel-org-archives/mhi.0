Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE736B04
	for <mhi@lists.linux.dev>; Wed, 20 Sep 2023 14:24:33 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9a65f9147ccso907820066b.1
        for <mhi@lists.linux.dev>; Wed, 20 Sep 2023 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695219871; x=1695824671; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNbD5JZlT85L92cZjusJkHp4jtK/JZ5bz82Z9IIMDbo=;
        b=EYwofstr02YcBpN9cSQ/Y4W8mn46a6PqYJfwQmvb53DtkQRJzmVlDqcAe0fh0Sngo8
         jGx0u0xFmjqapLvg/DZZmQ3SxyDvjqDVSPSRZCbZlMhTQvBO1ed6YUFr1gGKwKff045f
         eJptEN742/QZTrGU9VzirRWZrt0C8k2xm/PII8zbBVRr9fX1xDcAKeFh3EiQZOIhR+9R
         AcHZ40Zh214THn2hTgB8NSj22bQreFiRFJxjM8Jz9LntZwv9NZRPF7GCSvcSBNIgmVve
         z5dsDs9K3fF7nSB5w2FJhkN9G6g7hx37izi9q7gvHgNHGDcU5x0J3UtmY0VCwZ4hiTn6
         6BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695219871; x=1695824671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNbD5JZlT85L92cZjusJkHp4jtK/JZ5bz82Z9IIMDbo=;
        b=NV3l4sZSvFiEPzerLWQN88vf/wL9thdZqLNS7Q8UfeiQ0QuwpIkoMvsVU2ij8JqM38
         8R6jVmxzkTLErsPKqZdYM4gng5dArPIHA0nndcVEq2KEdKn31EaLv6K10nwt5Jmn2N+a
         NJMm2lqIE04PzuCrQiDviCqWQ3nW9rFRB/zmhnr0mYiL9tHEhLn/fzGoGRcCaRsV0TDK
         /MGQSbugdx0Ms553oIdLBf3zsAp3wBh6j2s82mKpB2SRW7M0+Clmh7iYqKjJ3bDAGW2o
         2t7o3krgG2fLaO0mx9WY7MVQBB54y6HjBeJWZ0nwQRi8B9oYqtOohaWlkHhwC230MUu5
         FcEw==
X-Gm-Message-State: AOJu0Yy5GwZ71N5DXzLAr+af/Uz1ysrsoyaAxACHRiHiYAXDuYYjonxB
	UNRtoHV+o6vDqonC84D7zX1AOw==
X-Google-Smtp-Source: AGHT+IEWeR4ibVo/0lBYIQnbCIzA4Q1ZL7a5w7fDqs/tLyxpyOxPFsZtH1PIFFFFdedlS+oRgvhRMw==
X-Received: by 2002:a17:906:225b:b0:9ae:541e:7310 with SMTP id 27-20020a170906225b00b009ae541e7310mr477368ejr.33.1695219871576;
        Wed, 20 Sep 2023 07:24:31 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id lg13-20020a170906f88d00b009ad88839665sm9435005ejb.70.2023.09.20.07.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 07:24:31 -0700 (PDT)
Message-ID: <4b20d3bb-d2d2-0864-013f-104e26ae558c@linaro.org>
Date: Wed, 20 Sep 2023 16:24:30 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 2/5] PCI: qcom-ep: Add support for SA8775P SoC
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
 <1695218113-31198-3-git-send-email-quic_msarkar@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1695218113-31198-3-git-send-email-quic_msarkar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/20/23 15:55, Mrinmay Sarkar wrote:
> Add support for SA8775P SoC to the Qualcomm PCIe Endpoint Controller
> driver.
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
This compatible does not bring anything new to the table
on its own. Please create a fallback compatible, document it
in the bindings and use that. See [1] and [2] for example.

Konrad

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml?h=next-20230920

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/pm7550ba.dtsi?h=next-20230920#n65
