Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC688481A3
	for <mhi@lists.linux.dev>; Mon, 27 Jan 2025 23:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738021821; cv=none; b=I65pS9jtmu/BSWd3g5Gr0Sje5W1UN3XI3K8GCZh0KUkIQCuFF1NbhOEt2qA2y7Aid3QlsPafM2cS0xavW4ME7ij8wCtQX3I+Fz7+S70zj+68ss0DDxoaFro0F7mHKZPJpGf/aiOtrX90zbVgLpR01xG6B8CUcrG9S6/zjx0cCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738021821; c=relaxed/simple;
	bh=6CJWV2/0FjUahTziO5jp4SlYxEdpb3wZ9xOkLgYNPw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XYABpQWpigc6T1qvvZUEdRF4dQ0UQbvRJ16vxW47P8x+0ycii03pX3enVdicOEhyihf4/T+FyIzYo9v9+SMm/waGQjpWGa+xco+JWLG0SERkjVxzJuqXIzzwBkIcqaYRPO09XVqC4IRNRh4QseQQHXKThXpNfZdX1Mw1iyMDK08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dm4rAmHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dm4rAmHj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RJmfvP025945;
	Mon, 27 Jan 2025 23:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SIABXLGhGHIjs4+MIvxbLGfyq5qVgJkOu/oZaErAUVk=; b=dm4rAmHjQoyaY+Vr
	Y0iNbQyYOoo1Rhe0PMnZMEWGxZlRS7SKAhcrgYC8gtb2qbX6L4rdhySbc9Z7VCAO
	xS/klnheeMI+3LXZfIGKHEISBdWUvo/O3Gii+ml2HCWYmQE8Wy6PIvq+GV5ssmZN
	nXrXdEK7b874cb/2JR/+7ugMpcn66fNY90SjVf4+xQkajFiTDpr6kWMc1Pj7aiPy
	48ZhuWeWIpaoJoPtZz14isgtYMrPoWOww2hi9k+vxzfn5Dy57N7a09RUMRTqdsi7
	jVGs3hYnTi1pK9CIrCWbSwgPTWc7zWJHmnGfkiNFNK2Ou4lLcmiOsdcEqZG4gvni
	87WVNQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44egm48cyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 23:50:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50RNoBVp016666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 23:50:12 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 Jan
 2025 15:50:10 -0800
Message-ID: <efd83fb2-cc8f-f2d8-f967-297f8d695a14@quicinc.com>
Date: Mon, 27 Jan 2025 16:50:10 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Content-Language: en-US
To: <linux@treblig.org>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>
References: <20250127215859.261105-1-linux@treblig.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250127215859.261105-1-linux@treblig.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I_91eMdjilMj-ar0qQd_JRFwrzHs7jBi
X-Proofpoint-ORIG-GUID: I_91eMdjilMj-ar0qQd_JRFwrzHs7jBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_11,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270186

On 1/27/2025 2:58 PM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> mhi_device_get() and mhi_queue_dma() haven't been used since 2020's
> commit 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> added them.
> 
> Remove them.

I suppose it is time to remove them.

> Note that mhi_queue_dma_sync() is used and has been left.

Does it make sense to drop the "sync" postfix since the remaining 
function does not need to distinguish from another implementation?

-Jeff
