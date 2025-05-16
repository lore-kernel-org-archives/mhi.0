Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD927A106
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422446; cv=none; b=VQrWhPNQtVksUckgcP9/cd+Jsm99XllsV0BANcCbJHHHmMNnZY0LcJRnD3GT7/v5J0VM8EGsm9AWhy7SvZ2/AaM+WuSt9MeEc2eZ094nQ1Bu3HKT2m+rLwQrH9MGun4lnr/ufnHlxKVbrzsXem4sQCZ4ZLIx4gwCMVy7UJAPUsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422446; c=relaxed/simple;
	bh=6OMAleZ/ee9YO4/rsb0r1/EcIpx2FnUb2zPjPXqMYTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQrLyuS/DQkUgX/N7DX2yKSdXIz0KlElrAjhsNmr3lgs8G6wzsg0HhMAQNyjuPzyvXFCi9BWoXYLnr9RDShFjB4GSxvkEoOADKUUK0Zr38oA1dUCD+HYGg+aAtdzetin+1BgYnUKtAw7KZKj/YFrkMreGO0+ei8Hf/XWUiJIEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcNBF8mC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcNBF8mC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAkL5K001154
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 19:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=; b=QcNBF8mCDeyS5Naa
	0T8m/NLXdTMUNhPA/tfAQMn+l+rCX6qgTYgoGHGbr/2nCbMRoUv83DkADcWXRnzs
	+98CposOLGncta3FYfLQ7SyThCfMb6a+5++M3Da7ZCvgxXHGV3Bvr1O9KS83xG68
	4SegbEtYALcK6MT4ebdPPkvg1/RU9PnMoQO98unwPaOLlBT/jbVchSXIej79vOx1
	bavNeC1aZbwEnaMdbTqR0DqEIRYNxC+kVvafyuMoFRr39gA/eI4TZgrfYmZacZkZ
	69iEnyXf6BdClH6MsAGUAk0ngtahfqF9pVNplhiata72SH9VIEJHlrFR2ACXvLp/
	X5TMpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp2w70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 16 May 2025 19:07:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73e0094706bso3158108b3a.3
        for <mhi@lists.linux.dev>; Fri, 16 May 2025 12:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422442; x=1748027242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=;
        b=ST277FIznZWgV5PRL/icA+a7elnST0qQfsK+r5+cq/DWh0OPEF4wDqyGsiOUXCy7hY
         aPWHn8zU2ixBjscsn//lWo3Ufr+N0N9Mk5HUo0On6IyIhJ1aLCfNp0LeChhCu43Rgw0Q
         EJwEEb/sMWysEfidMYqt69iqj8V85i4AZr/zuEULqQmDPQAxfp8Vzpt61boRh9PrTeWS
         y8oRPcGbP8kTouhhJ9M0da0GtXSjk4kbtHCYKGcEw+F4T6ffABjqc5XlxPx3vHoh04pO
         bsD+UvFF5quCt8h1grfYHdXVzxF4iVZwdGq5dE3rcp0ailk0HiTIYygnzIKnHWy9FYn9
         HrPg==
X-Forwarded-Encrypted: i=1; AJvYcCVNj4X1AP2RK0WLxz9NfFkF0oBr9Iz7pFMSaFXfyF49XF2nTPHala9EUTQ9G+Y2TCsAPME=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW593Lb505oODCxYSMnID/OkYtRMda/WcOB9lGQ0YUZshBK6wL
	gBWJhcZDO/zI1ZDH9rzmQ1Gy4j+bp1wEw+m3JhzRsFoCBqBIpSt8Nv3Lb36vXHj5Sdar6cS2ur0
	jKfVBZTLMQQPZE8i0DcGxWv2t2uzZsUXh9Yhqsq9hqZ/DhjPhbX9I4gM=
