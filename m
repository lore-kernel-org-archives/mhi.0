Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC92D5436
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399660; cv=none; b=nPWDGKw690LUh72TUGFfJzewHk+ujMpeyd3qahIZ8aNtsXLmYuqwBV/BAvLPnTu5iXHp5yJzGwLvIOZD9BwATQMGpOrFTrJWLDFqNRW2CQnWB6ZpfYkAhk34VucBaVM+PylLSY00bgjirfS9ntvfON32aVB5Ax3Srs6GZDbAePs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399660; c=relaxed/simple;
	bh=DueunpP+LPzYpuMq5+8ZyXotVYWfMtuVEMFhlKWnYl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaY1ENhMbqC28EqcogfNCx1/tBsemnqfw5Izl+DMZGuzkZ6Me8HyhmevBZLZkd+LCyG4Wu+0jMOc7WMY4pPSlpmFYscGVHBbXSVFbyomHWrljZBw6Cz5OHAH69iwvAPMukOSr1eBamcQ8w6R9Z/MICPkuElk8BIo/XUro9dtE+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqPv7ecc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9raKkQc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqPv7ecc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9raKkQc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM80Pd04078528
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upEeL4ZQ3ZDkVenwbkJ58Fhp97VcHoFeYpXcUTrSdys=; b=TqPv7eccvR/5OPG2
	pviQVvFH5/+rsxZJLseokIhnrNz/MUeYnMi76VG+1sQ/xX6TBPKZhCApb+UVeYMo
	umVUh/zj0MhC7HJ91pqSvIOyoUjlpO04ASpqvMMeKAHrIprxyyz+eWsdsQzuqU6h
	p5ue3jdN8F3MarfwwNNJ4Kh+C4L1kI5Ami0OzY7gKqXQarehGbLxVmF+wpwfHWWU
	aLz5JyQ/s92GySiBXCUilAIwcRjioXSnNuA7y1XmoTr84o5vRv7lxZRCd2lZM6d9
	diYPr5OxFhYvPMDLyODWvVAE0RZjO+CHro8u4Dcx/CAtD4kxZlJd0LbRXJ/z74mh
	42yYRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4pn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:34:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a07fa318fdso68961265ad.0
        for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399656; x=1767004456; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upEeL4ZQ3ZDkVenwbkJ58Fhp97VcHoFeYpXcUTrSdys=;
        b=e9raKkQcBsWyLul/QI5u2h/h1TrPLehWoMyK7vxx1z0+2oqZaoWqmJYHRXAwFKjR60
         w9garAlOYjHwdCn0Gic3BzFThdFHuY6raOtFVGWKWNslLuHUsy3bWt7PbKueJNN9UEfy
         +ki1Uw789k9I+kDi/X3VLuHX7J+xss94zkpaqMc5qUotDj8KvImTpj/fheSIEXWyoBkv
         +uG9zHlvbfHiJUZVUwmhd61nmzYqjKhoAfuE0LeVphxPhR0gSr5l0LLRCn+KUN7QjK1d
         qoXJVPbz2zokC+CjMPtWdOamv6gL15+y24cJiYshDykAoZKv2U/doLA/tCm9ARoqELKJ
         8vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399656; x=1767004456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upEeL4ZQ3ZDkVenwbkJ58Fhp97VcHoFeYpXcUTrSdys=;
        b=UoXp4H0HGk1bixGgoJIQEjxa4bMS4fXVYD61rPj8gk7mKebLAc0AaF5RvVIWi7DnNo
         wMpDvaibAqx8WNykdyImwDMRtEd2D3rj+cNEZm2uUi7uBkoRkHsl2ZX6bRtK/QgwBR6c
         RTLWdZaNQWRh+zBlD+AEtV5NEhsRawl2sUm2nQsDDpwMtUlWiqaENNUcDvp/cdT/Idrg
         uG2LvMMGyZfc2oIhXNXKy9pIghN4pAgg+qmoCBImuidAF9G9Q1ifgTuRQPHsvirKMjp8
         Q52jDIZKqOGaGIAksQ+4EcfGWreLNkq2QNMNZxZzHdER09DqkE0xX9i8QmQybIuHgHBe
         d9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+myZF6TRBmZIwHtru5wtb/aNSCFD1ZfVbk4MspqawReFZubbmgvR3giuSDc8oBFZu6PI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yximdyz3Q2MTru3O4fFmaVGsbK5ANgN2XVUtFdtagwmC03Lz/4x
	kHq8FDMQX5JRBoOGG1ukwZKwNCQMBU7lhhLUVljSCxSCysgYlUXhB+hF84Xxk/86pcUgrJpNUzE
	wLH3rPlLMbh2JKeMXu0dv33/hJB1ghBI2WWyeqjG2C+/L+u8mEOOIOvY=
