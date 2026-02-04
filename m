Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081F350D78
	for <mhi@lists.linux.dev>; Wed,  4 Feb 2026 05:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770181418; cv=none; b=bdTQd2PayOwfGQqfMF0dV5PQu8NNlzx5Oys3CDDHbhxD3VaLTND8m3CHCOxDdaJIrV3xs9KjaCGfo2v67Eo5yzOpS/BPQHjEvuz8ilr8Cs8UIMclhkvuM4eSn1irPu5T0Npy18v5+RHup+rpEATl5gVx/JCDxKjLpUNhZiKVGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770181418; c=relaxed/simple;
	bh=k99C9FE5ISObnsVu+gs/HeUvfmWmzcZd++zK+3hMPGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvGDTzwqPiKZsEw6VQaPAITdfI9Esms42y4qwXPUbTzmxPYunuQIA+I5AwGn/VV0/ZgteAMVKgG8AX12yWfS+Y/QksOxsyUoaVRB9DE/KItfh7XXaxNlIzan85cmT7sQ7Y0tzjnpvZ5luQGIMEj+W245m6q4hnSnbFbyM5rAKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWoIrFX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awdx4QwY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWoIrFX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awdx4QwY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614473EX3824326
	for <mhi@lists.linux.dev>; Wed, 4 Feb 2026 05:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3S1EWXoW5T8s5YGrNj6koiV6KanW9zF/vJ6e3niouj4=; b=DWoIrFX53M9r19Gs
	Gr8F+SZhoiBBTo01DOe/aKIz8MNnRYAGeXjPO+vnKgWhVn6YhxMIbgRWb17mi/Sq
	zsRn0xX5hA2OYSfNFoK7k2EV9pkGcziHX1YUlxVr6Ip32NLQOKj63ZFAkGUNiGHX
	9eNdrA9kmV0cNlHO4SjhCcGFAxp2rs6rp2c15mbqglXbGtPgNjWCZxyJavjvZyqN
	a5/MrbYLpyPOA55A9wHr+VOmsg64ZQHnKknGNwsXdMKPQnH+0Z7PtqYsDdZRfp/l
	tsx/frnCYti12asTVxYOvT1Mg6+V6ArUXJvPTpCE9V+n2DwMndWtiBhL6k/Elvvs
	luC/Fw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33k4dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 04 Feb 2026 05:03:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82343404fa0so2931605b3a.3
        for <mhi@lists.linux.dev>; Tue, 03 Feb 2026 21:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770181416; x=1770786216; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3S1EWXoW5T8s5YGrNj6koiV6KanW9zF/vJ6e3niouj4=;
        b=awdx4QwYVywV0J2mRo9onwKzkGr/bTX198Bi7lwO1XiBWRVXM0W50XA3VkQU3wZZuy
         em21TFz/zYF5hWdj7fRbI+uHa+24FeJSSvo+NGSS9u0C3q1veImCXQWrZ4blZlTYcTk5
         XjxauoZT5sj4CiS6nP/xlXvBVbdqX8XmtaVWBoKvXxDy5rS/ZthT9yUiCun+q1+tbEKB
         ZVfPJoOPD9LYxbo2E/CuOuyrnvC1e++yr6/HDHXYYH+OoWNvot3SEnxtIdMk7rSIkVfT
         BgruSkR4y8z5ry+ma8XhyS9LRHSjkpuuqHCs/Ei5xuGtrJ2GBEW04Yl3XgYrZ1Ybola4
         1aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770181416; x=1770786216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S1EWXoW5T8s5YGrNj6koiV6KanW9zF/vJ6e3niouj4=;
        b=ehXPu+mURBYijmgjdtaIB1zNTXK1jJ4VoB7b/eJvnJsNLiKeDogNQYRyNCgiMbkmw5
         pwNxlwdAi9hJntkS2ZTO0oUfG5i6UkArKbM9tI937fxDmKl9ODVHhqYZ2pmOAICM9GIR
         oyWKL5jHlbLVlLDo+blv8bqIgrzGfX4zO4K89Y1Uox+NminLFAsQ31/DkGWF7IspR6Zu
         Soaqai2LcpFsmablMwr5M75eNoPTTQllnqzShJ41myfrdCtoO+WNZ+Guc1oK2NaGazyo
         n6PxQ5w6NtW+L5j2sa2MXTEcMVdFW3MD3f0+EG7pt7tyrJ9m1QxqbDNWgJt5r7fo+c+Q
         2ymQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT639lMvAk3D3G0B3vq0qEicBdhPhFlljKFYCpXfykw7DDckxLlq7hPJy5UZpBwHL7pwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzC4qAeMoBGwwrGvIsrf59ImqfqAgdIGIWlYRbFS716ZgeY8hqE
	OoAETR2go4u8gdp2W/QBq3VwdhaJFLZBcitS9bax1x78FrAJUlVpgUGy+PomvWXCwmDF5dobP8o
	OcvyaSy5wnXoVypbt38hYL7EJifKGSafPa9Ittp3BpsDQ5t/qtNiA3W8=
