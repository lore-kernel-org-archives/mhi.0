Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA19253F27
	for <mhi@lists.linux.dev>; Tue, 20 May 2025 04:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713968; cv=none; b=n3bkxcHYYiKhI0d/kPVjjQewQWuo3jle021874aPxQbOI4wZYnxQzU3MIGSL3rqAKXz6LJ5NujarbVEF9WjLknpXxcwhcoAKC2YFWdZIqdX/Sxso9gth88tC+26Ckhrs2lBXU0c1FpCF3L8UccYelgiMVbY+73Z6se61II7qnUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713968; c=relaxed/simple;
	bh=OjHg+Vyus8o0ZLxaz0u47ocwameFVHjmY7vBPG4yAT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zx59l5NLQuU7vOzaTd3wFYAzSmAd/nwgi0pUY3goeobnKmOq/f1rm9JYDNYhTMmhcaOKfI9cHoUFYa1Q3Iz0lydBkLJqzTEICIx50vwHU02u15SDM3dEpRhqe+qI+o1TbvTdhFgLd/H8/1aKhEsS2DWE0aTiIhqp718rxA0REqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ok2dYX/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ok2dYX/2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JG91M1023178
	for <mhi@lists.linux.dev>; Tue, 20 May 2025 04:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRkL6ZD37aILbTjnj5L1nOvB0DmK7nmgx/7Bty5lsHA=; b=ok2dYX/2JfvIPoT5
	1EdJ6q1GigS8gpD+pcbPatWPkZVETqe0DYpUc8C50rI0AHNF6NWQuYu6OrO9zTF5
	sc7MlmfF9JG7cGOGVvPfyNhs07LnS3ykzrWV1YpJcyUdrpvOHdcEpWGkJQZYp8no
	5wFcgJJhoKju92/h2mCRC7a0zwME8nqH46J4mKl7Wha4CRpscBqrZNgGm+Z7vuwp
	6dDmpSaDx8aHL7ypmvUw1jY6rWMGHa6a6EqVy4bnYffiExWD3RWgVa0x0zqFYB+C
	WLUIPi54xiZlGU29YULaKW10p095pn4FoqRQpTL1otMeVPAECP3Iwls+a8MlwSQP
	5rlSmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041u1et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 20 May 2025 04:06:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d4e36288so35741065ad.2
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 21:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713965; x=1748318765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRkL6ZD37aILbTjnj5L1nOvB0DmK7nmgx/7Bty5lsHA=;
        b=pNu//T0uYZPz88B76LWQyQK3Sc59VfEigRe2DK1RRHV2aIJfXojfk08OIHPyKVbELL
         Ij0F8JKtfJGYXpKWhpvyoEJM9Xw13cDO3NvIirSHLIbhcWJxa6IF6U2wP0h7wQ9+YKRj
         qFO3jDp/+932BNOGoLQjjw32XUb8Qs9TsmS84VBv53llqS+Iq1D/jHEPcQoq5q8Waife
         K4Q+4jiO4f72QnfTuNvazVb+dJUq852BxeQmSxMfdzaW9ycVH8bX9guCGCP06gaqmcaQ
         66cx9bsx2LsynvO095bctAPX7E7AWkZ1cfSLzIL3rLiyuzLivfhhp2lFRTD/lGyM+QzC
         i+vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbfajc58sxFUj/l91w6GUqKnU++Ea9l4zXwiA8h2kbBTcMNCU1oj3uEkpMNRgj6IBECBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YywyFUSHCvhVgaE6mKUzt11i8C4tWkXu1NJ+dkoFrvCoWZWeloA
	0TNGJ/iFEV3xQaQISJI+z6WSeTl17tXqE90bBozYNbTFFuZtsUy9U3fWDCyZk0u2zCPXiXW8qYM
	Ws84AHm6oFey9shPp9PQ866pjUHJixZbkpHFnj0SeFWqRYmKuFN0C2i0=
X-Gm-Gg: ASbGnctsyCY5k1OCIgbIMhU3v6OjSfOwIPaoLOzvF2kx6hcA3ux42cWl2cfHZO+D9cF
	QK3PjbVFfY26oszjjloZiiuA9/0KCdUpVnoc/t6OvY2ysAsTXrpvQQIJEuzzWgRj7Q1lG9+AHUv
	gq3cvlYic16uIGrpGu86h5RX+KzqkdnXcqChbtDm01K+sTZCN6pKb2hAZV5X4AB2j87x9eygaIa
	sfaDtNHZ18T2xX+tc8wCMJXgNsXXkhInGQI6PPRkC3hvdMdYziwYtYunQqKpKHkIHiZQd5wD/5Q
	wPL6cnFOFF0PPPxxAQ8wzaqoVkZnuxWK/8gD+Pea8g==
