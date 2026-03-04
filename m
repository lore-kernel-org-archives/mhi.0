Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40F386C36
	for <mhi@lists.linux.dev>; Wed,  4 Mar 2026 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615118; cv=pass; b=FKQQ2x590TIqGMmaf63KxYrJ9GIdeT9ub0SlJVjW13A+MuvKjD48C0PMzBYWERat610eB1tbA/hzs82bW4vVTGaqPikt7a8q78FaDXjq+y0mrLpu4dlI/Dpz9el/iitBHFUDpPZvx2nn+DN9Hyve5agunFKPK/fcAldbBMTWPps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615118; c=relaxed/simple;
	bh=FKLPownS4as4Rxizmq6wK7Bz0LkGYz79WGXPKG34n58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnLGnXTuPiLgftDJNzbqI+6e+0rMntO7SsNb2zY6hfSvg0bYxPblmL5adOjwgGS0DqrVFz8MCGawyz3pjDJG6f91U+8B6TwvbC+XXZXq7eFvREN62zmb3bHXhL1jT7t2VElW0wCx+EGdDuELA/s6vnmBvcc9i3eyoCSjrBsnRfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awZOxuVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYkgFjtl; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awZOxuVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYkgFjtl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SKu12274961
	for <mhi@lists.linux.dev>; Wed, 4 Mar 2026 09:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=; b=awZOxuVNTvwZ2+av
	WPZlYoD53H5UyBDyiduxLMCXEcxjGmx5GoNpk1jU6aqt1G5kK3OrObXSXVVRzNte
	NOvxmwY39p2J7rOHaRj2/YYL4uy2Vlc74lnjFhfZ6qxVpP10jhmRJp6fA7mHq1Lj
	UZKYNFdbs9xLSI/lFPJCmgtVW0EqLgdJ9FeAQvwNKQB+9oZA9nHRYMoOVKXCfdAx
	Oilktxm5mYA6T1VApB4flJac9/Z3we3bnbuX49UsNQiO6yMkpw5RZ0vjHnfgoUVF
	3cDFYOSsZU5AJOzyCvUqVYv8CImCnGgVDrubkg725Z93ga8bmbchh3opmOZgZ+6e
	/1mspA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4ms66h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 04 Mar 2026 09:05:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899eacb58a5so354686446d6.1
        for <mhi@lists.linux.dev>; Wed, 04 Mar 2026 01:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772615115; cv=none;
        d=google.com; s=arc-20240605;
        b=WKkDDjFNrG1XqAGF1vY8jr/P0xrQJjeFpxuDC+9N/LH57EfRizD8EgUj6JjUJv8x7z
         HGgN7LExRLUd/jCrniWBwJ2fJNOrw3gM0FGFIw9QvI/gP6JWjTYya403SXDCvfrIej11
         VGqxDERIrFH9wdjghPAcJoPedFDbnd01tQyENV08JE/n8neV3DgevBShYARqndhZxKsF
         2bfCNjjvkYDR6URSpyeiNLDClDWMxz91LyHaokGueBA8+i4hKok8FBu+KSwmvaBrWPdS
         i50/sVEdvQ5dxNhO5K2B+1/BjPaKtUg860492+1+jGvfw8O/7Yh9zKn0j5RQX47/P0lU
         MBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        fh=b1yKIegNzItQqThM1eSZJCdCAK+zHpYVnawnuE2FQVo=;
        b=gF15xCgeY27Mk6G1enRlG2K0I81Uj8JJnoNzftPyHurxC72pC5Edaatgzur5zQIyv7
         20D12zVE0ec8+RplS4UUAhTFJa6abX1g/fD2+pDtAGVV7xnfFdIfRuCMep8XHGsTU2Q1
         A3CnImgaSMkbbg/r7aWH955oR/ZFxnlkQCip3sOzhdbooRvTSYidMSDu3Nb2Jsrej4K0
         SXscWDGm4SBF0K7Y+FSBYB4yFI957nOdjvLJKGthrioThk0Xo+N0DFY7DuCZr8CElclK
         PILdKeKFjrgiHJeuQekne1nWfTQFj3c7INgPYSvobrrDZVW0HEFDTRcUw6LQjgEr9aoR
         auxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615115; x=1773219915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        b=YYkgFjtll+LuKrLQE5JguM5im3D7ZLwIjwJhe8LuGv+gs3Ri0SvJa7C/MGUzlLVKSw
         uDSC1NUWymrgb3WHUDVFjkHZ5xBN0jdd6sZRIWUyhyiAkoTm8yhhO5cvUnbzRx/0w1iR
         1A4UTDSyG1Mc6YN47toqX10CWq15xLbEO0g2K+yoWrkkI/F05jeehhkACUW/tI57w6y6
         MpxrDfVIwW4UO+oPQIuP7V6DLanPZ4ZZ0BaZsC90i8IdOvrTkJ+YUmZTVrsMHP8SPTIW
         bL/sr5LNxOf7lzpLvVvMtimazV29K+9aLw1mTywBlV2XhE0NB/CxiU8bs7MR7MO7wA+v
         nmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615115; x=1773219915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3ktBi77zfr9Ur64Nq/nwGV7YZKe3x1luI3+JOAKuMc=;
        b=m+39Y6CianvjZZHMtEZrn20+1cNIx2iBY5FFCuwKBrmTXsbd7nK6ejslmhJ4PbvXF/
         HQD6g9EO0o5CAtF2T/jX+vyQwuox3WkqZMWn51AoUz7iLAWCnZs5z0fAhtvqZCPGm/G5
         ZRG2MLaHxqit93GxLH+hC5hs/tDTBQh5Qd1QbUYWUrC7DL98OCZL8JfWFXAZUkE5W160
         tvOZxMjWZLl6NBYk6fILBYCE9saYyypMn5NHsAOc91j8BpyxafNXXJxzRPfGqdybewQY
         2iUUzCm1ovgIWM3+gLNUoFnkbWXh+hrjloi2XRRwMFzuStwiIvDy0jsnJ+idmGG2BYHd
         CCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUffHsq7ZycpX9GKezEYBUz1W9z28j65mzUhDsox+HWdoaGMUdvzpR4DYbqFQmb0/vUuPQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxooXb8zqghcoID6YrLalvHNvqqrhbIMwlbQEG3GKKZs41tIOzG
	SiQugQbAcZr0AQl9CyweEeykBFC6JDvih1fIOlGYvLK0p/pk204u6avdYyYGNUjhQNBGFN0DV8k
	/b0OV884a+wJRUOORjiYEgLwZ/WhlN79sc9lg+2CN3NxtYjl7oGx3/lwYxZFSOl9UVL/jeU8Gnb
	uxSA1fjPm44WC2iY74ho4XgA1hW2vWbA==
