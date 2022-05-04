Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FDD20E0
	for <mhi@lists.linux.dev>; Wed,  4 May 2022 02:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651631081; x=1683167081;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qlXIY1CWPzwHXGxBw+qIB1k+fX6YOx/8ySBx/gBpvGA=;
  b=BXOrF2GsTTUsVd7TYL7I8I6zF3mN5QjLFMBh+FUEqL8avSchNbl9lZID
   3Ue5YPLChelt84Na+P2nF9ejrVSWcMpoIRZOYbvhsTMZIipsWHPdWm1l4
   wbZnKBXknXUC1IG+AyNYmRago9iRnvJvkcH7dHmUJQAu8EPP2X6fespXd
   Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 May 2022 19:22:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 19:22:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 19:22:30 -0700
Received: from [10.110.46.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 19:22:29 -0700
Message-ID: <fa92f431-500d-df0f-85f6-55cf5017a80b@quicinc.com>
Date: Tue, 3 May 2022 19:22:28 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before ctx
 wp update
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	<mhi@lists.linux.dev>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<quic_bbhatt@quicinc.com>, <loic.poulain@linaro.org>
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
 <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
From: Hemant Kumar <quic_hemantk@quicinc.com>
In-Reply-To: <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)


On 5/2/2022 3:41 AM, Manivannan Sadhasivam wrote:
> The endpoint device will only read the context wp when the host rings
> the doorbell. And moreover the doorbell write is using writel(). This
> guarantess that the prior writes will be completed before ringing
> doorbell.
>
> So there is no need of an additional dma_wmb() to order the coherent
> memory writes w.r.t each other. Even if the writes gets reordered, it
> won't affect the endpoint device.
>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed by: Hemant Kumar <quic_hemantk@quicinc.com>
>
