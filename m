Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835022F3F
	for <mhi@lists.linux.dev>; Wed, 22 Feb 2023 15:43:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31MF7tUI012996;
	Wed, 22 Feb 2023 15:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JnxcFNqst959AUn2rOTT4yjbmqPZ4cda06QUPBhLYgA=;
 b=ENozoSh+C0oYoTdXt0nl3JoUXdF7+1/Fivob4/M62VUm+rO0x10MeZWEdSFB75/Ce9x8
 q+sUT+avwdfk7s+3ekouvkc2w9qYewdDEMUt44TBj/5ofvz24/ooDqNBRBf/mvYGE006
 hq+M3n7YKhYeEQQ4eXC1QK9zVUvt052nUbuYuKL0w+UQfAO/OevJOckAw/hc6N3yyjtH
 sNSfhtXGElhZYtje/nNCLIDasd8h8hQ5b2tw2Veb+y4+WjfhlXrv+HcANhMLVenv+fyq
 roDPnJRCAWhvNKCS5YcfrQ/6u2Oe7Y7rjqlnN1EkDTZeXwShPikmjAy7bd8A6kCwwjLn iQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nw75ta6da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31MFhTEU007299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Feb
 2023 07:43:28 -0800
Message-ID: <88b46bcf-04c0-009a-db9f-4a39b8344dcd@quicinc.com>
Date: Wed, 22 Feb 2023 08:43:27 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4] bus: mhi: host: Avoid ringing EV DB if there is no
 elements to process
Content-Language: en-US
To: Vivek Pernamitta <quic_vpernami@quicinc.com>, <mhi@lists.linux.dev>
CC: <quic_qianyu@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_vbadigan@quicinc.com>, <quic_krichai@quicinc.com>,
        <quic_skananth@quicinc.com>, Manivannan Sadhasivam <mani@kernel.org>,
        "Alex
 Elder" <elder@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Davey <paul.davey@alliedtelesis.co.nz>,
        "open list:MHI BUS"
	<linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1677066231-14931-1-git-send-email-quic_vpernami@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <1677066231-14931-1-git-send-email-quic_vpernami@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x_fwL7FU5oPyizJGgE8MgY8huVqJF82h
X-Proofpoint-ORIG-GUID: x_fwL7FU5oPyizJGgE8MgY8huVqJF82h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220136

On 2/22/2023 4:43 AM, Vivek Pernamitta wrote:
> Avoid ringing Event DB if there is no elements to process.

This is almost exactly identical to $SUBJECT and therefore redundant.

> As mhi_poll function can be called by mhi client drivers
> which will call process_event, which will ring DB even if
> there no ring elements to process.

I think that you could be more clear on why this is a problem that 
should be addressed.  Perhaps add a sentence like "These doorbell events 
needlessly interrupt the MHI device to checked for ring elements when 
there are none."

With the commit text updated, you can add
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> ---
> changes since v3:
> 	- Updating commit text for multiple versions of patches.
> changes since v2:
> 	- Updated comments in code.
> changes since v1:
> 	- Add an check to avoid ringing EV DB in mhi_process_ctrl_ev_ring().
> ---
>   drivers/bus/mhi/host/main.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index df0fbfe..1bbdb75 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -961,7 +961,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>   	}
>   
>   	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +
> +	/* Ring EV DB only if there is any pending element to process */
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
>   		mhi_ring_er_db(mhi_event);
>   	read_unlock_bh(&mhi_cntrl->pm_lock);
>   
> @@ -1031,7 +1033,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>   		count++;
>   	}
>   	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +
> +	/* Ring EV DB only if there is any pending element to process */
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)) && count)
>   		mhi_ring_er_db(mhi_event);
>   	read_unlock_bh(&mhi_cntrl->pm_lock);
>   

