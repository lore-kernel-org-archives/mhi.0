Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0EC32D0E9
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399057; cv=none; b=LLhmZZmpWA34K7yYMI5lRR8mRrvfK54UwM/lygs5Wl3r4qHhJl/3+5dGB1QdvhMKk9HdwYQHNRREyMarTmeBxMDZkNtg2sU+8nqhvRDEjy65O1Q1cmUEHrUmjsj0BueLDJLSvBO+gCdqzdCCeoyLWTqvGLX+6IuDQ1SaS03y9pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399057; c=relaxed/simple;
	bh=P7fzJmkjrpSoJDKcGm+VL6Xar3467GVagtQPqP0gGY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAuCz5o3cZu2OM6TB6ocIkakdAcSBACxd2xECujphKpL1QNmwY9Rbtf+JQUbSIjODDp7ePwLtHwDpP+PSu3eK1TBoqX/OaqAZ5rtqYL91moAhEe09kfvCZJwDCiDjN+o6+p8yorwBi+6jocJ45ytQXaOgneuQiNv4j3YSgaHQcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ewvoo+Nd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tj9IDsS3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ewvoo+Nd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tj9IDsS3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8wLqL3962745
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xeEZwDnw7atfGOKbx+OCznKp8FjLpoJpEKgjRVwZLJk=; b=Ewvoo+NdD43wSq+v
	vJEQjLsamti5sY/s8GCcW5OBeWYMY0+S9As6ih3+gs4ANf/poVDdIo/BiWOnQbvj
	gBM/TnXSXoQGwdPsd6Jt/Lxe5KwR52F5dzWpGm3VxTDFFWu5bvfKwxOjFRy+K3cX
	iPlxuzdQMMCw2Td94IbyMg0Cz1Y1YaoVFWpwlBx6AWdjHgl5UYB19ikv8L889zsJ
	13Kr/gsS2vUmiah6nDBywF5uTdznKkfUCARSw/ct5LxkxFZzLm+z71lEmcw8217W
	58ZlgiMqH8rvcJLNaSFyPhzWtrgPvtOvmR4p2rtSXtoFZbeR5Bkf8u0k9yDzkqFJ
	ed4egg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hcwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 10:24:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34abec8855aso8190716a91.0
        for <mhi@lists.linux.dev>; Mon, 22 Dec 2025 02:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399054; x=1767003854; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xeEZwDnw7atfGOKbx+OCznKp8FjLpoJpEKgjRVwZLJk=;
        b=Tj9IDsS3w1HjS7PsqVsFHPH6DFUiYzHd6KUr3cpu+A3PfHqysZB53PCJtioaw5eQdk
         m3ktYzhwbw9+OfDc3orC964Xy4Q3eracjBgEELI/4jRV2/YwZkTIJ2ME+QU0plevS2IG
         F4mYbhqSlpCSmDroIyWgJjyOHQHUdOyYJGR6P8BVohkc8eddgMkn/JefbJjHjIu5fvsF
         TuVIXNBd/bjxg5I3xdL011g+0BApU0QRCplbGOm1LlvxB358tzsfxbgdc9rwYV2ZRglV
         Nk93Aa9oK6cgBqXITZeJNRU8jXSOLe1c2Nz8oLvf1jfp7DgRI9i6xi42vL8FPShxCpyg
         ZwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399054; x=1767003854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeEZwDnw7atfGOKbx+OCznKp8FjLpoJpEKgjRVwZLJk=;
        b=J9cLi/dinm+rGj2Sy1CfUo8hOl/zdbEqeRKQpTcUn59Sobkb0j7gBuSv7QIEycTUQB
         J84lsfDQals+USO5PTSRD8CsojA3uew9M9SXTdLGGycjcMDD2bjVSNxexuTSpnBnnT4k
         6ZSH/Zhu5x/8OrNSOUOGmHbO7M2U7DhcX6/9/9vQUFy+FqjKCl5m9Z9Ci3RVSQZgkeuI
         QLEF4MeccB4gWUKNR0FXs1W91goMmg8S17PUIyNZwoKk05eUtpAZkeUWwiOqXPN4Of2v
         fvYnBVVlZLN6+PenxgM3UbL35pAT4i04lylI1c7xSnkNR+vIEzQyQvwe6M6ND4WYHY/R
         PYQw==
