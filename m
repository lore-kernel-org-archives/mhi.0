Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3E438FB0
	for <mhi@lists.linux.dev>; Sun, 28 Jul 2024 20:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722198105; cv=none; b=VcLSyiklhe/6CdUaGx09eRK/hGWurnYmqtT12T5NN6Swb51FfxAkIfDk9WEzXtAWcM+EwT9kXKD9xN6JpQ7fT1t/EQJFw0ozdnC2/bjuMNmswV24sFsDwChmKTXy/EYxadWzvKdOiApwTcMgWH0I8Mzpco2/dagA0jV2NQ/4DZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722198105; c=relaxed/simple;
	bh=yQa68aoiJTWeKCmFNFo0nECLUYqiE/EFXDrZGiqs160=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BV1QW9BGzOyxRsYV4TlFe8MQ6i4rWJ5rYisvoSufFCI39KCED4tNfD8QeWT8HKMNkW1Ay80dfdAR801WvKjUTIPR2H6z4tV6e7mz6bs/5UG1UhYiZGJyr+0D1oBht5iJ/YnRhZx5cHFM2UhRfXxMcxLiFdvc0qUmfQL5GhqFue4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FscRRBJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FscRRBJN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SKHMIv026478;
	Sun, 28 Jul 2024 20:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gRJkjlqMIsWaHeuXady9niWzKZB203k+tuy9wgHbepI=; b=FscRRBJN3t461lYo
	88beuYqVXk78iuPfqSZWA2ECqRa4Qh5+Rlki172R6qhyp9TNqQnONvTXuDKM/t63
	qWdaInKe5S4sD6isuhgPA8WXCF7dbqih8VhMCLVsiZG/5EBCLQEsZtp/TMdPwDsA
	GvOzhr4Py8w/D+WUJSdTetYTe5tGr+YlGybiZamfoNvJThqMRAFFT0QD9Du+q/jX
	Dp1O1IcDUKVcc764RwFEkq9dIwW6jQNdFYglZAV6vDDpqMZ5OYOo+KHXq5c/oyrc
	JBK7Nt9q0i6i0I7ngBOvZvTsHm9KzN4Bc++6KX6mpJKLRCXMlCzQqruidgr73NYH
	Zw5m0Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne28uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:21:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SKLekY029706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 20:21:40 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 13:21:39 -0700
Message-ID: <72ed7337-8867-6b5d-0cc8-26d60015f900@quicinc.com>
Date: Sun, 28 Jul 2024 14:21:39 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/6] bus: mhi: add support to allocate rddm memory during
 crash time
Content-Language: en-US
To: Gokul Sriram P <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-3-quic_gokulsri@quicinc.com>
 <fe20dad8-d419-79f2-92b5-0154b45eb73e@quicinc.com>
 <06d3a928-694c-4775-a5c4-3887bbf6eef9@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <06d3a928-694c-4775-a5c4-3887bbf6eef9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M98L30HP9Bgrmc5x2rH8QTaVkKvcklur
X-Proofpoint-ORIG-GUID: M98L30HP9Bgrmc5x2rH8QTaVkKvcklur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280147

On 7/28/2024 7:40 AM, Gokul Sriram P wrote:
> 
> On 7/18/2024 9:52 PM, Jeffrey Hugo wrote:
>> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>>> From: Ram Kumar D <quic_ramd@quicinc.com>
>>>
>>> Currently, MHI bus pre-allocates the RDDM buffer for crash dump
>>> collection during MHI power up.
>>>
>>> To avoid carving out memory for RDDM buffers even if it is unutilized,
>>> add support to allocate memory at runtime during the RDDM download
>>> after target crash.
>>>
>>> This feature can be controlled by the client driver registering the MHI
>>> controller by setting the rddm_prealloc flag to false in mhi_cntrl.
>>> By default rddm_prealloc is true, retaining the existing behaviour.
>>>
>>> By default, rddm_seg_len will be same as seg_len. The client driver
>>> can override the mhi_cntrl->rddm_seg_len.
>>>
>>> Signed-off-by: Ram Kumar D <quic_ramd@quicinc.com>
>>> Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>>> ---
>>>   drivers/bus/mhi/host/boot.c     | 149 +++++++++++++++++++++++++++-----
>>>   drivers/bus/mhi/host/init.c     |  19 ++--
>>>   drivers/bus/mhi/host/internal.h |  11 ++-
>>>   drivers/bus/mhi/host/main.c     |   4 +-
>>>   drivers/bus/mhi/host/pm.c       |   2 +-
>>>   include/linux/mhi.h             |   2 +
>>
>> NACK.  None of this gets used, making it dead code.
> I didn't get it. Do you mean to say "mhi_cntrl->rddm_prealloc = true" by 
> default, so its dead code?

For example, this patch adds rddm_prealloc to the mhi_cntrl struct.  You 
do not add a user for this.  No MHI controller in the kernel consumes 
this, and your series doesn't add one, therefore all the code you add in 
this change is dead because it will never get exercised.

This is not acceptable.

>>
>>>   6 files changed, 156 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>>> index ca842facf820..1a918e340424 100644
>>> --- a/drivers/bus/mhi/host/boot.c
>>> +++ b/drivers/bus/mhi/host/boot.c
>>> @@ -35,6 +35,16 @@ int mhi_rddm_prepare(struct mhi_controller 
>>> *mhi_cntrl,
>>>           bhi_vec->size = mhi_buf->len;
>>>       }
>>>   +    if (!mhi_cntrl->rddm_prealloc) {
>>> +        mhi_buf->dma_addr = dma_map_single(mhi_cntrl->cntrl_dev,
>>> +                           mhi_buf->buf, mhi_buf->len,
> ...
>>> @@ -312,21 +367,31 @@ void mhi_free_bhie_table(struct mhi_controller 
>>> *mhi_cntrl,
>>>     int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>>>                struct image_info **image_info,
>>> -             size_t alloc_size)
>>> +             size_t alloc_size, enum image_type img_type)
>>>   {
>>>       size_t seg_size = mhi_cntrl->seg_len;
>>> -    int segments = DIV_ROUND_UP(alloc_size, seg_size) + 1;
>>> +    int segments;
>>>       int i;
>>>       struct image_info *img_info;
>>>       struct mhi_buf *mhi_buf;
>>> +    /* Masked __GFP_DIRECT_RECLAIM flag for non-interrupt context
>>> +     * to avoid rcu context sleep issue in kmalloc during kernel panic
>>> +     */
>>
>> Incorrect comment style.
>>
> Will correct this.
> 
> 
>> Also, why would RDDM be relevant to a Linux kernel panic?  This makes 
>> me suspect a lot is wrong with this patch.
>>
> When mhi device crashed, kernel also could be in panic, so during panic, 
> its necessary to collect RDDM. This state is already supported in mhi 
> driver.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/boot.c?h=v6.10#n163

That appears to be unused, so I fail to see the connection to a Linux 
kernel panic.

