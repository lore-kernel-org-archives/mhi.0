Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6438E11C
	for <mhi@lists.linux.dev>; Thu, 26 Feb 2026 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090425; cv=none; b=qfuU3zGPGseYKWtuVBlN74hXXD1y+Rg0GuLT4iKcQnXmqT4Y4UEvpKUAVERpaoQyhLPZnEOYZFx7zDG6g0/8RUIUwVEUoIdoeWIm4TtHDM/Qdirdigf6TuQoH8vzlEX/vkBU4aBzlwpiNn3dVbzgA8OXsyDFlXq8hXNqpg7GJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090425; c=relaxed/simple;
	bh=NX1q0YIwIDIBod4zBMuz6cN7+56ua5lfz/lw6/gneYM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AAlGAgzW+r/wAjXcjEuliYDl3FalnQAXkfBLslKwqdev0+WEWURUhrY39g0rMG4pJwIfr2Q9XZmirkjTUYAvimJbcrGHvvCH0YU8ZsAh8jFEgl+4ubXuzpRiNW5IbCFYFMWq/8kNFwvsJ1YqTzPIQc9iP4CtEXX0WkhKEdgAr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTFWwLnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBEad2c4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTFWwLnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBEad2c4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VRwI576511
	for <mhi@lists.linux.dev>; Thu, 26 Feb 2026 07:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uLoU54AaeC8QyX1TAF9QPbqh4JmXg8/ZE3JffoY4dU4=; b=mTFWwLnc5U+i6NVO
	M6O2v+0OnfAQ0pPDnIxu4PzA0fx4HefohDnQA+Y1jJOGeHmdjYvYkAvTeYhqZtH4
	I2CcBMzOw+6hn2NOtnYIIamreKQ4fbBbp3vj7UYVdbvU7DOSiVWpH5ArQmxBP+G1
	QwyofrdbBG/tGhpJQuh6AaT2VcoFtRIVR+ccI1fUm4lA4Bs9gz1kZ4vGPyKYci4e
	/tmQWwPWprrEzzhzezH4diezo/nK87ns2sHNZgIs2Uhxj2h6cnKUVL8aAKG1In9O
	6zluPc0smlvHXypr8AB+0YUQJwOx+wEd6H6kRu5GWCioxH41B8MO4lPdieZdJWOA
	3SRO5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350jnaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 26 Feb 2026 07:20:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358f8b01604so1688085a91.3
        for <mhi@lists.linux.dev>; Wed, 25 Feb 2026 23:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772090423; x=1772695223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLoU54AaeC8QyX1TAF9QPbqh4JmXg8/ZE3JffoY4dU4=;
        b=cBEad2c4LMNH4mMnXfJEW5rKxbQsrIVumglPovbaAOg4FXU4y8HIwkjN3nyinBFPoe
         pVAwY38qVbjIrwgnKoez/9OrO3UdpfItmy5+/h4hB+n/2BfvEYNQNEsWO856Pe9QyWA9
         dNM9uJ+7TsYdHZn2bxc/ycdcNHWx7G+rYfo7MCDRE9gp9RgyVU8VOz9LXII3XDiWvWII
         R5kfEIU4KZhlxFtjmziA+U/rlYgLjPZ2l5BsosXXwlEqFRRwKQ53CXLGfFSUB/wLZTh/
         Ls6Vjeoe+bjz4l7l023X1yJ5ciRF76yxiiKvOAJQWfnaqd+//fjDdMBdD4a28oC9idSL
         N1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090423; x=1772695223;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLoU54AaeC8QyX1TAF9QPbqh4JmXg8/ZE3JffoY4dU4=;
        b=Uy0YjjVLmBAf4b9uZTO59xCDqjLcwmb1nl9+JPrJiT3rmbPgQGHkmCP/f37Cq6SDl8
         HMKKZI4yp02W+D1becewrQllHz6jTGyUOeOxRLfCGlauBpzMb8sNebcs40auEqScZKom
         opErWyPu9NX+f6VERThradSmjloQCq1LB8Yg+OhlcG9vi2HAwWAP3P+Uw85mRR3O740e
         wi7oa/V7n8GwIbAl5f6U8TvjcKGWtDvma957+9skEyf53TPksFfzKu8qbCxGwGDyTFfN
         u7QSZEDipwXm4WIudhmYHcpikOXtqR0eiWOorHU33K4nGk/OtYShU3Zl+/9sDXoyRwHb
         39NA==
