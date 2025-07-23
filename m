Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAF2E613B
	for <mhi@lists.linux.dev>; Wed, 23 Jul 2025 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275074; cv=none; b=b9kX9X/gha2Qh36JtFAtFLWOBtB2ULSB6w7vyBgmmRxxuofe4RIILPvQ/XckQSR1c8IgFfvSN2o0B651BvZSAWXNlWa/HdPa8y9RC0/ePC2s+z9ZMg9FuG7nnPatXAfE4mYIfsrK8dNdWlQT6CY8KzJ7xFDE8eCEYiSCHyLw2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275074; c=relaxed/simple;
	bh=irsV9FvgKnX6e/zN2HFo2i6k5xtyMkY6IvJrcT1VaGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn7TN2UV/T7BzjpsLXQB5oihabnPAHaG0gK54KQPDC93azgXg+iDVy5hKuDeN61/ETsz9eUYnbetT1+jGNEM0PV9zTHdxfwzRqgfB01W3zMSx9QZDZ/cpj9WoT6/O7aSncv/zqzZC+mbmclxZOjCTTQsP8h0+fP614JgrcTal8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDinBmuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDinBmuR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9PEnk024814
	for <mhi@lists.linux.dev>; Wed, 23 Jul 2025 12:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NlfFWNr1gSSRPt5bMOhvfRkXF20NFj8tEIaK0raN8ek=; b=dDinBmuRNisA5rNB
	XgMKeEw5GdSGxEr4JXPZufn/J56dDaC09T/WtKAaClRF9MIJVU9pGxwZuLw7qHx8
	ZHLt3VK82SfyOBmrni0/ZizBueHvWbOPK67NJPIb/wgWIM6PgbSEVNcKwHg8Ikk7
	X0MaPDkHZS9LX66AAOmfl+TpmevMdaBDmzpthHF1Av8FOMnI7D2Pu+1n7yQYwas9
	y7jXcP05ZuBw8oP5YEAt1GTBjcNn9iC3jIGuTmMLhiX+fXqgdYzNaeMo3pTiH7G1
	Qrgpxn8ZxlvYFTzU2WHOSnM25vW4DlvjUgFYhULGw4XAbkeLinLKbLv5Xa79p0gA
	US7m4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dn082-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 23 Jul 2025 12:51:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e344f333beso18815485a.2
        for <mhi@lists.linux.dev>; Wed, 23 Jul 2025 05:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275070; x=1753879870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlfFWNr1gSSRPt5bMOhvfRkXF20NFj8tEIaK0raN8ek=;
        b=AecrEznOzgl0bwbh+PPom9L7Sm6PZ+84bTMCq8oaE7ZdqKXL2OXWsUF9Kn4ScUOZpG
         wk1wiHHYxRSifTTQ/mUDCw28uynND/+UFGRWv9jjE8t/dBkR/RqpnoR9fI1BLcqt6YRL
         SzmZdQ8dv4W+FUDxi5/zH3EmyGoK8fXhvFr9Q3O45EFjJbm+bTJ5SCHE5gbEKPiJiM/8
         FC/WWiMySkh7GSzRt8Rb7OYRYzpWRyY/KZ1Zm559YQ9iD63dptJ6kFBOpZGcn5Jp4b7K
         vsMp/Z8A+fWdBPypJe3ZCzGpmfPUaxf2Xn6+ELX2NLyNje9y0nYhwqM0SXhPv8tB7EC+
         xp5g==
X-Gm-Message-State: AOJu0YyTGhtfU6lLoWtZ/sZVY1uu35SFBuDnjZaYbljiQi3diwF+QcQL
	gHdT7Dn/Zsqb8Caqq9YKgMdyN0cgisfs8BzYMSI0c6POFdy9CgNv5E82dDotFua2CMVsw9EtCst
	7oSDi5gUpjQnu3g0DDv2ZKY1A0ObIBFRGBDPas532FlMnj71ivSz7FG8=
X-Gm-Gg: ASbGncuQBvuLb9f4AdwCJ9/JD2N51A5kPxQX4fGTOTj2xiiakOcE2K5eOfMpdicLsBn
	7OzKlbfdcydZ1EFL5PRD7Opy0cML6JysYK9Iydoayv6kKlYMwIO+5Wlixm9UzuzP1Cw/5TkH1wW
	rvVZwjSUc10emSqh1+FolRLbUkfJXyYJhazFJtKPZWxSSsLdailZjJSPCHh+h/Ck023591OCzl6
	MGueGlZrSru66SbALwY/CxNN71+4mRu2/OIks84yVykBiBcpDGpVmUy5sic9K0dMfkVJEl57NGl
	fpUDcVmpdy1lzE/GJu6TccAM/COieZnemEmYSSpo5O1ST2Bzh1jBYc6FH2kKxqwCvyiJQIffAvw
	zWUDgNh+k0aHqUhMcPQ==
