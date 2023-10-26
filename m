Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF4113FEB
	for <mhi@lists.linux.dev>; Thu, 26 Oct 2023 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXlL+GLY"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-508126afb9bso1017453e87.0
        for <mhi@lists.linux.dev>; Thu, 26 Oct 2023 04:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698318603; x=1698923403; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFDGqzAkT9v30DUvgbeN8oVGeAg1rb9jZ6McermBiCw=;
        b=AXlL+GLYmhOJvChNw0E1CKayuLp8PIMVNGd4xb7544LKjixeO2vkYR+qOEstjmwWQO
         PQqQ1YLsR3X/CXr4qxEI4Au9+EHvGNi3UXdoWkqetOZH0WOWaATSAtmoOpuOelOiWGxJ
         jmHC3RYFliaX7vjQb/McZ43T46b+VWnPnKCUC1UWiJoATYrCIw3AQQTbYzPNWPvxe8Oh
         6oIT3mtZ0eL8DH7UeVcxzdtHEwFIB+Z9LU+eVI/KN/sCJ/2sz0NxxDNWZXgbBqeQYbod
         tWBl40Rt9ynhKq41qKv6/e9LsFnyY6n83EKoF+2juwkABVfX6ykzZ6grTtLwLfH1zTQb
         rijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698318603; x=1698923403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFDGqzAkT9v30DUvgbeN8oVGeAg1rb9jZ6McermBiCw=;
        b=KIF8TMZoibrxYMmFPgRR77Pt+8ViaSxC4JXjRFnIomD3J95duY0+EV8AlV1CZzH4ag
         6cvaTX5kmVswHiNVJ4j9t2pAKNwVJKNcR1+m05toVwUCJMasEaOMy/IrUlepjqX2cejc
         XMGe0m3GIGKVYoJdT/xujhyn2PEG4ahOBpSKrGZLtZqsXIU+MQEoshHHVfdEW/v72gi8
         WUC442diE9U9/rC63Zt5BxfbeoQM2y4o4N1CxqSPAisVpyHRbhZbsgux+rfb5/U45kTA
         hlwu5JJktUf0bgv2g28y53DvX/UPXdL+GfIsoBOtoHGnPVTvtYKqxuNH2WTT0fbtzsqs
         iuYA==
X-Gm-Message-State: AOJu0YxXPMmGBvybLFvwePdmtHPYQ1FoBIPyR5aZlFCkyYAIliu3feGg
	zh7yRw9DLPH+Y+1FmErdfQCwiA==
X-Google-Smtp-Source: AGHT+IGZ7Bx52xZjwNOsaoIwxTO6OODdxBXVzVwSUitUkgzo3/Zs2ma5n6Xswx3q77LV4oLmE5LW9g==
X-Received: by 2002:ac2:44a5:0:b0:503:7fc:8afe with SMTP id c5-20020ac244a5000000b0050307fc8afemr12673901lfm.1.1698318603147;
        Thu, 26 Oct 2023 04:10:03 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u15-20020a05651220cf00b00507abbaeb22sm2984919lfr.301.2023.10.26.04.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:10:02 -0700 (PDT)
Message-ID: <fb0647b5-67c4-4558-ac41-ee2b21446ee2@linaro.org>
Date: Thu, 26 Oct 2023 13:10:00 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] PCI: epf-mhi: Add support for SA8775P
Content-Language: en-US
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: agross@kernel.org, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
 quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
 dmitry.baryshkov@linaro.org, robh@kernel.org, quic_krichai@quicinc.com,
 quic_vbadigan@quicinc.com, quic_parass@quicinc.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-phy@lists.infradead.org
References: <1697715430-30820-1-git-send-email-quic_msarkar@quicinc.com>
 <1697715430-30820-5-git-send-email-quic_msarkar@quicinc.com>
 <20231025075603.GD3648@thinkpad>
 <610b0621-b140-ee9b-c450-0fec6862c4fc@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <610b0621-b140-ee9b-c450-0fec6862c4fc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/23 07:30, Mrinmay Sarkar wrote:
> 
> On 10/25/2023 1:26 PM, Manivannan Sadhasivam wrote:
>> On Thu, Oct 19, 2023 at 05:07:09PM +0530, Mrinmay Sarkar wrote:
>>> Add support for Qualcomm Snapdragon SA8775P SoC to the EPF driver.
>>> SA8775P has the PID (0x0306) and supports HDMA. Currently, it has
>> Is the PID fixed? I thought you just want to reuse the SDXxx PID in the
>> meantime.
>>
>> - Mani
> 
> The PID for SA8775p EP is not decided yet. So using 0x0306 PID meantime.
If it's not decided, why should it go upstream then? Would that
not break the hosts' expectations when the EP device is updated?

Konrad