X-Forwarded-Encrypted: i=1; AJvYcCU+ky2ewzW/qmmndlPF5fBpoRl+DbNtCrMFX6SvLnJdFIJqazaDl2XWuf2RGEY7C3JSzus=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN0Iem3k4thN8tpCubyWjgZccjSY4BoyOS2PO0cZtcPX6O1ZRB
	iPncQjz+uq5K+ydSrBwTmXF5+ZeYUpjc/WMt4TZVzgtlXxrrdn4cH7BQtPlofAM91Qdi6qDheaO
	KoF5dk6U4sACPKnR62WLbGRKhCwgYRw/mgVRFf8p6XE5Zi7rXkka2pls=
X-Gm-Gg: AY/fxX5WpktKsNPxIDj8XwpVkJvlD2xmubO1cUzw2aGGr2aeBEOKIgClCWEndKQk0u4
	DnOhMoU0AI8Tf4KsR+kAo8D/X7bBw1i6IGNCCU9CAUubVq10VogpFZ5vuRCLuduV+nqZ6xtc9f2
	xELc6uc5q/Y8ER+kLhEzvmwlyGOJkANXimAyAf/RTLo8GRFmLKrs5ATAZEnhWemjrtN5TWR9sS7
	vZlU5sPCzKLL7UR6uBnrzvuPVcdeaB0824SPtg6gwztfmc05wqOE2A0cELccnJ8vb0vy6DpsktE
	eiUFBdtFih1zv50Pop8pK2hoBkTOV+UDmkjaB/6XqeLQLvjjsZEzBHEZbE/5mk1UcvCbc3UkNKC
	vl+SjtEiHfbBxfcxKH42r4NHhYLJtVxkTV7e58Wtyh81BNRsNChY9k4JH
X-Received: by 2002:a05:7022:1e01:b0:11a:5ee1:fd8a with SMTP id a92af1059eb24-121722ab372mr11062920c88.13.1766399053595;
        Mon, 22 Dec 2025 02:24:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMSxmCcex4BP8nXFtMVL5NYz6gN8+8J/vzTwizxbvpRFODsvk6Tndhx5PZu/4E6mcQsIy2Vw==
X-Received: by 2002:a05:7022:1e01:b0:11a:5ee1:fd8a with SMTP id a92af1059eb24-121722ab372mr11062902c88.13.1766399052931;
        Mon, 22 Dec 2025 02:24:12 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm32322852c88.10.2025.12.22.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:24:12 -0800 (PST)
Date: Mon, 22 Dec 2025 02:24:10 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUkcSt2egvtqlkVl@hu-qianyu-lv.qualcomm.com>
References: <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
 <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
 <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
 <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>
 <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
 <aUP1TOq09gzmUGai@hu-qianyu-lv.qualcomm.com>
 <u5scdkfwygizo4rsuuciwsygkgl5danzsobbpytz7recuekfz4@yclft32plmoc>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <u5scdkfwygizo4rsuuciwsygkgl5danzsobbpytz7recuekfz4@yclft32plmoc>
X-Proofpoint-ORIG-GUID: AGNLBJKYcweSuXmKMb2qhdysvrmLhttj
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491c4e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3TnoLpZVvZfk0X9rOLYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX9rLk2pQTGwrK
 MDv4mTRpMHUp936Ad/RgX8ueLw8/6FwCd35lmTv9dzOngpiUIw5ctjTxgVudgHl0bGqMmWCBM3j
 jqyU3aQP+gtX2fJ7zClX13PibuX9O4MIKnQeUB2Elef07ja3uk5grm1fffcBGzzXBdqwIkedoJm
 h8Z7l0LHFimobQV80oPYxs3pZ/Ies1T8+F46e+LH7Frb6Qw2xGvCH4Ea0JoeUil3LKS/iH7u8az
 u5/erGUqSLpgIGV/XLJyq2v2NNHFaHaSEQxqKoxNk+rTVK4RNuPqHejMQCyIblB8Rbe6VwwqYhZ
 g0RIyAWFx2SX8d9zsnY2VCdPCXVI40OilDeU+j6dK0vLvWQH6eV6VEwowaPxSkPnKe0qGtbMBYq
 wWXvTLsr/TXNJ/S5UbUsXjzYA042ub2ox0A1dx1rNAKfOF785ppuJL9inA42RLC6PT3CgdCwNqh
 Q3WgYIBbw+ELP6lJuog==
