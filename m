Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386179F0
	for <mhi@lists.linux.dev>; Mon, 26 Jun 2023 14:53:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QCNRhk001883;
	Mon, 26 Jun 2023 14:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BSUbfCrq2+nGrSMhQpMYHP3v9+gG7yJKXdUKqO8e7Ng=;
 b=JadsTGV/BiUu4Nljgv+fUkDAknevucj0wJgaCa3bKUFAqxaF5A4uo/XtieFq8Vf6k4dD
 Nhz+eVgoZ0gG6ZOjDGrJeXIf1/gK8hh/NRDNb60y8fHuXGfulkdSs7b1Ti24EVNLvgH5
 uF2Lj8qt2IMrmwnHxd4ZXWV5cVOF+lJ4Bm6VLOaigyoUrDDcW5zKM/41u2VYqWtG1iiJ
 NpsMbav+kCbCPqYrKrwoSa1xrqoZtfDY0iI1S62BMTpPZ3zS+trZLM9Bw6wcxGofCSxM
 ijNZfQY4YG5i9j9vBpm1xShPYQTAx4ueN/Nt3wv4WjOgAVye7WNsI2XqFG0q7VJG/cm3 Iw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rdqgdcdjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 14:53:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35QErgT7014660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 14:53:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 26 Jun
 2023 07:53:41 -0700
Message-ID: <84cf60eb-355a-ac13-4b9d-2ca054da5ef5@quicinc.com>
Date: Mon, 26 Jun 2023 08:53:40 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/26] bus: mhi: host: use array_size
Content-Language: en-US
To: Julia Lawall <Julia.Lawall@inria.fr>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: <keescook@chromium.org>, <kernel-janitors@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-11-Julia.Lawall@inria.fr>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230623211457.102544-11-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 23kCUTdkNTdh5JJk2_qkhgJovsiQzF35
X-Proofpoint-GUID: 23kCUTdkNTdh5JJk2_qkhgJovsiQzF35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_09,2023-06-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=617 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260121

On 6/23/2023 3:14 PM, Julia Lawall wrote:
> Use array_size to protect against multiplication overflows.
> 
> The changes were done using the following Coccinelle semantic patch:
> 
> // <smpl>
> @@
>      expression E1, E2;
>      constant C1, C2;
>      identifier alloc = {vmalloc,vzalloc};
> @@
>      
> (
>        alloc(C1 * C2,...)
> |
>        alloc(
> -           (E1) * (E2)
> +           array_size(E1, E2)
>        ,...)
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
