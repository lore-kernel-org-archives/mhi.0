Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10961B86C2
	for <mhi@lists.linux.dev>; Sun, 28 Jul 2024 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722174056; cv=none; b=Po6Qq7jx4oFh8n8/yGetWerC1p5JYnU9gIW8vYtWf0x4ADlM02R30r410VbMWzvKQsrAeMYwtL0vlSjS6W+jV6en2mBBNn/W3PPFlBflY37cMvn0QAWqxWeWx6YE+wqarKDAUJqpsDAg6HnPhNwf0Z9WWSy89PY9Fqx6M3P4ab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722174056; c=relaxed/simple;
	bh=qQRUW6Vi3t/sLxUhqvlcmtzeAFbV14FvlLcpvdrkbSI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=K60qHnyslCnVm5MeioAI/m3KTX1GUgnLsYVT77pI7nrcFw7Z+eCO4C0mY5mSw2ByLZawfnnL5JSeNUgXH/iz1JcQvOXYHYcZU/t+1TY8IYU5E/efJpP2VPLP1ycpBpQOLPiCpBYAQ9upHapFSUYUrgbdPDndmQIHscCMyrlqa4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fgeUYvKj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fgeUYvKj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46S8xAJs031924;
	Sun, 28 Jul 2024 13:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtM198zXdH2Rn0jOAgmlbOza0bJ7Hm22KDjZXWZGj60=; b=fgeUYvKjbQEpEnxB
	uxxg1Sm3dGBke0IJKjoWL//RIfmsTsYQXBCJUthwWWqpTzTWWIZGS/1xOC5+YtI0
	H8uCnIIj8B9Fug7eX/8hPYP5mUZiQtunHL63snXFF2PrRtmE5Uawk54nLWzK1cEG
	B/EUDr8IJf2sdG2k28nw6sxU4CSb41kS4AZEGtafsgbb+7moA9Dn4rdr5hNoEuVd
	g0hQVgOWrge9DwiCABjkjlAz272BGyJ0Rvjc6IglddmmzkH0Uyf5C/BSvThvP9Wu
	BR83JMu+yIkj3jZ/UUAHiHq4iaB3/9NEItXUS+oVVXvGLbZLH56K59+V2oMWkp2o
	DFho/w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2khua4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:40:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SDejQA018894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:40:45 GMT
Received: from [10.216.18.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 06:40:42 -0700
Message-ID: <06d3a928-694c-4775-a5c4-3887bbf6eef9@quicinc.com>
Date: Sun, 28 Jul 2024 19:10:41 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
Subject: Re: [PATCH 2/6] bus: mhi: add support to allocate rddm memory during
 crash time
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-3-quic_gokulsri@quicinc.com>
 <fe20dad8-d419-79f2-92b5-0154b45eb73e@quicinc.com>
Content-Language: en-US
In-Reply-To: <fe20dad8-d419-79f2-92b5-0154b45eb73e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GAU_DFanDhpfstIyTtmMvvOP-kCIl1jr
X-Proofpoint-GUID: GAU_DFanDhpfstIyTtmMvvOP-kCIl1jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280100


On 7/18/2024 9:52 PM, Jeffrey Hugo wrote:
> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>> From: Ram Kumar D <quic_ramd@quicinc.com>
>>
>> Currently, MHI bus pre-allocates the RDDM buffer for crash dump
>> collection during MHI power up.
>>
>> To avoid carving out memory for RDDM buffers even if it is unutilized,
>> add support to allocate memory at runtime during the RDDM download
>> after target crash.
>>
>> This feature can be controlled by the client driver registering the MHI
>> controller by setting the rddm_prealloc flag to false in mhi_cntrl.
>> By default rddm_prealloc is true, retaining the existing behaviour.
>>
>> By default, rddm_seg_len will be same as seg_len. The client driver
>> can override the mhi_cntrl->rddm_seg_len.
>>
>> Signed-off-by: Ram Kumar D <quic_ramd@quicinc.com>
>> Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/boot.c     | 149 +++++++++++++++++++++++++++-----
>>   drivers/bus/mhi/host/init.c     |  19 ++--
>>   drivers/bus/mhi/host/internal.h |  11 ++-
>>   drivers/bus/mhi/host/main.c     |   4 +-
>>   drivers/bus/mhi/host/pm.c       |   2 +-
>>   include/linux/mhi.h             |   2 +
>
> NACK.  None of this gets used, making it dead code.
I didn't get it. Do you mean to say "mhi_cntrl->rddm_prealloc = true"  
by default, so its dead code?
>
>>   6 files changed, 156 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index ca842facf820..1a918e340424 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -35,6 +35,16 @@ int mhi_rddm_prepare(struct mhi_controller 
>> *mhi_cntrl,
>>           bhi_vec->size = mhi_buf->len;
>>       }
>>   +    if (!mhi_cntrl->rddm_prealloc) {
>> +        mhi_buf->dma_addr = dma_map_single(mhi_cntrl->cntrl_dev,
>> +                           mhi_buf->buf, mhi_buf->len,
...
>> @@ -312,21 +367,31 @@ void mhi_free_bhie_table(struct mhi_controller 
>> *mhi_cntrl,
>>     int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>>                struct image_info **image_info,
>> -             size_t alloc_size)
>> +             size_t alloc_size, enum image_type img_type)
>>   {
>>       size_t seg_size = mhi_cntrl->seg_len;
>> -    int segments = DIV_ROUND_UP(alloc_size, seg_size) + 1;
>> +    int segments;
>>       int i;
>>       struct image_info *img_info;
>>       struct mhi_buf *mhi_buf;
>> +    /* Masked __GFP_DIRECT_RECLAIM flag for non-interrupt context
>> +     * to avoid rcu context sleep issue in kmalloc during kernel panic
>> +     */
>
> Incorrect comment style.
>
Will correct this.


> Also, why would RDDM be relevant to a Linux kernel panic?  This makes 
> me suspect a lot is wrong with this patch.
>
When mhi device crashed, kernel also could be in panic, so during panic, 
its necessary to collect RDDM. This state is already supported in mhi 
driver.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/boot.c?h=v6.10#n163

...

>> +            /* Vector table is the last entry */
>> +            if (i == segments - 1) {
>> +                mhi_buf->buf = kzalloc(PAGE_ALIGN(vec_size),
>> +                               gfp);
>> +                if (!mhi_buf->buf)
>> +                    goto error_alloc_segment;
>> +
>> +                /* Vector table entry will be dma_mapped during
>> +                 * rddm prepare with DMA_TO_DEVICE and unmapped
>> +                 * once the target completes the RDDM XFER.
>
> Incorrect comment style
>
will correct this.

Regards,

Gokul

>> +                 */
>> +                continue;
>> +            }
>> +            mhi_buf->buf = kmalloc(vec_size, gfp);
>> +            if (!mhi_buf->buf)
>> +                goto error_alloc_segment;
>> +