X-Gm-Gg: AZuq6aKx+oExEly3t4iahf5f0F8CNseFVZktZTfY3Md9i/kHTarwhFWHjS9ckgvF0yk
	uN4PWnMD+lcImyC02tfDZhti/20hQrig+jqjvuluQ/0uzXrsGuhRVJ5rYJq3o2zRJMVmcxBCbc2
	ENKoi1roh+QrL9UDQm8d8prDf38hvTUz2JrYQWPOEWYRHcScMMua4mz1FlhOBBUkCqup/C1HvqK
	q2GguMCCA2CZ3+cO99nMm9++LCfxq8HadWoWMRF6AM1FWxylUXL5h1jV5vwM4x/k7rid7Xw8pjH
	KcdD1DQ9dhTxyFQaRHE8iCr03pb1eRPoXkDJv5BbhhqZGv7goZmdr0jRLkHtWD+K1aHpfI3MvWJ
	jz3e7WPUFo9T4ENqq8/oia95Fj2zb5h1yeg0+VYbGQ6Fp
X-Received: by 2002:a05:6a00:39a7:b0:81e:af19:34b8 with SMTP id d2e1a72fcca58-8241c5f6184mr1753678b3a.43.1770181416021;
        Tue, 03 Feb 2026 21:03:36 -0800 (PST)
X-Received: by 2002:a05:6a00:39a7:b0:81e:af19:34b8 with SMTP id d2e1a72fcca58-8241c5f6184mr1753653b3a.43.1770181415529;
        Tue, 03 Feb 2026 21:03:35 -0800 (PST)
Received: from [10.217.219.53] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d48789dsm1008320b3a.58.2026.02.03.21.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:03:35 -0800 (PST)
Message-ID: <d9313606-6a8c-4109-ae3f-dbcb46f54019@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:33:30 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] net: mhi: Add support to enable ethernet interface
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <2sx75x2v24o23hlhvl3cfem4npzejt4k3dmwnaqgxykzrr7kyg@g7k5fp4nr4wy>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <2sx75x2v24o23hlhvl3cfem4npzejt4k3dmwnaqgxykzrr7kyg@g7k5fp4nr4wy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=6982d329 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BYBcVbb2VMsx0zYavC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ltS9RkT01g-czTrX3QvIya1b7NktOoOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNCBTYWx0ZWRfXyPtRadNTD3Px
 +/K0+HSbbH/v3H3Nmzl2RLrKQuFPZ8U+KuV5j1pfIDvDl8wDy9iA3nex6LLf17utu/BXoYyiXRI
 V3FeH7nweMFKw9EMRZThCfzsPb+f147sR+ppcWQ5Eq+3T+0dJecNTnsFwdkbQDeUj3K9joD3iIw
 GRqztTN+r+zVP6rkFlQHGOSKHF29e3z4qMm8YenEzOoC+zcXBrT3ihtKFF/EMI+4+Y2/5RvAJbm
 u30chFF/goZCuOfVsxd/+19KXkZ1xGf5xjNCAZFy2xybQfdkDuqegNwCAj3Uhljm7zv87xgbn56
 l3893j76oV+CN3aEC/PzVk0Mgi/E23biphBrBajCn/sr5EkoQ8fq94VTYFjmS6CSeGVZdolKf3w
 9BFYFqglCEZvzEJ42bLZDiRfIIULjvoToYw0DeFVchM3NxvOIkDaTChzv/9xAoGbZZ8x0VwAtFP
 4LHAdyp0WHDjTMImzEQ==
