Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30D868
	for <mhi@lists.linux.dev>; Wed, 17 Nov 2021 20:20:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637180446; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iDW0/PpVzqBrIpTiOg/sl2+bkXDtQf2fndlxXuRKWJA=; b=Wot7F7R+VL1ApjW4yrScmwGMpWse3bK8RgpY2tzqfHgv5zij73/UCl2b8DF8zjhhv+3Zgl0/
 RdHzP09cfHRprfRNgzSh3t+Y+MbMuS8WU8ds4aRb7Zg+OrUka43l/arvG1MJa/y6Q4GT1TeG
 tlugOO+YbwSTn1/XE7OXG3Ctsts=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIyZTBmZSIsICJtaGlAbGlzdHMubGludXguZGV2IiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6195641511cd6d407760ec49 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 20:20:37
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id ECD5AC4360D; Wed, 17 Nov 2021 20:20:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.120.20] (i-global254.qualcomm.com [199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hemantk)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 5879FC4338F;
	Wed, 17 Nov 2021 20:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5879FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: Fix race while handling SYS_ERR at power up
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, mhi@lists.linux.dev
Cc: aleksander@aleksander.es, loic.poulain@linaro.org,
 thomas.perrot@bootlin.com, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20211108174954.60569-1-manivannan.sadhasivam@linaro.org>
 <51338f3b-4c85-17b6-971b-44a50d59a262@codeaurora.org>
 <c6fd34ff-7f19-2ab1-ee3c-f6be178bf9a2@quicinc.com>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <53240ad1-06e0-fdec-c8f6-33a83e6ae2af@codeaurora.org>
Date: Wed, 17 Nov 2021 12:20:34 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c6fd34ff-7f19-2ab1-ee3c-f6be178bf9a2@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/17/2021 9:24 AM, Jeffrey Hugo wrote:
> On 11/8/2021 12:06 PM, Hemant Kumar wrote:
>> Adding same comment in v2
>> On 11/8/2021 9:49 AM, Manivannan Sadhasivam wrote:
>>> Some devices tend to trigger SYS_ERR interrupt while the host handling
>>> SYS_ERR state of the device during power up. This creates a race
>>> condition and causes a failure in booting up the device.
>>>
>>> The issue is seen on the Sierra Wireless EM9191 modem during SYS_ERR
>>> handling in mhi_async_power_up(). Once the host detects that the device
>>> is in SYS_ERR state, it issues MHI_RESET and waits for the device to
>>> process the reset request. During this time, the device triggers SYS_ERR
>> Device is not triggering the SYS_ERR interrupt, interrupt was 
>> triggered due to MHI RESET was getting cleared by device.
> 
> Shouldn't the device state be RESET and not SYS_ERR at that point?
> 
> The device will enter SYS_ERR (and trigger an interrupt for that).  Host 
> issues MHI_RESET.  Device is expected to clear SYS_ERR and enter the 
> RESET state.  Then the device clears MHI_RESET.  Device can then trigger 
> an interrupt to signal the state change (per the updated spec).
Dmesg log was showing first sys err was triggered by device, as part of 
sys error handling host was setting MHI_RESET and expecting to get BHI 
Intvec. When BHI intvec was triggered by device, host handled it by 
checking the MHI status register. MHi status was still showing SYS_ERR 
being set (which was supposed to get cleared after host issuing MHI 
RESET). Due to that host side bhi intvec threaded handler took diff path 
to handle sys error again. This is what we are trying to avoid as we 
think for some reason device is not behaving as per spec and either 
setting sys err again or not clearing it by the time bhi intvec (for 
reset clear) is handled by host.
> 
> I was going to add my reviewed-by, but I'm confused by your comment.
> 
[..]

Thanks,
Hemant

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