X-Gm-Gg: ASbGncs3Kh4T1Z8gGPeih7mi22Z5bkNrZ7NRdlLVBEfRSpisjiBk1PQrrGL95kue9uc
	AX2dio2Bi/SRXry1wxvL6Ti4V2ttMlRb5WfEm5o4auP9mRWWpasPoMWLJu4unvPxS8jS2nvFCYm
	E6KuJaZQnBlQTfM8eqGgGsITz6n7yqyjzbM4zK+5e6KRSIA8mvG9ulF2enQlJmBZVJEy8wohbdI
	BKeno8J7NokqvcBkLLRyTgJrRA7CXHns4gW17ntibb6d3xzaWGydbiF6aHXA0qtoQVnY0oYkTpH
	Yq7bxg6fF0npt/dMdOHdTlYsA8odIfyuEulA7r++t3Ia8elpdAqvheps+QxLlQ==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579620b3a.6.1747422442024;
        Fri, 16 May 2025 12:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrLgC8dkstiJdx29E4dD097tJ0PNl82Z3nmB55Pim85MbNDC4YrFBzPEITGZxbyFl2dSY5OA==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579575b3a.6.1747422441535;
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876d39sm1914504b3a.146.2025.05.16.12.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Message-ID: <b0c132e1-b75b-490a-b2b5-3f5e5c7b99ad@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:07:18 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250514081447.279981-1-usama.anjum@collabora.com>
 <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
 <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r3M33ePfKJpRLqLqRl5HkCwjSe4VQ6eQ
X-Proofpoint-ORIG-GUID: r3M33ePfKJpRLqLqRl5HkCwjSe4VQ6eQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4OCBTYWx0ZWRfX+jwAu/aUtWOn
 Nym2OUsUSH1rZKEs8YKEb5XpJZR9o+3dRjgMERWr2oE5/HuzR2K6CtM6Uho6R3f9K3jpNBGKuu3
 ZCNE02ooAMGt2+SQVx37H4/GcHeLJuTkJEHrWbW4v5gg/roDob2q8TDAbQ/TjqeL2QNWTO073iZ
 545gH8DTuhGu/j6jEemKlMP0dF2Wm+4sP3DbH/1maVemTSv6z7o3TG9+U7xkimiPnb6m+YOGTfe
 4J0SXSvSh0a9kfkHRbH9AL8zPEG+NJIuNzEWaew58oGra97uTYozdmEeBPKBz7ytlwwXE6EU1fu
 Gp34GTsasnSxw8+dpqN9Uj+hCJ3DvFy9V58s/wqKFAWJ2ylwgHZFSFirX1M2S3XS7cerdks8w5G
 4XcuLCEcqhFySzpYIYfJMegcJ7sQzttqcXu0nIqkjChwUA/pjYT1g/bImAAH+xMaSsZsxkO6
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=68278ceb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=REsDF6D9n_RRfkEuQ0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160188

On 5/16/2025 12:42 PM, Muhammad Usama Anjum wrote:
> On 5/16/25 7:59 PM, Jeff Hugo wrote:
>> On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>> allocation because of memory pressure. There is a report where at
>>> resume time, the memory from the dma doesn't get allocated and MHI
>>> fails to re-initialize.
>>>
>>> To fix it, don't free the memory at power down during suspend /
>>> hibernation. Instead, use the same allocated memory again after every
>>> resume / hibernation. This patch has been tested with resume and
>>> hibernation both.
>>>
>>> There are two allocations of bhie; rddm and fbc. Optimize both of those
>>
>> There are 3, but you touch 2.  I just commented on this in v4.  Only
>> touching two is fine (the device for the 3rd one doesn't need this), but
>> the documentation must be accurate.
> Yeah, for 3rd one in mhi_load_image_bhie(), this optimization isn't
> needed. Let me rephrase and resent v6.
> 
>>
>>> allocations. The rddm is of constant size for a given hardware. While
>>> the fbc_image size depends on the firmware. If the firmware changes,
>>> we'll free and allocate new memory for it. This patch is moticated from
>>
>> moticated?  Motivated maybe?
> I'm using checkpatch --strict --codespell and hopping that it'll catch
> typos. But it misses some of them. Do you use any such tool?

I use the same. Codespell is nice, but doesn't catch everything.

-Jeff
