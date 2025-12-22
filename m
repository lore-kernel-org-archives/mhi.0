Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC232AAAE
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766400200; cv=none; b=aueukZ/68tNgj5F91MXgi3jE8IU7EC500MJPxJY0j+LThjbxJWeIRGiit1gm95r+v9Oa8Sh8iZGGFrpTDeMgpPDwBw5vE3FSYgaHH9fAlL8dP3oSziqzIL+C4WrBjYx5DTV2CWOQBry549+mmDsPMfsjJf+6Ztn1rA0pzfizCFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766400200; c=relaxed/simple;
	bh=2Pr5tS6dx5juS+usjjxKwGgIGUxy5WfliLyjuU18sQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gpxox5zK7g6pOLn28sX2PS9AaTWWDLUUC7wkX5CSdfhNIbo1kvfku9PuJjSUHEPcnejWajOqmFhdZqQNVk+UBmPWc3LL6cjz8hfv6dJiHAF50vWKE6e/dvf4BffhrVS7U7NjWaaJiGjV8SD9QRs2JJIxgdz5EbTJ5LPghzch6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVOgBy5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GConEZtj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVOgBy5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GConEZtj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7XZDI3761844
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+H2N/T2rJtRvnuVUJj2Q3GgjdR9vEA+S2/MkJrPNIMU=; b=YVOgBy5FJ95VB86Z
	36jQFoM9hW6kfRGYAotCeyiUDR1472XXeXiIW+Fg7fFpjqRSKVYFV8DX8abjIjxR
	LYpCF7cplt/muc7lHRl1l5q2iPnzOGRa6FtNAHkmfEnHx+M9RnL4ZtK+Qso6YR8y
	X/1h2kNKTvMX1fnHfwtJmDnSE0IqL6pjj+Ws35gARP9lYptb0lNxZ2w5l3ngNIUc
	5GXtoVDD0gnnvqnd5spMsgHGwNnF/RFt9/afIAXsSjb1F0GTXOVGBIrkIfK3zgbq
	4kNdEAfIjdtLsSne0eHo5lkKYcbX1+BWzQTDo36F/lovSrMKsPApofpsHQtj0XJd
	effqxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4qck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:43:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f4822f77so105636095ad.2
        for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 02:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766400197; x=1767004997; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+H2N/T2rJtRvnuVUJj2Q3GgjdR9vEA+S2/MkJrPNIMU=;
        b=GConEZtjVB871OHIWGnWbGByPWm//Res4l7tYEVDxBPVankhX7Js++hLDa+uyFOwY9
         gP0wvV+VYwC0rVV7xMr8TEhkyAxuwHrJvfUoB5sng3xgWVI40+Cn0zCb27bbmaYKw4Ql
         KhonnVUkt07Vz8hoFApytn29ULk1GIs/ig+OGLtTCknUmhQ3Kc4JuiXV6yx5+JXIRL5C
         ioa4D8+oLBDI03k5ykvF0zDZkSIWE74Q1moBIU8y+TlW5W/brd4qaS95WHAyDD47ijj6
         iridfxeZneRIgJWrZSCRHsoibj96UNm4ehySC3v77Y6KcdQ24WxTIe8Xw7P/TaNVeYW1
         q4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766400197; x=1767004997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+H2N/T2rJtRvnuVUJj2Q3GgjdR9vEA+S2/MkJrPNIMU=;
        b=SInp1NcM5jiX7BN0sWb09JhN9okQ8G9Xwcngl4fdZ8v5we1ficzMRVhn9cv7kPYJ8w
         TWjd8TsI8cLEhkhnECsSkYS2BT1rwV7xbgzqq2wVGw5VwiB6TKAmgbzwdPvQktRR5pRP
         tss2G9MIGwvmCm3sdNq2vF/9gLAfWPQW3yLNOrlTmOU+otN2RhD4MnAtyEn/vtn5EJKz
         0Ih2KGh0Ztfkq+s8r8rbhP3buW8SSHCvmBIzH+v3jOyY7ZXNstwpSay3msP7Fs2Vz75W
         mfADAp80UcBP8dbwTN2X9EPcrTZfjMfnkIDhy45Sx44IMTr/3WOLc3eRlk6jnXME3OXN
         OZaA==
X-Forwarded-Encrypted: i=1; AJvYcCWunqwlMDsEkcX1MdoScS9bS1qk3PTDAzgwaw6aBm51dxbPqbgWZfrMMY50NkG+4CYpEHA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcS350QDVCn4yGVIWZxUtfoguO2ShEFFFltPaJyLRniekinQpA
	FyBXj4yh+PaNM55CqgjVJsW7qA8iQ1wWaVsfF+drWMJGOuZtQuKJ10s6fwK21swbIt0IDw1YSzI
	h12593Bh5tOQQ/v0m3/JZUbcTGi3VjGhwcpFr/MBDR1yaitoUQAGyPmo=
