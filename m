Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE81DE3D6
	for <mhi@lists.linux.dev>; Mon, 12 May 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074708; cv=none; b=Cx6U7rdOCwVEASDPD6L73bXsnkFZaH0CRAR1u7h7g4rcB3RSjxfM9X3AZPWoD2VRsVU92fIUaHv5+FFfCvSg0UBuLI06kcQY3hRtr1vfFYuY/bJiNgjGKNWHz2gmwxDvysFjZMuh58RYMqJiYMbQLOwKuCVte5c16DV5c/c9eJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074708; c=relaxed/simple;
	bh=L8EFsb5oCcGrowlc2Ah+qGEpR7G1fas3/A2sAWITnyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJH00umHKXKGJdeHiv6c0LgepfiMKPw0XDWoapgMtExqig3nTFc/nb+t8qu7UqQ3MSBMVTIk33VXjT9VGFGwOpGbxZzDldlPSdmJkrgGNlWVMVLALLxI588AvC30gOfiO4jyAX4DAz+a8zei4gD6CGDak7tzxPpGBO6RrSmKYeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7HEJnUj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7HEJnUj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CFX9VN023403
	for <mhi@lists.linux.dev>; Mon, 12 May 2025 18:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRuMbOu7z2/40CcYNv5ov6Lwj3aKCA6IW48Ap+X8VIk=; b=a7HEJnUjIcbIFQET
	juz7tJUh3/WhNf1fPEcyJFPjjgZmiqUA3CH3y3mTIL2uK/OwSwVEo+HJN4iCpxZH
	ngS/y54Dbgt78GebGwripBWnF6LrLtK//JggUFaEnHy4kK7tg5SwXx6J6BSxcp31
	PvkX7PCETCc0LaBFYZX1lOYlh+k9P+w99tY4GcEKxBp4f874QBS0U19/Dv1wzd89
	BI586r99xSsNLwkhB2NSxUghfqkY9GGmEcAzNEcBL3u+ga/Eq70EyGPYmcfMfMIG
	bvY6WvF/ZOHHpO8yNDw6V788xB8EHVuug54ynv5LpCCd1N0DSvxAj4x0ctmkGncO
	KF54zg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfehsg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 May 2025 18:31:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736fff82264so3842311b3a.1
        for <mhi@lists.linux.dev>; Mon, 12 May 2025 11:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074704; x=1747679504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRuMbOu7z2/40CcYNv5ov6Lwj3aKCA6IW48Ap+X8VIk=;
        b=Dx0I0Eh9EETdoROAe67vxz8KQr6HjNfKEphiaL9pvRb6YcdOJpq5kaG4h4qfEqU8Gk
         NrJ3FWG06wkuukoc7ogPq+eS+ClFcq8mA7SY2/J20w+w1EAZQQRjC9xR0D5nx3l4ByGs
         HIgDq+MfCGTSHq/gD3TzZxCMHwVM+3yd69RjxvzqxVQlH0cHPuv1eRu1yifq3MhoGQ0w
         qDd3Ned9Z8bn0h1AMVy5paTlWggxWgxTpE4mcNrVrj+6S05SN1VG/OvdxbNYBGzD5il5
         8qOYo8Cb8b78alFnZLL3S1vIL1sSERCxcT6PvT5gPoPfzw5IKpVe8ZtR0QzyirdYXzIu
         kX2g==
X-Gm-Message-State: AOJu0Yyp0SqMXyT2gIRn07cWOWXm0aCyTNHjdZbZn2rc1ZKP46FCBaHB
	upcjNx/DcXFKAhOUBRYZFRwXMT72OC/5L/Kag+AJepuorrAgIlDQ05V/KY4RmIZ8/XRqpNGIMyS
	Lpy4Hwhi5JG+1/StzCCRE0cwGu1cRG32nR03u6zWS8ndAWPyNmGDPWtPlhmA=
X-Gm-Gg: ASbGncvINFu/9t64G/Z1Zzt9Bkz86E/U7gZt1GOzKMaXneHSXjwOxOH1A7AKFUH42LB
	nzKeyQvJyz/5ULAG48ZX18oe3F0EvarDuuqRizihYDEG2YNhlSmZIi0gyPZhrbdheX5NK4d/cQA
	bpHiAq5777HI0T84Rb6e+oQJWGD9cGQ7q0EEozZJQ+kjioiMjprrwpjDpjMQn3Kv0sUrhHo5v0y
	21WwB2zeCbMaQX40duxaH6pUq93jsNBX4Syh6IibjY3ikKJv27fwIYaW/zg/Ag+SVJOj7Ng3iiQ
	ELkExcxwfvSh06eFx4rn44rTvKllunwUmlMdLM+ZE0PwnfysyD68lsm+wWnNWA==
X-Received: by 2002:aa7:8810:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-74278fc0601mr661858b3a.4.1747074704421;
        Mon, 12 May 2025 11:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOwALx8DJD5hEqL5IewreE7joV43KAgJapB12TnNBFDt3caeElexu9Ss50kxC3I4FWD2MAWw==
X-Received: by 2002:aa7:8810:0:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-74278fc0601mr661818b3a.4.1747074703928;
        Mon, 12 May 2025 11:31:43 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d0fesm6443104b3a.130.2025.05.12.11.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:31:43 -0700 (PDT)
Message-ID: <d97c900d-c899-4f2c-821b-53991ecfd86e@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:31:41 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: Allocate entire MHI control config
 once
To: Baochen Qiang <quic_bqiang@quicinc.com>, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
 <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <1f2a8c11-214b-43c6-8b3a-9e44094f949a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MSBTYWx0ZWRfXz8BG4mmjamF0
 Eo1ftX4o96ZC55EM++zsmTm+URSr9TGHcyFEdUDwfGkzQJZHpQIyBqQ4TzL73wmvoHGdq+K+I25
 3qhNfmYBv03mChm5U2HIxfkn9y4kVgw4X3UEkCsCxv4uu1g56Dp8+9ZZjx3TPBuQVaVPgA0uNzn
 UkL9XA0GdqdlewZZ2+b+jmb4bWB6Vx/Ma842WZ/GDUctxfdU/Gx1UAUMkEnc0Bvs8yCKLLPkKOG
 yC+ggS0grw7plusKT+a1BE/Kk/5iTWqMIdxHSqMMMOATzGl/QFEy4acMM+SDj4pSakOtRfbbdjb
 5clalRX0LBVZcvV/wxAtLpCp1gW4/pskVltAK4K8XIWH52el+xjYtY4q3T1TjoCk5LNMa+jG78N
 D/sjY1iP3KTB2IFiz1A8TL5UjW2Lw/Rgg5e3OwRq8Pl7fqru+9Q0ZTvXjVP5/rmL7MunVMnI
X-Proofpoint-ORIG-GUID: _1pnaoqYP16ynL309F0uWQw32Her1Kv4
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=68223e91 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=wuHSmCbw7zfmQf2vPMgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _1pnaoqYP16ynL309F0uWQw32Her1Kv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120191

On 4/27/2025 7:57 PM, Baochen Qiang wrote:
> 
> 
> On 4/26/2025 1:04 AM, Jeff Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>> @@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>   	struct mhi_event *mhi_event;
>>   	void __iomem *base = mhi_cntrl->regs;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl->ctrl_config_size - 1;
> 
> but the range [ctrl_config_dma, mhi_ctrl_limit] could still be possbile to cross the 4GB
> boundary, no?

Its possible, yes.  From a practical standpoint, that seems to be 
unlikely as the control area is not terribly large on supported platforms.