X-Gm-Gg: ATEYQzxf5wXFnz+Y0RblAEofMthlvyv9RxM5WIBV5tnJRjcgBWCMxgHX7X+t2v8Cx6Q
	j2JPSs0LclTBWcftmIPihaNlQEyBTRo3y0EUB+KWcZeXcPl+Sy0kX2cRFiziQY13ytSd+249zag
	6naoJV+r6E7g6FlG0s7ItCd4MSv2V4sV38xEAuSJSL4t7on+bjS7gcs9MFQgu44vNMQlIJ+zo4X
	aOcZjo//nUdy7ZrS+Hz2F6jLUmf17r9k4ne8ZHR
X-Received: by 2002:ad4:5cc3:0:b0:899:fd1e:47be with SMTP id 6a1803df08f44-89a19ac3694mr14701946d6.30.1772615114891;
        Wed, 04 Mar 2026 01:05:14 -0800 (PST)
X-Received: by 2002:ad4:5cc3:0:b0:899:fd1e:47be with SMTP id
 6a1803df08f44-89a19ac3694mr14701676d6.30.1772615114437; Wed, 04 Mar 2026
 01:05:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:05:03 +0100
X-Gm-Features: AaiRm52GpPLERaXH_bo6QPLSahmWGlT4Y_NVOOLhpNvAEmeb6xiH53K9rnhnSsA
Message-ID: <CAFEp6-0ik4B20cRyid9w0f+UgibGciPof9HCWTJ=uBOPvHG35Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] char: qcom_csm_dp: Add data path driver for QDU100 device
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Pj6JXg-Vz_WFu9IPUlfv0SNim4ZGEffD
X-Proofpoint-GUID: Pj6JXg-Vz_WFu9IPUlfv0SNim4ZGEffD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2OCBTYWx0ZWRfX0Xq9ug5JgxME
 pLmF2jTqGr0B8cXvy1mjAOB4cOhFBda7MgGAlU1C8i0Fh7IZQjw0Kd+oSldVFBbiNtPb6ORwIZR
 y+Gylpde2eBvMBz96zYfFGgA4JJN1kelgC22SXgzc2jTt2mCadkxvXFd9/4S6qFUmUyCaXpWQK0
 MHcOh+giwX3aYRKRXMMMvlDjr6iyzXCjAx9kfNqFRAp+RW59/1ksdEtjUdL8bLI+/8vaORnAkvU
 EXZvlLlmzkkRiJP1iTXU7zJd2YeDWOL7Y8DOqLdfygbukHZ6tzJfZ6Xsc/n9Kpj4l6kU26rUjDw
 2tNPXqpUs+QaB/rY5Wdio0qds+RVc/grfnphxmZvVCr+4ZVcYI1h/dQDdaDqdhFa4DMqyW4IPNE
 cQ2SRtZeBNT1CGU4t0n2njeCHm++RORAetE9z0VLyplZhoQGl8mouRnZ0fOU6b0Nm4/vcMV2V57
 DD4XZ3kfqQDIxSplZJw==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7f5cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=1qH30nBXnUapzXPqwXgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040068

