Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF5567F
	for <mhi@lists.linux.dev>; Wed, 17 Apr 2024 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713321061; cv=none; b=Pd+/VhAd4vllJWg8cKMwQqMjA/PwPaJVRJZxH7KuRflCd18SDPnc/ownBSFlrx+cwbvx0ci3429KToBl3Eau3Gzho9rIMNOKuGNH6u/F1U8Sb7oUDtnkgRxMTpYIFW3mEEqnuOQD8e7mJ1UIjGVgdfoWWR/2VZfDBB/uCxarzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713321061; c=relaxed/simple;
	bh=Zqk3p+Z4/5kFveqLETfm9ORTcXOdAfXZSoQ8A/8GMN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ci5aDHJ/aEpA323NPWDc/JDlnlA6/KbyERNrPnwjfIk3hvZkvMAegP54X1s0i+lFRhRTwvDC98pNqsqrCBDhkoKcDLXthDHT8eDESCRtqtSnPGjGCH03t4Ix94uwoyLBY+NcUkjLfsmVdKcxLFS5+2BbiWChcYNCpP0FG2Z4td0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AXJMk/x8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AXJMk/x8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GNdJmv022212;
	Wed, 17 Apr 2024 02:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vDsc4zbqpavgzTk3e1eKzT7fUgVEqUoXD+/D5/Er2pE=; b=AX
	JMk/x8eUduODaloyEhOMvovQuGaaewjfKjhoRf3FaU8hJ6Dv3IoPXVlmfc0YI5KS
	yCOG2lLABMSkbMpXqF4IQIHA9f3JcTh5Rrv8bUEp+iUgWZKOx2qMbTHAySmI3HHh
	/eV2ATtd1+gySR4i5WDMZgGdnLnowdkYPBROrbV8mpQ35/79cyO7VYGPHjGsp4lw
	qyCNB/7R4XHXkOwNiJ8zBUTHPDOxaYGHHH+DcnfM56U9FczCKI3rMFHHV/HwBL3Y
	rJ5g3L8XeskuDgBG9V4LELVAsQ/RDl0xjOwGnNYdCJbjUp1ElNL1pZn/N4gxeK75
	FmbP3yOnPJ3RDPqlLc+A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xj2sxrb0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 02:30:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43H2Umos026098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 02:30:48 GMT
Received: from [10.239.29.179] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Apr
 2024 19:30:47 -0700
Message-ID: <820cb397-be47-49dc-9ba7-94679ebb9b19@quicinc.com>
Date: Wed, 17 Apr 2024 10:30:44 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: failed to power up MHI controller issue
To: Slark Xiao <slark_xiao@163.com>, Manivannan Sadhasivam <mani@kernel.org>
CC: <mhi@lists.linux.dev>
References: <38c7997c.10212.18e84f08a4f.Coremail.slark_xiao@163.com>
 <20240402045647.GG2933@thinkpad>
 <4d76dd24.edcc.18ebd2606cc.Coremail.slark_xiao@163.com>
 <5b6ca95c-92a0-4f47-9a92-ed8ba3c29fa1@quicinc.com>
 <40210cbb.3949.18ed6b904d6.Coremail.slark_xiao@163.com>
 <ca6b8dfb-7544-40c9-a6f2-e8c25a1b7c2c@quicinc.com>
 <20240415103316.GE7537@thinkpad>
 <61e13e10.612a.18ee50c7dca.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <61e13e10.612a.18ee50c7dca.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ekPOW0sGCLpO11OXy-BYVy7OCWRnE9-r
X-Proofpoint-ORIG-GUID: ekPOW0sGCLpO11OXy-BYVy7OCWRnE9-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_01,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404170016


On 4/16/2024 11:56 AM, Slark Xiao wrote:
> Hi Mani, QiangYu,
> Just confirmed it with attached modification, and issue was gone.
> So you can help update it into kernel side. And I will follow this
> reference debug experience for other potential platform.
> Thank you guys a lot!
Thank you Mani for detailed analysis and Slark for confirm. I never would
have thought about that on host side. Look like we need to treat PERST#
carefully on host side. It's a good debug for me on qcom based modem with
non-x86 platform.

