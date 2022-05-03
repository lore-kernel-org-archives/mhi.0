Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B7195
	for <mhi@lists.linux.dev>; Tue,  3 May 2022 02:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651545434; x=1683081434;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vvj0YlT5Q8TMUaEi9KKntk1Mg9YHyGSGfT3dzFmLujE=;
  b=hd59EOLrhheqgpyixLmSt6+kD7CPM0V8DR9mGs5Tb5R4CIW98cZ35IJq
   KpA8TfwRDYpIAYRzrv1LGEa4wT7KDWXu+zgoKnEoYg7whzns7T0aSY/HY
   AgpsiDUwtDwxYNYc6XhGjKf1KWAE2rMvLNUxCgQRbmRE5id6cxeaCswb1
   I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 02 May 2022 19:35:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 19:35:06 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 2 May 2022 19:35:06 -0700
Received: from [10.110.46.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 2 May 2022
 19:35:05 -0700
Message-ID: <642cccfd-6e70-9024-1a05-6df48a740156@quicinc.com>
Date: Mon, 2 May 2022 19:35:05 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] net: qrtr: start MHI channel after endpoit creation
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, <mhi@lists.linux.dev>
CC: <manivannan.sadhasivam@linaro.org>, <bbhatt@codeaurora.org>, "Maxim
 Kochetkov" <mkochetkov@airspan.com>
References: <20220430103430.37349-1-fido_max@inbox.ru>
From: Hemant Kumar <quic_hemantk@quicinc.com>
In-Reply-To: <20220430103430.37349-1-fido_max@inbox.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)


On 4/30/2022 3:34 AM, Maxim Kochetkov wrote:
> From: Maxim Kochetkov <mkochetkov@airspan.com>
>
> MHI channel may generates event/interrupt right after enabling.
> It may leads to 2 race conditions issues.
>
> 1)
> Such event may be dropped by qcom_mhi_qrtr_dl_callback() at check:
>
> 	if (!qdev || mhi_res->transaction_status)
> 		return;
>
> Because dev_set_drvdata(&mhi_dev->dev, qdev) may be not performed at
> this moment. In this situation qrtr-ns will be unable to enumerate
> services in device.
> ---------------------------------------------------------------
>
> 2)
> Such event may come at the moment after dev_set_drvdata() and
> before qrtr_endpoint_register(). In this case kernel will panic with
> accessing wrong pointer at qcom_mhi_qrtr_dl_callback():
>
> 	rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
> 				mhi_res->bytes_xferd);
>
> Because endpoint is not created yet.
> --------------------------------------------------------------
> So move mhi_prepare_for_transfer_autoqueue after endpoint creation
> to fix it.
>
> Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
> Signed-off-by: Maxim Kochetkov <mkochetkov@airspan.com>
Reviewed-by: Hemant Kumar <quic_hemantk@quicinc.com>
