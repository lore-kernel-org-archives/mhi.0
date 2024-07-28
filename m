Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0B69D31
	for <mhi@lists.linux.dev>; Sun, 28 Jul 2024 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722198564; cv=none; b=n2z9oMcyqu1iukQ+xIXSr0lPUZ1jPI0HsIT5WoQn6o7QII6d/+3/Q6T4qlKhV6eE2JO5xN877wlmVDzYiK64uWnTBhiMedh44yl9SDLBps3Tm/5fQQ70DziUPfMcN0fU4lUSHp39UnZ/YVc2I3k/mElfOl/6xbkUfOB66nMMHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722198564; c=relaxed/simple;
	bh=ZdKFzC157dtU4Qb/jIz4dkwaVaDMZlwp6GKZWI+h/vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Li4d9EVDOc1ooryA9Sy2Noy8xnK+OqDFdb0ewgPirkcuQ51rflbwDtjzA5KiTZHANuAdDhlDvMw4UJV4oIfhsF+x1G1fvvYp6E+ysiUM3dayo5UH5Qz20DUoANbGLSyJr69TdFwEsnyDSFiFDLpuSaRIwKgkMa8SM5tQcd/ccO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QqxfDxzO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QqxfDxzO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SJFGAI021000;
	Sun, 28 Jul 2024 20:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uyh/uFJAcgwCFKclAKAqASz0hx7uHvsD306Tr7q4clA=; b=QqxfDxzOC6TyKqT5
	6QEwQOMUIftXuOwnQS3ZeQxqSzYXpuO+ru0jZkVp5Lv7OueTr3UxpHqbVy32BgM8
	LBdxRLlC4uJZgRpdaGt+LdDRihG39GKJDPkTDlnY4OefudYmpqtEqP//iCckjIk/
	KEn5tSGDVg5T1g7VwVHQsdy0xxlTulCGtrwphJrN8TNxJm3tZpahmntNHaXd5IES
	pgaXGFlXZ1ugvKhlrxvwMHm+ApG7aM/SlTLFp6OycA24B2kGJ3gjxNFnFvC6DOzx
	eOcL1NqGQcBBZaNHuCusBc02rdpYSir8ePsteZJkpWSgQOW/btvUna0xyNWWwmYC
	5MTkUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2kj84c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:29:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SKTLGt023325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:29:21 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 13:29:20 -0700
Message-ID: <b5a8aea6-82e4-cade-6860-afccad9aaffd@quicinc.com>
Date: Sun, 28 Jul 2024 14:29:19 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/6] bus: mhi: change IRQ_HANDLED to IRQ_NONE in
 mhi_irq_handler
Content-Language: en-US
To: Gokul Sriram P <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-7-quic_gokulsri@quicinc.com>
 <687ba571-b2ab-0205-fa12-e766e72dfb73@quicinc.com>
 <a339e951-173e-46ce-9227-75464958cbdd@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <a339e951-173e-46ce-9227-75464958cbdd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jBQEFfKDqu8G_v9gFZxlEHOZOVvJxvBM
X-Proofpoint-GUID: jBQEFfKDqu8G_v9gFZxlEHOZOVvJxvBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=589
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280148

On 7/28/2024 7:41 AM, Gokul Sriram P wrote:
> 
> On 7/18/2024 9:59 PM, Jeffrey Hugo wrote:
>> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>>> From: Karthick Shanmugham <quic_kartshan@quicinc.com>
>>>
>>> When mhi_irq_handler is a shared interrupt handler. It is the shared
>>> interrupt handlers responsibility to identify its own interrupt and exit
>>> quickly if it is not. If there is no pending event in the event ring
>>> handled, exit the interrupt context returning IRQ_NONE denoting the
>>> interrupt either doesn't belong to this event ring or not handled.
>>
>> How was this found?
> 
> Internally, the proprietary cnss drivers shares the same msi interrupt 
> for streaming certain debug information.
> 
> In that scenario, the interrupt didn't reach the corresponding shared 
> handler since the mhi_irq_handler( ) returned IRQ_HANDLED when there is 
> actually no pending mhi event.
> 
> This resulted in debug information not collected.

You should probably explain this in the commit text.

Also, are you sure other parts of the irq handler don't need to be updated?
