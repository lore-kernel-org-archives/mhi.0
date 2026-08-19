Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5AB42F700
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132934; cv=none; b=LLEfmuqvt8MvrxIaJU3DY9EwC0sMQrUsTJaDT8+TOQjhBjD7dY+4CU/+2NIiQhyQh4gCKYppk4NXPJI4/yy9vNE1NXcwium40z9rCwWeMsrBwdqLHt9IfruImZxdCE1xguhQEPp5hrwLTz7JpdD5NZhBcdzVuKqNtyuPDf115fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132934; c=relaxed/simple;
	bh=uQioOmaJVlJ2kqIbJb4zaXYWx9XtY7h0lBUVlxk8Fn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFJ5O3sB6DAqiw0OWfJuHEMlDM2IWcGb9JbMrhJNfZAM7t8+jVnaewqioqyaxS+sho+9lUohtOFqMQbQlhzvdic6athT4FcYyzmApHh0GdVO3qUSKTUNREPSJfxzk+lZPn1+yYgBoK+VPhC24NgLS8yNIf0i5MI3MGie61vPwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojg8774Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdeswI4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojg8774Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdeswI4O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z5Xt3589163
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4PDAKpq3CcCOlxu5k9j1hSRxD72WCqmgxRmVTcYDN4=; b=ojg8774YigChGZiN
	eoLVmQ4Bk4BvlGc8bAEsWZb5IJkbajvEI0r/xgHj1VecouaT6Urdht2+M/pYdx8Q
	afkQApDyt8S1NFkQElfPy92Etj3aNXx69611EGYJ9IFwiyfFZZSeAxsNp15yEejZ
	7TvqrBK0FYO94KjKT1qjwaHKI/NQ1nJ8uc4dzg5xAp1amGUuXlD+LxBPZpd79kKx
	WHAa1tYNg3bmlJp2GYukPIVlfEt32ZQEC5CUXFvZmqXSEYaHMKSGUfVsuxytdy8O
	CljVxFa/84B84kZ63+kydj1nKC+umU3rRRDjPXeaukqaAdf120gRWcViz5x/zLd2
	2Vcnlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnafjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:48:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1449515a91.0
        for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787132931; x=1787737731; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PDAKpq3CcCOlxu5k9j1hSRxD72WCqmgxRmVTcYDN4=;
        b=CdeswI4OAcH8I7UYPkkb9ktaFrffOVxorGhqwavrm5+XyRGcvRejIn158hfFagetUv
         S3u1kXnpIxQscT+erU0T5uC2ENakGPSfYa6YbGL8S2TN4qmwEXWJ1XOA+/6HPQyxRMKD
         1nj3yx0fCmKvFc5xD6lDAti0JoQl7SwM8rKbmyyWFLmrkPS9pMIjfAsmi+U6uMzZOvR8
         TFrdM792gYVg7tOd0h/65Q1WtFneLqEpZUPFlNq8OjnAmVYKPzdvFxMzxq4j/DXbhWOH
         ClgyUZbmYZS+zGrs+Xcu6aR3nYvfWNdFucCogwM1glZaFsShIVJnIp2Px2HELTL05c+x
         4z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132931; x=1787737731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PDAKpq3CcCOlxu5k9j1hSRxD72WCqmgxRmVTcYDN4=;
        b=UEkBdUXVjgwC+N/UtsyREJ02VDbXAYxsxZb8CzdS0YjF59UhCvj+bEU2Xr9AiaZqY8
         Jf1CJmtCeIiUMS3VB2MRX7UULNgs1mSn2LxM7PcIyQNZBgUl25c/plWS3zbSABnTwioL
         bs3/bkqk31pV3c+D9KgGl9g+ukanxZAWTsAD8tBnUhJWSpALnHQkGj+B01ucRxjO36eo
         0nvij+FZEbag0Oe745hGQSe4szjrcSnAdw9p/GsF4PJblyqXiioJ6DCDhjSnQFjybGvt
         Yixp3kKHIyuJXyCMvs+t7ePQMRbzu0Bl1S9M6IVdj5nh7VMBcJnAZFhOS0Gb6iLKvvI2
         tGlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFhCPkKlNAuo56Jc1z4/jKuPx/R7LL4nottEQJEB3PgXg7whUaJ2yGqzhCNP+FMM5DsQg=@lists.linux.dev
X-Gm-Message-State: AFuF++mFQbhIMG/vLpsHhfaGUcOTPcWZ6X4i/EptYuyYw7xWENwP4iC9
	MFtyVbC86KlPNAXoQKjZZTIuqoBdsKyUEF4M75/3rPdxT4V/Dm0UX7ELGgonRGbzIwYMlorVatu
	vk58JvPncNO8sYREcialCcFWISYYrxvSLsqxF502yUWvlMx5oA6tD6Q4=
