Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970180F
	for <mhi@lists.linux.dev>; Mon, 18 Apr 2022 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1650289637; x=1681825637;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H1X3BJlerqrWJy2a4jlLXxCz96pB+HYEXK0sfC2JpLo=;
  b=f0C3G1iS0Pve4VYgDk03EiqCFPanA1I/VXB7LTQBuChdV+FsNHtnLOyN
   kGewziO/Egya1MErJOz5Mhulh2qCpVTGSp42DriI4hawQiVDtO1dBk9Ix
   KxDPv6me9SHOxJMA40eHX2LmUZ5GnbpHFl5soXnpqKIQaxFnVrFEEwOBm
   Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Apr 2022 06:45:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 06:45:08 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 06:45:07 -0700
Received: from [10.226.58.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 18 Apr
 2022 06:45:06 -0700
Message-ID: <2c776c00-5742-516f-06e3-80db9f572cb4@quicinc.com>
Date: Mon, 18 Apr 2022 07:45:06 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] bus: mhi: host: Add soc_reset sysfs
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_hemantk@quicinc.com>, <quic_bbhatt@quicinc.com>,
	<mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <1649883619-17609-1-git-send-email-quic_jhugo@quicinc.com>
 <20220418054649.GB7431@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20220418054649.GB7431@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)

On 4/17/2022 11:46 PM, Manivannan Sadhasivam wrote:
> On Wed, Apr 13, 2022 at 03:00:19PM -0600, Jeffrey Hugo wrote:
>> From: Jeffrey Hugo <jhugo@codeaurora.org>
>>
>> The MHI bus supports a standardized hardware reset, which is known as the
>> "SoC Reset".  This reset is similar to the reset sysfs for PCI devices -
>> a hardware mechanism to reset the state back to square one.
>>
>> The MHI SoC Reset is described in the spec as a reset of last resort.  If
>> some unrecoverable error has occurred where other resets have failed, SoC
>> Reset is the "big hammer" that ungracefully resets the device.  This is
>> effectivly the same as yanking the power on the device, and reapplying it.
>> However, depending on the nature of the particular issue, the underlying
>> transport link may remain active and configured.  If the link remains up,
>> the device will flag a MHI system error early in the boot process after
>> the reset is executed, which allows the MHI bus to process a fatal error
>> event, and clean up appropiately.
>>
>> While the SoC Reset is generally intended as a means of recovery when all
>> else has failed, it can be useful in non-error scenarios.  For example,
>> if the device loads firmware from the host filesystem, the device may need
>> to be fully rebooted inorder to pick up the new firmware.  In this
>> scenario, the system administrator may use the soc_reset sysfs to cause
>> the device to pick up the new firmware that the admin placed on the
>> filesystem.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Do you need double signed-off because of change in domain?
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

That seems to be the convention that I see in the community.  As I 
understand it, the SoB is linked to the Developers Certificate of 
Origin.  This version of the change is coming from 
"quic_jhugo@quicinc.com" and that entity needs to certify they can share 
the code under the Cert of Origin.

In theory, I could have avoided this by sending this version under the 
codeaurora address.  The problem is that the codeaurora domain no longer 
exists, so sending/receiving email from that id is not possible.

If I'm not understanding things correctly, please educate me.
