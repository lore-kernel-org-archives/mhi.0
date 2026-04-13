Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0C33AB271
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071059; cv=none; b=AOw1BbEGCbj9MRWFTYLIwf7Rr4h7fZUOZDQcWcJrFx91O5k+B/cHmEJpfD3Z17teQRRvjHOvCrSN6oMzU1gsBlERFC5+Fg0See1dPh1vH6FTHgTDFjhzydJZtZHCltrkS2eHYJ/7+UZ6RuzoX9TUwblP2EUbpY4JQspL/y8EHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071059; c=relaxed/simple;
	bh=DheMOtEnz8CCLQRfzaHndZpq+VdNdR/xkOKuGmrv+M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqrvqCx5Ci/5whIy/56TGjJrrd+appFqdxgHgf5IrU82x1PUV6XGbpPpE5rC9sPm7dWccCrlSo0A1lswRyeR+C0qJEPP3j74M6MOEMeFuFPhf5b7BEEuomqJjWRZVAn9wozvx/SQIaokSqGhpH5viSFZn/J2p3rK4jjTTc3fv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZMspvhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yt74BEto; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZMspvhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yt74BEto"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D74ZHq1716509
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=; b=pZMspvhN85wQE4e2
	qMTGU4v+MJdrmp2Rto/aNsP99siJM8Gz5/mhyyo2vLNoYFamgiKW4fZS+hJA21Cm
	zG6KrMoKNxYdlL1AjCSoT5d4CmTsNYqBWUAxyDyUsJwHjU9MjMAzUwgPjSXL06t0
	1QvP5xhVPZJbp8r3zYmu8t4JpH9GnOif1l90/b8SUbyuG75p+4mAx9ZAZgI8dTKy
	6Vf27Bb+ZJkwxbF9kLnJXgeXJkJj/9P0ED+BvNdZgSgZePLP0JUtnYLwcBkEw1KW
	IYRMsS+TEb9iwXj6Ns2uLd+YYhpx4fJKsBkF7gFWlsjE6VPHj8a1HEUYp0+3mxTb
	UngZQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvgxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:04:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e8ff14e5so10259825ad.3
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071056; x=1776675856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=;
        b=Yt74BEtoSbbcMjHB2RtDCRVeHI9Y4fWL031uBWunfGhnqM7lpE6EY5c9CkIls6VodX
         HpyMzZukp4D/wu9KkqyGTiP2nACw54IAuBWnirqSMUFnL34CHQPCLh3ckUcJV2WCU/V5
         /QjApu2Fo3b67+wG9hC7R02xxNVaWBJllfJZaRH6UGNhLJLuYFHZ8mPHQM9V4M9BNlx2
         P+6QzUGfVWF7gZNbUsm8CTmDKmmq0PU3M5H35mRxRkaYjhGKKJogeQSJIUmy8pi1vvYg
         7Md3DTk0b5VyJQ0DnQrYIIyuhTvCbvYNeCs0nYbn9WpNB5zv8sJybF2db7K8Wac8pYuI
         FvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071056; x=1776675856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=;
        b=I4BoOVYmymGRBJ7BtettJt8odHQFW3eLR3iZMiOR6XDebDAG9fOAFTV8nZuB9HDYau
         44kJA3s5zOPHqd/KEcVf/Tjx+h21tV4me608X3QjUAcfpwID1LYaGmiRkRVNPv0ObAPx
         LcewgePQ005MiQyVOUSitEjaEnwzklpcXl3tbIkSwBtcncSy2TY9NkYwe8DjGzYS1sWr
         fyYqDPUvq439i3HhwYhP6QS77JvckCiWaSNv/jAaIFmPOwNUHU0EkEXrvIqy3z3+q9NO
         dwhE59zVM4NqBdnMVaQKMwMpBNJ2Ia5SrPIaJrSO7zyxC5lccABLoxHODOKLoGVpe8+e
         AzMw==
X-Forwarded-Encrypted: i=1; AFNElJ+Lgo/LKTHctI0lZKvULj15P0w7udnAVOnYyzPeN1sMfWnqnMVdi06YDCro1u4lBVdYARM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn2h4pEuNxeysuIdjP9lamqOXFV16fCd7fxK6mYEa0aE3/EtSg
	U+B1GSdvSpxUGHQ3xtWOJYtGocW2eM44zXgawJeKNdYXxRiFKCyTzJucNvbeSbFZSKIQmpi0q0Z
	lx9NZhspWOjxj9+0gwC6djwdPG/F+aU+0Gi/BxXKJsdO8NtnPQiI/11c=
