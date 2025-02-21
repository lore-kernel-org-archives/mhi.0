Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47DD2505D3
	for <mhi@lists.linux.dev>; Fri, 21 Feb 2025 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740159547; cv=none; b=bSSQMfq4UkGjp1F9uL/nqlmvw/wyfcuYe0Xe4zkGP2H6ntfqwqfUC0ZknKarLOTAVKEjE7ALLe+0fPDoxVYk85EPaHPKuHWw78/fRV/AHhCCKkaZ2EIxjdOZaywUT3TDNFmuMnaWUJAC0WrEVOdq45jsh8Rsg3NovQ655n/lbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740159547; c=relaxed/simple;
	bh=KOhCcI2yI/By8AaFG8mW3Fzk7l3kPtsFZtd9VcCZeb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/y3ykcwg82Lfbjne+ve8QUeN50Z3uwrsiGH1bh+kvFqWaHH2uhZwFzaaLwisfl+4vYSl9QK6lAfyAwn2NBWr165AXK7mqF/2ZytGEUHqboSLjlKk2w6Vqtc7CZxxnONV8VFIhgBRWqkpEymq1t16u4WN0PfnRnqZq36j9cl8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUZwCVv0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUZwCVv0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDjHtZ011722
	for <mhi@lists.linux.dev>; Fri, 21 Feb 2025 17:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJSZPZcYP2Ku91jA3cNCQdXAiJurh9tb2+YQBdWVSRI=; b=ZUZwCVv0j6gcP3Ol
	y4QrFrKnpNP6ezP6ra+jV0NLBs9dnDZYaKTeftAJMcDoJxRZfAQ/MLetUSQ+KRuG
	x08WpcWk3mrJOPSBpJZLdUpgLg1NMyCb+cS7im9iAVXVExLve/1PAE0YjCKJZ7OU
	G7iy8IBWzj9/oFJzm48LD6ycb9xJtRZBvPmhnnyrM7LBs3IjViB+G6aKXFv+iJng
	vE0l/xkpztjNl657OlOVVZJDzFBgGMrgbZILTag4swpnsMwJUxJ77z4Wr0O+jyZN
	rbu1HXlfgBY00wfjROmImC+x+fSMBalVU91CvS5fFs3MzwZgcDifEmGqzabmIQMk
	rG2VjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3tqu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 21 Feb 2025 17:39:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fc5a9f18afso4664250a91.1
        for <mhi@lists.linux.dev>; Fri, 21 Feb 2025 09:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740159543; x=1740764343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJSZPZcYP2Ku91jA3cNCQdXAiJurh9tb2+YQBdWVSRI=;
        b=Iy3iCtYh5PLQlBB8hWFZJ5geox5/gsT+pRONR2nEYGjXLpwYeXersDLPhHxMP8iaks
         W0rK76eHGZFgOtf1wfdc+ZzgTsTlOnGZr0ZLt5jkB7v+lZlfsus+BXuVDrvxiZvQCPyG
         FFE0ysHZPJ1Do0HObi/14ysbWz8ACm1IPkFmOz2bgjH5sw37xX3fi9EkPnCbrEovIJ/+
         MjG0aXaU/ik3HCnsl2uGFU9hAHi7+dEhPowg/37mDsYA1tMQWD32HF9SFZXF/WsL7Zgi
         8qYGf5PRoheBoMHWmuLQgIJr2YRZd1I6abIIlASdvmcZfeBQntZWJo3Jq44vOU1zHZpq
         jE4g==
X-Forwarded-Encrypted: i=1; AJvYcCW1uusavrLgZ47jYwHMCLQU2yHqHxKfMoNp4IxMpP7hmc9ia9P2Np3BpnwU1DviGpch7UQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwghwZ768sh+xk9LXw5MwnQ6isqBilRzRFoxjdwopOlmevqS3ZC
	gMzl+SkpdMJljnTAdbQNWxOByxzoZvdOsG2M6X/fBr56Nw4Ldp1v1UWjrGVUG47s0SfOM3da16S
	c633Bm3+/KpQlzA7COpJ5T53WD3JzVzXjI0rLybHgpK7j55VXa7k=
X-Gm-Gg: ASbGnct9Qdnqvp1uyBvqp2Ep4mtYOdslmB/zifj4BcPLy3+wh8uNzeW2tkmIXsdWxFa
	qAI27mEkqYmFy+2r488ThPGylhl9PnkvLfbUEsLq4mT2Qd7Eyj+1rHqTkqYHh2tLKCmisXg71X1
	A+Y78Sq0e1Jw270r2tQQp99PwOqOd+qijzJbXTTKgv6v0raST73aSTsQYExi5Ne37LH+OTqgZG8
	PSCZGEkeq4cLbDNMXlDUYGPUXA+tqKBnI/7T//BDLT+9Pa5US9N36PEgO9/KcoQgk6J2VkQvS9X
	04BwHzd6mj32cXj/3IbmgBZF4reDQhooUHeWxyyKqWbw1JUE2pTHqzWaJGaIE3DAAQ==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id d2e1a72fcca58-73426c8d910mr6952844b3a.3.1740159543058;
        Fri, 21 Feb 2025 09:39:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqXkz8zxBhllIdfokgGDpZd3ZGYeLK117KPq9Iou/QAcMb2F/WpEbiYZCEY3zGYwBgVKo84w==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id d2e1a72fcca58-73426c8d910mr6952649b3a.3.1740159541244;
        Fri, 21 Feb 2025 09:39:01 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546177sm15929995b3a.5.2025.02.21.09.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:39:00 -0800 (PST)
Message-ID: <3294d770-9653-478c-bbba-7b76d1970270@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 10:38:59 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
To: quic_carlv@quicinc.com, manivannan.sadhasivam@linaro.org,
        quic_yabdulra@quicinc.com, quic_mattleun@quicinc.com,
        quic_thanson@quicinc.com, dan.carpenter@linaro.org
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        dri-devel@lists.freedesktop.org
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u51qJaivXJoE8p_Hj3x6TVSi0jszUwQu
X-Proofpoint-GUID: u51qJaivXJoE8p_Hj3x6TVSi0jszUwQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210123

On 2/14/2025 9:21 AM, Jeffrey Hugo wrote:
> If mhi_fw_load_handler() bails out early because the EE is not capable
> of loading firmware, we may reference fw_load_type in cleanup which is
> uninitialized at this point. The cleanup code checks fw_load_type as a
> proxy for knowing if fbc_image was allocated and needs to be freed, but
> we can directly test for that. This avoids the possible uninitialized
> access and appears to be clearer code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>

Applied to drm-misc-next.

-Jeff
