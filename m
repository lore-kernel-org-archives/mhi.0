Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F0323C
	for <mhi@lists.linux.dev>; Tue,  8 Nov 2022 06:54:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A86qTuN028426;
	Tue, 8 Nov 2022 06:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Iw0ihIcZToTkiLcOqyUroXTc8QzWy5LpyvegODsh4as=;
 b=Byzc6TR15+oDDh9mOzffTfpVw+YEll+yG2KFPTNsOMcuoQFF15UWaQZ+dbYqp4TEIftk
 QDjyJlD859oeb8EnInWjLzlU4Rz+NdOESkOc9PcQ/dIyD4bcwH8wX+XzvnNYkGnAqO72
 ghH7azDq6pH90pZKyp+OZZ5DzBJiVqwKJU2vWCea/1SWiwqCuE5polSADKq+LKjiI4ZP
 oJtoBPaowupuKRnc0nTKjbCVBR0A2moK1LumA1HvlQfsWYhQRvxjHO7vCouRIyHF60mj
 Xl6SGbjpMpnIfW9ZhSlJFoNy27ph5kMLrt3n2FDJAu96QnjkXCkNvn+TJ0zpxrSpipcj OQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqhk284fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 06:54:47 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A86slqA006154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Nov 2022 06:54:47 GMT
Received: from [10.253.38.162] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 22:54:44 -0800
Message-ID: <cba37503-c8bc-b14f-39db-34dd0fa09c32@quicinc.com>
Date: Tue, 8 Nov 2022 14:54:42 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] bus: mhi: host: Disable preemption while processing data
 events
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <mani@kernel.org>,
        <loic.poulain@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <mrana@quicinc.com>
References: <1667462111-55496-1-git-send-email-quic_qianyu@quicinc.com>
 <25b67462-d6a6-c564-6830-694b726bd1d9@quicinc.com>
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <25b67462-d6a6-c564-6830-694b726bd1d9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D2J7pnGX5zaB-YxYhR-ReASd23nAfhdF
X-Proofpoint-GUID: D2J7pnGX5zaB-YxYhR-ReASd23nAfhdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080035


On 11/7/2022 11:00 PM, Jeffrey Hugo wrote:
> On 11/3/2022 1:55 AM, Qiang Yu wrote:
>> If data processing of an event is scheduled out because core
>> is busy handling multiple irqs, this can starves the processing
>> of MHI M0 state change event on another core. Fix this issue by
>> disabling irq on the core processing data events.
>
> Can you elaborate on the scenario more?
>
> If a device hasn't entered M0, then what event could be processed?
The scenario is following:
1. On Core 2 IPCR channel 20 transfer completion event MSI arrived which 
is processed by holding Event ring 1 lock by calling spin_lock_bh() in 
normal priority tasklet.
2. On Core 2 multiple irqs come in and scheduled out the event ring 
processing done by #1. Due to that event ring lock remained acquired but 
event ring processing for IPCR got scheduled out.
3. On Core 1, primary event ring MSI arrived for M0, which is handled by 
a separate MHI hi-priority tasklet. As part of M0 state transition,
tasklet goes over event ring 1 and tries to acquire event ring 1 lock in 
order to ring the event ring DB, but just gets stuck in busy wait due to 
#2.
At this point tasklet is at the mercy of the muiltiple irqs handle 
(which scheduled out the MHI tasklet of #1) to finish and let the MHI 
normal priority tasklet to run.