Thanks
Qiang
>
> At 2024-04-15 18:33:16, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
>> On Mon, Apr 15, 2024 at 02:09:35PM +0800, Qiang Yu wrote:
>>> On 4/13/2024 5:10 PM, Slark Xiao wrote:
>>>> Hi QiangYu, Mani,
>>>> My case has a bit difference with yours.
>>>> In my local case, device can't be recovered except a reboot(mainly a cold
>>>> reboot). Workaround remove and rescan can't solve it.
>>>> Also, this issue could be occured in some platform in the first bootup.
>>>> May I know if this issue related with the power sequence of host or
>>>> pin settings of the connector?
>>> Hi Slark
>>>
>>> I don't think it's a mhi host driver issue. From the log you shared, there
>>> is a
>>> PERST deassertion followed by a PERST assertion closely, leading to device
>>> run
>>> out of order.
>>>
>>> // Here, suppose reboot is triggered on host, so mhi_pci_shutdown is invoked
>>> 91.474100278 [0x0 mhi_sm_pcie_event_manager] Handling
>>> EP_PCIE_PM_D3_HOT_EVENT
>>> event, current states: READY and D0_STATE
>>>
>>> 91.747734185 ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST assertion
>>> 91.747784342 [0x0 mhi_dev_sm_pcie_handler] received:
>>> EP_PCIE_PM_D3_COLD_EVENT
>>> 91.748044394 [0x0 mhi_sm_pcie_event_manager] Handling
>>> EP_PCIE_PM_D3_COLD_EVENT
>>> event, current states: READY and D3_HOT_STATE
>>>
>>> //Host should power up, so it deassert perst prepare to do link train.
>>> 92.475207677 ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST
>>> deassertion
>>> 92.475269968 ep_pcie_notify_event: PCIe V1711211: Callback client for event
>>> 8
>>> 92.475317729 ep_pcie_core_enable_endpoint: PCIe V1711211: options input are
>>> 0x2
>>> 92.475321427 ep_pcie_vreg_init: PCIe V1711211
>>> 92.475323823 ep_pcie_vreg_init: PCIe V1711211: Vreg vreg-1p8 is being
>>> enabled
>>>
>>> //Process of perst deassert has not completed, but deassert happen, which is
>>> not expected
>>> 92.475366010 ep_pcie_handle_perst_irq: PCIe V1711211: No. 2 PERST assertion
>> Ok. I think I know what is going on. It is related to how PERST# is handled in
>> the host.
>>
>> Rockpro64 SoC defines the PERST# GPIO as below in
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi:
>>
>>         ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
>>
>> Here, the PERST# GPIO is configured as ACTIVE_HIGH. So whatever the value driver
>> sets as the logical output for the GPIO, it will be reflected as it is on the
>> physical line.
>>
>> In the drivers/pci/controller/pcie-rockchip-host.c driver:
>>
>> 	gpiod_set_value_cansleep(rockchip->ep_gpio, 0); # PERST# assert
>> 	gpiod_set_value_cansleep(rockchip->ep_gpio, 1); # PERST# deassert
>>
>> So when driver asserts the PERST# GPIO, the physical line will output "low"
>> corresponding to the driver logical value "0". And vice versa for the deassert.
>>
>> When host reboot happens, the driver is not doing anything specific for PERST#.
>> So after the SoC reboot, the physical line goes to "low" state corresponding to
>> PERST# assert (default state of the GPIO) and this is reflected in the endpoint
>> log as:
>>
>> 	[    91.747734185] ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST assertion
>>
>> Then, when the host controller probes, the PERST# GPIO is requested as below:
>>
>> 	rockchip->ep_gpio = devm_gpiod_get_optional(dev, "ep",
>>                                                             GPIOD_OUT_HIGH);
>>
>> Here, the GPIO is requested with the initial state of GPIOD_OUT_HIGH. Which
>> means, the driver sets the logical value of the PERST# GPIO to "1" and the
>> physical value will be "high" and this is reflected in the endpoint log as:
>>
>> 	[    92.475207677] ep_pcie_handle_perst_irq: PCIe V1711211: No. 1 PERST deassertion	
>>
>> Then during rockchip_pcie_host_init_port() of driver probe, PERST# is asserted
>> again to perform register initialization and this is also reflected in the
>> endpoint log as:
>>
>> 	[    92.475366010] ep_pcie_handle_perst_irq: PCIe V1711211: No. 2 PERST assertion
>>
>> Once the register initilization is completed, then the PERST# is deasserted:
>>
>> 	[    92.503568354] ep_pcie_handle_perst_irq: PCIe V1711211: No. 2 PERST deassertion
>>
>> The issue here happens due to the very short time between the first PERST#
>> deassert during devm_gpiod_get_optional() and then successive PERST# assert
>> during rockchip_pcie_host_init_port() as Qiang noted.
>>
>> But the GPIO flag (GPIOD_OUT_HIGH) is what actually culprit. It is supposed to
>> be GPIOD_OUT_LOW as the driver should not deassert PERST# before configuring the
>> controller.
>>
>> @Slark: If you can modify the host platform, then try changing the flag from
>> GPIOD_OUT_HIGH to GPIOD_OUT_LOW in [1] and see if that fixes the issue during
>> reboot.
>>
>> - Mani
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/pci/controller/pcie-rockchip.c?h=v6.6.3#n123
>>
>>>> At 2024-04-09 12:35:41, "Qiang Yu" <quic_qianyu@quicinc.com> wrote:
>>>>> On 4/8/2024 5:59 PM, Slark Xiao wrote:
>>>>>> Hi Mani,
>>>>>> Please see attached log files(both kernel log and IPC log).
>>>>>>
>>>>> Hi Mani, Slark
>>>>>
>>>>> I ever met similar issue like this, where device treated D3cold,ready -> D0
>>>>> as illegal transition.
>>>>>
>>>>> "EP_PCIE_PM_D0_EVENT: illegal in current MHI state: READY and D3_COLD_STATE"
>>>>>
>>>>> In MHI spec, there is not transition path from D3cold,ready->D0, but
>>>>> in fact, we have this transition in some cases.
>>>>>
>>>>> For example, when we remove and reinstall pci generic driver. During
>>>>> remove,
>>>>> mhi will reset device and pci framework will put it into D3cold
>>>> directly >when
>>>>> rootport driver runtime suspend. When we reinstall driver, device will
>>>>> see D0
>>>>> event but its current state is D3cold,ready. The whole state transition is
>>>>> like:
>>>>> D0,M0 -> D0,reset -> D0,ready-> D3cold,ready -> D0,ready.
>>>>>
>>>>> During reboot, if device doesn't reboot with host, look like we will
>>>>> also meet
>>>>> similar transition.
>>>>>
>>>>> This illegal state error log may not root cause to this issue. Even
>>>>> process it
>>>>> as syserr, we can still recovery and go back to M0.
>>>>>> At 2024-04-02 12:56:47, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
>>>>>>> + MHI list
>>>>>>>
>>>>>>> On Thu, Mar 28, 2024 at 08:02:20PM +0800, Slark Xiao wrote:
>>>>>>>> Hi Mani,
>>>>>>>>   Hope you are doing well! I got a problem with our sdx65 device in some
>>>>>>>>>>>> specific platform. MHI driver would report "failed to power
>>>> up MHI controller"
>>>>>>>> when device bootup. Actually, I can reproduce this error when host doing a
>>>>>>>> reboot. It's Rockpro64 with SDX65, and kernel 6.6.3 or 6.7.10.
>>>>>>>>>>>> So I add some logs and change dbg level log to info for more
>>>> print. You can
>>>>>>>> see my attachments for reference.
>>>>>>>> It seems the host didn't receive the event of "MISSION MODE" and then
>>>>>>>> power down the device.
>>>>>>>> BTW, there are some extra log prints were added in function
>>>>>>>> mhi_sync_power_up(). You can find it with mask "##shawn##".
>>>>>>>> Do you have any idea to debug it?
>>>>>>> Looks like something gone wrong with the device firmware. Is it possible to get
>>>>>>> the logs from the device?
>>>>>>>
>>>>>>> This could be due to the way the PCIe controller driver on the host handling
>>>>>>> reboot.
>>>>>>>
>>>>>>> But let's get the device logs first to debug further.
>>>>>>>
>>>>>>> - Mani
>>>>>>>
>>>>>>> -- >> >மணிவண்ணன் சதாசிவம்
>> -- 
>> மணிவண்ணன் சதாசிவம்
