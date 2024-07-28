Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208A1B86C2
	for <mhi@lists.linux.dev>; Sun, 28 Jul 2024 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722174101; cv=none; b=i58hegxWnK1GFEeVLvfUMqI4YezQMsPlHXEPNmlCc6Me6pEIcTDy/JnRUKKdoGHefWQuFq1EWOxBKlC0N5AvBsoucE+ZrsxqdygPeMZMTtc5HOlKIZXzcTuLe9WaoChKwc+Uh2MypQksnaa8R4oBQ0E2v2pqWA3+U7zcTnAp6Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722174101; c=relaxed/simple;
	bh=svcV20eWMPlBsfBKzcocSlITlTsWMuJ+6f2fVEaz7oY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=WU+iuqVoAUD13XKjayYp2LL/8Urn777j6Gs65itVL9Q/VwQNcWsap0uvun2PTdrZrZhu9oAsKmfLbSG9vEr4Q/5DMyrBH6a5w47kfxSrLr3cFyR5c9aaXUygpIg2+dIbkF85cbSubpVAqjwv75yBznPKAwhRS9XEugpijRR677M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DvNeM8k0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DvNeM8k0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SCgv3x027737;
	Sun, 28 Jul 2024 13:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHs80xiXLsNLU5HQ8FUZm5nM1Yt+Yxi8LoYjnrOO0pc=; b=DvNeM8k0lAa9aVsP
	REdaEMtSeErJNsYkspM//dAlfQeiVf1I19aD91OArjtLxoKqadyhhPi4z03bEXuG
	LGj3vuTASeZoJAdFnCnGQyLoEDUR+wC4HaG8I8maD1wAhWgGEO/WUpTMgwofnH89
	kZ7nVbCq8slBWaDplGD6dmnW0FVBWzr7n9VbdF3M57jJiSybOaiZxHPWtxIYC2Qr
	zoJ1cS/l/l5/8qI4nViOftOsHQTiYHnkfMgbs/pZaY9ln9Ep4yB4yoPMdLAgwXf0
	bz5iKtUUeTk+e6792ATqmE3QpxlGpoEXeM5mMN2a7eQG/VKBKP9oEAyATTj/GOBr
	ziSdRQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms96hwh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SDfb56010887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:37 GMT
Received: from [10.216.18.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 06:41:35 -0700
Message-ID: <a339e951-173e-46ce-9227-75464958cbdd@quicinc.com>
Date: Sun, 28 Jul 2024 19:11:33 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
Subject: Re: [PATCH 6/6] bus: mhi: change IRQ_HANDLED to IRQ_NONE in
 mhi_irq_handler
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-7-quic_gokulsri@quicinc.com>
 <687ba571-b2ab-0205-fa12-e766e72dfb73@quicinc.com>
Content-Language: en-US
In-Reply-To: <687ba571-b2ab-0205-fa12-e766e72dfb73@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s-wZ3Y6AwxmDhcGrZINCc0PovOtA2K_m
X-Proofpoint-GUID: s-wZ3Y6AwxmDhcGrZINCc0PovOtA2K_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=555 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280100


On 7/18/2024 9:59 PM, Jeffrey Hugo wrote:
> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>> From: Karthick Shanmugham <quic_kartshan@quicinc.com>
>>
>> When mhi_irq_handler is a shared interrupt handler. It is the shared
>> interrupt handlers responsibility to identify its own interrupt and exit
>> quickly if it is not. If there is no pending event in the event ring
>> handled, exit the interrupt context returning IRQ_NONE denoting the
>> interrupt either doesn't belong to this event ring or not handled.
>
> How was this found?

Internally, the proprietary cnss drivers shares the same msi interrupt 
for streaming certain debug information.

In that scenario, the interrupt didn't reach the corresponding shared 
handler since the mhi_irq_handler( ) returned IRQ_HANDLED when there is 
actually no pending mhi event.

This resulted in debug information not collected.

Regards,

Gokul