X-Gm-Gg: AeBDieu9AweI5bn5nNymKWkxnZiASOaHfUseN0QnbGqeTYPzbyoAEnmp+amrFE+/5RN
	YShazQ4ewcvQBKAFNQxUWRvoZ1pluGYA9Kx11nsArZd1jNwnR1pXacUCOROt/Z9zR3Ck9RDWzOO
	YA5pfz+iG7d0AOHMJisrXLfM5juKXW+/J8Gm4qR4+LWc8zoL2PE2liPLUMvUrxW3CD7kYYc7mHa
	mw8xXVYMM3jZwM4W4e5NiPITk2X57u26X3VqmUOkzf+rdGi1II8pskwrWZ0Ws0GNOWvDUaMGp3S
	wt5BZiMdIqRH2hson0h+SmJR48nH1VN/hMp3xKWhraJUguLGewkS4OpIqNVxZGyXYeLy/qMwUkv
	16OhV4TxYZSmn2dOCvj+WsS5VOB6YlAJZn8QjiFIjl5zEnptLvTVKfss=
X-Received: by 2002:a17:903:4405:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b2d5a30ae9mr127536945ad.21.1776071055946;
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b2d5a30ae9mr127536505ad.21.1776071055320;
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0a39fsm106272495ad.48.2026.04.13.02.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
Message-ID: <a5fdde58-3ae0-466f-aea3-8367c6c94f5a@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:34:10 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
 <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX+UH3EcN63Erm
 dVsQxzvVqUOUk0Ml3c6+hQwvEWXbBIVNd9IlIqet3BDECNHQSbyeKszqnP2/qpbDMZHVXYikzyu
 0kl+9snbyAlkgl9G0u+MOJpf1e8Bx3QI8NxYyhJK9RsJ0Y5IevMi8Q2A1oci/b9jXv1UDCvasU4
 GNd4I7RAMrgD4xdzfj1OIEm4wpGskM2QpLH2f/WeMseGFWZiNJSqkb3KJqDHwHbN/lDIRAcyNEa
 etKkizE4YmZigWl5OYmZw6STuLabqTj59zCF/7apnvchSU3VPT/xfbM6nTv+PCsEgIIRl8RQqrc
 8REJTTd9KSq/tV7DC+xvIUpTzI6LXARkFY2DNZ0VXx+OTS07S6qZoKRjcEKWULig/9elRX/pvjx
 t1tGG1/jnBOfnDB1O/Bt7y8s1MrPmDiwozzo9m8Pp6nONTzxI4HF5o0emVk4VfcdrBx6gNFuf7f
 vauxSqwPIl/msjH9NBw==
X-Proofpoint-ORIG-GUID: oYU6qRWqrtspesQCPNZAQMktPnKIx_dh
X-Proofpoint-GUID: oYU6qRWqrtspesQCPNZAQMktPnKIx_dh
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcb191 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LJiLoplfShnj9_vHJaQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 2:22 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> The Sahara driver currently selects firmware image tables using
>> scattered, device specific conditionals in the probe path, making the
>> logic harder to  follow and extend.
>
> "to follow" (remove extra space)


ACK.

>
>> Refactor firmware image table selection into a single, explicit 
>> probe-time
>> mechanism by introducing a variant table that captures device matching,
>> firmware image tables, firmware folder names, and streaming behavior in
>> one place.
>>
>> This centralizes device specific decisions, simplifies the probe logic,
>> and avoids ad-hoc conditionals while preserving the existing behavior 
>> for
>> all supported AIC devices.
>
> It would probably be useful to mention this is in preparation for 
> adding QDU100 support, otherwise this reads like it is just change for 
> the sake of change.


Sure. I will mention in next version.

>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 66 
>> ++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 58 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -180,6 +180,16 @@ struct sahara_context {
>>       u32                read_data_length;
>>       bool                is_mem_dump_mode;
>>       bool                non_streaming;
>> +    const char            *fw_folder;
>> +};
>> +
>> +struct sahara_variant {
>> +    const char *match;
>> +    bool match_is_chan;
>
> This is dead code, add it later on when it gets used.


ACK.

>
>> +    const char * const *image_table;
>> +    size_t table_size;
>> +    const char *fw_folder;
>
> This is dead code, add it later on when it gets used.

ACK.
>
>> +    bool non_streaming;
>
> Please run pahole on this structure. With the interleaving of types 
> for every other member, I'm expecting there would be quite a bit of 
> compiler added padding.


Sure. I had ran pahole on this structure and 8 bytes can be saved. I 
will rearrange the members of the structure in the next version.

>
>
