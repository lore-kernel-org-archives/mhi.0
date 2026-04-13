Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A03ACA73
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071145; cv=none; b=s56us3x8gkfSMgRLT5ymtmasWbsbaRciKauLEMBmeQMZTcnYCujWWJ4gsL0n7o0dRrJvrXR/JJjat5nbNPdNeXMAvyND+pHVKMeoXOARM4VUp6fjLvmFPeVlo9l3HcNSXD2yxBvtotiYvb5uIN5b6peReTOf78Y/xanb2yWvMzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071145; c=relaxed/simple;
	bh=HvBWIjEkN6X5RQBn4tnjBzkItJ7cHBZXC8gL4GAHTOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxuo11LApoSv66Ug5dSginJDCz5wBPH689Oargznr+XvkzjUT5CDiO0zirE+bsCYfKVZOAk1xKtiNNJNH0kKC/uM5bQiuGVe4QwFas7Y07g++PoN/4M/Lhj0wWdjiqjIths0te0EpZ5Y0HvftZSNT4zBX8CauHwNBuzwNOjF2LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/U1GUVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fR20S5+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/U1GUVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fR20S5+V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5MvXu2661895
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=; b=E/U1GUVG9dhseGrO
	zjp7836sfwiLAcHhwbncbt+hPDQKUScdLGb4+nD9sFydXqa8Ni/4LbfnH9AvZ2c7
	+CJkvZ/s/m584Q1VB58ATOgqHlIlYVAJYmbL6o2ZtFmSiaarBw7OUh1PyeTNew95
	guz4xwp2Av5vY2NkopOo2w0eL3a/eBa1nQSD2ZlIDmv3rmBrvuFAkA1F3sIRbd5d
	Knqq6O4RlvFB6nmVnB77c99hZ29qBFRJdmsFDAwBAnhqA9gEtLdJQ5jsC43K2UZk
	DBn+qB3k1BdYtdpd5lM+nOMGMjZSToNA2ZmsdesBLOpU9ruNjG9v0OJ7e37UwGz4
	TqrPOw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcvj7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 09:05:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so2799283b3a.0
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071142; x=1776675942; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=;
        b=fR20S5+VVOW6fEaILT9OtWnWWjz0iSVGIKkjLW0+Xb5MTSIsBD+pcGuhIVSb69pf6G
         qJ5vnkYYRP81/avFX46vxOJd+KEDC2x3OAR0TI1cix4Jlme9VUfi2iRbU9AY9VGUMlp7
         jVpjmPBHqCQKfGahoOEYenk1iF9Mki6arxi/R8Poqt+VahnAWo4syW7fA49IqRSpWsYr
         BOMkG+5xAlqV8CIIx/eZ+GtR/hsKkL8QkB6BxV+feLZYhTX9mKkfS+j97qu6LdYmpC3f
         r0gOE7AleLERaX8CEv7OBUBr6DfrGuoBMaqgWPfssQnQd2aqLcixDQzNTpL4Y6bpCkIs
         qmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071142; x=1776675942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=;
        b=BnQc8qEcDw2d4HOQqxp0awcnpIzA30hv/I8uES5BJkXz1WMTCxdIONLbl4T6ESsIEa
         2BAxJQhWJjcvLuGOK/2YtaFbrHTcLi3m6VLuarjfHC/PKaj4CULJclDxvYip4WqLLrZK
         y4277gU6BfBckG6MroGiMNq7RA8vGDH6czeAB3KlvZysn73+Z1p9rMv1ZCExJZh9kG6L
         6ktDFID4N2WSC0kDg9d4VpIWgC89k0OYbOTQJ1i8kI5dLmdhWbzSLvWMKkL/zQVreNVA
         ymeREhkLB+1QG8grSDsTTiy2wM79qexjsktxSdRObPvoYjT+3GUP8UhSW2wAB074fcKZ
         mcJg==
