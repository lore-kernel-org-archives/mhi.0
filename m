Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9AE55A
	for <mhi@lists.linux.dev>; Tue, 16 Dec 2025 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873607; cv=none; b=eydYTxpXn5aJeS/0rAQFRvitHUgpPFaVsa2QaLvCvOWuNTPdzlluEGRtPylfEcAbkdoFZCKMuJObFaibJQXH5e1b89Pnv0pwtyNjELdnq75wghOv1K4mAcUY1V0fjQjUztYqH/GSkD6NJ8g4PLaa+NutdgNpmPzO/rGyX5IFAvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873607; c=relaxed/simple;
	bh=PXBQmCLE+4Vw/IXmwlisC4K5mhKqR4A3VjgxUVHLnKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mL5afaYUx3H1bIklK0am+B5uT1hpXJKTHW/nhXE6ZxuPaPi+Iv5xH8O8qxw9EEv5n84HG7H+pLqpOaDVEd33wHn6pFnjNQCsHdQ/nSYDm2V/bRxf+HxEEo7O77P4zXynuRE9Jm4vfnqpP25nTzjL6a2JWaLGP0xcNg2I9iRxPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQIlkxfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBuCS44z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQIlkxfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBuCS44z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8CxMB1204921
	for <mhi@lists.linux.dev>; Tue, 16 Dec 2025 08:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVhXmaTcq8eOGymWHRQkqv6GDRQckhpB6oYmtB0u5bE=; b=RQIlkxfy698lk6Pc
	dDYdzGMsbnVRQlCVmAGmN2vbxx+JZryX8bGe0577+cwExYUxRKtwkNO0MMRg4MQd
	VsAjG/c6t1plMiDU7cHfqq9dxrugd0Y2a0heOslKD2XXPsHO7g5nAOxOopm3CVR7
	nGpQKFUK/pfQjDFkDuKJcgbi99tey6Tt7YGY1vf/5QR3g8y7niogZkMf2i3ySdhH
	5kNotnoGGdEJIDPbGS3uoBqNV3OyBWwV1D3AC1ak0flZ8Ddw/NGa6WWR14UUFOYR
	huY7PEcFxARq0hmtwEBqp5oJ4VOWsMph+azxA2lNhEC7rdFcsPymIvOZfyL9DoOK
	yMOV4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2pdajw63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 16 Dec 2025 08:26:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so3843325a12.0
        for <mhi@lists.linux.dev>; Tue, 16 Dec 2025 00:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765873604; x=1766478404; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BVhXmaTcq8eOGymWHRQkqv6GDRQckhpB6oYmtB0u5bE=;
        b=QBuCS44z9Rp/2mZGvQcKL0Srh+9wg5H3+simxYE6rnRc6P7Iter0NJGCBq1sjc275+
         2J/Bh8/IJS6jRSPpvG5Nm5ZP2QgNTKEBzukMlM3aBLO725Q9AqcFZgsK0wIiEZ0t6sqY
         HyCSDcvfuH/xjSxQh0MWsSxv+uBFLhFCndLg+eB1Iq14wyCJPYcYsgRJcrJEQ5DqHiW/
         GidGjCx2CaRN8lApTUG+DnyuABz5sjBi3mnCEjZjpomOK35Oveo9zOVRPM8OaxTOELxG
         OOaGY8XuJAvAsLHfdqNwJNauX5y2zlUOdKHZMWP8EmEha7W5wWNrKFplMdD8zAPGTBcA
         J2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873604; x=1766478404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVhXmaTcq8eOGymWHRQkqv6GDRQckhpB6oYmtB0u5bE=;
        b=DAGhCmYZkBgS2nIp4lrmnB3LH5FX9W+sltqajlx64Qf6U3jEbQeSimsKEeMSvdi29e
         6HrmdMmzs3l/wCcnmAOcI6AQigUFijDqK1azQEiPGOqed0GtuiqoivCXJkG0P68c2mew
         1yba2pTTSVEfmJlLDKXnWfMIynejMfspDjdRaAv9NWN5k86RwM2UQwBD0O08rfZ+0+FV
         984bAxvpYO5CyJciwKlfHMFuKUiiTNFFmGV87zdNhLDNopVRPS6kqZuGpw1nvDe1niOR
         dyGqpdah9BrsoTE7qhHDRCchTes5vnPcZTFpMr16Ne3Z2nwCGYpd3vsd2avAw6Jyo62u
         6AjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDFZWApWLXEJNm29ozamQS5lcki+IWCwuAcjmmJXhdH9kdWitAAaLMqu+WHKtxkwUw9d4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsQrpjRXPNolq5tzNR6R8vTnz0qDhq4iifcfpIkqUDEJErmL/i
	6yjw+eeEECxadmszubqwwG2Xy7XFQOxISF3Rg1aSb5Q5LTZGWSFr4Tedt/AmGEX4xP5O0T+dbRG
	sVEd73C8vygAZ+K2XgoFH//HDRCdnOlNSb/XO8tnu1RH85aMz9sV1TJM=
X-Gm-Gg: AY/fxX6knmGqXiu+ELPAHPp7tm+6GMNcofstywtXQrWCtiuDL5T3gryufzq2rsK4NRR
	yllxIjNLPxZRELZf1fqz4V+XFnyQJzfE4ojklcCKG53iHmxrH5InZTfATlTj7m0l2hFG7rLzJlC
	WXgUv8BvOfqDfW6GFm7WAyuBYwreXXyTDKex3E2P9gXfRB5PR27W4jugeAyiZAIFhGCNOeSQ7AL
	lcOC/xkeavyTrhJ7V+wvXhBgXEYDrK15xqrc2Gy/YS7PArn1KCBHYosZbrEE6t7o96sGI+Fk2At
	Q1jr6TpclULICPvqnIcuoxpeafi5SjRnE5lAn5IPVQhsDv69rAbIyb7foooP9syzwMdCjrIlEHG
	kEboYI+7Ed4IBhktWVd6/d/FZtxG6RZE7AEEosa3Gv6N36xeIny/eiEX2
