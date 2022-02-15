Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBAEB8
	for <mhi@lists.linux.dev>; Tue, 15 Feb 2022 00:28:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1644884918; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=PN+Ym4YKNbN7Jw8aHCeHcdQTpKRDIDAmpfWxTFfzLO0=; b=e0vn4H+7S9rexsEklDxXS358vYGj2VzY7r/a0ioBZrk64LMGq8PibW79BsHPtgN+x7efOpJi
 1Pii9FqA4OeaQJF/Phh5IMGtTWcV8H2lMUsNPQXvzwlTnWS5MohyTZYpMBQrX2eZz2ZGx+/O
 o/7V5Kbsqc7t9SscWdO/FHbMht4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIyZTBmZSIsICJtaGlAbGlzdHMubGludXguZGV2IiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 620af3b519d16b66a98e4a18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Feb 2022 00:28:37
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 22BF0C4360D; Tue, 15 Feb 2022 00:28:37 +0000 (UTC)
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
	by smtp.codeaurora.org (Postfix) with ESMTPSA id BFA24C4338F;
	Tue, 15 Feb 2022 00:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BFA24C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <bad50e02-17ee-f5db-f58b-086526cf5bde@codeaurora.org>
Date: Mon, 14 Feb 2022 16:28:34 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 04/25] bus: mhi: Move common MHI definitions out of
 host directory
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
 quic_jhugo@quicinc.com, vinod.koul@linaro.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
 quic_cang@quicinc.com, quic_skananth@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, elder@linaro.org
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-5-manivannan.sadhasivam@linaro.org>
From: Hemant Kumar <hemantk@codeaurora.org>
In-Reply-To: <20220212182117.49438-5-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/12/2022 10:20 AM, Manivannan Sadhasivam wrote:
> Move the common MHI definitions in host "internal.h" to "common.h" so
> that the endpoint code can make use of them. This also avoids
> duplicating the definitions in the endpoint stack.
> 
> Still, the MHI register definitions are not moved since the offsets
> vary between host and endpoint.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
