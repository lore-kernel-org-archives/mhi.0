Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C02D8766
	for <mhi@lists.linux.dev>; Tue, 22 Jul 2025 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182242; cv=none; b=nbn3eEo/hM6PjKYaOAWcLdzHPkwq/X+RXY+XwaVKTWoNDpZBg+eL2KWTjZJ4/IHiaEKISvZ1AV8svfo9vtIgC/EBo6IQKxEGtb60dCRtjfOFOYznSDw3G5nSxIz5+JciXJSTrCXJ1ZwVlEuPEa6Va7kLTw5lXlw528nn7GQLnb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182242; c=relaxed/simple;
	bh=kWCUG31bkJ6dZkQu4ecUTQJmDb9akcJNyNVIFUvX4So=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CwSeSp/syAxabQb4fMUj2fXXaVWaft/ZEd9UQKJ6x1wXp1nWaIAchdTveoED7a2U0HPpK+8pNSvGaOlSKsXNRugXGhuaCeVVsPwtYkMyvdjUcNp013Ynw4s28s1AVn4or0cnvVJBYQPzHmq20ltblqraugzKXqWp9+TUA3ith98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTRM5A+Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTRM5A+Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M95VqQ012558
	for <mhi@lists.linux.dev>; Tue, 22 Jul 2025 11:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCcIy69ciDOUcVdtD2bZCMzRk/SyBUFRLG70HN1E2+Q=; b=gTRM5A+ZXBV1LYZH
	oVBmEosxHP33U+7/2sCjFSscWe4nGK/f+gXjn5xNeKKUV1yqF6yNb7EFMn0i8LRR
	16mhIwk9iplEJHanlgtA783cn44423NPSDypNTK0L/GbZUsgmTL96QEYBUm2ko7+
	CCrwFohoQJjQPt91kyCR0aCn/iyGBgFhB9XNH2kIRlEqGPsCnkJC7LxqSY4jPrOK
	iKo5zANUOwW6Vw3jcKypisxjmS7VHgiZciDZS5sxKjBkPOG7Frg4d/zFg28Spfp2
	khieEqYk/0ri3+2XImGWUKMe1zVosO5/wq3L5wzBpx7TPhMmX8RXHM7QrMGYc6kr
	cbL36g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6kf99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 22 Jul 2025 11:03:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-75494e5417bso5051855b3a.0
        for <mhi@lists.linux.dev>; Tue, 22 Jul 2025 04:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753182238; x=1753787038;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCcIy69ciDOUcVdtD2bZCMzRk/SyBUFRLG70HN1E2+Q=;
        b=U9Vqyy0vLEWZrN+wq36STc17IMaZB+HLgnFA2CmJqw+iy/YBUMqM3Q0wXKk/Z/iWa3
         dbTelTdaHrIvMIsSjrrhfyk/+QjJiu1iR0Ma4Z6riGpwWZ0Yypp4cC5Rouh/Yf3Y32QY
         MiE7Ane6XWl2XNqBPScJperBrIMjA+y3Q4AVAztYT3bkfLecYFOvFPD7bO8hl5Jzl1pG
         eggya32I4h0RyEP67q7Io+TWKxJOnDtZc8EWXCf7st4BiFVe5mU/0Ua2KleEphRU5j18
         5tGV7c0HImPbtYaqJUTTp493H9BzGldrbD9z4YmgwpOGanODjhzJA1EEbN7qGpQb+/tf
         MSmw==
X-Forwarded-Encrypted: i=1; AJvYcCUQONvCLNDZ+KDuwOzqLZfaoszoyZuzyOyRL4G4dDlZWQZYfv4Ir6Iu2hYlS7odoehlsLI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8ofrlA5jH92IwCVhDE5aQmE/SpATLAYe6yyIHUBhGVkAfkyMe
	7GA0LjQ2t85FB1sO7gTEt9B9juxh2GoQPO5JRa+LhtqbMCP8h2esNZUMrvmgRR39GfMBGkeZCF1
	35OgHIJOwvvSOWPEhEn5ety3PqaILVGaqCCgmJbq05hCoH2fueqBVg10=
X-Gm-Gg: ASbGncsmMnQzcIuPPGMr2enRBdFX28x1QBuFpKifQ8MEGyQ8aAJ9cqVvNMYwx5FVddp
	LieCRrXFGYYxBI8YV7uNJDFlHzF+tRYgsSn3WxThPTu7q3pP/lY/P+O4Ez5onEbSQAFWP1xxG5v
	fQW9GMmbxg9G6yEJ988D5aabODp2r5HqNHbrfXwyT5PP4h+c2dtdEFdOIZ+r/8/pZHge9bMuUHk
	8HRVc+QDEvUz7TSOeHeQovZW59/L15KjmXMEEZH9VMHxWL1wwBI2Fu7Y54AUMKKF9qKsss06xd4
	o8rOH32tXpjkgX59Mj1zKV9biwhB0oZmBoiuf/iWmefh5LoA5lrF+QGox5NP0I/70rQOa4iVrg=
	=
