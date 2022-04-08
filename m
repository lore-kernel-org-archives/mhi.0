Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3E631
	for <mhi@lists.linux.dev>; Fri,  8 Apr 2022 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649442760; x=1680978760;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bDFhoGDXqePTQJqvGLbZDWo79kAbHgp3RtD3xafy47g=;
  b=vFnIAMBwNniZ3KMXPSLxMKxILkOb7Qh6tj6XlGj0NyizuVUrYL13P7NE
   z5tJyIhpirAeDFKeKjXzd9TI3H68tpU1yOJqMlXBFF4OugMombft6CgZK
   3kUptyROGitxfygE0hxCRCDbppzaZkQ34m35ouGZdvua/yiICtGls6BVi
   A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Apr 2022 11:30:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 11:30:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Apr 2022 11:30:30 -0700
Received: from [10.110.71.124] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 8 Apr 2022
 11:30:30 -0700
Message-ID: <e72bfef3-53c2-4b82-382f-4a22e864169e@quicinc.com>
Date: Fri, 8 Apr 2022 11:30:29 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Flush recovery worker
 during freeze
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	<mhi@lists.linux.dev>
CC: <quic_hemantk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
	<stable@vger.kernel.org>
References: <20220408150039.17297-1-manivannan.sadhasivam@linaro.org>
From: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
In-Reply-To: <20220408150039.17297-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)


On 4/8/2022 8:00 AM, Manivannan Sadhasivam wrote:
> It is possible that the recovery work might be running while the freeze
> gets executed (during hibernation etc.,). Currently, we don't powerdown
> the stack if it is not up but if the recovery work completes after freeze,
> then the device will be up afterwards. This will not be a sane situation.
>
> So let's flush the recovery worker before trying to powerdown the device.
>
> Cc: stable@vger.kernel.org
> Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
> Reported-by: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
Reviewed-by: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
> Changes in v2:
>
> * Switched to flush_work() as the workqueue used is global one.
>
>   drivers/bus/mhi/host/pci_generic.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index ef85dbfb3216..541ced27d941 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1060,6 +1060,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
>   	 * the intermediate restore kernel reinitializes MHI device with new
>   	 * context.
>   	 */
> +	flush_work(&mhi_pdev->recovery_work);
>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>   		mhi_power_down(mhi_cntrl, true);
>   		mhi_unprepare_after_power_down(mhi_cntrl);
