Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DEAED0
	for <mhi@lists.linux.dev>; Tue, 15 Feb 2022 00:37:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1644885435; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=mt+5My5mWUlpIGkI50452vocY+qn2dekmP9cCPXcMUY=; b=PUYcsyjvz0RPOPSyn5xSK/AjxLEr/tVqIxgVdUdr3s4u7g7TYkF541tb4r7zQqJMUuEuP0Sz
 CAfImFqMje0AJ1Uk1N7Afj6tzjdh29aiiMdOcypxc0WXPVa0hnmGXentBWc+irXIRR15R9YV
 6JYGJbmfBN/cpM9XShx873gMHn4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIyZTBmZSIsICJtaGlAbGlzdHMubGludXguZGV2IiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 620af5ba3047cf1c0a12d614 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Feb 2022 00:37:14
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id C4625C43616; Tue, 15 Feb 2022 00:37:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	NICE_REPLY_A,SPF_FAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.0
Received: from [192.168.1.14] (cpe-76-176-73-171.san.res.rr.com [76.176.73.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hemantk)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A956C4338F;
	Tue, 15 Feb 2022 00:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6A956C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <8ce98695-26c0-1895-13e3-55f4b9ae54d9@codeaurora.org>
Date: Mon, 14 Feb 2022 16:37:11 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 06/25] bus: mhi: Cleanup the register definitions used
 in headers
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, elder@linaro.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-7-manivannan.sadhasivam@linaro.org>
From: Hemant Kumar <hemantk@codeaurora.org>
In-Reply-To: <20220212182117.49438-7-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/12/2022 10:20 AM, Manivannan Sadhasivam wrote:
> Cleanup includes:
> 
> 1. Moving the MHI register definitions to common.h header with REG_ prefix
>     and using them in the host/internal.h file as an alias. This makes it
>     possible to reuse the register definitions in EP stack that differs by
>     a fixed offset.
> 2. Using the GENMASK macro for masks
> 3. Removing brackets for single values
> 4. Using lowercase for hex values
> 5. Using two digits for hex values where applicable
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
