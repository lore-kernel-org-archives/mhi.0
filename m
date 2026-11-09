Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236337;
	b=nDWGZJkdxvfIf+VbaufdHd42FeBYmocuFRs0MURtZt/+vIiEYQrp6sjIof3ypYLk5YEU
	 EFihA6uu+8sUkzL0uGIFfl00kv7OnAbPPMjGLq0k3aXrm3xyS75SlT4X5XsSkJp06f303
	 qkDsStZdjn/qEi+y3sqhpweRpTtQJMas+UTRm3R8JCpLb+1A1/O2qwWHwBABEhY9EE2bR
	 s4xcE3JTDIBJL43FKEtvuYNOTWfEGbXdkxzGzo+fEztTn98pr04p3I+xe5Fru++y+CYn3
	 H6D6hSaP7Nt2dDQirFHTkTUQj3XstCuOI7QwPPDNi0hbOXNic0UeO8BlC6carygr87Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
	b=tneuGGaYqyD4zgktRgQKQQ0Mx5nrq5TWS3uwotY9jTSuStsHa2p1jw1AiZNMszWhZSFd
	 BWTs3fUyYj9UU7n9Z01nGGOwPzVjz7SypxfjqEMNL7eV9ydtP3thb0vHMCcixqpE6VY/H
	 GTrR92ZZRPj1w3uPQtctoyKQFLKaWo7d7k2Gjy5aQD/NUK2N2vVLcVXWc8mZQy1ZD9OKL
	 Wha5SuwXa+7gZcgWAtqOfq44EOU56NX5LE/hCL8ED+DsX4+VO6hpqtfZFXHRZxzLqhMTT
	 k+bF+Rt8CGYBxdw3kw7IDQnGDSFiVmd1R816+51TFncDejr6/wB5ipSJVi2SZMOEhNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+C2QlEK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8B4LOBT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4155606A33E
	for <mhi@lists.linux.dev>; Mon,  9 Nov 2026 14:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4155606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+C2QlEK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8B4LOBT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDoJ4025851
	for <mhi@lists.linux.dev>; Mon, 9 Nov 2026 14:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=; b=R+C2QlEK9VGcFf4p
	58a26g4jAaa32792CJFhQb8IqHARy/QVORM0TxPGvaJ6kn6nILbgYwDZeo1v9KvP
	kPSWybTsUYfPd3b8iXmP8di1/dOi3hzLs+HdPswoe+9O7m3V2Hr3/bVYD3NqN5Yj
	tpDiyqSRceOM0+RUiki4G3RA7q9bLhCYXLQZkP+32LPhsbvdiO3iFeV2KID43Zr4
	r8JDLQ79dWC2HllJqCQuGXVb++JI59SKhIy2BTf/FHqpXwQloUfw9UHmOHE2eHG9
	6Ug03QE3cA+28jgcUW/XX+ua+9fHXCzetQYZ182rH35vhaQ0u2lAhctTUA7YqeY2
	l02rtw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua589fbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 09 Nov 2026 14:58:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed8aca9775so9673285ad.1
        for <mhi@lists.linux.dev>; Mon, 09 Nov 2026 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236336; x=1794841136; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
        b=R8B4LOBTtuTc+rrtkwr1CuKN6zW4pXXRL341BGHWNlOoQz4eSSZCgSVx303UvNb07F
         GYXoq26LW/nqCnpremDm/KXbnadYlxc6xLhBXw+QILt8q+M+aiTkXIbx1LOm1q4fxqtk
         b6Xs9yKwsHKvkhmTiqzXsKKlbLOufnTV+bWUBxrBktoHuDKEJkLLXnDctY4BR+5Zi/Hs
         1aHKdcUb4N5LWzA1X6TnO204vtZ+qTFp22yFqFNZCMDFY7uSjOIL7/TqrxbA+EtO+cLe
         Yx9gPHsgcjbYTLBUEjamyCH6mHbNJMwNHPbdLQc4teeg6VGXrCu2Diuwp+ZxiJ+J9c70
         BHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236336; x=1794841136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
        b=cn4kwOoZQhfHvw3jGS41/CMsRVpqMrhzKlJRtWi5LNXceH1HE/5LJ8J9CazZpHgJbT
         XtvY2luYKuQ9t7njxAaMyD9SRVXlnIsYIIQ0gAjOq6fEXmNI1WUTfZSqxr0WbQQMWU1a
         wUGG/moNzVKKcva398kggL7NF71cb7due6PiMX8PciM3qL78sXfoW34u2IXyfmuEV5aG
         +qtSI6S1MooWn92FFBt5CHHtdVIOvrP7sYMtB0cf4OPcWNe5vLkOw0kOcWM9Pa2WHdjB
         sysREGAqAOCI0SVGPTd9LAaSFQcmSLWJH68wVmX/VhTnSA3idnMh7agtiqoEIyGH8vxC
         6hyg==
