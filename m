Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D71A3B4417
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596303; cv=none; b=nnRL9zb6pG+lODHG9HFqGgPsDHOTQelfJiZla/mUCFP3HHEqrcT2/t3eP2hRSsM17OGK6QQqjpx6LWkcxqHpg5ru6cMjvEv1u8vdaW153efJeYgwvMPAYsHmf0eQBhimId+ycONPHZLy4GGUuHP7gAvNmBU6GR5rlSWW5scDtZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596303; c=relaxed/simple;
	bh=7hhhRjovjPTte3B6wdcGjtm8ufMVjN7VfBtqElp6qJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UwE72knh9ENYAtk9ib0Z+0iUtjvO/q/JY5TjYUv6i/V1yUz4UG5XLV0XdfhNf30qp8VnTxm2/Af7hsevq/YQ6346iPTjOrwFAWs0WSluqUG2YtbeqJdoypmWqxQg0PFIC+abfL/MIEUJQ4my8v3C6vjDNWdGZRYc3Z/UW06pSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp3NkvFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+QVLaYL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp3NkvFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+QVLaYL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CEJ7fl423741
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5ohXXZgSXvgAPCzQfBUllGq09yWK4vhsb5Zm7evNUk=; b=Tp3NkvFRXj91BNSH
	uG2m+rFwjZT4c7z+hYQwCwLOHFmCgTnZuusf08MjzCiAIWCMrJQPp0KDws65S5DP
	Pb0UL/o13ERsQXiOltwcY9CsPAAkCNEw07dnMTXIyZRTfiEn9m/76cIjdCtX/7el
	vvCzCpufkm79E2f2HTB1VYFjMtoeMBXsjVfPZLqu2zfp3ng46abQyEQzvOkgbkxk
	PFG5xg1T203HIAkv2uwegL8ddv2tNxHYCZ3zYbpFWsQvFNElsFRf8RMo46KZ32M4
	zcMVlQgi8u0QjgvCQFGmnBwEp2vkDQ2gIaL+F3nCrjmh1n8Rk18ul+0f4Lok08fe
	sOZ1jQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45v581mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:31:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b458add85aso61246645ad.2
        for <mhi@lists.linux.dev>; Tue, 12 May 2026 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778596301; x=1779201101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5ohXXZgSXvgAPCzQfBUllGq09yWK4vhsb5Zm7evNUk=;
        b=E+QVLaYLMZ0n6j27iqigA2kkN5fdvQpP3LrPeWjg5DS9pebnZB90ddQ34aMSX3k217
         c+mNX3ze5Mat4sO7sGEliYOAadBTxKeSw8+Bk6M4unATRmUB/Bv9VUnEMjgbPrGjJ5Rs
         aSjXavfp2puF+ZYYkyv6sQpkkB9XyeZAKFzOZuAh1opdQAzuXCO7vLBj9v8iXkyr930v
         vYH8rk0WgM7IvSS7WxwcNZTFuPA4M1/obu1+Cqsi86sSzmxFcvXqv6H7DyESUIYEwZWs
         e4twiGWQyCcTZMntb3IrdiONKuUeSw+j+MWP8vt3qrqWrRrJ436U8hXu6wI43ryf7UAK
         ETQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596301; x=1779201101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R5ohXXZgSXvgAPCzQfBUllGq09yWK4vhsb5Zm7evNUk=;
        b=irkPWIBi38/BNwGKcu7/DMbEAIGzWPh48kVvnOWxli51dnYzxJBWiqbz6BFLqgoxjc
         eVlXkmxehrvT5zQirqckLrJZBqFRsUYgkrs4ebbI8+saEeM8iLrzdSf+W/9RCAcrD5e8
         heqbJBByeRygMtkD/qgcoTWm7pmIQ9AVsbbLqh0zowfwiDuE2OVzO24jwNSVbWC1D2FH
         8xE85zi4ADHwD6C2V4rYh/+JiKPTNFHM7IrfD2u3hfiqrkcf50mbpYAqZF4zXg7fDIli
         jsnx48AukXCHFaBdRM9pFFSELs+Eo700kjCQBqtWoN6+XLRZb278ZmMZC+DF/dkwd+Jp
         hw9Q==
