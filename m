Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD39817
	for <mhi@lists.linux.dev>; Mon, 29 Jul 2024 05:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722232045; cv=none; b=Fc82UXNjXMNboHxIIZq4g8YJ897zlR0WyCwGAvkER6Pgul7xVlA2P6tQO4bMhmSYDsiogbr+jb2ONM7NzT68HP9ficLKd5etkfvJp/2sIMGaVDTp/WnOF0XOJ2yq8sBicAhv/1hLGELzRxhl2bMLiknQht2oY5Fo0JZapN8cb74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722232045; c=relaxed/simple;
	bh=yjKiZ/go2r3+r2q+esr/MA5dkYDtziTGWqtc0kNjp18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S/F7toFGngxPU1Pey0u+/35H2gOiEEimfCO6nZYDOwSW75BJr4k5NG9CiSCw0Sp2CDfHOixz0Rutd3t6V+rKLyTPwTpJRX/RNbKOIGUvqNye4bMdl0FXIozu77oKZAaXp5WRDSIpNGhMijewg8+HziumDjIE8HOrX/npMWDWB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gFYapOui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gFYapOui"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNVB6Y025696;
	Mon, 29 Jul 2024 05:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6M9rGKG7b+0xKLE8fo2o29t5jYeJJQNc0bHwjW3cII=; b=gFYapOuifRwLhChe
	1dirqxlSY2RG4GUJy5Hzf/1XgIUIZI/bzqc+P8dNeAS99fViYo/FHks2eGHCJS6g
	iB/iOQ3frAWytVZUjlRTULxmBSvPSts6pH2xekAPK5aKZEIHSCpKKO+tjV+WHMaD
	mBq8MCWDidJdU7LoilYKJO8d546NNSAnrBgwoq9SaZY4phj6fy4N5FsL/ehj8cLi
	0joYWYTJg0Qp41s082LuI3i+lBF04TfqmI8rf227WyBIckrTqMS9Wp3/qqYMYUNZ
	6/TbtequCfx5vW6SYagLihKWyUxpdSnkjE0s1U5e7kIIcFr2b/hIlksfOyhBucBR
	ytTqmQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mr7gk5c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 05:47:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T5lKvl025326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 05:47:20 GMT
Received: from [10.151.37.150] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 22:47:18 -0700
Message-ID: <b5903003-3b3f-4a00-a01c-916c91caea62@quicinc.com>
Date: Mon, 29 Jul 2024 11:17:15 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] bus: mhi: dump debug registers in critical sections
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-5-quic_gokulsri@quicinc.com>
 <fb793a71-dcdf-521a-a897-d1406e16fbf9@quicinc.com>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <fb793a71-dcdf-521a-a897-d1406e16fbf9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4PuDiM8dTlRHr6Wl7EQzlsH7DyriyXgm
X-Proofpoint-GUID: 4PuDiM8dTlRHr6Wl7EQzlsH7DyriyXgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_03,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=829 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407290038


On 7/18/2024 9:55 PM, Jeffrey Hugo wrote:
> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -834,4 +834,9 @@ bool mhi_queue_is_full(struct mhi_device 
>> *mhi_dev, enum dma_data_direction dir);
>>    */
>>   int mhi_get_channel_doorbell_offset(struct mhi_controller 
>> *mhi_cntrl, u32 *chdb_offset);
>>   +/**
>> + * mhi_debug_reg_dump - dump MHI registers for debug purpose
>> + * @mhi_cntrl: MHI controller
>> + */
>> +void mhi_debug_reg_dump(struct mhi_controller *mhi_cntrl);
>>   #endif /* _MHI_H_ */
>
> NACK.  This is not used.
mhi_debug_reg_dump - this is added in 3 places, mhi_fw_load_bhi( ), 
mhi_fw_load_bhie( ) and mhi_download_rddm_image( ) to print error codes 
on failure scenarios.