X-Gm-Gg: AR+sD10DTBPED7t7tN/NyJXvm4h6hPwkmamWPaw3MZRCPelYs6gi8AgETjDQGWepxd4
	3CyItYWeNOK25nCJmDZr1QhIOFwgzFzy0yd5c2Swge2FYD6XxHsRQgc3FkRwlOq+EQlUsXdetTP
	xp5cznMvlI8VKJtEmh3+dXjNmEUQK4ouADyxt/xzCoJwijCks91+mli2RAF8GnHdBLLhn3dIeMA
	n1N4z70f8r/qIiKvV9ZmLOd47/WvgGFBP5QqSYRjAu/kBj1AA6IwBx0pT91xr0hm+QepU5PHV0F
	qNdXzRrWGMdaA/bHIFOMMLha0k6TKh5On5b6jZw/XrRAaoRgdpnb8/9VD6QYN6tyuc/Mb2+LltB
	LUt0PQ7cm0B5P9pmdVyMJ7UJ5DCnhDA==
X-Received: by 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr6886839a91.14.1787132931102;
        Wed, 19 Aug 2026 02:48:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr6886753a91.14.1787132930634;
        Wed, 19 Aug 2026 02:48:50 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957faf6849sm2001049a91.10.2026.08.19.02.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:48:50 -0700 (PDT)
Message-ID: <4a81f4ce-7b74-45b9-b3bf-942bbe625e4c@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:18:46 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-3-50efc7360b7f@oss.qualcomm.com>
 <aoQc2aVZ5MR5OKje@monoceros>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <aoQc2aVZ5MR5OKje@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a857c04 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=66wo3ehNeEoRUVuG-WUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: SRrBERAeRQhLxDwKIWAE8mQbn3rPs4YZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfX6jZJJmazYtn/
 QqayUFoncWW4MYKN8K7JPvqo/sL1xgPakm7YGPTA33z9kL10ifeKHDNrXF3OFW6xEcrU9AJ1EjL
 2AikWmk5CDb7ijKijNDZpI0A2BkB0Wo=
X-Proofpoint-GUID: SRrBERAeRQhLxDwKIWAE8mQbn3rPs4YZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfXzXhtn2kbxkCb
 vZtDFFeqY0BUNbCFDf+ZINSwkPbewDPP9vqYVh9kT6S9OWApS+3+tLOdUaLJEdFaGHYvXOnz7uw
 q4mR41CXG+5VQxryrUM91ywC9axzmUH+KOWerW5Yhdy27jLsR4ceAskaO6Mmg3WbECmN8PKhC06
 PMMtky3s7a49FkvQPMmnLKrZAAJcVO8i6d4m5/jtJWjFR3QQ5/nfbKtCfR5Qqwmm0vJnVE73OxZ
 d6G3m/6b/tmfh5UjeqX/2zLrj5rqv1Xop/M0VlGxTFiPBRapgPkypWj27KkE2iOJKpB0gnh10Qd
 CvLmDKLnBH5sjW/neOB84MizNBcG//moHZVz0V9t8nv9bJFY1UvQiiEiLHtu/HFcyR6MD26vvmR
 W9lvbO92r7HUz3Cihdybp258BCH1/mjBZ/fup1uQv0vlc7nQ5ZBss08xWbXwKuOfOwUImrL9m7Z
 w1Zen3a4Tgh6Ed1iULQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190074



On 8/18/2026 2:23 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Mon, Aug 17, 2026 at 03:44:36PM +0530, Sumit Kumar wrote:
>> diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..18a92d6a40e0f7de277d155cdb5495d14a60c19d
>> --- /dev/null
>> +++ b/drivers/bus/mhi/ep/clients/loopback.c
>> @@ -0,0 +1,130 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/mhi_ep.h>
>> +#include <linux/mod_devicetable.h>
> Similar as with my feedback for patch #1, please don't use
> <linux/mod_devicetable.h>. Either rely on <linux/mhi_ep.h> ->
> <linux/mhi.h> -> <linux/device-id/mhi.h>, or explicitly include one of
> the these headers but not <linux/mod_devicetable.h>.
Will fix it after rebase in v6.
>
>> +#include <linux/module.h>
>> +#include <linux/string.h>
>> +
>> [...]
>> +static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
>> +	{ .chan = "LOOPBACK"},
>> +	{}
> Again, please add spaces before the closing }.
sure.
>
>> +};
>> +MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
> Best regards
> Uwe

