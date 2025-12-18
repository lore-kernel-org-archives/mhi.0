Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFAE21771B
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043682; cv=none; b=vBGwuXoSpxRqwnaK07fdbb5Mwt+DeChNZgoI1rl51UBEYpBp75DMrlVCSpeY+YnWfDnAKP8RhW1TsarcMCDqk2m68oFF+keG4rY0et1pm4h7w88XTtAP3le4cP3HVuSByW+xeOSn/JHO8FOfCbG8WZHHlw6ELMaPmst4KUJXtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043682; c=relaxed/simple;
	bh=83rrWFR9Cf6O0E9k5CnE8zHujsQtFN6SCAcTxwNcp5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igUeUBmSihfrdDZePjVmKp1yjhgjhgMsAKieRRwkztzXcXZ7bu8nL+ghJg9gOjkTQx7O4+jRCAAt8HR4R5XGVfblPX8sQbO/hxhphoYx4J0D5St8k+rl0XJZtRVPDNVA6ywcdRc6E32ZQ+wbR1HcjgSuDC3Rp488l//v/XqU4HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIAnhgK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHWqj27E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIAnhgK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHWqj27E"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YoRb237745
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 07:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z32ol302noWEPitFyAvFLaOEfK5bJa6lRU9gSg5dRU=; b=LIAnhgK+CnHzqWdT
	yWsb5sTREA8vfGaPH7X8t197wab2w663q74x/Xsf/YOIgkHay1ETl1n/uHbG41yj
	+eHA0U8XgoVC56v8fYi/okxnv9lOyH2UfVoKxZAsVJ+ut8LSZER7e5oiMlynBfuT
	s9sDboTDJckQ/YG5/U7qSEkofUS9X6U9ggZ9AdwBvqSKzm0izpXOrq2EBoTi3asC
	L1SNsmrT79SM8gr9UR2XPCErd/OA1fW3nyNHoxbvnhQ25rEZjfBAFLzoQkCKseB5
	idK9fmHNaexvRo4H1SWU/pFmdjL2ldCV8JXL1L/wCmV2CVpDfcp0UTO9Dvuwhk6t
	dgzOEA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3hd67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 07:41:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so823505a12.3
        for <mhi@lists.linux.dev>; Wed, 17 Dec 2025 23:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766043678; x=1766648478; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Z32ol302noWEPitFyAvFLaOEfK5bJa6lRU9gSg5dRU=;
        b=HHWqj27EOT91zo3P/4js0VkEmfYqyF2jXkFko46uwllOJ6ymnZooOUV1HwovtYdBS4
         mpVBhuPClrrOl6iEL8q84E2mYeDCHrbtMoqhcA9S/i1/L6fM9YYhyBpvxZhIJ9hrfMe+
         PoGXLvMfU8WikmnG27I0qRMmURvBvl7DF+32ciYEQvNcZGx4LOqp8anc5YcKzrFxMPUZ
         wR+nFSXx4Eg+K44736/QrpHkJYHnSHi+2B6cS9qXCfcKkiT3DFlM7LN+hqz06StUcL5h
         p4+rmVD6NANPNX1lcCOcSWLt3vJQrGo54HeSHzgzkBBrMATz39I6bS+4HS8xPfg2nSyW
         /BzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766043678; x=1766648478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z32ol302noWEPitFyAvFLaOEfK5bJa6lRU9gSg5dRU=;
        b=jPLppFqloPWYOxEUtcLUQJLEsZoZu7c2siIUXtb6G/Sy5eVp6dx5ovglrASBr9AMFg
         B2Az0I5SsrMTSMAN3I53R7A2h2TrzSZlbKobcC1UNBmqPgbQIhkSb5O9EZzoVgN1L0RB
         epn8FdZ7OItAptXEkyKV4guktsOQogwnFSKiGuFdkXfIGu0VB1rqEwy9qeFHaMYflRRh
         H4NuFF0Tu3QIwiogFkHJnjAVS1wuW98Ib0svGroh12idiuknkp9D/3RmW3t/HJ6V5VHL
         8OJzPT7KrBcOazowS0ELThkja3mxKjUeU4O6ccaVK1wHbuM3r5qKhMhJEldOnBLrvQak
         wJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVGOP9vH6Oa93loK78g+1YKwIU0f8TNF3zQR6mcIlz9KlzUPihjv1RwqQrzjI7E1jbeuno=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQUuMisr4bq14KwS/JCHlIRIxRVcpUYzZdTgdHqr7vd7m3+a+r
	dHTXRjGfTTmv/s0YzTGpcNrEHI807HrGM8f0di5F0PcCXO2jo4Dy/Dg/VZpt9VQgjaG+1UoGaTV
	TggFRPry8QI4zzKDX4pn8RyE8AeyCVQ7WbAg70SKZs31lfeDm7rpIhj4=
