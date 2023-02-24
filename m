Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CB633D6
	for <mhi@lists.linux.dev>; Fri, 24 Feb 2023 14:43:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OAv6nV003087;
	Fri, 24 Feb 2023 14:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AtLgGqUtulUHwKlbRNQsSanR69HjXSXkkTAnCDGzPCU=;
 b=a+01FSeGdGCc53m3ju6AqBdvFUqum3tphjCQ2wp/NPK/d33clR5chbS76ybX6eFicKk4
 P7sBQWXR/kQpb4SIf3Hsakx7qKA0gh4cOTIsvkDs2uizgWl0ryEuCOKuEzKsdyDk+QLk
 xCpn4NYuloVBDVpngvve2MUvbAiwb6ld6O5b75fZXq3kmdvNshqgVjMigZqqDqFmReF6
 zQ9dr0dkp+Npy+/kDOL8mT5QpkcjcY6Ls2NYhR34TLVsDBQl1JZCieeqcJ4ODkBv5E6N
 KE3vsebc0vjr6q6CWTpVyuSDeQfoF+47HPutwZ+qDd0tU7LXihWqczw8hZ5P30fwaqiP DA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nxsxr0x0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Feb 2023 14:43:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OEhIDm010399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Feb 2023 14:43:18 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 06:43:18 -0800
Message-ID: <2294ee25-725a-c743-8be1-b6b1444c5942@quicinc.com>
Date: Fri, 24 Feb 2023 07:43:17 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Remove mhi_poll() API
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>
CC: <quic_vpernami@quicinc.com>
References: <20230224120147.19851-1-manivannan.sadhasivam@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230224120147.19851-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C6lKwoVrdZGnQDwvTH17UTHamay2JoPR
X-Proofpoint-ORIG-GUID: C6lKwoVrdZGnQDwvTH17UTHamay2JoPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_09,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=836 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240114

On 2/24/2023 5:01 AM, Manivannan Sadhasivam wrote:
> mhi_poll() API is not used within the MHI stack and also not by any client
> drivers in mainline. So let's remove it until any consumer is available.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