X-Proofpoint-GUID: ltS9RkT01g-czTrX3QvIya1b7NktOoOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040034



On 12/24/2025 11:33 AM, Manivannan Sadhasivam wrote:
> On Tue, Dec 09, 2025 at 04:55:37PM +0530, Vivek Pernamitta wrote:
>> Add support to configure a new client as Ethernet type over MHI by
>> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
>> interface named eth%d. This complements existing NET driver support.
>>
>> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
>> M-plane, NETCONF, and S-plane components.
>>
> 
> You did not even mention the MHI channels added in this series.
> 
>> M-plane:
>> Implement DU M-Plane software for non-real-time O-RAN management
>> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
>> models. Provide capability exchange, configuration management,
>> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
>> R004-v18.00.
>>
>> Netconf:
>> Use NETCONF protocol for configuration operations such as fetching,
>> modifying, and deleting network device configurations.
>>
>> S-plane:
>> Support frequency and time synchronization between O-DUs and O-RUs
>> using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
>> L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
>> UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
>> O-RAN.WG4.CUS.0-R003-v12.00.
>>
> 
> Sorry, this is just AI slop. Please describe how the newly created interfaces
> are supposed to be used, relevant tools etc...
> 
> - Mani
> 
M-plane:
YANG model based interface aligned with O‑RAN WG4 M‑Plane specifications
over TCP between the OAM application on the host and the DU M‑Plane
software running on the X100 platform

Netconf:
This interface is used for IETF Netconf communication, enabling a
Netconf server on the ORU to interact with a Netconf client running on
the host.

S-plane:
To support accurate phase and time synchronization between the host (L2) 
and device (L1‑High), the system must exchange PTP messages as raw 
Layer‑2 Ethernet frames, because the ITU‑T G.8275.1 profile operates 
strictly over Ethernet multicast and not over IP networks. This means 
the device’s PTP stack can only send and receive PTP Announce, Sync, 
Follow‑Up, and Delay messages in native Ethernet format, not as 
IPv4/IPv6 packets. However, the host and device communicate only through 
MHI/PCIe, which provides no native Ethernet interface. Therefore, the 
system must implement a virtual Ethernet interface over MHI on both 
sides. This virtual Layer‑2 link enables true Ethernet‑frame transport, 
ensuring the device’s PTP implementation remains fully compliant with 
the G.8275.1 Ethernet‑based timing model

-Vivek

>> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>> ---
>> patchset link for V5 : https://lore.kernel.org/all/20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com/
>> patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/
>>
>> changes to v6:
>> - Removed interm variable useage as per comments from Simon and Dmirty.
>> - Squashed gerrits 1 and 2 in single gerrit.
>> - Added more description for M-plane, Netconf and S-plane.
>>
>> changes to v5:
>> - change in email ID from "quic_vpernami@quicinc.com" to "vivek.pernamitta@oss.qualcomm.com"
>> - Renamed to patch v5 as per comments from Manivannan
>> - Restored to original name as per comments from Jakub
>> - Renamed the ethernet interfce to eth%d as per Jakub
>> ---
>>
>> ---
>> Vivek Pernamitta (2):
>>        net: mhi: Enable Ethernet interface support
>>        bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100
>>
>>   drivers/bus/mhi/host/pci_generic.c |  8 ++++
>>   drivers/net/mhi_net.c              | 75 +++++++++++++++++++++++++++++++-------
>>   2 files changed, 70 insertions(+), 13 deletions(-)
>> ---
>> base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
>> change-id: 20251209-vdev_next-20251208_eth_v6-c405aed13fed
>>
>> Best regards,
>> -- 
>> Vivek Pernamitta <<quic_vpernami@quicinc.com>>
>>
> 