X-Received: by 2002:a17:903:1987:b0:223:5e76:637a with SMTP id d9443c01a7336-231d451906dmr235890365ad.23.1747713965019;
        Mon, 19 May 2025 21:06:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCF1HMD5IOIAcLUdbyDa32PLQI1LeHPs7Pwruc6NNnS2Fm+f5VrtQdL4uL+gDaDwT1GlS9+w==
X-Received: by 2002:a17:903:1987:b0:223:5e76:637a with SMTP id d9443c01a7336-231d451906dmr235890025ad.23.1747713964612;
        Mon, 19 May 2025 21:06:04 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e98009sm67639245ad.152.2025.05.19.21.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:06:04 -0700 (PDT)
Message-ID: <25723231-c396-2d20-aea1-5e506b44a778@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:35:58 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
 <20250519-mhi_bw_up-v3-1-3acd4a17bbb5@oss.qualcomm.com>
 <10de35f5-bec6-5df3-768d-04f88c4e3d77@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <10de35f5-bec6-5df3-768d-04f88c4e3d77@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMSBTYWx0ZWRfX/vkZwnALvAAV
 WydBDcRWa3Uoez05vBCtKArsaNqqvm9XQZoL4s4rbpy1zloe9Vbd6o0X15hsgiDdcz2AGDiuFFH
 q9GM2w+P7HwoxSqHJZGKSZK3+fjhZOD3HKs0qs83suN5wBNT7D8b2l4B1xnSh08ea/ar+9LuF41
 9jYFEh0lNcMGQ3L6P3sTtrKFrK+Lw8VpAvjOsovmO+DthXtKaVfgT0bEvk7Jsr7yvJbNTjrfjni
 HcIknpzgt6IKlVLTUnYVL8uyvupmMhCgSxDmTQ0FhEivtUuKeui56y5scQgJ2Nm4hLmuFzYG9RF
 lvjRmJWCPy0OS5xcGAB16pfK2PgnOqGCQGnnU6bM9HB3UQChJNZvF0wn5Wzni4x70pQrRxKP+j9
 6lTRZGKIzHEvl3H2zmWiQqx8SmIXY6I9WQcT6a4ahDKlaErLly3vf+jP3VTBa+XAkYNkFS9+
X-Proofpoint-ORIG-GUID: 69Ug1LTtCkWFOR5CuIGmSJj40dmDgEzE
X-Proofpoint-GUID: 69Ug1LTtCkWFOR5CuIGmSJj40dmDgEzE
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682bffad cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tf4daXCc1kDTc5M98m0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200031



On 5/19/2025 6:39 PM, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:
> 
>> If the link is not up till the pwrctl drivers enable power to endpoints
>> then cur_bus_speed will not be updated with correct speed.
>>
>> As part of rescan, pci_pwrctrl_notify() will be called when new devices
>> are added and as part of it update the link bus speed.
>>
>> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pwrctrl/core.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
>> index 9cc7e2b7f2b5608ee67c838b6500b2ae4a07ad52..034f0a5d7868fe956e3fc6a9b7ed485bb69caa04 100644
>> --- a/drivers/pci/pwrctrl/core.c
>> +++ b/drivers/pci/pwrctrl/core.c
>> @@ -10,16 +10,21 @@
>>   #include <linux/pci-pwrctrl.h>
>>   #include <linux/property.h>
>>   #include <linux/slab.h>
>> +#include "../pci.h"
>>   
>>   static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
>>   			      void *data)
>>   {
>>   	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
>>   	struct device *dev = data;
>> +	struct pci_bus *bus = to_pci_dev(dev)->bus;
>>   
>>   	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
>>   		return NOTIFY_DONE;
>>   
>> +	if (bus->self)
>> +		pcie_update_link_speed((struct pci_bus *)bus);
> 
> Why are you casting here?? (Perhaps it's a leftover).
> 
yeah it is a leftover I will remove it in next patch.

- Krishna Chaitanya.
>> +
>>   	switch (action) {
>>   	case BUS_NOTIFY_ADD_DEVICE:
>>   		/*
>>
>>
> 