X-Received: by 2002:a05:6214:c2f:b0:706:c5eb:9b5e with SMTP id 6a1803df08f44-70700638cb8mr17930306d6.7.1753275069711;
        Wed, 23 Jul 2025 05:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5cFZGvvUDm1Gyr3QcLnUy4HpdRyf2Pph18NiIjxKW/XL6y8cizNodgiBEKYQU+iXlSkj/wQ==
X-Received: by 2002:a05:6214:c2f:b0:706:c5eb:9b5e with SMTP id 6a1803df08f44-70700638cb8mr17930076d6.7.1753275069154;
        Wed, 23 Jul 2025 05:51:09 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad7967sm1039883066b.144.2025.07.23.05.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:51:08 -0700 (PDT)
Message-ID: <ba37a9c9-3fd3-46fc-8d72-e57be45fc562@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 14:51:06 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
To: Vivek Pernamitta <quic_vpernami@quicinc.com>, Vivek.Pernamitta@quicinc.com,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>
 <68f18f09-913d-4ef9-bd13-ad32c1d5f8ca@oss.qualcomm.com>
 <43424518-e73c-4136-bb0c-d4cb30062d7b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <43424518-e73c-4136-bb0c-d4cb30062d7b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880dabe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ICarcIS45CnasG25CU0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oNceBW6M2AWq99FIYY_eZZQxjRfn-MW1
X-Proofpoint-ORIG-GUID: oNceBW6M2AWq99FIYY_eZZQxjRfn-MW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwOSBTYWx0ZWRfX9+cqlNIREjSb
 C3o/2iMGt4oBs9RSEdwEbxgdAg/JyRFyAjmND8T6oERBT008rOfyQz/nCEdamhjGKTPrJVZcc9n
 8u+SBJH1ricmu44rrP65yT9Fjia0qviiCSDpUh0hgj5CryHbHa7CYeicJyUIqmudD7RslNG/P/a
 z7+DEn1FSzAQ9BWGAU/FW76U5gqmyoBcQqAue7yfHF2QIXZD2WjUX1WK6VOMhaP1sKQsNTwpGYm
 es/qat8FIUAPEzyYTvl0QKv2FSy4xE9eO8HMn9kD2bN4hmM2XC161jz+HxnzZiE3cLIs3OND4vP
 tXa/nhw9NzE65gcFWxHWWrQstil+qIj8iVDLExdsqBUj97NbO8pG3sKTqtfPawpnt/arwQtqshl
 SelsqLj4aKsvVfnRO5ME+CW+8t/YvMCnSnZwbL0PgLI09mfZ8uE/vHMFCmJMOFXxFyCjzCqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230109

On 7/23/25 2:11 PM, Vivek Pernamitta wrote:
> 
> 
> On 7/10/2025 6:12 PM, Konrad Dybcio wrote:
>> On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
>>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>
>>> When the MHI driver is removed from the host side, it is crucial to ensure
>>> graceful recovery of the device. To achieve this, the host driver will
>>> perform the following steps:
>>>
>>> 1. Disable SRIOV for any SRIOV-enabled devices on the Physical Function.
>>> 2. Perform a SOC_RESET on Physical Function (PF).
>>>
>>> Disabling SRIOV ensures that all virtual functions are properly shut down,
>>> preventing any potential issues during the reset process. Performing
>>> SOC_RESET on each physical function guarantees that the device is fully
>>> reset and ready for subsequent operations.
>>>
>>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>> ---

[...]

>> It seems rather unlikely that out off all MHI devices, only QDU100
>> needs this quirk when working under SR-IOV
> The reset_on_driver_unbind flag has been explicitly added for the QDU100
> device. While other devices might enter RAMDUMP mode and wait when a SOC
> reset is issued, the QDU100 device will pass through without entering
> RAMDUMP mode

Rather inconveniently, this is not something that you mentioned in
the commit message.. Especially in the middle of a series that focuses
on enabling SR-IOV which suggests it's strictly related to virtualization,
making it difficult or impossible to understand the problem that this
patch is actually solving.

Please rewrite the commit message.

Konrad
