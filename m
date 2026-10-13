Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF7D3815E1
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876451; cv=none; b=ii7Pq26+yU0nHy6mQK69xXp9Og1hpjl2XIMevt3hkEFZkQR7/saUGYNdDVLaF2fTsq8roPMFPde+16Jcr9PqqgV+GbQdfbk7HeeUBUB2SJTt60pkV6SR6CmBsH57X4L2+m7ilfoeGKMgUncKIGuAIBjoJq+GlJ89e23i8aPWxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876451; c=relaxed/simple;
	bh=HNtZ6WxqkhhZxZcY0QGx+aYFkBcRDuHhTkZVnERgxgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUvtsTuLEgVMBo4JLKfOBW2Tjms9nCt8I/x+omrPFxvblxVFf5uzyRJdRpuAShEMHJ7H/78jFRwlaUP3FCkkyGLnUcZn+YlsqtGcJFJXV7N3WmnNHZMOX3hIqBuB4XHZzggsypjjsojOLJRmX7+B2+Xz8LXUSPNym2CMQyhsQEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVEOvMuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hO6Lnu1v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVEOvMuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hO6Lnu1v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21DM93054911
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 07:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=; b=gVEOvMuJ29Cd8Tk8
	E5fUCLBmjwGvP9eU7uoGzTempBz9i2mM6p0m4Uylu0RyfK1u7JiOpFhl7oD15R53
	vV+eCkljybWYkfQQ9cFhdj/SMO1mu0oiUqOWr2cNK/HytSaovAYl/Rr0qALmOY7M
	eYW4oe05hKpSvZ4B5PN70nhyFSeBkZ6aOOWeFm+jXrk7YycsYyRuEXS44IrU7/Zn
	02uY9OWZy5iVEfmQ6Bnol8fvVNaanVP0eeAGF4v/x+e0e/QibwCWAQNYe3Y5uDqU
	iFE/KIGxwzpslCoSkdszLbPJM+2dWuyNuzRxHPO/omGfk/43KNxscIR9k5XmCkQ0
	sLGMwQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeu1b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 07:27:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so1728437a12.0
        for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876449; x=1792481249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=;
        b=hO6Lnu1vjMQlneeWyNxUbL1WYsobHR5NTwFCZVEsPYrbu5jxehpw1UCt4GubCBNFoB
         j8YgzNtR+PZE4GMEcCK9b9NG4AUX7yMCALdqkTYWcDVyUv064hdHmefPyC1g5YPDMibN
         j1+mDZlQKNEqnIvpZRa2hcAAK3rDx5B+oBFgcqwLFijpMIxBOsDYQ+eJndOk3QRpmILj
         hcEs0xL7c7kzMrr0U5aIKTGQpNXMA8j02MOPdTpq0N9CUsVWOxiCAwxkF+mF8JEvk9hp
         DiYrv0wLuJf3//dVG/c+NB85vtCkiZXsX0p8ejeloPM3TqP/M5m3Qmkti0PUQT/lnDj9
         N8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876449; x=1792481249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=;
        b=rKVl+4vwdEJYLWAEFxR/6ecYepufT6BYc8Fq9ZXQczf4mBXp4sbM7BblnxmW8xRx4y
         Fp+aUsoN/aa52inx27zEBrhAi7ZYc5unNJxCa9oRWloaDcaZxxEttWnK9bcbGre50Ssu
         ZUgEQ20y29idejv6FRHXSiVBoVDt615VXgrqIJEKGBznBrQgfx+BtJ2A5vpzEQELn2k6
         XRgiWsZfZz6n5lAzb5ySTGPXh5bfkZQ9B/kAgwgn+0sA25UXGZtsPPqxjsqyO0Qba3bf
         o9FEKA5i4EDmfUz7JQjzE4Z7RnJz4odW2fLj3cT0JF5YKCVJn/jXh1yDC8y8ufWKuouF
         2alg==
X-Forwarded-Encrypted: i=1; AKwUvBzRt1Ub5ZyVg+oVye4r00jwNLlC6rhnvDkQ6OYdf80Uc4tfzQ9JfuVmvQOHyiPc8/dt98o=@lists.linux.dev
X-Gm-Message-State: AFq9FYIT4NxSNO57WeqYLIMrkpravqHRL+Zl4na93BIzMffM/YDya9Et
	GsnKhoSYQvhxfVMYlxR2d3MUDWe5mB9/AT3prJPCdCYkGok23C4zidI19AbjUsuPmLpH+ufbejQ
	ddSOUyK/4j8/jh26xpMQWnkjVL9YPGAU1qDlQ9/X7EIV+PU1UyVlmX0GhzlXgVKE=
