Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337572C88
	for <mhi@lists.linux.dev>; Tue, 19 Oct 2021 04:31:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634617865; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9woJRJCdvTxyTHSeEiuDf/eJRUof627R7Fo3s9JH8WM=; b=vhK/evG06gktoFIa5MlFPBuzgloCNnLDdp+nQA1LCAfeYdIdqrv2urCiRJmICcKi4Nn8wirg
 ufS9R9Dc6vJ1PJteWqacgqaicolCU+r1mc5Uq8aT8gY5UhzyKzegKGWUO2VwqFhNhvqueMLX
 qPt/TQl1kXXTJHtJzeTdk4LLuCk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIyZTBmZSIsICJtaGlAbGlzdHMubGludXguZGV2IiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 616e49f45ca800b6c1d862db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 04:30:44
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id E2CB1C4360D; Tue, 19 Oct 2021 04:30:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.5] (cpe-76-176-73-171.san.res.rr.com [76.176.73.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hemantk)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 75CC2C4338F;
	Tue, 19 Oct 2021 04:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 75CC2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, bbhatt@codeaurora.org,
 loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
 <YWqBTj4slHq7HexS@kroah.com>
 <6ddc01b24b1c72f7e92174a037043b5cfffa3431.camel@perches.com>
 <YWrqmiT1pC+SbecM@kroah.com> <20211016161531.GA4048@thinkpad>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <c276a912-a382-46af-1573-570c3429be94@codeaurora.org>
Date: Mon, 18 Oct 2021 21:30:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211016161531.GA4048@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/16/2021 9:15 AM, Manivannan Sadhasivam wrote:
> On Sat, Oct 16, 2021 at 05:07:06PM +0200, Greg KH wrote:
>> On Sat, Oct 16, 2021 at 03:24:17AM -0700, Joe Perches wrote:
>>> On Sat, 2021-10-16 at 09:37 +0200, Greg KH wrote:
>>>> On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
>>>>> From: Qing Wang <wangqing@vivo.com>
>>>>> coccicheck complains about the use of snprintf() in sysfs show functions.
>>> []
>>>>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>>> []
>>>>> @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
>>>>>   	struct mhi_device *mhi_dev = to_mhi_device(dev);
>>>>>   	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>>>>>   
>>>>> -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
>>>>> +	return sysfs_emit(buf, "Serial Number: %u\n",
>>>>>   			mhi_cntrl->serial_number);
>>>>
>>>> The text "Serial Number: " should not be in here, right?  It's obvious
>>>> this is a serial number, that's what the documentation and file name
>>>> says.  Userspace should not have to parse sysfs files.
>>>
>>> sysfs is ABI right?  Parsing or not, it's what's already there.
>>
>> If no tools rely on this, and we can change it, we should at least try.
>>
>> We can not change ABI if something breaks.  If nothing relies on it,
>> then it is fine to do so.
>>
> 
> Hemant, Bhaumik, do you guys know if there are any possible users (scripts/apps)
> of this ABI? I'm not 100% inclined to change it but if we are _sure_ that there
> are no users yet, then I'm ok with it.

Mani, i dont know if any script being used by any user to parse "Serial 
Number".

Thanks,
Hemant
> 
> Thanks,
> Mani
> 
>> thanks,
>>
>> greg k-h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
