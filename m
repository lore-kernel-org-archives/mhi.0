Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA617A309
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752675341; cv=none; b=NEKGcb5ad3oJQ4qgX4glMzSL1M26dyJboYj/qcq1SVsFZxjmqqz0AJ9lE54i6LqWQIEd2M/IJpFd+wCnsDIpSUPXPkpIYB1kpOm6E2WwStHVqTILZSBtutvXkmMt5pmUjXvnpTZ/QPvMmWG2q02xCJDzR6i4y9TCaZcWNid7nMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752675341; c=relaxed/simple;
	bh=JM80pgGqNSa4r/1vOHTvUpEsPtwkf06lWm1xdCxMrrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I05v2KNXRBDgvc0wskDImFZ+IZ2Jag946npmKMZMeygLunc5Hb21Sb5HOK7LUKNMe/vRJRIh2V7Lq0Yp/o+AIweyG4kfUsYAYSCIEtYXkg79PcScVOzm8hYR8zIvbJ03ZaIVk75jDvXZz/14LHQmt+5Ft1dn8kCWD9ujP8tuOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQisyHV+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQisyHV+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDX6gg025993
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9zjZD1JwF29X/cyV1Xb+ZjTmA7YHte4xWXBEMM0XvM=; b=UQisyHV+KqmcFjSl
	rCLcayOJFkx46Drbo9MLTLmh5/9XeUyiYU/SlSOQrIHDSoAXy/H2e6dVGEX5ZCCa
	FkI7RvNi0cyuc3U3QtFubBUN8gLQ8L/L4QeuGtaqYQqduf1mB9fhyW3kNyhhA8YC
	xVgaQ07tTDSYuYNQty1ssLfQUpbp1/9o6jOz78kBhDST/jiFyBqzwDblehNwjBfz
	rfj+oqI6kpjkaQjeiyN7+dzUKFxzfBJh0u0swye7BaZoyVAwhgJaawmXF4aw9/Co
	o6Vd6TvHX0dYXJp3x2BdmxJC6Y3VsSCMI0i6rEKUkYIkk8FPr03yUdFFMRt/CJ4S
	n++75Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca5ceh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 14:15:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234f1acc707so53285775ad.3
        for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752675337; x=1753280137;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9zjZD1JwF29X/cyV1Xb+ZjTmA7YHte4xWXBEMM0XvM=;
        b=j0sN3J9Vs+B0Z2A9cI1uYLHcu8NwMD2HrW2vsOBMP10fpgog1tbOVwCnM2SLAXTkKi
         ibcbQ09Q5U+Wl95A2Xu191QQkEa5V5gSHyjKeSeaahcGMbEVLe1LFaJB0QvXOIeeZZCC
         pIh00r0s8JX4mrp5BLN+xCrSn6j/NeRgGn3lqiuI4vfcjmNt28rpFw5h2krV1w7NyTMN
         6Ynx8KYw5nyH4PqvTE1KDu550BcIOf/XUlRmd/KLOpvax7J8O+kwxOt6BzT83X7DmwkT
         J2d4KAATSR/03ZSEevAzrLsm9Ae1Sxb7BOdWgAWLPWSskNJ0bj99b5AkOSSiM40cFiic
         wDtg==
X-Gm-Message-State: AOJu0Yw0e9//J/Ln09xrA54/r2oYaYb+EIEBJvdmF0X2yhWQwCG1O6a1
	/b/NnR3y/CCBmOyuMQqTPgx+q3whGBtNO70T0kcExUMpOGLdpTmQ63clxZqv2ke9wzZbVfzgphA
	oHv6gqZsuJNWhcfxyBvyWnNv+QcYCbITLuf2AIAXe5AYkeYUEJj0EKYo=
X-Gm-Gg: ASbGncsEGsMpwcBMNPvPlRM4n1FhIJrSqlbnfMGyS+ce/TqN8bz8Z531fPwpZ5tvYBi
	xz7EwrYUPuoTLuMsm0oyTjSzYTTrE4I8FczkUraGdRBHSYAJFPShQj8SD7z/5pVYjRlJsvbQBlk
	lA6LJhi9zAuK+vNBPikGspZ1dbgemY4W+8cqSe4ZiiwkCkFXDZS4nlxgYBA4ouD17dB4medYdPj
	hSZM5vq8q44UTSLctvChX5hiUFFvUIPp5peqwsVK9FV9ScmSCcvKfeHr/Bb4kIfIAg7Mbv7mmu1
	GWTni0TQfvdXRnG6lFDL+UCgthUbI4mB6Tjts5o5y8qeVVBzGcRLbGxIR8gcdFN4aA+h
X-Received: by 2002:a17:902:c94e:b0:234:ef42:5d65 with SMTP id d9443c01a7336-23e25789acbmr47265575ad.52.1752675335675;
        Wed, 16 Jul 2025 07:15:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG74Q3jl1MnboneV64yqd1rgw3JWWP2KPimRq5deOkhvtbRiElP1WmxRnvY99cP2KO4ZvLKGQ==
X-Received: by 2002:a17:902:c94e:b0:234:ef42:5d65 with SMTP id d9443c01a7336-23e25789acbmr47260985ad.52.1752675330552;
        Wed, 16 Jul 2025 07:15:30 -0700 (PDT)
Received: from [192.168.1.17] ([117.213.98.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322dbdsm128971105ad.127.2025.07.16.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:15:28 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20250716091836.999364-1-dnlplm@gmail.com>
References: <20250716091836.999364-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN990B40
 modem support
Message-Id: <175267532620.8017.1596070646216091764.b4-ty@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 19:45:26 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyOSBTYWx0ZWRfX8IoywVC692jo
 jcTIHY4GjsNggmODn/tK0flHjIrey8G9keADG3L5gBBtJ6UOX2AMavzyfYCFz68+xU42XJZYAIf
 bvs14lbyObd0msy+8A7TOeNjddTfgy0soLrkOA6YzFAInyoa0gNbazOriRVXuM4ufmCleHDOUuE
 /y4vkix0Y8t4WBYKAvvnj5AT5UK/P+JZHwuhsOIXLxKomuMOpVGNsOV6lt2rhJ8BNDk23vZ5K5P
 I4jBl5tESj68z+1JSUCI5HFMKFVpIbZMkeB3HMx0YTpRXQivZDG5d28OssaJPUadZmLg9q4dR8g
 QTnwhqwSn128ctRrh3D5/rCLecEtmtKySuFslt1v2R75MK/kZzsttxCA7n3WJHg+jJaWwB9lBxa
 pObJqqzmCdsCkPxT+6b72pzFPFCPh7yQvxeABh7BZ1ch+32j33nuUPmwL0HehTbtlg1VShTM
X-Proofpoint-GUID: JGSmxu1JzwgItFbtNwr4ToQE08qdJlKi
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6877b40a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qwM7zxNKp6jzn47FiYk7ew==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=J6noarIePAt8HtWXbDwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JGSmxu1JzwgItFbtNwr4ToQE08qdJlKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=958 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160129


On Wed, 16 Jul 2025 11:18:36 +0200, Daniele Palmas wrote:
> Add SDX72 based modem Telit FN990B40, reusing FN920C04 configuration.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 0309
>         Subsystem: Device 1c5d:201a
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
      commit: 73d370ed82381428d76d602d74f5806c77d25b09

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