X-Proofpoint-GUID: AGNLBJKYcweSuXmKMb2qhdysvrmLhttj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094

On Thu, Dec 18, 2025 at 06:12:37PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Dec 18, 2025 at 04:36:28AM -0800, Qiang Yu wrote:
> > On Thu, Dec 18, 2025 at 04:51:18PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Dec 18, 2025 at 05:21:54PM +0800, Baochen Qiang wrote:
> > > > 
> > > > 
> > > > On 12/18/2025 5:13 PM, Baochen Qiang wrote:
> > > > > 
> > > > > 
> > > > > On 12/18/2025 4:04 PM, Qiang Yu wrote:
> > > > >> On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
> > > > >>> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > > > >>>> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > > >>>>>> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > >>>>>>> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>> On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > >>>>>>>>> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>>>> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > >>>>>>>>>>> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>>>>>> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > >>>>>>>>>>>>> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > >>>>>>>>>>>>>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > >>>>>>>>>>>>>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Currently, the FBC image is a non-standard ELF file that contains a single
> > > > >>>>>>>>>>>>>>> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > >>>>>>>>>>>>>>> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > >>>>>>>>>>>>>>> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > >>>>>>>>>>>>>>> authentication requirement.
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Current image format contains two sections in a single binary:
> > > > >>>>>>>>>>>>>>> - First 512KB: ELF header + SBL segments
> > > > >>>>>>>>>>>>>>> - Remaining: WLAN FW segments
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> The TME-L supported image format contains two sections with two elf
> > > > >>>>>>>>>>>>>>> headers in a single binary:
> > > > >>>>>>>>>>>>>>> - First 512KB: First ELF header + SBL segments
> > > > >>>>>>>>>>>>>>> - Remaining: Second ELF header + WLAN FW segments
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Download behavior:
> > > > >>>>>>>>>>>>>>> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > >>>>>>>>>>>>>>>           2. Full image via BHIe
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > >>>>>>>>>>>>>>>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > >>>>>>>>>>>>>>> supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > >>>>>>>>>>>>>>> download over BHIe as it is loaded in BHI phase.
> > > > >>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>> What is standard about it?
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> The TME-L requires standard elf image format which includes single EFL
> > > > >>>>>>>>>>>>> header and WLAN FW segment.
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> The "standard_elf_image" seems misleading. Since the new image format is
> > > > >>>>>>>>>>>>> required for TME-L image authentication, how about using 
> > > > >>>>>>>>>>>>> tme_supported_image?
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> Just elf_image?
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> Is it too generic for this specific use case. Current image format also
> > > > >>>>>>>>>>> contains elf header.
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> upload_elf_image?
> > > > >>>>>>>>>>
> > > > >>>>>>>>>
> > > > >>>>>>>>> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > >>>>>>>>> defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > >>>>>>>>> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > >>>>>>>>> used previously.
> > > > >>>>>>>>
> > > > >>>>>>>> What kind of ELF image was used previously? Could you please explain
> > > > >>>>>>>> what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > >>>>>>>>
> > > > >>>>>>>
> > > > >>>>>>> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > >>>>>>> that was a non-standard ELF image and the new one is going to be spec
> > > > >>>>>>> conformant.
> > > > >>>>>>>
> > > > >>>>>> Previous image format:
> > > > >>>>>> ELF header + SBL segments + WLAN FW segments
> > > > >>>>>>
> > > > >>>>>> The TME-L supported image format:
> > > > >>>>>> First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > > > >>>>>
> > > > >>>>> What is the Second ELF header in this context? ELF files usually have
> > > > >>>>> only one header. Are we repeating the same ELF header or is some kind of
> > > > >>>>> an embedded ELF-in-ELF.
> > > > >>>>
> > > > >>>> The "Second ELF header" refers to a separate, complete ELF file embedded
> > > > >>>> within the FBC image, not a duplicate header. The TME-L supported format
> > > > >>>> contains:
> > > > >>>>
> > > > >>>> FBC Image Structure:
> > > > >>>> ┌─────────────────────────────────────┐
> > > > >>>> │  Complete ELF File #1 (SBL)        │
> > > > >>>> │  ┌─────────────────────────────┐   │
> > > > >>>> │  │ ELF Header                  │   │ ← First ELF header
> > > > >>>> │  │ Program Headers             │   │
> > > > >>>> │  │ SBL Segments                │   │
> > > > >>>> │  └─────────────────────────────┘   │
> > > > >>>> ├─────────────────────────────────────┤
> > > > >>>> │  Complete ELF File #2 (WLAN FW)    │
> > > > >>>> │  ┌─────────────────────────────┐   │
> > > > >>>> │  │ ELF Header                  │   │ ← Second ELF header
> > > > >>>> │  │ Program Headers             │   │
> > > > >>>> │  │ WLAN FW Segments            │   │
> > > > >>>> │  └─────────────────────────────┘   │
> > > > >>>> └─────────────────────────────────────┘
> > > > >>>>>
> > > > >>>>>>
> > > > >>>>>> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > > > >>>>>
> > > > >>>>> pointer?
> > > > >>>>
> > > > >>>> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > > > >>>> ELF excutable file, I can not point out a specfic sentence or phase that
> > > > >>>> tell us the previous image format is standard. But at least there is an
> > > > >>>> example we can refer to: Figure A-4. Executable File Example. And I can
> > > > >>>> also use readelf cmd to parse the image.
> > > > >>>>
> > > > >>>>>
> > > > >>>>>> is also standard elf image. But it doesn't meet the requirement of TME-L
> > > > >>>>>> because we need separate elf header for SBL and WL FW for TME-L
> > > > >>>>>> authentication.
> > > > >>>>>>
> > > > >>>>>> So the commit message stating "Currently, the FBC image is a non-standard
> > > > >>>>>> ELF file that contains a single ELF header, followed by segments for SBL,
> > > > >>>>>> and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > > >>>>>>
> > > > >>>>>> Can we avoid saying anything about standard in commit message? Flags eg.
> > > > >>>>>> separate_elf_header and tme_supported_image are more accurate.
> > > > >>>>>
> > > > >>>>> Please define, what is the supported image.
> > > > >>>>
> > > > >>>> The supported image refers to an image format that TME-L can authenticate.
> > > > >>>> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > > > >>>> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > > > >>>> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > > > >>>> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > > > >>>> TME-L.
> > > > >>>>
> > > > >>>
> > > > >>> So what makes it different here is that you are now sending the two FWs
> > > > >>> separately as standalone ELF image to the device for authentication by TME-L,
> > > > >>> but those are combined in a single image file in the host. But what makes you to
> > > > >>> combine two images in the first place? Why can't they be separate ELF files?
> > > > >>>
> > > > >>> I think you can avoid the hassle if you could just have separate ELF images for
> > > > >>> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
> > > > >>>
> > > > >> Yes, they are two separate images combined into a single file. I'm not
> > > > >> sure of the specific reasons for this design choice, so I can't comment
> > > > >> on it. The WLAN team provides a single file for both SBL and WLAN FW, and
> > > > >> I don't know whether they're willing to change.
> > > > >>
> > > > >> Baochen, do you have any comment on this?
> > > > > 
> > > > > Hmm, sorry, no idea :(
> > > > 
> > > > I mean I don't know the reason behind the design choice.
> > > > 
> > > 
> > > Ok, then I guess we should try to get rid of the flag and just check for the
> > > WLAN FW ELF header during runtime:
> > > 
> > > 	/*
> > > 	 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> > > 	 * file. Hence, check for the existence of the second ELF header after
> > > 	 * SBL. If present, load the second image separately.
> > > 	 */
> > > 	if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> > > 		fw_data += mhi_cntrl->sbl_size
> > > 		fw_sz -= mhi_cntrl->sbl_size;
> > > 	}
> > >
> > Hmmm, for the old format image, since the data at `fw_data + mhi_cntrl->sbl_size`
> > is raw WLAN FW data, there's a possibility that the raw binary data could
> > accidentally contain the ELF magic number at that offset, even though it's
> > not actually an ELF file. This could lead to false positive detection and
> > incorrect parsing.
> > 
> 
> Really? How can the WLAN FW segment have the ELF magic at the start of the
> segment? Then it becomes a separate ELF file.

I confirmed with WLAN FW team. It is extremely rare scenario that the old
format image contains ELF magic number at offset 512KB. It is practically
not possible.

- Qiang Yu
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