X-Gm-Gg: AY/fxX7DmnVWyPH8FghtVTiIxVL3hpzeg2QKctHXc42/v0iwRRhxiK2Hbo2PBSzqsS4
	InFfhpeesa5fDDN4n/TzCHN0NqxD45EBbugUbDQfbBTESRuh9Hv65D4zhJAdYArEwvHUuMGQU/D
	Yuq+NCV+On7m56lz9KJJWv27Pvxf3GFjdIkfES21J5KK2r4bhtNbPo1G7d8eHw9002c5Go3DPfU
	SQPNxto5hF+kvHajlZbqg+nPQYqR9/p2OXIh5VWS5Himbnhju8o7ddVaOM6OPbpIqq7xKKBBAPO
	wN8bBSM4bUT8vU3xdBCu0fh+w4TwdJjFmEaR9akR/Y+TbKobcVOcuQPLd2UyvpEq5GbYYPNIQuB
	cJ21O6fsKcuTkKeJvcZXc3gDqP+Ug/r9rkFv1E5vAzo3SIFIKM9JKLQXI
X-Received: by 2002:a05:7300:ce8f:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2ac32236385mr11386321eec.15.1766043678159;
        Wed, 17 Dec 2025 23:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR9XkYLTZmipnm0M2ysrIiQS9kJjYJAQIoe5aLvQ70K/SfEeW5vJGRItL3ygrv3PRGsZRVdw==
X-Received: by 2002:a05:7300:ce8f:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2ac32236385mr11386301eec.15.1766043677512;
        Wed, 17 Dec 2025 23:41:17 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d415sm2509673eec.3.2025.12.17.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:41:17 -0800 (PST)
Date: Wed, 17 Dec 2025 23:41:15 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUOwG3TJ7N6sexAb@hu-qianyu-lv.qualcomm.com>
References: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <6276nut6ro5xh2pt734k4z2z3lpxmkffjjh6wwpvwuy2lldowc@soojtr77xe4z>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6276nut6ro5xh2pt734k4z2z3lpxmkffjjh6wwpvwuy2lldowc@soojtr77xe4z>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2MSBTYWx0ZWRfX94oJrz/yUdwH
 R+6p1COSPgA2KBLJIlNdxmVq1850TW3rbzhHvx3Jqd8eRrJ/F2RXs69zpNfM4+yzI6J5yJ4Qjkk
 XB5HR80t7rIADWpCk2LnzmPB6twve+rGG4I0zVZG8tYExBvYZ3H6PV+9E6sUpJNZydXTsvNZsYC
 sfP4M4xC2zVhQEkX0r23/GDLVZAcy3lrZ758nZ/FlP9P+77O5xF3VqsyyFnD8BS/UveXbqj7vHl
 SO0NEhbvHjV1nKi8hb+pHaWjI9/mMxozjQYn7K+gUorT2Nzu6wx+/sUrWN4GlNjLySytVXOyjWR
 7w7uIWIB3Bg14jrwwfk9mUAY9GRSqX7jFNge22S704ELsLZh+tVjYO9boqNyh1EJjWX0Lla7vZi
 KBxrFvVaEFeSwJmBUg6pIEEnI6iZsA==
X-Proofpoint-GUID: A48YsCHqB-OB2oNqH6NJ23R1pynBZTDm
X-Proofpoint-ORIG-GUID: A48YsCHqB-OB2oNqH6NJ23R1pynBZTDm
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943b01f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7Jv5yrs01gcKwjDWLeYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180061

