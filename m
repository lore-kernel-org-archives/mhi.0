Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908B23EAB3
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041672; cv=none; b=IY4b++SVMIHgcYtmyMkA+/xB6XRfNdGbKGM9V7sMkzAdL75p+UJwuStaxnATBUYtX5ogmfD3dy1Pgfq1qzwmNCTSUVquXlK19Kya0bDdkYbH9H0kGBEj15zwXPxe5DDQJwnWbgfuSuOdRo8hOFg0Re0xW/g9GaPiF4t6MUVpG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041672; c=relaxed/simple;
	bh=UvVZ96eGgGZ7aZdP/ro0L4KqWpxNm1vDLLkOz27O/2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TW5+F/YpFqBQsiwi2cfIQTjVmMBc0Ci1ikno0lWiSPdU9JhSLC8lzmUjA0+Ba8XkTLvptle9vnokw0kZ4XnVfABo4wdyXL8Z4TBzvI0kR0kQeB0If/drHiRAuKSo0VY6+yOsiRJqOZDrkhCjgNRd2hkir6a0ORW0fhdICKvEL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tcj5i1sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JotoKrLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tcj5i1sO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JotoKrLg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YUJk4057275
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 07:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WO/7Iu4Vj+UiCe9ZLdLVp8Dioi+keWzDQdYuQnODphI=; b=Tcj5i1sO/731NiNL
	0K4F00Gn35wOCD1FfckYNPGRTsr20yQKHqxTQtXS+yyoBcA+r9alkNVawz2jIBa2
	poLY+aq4pASSZaOxMZRFxnH6yqo9u+mzoIZC+QmrqcAHcbECEn3VH7wH/F8Qr4gT
	aCHfSVpFGadsBQepw/+9nRKXvvca219O+13/I2IIZNLbaIjTRj35nEDBka0KxfCL
	pR6oF2IeNY/n44mLK5egDyXNtQGEEGp8lUw/YY04iuy8OzEhfKQAZX7EdUyXv/iU
	cFo7d6V2CLq4nXNRDpQd3cj7zUbkreSytgXkQiywZBvutM5bELSV26vrK8HRuG2S
	u9pPaw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5agvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 07:07:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba92341f38so494022b3a.0
        for <mhi@lists.linux.dev>; Wed, 17 Dec 2025 23:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766041668; x=1766646468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO/7Iu4Vj+UiCe9ZLdLVp8Dioi+keWzDQdYuQnODphI=;
        b=JotoKrLgOtamaQ2AbwcpqKo0m/kOzCDIkwCRfE1HqqOnCQRY2hATa0JfTTkbVw/yQi
         C81U6mXVNAzzpnVWh5Uk0N+u8IByLu/C4FQy2EY/YNBdBo1kti8Y9KZxujAOfSPWBsFl
         F5uvc9dT3BSVkw0JVFdpPwFxAp6STUW1QdcH99hgIqQDgv1426RqdaNWxlEuXVTE22vJ
         y8OW1uKufJ2bUmpIdUF/7Dwb7IgCOiQDVJ9uCZYRPRp8+4LGWk7r2EAwNNlfcMxDwmnn
         KakrvrtX9gZVzB5+Nh1n1mds+w9/CVEJNOfXZGMkUfp6jfCT5C8hDrwTsoedZDDN8hHB
         ctUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041668; x=1766646468;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WO/7Iu4Vj+UiCe9ZLdLVp8Dioi+keWzDQdYuQnODphI=;
        b=LGdsD3YD6Gz08hRQsv/bbBkDQSdOtyz0+VQfLKRBT5LamkYthnQQx9J9vnGVsPc2Tl
         UcxacS7kznihdJ9wVRypVhV81et+m4eEC3p+wRZtFvlgYc5Yg9VIHBaJBD1l2GHjtR5n
         IBC6vNRUOIxq05axnRNugTBqTPj+KT/lhi8Bx5u1RAEs/YlVHp2tPzfxlkc+t9/kZas8
         X+QY8lmwqGbQWIaQURjEXu9Q2D5Ty513S4qeR2j2LOu3kDy6x6l6e0cVpPutmEKJtiER
         BPlU93QSPtZPe2ZhEqIIHjgCN9anh3uf62yu4CZ420vb354t1A8OnePtb9nv0MvSVg1t
         VgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5idG20w51UrWHPHM9zfC9BjWhUnCT0gFCqZzS8irGE9j+Fu3MbdjMTDaazzYY4t6sFCw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUdTkHACfv0s/BzWzjEvgs+yXTG3JzE0eP6oyfqf+OkxSXVUEV
	dZyIs2nVo3K+9mhf9rdyzrz+XXhxI/OItvK9z9crRUoSdBaKd8Oi1STDcBSlJ9V3lCZIuWpqWE8
	OhSfc8nYntIeC8FWr0PGYsOa6R9FoglOyAlvoz6VnkjWiRai/oPnoL3g=