X-Gm-Message-State: APuU4Z+2UXn1aHRL+zsK2hCYnP7K/hiOBrxnIKOJKOO1AoxmTcztJLO3
	uG9TrU4aJZm4VZpTiaS825bLz1WxlsEjo+uP1pu/FhhFHo9JYhB5+TWuBK5hDOfquYoZoaqxjjL
	MbP92WG38QDSBoyI7BrY7vvdx2/UvxL8NVs0aykCmUOTtYa1J1oDOxQey+06xcuQgDQ==
X-Gm-Gg: AYBFou1qyuyTOt1yNPMtHlirPInHKSt5mSO7xBxKjdDp9IO/ivzIcx7BovbO4azpJcl
	yY1BOmHVYyVx8Byt1q2uwXk/3jhSTjFZm/wdO+ynHGcIiteX95m4vX818q2MO9UCOXiIiWNLoZq
	eM6UgqeIgQGuT4nCrTe/rSKWtr3tjSa2O8K2SJlx2w1sGfIsb/UYZN5swVn/UL0peG+TfDsZYWT
	TV0TWdaYBPQmWid2IWyMnyWrdZM4hGzgaXR/7JBIYxJQrXxi4xUYIxpORk1z0Q3xcjlD7WblqSt
	H+F1WTQNAmLPV+pmqsPs/TkxClK53LVQdr+XSEiDOKq5Ja9pxAcp95tmVRCEu0HtI2+SwTPZ7MV
	dNWbY/7XkBSZioBFVN4OQaNr74x0G8OTP8TxdtDvXgVuk9abF+uAjVWB7/WA/N8Bz5KErQlPQxF
	QIGigUGQGG+gMiotnKRlB3ug==
X-Received: by 2002:a17:902:e5cb:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2ed8373fcacmr31611045ad.10.1794236335626;
        Mon, 09 Nov 2026 06:58:55 -0800 (PST)
X-Received: by 2002:a17:902:e5cb:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2ed8373fcacmr31610765ad.10.1794236334912;
        Mon, 09 Nov 2026 06:58:54 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8174bdfdsm12236235ad.73.2026.11.09.06.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:58:54 -0800 (PST)
Message-ID: <c231a7b7-9036-4001-9ed2-e1c049f02dfd@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 07:58:52 -0700
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: xing1989093@163.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109110352.1621-1-xing1989093@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261109110352.1621-1-xing1989093@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX8GOvpOVgfFif
 bN/8ZwK8dhV1n0BUJx0UHeizUvamrR6+3TanED4TLGNJ40ThqzykWJYDGH59lrcCMGtF79oxdpx
 nLO9ksMSr3cMNrLLpjCAl3as9DxMMOAOUMhxQF218DXajWVB1Qgdd/9YJPUnWR8bEh0jIBUFgf7
 ymnMP/zTZGu+vxmFFQ5EUzvbOUmR5cNG5zr1kfYnResRVZGi+BAChChKgXR/r2MMFJAk9iOlGSn
 qV/NwI0Awt58zADiaRIhdkySxcbya7YoC2DuN3LAcW59e1dmppaquqe0QQHaF9tfa40XnQVDNP8
 e6MajHu66+HZ8P9ZHOQ4JqdkS0qENVEuDiH+HpvtHD5u1VTGGMM6wfXFneejq52y2fDYm1Smuo+
 qOtEYQca9SXu5QtxPYPNQMVzIGp223pJ1DwPew11r9nJu1oHMbFYD4p1L3CmhOO9zCr1dwEPbTe
 EfgvsoPYzxT1ee+hYFQ==
X-Proofpoint-ORIG-GUID: 3brwgd-DWS4voccfzEbM4wUNX4rMlO-E
X-Proofpoint-GUID: 3brwgd-DWS4voccfzEbM4wUNX4rMlO-E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX/T2R/FKO64iD
 JgwfQe5PifJXH1KRhnB/XfAedKUYLUx4hwx9R9gpZVMA6KLjFnR+9JC6QZUEk5gfOZI8gVRGJgF
 eDHIGA0oFZdFGsHtVJ5FWLaSl6Vd4Xs=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1dfb0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Byx-y9mGAAAA:8 a=pAXL01g2s4yJVYebQMEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090059

On 11/9/2026 4:03 AM, xing1989093@163.com wrote:
> From: Hongxing Xu <xing1989093@163.com>
> 
> Writing the MHI SOC_RESET register is a device internal soft reset: it
> only asks the modem to restart itself, so it is useless once the device
> has stopped servicing MHI. 
Interesting. Where is this true?
Every MHI implementation I've looked at has the SOC_RESET register 
implemented as a direct hardware signal to the PMIC to reset the SOC. No 
firmware involvement.

-Jeff
