Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F62EB5D7
	for <mhi@lists.linux.dev>; Wed, 18 Jun 2025 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257696; cv=none; b=E769rEIJlq6NBtyy7qwQMX4yp32qMOIJL21WxzO122kRFVHM1T5Gux34yxZuoM8QuPkBNt2k+8HM5p0qxoaDE8vW4lb8r+poNJeo6gAtuVb+wGo3CyJde4bL5vcZF+ArNtN4g30GYdLgITQa3Zc7kJR/N3Yssc6IcQMln3IZ/T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257696; c=relaxed/simple;
	bh=+/kUoxpwy+yvBDT++5o5/YrPxXFnUi+BeFnYK1qWQvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzS/PfrA3Zql7GHlKFTD5XvtQjLnn/7zSuk4mGj5FhbrMX5AAVDaRlAtrXqSnPnq2/UE3OMKmqsUwd2QRwU4+2U9keAwOCj7OUhZ5rZItfjN5pndXpJJRH34QnXbwSzxV7XV/WOsmoJ8NwefpK3VjUg0sENzykhlDd5b4iffnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nccYx1e0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nccYx1e0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ICH5cU013681
	for <mhi@lists.linux.dev>; Wed, 18 Jun 2025 14:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdkjN7cQtXvfbdtYqO2/u7xrAMjNp8r9I5gqRta1Kos=; b=nccYx1e07IQHOsLw
	3n0rbXcDloPJuBMwJrU6efqHyKIThbaVupKDI29g2NCgYowrgri6erfjm7Pt3HRY
	LPTI4ckHVpPcRXeFTROyLurlpS6DezZLa0RsjLNPoGbXTLnShzC1FbUgq9JbpOq9
	bCzPVKpCSAvwbM6GkWC70iQRpzGy7B6+9epoGY2SXJK6UiPIu/9tlDH3LeAWDOdt
	zJ+UUedO50PlgLwPT+05XYT+RIMCXGsKXzYfVUatWVraL/cV4utRYH5AwJ+2aqUT
	f9csXbQKjQy2seFAKABD6s+I4Q8zjBMWxNRlZ9yyKJzg9TIEZ0v+ZNEigXgvuPwa
	53OQLw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5u4y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 18 Jun 2025 14:41:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so7804519a12.1
        for <mhi@lists.linux.dev>; Wed, 18 Jun 2025 07:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257692; x=1750862492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdkjN7cQtXvfbdtYqO2/u7xrAMjNp8r9I5gqRta1Kos=;
        b=xOz548VXJhrePCRtwgj8wtcdPqDdlr1ud+3WFeEUAtzPC24Xl5IruIR7nXWzzr5Q7D
         SKDPd9sTWOm++MY93TAufFOe3JDACsky2qnYrK7WGlP/s+95PAiQVA+wvKd0TZqOV0iI
         +vRd3+zEq8fkE1sGw4dC4XUwrF8LzT+A+uYHMBGn1+vwterqjqRi080ApMIOUR+F7V6w
         m5oqnQD98eCnqi6aY6LGbgQZHZXA0IJq71UUxFhoHwYSOYm9xhKqg/uQFH6c20si0l/n
         aOUHiCfXL/yJER9eODUubui9AehXUEIyMKnruMVfOuhJT+FDw0GhiKY2np4kKPFoIh68
         dWLw==
X-Forwarded-Encrypted: i=1; AJvYcCVZZ9O8vxvqmInjh5HvN75251MA/NsDvdhYIvjTX2Ee1WtZiRcBdbu00ZlSMNapsNgupGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhFOlXMrlknmxd/jV13ddmER8wpKOdOQaoon5NhSCQCKHT/4qo
	7nnSaiyaK/tteTnGisYCfJff6oED3Nssx09waqyqpo7yZq0Ahh9jF0ztlJbPbksgh4806ymAXBR
	/qGGmnXBSVCep9e2uhvnoxUEDkVDjTHI4hP9ArsL0Dflyaj9k9eKnhqA=
X-Gm-Gg: ASbGncuLyxhszpLJkZlXfe/I4HGLq4sAAW/xI8AN8hKUWWRprfpppWKhBaJAD/haUfE
	+UHGw9ZzGYzvUIJQmpjo2hMazjtZJB35rqyH9ukUclhiORcqUd/PqGlGx0bxh+aOMP9BrJeAyrB
	/fviIJFKKP+0fh//FdylPk5nULYJv6NNRL+7isF/NYytC+R+cVxidMyC/b7imqRLiIGDSDvWuWp
	N5T9fouoWxkPcyrpT6ivfx0RmCan/D0QpiC4n1de1a1nq9nZK/eqYX26G4C6QxX/Au+4Ztanz7I
	xgRwqeykLZDqVdRW4LneBj51HI4v9ESXow8xFdidSmeiusBpe09BLYl03kZsIi6wl9AOK+lD
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr24251103a91.29.1750257691655;
        Wed, 18 Jun 2025 07:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmA2bW/1zuZ6NhOSuWKpqZfn21PWtERB2Y9DfGzXkHDK1YYr282G1Ivdt6vHyvyU6L2Njbtg==
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr24251066a91.29.1750257691162;
        Wed, 18 Jun 2025 07:41:31 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5efa2sm12826992a91.41.2025.06.18.07.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 07:41:30 -0700 (PDT)
Message-ID: <8c969e2e-e1a4-4c53-9a83-b11debf3615b@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 08:41:29 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Make local functions static
To: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250617064906.14079-1-mani@kernel.org>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250617064906.14079-1-mani@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QsPOh-zHq9xFR4m6h5accE9uXEv6ADiN
X-Proofpoint-ORIG-GUID: QsPOh-zHq9xFR4m6h5accE9uXEv6ADiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyMyBTYWx0ZWRfX/IaNHz5s2y/3
 XUx/PdDVMlcZjQ2QsMoqFauyCi/r+RGkifFm51uvMVJdnu5DP1VYYiq4oNmpHeMk6cDKoBGdaED
 5BOpjzz0vXgxiXY6Wri9vKKmjlQfZTWQyE/nJQzU7ZfPaf/fX3XcI6Y4VbRIpTQ1MK7AVUAwyWs
 rTQF5sp9uVR4ya2myRaLowW9rFtyXYTTGtIvJZbrNxs9NSaCy0qdYI4QXzyeio8k7tw1ntcSoOW
 ED1LfjGu+zR5Q0/BOsABzoImdTlsUgouA1qN3DuvmECi8Bni39mcnTqIyMCmtV0ULMlC6fGNlPL
 MzOUw9hELPeKibgKOPztGFRXb1J5fyQtNTm8qQbpL1xoQaqxWeE8StgvpZjv/EEn8BLoVpoMBQ/
 qilffB9dl0rM5WjdOvU6C2a8ZeNd7+beDYHG5tI6e6jVjR9j8fhVbJbcQMfMWdEnWnx43tdp
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6852d01c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Bs19kDPuFU4Rk2GLDhQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=952 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180123

On 6/17/2025 12:49 AM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> These functions were not used outside of the file defining them. So make
> them static as they should be.
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
