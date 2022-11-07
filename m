Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD31D51D
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 15:00:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A7DZEF0019451;
	Mon, 7 Nov 2022 15:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SaOkCxj53AKWkom4tmtWwm8oa4P8xO0egGlUV/WvPqs=;
 b=FQ8Jo4NgbJs7gdF1fV256+FPUHXxF11wznWWC2+G42hrrPRbQU7h38h92Y6yMbYK8Vy8
 Zx/qo1zGNVT9KAxBc5oBnw1pxIsN0EjDaX8LWa/NxFdXwvLI93NP41NfQi6ydhS8cyCl
 sI4n6h3ped7uwczSs86913bFDz9u+greESLSvdLfnHtnxbt3QnGPHzqWmGsmJ5q5zhfS
 D4u9EqDTcEOb4DtND4l/KbZRPhz34TWos+5rEJBi8A11XRrr+6/+Y0nvc3ytN5UObllN
 HIQcLs6mD0EYI4x4SkzwLl43xLJs29p60ueVoMy3rNzS5CQ96fD9IBi0XM0YkN4a9FkQ hg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kpp9ghm9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 15:00:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A7F03Gh013364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Nov 2022 15:00:03 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 07:00:03 -0800
Message-ID: <25b67462-d6a6-c564-6830-694b726bd1d9@quicinc.com>
Date: Mon, 7 Nov 2022 08:00:02 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Disable preemption while processing data
 events
Content-Language: en-US
To: Qiang Yu <quic_qianyu@quicinc.com>, <mani@kernel.org>,
        <loic.poulain@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <mrana@quicinc.com>
References: <1667462111-55496-1-git-send-email-quic_qianyu@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <1667462111-55496-1-git-send-email-quic_qianyu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dfUMr8jOCjAcGgQ3IL24sqvacQD4RGoZ
X-Proofpoint-GUID: dfUMr8jOCjAcGgQ3IL24sqvacQD4RGoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=929
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070120

On 11/3/2022 1:55 AM, Qiang Yu wrote:
> If data processing of an event is scheduled out because core
> is busy handling multiple irqs, this can starves the processing
> of MHI M0 state change event on another core. Fix this issue by
> disabling irq on the core processing data events.

Can you elaborate on the scenario more?

If a device hasn't entered M0, then what event could be processed?
