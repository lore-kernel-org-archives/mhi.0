Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64419458
	for <mhi@lists.linux.dev>; Fri,  3 Nov 2023 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LoujGUSP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3BZGUK031141;
	Fri, 3 Nov 2023 14:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SRX3DzU8Q98DBMKkC4Etz13c6p82qvG1cDTvgF3VPIA=;
 b=LoujGUSPM42TnFen7aAHwTkDTY9TvGfTWuEsu/r3ld4cz2OYKOh60yJtyBMAzbHV4ixF
 dvpmpWaS8Zj0Wmq6F6FinlEi/kfcNJ+3WbhhKBbuQjHavkUpfwdvNLJWLOQmNAzw0tmb
 H+DhZ5h+mIJvoKrd7SqcIq7rg4fd9uoriEzyzYwbKO3bBosCtawg+Vh0ULuU06oAGtqu
 lGW0NWEvzhd7yoyzroIdp8WHI4eEZ7O+xc5XhADnyw8aChw7/BqTy2Ci5ePY6oDU6Wc3
 pkbT6dyg/+mbrmB2b3a5nT+HWlVJUZVPCWoEO2ViqVxKLbzN+z865mGP8bAF8+MQ2vT6 EQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4v8mrv1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 14:54:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3Esnin010057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 14:54:49 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 07:54:48 -0700
Message-ID: <a04c7754-e807-9b5c-8565-e92ab513af94@quicinc.com>
Date: Fri, 3 Nov 2023 08:54:47 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] bus: mhi: host: Add alignment check for event ring
 read pointer
Content-Language: en-US
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        "Manivannan
 Sadhasivam" <mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
        <quic_ramkri@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_parass@quicinc.com>, <stable@vger.kernel.org>
References: <20231031-alignment_check-v2-1-1441db7c5efd@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231031-alignment_check-v2-1-1441db7c5efd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -6yagfbWKFV8XRLTsw_EcuwOF5y62VtZ
X-Proofpoint-ORIG-GUID: -6yagfbWKFV8XRLTsw_EcuwOF5y62VtZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_14,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=883
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030125

On 10/31/2023 3:51 AM, Krishna chaitanya chundru wrote:
> Though we do check the event ring read pointer by "is_valid_ring_ptr"
> to make sure it is in the buffer range, but there is another risk the
> pointer may be not aligned.  Since we are expecting event ring elements
> are 128 bits(struct mhi_ring_element) aligned, an unaligned read pointer
> could lead to multiple issues like DoS or ring buffer memory corruption.
> 
> So add a alignment check for event ring read pointer.
> 
> Fixes: ec32332df764 ("bus: mhi: core: Sanity check values from remote device before use")
> cc: stable@vger.kernel.org
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