X-Forwarded-Encrypted: i=1; AFNElJ8JHQjs4RHYo3D42FaCtx2bjnpKoGxF7Z0Ap8sIZTi/9if+Tbg6RnL1YMvrxS1a/Ek+t+o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/cVYd+dsSq2gYyqZsjI5BNgBIvdLHrYJdChvA08Pvh3kLxOx0
	SThtoWi9EMFEJJkWUCrn5e/ZuuYR3ALBs7OBCzICu/oRrEvbEYFgqomOv5DVpg2yUtwI+VkuPIy
	QcDSlik/6l3CjRwiyMarc7D+t+hILggxfnUoruW3kh5CusZ3CbpXPGKI=
X-Gm-Gg: AeBDievFmC5XCMFaaG/7CJYM1xTdlqEj5VJ0QKW3vVh0sEOVjDcujMqSBOzBWT0JKID
	3ZzUr2nZoU1LuzmnI3l/z6FMtznQUuUPCfIod8wjowQIIsl4cyZLtLRdhE2EAgnIUwbkF7PXyRd
	pp5dqHj95XgIa7Tqt1TwZdnX9WQPTBv/eH2KKQbEweHSiC7O4a+2mkbRaY5RcaKjqRtUCy6cLJH
	KiLj3Y4Z/1pUNI0f+WETL4sa7gsPjuB0db/7VQH7EkILWQqIY7QzmJ3sSpODYND2jlWQyUySFfN
	VOCRqBXgolzZafGHdaHFO7xvfNfuMg6kKYmw5megTWlUWZGWEu7gkem0Gw0+XWOUHV+/kBT+3m/
	5mTzE1asKzlJPvGvKU+QfEmAy3E4CtP/wTWPn9JyXBv4RaCNowIahI0s=
X-Received: by 2002:a05:6a00:918e:b0:82f:18fa:166e with SMTP id d2e1a72fcca58-82f18fa4110mr8670506b3a.37.1776071142338;
        Mon, 13 Apr 2026 02:05:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:918e:b0:82f:18fa:166e with SMTP id d2e1a72fcca58-82f18fa4110mr8670469b3a.37.1776071141748;
        Mon, 13 Apr 2026 02:05:41 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c339570sm10499494b3a.16.2026.04.13.02.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:05:41 -0700 (PDT)
Message-ID: <837cac8d-ef3a-49b4-9f10-2682df2cf273@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:35:36 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
 <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX94J/MPUTIyZN
 j7K+PDIDHSh2mWxkIjT4uvBwlOEX9R3cDMCVqWHmgzX2pfYWWEYEX/xM4jO+LQiDSBVDarA0kd/
 lZ+RHNFMVBqFfZRFpBZ54Rl2NWAnrONBm/Y8KSHQUvV+staB/80boaHMyVTmXyGASaYvFm6GSW3
 OkdPX6y7UMiQ6xZWLl/L8PzG+ZAakNvvspOzTNFjrJAdtuHFPHUEgclKEc0vGklG1poZSztdur3
 7MKtuZqlh/1FY3btk/BY11yYPku+31PGnAGmjc49WL6Taw6oqP13H7ldlpBK16IWvPfkpFk6Pif
 LlLPE98c/+n+t2mgas1+USHMrRnHblvwNM4WciAIfR/8uDaFM7UwwqxOhSrbSllTvrcp1MPNLmA
 oEMGG4w1dz2bEXQBE9DldFD3mXsUVQwRWq6QqneiXimtw4TX5Ag7Zj8HEDwsCI5VRvsAUi4ZioL
 yOj8uhe1J0n6FRWey/Q==
X-Proofpoint-GUID: XzPbWZED5fNM3DJGD98U08BuwbpdPDNw
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dcb1e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=aPmjE-LijuUacBvKLa4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: XzPbWZED5fNM3DJGD98U08BuwbpdPDNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 3:00 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Add ABI documentation for the DDR training data sysfs attribute 
>> exposed by
>> the sahara MHI driver.
>
> Sahara
>
> Also, this patch should be squashed with the previous patch since that 
> is the one that adds this sysfs entry.


ACK. Will correct Sahara keyword and also squash this with previous patch.

