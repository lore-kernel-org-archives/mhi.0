Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195E3226
	for <mhi@lists.linux.dev>; Tue,  5 Apr 2022 20:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649190213; x=1680726213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+7AtI8Svdw+YyS90Bb5N100rWVe2spjtKW5TxoNJUo0=;
  b=xBlSnbCIKBb2VFmyA3grJLHum5BlIVzNKsI/3AsmvGI0S99t+fx5+JJ3
   MKq28fEzTxrgsN5B65AO1QiX5PySepDmonAfOmEnAZXrPVyRh7JLsn9W0
   U8j+uTYoWVucXXDTlanUjdR4pTMMQF/r16UOyi4vVFgilVGKrzaf47hj3
   k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2022 13:23:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 13:23:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Apr 2022 13:23:23 -0700
Received: from [10.110.86.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 5 Apr 2022
 13:23:22 -0700
Message-ID: <daafdfd8-312e-cf42-d7bb-3fb914d443dc@quicinc.com>
Date: Tue, 5 Apr 2022 13:23:22 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add missing poweroff() PM
 callback
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	<mhi@lists.linux.dev>
CC: <quic_hemantk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
	<stable@vger.kernel.org>
References: <20220405125907.5644-1-manivannan.sadhasivam@linaro.org>
From: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
In-Reply-To: <20220405125907.5644-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)


On 4/5/2022 5:59 AM, Manivannan Sadhasivam wrote:
> During hibernation process, once thaw() stage completes, the MHI endpoint
> devices will be in M0 state post recovery. After that, the devices will be
> powered down so that the system can enter the target sleep state. During
> this stage, the PCI core will put the devices in D3hot. But this transition
> is allowed by the MHI spec. The devices can only enter D3hot when it is in
> M3 state.
>
> So for fixing this issue, let's add the poweroff() callback that will get
> executed before putting the system in target sleep state during
> hibernation. This callback will power down the device properly so that it
> could be restored during restore() or thaw() stage.
>
> Cc: stable@vger.kernel.org
> Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
> Reported-by: Hemant Kumar <quic_hemantk@quicinc.com>
> Suggested-by: Hemant Kumar <quic_hemantk@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>
> Changes in v2:
>
> * Hemant suggested to use restore function for poweroff() callback as we can
> make sure that the device gets powered down properly.
>
>   drivers/bus/mhi/host/pci_generic.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9527b7d63840..ef85dbfb3216 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1085,6 +1085,7 @@ static const struct dev_pm_ops mhi_pci_pm_ops = {
>   	.resume = mhi_pci_resume,
>   	.freeze = mhi_pci_freeze,
>   	.thaw = mhi_pci_restore,
> +	.poweroff = mhi_pci_freeze,

It is possible that .thaw() queues recovery work and recovery work is 
still running

while .poweroff() is called. I would suggest adding a flush_work() in 
freeze such that

we don't try to power off while we're also trying to power on MHI from 
recovery work.

>   	.restore = mhi_pci_restore,
>   #endif
>   };
