Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373162C9D
	for <mhi@lists.linux.dev>; Fri, 19 Aug 2022 13:24:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JCOdOL030305;
	Fri, 19 Aug 2022 13:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0/PhU9UDUyleClp9b3UO6TTars1VvvxD859qQMLu47I=;
 b=XLZrYRZQBJ+pdt+bCTCtLaRn8eysUcVoRlccWKNu8aJNvTU+1M+M3CXO/vl+jlhTpwnp
 2UidRizMts6u+oE7LqnQEolGHP8OmjQWdMeHVFEm2xABdfyeNFAzynCnRwQjnnasmqQc
 bVuaoB06ukdDKIgNYK0TOJ3O43ii00vyBKk8BqbLu8KNt5f+ya2Hm6rKl7Fdpa1DXfWr
 jpRrGlsKv/69LXt+GfXOKL65QoS3Qi9gm/zKH4z2BYbNQ01A4nItCjqFM2cEmFAPAMPn
 4/qf+N67cJxOmo+Q6hBsbRBkE+1qEGB4X/JxlBtniqX5asaIOM9TRRMVq3AUrALwGGlA Zw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j29w988rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 13:24:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JDOD3o026542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 13:24:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 19 Aug
 2022 06:24:13 -0700
Message-ID: <f10a67d1-9ce6-d037-bf48-4cda8b3d5b29@quicinc.com>
Date: Fri, 19 Aug 2022 07:24:12 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: always print detected modem name
Content-Language: en-US
To: Koen Vandeputte <koen.vandeputte@citymesh.com>, <mhi@lists.linux.dev>
CC: Koen Vandeputte <koen.vandeputte@ncentric.com>
References: <20220819083615.251960-1-koen.vandeputte@ncentric.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20220819083615.251960-1-koen.vandeputte@ncentric.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CkVhCVhHav3e8fHbgfY25itpQjl2NakG
X-Proofpoint-ORIG-GUID: CkVhCVhHav3e8fHbgfY25itpQjl2NakG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190050

On 8/19/2022 2:36 AM, Koen Vandeputte wrote:
> This harmless print provides a very easy way of knowing
> if the modem is detected properly during probing.
> 
> Promote it to an informational print so no hassle is required
> enabling kernel debugging info to obtain it.
> 
> The rationale here is that:
> On a lot of low-storage embedded devices, extensive kernel
> debugging info is not always present as this would
> increase it's size to much causing partition size issues.

With dynamic debug, you can turn on this one specific log and nothing 
else.  Seems like it would have the same effect as this change.

> 
> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9e545f2a5a26..51e2b901bae0 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -841,7 +841,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	struct mhi_controller *mhi_cntrl;
>   	int err;
>   
> -	dev_dbg(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> +	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>   
>   	/* mhi_pdev.mhi_cntrl must be zero-initialized */
>   	mhi_pdev = devm_kzalloc(&pdev->dev, sizeof(*mhi_pdev), GFP_KERNEL);

