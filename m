Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292827A
	for <mhi@lists.linux.dev>; Tue,  5 Apr 2022 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649170620; x=1680706620;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=huDaabzNyXTklOuIlYUMMUElhAchDLPnGVkMR7VRMeE=;
  b=PIFnsRdg+5BBVFhXVmfIP5hD1MsLlUh5kqQFntto8028hdQ6H1ZdflnX
   oV7AWKhVkpWcZmH/4khdIoG3zwGF37OuKn1kDcS+gM+Y5HHPh0HIl87N9
   r5MqWmmSWz4zT1LmS7d3h6IX7sTb3kTTaBp5baULIQJoCptqlGWS6HBg6
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 05 Apr 2022 07:54:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 07:54:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Apr 2022 07:54:51 -0700
Received: from [10.226.58.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 5 Apr 2022
 07:54:50 -0700
Message-ID: <15068b3f-5645-0a8d-06da-25b1af252123@quicinc.com>
Date: Tue, 5 Apr 2022 08:54:49 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] MAINTAINERS: Update Hemant's email id
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	<mhi@lists.linux.dev>
CC: <quic_hemantk@quicinc.com>, <quic_bbhatt@quicinc.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)

On 4/4/2022 12:42 AM, Manivannan Sadhasivam wrote:
> The codeaurora email domain is no longer available for Qualcomm employees.
> Qualcomm employees should now use the new email ids from quicinc domain for
> opensource contributions.
> 
> So let's use the new email id for Hemant.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

LGTM.  If its useful, Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