X-Gm-Gg: AY/fxX7LfmafetpgrxGOOtKlWL31t8znHBeb3xhZn8D1t7sQXfAeyU2AhZTzOshG/OA
	dmJ4VZRMcCKgk1Q558G0OSi1G6DDklJN/VX8eovi9TsHOasST/G4BfswyK0H/fnehbIClyWlRvx
	31Vw1d9RiWL+jMJmvfPoUyZ1/NQjQWeGhItFHez3FxUL3cod/ChqW8wuHerRbhdkxLt9hEqx34f
	/2NIji9qVvfPJ+KRKbNeGwQg3/x2j9dCqB5jz4NQXFkAlX2TDha0dP6dwdG8LsaZaPmfHPSHtnU
	1ZGSVa/HZQNHnIkavLv96avRkZgNAOgtuIEtc+QsxM1u044ZtgVvrEaLumCknFSj2j60SteVesq
	/1f3HfNn0Er1IPoVrnnt8aZgS/hfEGhWXYr/jbXryCxPJ
X-Received: by 2002:a17:902:f710:b0:2a2:f1d4:3b64 with SMTP id d9443c01a7336-2a2f232c5ddmr98309805ad.21.1766400196884;
        Mon, 22 Dec 2025 02:43:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+XrVQ+S7HZ7ZghURDECHoXiME1DrfFnztE9j+C21cTAZrNI+72XesqqlcB1gGPbbGX6rC3A==
X-Received: by 2002:a17:902:f710:b0:2a2:f1d4:3b64 with SMTP id d9443c01a7336-2a2f232c5ddmr98309665ad.21.1766400196404;
        Mon, 22 Dec 2025 02:43:16 -0800 (PST)
Received: from [10.217.219.25] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ce3sm95238315ad.90.2025.12.22.02.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:43:15 -0800 (PST)
Message-ID: <0235cdaf-4c91-4bb3-9581-9eb24cd1aa47@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:13:11 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
 <20251210183827.7024a8cf@kernel.org>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <20251210183827.7024a8cf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wYCfRxxyBNHMkcXhABth4DEFr8YZy0Y-
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=694920c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xEj2kCWnBG9tpPoWntAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: wYCfRxxyBNHMkcXhABth4DEFr8YZy0Y-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NyBTYWx0ZWRfXx3RIvSsjrrnJ
 Ydq5ObYoEKd1bf1bncJwo+zCakszD9Q2k6gQ6zP1qn5Lw4X4y4Ypf1uglREg3JZPUrLMrneCmUo
 h1BcBGzknm3AckylKsPHAhTQB1rgUiaFdQrnFUGosGfI+H9y0koR6bxz3+dmADjZIJxkAucpoxq
 QL0vh0ZcJC9Eev3BZxnAwEYW/UqPiA+VhM+yU0KxNyKt46jjiuyE+hB6LYt3K/+WR36sjf3qexc
 S7PmlX+Bhxy3aXjm4/neQWxd8TuOucouz7uS7G1wFt+ZSydhESV3H/1rid4iIDCsSGAImjYgHSM
 O+Zl3JzRHcsnWY5Zc26WC+BKq0YM2iS5t+APwwoDzawDSAs2o5lhUIbVKEZWZB1QMyeykCF0yLN
 ADmXtpu2l2BwTNlnJvFDeb0Fs+JCk1mnrpW6TJ2eOUNChG10bQ3nPh2dk3+7yrUvK7hr4Rkq1ms
 fr0FENazvYTHKZZvllQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220097



On 12/10/2025 3:08 PM, Jakub Kicinski wrote:
> On Tue, 09 Dec 2025 16:55:38 +0530 Vivek Pernamitta wrote:
>> Add support to configure a new client as Ethernet type over MHI by
>> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
>> interface named eth%d. This complements existing NET driver support.
>>
>> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
>> M-plane, NETCONF, and S-plane components.
>>
>> M-plane:
>> Implement DU M-Plane software for non-real-time O-RAN management
>> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
>> models. Provide capability exchange, configuration management,
>> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
>> R004-v18.00.
> 
> Noob question perhaps, what does any of this have to do with Ethernet?
> You need Ethernet to exchange NETCONF messages?

The patch primarily addresses host-to-DU communication. However, the
NETCONF/M-Plane packets originating from the host will eventually be
transmitted from the DU to the RU over the fronthaul, which uses
Ethernet. Bridging is therefore required to forward packets received
from the host towards the fronthaul Ethernet interface.
For additional details on this architecture and data flow, please
refer to the O-RAN Management Plane Specification:

O-RAN.WG4.MP.0-v07.00
O-RAN Alliance Working Group 4 – Management Plane Specification
Chapter 4: O-RU to O-DU Interface Management

-Vivek