On Thu, Dec 18, 2025 at 03:12:23AM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > > On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > > On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > > > > authentication requirement.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > > > > headers in a single binary:
> > > > > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Download behavior:
> > > > > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > > > > 
> > > > > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > > > > 
> > > > > > > > > > > > What is standard about it?
> > > > > > > > > > > 
> > > > > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > > > > header and WLAN FW segment.
> > > > > > > > > > > 
> > > > > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > > > > tme_supported_image?
> > > > > > > > > > 
> > > > > > > > > > Just elf_image?
> > > > > > > > > 
> > > > > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > > > > contains elf header.
> > > > > > > > 
> > > > > > > > upload_elf_image?
> > > > > > > > 
> > > > > > > 
> > > > > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > > > used previously.
> > > > > > 
> > > > > > What kind of ELF image was used previously? Could you please explain
> > > > > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > > > 
> > > > > 
> > > > > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > > that was a non-standard ELF image and the new one is going to be spec
> > > > > conformant.
> > > > >
> > > > Previous image format:
> > > > ELF header + SBL segments + WLAN FW segments
> > > > 
> > > > The TME-L supported image format:
> > > > First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > > 
> > > What is the Second ELF header in this context? ELF files usually have
> > > only one header. Are we repeating the same ELF header or is some kind of
> > > an embedded ELF-in-ELF.
> > 
> > The "Second ELF header" refers to a separate, complete ELF file embedded
> > within the FBC image, not a duplicate header. The TME-L supported format
> > contains:
> > 
> > FBC Image Structure:
> > ┌─────────────────────────────────────┐
> > │  Complete ELF File #1 (SBL)        │
> > │  ┌─────────────────────────────┐   │
> > │  │ ELF Header                  │   │ ← First ELF header
> > │  │ Program Headers             │   │
> > │  │ SBL Segments                │   │
> > │  └─────────────────────────────┘   │
> > ├─────────────────────────────────────┤
> > │  Complete ELF File #2 (WLAN FW)    │
> > │  ┌─────────────────────────────┐   │
> > │  │ ELF Header                  │   │ ← Second ELF header
> > │  │ Program Headers             │   │
> > │  │ WLAN FW Segments            │   │
> > │  └─────────────────────────────┘   │
> > └─────────────────────────────────────┘
> 
> okay. This should have been at the beginning of the thread.
> 
> So, if I understand correclty, beforehand WLAN was a raw data and now
> it's wrapped in ELF file. If I'm correct, then this might be a
> definitive name - .raw_wlan_data or .elf_wrapped_wlan_data (up to you).
> 
> Or is it that previously you were skipping the ELF header and just
> sending the subset of the contents of the included ELF file?

In previous fbc image, SBL is also a raw data. The ELF header is for the
whole binaries including SBL + WLAN FW. So, elf_wrapped_wlan_data or
.raw_wlan_data are still not accurate. So I still prefer
tme_supported_image, or can we avoid describing the image but describe the
behavoir like skip_sbl_on_wlan_load?
> 
> 
> > > 
> > > > 
> > > > As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > > 
> > > pointer?
> > 
> > The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > ELF excutable file, I can not point out a specfic sentence or phase that
> > tell us the previous image format is standard. But at least there is an
> > example we can refer to: Figure A-4. Executable File Example. And I can
> > also use readelf cmd to parse the image.
> > 
> > > 
> > > > is also standard elf image. But it doesn't meet the requirement of TME-L
> > > > because we need separate elf header for SBL and WL FW for TME-L
> > > > authentication.
> > > > 
> > > > So the commit message stating "Currently, the FBC image is a non-standard
> > > > ELF file that contains a single ELF header, followed by segments for SBL,
> > > > and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > > 
> > > > Can we avoid saying anything about standard in commit message? Flags eg.
> > > > separate_elf_header and tme_supported_image are more accurate.
> > > 
> > > Please define, what is the supported image.
> > 
> > The supported image refers to an image format that TME-L can authenticate.
> > Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > TME-L.
> > 
> > - Qiang Yu
> > > 
> > > > 
> > > > - Qiang Yu
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
