Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246702E7649
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 05:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644548; cv=none; b=bJxsytnaCGEtuLaZRLm0l1vZExVOi+2WCqzOluFLr3pc1I/9G5gOaO8WgVnbIcGCRtH42cQhTd4uG0u3YXy//OQ9uRVoy0GCFE6D6xnFaB60+TGv/5y+ZCs6igSXA7a4QAXXEUlyk6/5C4NtpqK2srMcTXpA2u5xDIE4CjnC6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644548; c=relaxed/simple;
	bh=9emCwRX9uwuuSwtfrYrmYODy1rDggg7R5huWmDv5WHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iM5iNLFqXc9BD2M0M2e+flBnebcg/9tRnDw3QvNiBccg7V6KgE7E8aMXwvW3pvCMujh+5t+YhHksDDU++I4JzPA0rJhtlO5h4IQtZztMWivsewOej9MHJfMRGJBx3yUkOjj8OUrAE5tvrhmFa6t8Dfc7sgOfyc2Tci2JyVs/4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZLQMUvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZLQMUvj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDDhr024479
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 05:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fel58DiU53u62PDWQf0yyjSOhupfseMQSzLMoMrf6Hg=; b=HZLQMUvjxksm0kzF
	/9+x/GtcLWP6rJBlU4bAR6M+R+byICk6ggwdOa1jiP6LPPCeCYeR4XGnK1TvEGvO
	8wP6zdABQLvln2xopvdvm8ITEv8hvBlBrDmNJ7PDeBhzzM7dY3sUm9HVuy3Ojub3
	KlNh2fATU8bUqoSjh/MA6hueKoPJJAZGY6T5KOHBU5XBUXkNVm6FibK8VMZEsSpz
	Qsrilr+9cU06+r8NOiWyoLrJLpNZs4z+it7sDsNG4/Ijv0okz4Uj0QKhfGLAUgpX
	arrR2VeQ7GNuGM5DiZSYBX5v0ygXOkZLsTIVUiCCAIK1CqvqNbtnCCc7pHfthCIG
	pR3uGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpdj4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 05:42:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab758aaaf3so80980241cf.2
        for <mhi@lists.linux.dev>; Tue, 15 Jul 2025 22:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752644545; x=1753249345;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fel58DiU53u62PDWQf0yyjSOhupfseMQSzLMoMrf6Hg=;
        b=eg/vpF1xqTcSZtW2ucBZabtkg8ZwqObKdwmwofF++QopG8WNfB7gMUMJCz5zpN0Lcb
         g+0n9fluu+cUZXCfWzJx1bs/uVB+xQi5bGF31gLHOLgZgdSRgZL28mdmtHnhEEO4cQYQ
         uTmJn93TLBS1aReQ2w8B8K4HLoftcHj9+cP/wq2vfrfmdQrefy0SS+2E03a3BC5B8WsQ
         2/FRHIb3rDQ4Myq2ux3k1T9EINqRi0BDvmWIr9T/DmokYxjIiwXySUIGAMom+Ve0vA4j
         MkPv6UiRGgZ42R2eeg/POAos4VG8zljqSCUnGbZSAiB9y97RP4YGzxlgKOymR4zT/L1L
         QWiw==
X-Gm-Message-State: AOJu0YxrYrk0sVcsim3Lwvgrr+aXA+mYfOJ9PgUnctrcn0f+xPLxfOA4
	fRk0F4e4bgtXeiMSV1Otqgj0uqQL5gHqRFSo1NwKVmlB3x9wEZcR2+rv8my2Fr6GVKK8Tex4xqu
	mUik/EuQ8NjVRQsjJNcwIaYxd90yh7IvdHyFmYom30NYvIqr6UHmYfuw=
