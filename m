Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12537168
	for <mhi@lists.linux.dev>; Thu,  6 Jan 2022 00:20:38 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id v10so830827ilj.3
        for <mhi@lists.linux.dev>; Wed, 05 Jan 2022 16:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=AZG/3izPrqbNdFVOI98J9HW2dqLN/BP9IAcfziZSEP4=;
        b=MnBajTvxp8eU0L3hLnzVoRJnTutXtbEhgSQakAY9tYmC+slAPEtSVLCCPYWFxqwZqb
         op6nn31CKEasshNFZrUhZ7Rd4QOXgKvF7KASw5uWSkrevHtr4vkAUjMIbYrC6blorT4O
         Ckt4XlrVq7iMRevz0spBbfcJIUjBmGSN7ADFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=AZG/3izPrqbNdFVOI98J9HW2dqLN/BP9IAcfziZSEP4=;
        b=NQtK76nuzNor/UtzDNOIFMcURHS5cPQ3tvxo7z13FNpE2DsblxKa+UWhzz3S/X3dkS
         CKmeT75bKn0OtcueBwCyPY5I+xUqQCfwbSE1VnxAV9sxnn0J6NBXppXNUeFUgVAMrl2l
         cxkTjsWE0VT/uYv3te5v9BHulhSPrfWf4JlcuoiuNMl5BnPjapIkG0lnLlOq2mI/yZSP
         drsRtcpVg6H24Gv+79B85Ea+h/B0ycDKMTjHtLEPwPGvi+No9QgCD2w7kSwvKNsr4pfl
         DzN9VSjJNJuEZlBGIUpCrb5GrKBDzn/Il1Td6fqCYw7460FcOpiFEVE/nTvLEWVWdjGm
         JEew==
X-Gm-Message-State: AOAM531CfhbDF8OhpmsDMkaQsVmRkWort4gnqxuWvMKpZLBkP1y4w5qn
	p8SoX4ARFOPmKaoRl8ozGERFoQ==
X-Google-Smtp-Source: ABdhPJwsXtsahcJ2kK+14f3ObRdZPJlc4Eq0U7KimTVyqIFO6uF5qvLcdnWyUlQijN9mhIN3YsyWtg==
X-Received: by 2002:a92:4a11:: with SMTP id m17mr265555ilf.176.1641428438130;
        Wed, 05 Jan 2022 16:20:38 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id u24sm293697ior.20.2022.01.05.16.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 16:20:37 -0800 (PST)
Message-ID: <d14b4f82-7ac5-e914-25c5-98816d26b044@ieee.org>
Date: Wed, 5 Jan 2022 18:20:36 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
From: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 00/20] Add initial support for MHI endpoint stack
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org, quic_jhugo@quicinc.com,
 vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, skananth@codeaurora.org,
 vpernami@codeaurora.org, vbadigan@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
In-Reply-To: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds initial support for the Qualcomm specific Modem Host Interface
> (MHI) bus in endpoint devices like SDX55 modems. The MHI bus in endpoint devices
> communicates with the MHI bus in host machines like x86 over any physical bus
> like PCIe for data connectivity. The MHI host support is already in mainline [1]
> and been used by PCIe based modems and WLAN devices running vendor code
> (downstream).

Today I'm offering some initial review comments on this series.

I told you offline I had quite a few comments.  When I looked at the
code a week or two ago I looked at the end result...  So my notes
didn't line up well with the way you built it up incrementally.
(Still, the way you did it is generally good for review.)

I got through patch 9 and kind of petered out.  I can look at the
rest tomorrow and/or can give you a chance to update before I
review more.  I'll let you decide...

					-Alex

> Overview
> ========
> 
> This series aims at adding the MHI support in the endpoint devices with the goal
> of getting data connectivity using the mainline kernel running on the modems.
> Modems here refer to the combination of an APPS processor (Cortex A grade) and
> a baseband processor (DSP). The MHI bus is located in the APPS processor and it
> transfers data packets from the baseband processor to the host machine.
> 
> The MHI Endpoint (MHI EP) stack proposed here is inspired by the downstream
> code written by Qualcomm. But the complete stack is mostly re-written to adapt
> to the "bus" framework and made it modular so that it can work with the upstream
> subsystems like "PCI Endpoint". The code structure of the MHI endpoint stack
> follows the MHI host stack to maintain uniformity.
> 
> With this initial MHI EP stack (along with few other drivers), we can establish
> the network interface between host and endpoint over the MHI software channels
> (IP_SW0) and can do things like IP forwarding, SSH, etc...

. . .
