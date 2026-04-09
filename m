Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D642D12F3
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770218; cv=none; b=O7t6waa19LLbrUS+5kFJ4x5zCgtlhg6ypE+Yzn/zCeSes4LohGsMUZ5SY+b5/B+W+LmVEgTypOGyGRV8hAiqPE/h7bsc4QD2oIyHXEwzdQrYUOjHvP367Sw37yYLZwVK4koJIOCEuI90sdfXnv8A1Mn84+alFVSCh/4NS3+vmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770218; c=relaxed/simple;
	bh=j9h19QOrv8PK1vNFujX5jiDuQ+LX5W8uUSmisFX6Pqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIL0f53w6XoEpfGBhMB4TXkZQIL2RkvWglsPJ9WVXamYhIzvY/HL49ti0FvVf+iB1be90J7NQ81iJeVT7JBQdToHqh16L75I1jRpShgynV2JJHHgk67vZVDDcevytYEvgSZxXwHXqb5rkjBldMdZO8qVRdqr004ZSoCVVRqm2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQsTYY9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iI8Yth5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQsTYY9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iI8Yth5S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdO242812135
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 21:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=; b=LQsTYY9YG1LiN2f6
	AcYXaYl40pc02NldjZy1HjUy84wgOVHriWiW1lPzmSIFiimB0ngLTW3mJYj3VvYX
	jtTc72gyhi/ljCR9XtIIjH9/XDqVIqS+yfa7lSgAWKpbthWfeo+YgiDFa5ftI/pN
	jKJKrZjSaaysm5bt53/sfHoLCQe8i4N9hee8XdkKERSxzXQFbrTi3mT+3lCTS8y2
	ZQKI9FZXSZ9E0+g1y9NexJEk/Vr+7hhlZQWNOQdTMowEIp66bQFBz+3wJwHouwE7
	U/BmcwEVg89X70bpDzoA2df1RQ2Ji/iIjbsJAAuvaQdPTtZTHj2lDjMlb/TujzB7
	7W+YnA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9js2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 21:30:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d443c3b094so1889155eec.1
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 14:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775770216; x=1776375016; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=;
        b=iI8Yth5SStcx7bCNKo6SzIm5JlGPC6BWmYPuQd3yx18+nhszpAWe1MFgrU6BWifjTg
         vkmflsI57/dpipF49Se75eTwttH1AgLJo6tAd7yJ+YJYtI9VbDd4z3FOjPT1mvj/Oib4
         UK/MoQIzka1dJ2CMNKTErWit3U5jLk34Ki/KEEvBHYP0avRPnCMDIoYogqDdpYtTBE/t
         tVn8O0BSfvENPqlFWOpr+QXJneQYPaqX8E6jUTo3BTuz6E/8ZGxWJh4K0oDzBLj81Ysm
         v7hmiPPGVu+mxIStQRbTEHAB6Oczku9kUbTvM8V75wobeu8FQYsQRkh0IIaedejE0rf/
         dYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770216; x=1776375016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=;
        b=PCiOKI44QYFODxvNGEPF1G0pfG6B7/lg2/pTUNkK/8sZM3wxFxjYHmegcMds2Eg4xo
         UCPc63BsHpHoroiJmDnTMcGbM6MvYqAvo7QWZRHH/aKENC4CcP+++lL3l83UZOY90ebV
         N0HgmxxEbM86pzAQ1BUeHpwwKO8xllUhMGYKGy9kbDSegkQCKoR24A/3uDmj7ZMroftx
         /3D0q2gCiZtjW0r+M32uSYcMxaDjTZNniM1dPPGkaFNxuvlRRK3x5I1XQga1Y6xwa739
         s5W+JWB/VSArK2c556drkaW3uWJ1KBnV3mTMLJ/WmgoGWZ4NiPEAEJvsc1VX27lkuyoH
         Kzzw==