X-Received: by 2002:a05:7300:f144:b0:2a4:6a87:7285 with SMTP id 5a478bee46e88-2ac3014dc4fmr7801789eec.39.1765873603649;
        Tue, 16 Dec 2025 00:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH64Gft19RnIs/ziNFasAn4fmgRDq45OH1Nfzl3DQIB2wg96dl/Qv8fz6jNSWsUBVRQ5hQDRQ==
X-Received: by 2002:a05:7300:f144:b0:2a4:6a87:7285 with SMTP id 5a478bee46e88-2ac3014dc4fmr7801765eec.39.1765873603036;
        Tue, 16 Dec 2025 00:26:43 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac191ba0fesm32692837eec.3.2025.12.16.00.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:26:42 -0800 (PST)
Date: Tue, 16 Dec 2025 00:26:41 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
References: <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
X-Proofpoint-GUID: oeFp7Bq6p4KvCU6LSgvN5k_I92UuEG4q
X-Proofpoint-ORIG-GUID: oeFp7Bq6p4KvCU6LSgvN5k_I92UuEG4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2OSBTYWx0ZWRfXxFXCGzcl70Db
 nxteoAbQeGxSK4QhmaDyPEXJwu4ycjUBILkK8d5nVzXEIgIQGqj7z+ygTJ/2DjQzMBbzJE/eMHL
 5i3HtNmSckPjpe32cvgxzaVTwUFNMrkPCZ00CmrImJqtf+jEm+JQlLvKsmSqFg/HE8j1I25GwQ3
 fVIFET2fvZZ+xkRQRHeeJ4vMJoXjVWJKBSnzrN7CTNHM/gFEC5DyzRLuRLntSwIP4DrE1JlmFol
 jON2p94Ecegor8ngv1HrUUWbXXWRzPUHIRtpB+G0l0s30ikc/5fHMU0dAB9QNlxoCU6J1T1dvLq
 ub2GgpMTQwoYPda1DN+1kSRC3xRr218Gw29/ajMc1qlYMr0+D+kCri1Dp/VR3QKAkpJ8gvP/ONK
 gCa4u/qWO4k2vlGpTnhoU4/VwTzHqw==
X-Authority-Analysis: v=2.4 cv=JYqxbEKV c=1 sm=1 tr=0 ts=694117c4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ub9x4grCv_FD0cmJDCEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160069

On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > > 
> > > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > > authentication requirement.
> > > > > > > > > > > 
> > > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > > 
> > > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > > headers in a single binary:
> > > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > > 
> > > > > > > > > > > Download behavior:
> > > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > > 
> > > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > > 
> > > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > > 
> > > > > > > > > > What is standard about it?
> > > > > > > > > 
> > > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > > header and WLAN FW segment.
> > > > > > > > > 
> > > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > > tme_supported_image?
> > > > > > > > 
> > > > > > > > Just elf_image?
> > > > > > > 
> > > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > > contains elf header.
> > > > > > 
> > > > > > upload_elf_image?
> > > > > > 
> > > > > 
> > > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > used previously.
> > > > 
> > > > What kind of ELF image was used previously? Could you please explain
> > > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > 
> > > 
> > > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > that was a non-standard ELF image and the new one is going to be spec
> > > conformant.
> > >
> > Previous image format:
> > ELF header + SBL segments + WLAN FW segments
> > 
> > The TME-L supported image format:
> > First ELF header + SBL segments + Second ELF header + WLAN FW segments
> 
> What is the Second ELF header in this context? ELF files usually have
> only one header. Are we repeating the same ELF header or is some kind of
> an embedded ELF-in-ELF.

The "Second ELF header" refers to a separate, complete ELF file embedded
within the FBC image, not a duplicate header. The TME-L supported format
contains:

FBC Image Structure:
┌─────────────────────────────────────┐
│  Complete ELF File #1 (SBL)        │
│  ┌─────────────────────────────┐   │
│  │ ELF Header                  │   │ ← First ELF header
│  │ Program Headers             │   │
│  │ SBL Segments                │   │
│  └─────────────────────────────┘   │
├─────────────────────────────────────┤
│  Complete ELF File #2 (WLAN FW)    │
│  ┌─────────────────────────────┐   │
│  │ ELF Header                  │   │ ← Second ELF header
│  │ Program Headers             │   │
│  │ WLAN FW Segments            │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
> 
> > 
> > As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> 
> pointer?

The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
ELF excutable file, I can not point out a specfic sentence or phase that
tell us the previous image format is standard. But at least there is an
example we can refer to: Figure A-4. Executable File Example. And I can
also use readelf cmd to parse the image.

> 
> > is also standard elf image. But it doesn't meet the requirement of TME-L
> > because we need separate elf header for SBL and WL FW for TME-L
> > authentication.
> > 
> > So the commit message stating "Currently, the FBC image is a non-standard
> > ELF file that contains a single ELF header, followed by segments for SBL,
> > and WLAN FW" is not correct and standard_elf_image is not accurate.
> > 
> > Can we avoid saying anything about standard in commit message? Flags eg.
> > separate_elf_header and tme_supported_image are more accurate.
> 
> Please define, what is the supported image.

The supported image refers to an image format that TME-L can authenticate.
Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
first 512KB of fbc image) is loaded over BHIe and also authenticated by
TME-L.

- Qiang Yu
> 
> > 
> > - Qiang Yu
> 
> -- 
> With best wishes
> Dmitry