X-Gm-Gg: AY/fxX4vTrDrpwCwDtDe1vZ6WSSnt3T2ugntOQCuVoTumSyE4OkhCl2Gos9GYpf2bhv
	9Tv8VboYrnvV88M0du6jdRwbLTtBqL3/o702ABmBsVdBuT5PinJqOdrxbma6YrPspfi2lPLOhfC
	5wK8fNohfaC30sJFz/jZmXn7IoUIoDlaIw+rWETvnUkzyF9o5FCxj9xYhdvJbEiTD5Vr3quIC5v
	5lz0Ey73INLofeWHnpzhAq/X8BhZTuZ/un2b6iF/T+NOb4RUKnZg0c+re+VZ4aItNm4mOUzJeQg
	H3V3DVaM/qLehyXK15Rb73+XphFdH78Jc8l1mP+tMZhm5HRxAdITGZUbMVOsV/+IWOtMmey48UG
	ycv4Ha/KrZlTeIz8iw4g+YpJB76R8m1WC3R+LcWVQnjkC
X-Received: by 2002:a17:902:f54f:b0:29d:584e:6349 with SMTP id d9443c01a7336-2a2f2231accmr113770925ad.13.1766399656538;
        Mon, 22 Dec 2025 02:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPXS5mUMbO5Xq6d0cLw60JERMVaiiop78hKINewCgC3Co+qqGwI3ZMrNDWQAXh3RXNXany5A==
X-Received: by 2002:a17:902:f54f:b0:29d:584e:6349 with SMTP id d9443c01a7336-2a2f2231accmr113770685ad.13.1766399656052;
        Mon, 22 Dec 2025 02:34:16 -0800 (PST)
Received: from [10.217.219.25] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c820b8sm92614475ad.23.2025.12.22.02.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:34:15 -0800 (PST)
Message-ID: <94b7e446-f96c-43dc-8e19-856c927a6cb4@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:04:10 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-2-80898204f5d8@quicinc.com>
 <20251210183946.3740a3b3@kernel.org>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <20251210183946.3740a3b3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VuTD59BwiDH8v_gk3N5UpZwi6K7fk5W-
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69491ea9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t_Bvvv5v3GB4GvIpbm0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VuTD59BwiDH8v_gk3N5UpZwi6K7fk5W-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NSBTYWx0ZWRfX7lnp91Rzy30B
 cMfEwN7b1tWK9VJz7lZeJe/mad5TXvb3NfGGtqhyisXoKaNOPOP5EmGE8K8XJpwIZQCIQcxQzP1
 8BkyTQZLGd5Ho1LgsCvvG3XIWEqBta23LfN0XolHk9EM+p5oVhdy2L17Xb8bQwzSL8HMnZzMpMn
 Za6sbVFent4eueruzmKcE0nVKOW1Zf+WUe2N7oT607r0eH5EB8njkM6t5D+xPNz1PVfw1qvaygO
 J7Tgx8yfxd+ngrKko880vO5Yo2nTZVB3Fi298plulhwRiffdzrVLhuDkI16r/cOm90Mqxcy/Pa6
 ro0yfJuTKKfd9GuEAkQPku+JPnmzjThekjd069wXMbkXhR7g+19MTmEmu/ss0C7zy5fG+LkvcdM
 1pt+7K94waAJKVNRa+kJX4YC0HdL9eXxfonJgV+YMh5P/ESETrHi8QAM8VAI93jKJrflTH+DdJW
 p5yETfXDbijANQrs+pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220095



On 12/10/2025 3:09 PM, Jakub Kicinski wrote:
> On Tue, 09 Dec 2025 16:55:39 +0530 Vivek Pernamitta wrote:
>> Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
>> S-plane interface for QDU100.
>>
>> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index e3bc737313a2f0658bc9b9c4f7d85258aec2474c..b64b155e4bd70326fed0aa86f32d8502da2f49d0 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -269,6 +269,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
>>   	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
>>   	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
>>   	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
>> +	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
>> +	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
>> +	MHI_CHANNEL_CONFIG_UL(50, "IP_ETH0", 256, 7),
>> +	MHI_CHANNEL_CONFIG_DL(51, "IP_ETH0", 256, 7),
>> +	MHI_CHANNEL_CONFIG_UL(52, "IP_ETH1", 256, 8),
>> +	MHI_CHANNEL_CONFIG_DL(53, "IP_ETH1", 256, 8),
> 
> What is this CHANNEL_CONFIG thing and why is it part of the bus code
> and not driver code? Having to modify the bus for driver changes
> indicates the abstractions aren't used properly here..

MHI_CHANNEL_CONFIG defines channel attributes for the host controller to
set up channel rings. These entries are part of the MHI controller’s
configuration so that client drivers, such as the MHI network driver,
can attach to them. Each interface is mapped to an MHI channel (for
example, eth0 → IP_ETH0 channels 50/51), which is why this configuration
resides in the bus code.

-Vivek