X-Gm-Gg: AYBFou1HA9b8ISY0gLDHfVefB4NLS9JPbwwKMBYG5C00aBZwnV9Em6PLODSD4T3gLHl
	wK9ImHw2UTTVQiY7gTG1TwwvqhsL43W04Y9s0KQWYCE8mVF5n3DBBFj3r11a+abvErvbWApya/K
	0wmW6LtudV53wVMiQR0UdEHy99jyS2UgaBc72NJRAxP1MISltPgucIZ2Gv8nw7LABQVzpuhGFR6
	c2vmmCMVip2D7dGLN08XMdKdWI+eJR4uGsr1JfZrtH01l/vhIozo33eBCt8yxZcl4svaGIR+F31
	lOhANQOnN88SUyatFnXOWJDltE2PR23+Bp4oAruqpEcG+xKxrNuqvSPOILumUW+GtEGET4SBzJo
	3vNNtkkxy8sEfsOlXdGpGG8rZzXbZIN0=
X-Received: by 2002:a05:6a21:a02:b0:3de:5ce4:9e72 with SMTP id adf61e73a8af0-3e16c07d2c3mr9113730637.56.1791876448573;
        Tue, 13 Oct 2026 00:27:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:a02:b0:3de:5ce4:9e72 with SMTP id adf61e73a8af0-3e16c07d2c3mr9113720637.56.1791876448142;
        Tue, 13 Oct 2026 00:27:28 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da05caaesm5050788a12.32.2026.10.13.00.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:27:27 -0700 (PDT)
Message-ID: <122f5f0b-6314-4b12-b9dc-8f983c9b5698@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:57:22 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
 <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
 <as1F08YNeWz_1bre@monoceros>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <as1F08YNeWz_1bre@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -Q8pIJHJK5eyxjrZRbgLrz2zq0mBHzxv
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acddd61 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qh2oGK4qJ8XON0oEHbUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX8vWMBQG5rJ22
 frh+XoiR/S2v+nG2wTRetIBVgcrdasnPMsnuiE5sX9NIOsLa6SXWYyXWSQTvcTfvdDbzRc+CBbl
 AxvtwsMmZbKQarvkKBk5n3OLNxVT6Xs=
X-Proofpoint-ORIG-GUID: -Q8pIJHJK5eyxjrZRbgLrz2zq0mBHzxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX8/AJNXT5jexU
 0RlzZTh7AJVXeUXX5OB43YTExj4Q/5XNVSxnH0S5wtwXEWajjPfQLu/ro5MLk4BF8kNK7agT0L1
 mjyYVrr96qd2xo4dW65WwMYyzrrUaSRqM3nLj2XD9oT07b7i8cfIJND06s7EefyqaeLaqobrDwS
 uXrlShCh6vRZTC5oQFMJRA+WjjibxioeVA9Sz+n44yJfEOUZXDQeN3eWqDESgEajZPWJKUNXXA/
 VQwCiAYN9Fh5pQaCmxT3F2dSJny98iTHM3BGyY9n4OGuX9dO9eaLc1O0qYD/4w0/4uVQF7bjc2b
 oEjmvznAj8QKlU4GQbZlXI3HY3WQxZM6hWkpfZLZ3h0U0O+fxWk5cb68cGp8jDdiskYQYHS1V7m
 ZSy+3q9NEQ30i+AOqsY7fClWx9Tgi42TRjmvgibpmmWz/vIVdol4mtrK9jxmrkDLtwaY9BnWHMI
 OFEmYjbWfhwSkhMnOJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130029


On 10/13/2026 2:13 AM, Uwe Kleine-König wrote:
> On Mon, Oct 12, 2026 at 11:48:00PM +0530, Kishore Batta wrote:
>>   #include <linux/devcoredump.h>
>>   #include <linux/firmware.h>
>>   #include <linux/limits.h>
>>   #include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
> Why? There isn't even a (new) usage of any *_device_id. There is a
> mhi_device_id, please rely on linux/mhi.h to provide that. The main
> effect of including linux/mod_devicetable.h is that the driver grows
> many unneeded dependencies, so don't.
>
> Best regards
> Uwe


ACK. I will remove the redundant mod_devicetable.h include in the v9 
version.

