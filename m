Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F953AB29F
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071130; cv=none; b=jo/NaVpg/er4qGlSA0OhLSusmWibd4ta44MlnUhUG3+wSBEG+kHQH5V1DJJt2F8lbev8Zzt5W8775ZvkvKzxkd5cf9+214Kx1qljZiAStZLMQMiwsHiMV9ZgdE/6BIjtMfLxWZExTKs4Otea0XNppF7y0D1pznRVFXdG5ktZRLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071130; c=relaxed/simple;
	bh=XUSWjMqY1TcVj/lT9b3VTx7DlNhLHwV3UnSmPKiLVH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrMtEfsXGX7kzjt9sGDFjAZjLfuKys0/akGgFMxly3gXSyE6unTEno+ALWs7WRV9kW7jwweoe1OVfqKrLofZy2PJreEAzXwPMoMCARyCeG2dy8fkhO5Z4v9qrsEX6rQKcPNF/eY7PJHGSgwvgOAvIHmLF6oSO5lsZgUpT/7b+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncBPZl42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxTfymQf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncBPZl42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxTfymQf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6vJnx206759
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=; b=ncBPZl42vKT0s68i
	YjZ2sTRDO+TtXN2sVm07lZYm+vdcxWR8JTayAgAtKS46DeK0k1NZuyOzT8j0Yljs
	J0Z87KhGON0fVjyWpfDLyiNrTZ/50vJTpC4CWa64U8NzqZK6jbjmROZyxbzV+53Y
	nV5HUrQLiK73lWGhSTWWTZDD1f7p0I5f9Dr6HLT4F7Cfm5Vjxqrrw/Q+wRVXCeNo
	YImpEQIX6DUbDAG71sMqROrYnUnlhwxsomWhIah7w2NaEtahAJg8iHrebk2WhmRO
	qGhfpZAl9RWzoWREmyhUj8/8+WclYO3XxU9pi8EqUy3Ft+iBhdJqbG4Aoy0bFg2z
	oXUqpw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhvhr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:05:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bce224720d8so2182282a12.1
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071128; x=1776675928; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=;
        b=DxTfymQf+yKTkTIMFjckCJfsszzydDKIa2Io77Ae7oqmcPR0XxqrizjSLWN1BZnMa1
         K9tQhfqb+RxfgmYT2micC048MMlUGE/u8AjwohixFq4QQJRV6/wXgtXxDnOwogzRHUNB
         N5sQa5ivV8GeIZe8MmELm3nd/o2AvcVw+JdJKsVV7LYWqgbl8e7jg8YmO2WssFD9C2HP
         pdLdLisPZHVdLruX/9NKs/V1IHqL+mkmqoPU9UX3NXyvCwTer/gY0gCLv7pSbpZS2HLd
         O4TE/6/2fveHf1Ox/OMfEocbHek2/ZrW4TCpB5QiHA9nvL3jyzthOaNsDW2Ncikg2wj/
         5t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071128; x=1776675928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=;
        b=rZZIlVsqUShe3Fuqw2pYo9UJEwved3VgcQEoRcuO83ZLkQMMLuBucWGagjCgFXZjXH
         CjI+HZTXE65i5fWXk0rkVN5XvApAawcAxkIFrhOJ3R7zdz+whDhOWsZgccqpRMgYMXVx
         s2upJg0m0lFVH/2/rW6nuG5QUji17sIxEms2Ui5zvYDvz1GbJWJqJPq8cssaoucnNiyn
         zivXBFtuYCa94Q06drx4fgrGJCzm4sEtRL3k8ezqzmELdtr+mor5k6SpMujCUbxfQosl
         tet+ls9cnPYdmh39VfSTd14DpeExvIjUUK9P796of5KzArzRC/A0m6MSQzn22/qh9Aoh
         wC1w==
