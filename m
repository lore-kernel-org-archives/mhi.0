Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973437149
	for <mhi@lists.linux.dev>; Fri, 17 May 2024 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715958154; cv=none; b=Wh8HUyJlMOqRy2hwIbVmbB7cEnt1wCw5+Bxe00bqtAWNCDSDZnH9PlNNdagVuYOZfHxcznmDf7aNWHfPCnfYnwFRx3gwKsTC1vMHKOZy9ghem/LahKwdAM9wMGcV74MfJMiGFOLOE30HysrCv0fTzvwO2HdMyZUU7ritZsaV710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715958154; c=relaxed/simple;
	bh=2SoCEZTpu2MGE0Ovzb8rXfbE40kaQO/vjZa8EdKp4nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oW9jgCqvpRLkO7UxjW0BZOs6CpVxtQsaBmq/4Mw7hqOFoyvLBdm6Sw9Gp0HRyxS+c7X5wcVeEx5UBXWaLaa6j++Ik8ninb/erk14KseWxLO0EfP3M7AU6WPmiDnHuYS9YsdAQoGm5zIz/KUiMtklvhdV7NN6z7k4nxo+XEzrM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R7uS41M6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R7uS41M6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H9RQih032690;
	Fri, 17 May 2024 15:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aIK2xCDzpTEBQ2d5jzmmM3Tr+sE3oVZwhmDsF1s4zQg=; b=R7
	uS41M6NwnKrAkP4z79udx0xEKnKspImREizhXGvECsTuiYkmBXs/itNC6TtEFDYY
	ma0ft5S6/C9oEe3Bl+WqEy0IG/l2cue7RR6aDrhgFBqFCE4WtXStDrpX6egbAxRJ
	uEIWJG0/LAs2rmQzx/Dyh1dMrhxkvd1+wTdPuyZfDfwuLpuLNOYtAgZQQOP72CpP
	asPEwT9Bht+cLM3brVB0Gd4LvUcagm/nP9NuQHUNzuqvNEyFH+6YDWWvZGR3bn7L
	VUEppLTMPWDMGI1mfmxkgpHt+esLAxC40YzZbX9YH34sgLh6PqPX7okcqlFpd5d8
	HVEFmYjOI0tvWDMMcsdA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125pr3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 15:02:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HF2FQu009367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 15:02:15 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 08:02:15 -0700
Message-ID: <22690e20-7280-0118-ce6a-dc76132ecab3@quicinc.com>
Date: Fri, 17 May 2024 09:02:14 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH net] bus: mhi: host: fix MMIO registers byte order
Content-Language: en-US
To: =?UTF-8?Q?Martin_F=c3=a4cknitz?= <faecknitz@hotsplots.de>,
        <mhi@lists.linux.dev>
References: <20240513140125.14485-1-faecknitz@hotsplots.de>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240513140125.14485-1-faecknitz@hotsplots.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8rKVAvTJDZwIyirYEp0fUkrIZ4Vxn4eG
X-Proofpoint-ORIG-GUID: 8rKVAvTJDZwIyirYEp0fUkrIZ4Vxn4eG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_06,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=944 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170118

On 5/13/2024 8:01 AM, Martin Fäcknitz wrote:
> MHI is little endian, but host may big endian.

"may be"

Feels like this should have a fixes tag.

> Signed-off-by: Martin Fäcknitz <faecknitz@hotsplots.de>
> ---
>   drivers/bus/mhi/host/init.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 173f79918741..b59c276a68d8 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -588,7 +588,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>   	/* Write to MMIO registers */
>   	for (i = 0; reg_info[i].offset; i++)
>   		mhi_write_reg(mhi_cntrl, base, reg_info[i].offset,
> -			      reg_info[i].val);
> +			      cpu_to_le32(reg_info[i].val));

mhi_write_reg() is used many other places, and a quick look shows they 
don't have similar conversions. Should they not also be fixed?
