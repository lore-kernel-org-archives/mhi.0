Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223235;
	b=GNErHwaGPDy+EQscKDqRdyq5HaGHQKTQqhRd/2yoip6JwN8DnLbjvwAz3s2NAm1WOONC
	 UyVSzhDqo+9lo5g9PF1+yHllRGibdv1jwGmJXizsQv7iMosF3DBkoFvRCU2t5DPWDqMMU
	 81NZTM5bBpC966vY0zSO/6ydJwy06lkkm0Rrtnq+fROXU1tX1LsaTJ9SBDAjQ8HI61sbn
	 /exwVqP4ZiF9oCHmBhBzzbyJEkflUtFu1OrfdiSDf0vakdQfEtfPAYoQt+FSTNIAtCWKz
	 V8OTfZ58NqA5xfh3qTutw/l2p9Cr3akNrq8I6sFvxNimUyoc8SR8Jm1tky3bzOfEomQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
	b=wbMstPgQXv0NsheBNNJDuByijqO6etWJJ4Zl4ebGuuxS1dg2DupfVLsREuBgnmLk63pB
	 hWMpRjoIWYbdDTp3JuTGlwIImuqvSDfDRBJE3gXtxYgdDelDhhBQEs2neSKlgDasL/H1E
	 q5Y+UuQuE/TBGpMtdMTXeP6K4JuSI7GzMZBtTSzsshyj7+P/d5t0bP9xPG9GS3lxIjFUp
	 O3m16i/H+rcmEcs1tyv50imTfoBwvGbHrWcAFCOmMspXN7DRm3vBUp4SfnB17sJc1vXjv
	 UrG49Z+a/aGhIqH0/94ChUjBdbZzNhxBS5tCBwhCHtrxq+mAEZEluccFcWXF1dldKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KETUDgnM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+0RyHx0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0651606A31D
	for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 21:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0651606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KETUDgnM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+0RyHx0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPi5B400610
	for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 21:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=; b=KETUDgnMzsFH0FtU
	B8sB6yaUHUIBaLV94NO9tCO01n/MGxJ/4JhP1CfcPFMUi1+1blbOi5AOm/6UxYjk
	Cj7eR0dyK+a0RU3zYc2pLt2rl0QXQ/UKo1OD5kILnYqJvL0iNgOh0Iv2iGMvb2zL
	9BkCey3M2v+FZomI/+ZoMWwA0WrMXYYQ+2lVQyv0hAhr5tcuxtOztCYrClzDLzcB
	nMI4lRvV3FqaNXhumsm7SsGNoLAjT2hVSy4TXq8kOmAQ1XsHzl2jQ4T0R99Qx6km
	cYJG11myJNUBOrqsRnJcto2Iq/I+cNs60Kf6J2LC2X1jCs8EkSpCssp1oa4RUkSM
	60IzfQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnj26u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 21:33:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so4828132eec.0
        for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223233; x=1793828033; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
        b=A+0RyHx0d49Zb+otyvaWMla1pUlTiB/XJxsFLg+CTK6sGAGZbhC20bN3/sVuf9ER9h
         gBoGxRD58dm4j0KrtzxPu2HsvHPzBjorYcCmdt/A0IuHA3wE4JnZDfu6YMhqBZmce26w
         JJ+rT/1ARPp8JkvPVYRZZ1MaQ1L/rqyLPhBMsQRVAepFDUGtDOtk/AcBTZmXWwtEkGLP
         x+BcRoqbL8g8QziNCMrxQm7jW0RhXDNbEUKWJng2p0RnbWePgCy8HnvfW3QRoE5RurEU
         FBLEX3m6RRbVwx2c7bzev5p6kPJ2VJwyaAsgO8oZDEdyddbdeBt5Uj7579enIzKVX3Jk
         zmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223233; x=1793828033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96kg8hVCc1U1u1y1GTIS1aXfAI5RYyXMEb+MOQ8pCGc=;
        b=efBS66Q06l2q8ZkwP5QS44L972HGyOa616EvrBUJ3VqL2eSqvDHYmlwTF1/JwscERm
         ibd1xFuaNqtoXDm+p+zlffBtDeSebD1q7hkBQ2WOZINAPT9YfRW+iCkFbCZkt+yjPrz3
         34t0HycAJBrnPU59VLUQ8OVUWUSkS8mScMX0UyC4eQCLD2ubz8G3RVkt2U48/hJYsw9Y
         eRcbhBVO/ofzCP55t6OktWdrKzJpg4un8nDXvVEXZmUICVW4HHyXdcA8H8pVOvYNJx5c
         aqvUosWrKuEnpo1tAXE6Hx0OcazhmaP0KUK7pF0WNDticlndGdPdFofmFJcnYHSesaKZ
         FQnA==
X-Forwarded-Encrypted: i=1; AKwUvBwEyTJ+fPJ5l9dxW1EzLEXeL8vYf15nQTMFu6aMQoXoU146sR7lbYa1UHYxOmx+EGKMvWw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLcKHu/mchoU1N5aaQMyunObSLAvabsk2xg5ZG8EjvYz4djiJ9B
	Avx5g4sxevGwp8orHHD1HvdKcn0c4wcPaikiv8S27i8sJfrfGvAdzN7KXt1vUb7gdkD0en5H+cd
	zlsf/gRR17I9j0soJC6P+i/KJ6kq0y9c++6hf2BUETvvDMl0dVrPuUoc=