X-Forwarded-Encrypted: i=1; AFNElJ9+zqvEZBbr/nIoIzW0Cndxnv8cfJ0ifqN+FT7uHteENuACnJdm2CCSwnwXoZYeQd8U/Ps=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9c3spWQtmnLBiOnnOMTIvvDxc1DqnDk1zNOvW02lqC//wR2Vt
	szi7dzQ2Ub7C7aqJMs6qWsJIdexnoZHaznAnsJ9n6vgr62VP3IV8Zfx0UR2YIAikUfSmp/3M+wt
	qWfRMNF+QFBZg8mFUcfnxRlpjdd/x0rTywBmXuaGi8NpYi+/DvWU74JI=
X-Gm-Gg: AeBDiesL2e5ckmdmYskeCstYdHLbzHbWcYGOBKPz0Irs76ayC3X6G54jxBcUa2BuIp0
	lTHGQS7G5MW2SeID3AQli/vNYPfGcI2WlovRDU8RMCI6J/bWnRRXvCDcZFM+2VQlJJgdMCzBib8
	hI21Mreb1VTIvgiIon1Bhrbx8CrTIvS3RuF752tAknWrd+2wKy1cH/NozFd56o+kLMDi3lCKCVN
	6FwU2iHoy7iKQUum0wiTI40s2Nq8lhQHWsbPrfHKQ+O8Dh5b+b8PxDnhRR3rtlL1Ro6IAUDFDwC
	t8JBQpoA7mWlrWjiLTT0wDQbohT60roNh+VxHzFiRWs43gpRbUR+y+jq+s4DXVCHpKFg9D1K7Q1
	3q4A0cjgh+ppuHc8MRd8MvLCdiAUkkv9UaBAtrjGMEuInYhk2BUlzHeI=
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr14281924637.18.1776071127652;
        Mon, 13 Apr 2026 02:05:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr14281886637.18.1776071127179;
        Mon, 13 Apr 2026 02:05:27 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc7e7sm9366906a12.10.2026.04.13.02.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:05:26 -0700 (PDT)
Message-ID: <62078c92-ab6e-46ca-85b6-ff02b8b4cdf3@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:35:21 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] bus: mhi: Capture DDR training data using command
 mode
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-7-47ad79308762@oss.qualcomm.com>
 <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX2cs7ImY2c9pA
 5l25FdvV4+YakiboQqh5+D2cAdttcjBNt277nWzp5HyCrXT+oY29t9jbb5au0cf5T6pbkb4EDnJ
 9CZVWmYTXUuxVTfuJHd5m/SL0+vaLLKMH6QzV/J7XQq7m/xPvAht91siEAHLi5djyfvR9jaGiUG
 q13VqSufoWwV3jqbB/zMdzN1JzP1zciexYSsvqLsf/aLB7sltd5udLP62eWXpAKHrT2+pBty4W0
 E2+r1dFyzy0v920s/NC1/4AQ2HVsGLkNepP1AWjFe3jtqgSmfhfvnDn+hVoD6ElczMB1eYr/6xy
 4QmiflgqnfdM0EP2pyOUneUUiVvLfpfiNlAhSA20wCrZC1drE+qcp4QrFgqqnvfWeF+zJ5HAfuq
 uJenniMUtSrhG4sD5/pySxPCAPHIGx9wWgl/AjmMDim1/o3sHin9SyzVNFrGBV+gf2SK+P/B6+2
 ljcKWhOFedoP5kforuw==
X-Proofpoint-ORIG-GUID: C8s55Fv5BuX6YfjaKCKnJwfWW1q0ANFG
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcb1d8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VNyJVnxpnutqXYa9aisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: C8s55Fv5BuX6YfjaKCKnJwfWW1q0ANFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 2:57 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> During early boot, devices may perform DDR training and produce training
>> data that can be reused on subsequent boots to reduce initialization
>> time. The sahara protocol provides a command mode flow to transfer this
>
> Sahara

