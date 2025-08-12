Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D8169AE6
	for <mhi@lists.linux.dev>; Tue, 12 Aug 2025 04:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754971561; cv=none; b=aGwKgnRI08rSSJhpRQGDob0CIQuowsMXzLhXtIffcZhwoL7aX2CdlcmgRJZuSOasAxbixtdNNP40q7e92pUCvOnijkIlKPLnolJFUIMAdpEpzr/LG8VPzIpvxr8ZC/06Ao01w6MdbSQo5LAHI8kfcjtGFs4EcwLpPo5rFAaZ7iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754971561; c=relaxed/simple;
	bh=WC3xKRFbFoIyAD+juOEawzsXMLiazvMDa0Q3SLNHV/E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k4f54+JkDX9mrjogOfKjdEG+JAg394HQQrgegPl5NI/hGPX9qQgwAOGpEco1wDI2OSLnrM5c6q0opODfifZBBKfwv2FoSfAK8JLufrD+0mKOoNsMv1Vxnnuysi8SJ/SiVf9ZaAurzV5dEFBtpNYO9BXpT1PZ+pK55wqi7Sn8X5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCQyUwCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCQyUwCo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BG5REu019068
	for <mhi@lists.linux.dev>; Tue, 12 Aug 2025 04:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVdaV7O5QbbmRET9jFm6kPgE4pGSGAvlJcTe/DiS6tc=; b=YCQyUwCo8ud3Hlpb
	Z+pLydzPldhjjQuanYvej4qNij+OKrtrtcINy6rdFrCDiN1i4Fn/QYRB1X2Odbww
	CbtafMcIIQaP8KN/nogqHFaKbqiyhnv2sAc0p2iwRakDEtt7pqO1yZAHGoIM41Mv
	RfRj4MToOyady+6MqfAxuf+Xu6UIvP57D9MV4t0cu5QWrWXPZguHZj2RYuEbSUDf
	6rbFHera3SLa1IKluTBqmiFa/5NvyzqNrsu1RcF8UMpyG6IPsbaBJWXhelvooHt6
	TR+l5nn+1zjJFqLw61eTxoucAUpi9Nh3DJ7Digt8dIHh2UU24ekPxAzCmiUyLC9d
	6u1AVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduxppa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 12 Aug 2025 04:05:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2425e41424cso59375495ad.1
        for <mhi@lists.linux.dev>; Mon, 11 Aug 2025 21:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754971557; x=1755576357;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVdaV7O5QbbmRET9jFm6kPgE4pGSGAvlJcTe/DiS6tc=;
        b=T3K2AZZh7owLsC8wa9Pp3meeAvsvigoCroahXrcT9oEpVio9OhlzApxQ5BnNloaZPa
         lGUPH0T91F9hsxLjGHh9Ccy1lA3qopELh7N+dxdvlmuGd2AFpKK4V9AB0l56zkIhVbEQ
         iwb/Uc2XsfVRC5n4RwB8biJ1zCMMDLKdz3Sfjm5zBumo+i46fWk3dLIvf8imqZlZnNkR
         O4M7rzBiRqpgKqVkJWLxPcFd5BAJgMDCU2mnHwWWVWOACxOLRSJOmWz/yDp1cNwbsXGH
         f6pVJlUVyAHIGeUKeVFMuGWJCzHoFoKVRUa69OaFWEPEgzxq+FCpkYGGaa+7kOuvLFlC
         5Daw==
X-Forwarded-Encrypted: i=1; AJvYcCXdvKkBZKNR4gmfQLLj++Bes93HnR1LQndrj0Q08FqQCZ8DFm2aQVGpPZ4djoVOUryc5kc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoQUof/rTyEP4wZhPa7d3m6lAITj3+u0rOTH+oZFlpLJuy1+gT
	KmjhMlErbU0UdIze/fB5awKwXstXDUuPNlBGRKYquiYQR6s969FRGZYJfrN8AaRzowtTCRUzyJL
	9pFPLbdVWcqBejbaYdSEcTvJLMDGWfcvAuSE6vRBolZRdOW9sUinePIc=
X-Gm-Gg: ASbGncuuYCXpkX8tcGBFn47QnR2zKssMjEzoUX+OCm8Rko50ZgXVDv09/LbS9B7y5Iq
	nQkBqes1YCfvq2cO+EUXI8RcqK50Dfabk9wpuTrZ9Ba3Yy5heDF5zDsp3YNmewcnLKScIF6HIgf
	6i9h+S6itdRjwHQACr1dreV9mwOjKnEBRsQXE4s0IXozjInSjJBIywB6mI2Np3c3QUmaeL8jlNK
	vVHmUuKrurHKLh/Si5ccJd9XztAcrRAEVJX9EjzpZmCEz3bx227LABxmyAv+4t1DFcHZkQwXTGr
	qTy2H6fHbGxN7PS6bVzMMkGOzx/kVDpv1GZAUS6Sp/n5qe7Bcr3r05D1BYwafBtpbmKKV6iWmw=
	=
