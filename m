Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F66EBE2
	for <mhi@lists.linux.dev>; Wed,  9 Nov 2022 15:26:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A9D485W015491;
	Wed, 9 Nov 2022 15:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bL2WFSdMxZ62rz3Gx4xIRpWrrJ/W3KbNrQ91pdfoopY=;
 b=pMxTBnlCLGA1PXe3j7rww1kyM7aVqMHERZ1SzvQYtq+6H0/aygU4+IjqJSysWMtHOIJt
 YGbAOsIOzDk+ji1DLZMzVcg6odFUx2bDsLO3g4l2FvNcwu2R2F8NrgPjqugB2NwHtA0v
 XajjlevUJ8laUeHzC0G9WAwRPeDzL3OmuXRQPQ7z5AGicX+BqsHRjgsJSnRpnFa3ser1
 QCCJKmZUe7gmrVtey/EIQtanG7JW54mlFyQE3SRhncCEsXGkEcK3eVbwBqVA0XZZkEVJ
 J/e9CmTdlc711d4qGZI+3rdqVo009V/N8hhu2Gio1buQT+IeQE2TTcC+KzWpNmdxMw3k TA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kr6b41gg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 15:26:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A9FQbY4026155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Nov 2022 15:26:37 GMT
Received: from [10.110.45.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 9 Nov 2022
 07:26:36 -0800
Message-ID: <e790e9c8-ff32-2572-f696-3642daaaa7a9@quicinc.com>
Date: Wed, 9 Nov 2022 07:26:35 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5] bus: mhi: host: make mhi_controller_config::event_cfg
 const
To: Manivannan Sadhasivam <mani@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: Hemant Kumar <quic_hemantk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <mhi@lists.linux.dev>
References: <20220829205112.12036-1-quic_jjohnson@quicinc.com>
 <20220830171147.24338-1-quic_jjohnson@quicinc.com>
 <20220907080016.GA22505@workstation> <87fsettvtc.fsf@kernel.org>
 <20221108143902.GA88842@thinkpad> <20221109074500.GB4651@thinkpad>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20221109074500.GB4651@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qsiKb8CW3VjM3NZgaukstTv5JTIY5HWp
X-Proofpoint-ORIG-GUID: qsiKb8CW3VjM3NZgaukstTv5JTIY5HWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 mlxlogscore=911 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090117

On 11/8/2022 11:45 PM, Manivannan Sadhasivam wrote:
> Dropped the patch now because of this: https://lore.kernel.org/lkml/20221109151637.67be60f8@canb.auug.org.au/
> 
> Since we need to modify event_cfg for using the shared IRQ, I don't think the
> patch is applicable. Maybe that's the reason I dropped it earlier also, but
> forgot to share it in mailing list.
> 
> Thanks,
> Mani

yes, that was the reason it was dropped before.
Perhaps this code can be revisited so that the event_cfg doesn't need to 
be modified for this one case, but I personally don't have time for that 
now.

