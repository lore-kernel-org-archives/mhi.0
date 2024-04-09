Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4E5B1EA
	for <mhi@lists.linux.dev>; Tue,  9 Apr 2024 04:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712637356; cv=none; b=E/IetbAXgLlChDKKHOj0w67bXW2MTUyUQxh6oIh1rKqsu19f4PztWyTTQUjDKMAETsXEnU4cV8K/0gU9LKBYbZrHcw51qZtunGL2lMw2n+kCtBpBErXPbUV+3Cd8pW5OfZ8tFlt5DOMoHeY10YjwTYm32YypFstj8+L/BSixjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712637356; c=relaxed/simple;
	bh=o6Ghb58sANsThHAkGR5K1if3FoinK+Kakyu50JpP++0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qhagREAvYT5La8jqUXbcErRZ2C/3Ww50kqqmggvZolgMRvIQAHfFgI1DSPI1Jq9sjPjWsGcZAXGP/taraLmopW6pTjN6hl+OfumbU5hJ/OwieOJTRlG7ckoBD13dXQ53qTbg4U0sL77MVx3Trz4P5djsrLHBUUwfsZ9bNripYOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CSwsE3S2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CSwsE3S2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4394UxC6014489;
	Tue, 9 Apr 2024 04:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=eRUcqEGVstnwcQDz3iNNUeu0IFENW2umXBIajW9k9NM=; b=CS
	wsE3S2kOXeN6qi9VZzvUbfMThWY9HrGWDEQXQUuPah+R4+71wZlbeuZt2LT5LGO2
	1ZOLBij4BCN59u+SM0Vym6aeWlCwSGfHFsna7CPvoXdv85NQEpv4V5w7+7mlUTvH
	wdwppbkQWLzhTs545eNGWqg4GaI0EiKZ0kFyr1bSsnvIh2ou2TA1Z/dxaxEZyHvr
	gSrp6gUuYNP4MQnkdSHpei8TWbTo1UNU6ntXKc+F/tZFZGbXKhYXnr2K9Pxk25mt
	2IqYirYaGVTZdkPoNMaDLi4kSadalPuMgCBJ+pj9h+XoIEQDNhvtTLSLjHBVP+tI
	QMf7/cBryh539nO5m7yA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbg0jfmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 04:35:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4394ZjeF024249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Apr 2024 04:35:45 GMT
Received: from [10.239.29.179] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 21:35:44 -0700
Message-ID: <5b6ca95c-92a0-4f47-9a92-ed8ba3c29fa1@quicinc.com>
Date: Tue, 9 Apr 2024 12:35:41 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: failed to power up MHI controller issue
Content-Language: en-US
To: Slark Xiao <slark_xiao@163.com>, Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>
References: <38c7997c.10212.18e84f08a4f.Coremail.slark_xiao@163.com>
 <20240402045647.GG2933@thinkpad>
 <4d76dd24.edcc.18ebd2606cc.Coremail.slark_xiao@163.com>
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <4d76dd24.edcc.18ebd2606cc.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fUBELf-AuPYW0fvuHKL9XrFxva0MCV0s
X-Proofpoint-ORIG-GUID: fUBELf-AuPYW0fvuHKL9XrFxva0MCV0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_01,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090026


On 4/8/2024 5:59 PM, Slark Xiao wrote:
> Hi Mani,
> Please see attached log files(both kernel log and IPC log).
>
Hi Mani, Slark

I ever met similar issue like this, where device treated D3cold,ready -> D0
as illegal transition.

"EP_PCIE_PM_D0_EVENT: illegal in current MHI state: READY and D3_COLD_STATE"

In MHI spec, there is not transition path from D3cold,ready->D0, but
in fact, we have this transition in some cases.

For example, when we remove and reinstall pci generic driver. During 
remove,
mhi will reset device and pci framework will put it into D3cold directly 
when
rootport driver runtime suspend. When we reinstall driver, device will 
see D0
event but its current state is D3cold,ready. The whole state transition is
like:
D0,M0 -> D0,reset -> D0,ready-> D3cold,ready -> D0,ready.

During reboot, if device doesn't reboot with host, look like we will 
also meet
similar transition.

This illegal state error log may not root cause to this issue. Even 
process it
as syserr, we can still recovery and go back to M0.
> At 2024-04-02 12:56:47, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> >+ MHI list
> >
> >On Thu, Mar 28, 2024 at 08:02:20PM +0800, Slark Xiao wrote:
> >> Hi Mani,
> >>  Hope you are doing well! I got a problem with our sdx65 device in some
> >> 
> >> specific platform. MHI driver would report "failed to power up MHI controller"
> >> when device bootup. Actually, I can reproduce this error when host doing a
> >> reboot. It's Rockpro64 with SDX65, and kernel 6.6.3 or 6.7.10.
> >> 
> >> So I add some logs and change dbg level log to info for more print. You can
> >> see my attachments for reference.
> >> It seems the host didn't receive the event of "MISSION MODE" and then
> >> power down the device.
> >> BTW, there are some extra log prints were added in function
> >> mhi_sync_power_up(). You can find it with mask "##shawn##".
> >> Do you have any idea to debug it?
> >> 
> >
> >Looks like something gone wrong with the device firmware. Is it possible to get
> >the logs from the device?
> >
> >This could be due to the way the PCIe controller driver on the host handling
> >reboot.
> >
> >But let's get the device logs first to debug further.
> >
> >- Mani
> >
> >-- 
> >மணிவண்ணன் சதாசிவம்
