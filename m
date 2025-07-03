Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451611DFDA5
	for <mhi@lists.linux.dev>; Thu,  3 Jul 2025 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556781; cv=none; b=Qd8Fmh72dDhm44vgourrsLQy2Uh/6uXX1j9U5ShphIGrWVGASov/XxhS6iXszc43uMkv+16i2Qhm+neHzdKmRrA/LdxpX4sp4acSVAIVOHx+2Uz5ZG4wLr1lLy8rRb39K79gIFWlUnuhHGI3PMY2OEJlc5x/GhFAOpxIN0SgtpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556781; c=relaxed/simple;
	bh=Y2wHdzMkoJpTGZjYvb1zaxVVxIgGPm4mgWwkVnd7HDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsMUxxx0FKljWm+rnvtZa1m198nay1NnPnChlOGJIGcpO+Nh6hbDQC7USjQTpQZDbQKwnupyAbMmefI2kAr8tcn5nhvxRep/Ejf4afdlzfliJ90o9dkUYVtyu8cqE2QhQ2YUqqs5BalGQUszhy4xUVli+yLo3yEKA5KUg8rvTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERuujuKv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERuujuKv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563F1Irb032118
	for <mhi@lists.linux.dev>; Thu, 3 Jul 2025 15:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvvGW4Ha6hjLFZe9ISe2jC6fysqV1hVJbJSvtVGuzD8=; b=ERuujuKvjS/U9TZp
	noGfeXXFZKevkHNhE0cHEflu3eTuvJOGmBT4x1bIOzJx9/ICh0XjqBybOetaEWUo
	L6LuiMsiNS/dRpeM8FAdWGqMsHwCp8CKqRv5EMiuPXIyFFCb2LWDzx9WxdSWY+5k
	pHr8Pb5QrzZBxPxpXohyNTt7QM9nKyUsWiR5iK7nIyXqhbZzzs2zXIBYtPDbXT7k
	fH/q7UTj3sQQZrtHUiEY7V9BLSY8DPjNOVmDzCoX7IZP1pWW25DhffxSPqq1nUCV
	KZX8GTuoxJFb0o6E1G09+gAHfK7uvc6K1+NVpc3ZM5OcFXRl3EKRz03J53/5qG+k
	dpLqYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kh7s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 03 Jul 2025 15:32:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso168761885a.0
        for <mhi@lists.linux.dev>; Thu, 03 Jul 2025 08:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751556778; x=1752161578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvvGW4Ha6hjLFZe9ISe2jC6fysqV1hVJbJSvtVGuzD8=;
        b=gBLR4dntedlQY26vcQOerO6e37Tm6wgPqtzlJ4awUYfQfrJqJPElvmxlW8mG9Co8u7
         0lyeCUKotS/v43DbUD04yTZefwt/r6k8ejbzPwPcxaIc2rGsizN5G3LuWHLnvQW1mP8+
         EX1eliaTXABwzBw7e8Abi7+1pShMuXqZPBvHcvvJ1KQaiKDJXhjYYIQSPjyI1Ll9MuP4
         wEJHtE5fmCHBQsPnwhHutmF5+aulAFXGiMIcRwmrqECFrY5ORo0JbwacbNp/YWgD3XiS
         FgOd5euR6jN/MNuhUEpZLj0YXPRIKEPpDHEfSnwOKUZS2/mFocAgiXMGqm0yay2q9bbh
         zFnQ==
X-Gm-Message-State: AOJu0YyDwxzyBLjh/2ejO9Bz8NJeB2xh5W89nXMEpJYjwGUJbFrSo/Nw
	xOcaJHr6BYWNhqrL+I2rqLAw68bXr8vAx9sAK9wanPT5IAep6vJoZfCQgABxZ4L9xgSpTu7ujYY
	ajE9UaMUgY+D0tlcq/GhbQ4F82iDkN65t6U/5XtfSAe++PO3Zhv6Jemc=
