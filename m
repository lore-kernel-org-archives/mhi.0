Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4D3446CC
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770084; cv=none; b=Hz9QoKtefu3jSzumBUE/Y7/rfT2C9Vs6PLQtJHl1WqAPnNnrxW3rn9lNCOh24blpu5qY5qBdSpk7SkkHhf2wWYCApTIRZaFAzwFMOzrisgFVGM4c4NId3ZljkzCcatkzhruYmRBZgMQzA8gBtF1plUCc7EfEMIY36IKxxDcc5bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770084; c=relaxed/simple;
	bh=l4cI7hA5CWVnZg8+3fOXH9WY7OmJIb+53y5zfDCG+aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ui/sPhae0fzUnakTruHTZWskkMaP5Vqg4D1Yqzw1ofOPSF2ColC9GHEhmHZ//9xW9nKDlx6jvYNJrspuwvOBJQpSC1zUJ8U6y3V/0U69FnY/iCZ91SLfRjGp4hvGilJg4yaGEt/SvwWFSX4gRMl+qOQnzBocK1Ui+ery7YC2X3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuTXtdBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UI1xGLZ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuTXtdBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UI1xGLZ5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KG9882626826
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 21:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+Qz551vlVnzXmqr6x8LCPyptEWu8XeslSycSwIXDS0=; b=PuTXtdBdrRm4p5Io
	AzyyiocfRYzsHY684LKJzl9effClSgcO0/zSLt2WOK8ZUOQmOkaaIRGkSu8XrANU
	ew0sEEeUPmsheH6XUi8tA/G97/b8N5YG6HQrNmfytdllqTZaq9zcxj1Cfj1g4Teg
	Kbo2foua2kYDxCXyzJcNcvpgNenDSMCy1ViiesHBkeh1/xiwdXYHeGBVBm+q+Pwr
	60LExhvQ1dUabwXa7PCU4zOWfkoOsvNYvLBxYwUzozVoPOdYjPCUYyEIAFwElIMD
	BJjsztjs5Tc82EiNgQE2tnxc9t6zrMR5G35jmUJhY1cB0FCHKSM1quavTrLjIpXA
	DeFyJw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu1qyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 21:28:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so1776094eec.1
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 14:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775770081; x=1776374881; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+Qz551vlVnzXmqr6x8LCPyptEWu8XeslSycSwIXDS0=;
        b=UI1xGLZ5vcLItvibPi02xuhBuJJLfE19YiF/SFBrgyrqokGv4XqiCPIAmFfwVH+das
         K8eRSFzARVIOePeFb1BtgSEYgryCaqGgUoUeF+RZhHTNRtdZlOpQs2WItyAmdgYGL78M
         P6vl2E7vIK6kfp13mBiG+ptl1sXKMBQPgu5Rncfo2xwMVduYv6ctMRMyKlFAu4u073zT
         LVCYaApvVxNa87trWQYDx1jb4cMeEuUYA+VjG7f8BoukQQJhN5rfV2pjsg1knKayaTeb
         XH6ns3eSosfmpHl0E8fvqO++1WgXPo4y+OoWN5FSXXWDVwCSrpWawfu/V3gQO3JKYKI3
         EWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770081; x=1776374881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+Qz551vlVnzXmqr6x8LCPyptEWu8XeslSycSwIXDS0=;
        b=Dzl2Mn4jDrGJ4AgO7MpEMsizs+m4lcle/VK1MAM17Ik4nXQBrEL/tyvuKEzB9BhRzx
         k4HjR5Xi9VeZhg3iNTLZTwOVVCOAAwR845x7huRA/dwO6BQ82C1cbY6T/Hg2m8We8IlU
         cnkCITmYZg08A2O2o3o1h1FgArDaSczxdIG55ZJ6ClkR4hUzUvXyJKuZw7wY4bJZxHZt
         PuKaexARuhWDkl018+NRQk0NnrTRJXJlotsNr1iNM3FQyy2hIp/L4svuvYQHs4U0ByV/
         mXihF9NmhcdZIAV1yue/nAKOCoigX1f4YWQg9iSSMHRJWVid+zaLMHaY+kxTdVDqhSIT
         Fa1g==
X-Forwarded-Encrypted: i=1; AJvYcCVV0iqQ+rFKoMryH7MXf6KjCDyQN9gULMD9CohSW6CEoktQPELd0DinSGzztsfroTHlXhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGw8CC+wPNYHt8tKyky/L9+EGMZJUD5x7/FNKSPC7L9bzWKn3G
	SLmmbl2VwaYe7j+XZSOH3R4u9QGc29NgGv1Z5Ag9t275s/2kU4r2A4u2N/mqGnhMh54ZqOyDyWG
	i1kEJ37sS5FEZKB/oyucqIyQDKKLzFw/VQQy1MY6/kqRg0AIHilCbWSI=
X-Gm-Gg: AeBDiev9kN/8RoXiirXoQ7bUbwgklaNrEiQ+leiDkV4gTS0Gv673I4wf15FbZMPXi4C
	HpU+vL5xav+1Pdj2Ga7I+8cA3Cwt4doGmf/N6vKb0fUC6wnsBZVE1CmRE4cPj2ddCLoZg6uTmMQ
	qI0tSzMZlU/kbnpVWptOqqRbX2uKZi1X23L7BoOOxsQzHaTeb/GO5xlE/wUa2JCDjw7UsZTaVE7
	2nS5TnYtuy+gtBeZeAGa7lVF7X4WBkDfBU6qusPZnVXakxSYU+xA2mji9k9XaWv6GQ3GBVonPMX
	fq7Ws1NAZ2WnfC2LfAUChirWHCGRW38FHHDcGvVy0GTCHKx4rC8r0pKP/liW/4apxry2n4N0zrO
	zhmZvI0wcXBoJru4NycLlaEM5Tb/GgX5/vhLOIIssoKkE6SYaXbdXzqdVM5xeALf/UcSPXJ6x3S
	M=