X-Gm-Message-State: AOJu0Yz4wVwa6Zt/QbKzfM2u7fse8zWNHHIE8CZ7zw8DaGfHe/XL64ji
	2tn3YuXN+XYt04gmlYc05WcXL1U4y07gdxf4XX3zo11a9vB32Mkt+WHplyytHRB1KK5WPZ/YyIH
	4/4PHL+nh64hHCzrb+mFNVG6Z/mfby7np9Rl8zTT8lqJIH75xn1jetCs=
X-Gm-Gg: Acq92OHitnKO2DRGvaZ07Zf9aVzQjVPPRg30xlsgrLQ8duwwvwVrg1+l+7+L1JVtdLm
	ccvWO9ZOhT+n0YgcPPZRIplBYG0mxLJEDCyt3Jr8Sn1REXql+jFrOLNfd796hYpnZz1wwXM8m9k
	7wxz3MPKiILgnGvSrNfyGaoeUM9OjHAoGl33mqcLzeFKRyc6gJigO6NH5P9tonGtBjsd6+iJN9C
	Pu7oiSZ3Bu53AxRS9OEJ60Vl+RWEaQPPwvGTfFfxy/mFaEJ2x2eRJQyzrOhV0VlKh6aqtthqdcB
	fqu28WIJd812U3tAqVFzAvVaqbbms4OS2so0aDUe3tHTe22DeqxKs0ZDDSvxr0qZkLBbnkcxcq9
	jDpxNNch8gqhNxuw8U4pzPkzjZA2yBwAXPofGeZospCGIfCqG1bg=
X-Received: by 2002:a17:902:d58d:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2ba78815137mr279781595ad.0.1778596300491;
        Tue, 12 May 2026 07:31:40 -0700 (PDT)
X-Received: by 2002:a17:902:d58d:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2ba78815137mr279781085ad.0.1778596299919;
        Tue, 12 May 2026 07:31:39 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm172053135ad.36.2026.05.12.07.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:31:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>
In-Reply-To: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
References: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] bus: mhi: ep: Fix state_lock protection issues
Message-Id: <177859629568.33665.17821318659003134419.b4-ty@b4>
Date: Tue, 12 May 2026 20:01:35 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1MiBTYWx0ZWRfX2m5Jl1fklLco
 pMTxS+ReA6GAfEza2mCdFigGyXXrkcphb5c0ERuS8Ok1bST99fVBXIleegLoSpCs4TM0aOO0DcE
 zIuULPAXGrMgbhBjMJQABNi52hbhRBaX2uu1dY35NwOwwbxr9hTkI2AHGaP2+rJh8Y+5hA48e7T
 aVvhf7iTi0Yg+2BEuI5JMzFBF3OhhEhcROQjxAurUsQJ6z7pTOgVQUNwZKKFo0rov92Rl//aVdu
 lqzEUF9nTE620PptGEkx9EBzFAEKY0q1RlpgjZ5FQ3eiv4OsCldZaxqJ3XVQlLvvKEpCrONCBOE
 fGqZScTG3jEwW1gVQ8U4gpkIustPO52LOQy+1Nqn6887nglTM6iTV1+WwOnmRkxY/NqYPMXGe3V
 EXbPSGufVYx9Yz7gyBZQ5qLfoxS06D496zJ1twjMAkueeMxeSCBRM+rgj0zSP1Fwy1IkCDyyWq7
 1XG2+i6lZdnIsBePnjw==
X-Authority-Analysis: v=2.4 cv=GZ8nWwXL c=1 sm=1 tr=0 ts=6a0339cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=toWtcFszFmKex18n8fsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: -MC01uhDEMD0HxxcHk3p8ncF_8UYvm5c
X-Proofpoint-ORIG-GUID: -MC01uhDEMD0HxxcHk3p8ncF_8UYvm5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120152


On Tue, 14 Apr 2026 11:59:39 +0530, Sumit Kumar wrote:
> This series fixes a deadlock in mhi_ep_reset_worker() where state_lock is
> acquired twice, and adds missing lock protection for mhi_state access in
> mhi_ep_power_up() to prevent race conditions and state machine corruption.

Applied, thanks!

[1/2] bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
      commit: 9dece4435d396e9877e27483552b910ba8654169
[2/2] bus: mhi: ep: Add missing state_lock protection for mhi_state access
      commit: ce3e534ee9c8d13a68c8a611c3b7bd0c2152d2ab

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

