Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A322071
	for <mhi@lists.linux.dev>; Sun, 28 Jul 2024 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722198439; cv=none; b=RVxnl4xqHz6E5IUyY1WfL1hYuLOlEa1CSBkXZ81pjZWEwz75UHOLV//jwMNYLduTgEXih15+fYwKNOApRBpBBlygrGDGuDev5xH+KwmvFitup8t+pQbrNgTUolM4/hGM+QbRGr1+YZP/drQtjsAGMgYFVaiUmSfRULKKS42E/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722198439; c=relaxed/simple;
	bh=doKnmi7XzGuQ3LiYrzD1SUtFPYoZRLCBAAx/9uI6jKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PTTxtnUQ3kPGTTBq//Pkif0MEZhs7CxaVVfR2rY48T1kgSvwiRIQwsgZbeSZvg3ETy7RGJEHltSBAzm9wQnVlE6BYOVYbW9HmJnxOGK6S2gA8hv0SS6ZNVGp3t61GjpGoL6RM/aqDYNqnnuLS/ISNEa1r2+M9hEaV0ViL/J4phA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wk2NGj2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wk2NGj2C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SFSGaw029502;
	Sun, 28 Jul 2024 20:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0d5Op1+082A98w9wMg/Fsj6y6igBcZFX2flhXJP+Lk=; b=Wk2NGj2Cv5mSsTxJ
	Vjsgt685i8ZPQ9JtUVEmsoeqNDuw+syZUD88E5g48k/Zf9yqywLYj0Sw5BKcYxWV
	MnC6RBuNgoYeV//9odCgJVFQLVpvH7Nu7mYbAsbs8/BTQ+g0UynzgCt2tGVsPSaJ
	XvhaXNsKHqg/cmsFhe1JciGWr3QbRjovACOr4R9xGJwiqxtsZqgK5pjHjbpgZELL
	hHozDK5dQb19qgPhetkCuEbwL2mfwrSRW12eSosXtZU/hoYxfTzNp4IsgRaGkBzG
	kivakgdXiNYITb8AMX8Vdpva+mKgvif1rZVTOz7Tylwc+7AjwVu9rFBw5LxoMzcA
	emgN7Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mpketg41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:27:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SKRFdA007025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:27:15 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 13:27:15 -0700
Message-ID: <a9991930-4ba4-fbe0-98b8-25fde31ae8a6@quicinc.com>
Date: Sun, 28 Jul 2024 14:27:14 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/6] bus: mhi: check for RDDM cookie set by device to
 indicate readiness
Content-Language: en-US
To: Gokul Sriram P <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-6-quic_gokulsri@quicinc.com>
 <b4d2fea3-673c-3ea0-3401-befcb1c588d1@quicinc.com>
 <518fad2e-7419-41eb-b145-b5936a5def3b@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <518fad2e-7419-41eb-b145-b5936a5def3b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SjnCkv1V1OaN6UxRGfg0IIT9DLorwDZ9
X-Proofpoint-GUID: SjnCkv1V1OaN6UxRGfg0IIT9DLorwDZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280148

On 7/28/2024 7:41 AM, Gokul Sriram P wrote:
> 
> On 7/18/2024 9:55 PM, Jeffrey Hugo wrote:
>> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>>> index c0c9bfc28e4a..2f90de8616f3 100644
>>> --- a/include/linux/mhi.h
>>> +++ b/include/linux/mhi.h
>>> @@ -839,4 +839,12 @@ int mhi_get_channel_doorbell_offset(struct 
>>> mhi_controller *mhi_cntrl, u32 *chdb_
>>>    * @mhi_cntrl: MHI controller
>>>    */
>>>   void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
>>> +
>>> +/**
>>> + * mhi_scan_rddm_cookie - Look for supplied cookie value in the BHI 
>>> debug
>>> + * registers set by device to indicate rddm readiness for debugging 
>>> purposes.
>>> + * @mhi_cntrl: MHI controller
>>> + * @cookie: cookie/pattern value to match
>>> + */
>>> +bool mhi_scan_rddm_cookie(struct mhi_controller *mhi_cntrl, u32 
>>> cookie);
>>>   #endif /* _MHI_H_ */
>>
>> NACK.  This is not used.
> 
> mhi_debug_reg_dump - this is added in 3 places, mhi_fw_load_bhi( ), 
> mhi_fw_load_bhie( ) and mhi_download_rddm_image( ) to print error codes 
> on failure scenarios.
> 
> What do you mean by not used?

You add an API to other drivers, mhi_scan_rddm_cookie(), but no code 
ever calls it.  This entire patch is useless as all it does is add dead 
code.

