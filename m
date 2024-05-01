Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC0646
	for <mhi@lists.linux.dev>; Wed,  1 May 2024 00:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714524293; cv=none; b=K7JtsNi4ZkFkYcGQLTnAI1z+MIJr1RUosUAnxZ/m8vKO5BwY9mkftmDDOc6AR1XABZReCSNPIMjNMqDcV+RmQv3nbZaW3aAyQBqxP32SKaJSrvlBOrqPSPijFArLhmFaGeGVGmUYrNPimyaTFDjxUfdfkfx8vAgmBejFv1mWDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714524293; c=relaxed/simple;
	bh=8Q6cLkC3D4EY7LSs2PibPSLFZhc6niHVbM1j+Q+kuYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RYDGPmrMvXiROh2klsPdnzSh55YuteZlzZEOggbZB7Xy4dU6cEIVYUNi0C317iwEy14Nggcqn79ue7QKGcJ83qpzjnOxi/b+tHMzQE+EX1opOMmnTWURkOf3yv1+BtqmsG2UVtFZBfHGYi9qLD0EsURG3jKqCvNwfFvYrlLxct8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QabhoLYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QabhoLYZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4410c6gL010636;
	Wed, 1 May 2024 00:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wrKQMKSXW2vOUzjkvpAKoPz9xqDT/2O1EYMAnXbTxxs=; b=Qa
	bhoLYZe15CLBmCsseQ1G1fhx4xq693oKUKWwfDDUReoRzTfY78i7yAdcGQIxBiNc
	imRiKAyd+3Qngnm7iTf3fVbXCfIz5Ad3eVhtzA+1KoPZ6sS+XdvqMj6OrVi/OaQe
	n9dH0K1eXZia0FEoe8DfRFDlpFM1x3yUfr5uZ73mvA1p1ANB3WTEpav1dvjjca2a
	Tu7mY6+DHDqZmuZXtY/TadV4ZpSy4yl3d4UsBxO4d1vizs4fvSyC5wjHHH0mBrJu
	NZbm0zpu3KE9nPlDXNFGyGLT4Ox91FzuonUF2V9o/FqHISYKsFRwW8spM0xWxjIB
	vTmBELic0bnMR49OLLfA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtv1htcrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 00:44:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4410idfA014142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 May 2024 00:44:39 GMT
Received: from [10.110.62.5] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 17:44:38 -0700
Message-ID: <a54f2580-e748-4bdc-a0db-48fca24c63f3@quicinc.com>
Date: Tue, 30 Apr 2024 17:44:37 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MHI MMIO endian issue
Content-Language: en-US
To: =?UTF-8?Q?Martin_F=C3=A4cknitz?= <faecknitz@hotsplots.de>,
        <mhi@lists.linux.dev>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <ZjFjEe0-tJ6un10J@dev2>
From: Mayank Rana <quic_mrana@quicinc.com>
In-Reply-To: <ZjFjEe0-tJ6un10J@dev2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0jabK-W3BXsseFUx0AlRcHvtRTEtcI-s
X-Proofpoint-ORIG-GUID: 0jabK-W3BXsseFUx0AlRcHvtRTEtcI-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=541 adultscore=0
 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405010004

Hi Martin

On 4/30/2024 2:30 PM, Martin Fäcknitz wrote:
> Hello,
> 
> the function mhi_init_mmio configures MMIO registers using the reg_info
> table:
> 
>    eg_info[] = {
>      {
> 	  CCABAP_HIGHER,
>        upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
> 	},
> 	...
> 
>    mhi_write_reg(mhi_cntrl, base, reg_info[i].offset,
>      reg_info[i].val);
> 
> However, the values are in host byte orders, not in device byte order. I
> have a PPC64 system which is big endian, but the device is little
> endian. Without wrapping each value in eg_info using cpu_to_le32 the
> device (sdx55) doesn't response:
> 
>    cpu_to_le32(upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr))
> 
> Hard to believe i am the first one which has this issue? Let me know if
> i should make a patch.
Yes, Please. At least I am not aware of running Linux MHI host stack on 
big endian architecture.

Regards,
Mayank