Hi Sivareddy,

On Thu, Dec 11, 2025 at 9:07=E2=80=AFAM Sivareddy Surasani
<sivareddy.surasani@oss.qualcomm.com> wrote:
>
> This series introduces a character device driver for the Qualcomm
> Cell Site Modem (CSM) Data Path (DP) interface to support the
> QDU100 5G distributed unit in cellular base station deployments
>
> The driver enables high-performance communication between an x86
> Layer 2 host and the Qualcomm Distributed Unit (QDU100) by

Why specifically a x86 host?

> transmitting and receiving FAPI packets over PCIe using the Modem
> Host Interface (MHI). The design targets low-latency, high-rate
> data movement suitable for real-time 5G workloads.

It most likely belongs in the WWAN subsystem. While WWAN currently
focuses on User=E2=80=91Equipment/Modem=E2=80=91type devices, there is noth=
ing
preventing us from extending the framework to support Distributed=E2=80=91U=
nit
accelerators, including defining a new device_type or other
abstractions as needed.

>
> Key features
> ------------
>  - Provide a character-based interface to userspace and register as
>    an MHI client.
>  - Implement zero-copy using shared rings and memory pools to avoid
>    data copies between user and kernel space, reducing latency and
>    increasing throughput.

We already have established mechanisms for this like dma=E2=80=91buf, udmab=
uf,
io_uring, etc.
Is there a reason we can=E2=80=99t leverage those instead of introducing so=
mething new?
Also, AFAIK, MHI is also already using rings internally for transfers,

>  - Expose ioctls for memory pool management and packet transmission.
>  - Support two DMA channels (control and data) with system
>    configuration ensuring correct channel assignment.
>  - Add SR-IOV support so QDU100 can present multiple virtual PCIe
>    functions to the host, scaling to up to 12 devices with up to 4
>    virtual functions per device.
>
> Userspace API(dp-lib)
> -------------
> The character device exposes ioctls to:
>  - create and manage memory pools and shared rings
>  - enqueue and dequeue packet buffers for TX/RX
>  - configure control vs data channel usage
> dp-lib: https://github.com/qualcomm/dp-lib

Since FAPI is a standard, could this be exposed as a new generic FAPI
interface/API?

>
> MHI
> -------
> Add support to read MHI capabilities. Initial post of MHI
> capabilities is referenced here:
> https://lore.kernel.org/all/202508181647.7mZJVOr6-lkp@intel.com/
>
> Add data path channels and event rings for QDU100 VFs. Disable
> IRQ moderation for hardware channels to improve latency.
>
> IP_HW1: Control configuration procedures over the L1 FAPI P5
> interface include initialization, termination, restart, reset,
> and error notification. These procedures transition the PHY
> layer through IDLE, CONFIGURED, and RUNNING states.

Why calling this channel IP_HW1, and not FAPI_CTRL...

>
> IP_HW2: Data path configuration procedures control DL and UL
> frame structures and transfer subframe data between L2/L3
> software and PHY. Supported procedures include subframe message
> transmission, SFN/SF synchronization, and various transport
> channel operations.

Could it be a FAPI_DATA channel?

Regards,
Loic
