Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA902442A
	for <mhi@lists.linux.dev>; Sat, 27 Aug 2022 18:44:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27RId0UF004471;
	Sat, 27 Aug 2022 18:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EKCDKj//SFxGSNGuqOACdG/qtNCxFfFXz4jc13xzHQA=;
 b=Ue6IpSjjhJfWu+oDFhW4n+O7cvFeq4hFna82onL2fTFn7LkbryqYubJeA93CZmvmIEWX
 XRorHyZqTCU1QrQnoHq72agZvpkJP453KhW1DujG1FhzxjNmfLtLm/Gk1O7VYTDH7SFM
 q2Mlvj+yzBWEo4lkH2nVnaXO8HkPlOgKoSTMnofUCTTfsh8gWzsGl6gIfBA2UHXilDp2
 JF6wA81XGkHwNtUKmA3u9e2KvChS0sfR7/ch+RivpRSz4UEh3UUaZtN5/w3mvsH+00iw
 yU1aTU/qw4nH08RztHXoYFyP+vILoX06JCohMyrkuspcELHujDDUzXqYlPH2jpDfEGlE kQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7c1qh8r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Aug 2022 18:43:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27RIhu5k024140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Aug 2022 18:43:56 GMT
Received: from [10.110.120.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sat, 27 Aug
 2022 11:43:55 -0700
Message-ID: <8c68af3a-f54a-1911-ff54-7ee853f969d2@quicinc.com>
Date: Sat, 27 Aug 2022 11:43:55 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] bus: mhi: make mhi_controller_config::event_cfg const
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>
References: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
 <a1ebfbbb-4231-49b2-cf13-8b25a1cd839d@quicinc.com>
 <7836a353-de84-2ab6-ab50-79e3823dadcf@quicinc.com>
In-Reply-To: <7836a353-de84-2ab6-ab50-79e3823dadcf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CJFG1TkpjjpU_aSL-CLVZgcAJs6vbpQj
X-Proofpoint-GUID: CJFG1TkpjjpU_aSL-CLVZgcAJs6vbpQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-27_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208270070

On 8/19/2022 2:15 PM, Jeff Johnson wrote:
> On 8/19/2022 2:08 PM, Jeffrey Hugo wrote:
>> On 8/19/2022 3:02 PM, Jeff Johnson wrote:
>>> Currently the event_cfg pointer in struct mhi_controller_config is not
>>> defined as a const pointer. This prevents clients from registering a
>>> read-only configuration unless they use a typecast. Since the
>>> event_cfg should not be modified once registered, add the const
>>> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> ---
>>
>> v3 and no changelog?
> 
> Rookie mistake :)
> v1: only header file changed
> v2: added SOB
> v3: added pci_generic.c change

I see my patch has been set to Not Applicable in patchwork, but did not 
receive any comments other than the one quoted here.

Should I rebase & post v4 with a correct changelog?