X-Gm-Gg: AYBFou2qxufqvtctOY10tHROFJvhu6PhDBMiLKrXoAPxFs7FjWSUGc/EMO3WU6tj3DK
	U0nVuPJMD043ZjkVt5eCnfoiTItoOpdL1zj0FXbaaGRpGpM4T4QWw4EC8jrzZlaxLIukppNJp6d
	fxJZhNzhC6rsWV5EhmZr9JF0FFepHWgpXp9vYZrg9vmzmG/7UAAXqDVMdMIwSEeuWLC5NDiufz6
	TF78CGe+3XAwqf5pcAFXGXek5+oL+GHmF4cWnLiN4q+rPYc2U3uHA3F4HL6ZokprqtxP8fT8iqH
	cYiB9GNZI7D4s27HrX5/1UuLtUyFwwqE4M5slcRu07+Hq7tbP1/SaQ308KR9vJf5TwXb/mthDDd
	G/KcwOyU05GxSFoy7NY81pCThOWLej7jUQ3IAwI2wPCBVgAxHONnzxupfYJ0BzTNxZArXmvAOd+
	Dns96bmtYw+d/uH7GbUX7W5DM=
X-Received: by 2002:a05:7300:d0a8:b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a20469b0bmr4858513eec.40.1793223233014;
        Wed, 28 Oct 2026 14:33:53 -0700 (PDT)
X-Received: by 2002:a05:7300:d0a8:b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a20469b0bmr4858476eec.40.1793223232400;
        Wed, 28 Oct 2026 14:33:52 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da675sm9672541eec.5.2026.10.28.14.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:33:51 -0700 (PDT)
Message-ID: <436a2d4e-9297-4bbf-a305-5f6913e83aaf@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:33:50 -0600
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
Subject: Re: [PATCH v2] bus: mhi: ep: cancel reset work during controller
 teardown
To: Jiale Yao <yaojiale02@163.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261021110428.4143200-1-yaojiale02@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261021110428.4143200-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qI7uQPRnvxffNE3k2UM6WL-DF57F5iGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfXxI2gYihcPh1D
 9GrK5/uSq9IeNfJ19UOYaxyYa8dgZx1UziF9H1Vdw/lvpDZZsAngTx+azjjHpbWwwD7N2wunGgI
 adovvQAXmaqvl8skCJdV93xxLfIAmAzv7+TuobSIngITujFHFRIxqbuVkZIhrppAp+Ji3xRPABk
 YvXbXYSe7OekDZgiDKguKlD8nAbS8kQI5AdlvhUC7xy7bV8tq6fi5VR/8W80cZsGd8iEz/fP5XR
 uE5jLgA5SUn/TAfK2PQ9CU2wHE+Wolxz4UlS3VGgbY4X+K9bb+TcNvQheRY/ki1IKz0n6SZ2pSm
 T0F06vHS5l0W/R5alB2fbyz70PQBMdDE7kTB0gOp54dNzZtxgqdSrsi6OVWYKr6JoTJJMhExiXO
 xjDa6q+zIvfUUdUz6qMJhrAj+5GaAuIohpS5gY9SjoNYhCnJDktuEvJvb2B2d7Ud9+1JUaD79HQ
 Rzdz/szKsouYFdU7bUg==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae26a42 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=AskSUVmIeMB2-BZEYoQA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: qI7uQPRnvxffNE3k2UM6WL-DF57F5iGE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfX0mSFuv2t1fz9
 hSaXZyVh0Uj/ZVwwwnyjuQ6LEA7U5vQnzKLqCExhR8CR1+MN0wl7wfCMtdK2lcXe+Fu+VXqXG8O
 MtGMK2U1zFCL6nPF4yJMI/OH/WzgXLo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280085

On 10/21/2026 5:04 AM, Jiale Yao wrote:
> The doorbell IRQ schedules reset_work on the system workqueue when the
> host requests an MHI reset. The controller teardown only drains the
> private MHI workqueue before releasing the controller state, so
> reset_work can still run after that state has been freed.
> 
> Cancel reset_work before destroying the private workqueue and releasing
> the controller resources. The caller is required to power down the
> controller first, so the IRQ can no longer queue the work at this point.
> 
> The issue was found by static analysis. The fix was tested with an
> out-of-tree module that registers a real mhi_ep_cntrl backed by a
> software IRQ and a fake register file. The module drives mhi_ep_irq()
> and mhi_ep_unregister_controller(), and delays the reset worker until
> after the controller state has been freed. Without this fix, KASAN
> reports a slab-use-after-free in mhi_ep_ring_init() from
> mhi_ep_reset_worker. With this fix applied, controller teardown waits
> for the reset worker and the KASAN report is no longer reproduced.
> 
> Fixes: 7a97b6b47353 ("bus: mhi: ep: Add support for handling MHI_RESET")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