X-Gm-Gg: ASbGnctYLH/UsL6m2PhFpJsvv/sQpvk8kmOLF40SXCVwjCMtAwsdbPcFPPmqGii+wND
	uiKtq8ALhr2UDuLZ9qIWkxL+2sR29t1mLvxh/ZUIi1SaJZOXr0UpSn1k9waqkF84tvvr5V0Inr2
	6FwkaZdHs3I7FBQeyaLQSATs0vp/irizQkrKiHzb1Hz75VK0mxMpu726ZEUpGVZ0fGLGW55viP7
	/yWJr3euvo2vrG7Kj5Jp2hsPeh/jY/VL2vkrzb97yIMaFitjeCFqrSjSI8eRO4O7FaOk8yPAmmV
	767qSFh+ppFP9M57Zi8P9wMjB/xhntM7Fb1rqdq5xrcPaCGpZ3zIea8JB1vYNGWTVrB9Cql3pKx
	LLSDOnA==
X-Received: by 2002:a05:620a:2788:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d5d3f0201cmr128301485a.5.1751556778129;
        Thu, 03 Jul 2025 08:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgKXuQm2xeDUpFVPOnRJFFPBfy1u3PKJPqnXeNMitcBiTnYYl0avZkvqAQKwR8Y08DzgmQqw==
X-Received: by 2002:a05:620a:2788:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d5d3f0201cmr128299885a.5.1751556777554;
        Thu, 03 Jul 2025 08:32:57 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01201sm1313575966b.97.2025.07.03.08.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:32:56 -0700 (PDT)
Message-ID: <d1973316-d6d0-443c-b155-ad8890b8c971@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 17:32:55 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6866a2ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=aC6bp7ebQdJ3EfGykbEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfXwnmrhFpI/xgZ
 WpVmuEj2P4N58C74gymV2qWA4Y8OzR6DJpZ/X/CQRVN+2wDqoylP0MmJeyyCvW7szmoixbAzAlC
 sqlfxtxATQCsM3JinCQ8/TkIcQVxyMl0wCnr7ccyWMaCctTtJbrMWW6kQmOHwTyypTpWhTtOs4R
 WagYUI79aIzK7bjrNI3y+/SOJfOOn7TQch8IheqlLSkjpg5OxReCBt3PiPe7dgp9lc+1isDi3Cq
 TIs0uO1Wcdmm0gLgp8Dk2tfe0gQ0kQUjtHA8LpbjMToy2lrZcuMFI6sHMtCWEOtd3F/+P71NO5G
 HUkMIiiZJPmnSpSDD4CKg+ykuHddB2jYdwgBl7qlYBK9yOl2iOTF0ySM6lAvLbjUYRl9hPeX4Zv
 +JeJpPWRfTfCSdy51DXGPhHSEvWOUnZHHvM7aMnABoevFoTfflEEBW8cQTQL7Rx6pOew0FaZ
X-Proofpoint-ORIG-GUID: g5hRKMLyRvV17T4X2vwxwvXT7Gb9WPCZ
X-Proofpoint-GUID: g5hRKMLyRvV17T4X2vwxwvXT7Gb9WPCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030129



On 03-Jul-25 17:09, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Add SRIOV support for PCIe devices.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 5c01c23d0bcfedd23f975e99845d5fa88940ccde..3e6e2d38935927cf3352c039266cae7cadb4c118 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1607,7 +1607,8 @@ static struct pci_driver mhi_pci_driver = {
>  	.remove		= mhi_pci_remove,
>  	.shutdown	= mhi_pci_shutdown,
>  	.err_handler	= &mhi_pci_err_handler,
> -	.driver.pm	= &mhi_pci_pm_ops
> +	.driver.pm	= &mhi_pci_pm_ops,
> +	.sriov_configure = pci_sriov_configure_simple

If I read things correctly, patches 2-4 are strictly necessary
for the device to work under SR-IOV, so this patch should come
*after* all of these fixes

Konrad