X-Forwarded-Encrypted: i=1; AJvYcCUzUDeRarzVazJoMqDR6WfFLnuHPLaAIw88bM9OVi6FAJyCsjE8BFwhfg8m3bOmdUsMYVo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcI79KBQB0Hn5+33GpbvPxixsrI3TMkq5dkkgvf3Pn4ImksuQ7
	mZIlQlgQM7VvlAJgOrVZq+6o3WWBt30pHsUjMmpahwge43N9+4gSNioRNWTuMvmycTTVAovRF6R
	Bgiac6GeJAgu9iB+kpHyS4TlcfUIct5qAeUp/Ztxp2UzbafLZtqNofgQ=
X-Gm-Gg: AeBDiesV3CM+d6lJZ56i5UVrkG9Olq2lzyPHa6ZpmP8vat/YE3uQink+Jvqhg6W1P30
	X4io2qubkrf/bd5GAjstTdCnUQstTVyYbIVJEAv2muoErCxnJa+NNMZ+ndsWL1IjDLMF0GCJ0IY
	uE2/FrdV7XbeEy303tvM/ZyLX8P82KFttg/wmnhvvPTYqI5ERu6TRsV1ULkwYynVRZ+vB65TZhq
	oDDR/F7CBIaxKhCYSkkl3kY14K+rVLAVw6D6eUFy7w3SKsV6VCwf9MkdgB6xSElXGnm0RIAP9m2
	edOXM1EvagJqKY9YdeFVEXUub/FdVHk4JOEih70tuCGTk+XpL4rwASd+YuzJccS6AwWv+VPuAdl
	GD4I/6fDL3MURaKj+XB5hozPa/DtJ0hTn5TskspCCGgDKHPZ4oLoCXwELZ3O6mFPzmmcPxcO4zy
	w=
X-Received: by 2002:a05:7300:2156:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2d5832e2f63mr507968eec.0.1775770215616;
        Thu, 09 Apr 2026 14:30:15 -0700 (PDT)
X-Received: by 2002:a05:7300:2156:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2d5832e2f63mr507940eec.0.1775770215088;
        Thu, 09 Apr 2026 14:30:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db64c4sm1357061eec.27.2026.04.09.14.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:30:14 -0700 (PDT)
Message-ID: <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:30:13 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d81a68 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DdBerv_ObsJuwx9ejj8A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: pZobnKA-kPLmGyadQ5Sp7fPfQdI5Et15
X-Proofpoint-ORIG-GUID: pZobnKA-kPLmGyadQ5Sp7fPfQdI5Et15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5OCBTYWx0ZWRfX71JoD85RwRZx
 NSjOLijpSAW+/c2OXJ1amrH0uuKsprVbghYmKp54iqlzaf5Mn4uCHAbTbjc75SO6pvsPr02+tcV
 swDOffL4Uad3NcMF7osl5efA7PA8rJmINYf68evDtpjM7Jen4qbsGLnRMC19VJIOEGBwWOkn/d/
 FruSOyj7mW0W5AKqQnY6fHFoS5UkBtitftXjwxDROmcgTV/OBNJtgZpLXaq3yGYEjhYIWpVEsr6
 0fJCobCgzDywPmXPRA65tSk9pcBvfGGJdVJ8xcWmzPf2B1QjtsUCgAhqL+/wvRyxta53HzU+s3A
 ujykY0u/UBjuqA6xFeoqfX9ya/rvIh4R6YKgJ9Xd/t1GwKNR4havDsPZR//pEAW1bEm5Rts3Wps
 MdcFq9JsRZR7YuM10Q5/uP/VPszjv1ZbvQDa1uE4WoSEcbEgiXKFnXfXy4u3W2vAHl0lFZGOhq/
 MFR+yUkikdyyOHldqrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090198

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Add ABI documentation for the DDR training data sysfs attribute exposed by
> the sahara MHI driver.

Sahara

Also, this patch should be squashed with the previous patch since that 
is the one that adds this sysfs entry.