X-Gm-Gg: ASbGnctTZW9clSuUVjVFnARGg4XID/l52/5Rj+yXk/0tyYxJf3Oazd8bPDe2mNEWBbQ
	F6W0Ct634ebMhinYnlQINnN2deEoCg8hodR5cf1LRvaijKfzQ0vzQ9HDcXejAt6tfAu5rVo2RwL
	QovJ331je35YEeF8PjsQNDjeV3fDd9M5aLUYZEFSZDe4hCbhsxp6fdSkWGdE/JPbxCMwCUO4wgf
	3extuSoeuDfWkvJr2F/7lv1cG2gYqATUtEP/IwsvmXssUkVs3DpL+MuUgvfvSOuhFC1CWjumYfi
	jh25Xc4x5IlYoIcy7aHoBS6KQDu5N+WCbsttvqS0C5kxdlWZu0yEixAzv9Kk8hIcSkK0gw==
X-Received: by 2002:ac8:5846:0:b0:4ab:62cc:971b with SMTP id d75a77b69052e-4ab909f69a4mr35149451cf.17.1752644544905;
        Tue, 15 Jul 2025 22:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3JE62vWEy0Kd57nuVo8vs0KR9rFmnxWCde1gqRMMqj/2wfqH1t7yA1ClSaDapY3QHD6Yi7A==
X-Received: by 2002:ac8:5846:0:b0:4ab:62cc:971b with SMTP id d75a77b69052e-4ab909f69a4mr35149211cf.17.1752644544541;
        Tue, 15 Jul 2025 22:42:24 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab82242a82sm14407081cf.35.2025.07.15.22.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 22:42:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, jeff.hugo@oss.qualcomm.com, quic_carlv@quicinc.com,
        quic_thanson@quicinc.com, Youssef Samir <quic_yabdulra@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        youssef.abdulrahman@oss.qualcomm.com
In-Reply-To: <20250714163039.3438985-1-quic_yabdulra@quicinc.com>
References: <20250714163039.3438985-1-quic_yabdulra@quicinc.com>
Subject: Re: [PATCH v2] bus: mhi: host: Detect events pointing to
 unexpected TREs
Message-Id: <175264454067.7322.11906740521696501275.b4-ty@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:12:20 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA0OSBTYWx0ZWRfXwTvlTqq8L7ew
 mNCA0oXxXdA66ug0wipURH/SsXUfxNg/lIhDam3+pL6gFFluTEpoXZ6MpQy6076X+4GR56J12e4
 lG2DvYu85a5YVuMAGsI8YgaSu2G9HUCZDu/+7WB8bsKcuIT1Ih9QHRquKneblTR6im9wl//CBn4
 6/ZuT6+BIWMQ+JxjsP+FreHXezbe9+OiOY3HNJRLQDqP6kpRTyZ+Y9YPy9mbsFlMbgjGh4NTyv0
 MekFGoouCdM7raB5SoabRzqeTkUPWlvD9ZZV0Qk0nU1/I8PjVbfXLlNlqQPD54V36gToS/06TXH
 ZiWnykyTlyuL9axtCju9YveMwA1JscdjBsMCvV8l/v0WBXwlUBKNr/e9VopHycNouonsGNMZruv
 qNf+Tv2Z52rfc8zMK3/WKq/4Tdg3SVkf7VPON8fhi8P2d3011ZK0hQqP+hyXmDyLSF2xvLqq
X-Proofpoint-GUID: rDTWkmgu8uuBwU6r-BDYBed1gnsvLkxD
X-Proofpoint-ORIG-GUID: rDTWkmgu8uuBwU6r-BDYBed1gnsvLkxD
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68773bc2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lf61EO2sYuKtChjirwMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=583 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160049


On Mon, 14 Jul 2025 18:30:39 +0200, Youssef Samir wrote:
> When a remote device sends a completion event to the host, it contains a
> pointer to the consumed TRE. The host uses this pointer to process all of
> the TREs between it and the host's local copy of the ring's read pointer.
> This works when processing completion for chained transactions, but can
> lead to nasty results if the device sends an event for a single-element
> transaction with a read pointer that is multiple elements ahead of the
> host's read pointer.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: Detect events pointing to unexpected TREs
      commit: 0bfe192d90fea2c1b523868a9c110d176a2be741

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