X-Received: by 2002:a05:6a00:1817:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-75ed156d03bmr3761912b3a.6.1753182238343;
        Tue, 22 Jul 2025 04:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgZIDkCUV2AXz/9PK4/a4NCij1DJxFB71Da611o7fAf8jI0CKXgwVrcrLnlMSH3ym9h+L+Lw==
X-Received: by 2002:a05:6a00:1817:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-75ed156d03bmr3761869b3a.6.1753182237848;
        Tue, 22 Jul 2025 04:03:57 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd67ed2sm7293938b3a.135.2025.07.22.04.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 04:03:57 -0700 (PDT)
Message-ID: <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:33:50 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711213602.GA2307197@bhelgaas>
 <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f701f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=UU_a8xXafIRJjp1WqNEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 3NG7grcTBQDP_YzxUyaOFVWQPD9YphrY
X-Proofpoint-GUID: 3NG7grcTBQDP_YzxUyaOFVWQPD9YphrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MCBTYWx0ZWRfX7+TNlr5QVhFI
 NoLqHIY22xJjeh671O38P06HZTGgxWzAhNBZjd3W1OgXVD1c8/aCHdQp7OK2zjIoFNsPHc3onTR
 /9foJC4+3dDVmVf/FBedgrwXG+/SQ6Qv8AOjZ6ZcEnSJEDiMeXrwJk56Kt3+i/E6HgxRHdjKJMg
 DKN+nFs8eDdl+qGi+0da5yN05RMj+Hng8cxfnyLB3MF84JGHx7GnJEsHVx4XkzN48BkK/lJ0W7A
 bgtc3qFF3nt1pleUWLM5hvjzOx3X7wFlf5kTHEkIZjseASbdh8IwtxcqMgzmsEs7XuaiUYaIkY1
 5cDyXfylzN18eECHpfCW0YI7yM8frfAb164avYydVcTRWjM11v71Au2onIJCWL08gG9/0i78LrC
 vD68V+ttPY+mGeBWguZYMiMsyyOIrgzTCSaS5yTBtpDA15tlcwQCLK82UYZLmvachaCS3+me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220090



On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru 
>> wrote:
>>> If the driver wants to move to higher data rate/speed than the 
>>> current data
>>> rate then the controller driver may need to change certain votes so that
>>> link may come up at requested data rate/speed like QCOM PCIe controllers
>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>> link retraining is done controller drivers needs to adjust their votes
>>> based on the final data rate.
>>>
>>> Some controllers also may need to update their bandwidth voting like
>>> ICC BW votings etc.
>>>
>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>> before & after the link re-train. There is no explicit locking 
>>> mechanisms
>>> as these are called by a single client Endpoint driver.
>>>
>>> In case of PCIe switch, if there is a request to change target speed 
>>> for a
>>> downstream port then no need to call these function ops as these are
>>> outside the scope of the controller drivers.
>>
>>> +++ b/include/linux/pci.h
>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>       void (*release_fn)(struct pci_host_bridge *);
>>>       int (*enable_device)(struct pci_host_bridge *bridge, struct 
>>> pci_dev *dev);
>>>       void (*disable_device)(struct pci_host_bridge *bridge, struct 
>>> pci_dev *dev);
>>> +    /*
>>> +     * Callback to the host bridge drivers to update ICC BW votes, 
>>> clock
>>> +     * frequencies etc.. for the link re-train to come up in 
>>> targeted speed.
>>> +     * These are intended to be called by devices directly attached 
>>> to the
>>> +     * Root Port. These are called by a single client Endpoint 
>>> driver, so
>>> +     * there is no need for explicit locking mechanisms.
>>> +     */
>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>> +                     struct pci_dev *dev, int speed);
>>> +    /*
>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, 
>>> clock
>>> +     * frequencies etc.. to the updated speed after link re-train. 
>>> These
>>> +     * are intended to be called by devices directly attached to the
>>> +     * Root Port. These are called by a single client Endpoint driver,
>>> +     * so there is no need for explicit locking mechanisms.
>>
>> No need to repeat the entire comment.  s/.././
>>
>> These pointers feel awfully specific for being in struct
>> pci_host_bridge, since we only need them for a questionable QCOM
>> controller.  I think this needs to be pushed down into qcom somehow as
>> some kind of quirk.
>>
> Currently these are needed by QCOM controllers, but it may also needed
> by other controllers may also need these for updating ICC votes, any
> system level votes, clock frequencies etc.
> QCOM controllers is also doing one extra step in these functions to
> disable and enable ASPM only as it cannot link speed change support
> with ASPM enabled.
> 
Bjorn, can you check this.

For QCOM devices we need to update the RPMh vote i.e a power source
votes for the link to come up in required speed. and also we need
to update interconnect votes also. This will be applicable for
other vendors also.

If this is not correct place I can add them in the pci_ops.
- Krishna Chaitanya.
> - Krishna Chaitanya.
>>> +     */
>>> +    void (*post_link_speed_change)(struct pci_host_bridge *bridge,
>>> +                       struct pci_dev *dev, int speed);