X-Gm-Gg: AY/fxX6+y6TXQBkHTVd1kEbpyju1DXkp1av2VrvBS8Oj41pX8o9mqusXX1JyLHc8oDk
	mlzteUsjC0830lL+OKf7fBPnAiSGkxHWmuNWsdDruXMya5yYodeWMCC7XzWnR9bOog4G2ksm7eN
	ltINxlWTgSz1km65jj/JkaiWTtOgoTrTmpgKSU+aETDCtpv7jMk5DJWewI4+B2321QwfHS18HUm
	oX5GkRaew1zfRJgS3H1BdZJUQ1+OztziQmz1W5M/Ob8y2iGt5BY+CZBLJpqNMCa91mwLGSTh5hQ
	R2WlVdXwFdoSQYFqg0B/NxaCsB7u/66+Q6LucZxo5vJVP5OgJ9UVd35MAC2WgDMfj3AbmvCuPMu
	eztARa0/qkIg=
X-Received: by 2002:a05:6a00:f03:b0:7e8:43f5:bd3a with SMTP id d2e1a72fcca58-7f6691b48f4mr18451593b3a.38.1766041668459;
        Wed, 17 Dec 2025 23:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIxc3Ba7kYqRT6O1G8e+PsY7D8Sy48R60zLnBO0db5g/v7kywvaHG0MylHhjnj2PISc5FkVA==
X-Received: by 2002:a05:6a00:f03:b0:7e8:43f5:bd3a with SMTP id d2e1a72fcca58-7f6691b48f4mr18451572b3a.38.1766041668005;
        Wed, 17 Dec 2025 23:07:48 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe1185704fsm1558626b3a.13.2025.12.17.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:07:47 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>,
        Krzysztof Wilczynski <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <20251107142835.237636-1-marco.crivellari@suse.com>
References: <20251107142835.237636-1-marco.crivellari@suse.com>
Subject: Re: [PATCH] PCI: endpoint: epf-mhi: add WQ_PERCPU to
 alloc_workqueue users
Message-Id: <176604166443.697128.8351761767000938363.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 12:37:44 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nQqJ8CmZ_kEtMhig5odQY15P_Afk7BBs
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943a845 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=_suGTTe_43wmAZudwJ8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1NiBTYWx0ZWRfXwtt9T/JX/oqm
 hzqrKXmW+L1EF1Y3X/LQsiCUBVsL0DV3q6PpXQEfxoAnyIREDCBSx/2BrqxUBdulhpHy8pYg3cO
 Bn59LsK5sn07Q8AsNqWEQ895sp1OwWJ6stENJ9W2csiHAg70QIdfpCOtl4soOF4NKow4J4Akkl3
 RolLukdLqQAAKYe37/Ms70dndnwBqvYVRebI2x97zRyYHU/2Cp4t/TL6CjxBGigAsZce0O8cfDp
 TAQ3Fox2OO+8DYrM80s2QMcqUolwsk9DBc3nSSiHwSXL7JMvbwLKsn4+XqVH5wA/753f0D+a4KA
 13zYaYy1SvmKSV+gOiSeLpv2uYqbsM5QCxWJ9pCsZiYYFU41kymeVosnFmUCyM1hXUco39Xbw5f
 mfjxCbXR/K445azC6XInOiZ2FuZd6Q==
X-Proofpoint-ORIG-GUID: nQqJ8CmZ_kEtMhig5odQY15P_Afk7BBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180056


On Fri, 07 Nov 2025 15:28:35 +0100, Marco Crivellari wrote:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] PCI: endpoint: epf-mhi: add WQ_PERCPU to alloc_workqueue users
      commit: 5c826b1540045cf5824eeca7c967cc25692afc23

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

