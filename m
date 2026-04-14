Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BA3C873B
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160636; cv=none; b=qWwAsGdQ/i2WnQLrNYB89LkfOi9G/MIa4I2mj+6uxLlmlryd4x65BMtERRkog+C17BapGoSO4y0t8tn5HRV6tcNSAe7uph+Q8lldC1oEjtOH/9wMvrkVzLSv8HMxsmchDy9pp7GZbSG9d37Kpg0VYmgNL67xlkE6mBIuBwfDqAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160636; c=relaxed/simple;
	bh=4QU+j2opPqbRY6S9FdsfsGUfoFq89DJ57ft0XCMPXrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvmkZRwUVAHX/fiZijNMEb+H3G3GRr4+Z72cT/1ia94q3ARkUzDfKzhV3Wn77H+eGYhFRNTUv6iFvUjxk4q7/fd2yKQ+w2G5vBg7ZOSI5NWmdFLwO1FlDsGzQ7tS3iS+5wlqKtIloupULMA3/WAB3RgCLC8KtUPOyYnCGmbAf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUruiPe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJjY2DDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUruiPe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJjY2DDj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6erU82509955
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=; b=YUruiPe2yV8G8P68
	Vd3jixfI8MHnR+ZnVmulP5Q5N25mGGpJnQ+1U8QrIosZeRbZ+88VT3gJDgfvjmfU
	vEWG4mAtg7/AKF9JcnFXrznz4nnphK/5A1xW1VFnAvUzH4T005KuoJte/BtsIWh4
	Dwp1c94+VP+V63QkVWwgo+BFfUT0A+kYevqaBAxswQtsmWWgUBWK0ftbFL52ieY5
	lygOEGycTzqK6h856CNfTym6c1q3AoC+TnJSPdC6tthpTS/IpAKWkHlnHtRkPwtt
	itLcs8B84SGDFphn3FbBTiKoClVOQdUFJsOqDW/WBFnwTWBU7YlzuhVjDORiIf9c
	iaXFYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867t5h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 09:57:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fec175so76515385ad.2
        for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160634; x=1776765434; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=;
        b=MJjY2DDjLpW3Fkk5ex1YCbAx9p++FkG1F6ivZ8JvbaIlLKGZOVi0VoZnEPE/R8PolB
         U0pF0ZKjygAc/NjBuTUgHwBEntMcAmxUJvcCzkkGBsTpl/u/edecDjaU1sF32jO/7kNO
         VZgmMuNLJX8DIdsvICu3HGyayr6Y3dFoqB/OSIHEaIU3BOSxI35aT2X73LtHRnEMbuto
         pLZwbboIJZr9Nd+AS2z/Mu7yHXAYdBAE9bsllLVsQKgL1edKmV+z/kxpNcKYQmcJnhSu
         KdJhF6PmDXiJxdC1kZNenwYxAnyaDGs9amrqUPnqXVcVAELc1jhx4uxWX3NoAglqHHFn
         3Djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160634; x=1776765434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kflg0sxdLIlLz9lYcDWzQHlhPZnpJHKOX3uC9w/Wko4=;
        b=BgPCkwLD3VVtdgyNT+VYHs+5vv+hab9B3oHo6/uAJVpqtJOpzYn6iCMlOzmSiefcqp
         OdpWhJz+kN9QzA87jiNc8uB7ATpvC6O2WseL/bZLvr3XGn5ZIkiaFGWlfMIZLk3NcyIZ
         4+0zM5Jm45SWb9RUzb9DrvEtOwGGx4k0mHvgLo9Ho1CnQ00bqvBKmt379nnV4xZIAlmA
         zTO9jRndZiMKex9csDjcMQ34r5XBrK4ePsgyDbKt2QsPMsCKKFs84bq0wE9RAbPm7Snk
         m7JnNsfOb3UftIXjByc9PcQRc8kvq+b3/THUdcGga3UjFz3FHT25BSZ8ui4DVK78J34l
         CssA==
X-Forwarded-Encrypted: i=1; AFNElJ9APaJEsgGY3qslfKPUiuFsPBIL/jNR0+79KX9Qqwh3rFJ4yBzTBpbYNNAZyBqz12D8kzY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuvRTD03mc+7RoZMnp+z0v5wnHr86uBNCxFSdmDT2rbciw1mFx
	IKYiy6RKDzq+UiRzXBtkHnoFuMturx9ETlMXFCR9z7zU//cmbAOwdV1YOafAh2z6Stzd083kHH+
	lMWII5DWTjh+vJg2bqOavYdjkzqdIckzynqwXUDh8f46MlIUPikQ3OQA=
