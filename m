Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156BF1B86C2
	for <mhi@lists.linux.dev>; Sun, 28 Jul 2024 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722174083; cv=none; b=BK5m1U4OgnR6QhDobtl+t4PDhFpjAP8tLiQ426b/18Th0jg7sgWP35vZGgIOApfZ+6239dkbFnVPgqwXUHI6Xcxirv6Lv9a8W2FCgDdB1Y+3mN9dlR7EN2HT3bwl5+4s15UHHYwdgbqeSv7NIg9kEwjVFjn+3Cg6jK3eXEtMcj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722174083; c=relaxed/simple;
	bh=vzlRMojFj7Y/3zvU1GbEmldCj7CzFwSvu0Rx/MnuNEw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=RX/G2aVuqNZghWsZhi9VvlxXYH9sIB8CseruFqBOg02h0JAZziR2NvH1NiNEe0B6NtohQmqWnxcCDZq1jkNDMaTChHMq82Mxf3Ur9RpXNhqE95L9fDhJFQToOTA4HHSGnOAKnuMYoTDwWnLGOhRVEUelrLV2w2RmyXqbn5ODO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bc9kTjQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bc9kTjQS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SDRhAk017254;
	Sun, 28 Jul 2024 13:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZWPOlgS1nRzoOgECXGqVS4KzF2wG/TWJiXSs5oSlBA=; b=bc9kTjQSt7Yg74Sr
	fQikWuVFYRE/3tI7knd5fS1SpBPfwVqTIlfDDynXdOyJn17ICdYh8BYDxj5Zmj5W
	h5Hfw5yiAxoWqlx8roNMlPqIrMyoHWJ24rPLA3h8Y9vkBXom6IrA52BjMOsa4Eim
	niuLC0EEiImEk5RAi/DkabyoSsAd8FifEPAlPqMg1aBbwShu9CcSf2AZOS5mXY6m
	FK4TeGqbyLMn89eP1JXRPFvuuvLzeTpIu9nFdK/DuPFmSDlQuvngZkmokghbgvXV
	NL29RCHfyoaa4DeOPgM1m36D5po1Ay1ZvGZ0fQKRrLPczWS3FwyplchAknJCkq+h
	+s2Fzw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt68httw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SDfJ0M004179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:19 GMT
Received: from [10.216.18.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 06:41:16 -0700
Message-ID: <27989102-49b6-442d-a9f7-f099cd1b4ed8@quicinc.com>
Date: Sun, 28 Jul 2024 19:11:15 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
Subject: Re: [PATCH 3/6] bus: mhi: increase RDDM timeout
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-4-quic_gokulsri@quicinc.com>
 <ad7c6dae-b682-b01d-3850-40858bed4c2f@quicinc.com>
Content-Language: en-US
In-Reply-To: <ad7c6dae-b682-b01d-3850-40858bed4c2f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JRlWTZyNWtraTr9lx8zzidB0_XjWYTA4
X-Proofpoint-GUID: JRlWTZyNWtraTr9lx8zzidB0_XjWYTA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280100


On 7/18/2024 9:53 PM, Jeffrey Hugo wrote:
> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>> From: Praveenkumar I <quic_ipkumar@quicinc.com>
>>
>> Host sometimes misses the EE RDDM during kernel panic causing
>> RDDM failure. Increase RDDM timeout to overcome this issue.
>
> If we are in the middle of a Linux kernel panic, the host is going 
> down, so why do we care about RDDM?
>
> How did you determine the new value?
>
> Really seems like significantly more detail is needed here.

If kernel panic was due to mhi, we need to have the RDDM dump and this 
is already supported in upstream MHI.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/boot.c?h=v6.10#n163

Regards,

Gokul