ACK. Will correct it.
>
>> training data to the host, but the driver currently does not handle
>> command mode and drops the training payload.
>>
>> Add Sahara command mode support to retrieve DDR training data from the
>> device. When the device enters command mode and sends CMD_READY, query
>> the support command list and request DDR training data using EXECUTE and
>> EXECUTE_DATA. Allocate receive buffers based on the reported response
>> size and copy the raw payload directly from the MHI DL completion
>> callback.
>>
>> Store the captured training data in controller-scoped memory using 
>> devres,
>> so it remains available after sahara channel teardown. Also distinguish
>
> Sahara

ACK. Will correct it.
>
>> raw payload completion from control packets in the DL callback, avoiding
>> misinterpretation of training data as protocol messages, and requeue
>> the RX buffer after switching back to IMAGE_TX_PENDING to allow the
>> boot flow to continue.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 328 
>> +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 320 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> 0a0f578aaa47ab2c4ca0765666b392fb9936ddd5..c88f1220199ac4373d3552167870c19a0d5f23b9 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -5,11 +5,14 @@
>>    */
>>     #include <linux/devcoredump.h>
>> +#include <linux/device.h>
>> +#include <linux/device/devres.h>
>>   #include <linux/firmware.h>
>>   #include <linux/limits.h>
>>   #include <linux/mhi.h>
>>   #include <linux/minmax.h>
>>   #include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>>   #include <linux/overflow.h>
>>   #include <linux/sahara.h>
>>   #include <linux/types.h>
>> @@ -60,8 +63,16 @@
>>   #define SAHARA_RESET_LENGTH        0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH    0x18
>>   #define SAHARA_MEM_READ64_LENGTH    0x18
>> -
>> +#define SAHARA_COMMAND_READY_LENGTH    0x8
>> +#define SAHARA_COMMAND_EXEC_RESP_LENGTH    0x10
>> +#define SAHARA_COMMAND_EXECUTE_LENGTH    0xc
>> +#define SAHARA_COMMAND_EXEC_DATA_LENGTH    0xc
>> +#define SAHARA_SWITCH_MODE_LENGTH    0xc
>> +
>> +#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST    0x8
>> +#define SAHARA_EXEC_CMD_GET_TRAINING_DATA    0x9
>>   #define SAHARA_DDR_TRAINING_IMG_ID    34
>
> Why is the indentation of this line messed up?

ACK. Will correct it.
>
>> +#define SAHARA_NUM_CMD_BUF SAHARA_NUM_TX_BUF
>>     struct sahara_packet {
>>       __le32 cmd;
>> @@ -97,6 +108,19 @@ struct sahara_packet {
>>               __le64 memory_address;
>>               __le64 memory_length;
>>           } memory_read64;
>> +        struct {
>> +            __le32 client_command;
>> +        } command_execute;
>> +        struct {
>> +            __le32 client_command;
>> +            __le32 response_length;
>> +        } command_execute_resp;
>> +        struct {
>> +            __le32 client_command;
>> +        } command_exec_data;
>> +        struct {
>> +            __le32 mode;
>> +        } mode_switch;
>>       };
>>   };
>>   @@ -163,6 +187,7 @@ struct sahara_context {
>>       struct work_struct        fw_work;
>>       struct work_struct        dump_work;
>>       struct work_struct        read_data_work;
>> +    struct work_struct        cmd_work;
>>       struct mhi_device        *mhi_dev;
>>       const char * const        *image_table;
>>       u32                table_size;
>> @@ -183,6 +208,24 @@ struct sahara_context {
>>       bool                is_mem_dump_mode;
>>       bool                non_streaming;
>>       const char            *fw_folder;
>> +    bool                is_cmd_mode;
>> +    bool                receiving_trng_data;
>
> You already spell out "receiving", spell out "training".  I don't 
> recall seeing "trng" before so it seems like a really uncommon shortform.


ACK. Will correct it.

>
>> +    size_t                trng_size;
>> +    size_t                trng_rcvd;
>> +    u32                trng_nbuf;
>> +    char                *cmd_buff[SAHARA_NUM_CMD_BUF];
>> +};