X-Received: by 2002:a05:693c:3005:b0:2c1:7ea5:ec29 with SMTP id 5a478bee46e88-2d586eaa366mr441798eec.4.1775770080857;
        Thu, 09 Apr 2026 14:28:00 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2c1:7ea5:ec29 with SMTP id 5a478bee46e88-2d586eaa366mr441778eec.4.1775770080326;
        Thu, 09 Apr 2026 14:28:00 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm1665997eec.10.2026.04.09.14.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:27:59 -0700 (PDT)
Message-ID: <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:27:58 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] bus: mhi: Capture DDR training data using command
 mode
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-7-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-7-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: su4mEahMZFcLYpEVuuS8cmcd5hRN6_PF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5OCBTYWx0ZWRfX12SD3Q7u+tE2
 UiZaFYJ/lwckySQs0ToKPOAU7WkXCHcCK9gMDqRjF4q7YYqcQKDK6fEgh1nOgqFHN+V/WmK1BCe
 iKNL89S7//7FIvhcoE9kO0GqbvkRDDFZpcr+wFUpvfSfRNat8Y2f3RHUqY1SzekUfdheldy54GD
 HMETcwVxYe2pHCRZJXZYPUKjkPzT4HjkHhfYyKjRoowL7dEHCqYeGobLgFrLx+Fj4X95p7zDsGL
 PffaYdvIQCjx/FaIDHcroOhHarl6hKd38qj0946ix/5fFSKYYVCYdtSiAdX8yUCP8VWMIAWEQ5m
 01aAR3/H5ejHGBJVAAhA+I/QMepCggpOyP7vId7enavYYOyw/FPF8Q7WoH73NXwbrwEF80nGAuU
 isadfWuUrGSsBSa2dDH4VUAoL+5MLQfFPMYwoKQpcd8kAXOnzoiOM4CjafajSxbMc1kdumYI2XW
 HNHWzQZ727y20TOwHoQ==
X-Proofpoint-ORIG-GUID: su4mEahMZFcLYpEVuuS8cmcd5hRN6_PF
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d819e1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U35_I10QZVw-_bRh5h4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090198

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> During early boot, devices may perform DDR training and produce training
> data that can be reused on subsequent boots to reduce initialization
> time. The sahara protocol provides a command mode flow to transfer this

Sahara

> training data to the host, but the driver currently does not handle
> command mode and drops the training payload.
> 
> Add Sahara command mode support to retrieve DDR training data from the
> device. When the device enters command mode and sends CMD_READY, query
> the support command list and request DDR training data using EXECUTE and
> EXECUTE_DATA. Allocate receive buffers based on the reported response
> size and copy the raw payload directly from the MHI DL completion
> callback.
> 
> Store the captured training data in controller-scoped memory using devres,
> so it remains available after sahara channel teardown. Also distinguish

Sahara

> raw payload completion from control packets in the DL callback, avoiding
> misinterpretation of training data as protocol messages, and requeue
> the RX buffer after switching back to IMAGE_TX_PENDING to allow the
> boot flow to continue.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 328 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 320 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 0a0f578aaa47ab2c4ca0765666b392fb9936ddd5..c88f1220199ac4373d3552167870c19a0d5f23b9 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -5,11 +5,14 @@
>    */
>   
>   #include <linux/devcoredump.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
>   #include <linux/firmware.h>
>   #include <linux/limits.h>
>   #include <linux/mhi.h>
>   #include <linux/minmax.h>
>   #include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
>   #include <linux/overflow.h>
>   #include <linux/sahara.h>
>   #include <linux/types.h>
> @@ -60,8 +63,16 @@
>   #define SAHARA_RESET_LENGTH		0x8
>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>   #define SAHARA_MEM_READ64_LENGTH	0x18
> -
> +#define SAHARA_COMMAND_READY_LENGTH	0x8
> +#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
> +#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
> +#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
> +#define SAHARA_SWITCH_MODE_LENGTH	0xc
> +
> +#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
> +#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
>   #define SAHARA_DDR_TRAINING_IMG_ID	34

Why is the indentation of this line messed up?

> +#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
>   
>   struct sahara_packet {
>   	__le32 cmd;
> @@ -97,6 +108,19 @@ struct sahara_packet {
>   			__le64 memory_address;
>   			__le64 memory_length;
>   		} memory_read64;
> +		struct {
> +			__le32 client_command;
> +		} command_execute;
> +		struct {
> +			__le32 client_command;
> +			__le32 response_length;
> +		} command_execute_resp;
> +		struct {
> +			__le32 client_command;
> +		} command_exec_data;
> +		struct {
> +			__le32 mode;
> +		} mode_switch;
>   	};
>   };
>   
> @@ -163,6 +187,7 @@ struct sahara_context {
>   	struct work_struct		fw_work;
>   	struct work_struct		dump_work;
>   	struct work_struct		read_data_work;
> +	struct work_struct		cmd_work;
>   	struct mhi_device		*mhi_dev;
>   	const char * const		*image_table;
>   	u32				table_size;
> @@ -183,6 +208,24 @@ struct sahara_context {
>   	bool				is_mem_dump_mode;
>   	bool				non_streaming;
>   	const char			*fw_folder;
> +	bool				is_cmd_mode;
> +	bool				receiving_trng_data;

You already spell out "receiving", spell out "training".  I don't recall 
seeing "trng" before so it seems like a really uncommon shortform.

> +	size_t				trng_size;
> +	size_t				trng_rcvd;
> +	u32				trng_nbuf;
> +	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
> +};
