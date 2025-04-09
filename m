Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E325F788
	for <mhi@lists.linux.dev>; Wed,  9 Apr 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209669; cv=none; b=HVSbIMI7grzJNj9dTlCMUc6ue5aAID86YwZXBwJ2wGMcnOsQnQnM+7LXwe36I1eSM+gntIwbU4v2nxj1oqNt2D1VElpsTcm/7abq5Yc9oaPoHF5fZsO7lSk60bUJeIXmN4maO2K358xrDUKlxH8zBSNmjjOs8aecWhtau/TKxio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209669; c=relaxed/simple;
	bh=+jAaxo1TCO741+kpdjVMq0f8msIm1aVBprj7vRnZB9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4TDyp1Cvm2iDg6vxxa99UYMtu8nfYLMjTmQ62DY4VhscboTEfYYLcFi1wTbOQlBMlgyhd3tzbSxI+6+fBvsCZTfiwcBbjEu0GmEk8SRXyvDpBTuNeb01VtVuJbxJskJYcraJZO0qKoiuRhvaW561+oBO75fUq40093/NhHAF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jT78wl4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jT78wl4X"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398d50w029098
	for <mhi@lists.linux.dev>; Wed, 9 Apr 2025 14:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LG0gqeloi7FE5d7p16XRDqhtX9K2zsgebX8qfY7Te+M=; b=jT78wl4XukyH/die
	0Bj8lEldfMDGVTa0F15PvGw+qHq7UM1o5hBL7fEkTv11aZsQQ2DLxkbUe6+/lYJF
	yA8MnajdBub8F/6K2aBBkwAiQIyHxcdxbPVyjZ0sDnWcD19cboQV+htqOy+LkniG
	fv0y5RjvxHdjot7WZtMdAjqIdy0oosrn+QrYeCwNWIDHjM7TlAUOmYt/x+gnhr+E
	HQu+GdrZu/vK0T5qZNSV39+VBK3IVqdUwONzswXj4k1o7Fn2tNlLsWe8A6Dqqazc
	fpITKQ9NJeufUQT5+dO5jTIW6GW9pYuXsAfiG+28+mhLK1MwQwem0i6YCxAO2u1t
	xyn/Dw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmbkbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 09 Apr 2025 14:41:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af5b9f0e075so3211775a12.3
        for <mhi@lists.linux.dev>; Wed, 09 Apr 2025 07:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209666; x=1744814466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LG0gqeloi7FE5d7p16XRDqhtX9K2zsgebX8qfY7Te+M=;
        b=rjCBt2Y8n7UUnR8JY/E73SsVeKE3o81pz+IqXo6rF/4mKKtVCLaz2eJ/5uhgo5mu6a
         aDADvMD+Pw/oZ7QowIt73XCdeyHW3zUtFQ6T2hZii0nxR/jXjjZXwEha6PWt1FmPMOGX
         2w8pOFqvdVU6Y8fIJ6rxFvaya+cd1unWrzmuCRdoN6g7fjOptxX00pGrNA/J7IjYA2SA
         /CjtwbJMIdSqohKXSmVOJXvVHmlWCCfXC0tmP/xoKvfiky5D5dDegJ59v321lnqqbvLD
         4peRfO/PSGV9YTU7GtTqGzqybP4reUSozjUOCvIRTogvKJHXqqHXQ3ZWSZTNv1LBCQJS
         LP6g==
X-Gm-Message-State: AOJu0Yz2EYo8bSzHkiwqmL1TfYq8oOaKKAjSO3wR4ESHCSLigjxOxm02
	pDcLIYPTn2fNkQ4nHEhqlFbCdC1YvDFrj0YKdrXiMPSfTokg8Cb3zg1UPVRz0ZAaGruoNyPLVR8
	KHe5whOCZU1ePlVhbBNWH8vGIJy1Aa/406D00ri4uIXXHiQnHeLA=
X-Gm-Gg: ASbGnctFrqORNInB3HGAjMeDbMl2HhqzlUKUemtG6OeEUK5CO08MUqk3zZAiTQz9IXw
	eyZZ1K5Yg1ZEYx0DPk25Gv1EHrcGmBPnYmU9gJ9+PNVQ2JzsUm2iDdlY90FnUY/lgW9cqfI2p6Y
	f0WIckIyB8QkC0eMeP5qc+Z8ah3TpWCJsR70/vRwuwieMSpM25OITal6gevgRCj9DYdpyk1ED6s
	TZlKRlu1XWXgG/uHZORYv0tpBABt25JOZflMdJH5bC1AdPlG1e46Os4UeORS2OHahYaO6oBO+i4
	qzTdApn9aCsaQLSTvPzkolxVIvwxJ6jVwVSxg8diIHDS1Pgq0JwoP5ptTq51Mw==
X-Received: by 2002:a17:902:e94c:b0:223:f408:c3cf with SMTP id d9443c01a7336-22ac29a7d9bmr55332315ad.21.1744209665717;
        Wed, 09 Apr 2025 07:41:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPfuY6hqgOg5etkGo/HTOxudMRDkIQgYiO8YJN+34a0GSOQamTjc5qFyXZO44KKkIKLc2Acg==
X-Received: by 2002:a17:902:e94c:b0:223:f408:c3cf with SMTP id d9443c01a7336-22ac29a7d9bmr55331925ad.21.1744209665320;
        Wed, 09 Apr 2025 07:41:05 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6511dsm12744275ad.7.2025.04.09.07.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:41:04 -0700 (PDT)
Message-ID: <27642cab-9d0a-4989-9f3d-68f329676674@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 08:41:03 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
To: Sumit Kumar <quic_sumk@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_krichai@quicinc.com,
        quic_akhvin@quicinc.com, quic_skananth@quicinc.com,
        quic_vbadigan@quicinc.com, stable@vger.kernel.org,
        Youssef Samir <quic_yabdulra@quicinc.com>
References: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bh0Q_oge9hjRtyWD3A9XhdC9ukddu3aV
X-Proofpoint-ORIG-GUID: bh0Q_oge9hjRtyWD3A9XhdC9ukddu3aV
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f68702 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Mw1Om9em43-oCLZg1R0A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090092

On 4/9/2025 4:47 AM, Sumit Kumar wrote:
> Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
> before the buffer is written, potentially causing race conditions where
> the host sees an updated read pointer before the buffer is actually
> written. Updating rd_offset prematurely can lead to the host accessing
> an uninitialized or incomplete element, resulting in data corruption.
> 
> Invoke the buffer write before updating rd_offset to ensure the element
> is fully written before signaling its availability.
> 
> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