X-Received: by 2002:a17:903:2985:b0:240:640a:c576 with SMTP id d9443c01a7336-242fc232fa2mr27392885ad.15.1754971557494;
        Mon, 11 Aug 2025 21:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWpOgn5/oSzjBCGtryF075Bdr0I0B0VxEDiPRvky8kDJfG/nc/HyC5WphsedOMXvkIvnZC7g==
X-Received: by 2002:a17:903:2985:b0:240:640a:c576 with SMTP id d9443c01a7336-242fc232fa2mr27392415ad.15.1754971557017;
        Mon, 11 Aug 2025 21:05:57 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef67aesm288305795ad.6.2025.08.11.21.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 21:05:56 -0700 (PDT)
Message-ID: <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 09:35:46 +0530
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
 <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689abda6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uIe58MKiAmNDZ2YlfJsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YCAkxEFoWoZZhV0ry-riApr8ctNvP4Qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX7X7zLB2mBHZC
 Ree3mDMZoT9UdiqGXhyE3+fuyyfgHa0ETnHvz/G8sVF1zS846BnaRNa4gCXMo1zWr3yHf9K3sFs
 nwxQkNqXONiMGWzyg2oOBEA6Sy2ABhU+FkKWzdBAXVl7gdw4srTdH1+qGPDM6LtJrYEe8DUOvmC
 K6pS0WDSMEXJ6Am3JLo0f7DuHG5CYeN30TcHsGDVjsG9dBe9fPZtn0l6v2rbH6jUuM6pVk9C+mG
 5QzcPino+2DKE45INe1tXywpdWcDllf21p2P2euJITWN+KGmj2KoYjhZQJCGtjMYC0MKqbN8/In
 d4XAl5xas0PTddU37t3+uD0cMHgAXCQszbLnyzlqXeZiOVkEUndPM+lRVO0s8T6RlFLAfUnKCXi
 SBhewBNP
X-Proofpoint-GUID: YCAkxEFoWoZZhV0ry-riApr8ctNvP4Qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru 
>>> wrote:
>>>> If the driver wants to move to higher data rate/speed than the 
>>>> current data
>>>> rate then the controller driver may need to change certain votes so 
>>>> that
>>>> link may come up at requested data rate/speed like QCOM PCIe 
>>>> controllers
>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>> link retraining is done controller drivers needs to adjust their votes
>>>> based on the final data rate.
>>>>
>>>> Some controllers also may need to update their bandwidth voting like
>>>> ICC BW votings etc.
>>>>
>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>> before & after the link re-train. There is no explicit locking 
>>>> mechanisms
>>>> as these are called by a single client Endpoint driver.
>>>>
>>>> In case of PCIe switch, if there is a request to change target speed 
>>>> for a
>>>> downstream port then no need to call these function ops as these are
>>>> outside the scope of the controller drivers.
>>>
>>>> +++ b/include/linux/pci.h
>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>       void (*release_fn)(struct pci_host_bridge *);
>>>>       int (*enable_device)(struct pci_host_bridge *bridge, struct 
>>>> pci_dev *dev);
>>>>       void (*disable_device)(struct pci_host_bridge *bridge, struct 
>>>> pci_dev *dev);
>>>> +    /*
>>>> +     * Callback to the host bridge drivers to update ICC BW votes, 
>>>> clock
>>>> +     * frequencies etc.. for the link re-train to come up in 
>>>> targeted speed.
>>>> +     * These are intended to be called by devices directly attached 
>>>> to the
>>>> +     * Root Port. These are called by a single client Endpoint 
>>>> driver, so
>>>> +     * there is no need for explicit locking mechanisms.
>>>> +     */
>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>> +                     struct pci_dev *dev, int speed);
>>>> +    /*
>>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, 
>>>> clock
>>>> +     * frequencies etc.. to the updated speed after link re-train. 
>>>> These
>>>> +     * are intended to be called by devices directly attached to the
>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>> +     * so there is no need for explicit locking mechanisms.
>>>
>>> No need to repeat the entire comment.  s/.././
>>>
>>> These pointers feel awfully specific for being in struct
>>> pci_host_bridge, since we only need them for a questionable QCOM
>>> controller.  I think this needs to be pushed down into qcom somehow as
>>> some kind of quirk.
>>>
>> Currently these are needed by QCOM controllers, but it may also needed
>> by other controllers may also need these for updating ICC votes, any
>> system level votes, clock frequencies etc.
>> QCOM controllers is also doing one extra step in these functions to
>> disable and enable ASPM only as it cannot link speed change support
>> with ASPM enabled.
>>
> Bjorn, can you check this.
> 
> For QCOM devices we need to update the RPMh vote i.e a power source
> votes for the link to come up in required speed. and also we need
> to update interconnect votes also. This will be applicable for
> other vendors also.
> 
> If this is not correct place I can add them in the pci_ops.
Bjorn,

Can you please comment on this.

Is this fine to move these to the pci_ops of the bridge.
Again these are not specific to QCOM, any controller driver which
needs to change their clock rates, ICC bw votes etc needs to have
these.

- Krishna Chaitanya.
> - Krishna Chaitanya.
>> - Krishna Chaitanya.
>>>> +     */
>>>> +    void (*post_link_speed_change)(struct pci_host_bridge *bridge,
>>>> +                       struct pci_dev *dev, int speed);