X-Gm-Gg: AeBDievSkGLVeL6q+YPZbhaENC+n+wggnJBG464B5Lyg+ozdxByCV720B/XEwl/dqbK
	8pAp9vu069ZGvwsOznS8FjFQuOKULBNdpxkF9a2J75n8e3Bkxy6/8kk3QQ7bmMAWD6/1CPucZdV
	C2OI2h1LAR2h7mE0bwYQsnyvG2RtVjJg4GUUOnhmiPqValXlLlBjEE4qX0Sn+BwuvZWfdw8HDW4
	H9dYkseSKZsCFBAihFOZNwOCBh3tZEdaCHYmS5LswQn1C9Hy7bpSd+o1On1JBK7bTO4ne1pa/JW
	OWo6okdxAP6mmmrxHvyF4yb/QMa2isxjUSBV3ow5pyKpTH5/qFYxmCt2gOHQckimNPFmds67ePN
	fCX2LP2up3GIQgsF9b8F2TZBSbRWpqo9NN10P8xZ+BKKJj86D8rpajg==
X-Received: by 2002:a17:902:6942:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2d5a9e7bemr117452275ad.41.1776160633566;
        Tue, 14 Apr 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a17:902:6942:b0:2b0:6e12:bb21 with SMTP id d9443c01a7336-2b2d5a9e7bemr117452115ad.41.1776160633128;
        Tue, 14 Apr 2026 02:57:13 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dae27asm138487695ad.7.2026.04.14.02.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:57:12 -0700 (PDT)
Message-ID: <f9bfcf86-046e-45c2-a664-425db04521a7@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:27:08 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
 <yttrssaw4k2vx7r6l4vsb535qcrr4phsgj6qlnu2r764inai7o@d4qgr7uu5t2s>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <yttrssaw4k2vx7r6l4vsb535qcrr4phsgj6qlnu2r764inai7o@d4qgr7uu5t2s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BUskt1L4Y4hSYlZm9eiciFFiJLULa6OO
X-Proofpoint-GUID: BUskt1L4Y4hSYlZm9eiciFFiJLULa6OO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX1xiZChMTHAK1
 aSa0OHNncJv4bHh3qUkVCWbJtjavqSeawc8wbqmIq2b1bbbWUxMQAgV31N7T3KtwpQedIVTsLZD
 TIqiepTKNxL78GRwsL/tend8abm0UBVMqkkn+A3Pul8AcUZpTkIxuOLiOyuGdiB0u8T3JyQ3y2A
 UOIfuRiPmw/9Lmc+VHZezpXpfXHG1u1cwVJhGDtK5eTgfXGAoIX3ekAXPuzxup/kjWEtRq5qi3b
 7zHYSZ+HrKJ3qIp9uFvu/MIdg5HXBWUGaodxMTnmxXuAJ5V0NNaVICbp+5DtMg8sxt1OoXbqQvB
 kt1WBXcRIey0jskpy0h0EURW7LmmQ32jFFVxuwpjZpxhPV85+NxVIjBQcixGXeXZqQjfgrKh/3N
 HTz9QEaHea1YoM3Icf4oJ7TlLWNS5l0F9R+VuLai8pTlp+Syen13R9qtez2AiffP38tdf2hvhhu
 cQ9IuvAx8DZ80wCNCrw==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69de0f7a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XMNYEwTNIfZjcZPMuGwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092


On 4/13/2026 5:29 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:49PM +0530, Kishore Batta wrote:
>> Add ABI documentation for the DDR training data sysfs attribute exposed by
>> the sahara MHI driver.
>>
>> The documented sysfs node provides read-only access to the DDR training
>> data captured during sahara command mode and exposed via the MHI
>> controller device. This allows userspace to read the training data and
>> manage it as needed outside the kernel.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> Ah, this should be squashed with previous patch.
>
> - Mani
Sure. I will do it.
>> ---
>>   .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
>> @@ -0,0 +1,19 @@
>> +What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
>> +
>> +Date:                   March 2026
>> +
>> +Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
>> +
>> +Description:            Contains the DDR training data for the Qualcomm device
>> +                        connected. MHI driver populates different controller
>> +                        nodes for each device. The DDR training data is exposed
>> +                        to userspace to read and save the training data file to
>> +                        the filesystem. In the subsequent boot up of the device,
>> +                        the training data is restored from host to device
>> +                        optimizing the boot up time of the device.
>> +
>> +Usage:                  Example for reading DDR training data:
>> +                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
>> +
>> +Permissions:            The file permissions are set to 0444 allowing read
>> +                        access.
>>
>> -- 
>> 2.34.1
>>