X-Forwarded-Encrypted: i=1; AJvYcCXnLps+1wQKjDzyGw7j/GRB8CjivsqB0TSlqhcuz+uvYNSNoA7ZjrCQgKrMiWd3SyScLic=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZISDdoJKDFkmYaIthlhkQyBfEt9Dzz46pXdjmfCDgkU4ZVDFW
	EC2Ac4N/W/zWcBn8FURUGP9VZ3SezEb24DBIaqptBRd5FpgQJu5jtpLA1FzP9Wadfi06GMePJcy
	xzrqmYxoNBkzBkCU5QWMhelCdSX9pPdE6XMrPDQmVPl1msFv/HN2XsW0qXMDP2Ck=
X-Gm-Gg: ATEYQzwBdoN5LhNTSsaov5thulXGbGuXfVhDvWQn8F824ty8o4taBWaWL2xV4dWEMFZ
	4cVdne21dNNivhNYcCvjMtuwNV7B+3WfLpQ1eQvN2LIJzyAvD1b5Ir3hOQg57CnhYK3Dc0flgct
	6sHf/JyZjoZGzZbQq4V+miybNi4M/yZFgZgc0VUPdRWAtRs+K2T74avSbt7+mSaPpChoBDNspOh
	+CS14prNdRpakegsJxsSTivOn9En2fn+kFqjKeEs87zxdeZSzCoO/Mc2zGisiWIBiu7jwLon0DQ
	Be3437ARmyA+MUKROHIqiCh6h7DEEPBiMZTGWybhWBD2KW3hh4yX/9EYiTPVUkBBFjTZWoFxZJ0
	cpCVRfUFHy/MklhicRiQ0F+I=
X-Received: by 2002:a17:90a:c2cf:b0:356:1edc:b6e with SMTP id 98e67ed59e1d1-35928a6c00amr2606811a91.8.1772090422585;
        Wed, 25 Feb 2026 23:20:22 -0800 (PST)
X-Received: by 2002:a17:90a:c2cf:b0:356:1edc:b6e with SMTP id 98e67ed59e1d1-35928a6c00amr2606784a91.8.1772090421872;
        Wed, 25 Feb 2026 23:20:21 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:8fe5:3076:521d:50c0:367d:1d7b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm1099694a91.8.2026.02.25.23.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:20:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: kwilczynski@kernel.org, Daniel Hodges <git@danielhodges.dev>
Cc: kishon@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260206200529.10784-1-git@danielhodges.dev>
References: <20260206200529.10784-1-git@danielhodges.dev>
Subject: Re: [PATCH] PCI: epf-mhi: return 0 on success instead of positive
 jiffies
Message-Id: <177209041798.86372.5318911333192648470.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 12:50:17 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Q9ZcZaWvnQ-XpcXGFZzBbm7QyRsjAM0g
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699ff437 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=kPnkl4ryUGSNtqIeIPIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2NCBTYWx0ZWRfX6VIwBM50MoI3
 Kr/iFHozj/FZv54eTu4KVICtaRwL4WhCDUemsQCrlDso8l1Zk+BJUP+JUG4kybfRWlKLrVYjoFJ
 2pnrDujG4c9nQunnwynUdvvj1U2ieTtMtlGlnc9OkMQhEJ366o9s4R7q3zHh6up5mcX31ExRzGo
 tFzFIEBcoVrWy1RCP2ngsu+JLgI8BEHK2Idq6E/b+TqnFxrh2/e0PZn4akiGSchbK6XttGtiedx
 oMYYw4eFzHX0Bf/y635+76zqjKw2kiOlZwn6JiInxW3EpeB0q9RBuGtPlIk89pSuEZfwanJOjdA
 EmcETqcOWe4qx/avywClrZWON08R2RdZX8ARewBImTIxBrmBPNsmXmx54D/pwqqd7jP0IVy2BqJ
 reegD+TzXYp7E8Gu/uasc/9jHck9FIJ/YOks7PhDCeSQCbouPszkuF1Gk2Jl0xhSfRNQaQ+SYDm
 sJJkS4jn0nXhYQfnIAw==
X-Proofpoint-ORIG-GUID: Q9ZcZaWvnQ-XpcXGFZzBbm7QyRsjAM0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260064


On Fri, 06 Feb 2026 15:05:29 -0500, Daniel Hodges wrote:
> wait_for_completion_timeout() returns the number of jiffies remaining
> on success (positive value) or 0 on timeout. The pci_epf_mhi_edma_read()
> and pci_epf_mhi_edma_write() functions use the return value directly as
> their own return value, only converting timeout (0) to -ETIMEDOUT.
> 
> On success, they return the positive jiffies value. The callers in
> drivers/bus/mhi/ep/ring.c check for errors with "if (ret < 0)" for
> read_sync and "if (ret)" for write_sync. This causes write_sync success
> cases to be incorrectly treated as errors since the positive jiffies
> value is non-zero.
> 
> [...]

Applied, thanks!

[1/1] PCI: epf-mhi: return 0 on success instead of positive jiffies
      commit: f6797680fe312ae6d32a773eb4d33400f24555c2

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

